/**
 * Model-facing read-only employment-management query tools over the Guohua MySQL
 * business database. Two tools are registered:
 *
 * - `query_employ_schema` — lists the business database's tables, or the
 *   columns and joinable relationships of one table (read from
 *   `information_schema`, cached after first use).
 * - `query_employ` — pages over any discovered table with optional filters and
 *   optional joins that follow the documented `_id` relationships (e.g.
 *   `customer_id` → `guohua_customer`, `store_id`/`base_id` → `guohua_store`).
 *
 * Safety model: the model never supplies SQL. Table and column names are
 * validated as identifiers against the discovered catalog; filter values are
 * bound as `?` placeholders (never interpolated); joins come only from the
 * curated relationship map; `multipleStatements` is off; and every statement is
 * re-asserted read-only (a single `SELECT`) before execution. No INSERT,
 * UPDATE, DELETE, or DDL can reach the database.
 * @module @deepseek-ai/dsh-employ-tools
 */

import type { Context } from '@deepseek-ai/cordis'
import z from '@deepseek-ai/schemastery'
import { defineTool } from '@deepseek-ai/dsh-tools'
import mysql, { type Pool, type QueryValues, type RowDataPacket } from 'mysql2/promise'
import { RELATIONSHIPS, type FkJoin } from './relationships.ts'

export type { FkJoin } from './relationships.ts'

export const name = 'employ-tools'

export const inject = ['tools']

export const DEFAULT_HOST = '47.93.181.192'
export const DEFAULT_PORT = 3306
export const DEFAULT_USER = 'root'
export const DEFAULT_PASSWORD = 'wfn031641'
export const DEFAULT_DATABASE = 'guohua_operate_fx_crm'
export const DEFAULT_CHARSET = 'utf8mb4'
export const DEFAULT_CONNECTION_LIMIT = 5
export const DEFAULT_QUERY_TIMEOUT_MS = 30_000
export const DEFAULT_MAX_PAGE_SIZE = 100

/** Plugin config: MySQL connection, pool sizing, and per-query bounds. */
export interface Config {
  /** MySQL host. */
  host?: string
  /** MySQL TCP port. */
  port?: number
  /** MySQL user. Use an account with only SELECT grants for defense-in-depth. */
  user?: string
  /** MySQL password. Defaults to the shared test-instance password; override from `cordis.yml` for other environments. */
  password?: string
  /** Business database holding the `guohua_*` tables. */
  database?: string
  /** Connection character set. */
  charset?: string
  /** Maximum pooled connections. */
  connectionLimit?: number
  /** Cooperative query inactivity timeout budget (ms). */
  queryTimeoutMs?: number
  /** Upper bound on one page of results. */
  maxPageSize?: number
}

export const Config: z<Config> = z.object({
  host: z.string().default(DEFAULT_HOST),
  port: z.number().default(DEFAULT_PORT),
  user: z.string().default(DEFAULT_USER),
  password: z.string().default(DEFAULT_PASSWORD),
  database: z.string().default(DEFAULT_DATABASE),
  charset: z.string().default(DEFAULT_CHARSET),
  connectionLimit: z.number().default(DEFAULT_CONNECTION_LIMIT),
  queryTimeoutMs: z.number().default(DEFAULT_QUERY_TIMEOUT_MS),
  maxPageSize: z.number().default(DEFAULT_MAX_PAGE_SIZE),
})

/** Complete config after schemastery applies every field default. */
type ResolvedConfig = Required<Config>

/** Configured counts must be positive integers. */
function assertPositiveInteger(field: string, value: number): void {
  if (!Number.isInteger(value) || value < 1) {
    throw new Error(`employ-tools: ${field} must be a positive integer`)
  }
}

/** Configured TCP ports must be within the valid range. */
function assertPort(value: number): void {
  if (!Number.isInteger(value) || value < 1 || value > 65535) {
    throw new Error('employ-tools: port must be an integer between 1 and 65535')
  }
}

/**
 * Assert a table or column name is a bare identifier. Table and column names
 * reach the SQL text only as validated identifiers, never as raw model input.
 * @param name The candidate table/column name.
 * @param kind The identifier kind for the error message.
 */
export function assertIdentifier(name: string, kind: string): void {
  if (!/^[A-Za-z_][A-Za-z0-9_]*$/.test(name)) {
    throw new Error(`employ-tools: invalid ${kind} "${name}"`)
  }
}

/** Escape LIKE wildcards so a filter value matches literally. */
export function escapeLike(value: string): string {
  return value.replace(/[\\%_]/g, char => `\\${char}`)
}

/** A filter operator selectable via the `{ op: value }` filter form. */
type FilterOperator = 'eq' | 'like' | 'in' | 'gte' | 'lte'

/**
 * Parse one filter value into one or two comparisons, or null to skip. A scalar
 * string matches as a substring, a scalar number/boolean matches exactly, and an
 * object selects explicit operators: at most one of `eq`/`like`/`in`, plus
 * optional `gte`/`lte` bounds (both may be given for a range).
 */
function parseFilterValue(key: string, raw: unknown): { mode: FilterOperator; operand: unknown }[] | null {
  if (raw === null || raw === undefined) return null
  if (typeof raw === 'object' && !Array.isArray(raw)) {
    const entries = Object.entries(raw as Record<string, unknown>)
    if (entries.length === 0) return null
    const ops: { mode: FilterOperator; operand: unknown }[] = []
    let single = 0
    for (const [mode, operand] of entries) {
      if (mode === 'eq' || mode === 'like' || mode === 'in') {
        single += 1
        if (single > 1) throw new Error(`employ-tools: filter "${key}" accepts only one of eq/like/in`)
        ops.push({ mode, operand })
      } else if (mode === 'gte' || mode === 'lte') {
        ops.push({ mode, operand })
      } else {
        throw new Error(`employ-tools: unsupported operator "${mode}" for filter "${key}"`)
      }
    }
    return ops
  }
  if (typeof raw === 'string') return [{ mode: 'like', operand: raw }]
  if (typeof raw === 'number' || typeof raw === 'boolean') return [{ mode: 'eq', operand: raw }]
  throw new Error(`employ-tools: unsupported filter value for "${key}"`)
}

/**
 * Build a parameterized `WHERE` clause from a filter map whose keys are
 * validated against the table's discovered columns. Values are bound as `?`
 * placeholders; unknown columns and malformed filter values fail loudly.
 * @param filters The model-supplied filter key/value map.
 * @param columns The lowercased column names of the queried table.
 * @param table The queried table, for error messages.
 * @returns The `WHERE ...` fragment (empty when nothing matched) and its bound values.
 */
export function buildWhere(
  filters: Record<string, unknown> | undefined,
  columns: ReadonlySet<string>,
  table: string,
): { sql: string; values: unknown[] } {
  const conditions: string[] = []
  const values: unknown[] = []
  for (const [key, raw] of Object.entries(filters ?? {})) {
    assertIdentifier(key, 'column')
    const column = columns.has(key.toLowerCase()) ? key.toLowerCase() : null
    if (column === null) {
      throw new Error(`employ-tools: unknown column "${key}" for table "${table}"`)
    }
    const ops = parseFilterValue(key, raw)
    if (ops === null) continue
    for (const { mode, operand } of ops) {
      if (operand === null || operand === undefined) continue
      if (operand === '' && (mode === 'like' || mode === 'eq')) continue
      switch (mode) {
        case 'like': {
          conditions.push(`t.${column} LIKE ?`)
          values.push(`%${escapeLike(String(operand))}%`)
          break
        }
        case 'eq':
          conditions.push(`t.${column} = ?`)
          values.push(operand)
          break
        case 'in': {
          const list = Array.isArray(operand)
            ? operand.map(item => String(item))
            : String(operand).split(',').map(item => item.trim()).filter(Boolean)
          if (list.length === 0) continue
          conditions.push(`t.${column} IN (${list.map(() => '?').join(', ')})`)
          values.push(...list)
          break
        }
        case 'gte':
          conditions.push(`t.${column} >= ?`)
          values.push(operand)
          break
        case 'lte':
          conditions.push(`t.${column} <= ?`)
          values.push(operand)
          break
      }
    }
  }
  return { sql: conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '', values }
}

/**
 * Curated relationship map derived from {@link RELATIONSHIPS}: a foreign-key
 * column name maps to the table it references. Only these relationships can be
 * followed by a join; everything else stays a single-table query. The catalog
 * lives in `relationships.ts` as plain typed data, validated against the schema
 * reference DDL by the `verify-employ-relationships` gate.
 */
export const FK_MAP: Record<string, FkJoin> = Object.fromEntries(
  RELATIONSHIPS.map(({ fk, ...join }) => [fk, join]),
)

/**
 * Build the `LEFT JOIN` fragments and their selected label columns for a list
 * of foreign-key columns. Each join uses a stable alias (`j0`, `j1`, …).
 * @param joinColumns The foreign-key columns to follow.
 * @returns The joined `LEFT JOIN ...` SQL and the alias-qualified select list.
 */
export function buildJoins(joinColumns: readonly string[]): { sql: string; select: string } {
  const joins: string[] = []
  const selects: string[] = []
  joinColumns.forEach((column, index) => {
    assertIdentifier(column, 'join column')
    const fk = FK_MAP[column]
    if (!fk) {
      throw new Error(`employ-tools: unknown join column "${column}" (available: ${Object.keys(FK_MAP).join(', ')})`)
    }
    const alias = `j${index}`
    joins.push(`LEFT JOIN ${fk.table} ${alias} ON ${alias}.${fk.pk} = t.${column}`)
    selects.push(`${alias}.${fk.label} AS ${fk.alias}`)
  })
  return { sql: joins.join(' '), select: selects.join(', ') }
}

/**
 * Assert a statement is one read-only `SELECT`. Defense-in-depth: the SQL text
 * is owned by this plugin, so this guard catches any accidental regression
 * toward a multi-statement or non-SELECT query.
 * @param sql The statement about to execute.
 */
export function assertReadOnlySql(sql: string): void {
  if (sql.includes(';')) {
    throw new Error('employ-tools: multiple statements are not allowed')
  }
  if (!/^SELECT\b/i.test(sql.trim())) {
    throw new Error('employ-tools: only SELECT queries are allowed')
  }
}

/** Build the count statement for one page. */
export function buildCountSql(table: string, where: string, joinSql: string, pk: string | null): string {
  const count = pk ? `COUNT(DISTINCT t.${pk})` : 'COUNT(*)'
  return `SELECT ${count} AS total FROM ${table} t ${joinSql} ${where}`.trim()
}

/** Build the list statement for one page; offset/limit are validated integers. */
export function buildListSql(
  table: string,
  where: string,
  joinSql: string,
  joinSelect: string,
  pk: string | null,
  offset: number,
  pageSize: number,
): string {
  const select = `t.*${joinSelect ? `, ${joinSelect}` : ''}`
  const orderBy = pk ? `ORDER BY t.${pk} DESC` : ''
  return `SELECT ${select} FROM ${table} t ${joinSql} ${where} ${orderBy} LIMIT ${offset}, ${pageSize}`.trim()
}

/** Discovered catalog: lowercased table → columns, plus one primary-key column per table. */
interface SchemaInfo {
  columns: Map<string, Set<string>>
  pks: Map<string, string | null>
}

/** Read the business database's tables and columns from `information_schema` (read-only). */
async function discoverSchema(
  pool: Pool,
  database: string,
  signal: AbortSignal,
  timeoutMs: number,
): Promise<SchemaInfo> {
  const rows = await runQuery(
    pool,
    'SELECT TABLE_NAME, COLUMN_NAME, COLUMN_KEY FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = ? ORDER BY TABLE_NAME, ORDINAL_POSITION',
    [database],
    signal,
    timeoutMs,
  )
  const columns = new Map<string, Set<string>>()
  const pks = new Map<string, string | null>()
  for (const row of rows) {
    const table = String(row.TABLE_NAME).toLowerCase()
    const column = String(row.COLUMN_NAME).toLowerCase()
    let set = columns.get(table)
    if (!set) {
      set = new Set()
      columns.set(table, set)
      pks.set(table, null)
    }
    set.add(column)
    if (row.COLUMN_KEY === 'PRI' && pks.get(table) === null) {
      pks.set(table, column)
    }
  }
  return { columns, pks }
}

/** Render a paged result as a count summary plus lossless JSON. */
function renderData(value: unknown): string {
  const data = (value ?? {}) as { count?: unknown; list?: unknown }
  const count = typeof data.count === 'number' ? data.count : 0
  const list = Array.isArray(data.list) ? data.list : []
  return `查询成功：共 ${count} 条，本页返回 ${list.length} 条。\n${JSON.stringify(value, null, 2)}`
}

/** Render the schema listing as a compact summary plus lossless JSON. */
function renderSchema(value: unknown): string {
  return JSON.stringify(value, null, 2)
}

/** A value that round-trips through JSON without loss (mirrors `dsh-util-values`). */
type JsonValue = null | boolean | number | string | JsonValue[] | { [key: string]: JsonValue }

/**
 * Convert a mysql2 row value into a lossless-JSON-safe value: `Date` becomes an
 * ISO string, `Buffer` becomes base64, and `bigint` becomes a decimal string.
 * mysql2 returns `DATETIME`/`DATE` columns as `Date` instances and binary
 * columns as `Buffer`, which the harness rejects as not lossless JSON.
 * @param value Any value returned from a mysql2 query.
 * @returns The JSON-safe equivalent.
 */
function toJsonSafe(value: unknown): JsonValue {
  if (value === null || typeof value === 'string' || typeof value === 'boolean') return value
  if (typeof value === 'number') return Number.isFinite(value) ? value : String(value)
  if (value instanceof Date) return value.toISOString()
  if (Buffer.isBuffer(value)) return value.toString('base64')
  if (typeof value === 'bigint') return value.toString()
  if (Array.isArray(value)) return value.map(toJsonSafe)
  if (typeof value === 'object') {
    const out: Record<string, JsonValue> = {}
    for (const [key, item] of Object.entries(value as Record<string, unknown>)) {
      out[key] = toJsonSafe(item)
    }
    return out
  }
  return String(value)
}

/** Execute one read-only statement, forwarding cancellation and the timeout budget. */
async function runQuery(
  pool: Pool,
  sql: string,
  values: readonly unknown[],
  signal: AbortSignal,
  timeoutMs: number,
): Promise<RowDataPacket[]> {
  assertReadOnlySql(sql)
  signal.throwIfAborted()
  const [rows] = await pool.query<RowDataPacket[]>({ sql, values: values as unknown as QueryValues, timeout: timeoutMs })
  signal.throwIfAborted()
  return rows
}

/** Register the two query tools and own the connection pool through disposal. */
export function apply(ctx: Context, config: Config): void {
  const resolved = config as ResolvedConfig
  assertPositiveInteger('connectionLimit', resolved.connectionLimit)
  assertPositiveInteger('queryTimeoutMs', resolved.queryTimeoutMs)
  assertPositiveInteger('maxPageSize', resolved.maxPageSize)
  assertPort(resolved.port)

  const pool = mysql.createPool({
    host: resolved.host,
    port: resolved.port,
    user: resolved.user,
    password: resolved.password,
    database: resolved.database,
    charset: resolved.charset,
    connectionLimit: resolved.connectionLimit,
    multipleStatements: false,
  })

  let schemaPromise: Promise<SchemaInfo> | null = null
  const schema = (signal: AbortSignal): Promise<SchemaInfo> => {
    schemaPromise ??= discoverSchema(pool, resolved.database, signal, resolved.queryTimeoutMs)
      .catch((error: unknown) => {
        // Do not cache a transient discovery failure: the next call retries.
        schemaPromise = null
        throw error
      })
    return schemaPromise
  }

  ctx.tools.register(defineTool({
    name: 'query_employ_schema',
    description: '查看国华就业业务库的表清单，或某张表的字段及可连表关系（只读，来自 information_schema）。',
    parameters: {
      table: { type: 'string', description: '可选：指定表名则返回该表的字段列表与可连表关系；省略则返回全部表名。' },
    },
    output: {
      schema: { type: 'object', additionalProperties: true },
      render: (_args, value) => [{ type: 'text', text: renderSchema(value) }],
    },
    timeoutMs: resolved.queryTimeoutMs,
    async execute(args, exec) {
      const info = await schema(exec.signal)
      const table = args.table?.toLowerCase()
      if (table !== undefined) {
        assertIdentifier(table, 'table')
        const cols = info.columns.get(table)
        if (!cols) throw new Error(`employ-tools: unknown table "${table}"`)
        const joins = Object.keys(FK_MAP).filter(fk => cols.has(fk))
        return {
          table,
          columns: [...cols].sort(),
          joins,
          primary_key: info.pks.get(table) ?? null,
        }
      }
      return { tables: [...info.columns.keys()].sort(), count: info.columns.size }
    },
  }))

  ctx.tools.register(defineTool({
    name: 'query_employ',
    description: '分页查询国华就业业务库任意一张表，可附加筛选条件和连表。支持按文档化的业务关系连表（如 customer_id→guohua_customer、store_id/base_id→guohua_store、persons_id→guohua_persons、contract_id→guohua_contract 等）。',
    parameters: {
      table: { type: 'string', required: true, description: '要查询的表名（可用 query_employ_schema 查看可用表）。' },
      filters: {
        type: 'object',
        additionalProperties: true,
        description: '可选：字段名→值的筛选。字符串值默认按子串匹配(LIKE)，数字/布尔值按精确匹配(=)。也可用 { eq: v } 精确、{ like: v } 子串、{ in: [v1,v2] } 多值、{ gte: v } / { lte: v } 边界（可同时给 gte 和 lte 表示区间）。字段名必须是该表的列。',
      },
      joins: {
        type: 'array',
        items: { type: 'string' },
        description: '可选：要跟随的外键字段名列表（如 ["customer_id","store_id"]），结果追加对应表的名称列。',
      },
      page: { type: 'number', description: '页码，从 1 开始，默认 1' },
      page_size: { type: 'number', description: `每页条数，默认 20，最大 ${resolved.maxPageSize}` },
    },
    output: {
      schema: { type: 'object', additionalProperties: true },
      render: (_args, value) => [{ type: 'text', text: renderData(value) }],
    },
    timeoutMs: resolved.queryTimeoutMs,
    async execute(args, exec) {
      const info = await schema(exec.signal)
      const table = args.table.toLowerCase()
      assertIdentifier(table, 'table')
      const cols = info.columns.get(table)
      if (!cols) throw new Error(`employ-tools: unknown table "${table}"`)
      const pk = info.pks.get(table) ?? null

      const page = args.page === undefined ? 1 : Math.max(1, Math.trunc(args.page))
      const pageSize = args.page_size === undefined
        ? 20
        : Math.min(resolved.maxPageSize, Math.max(1, Math.trunc(args.page_size)))
      const offset = (page - 1) * pageSize

      const joins = buildJoins(args.joins ?? [])
      const where = buildWhere(args.filters, cols, table)
      const countSql = buildCountSql(table, where.sql, joins.sql, pk)
      const listSql = buildListSql(table, where.sql, joins.sql, joins.select, pk, offset, pageSize)

      const [totalRows, listRows] = await Promise.all([
        runQuery(pool, countSql, where.values, exec.signal, resolved.queryTimeoutMs),
        runQuery(pool, listSql, where.values, exec.signal, resolved.queryTimeoutMs),
      ])
      const raw = totalRows[0]?.total
      const count = typeof raw === 'number' ? raw : Number(raw ?? 0)
      return { count, page, page_size: pageSize, list: listRows.map(toJsonSafe) }
    },
  }))

  ctx.effect(() => () => {
    void pool.end()
  }, 'employ-tools mysql pool teardown')
}
