import { describe, expect, it, vi } from 'vitest'
import mysql from 'mysql2/promise'
import {
  apply,
  assertIdentifier,
  assertReadOnlySql,
  buildCountSql,
  buildJoins,
  buildListSql,
  buildWhere,
  Config,
  DEFAULT_CHARSET,
  DEFAULT_CONNECTION_LIMIT,
  DEFAULT_DATABASE,
  DEFAULT_HOST,
  DEFAULT_MAX_PAGE_SIZE,
  DEFAULT_PORT,
  DEFAULT_QUERY_TIMEOUT_MS,
  DEFAULT_PASSWORD,
  DEFAULT_USER,
  escapeLike,
  FK_MAP,
  inject,
  name,
} from '../src/index.ts'

vi.mock('mysql2/promise', () => ({
  default: { createPool: vi.fn() },
}))

const PERSON_COLUMNS = new Set(['persons_id', 'persons_name', 'customer_id', 'base_id', 'persons_status', 'add_time'])

describe('employ-tools', () => {
  it('declares the tool plugin shape', () => {
    expect(name).toBe('employ-tools')
    expect(inject).toEqual(['tools'])
  })

  it('applies config defaults', () => {
    const resolved = Config({})
    expect(resolved.host).toBe(DEFAULT_HOST)
    expect(resolved.port).toBe(DEFAULT_PORT)
    expect(resolved.user).toBe(DEFAULT_USER)
    expect(resolved.password).toBe(DEFAULT_PASSWORD)
    expect(resolved.database).toBe(DEFAULT_DATABASE)
    expect(resolved.charset).toBe(DEFAULT_CHARSET)
    expect(resolved.connectionLimit).toBe(DEFAULT_CONNECTION_LIMIT)
    expect(resolved.queryTimeoutMs).toBe(DEFAULT_QUERY_TIMEOUT_MS)
    expect(resolved.maxPageSize).toBe(DEFAULT_MAX_PAGE_SIZE)
  })

  it('escapes LIKE wildcards so values match literally', () => {
    expect(escapeLike('a%b')).toBe('a\\%b')
    expect(escapeLike('a_b')).toBe('a\\_b')
    expect(escapeLike('a\\b')).toBe('a\\\\b')
  })
})

describe('assertIdentifier', () => {
  it('accepts bare identifiers and rejects anything else', () => {
    expect(() => assertIdentifier('guohua_persons', 'table')).not.toThrow()
    expect(() => assertIdentifier('_x9', 'column')).not.toThrow()
    expect(() => assertIdentifier('a-b', 'column')).toThrow(/invalid column/)
    expect(() => assertIdentifier('t; DROP TABLE', 'table')).toThrow(/invalid table/)
    expect(() => assertIdentifier('a.b', 'table')).toThrow(/invalid table/)
  })
})

describe('buildWhere', () => {
  it('returns an empty clause when filters are empty', () => {
    expect(buildWhere(undefined, PERSON_COLUMNS, 'guohua_persons')).toEqual({ sql: '', values: [] })
  })

  it('matches strings as substrings and numbers/booleans exactly', () => {
    expect(buildWhere({ persons_name: '张' }, PERSON_COLUMNS, 'guohua_persons')).toEqual({
      sql: 'WHERE t.persons_name LIKE ?',
      values: ['%张%'],
    })
    expect(buildWhere({ customer_id: 9 }, PERSON_COLUMNS, 'guohua_persons')).toEqual({
      sql: 'WHERE t.customer_id = ?',
      values: [9],
    })
  })

  it('honours explicit operators and a gte/lte range', () => {
    expect(buildWhere({ persons_name: { eq: '张三' } }, PERSON_COLUMNS, 'guohua_persons')).toEqual({
      sql: 'WHERE t.persons_name = ?',
      values: ['张三'],
    })
    expect(buildWhere({ persons_status: { in: ['2', '3'] } }, PERSON_COLUMNS, 'guohua_persons')).toEqual({
      sql: 'WHERE t.persons_status IN (?, ?)',
      values: ['2', '3'],
    })
    expect(buildWhere({ add_time: { gte: '2024-01-01', lte: '2024-12-31' } }, PERSON_COLUMNS, 'guohua_persons')).toEqual({
      sql: 'WHERE t.add_time >= ? AND t.add_time <= ?',
      values: ['2024-01-01', '2024-12-31'],
    })
  })

  it('rejects unknown columns and malformed values', () => {
    expect(() => buildWhere({ nope: 1 }, PERSON_COLUMNS, 'guohua_persons')).toThrow(/unknown column "nope"/)
    expect(() => buildWhere({ persons_name: { eq: 'a', like: 'b' } }, PERSON_COLUMNS, 'guohua_persons')).toThrow(/only one of eq\/like\/in/)
    expect(() => buildWhere({ persons_name: { bad: 'x' } }, PERSON_COLUMNS, 'guohua_persons')).toThrow(/unsupported operator/)
  })
})

describe('buildJoins', () => {
  it('builds a LEFT JOIN with a stable alias and an aliased label column', () => {
    const joins = buildJoins(['customer_id'])
    expect(joins.sql).toBe('LEFT JOIN guohua_customer j0 ON j0.customer_id = t.customer_id')
    expect(joins.select).toBe('j0.customer_name AS customer_name')
  })

  it('builds multiple joins with incrementing aliases', () => {
    const joins = buildJoins(['customer_id', 'base_id'])
    expect(joins.sql).toContain('LEFT JOIN guohua_customer j0 ON j0.customer_id = t.customer_id')
    expect(joins.sql).toContain('LEFT JOIN guohua_store j1 ON j1.store_id = t.base_id')
    expect(joins.select).toBe('j0.customer_name AS customer_name, j1.store_name AS base_name')
  })

  it('rejects unknown join columns', () => {
    expect(() => buildJoins(['nope_id'])).toThrow(/unknown join column/)
  })

  it('documents the core relationships', () => {
    expect(FK_MAP.customer_id?.table).toBe('guohua_customer')
    expect(FK_MAP.store_id?.table).toBe('guohua_store')
    expect(FK_MAP.base_id?.table).toBe('guohua_store')
    expect(FK_MAP.persons_id?.table).toBe('guohua_persons')
    expect(FK_MAP.contract_id?.table).toBe('guohua_contract')
  })
})

describe('assertReadOnlySql', () => {
  it('accepts a single SELECT statement', () => {
    expect(() => assertReadOnlySql('SELECT 1')).not.toThrow()
    expect(() => assertReadOnlySql('  SELECT t.* FROM guohua_persons t')).not.toThrow()
  })

  it('rejects non-SELECT and multi-statement input', () => {
    expect(() => assertReadOnlySql('UPDATE t SET x = 1')).toThrow(/only SELECT/)
    expect(() => assertReadOnlySql('INSERT INTO t VALUES (1)')).toThrow(/only SELECT/)
    expect(() => assertReadOnlySql('SELECT 1; DROP TABLE t')).toThrow(/multiple statements/)
  })
})

describe('SQL assembly', () => {
  it('builds a count statement with a distinct primary key', () => {
    const sql = buildCountSql('guohua_persons', 'WHERE t.persons_name LIKE ?', 'LEFT JOIN guohua_customer j0 ON j0.customer_id = t.customer_id', 'persons_id')
    expect(sql).toBe('SELECT COUNT(DISTINCT t.persons_id) AS total FROM guohua_persons t LEFT JOIN guohua_customer j0 ON j0.customer_id = t.customer_id WHERE t.persons_name LIKE ?')
  })

  it('builds a list statement with joined columns, ordering, and pagination', () => {
    const sql = buildListSql('guohua_persons', 'WHERE t.customer_id = ?', '', 'j0.customer_name AS customer_name', 'persons_id', 0, 20)
    expect(sql).toBe('SELECT t.*, j0.customer_name AS customer_name FROM guohua_persons t  WHERE t.customer_id = ? ORDER BY t.persons_id DESC LIMIT 0, 20')
  })

  it('falls back to COUNT(*) and no ordering when the table has no primary key', () => {
    const count = buildCountSql('guohua_payment', '', '', null)
    expect(count).toContain('SELECT COUNT(*) AS total')
    expect(count).toContain('FROM guohua_payment t')
    expect(count).not.toContain('DISTINCT')

    const list = buildListSql('guohua_payment', '', '', '', null, 0, 20)
    expect(list).toContain('SELECT t.* FROM guohua_payment t')
    expect(list).toContain('LIMIT 0, 20')
    expect(list).not.toContain('ORDER BY')
  })
})

describe('apply', () => {
  type QueryCall = { sql: string; values?: unknown; timeout?: number }
  type QueryImpl = (opts: QueryCall) => Promise<unknown[][]>

  function makePool(queryImpl: QueryImpl = async () => [[], []]) {
    return {
      on: vi.fn(),
      query: vi.fn(queryImpl),
      end: vi.fn().mockResolvedValue(undefined),
    }
  }

  it('registers the schema and query tools and disposes the pool', () => {
    const createPool = vi.mocked(mysql.createPool)
    const pool = makePool()
    createPool.mockReturnValue(pool as unknown as ReturnType<typeof mysql.createPool>)

    const register = vi.fn()
    let dispose: (() => void) | undefined
    const effect = vi.fn((fn: () => () => void) => { dispose = fn() })
    const ctx = { tools: { register }, effect } as unknown as Parameters<typeof apply>[0]

    apply(ctx, Config({}))

    expect(createPool).toHaveBeenCalledWith(expect.objectContaining({ multipleStatements: false }))
    expect(register).toHaveBeenCalledTimes(2)
    expect(register.mock.calls.map(call => (call[0] as { name: string }).name)).toEqual([
      'query_employ_schema',
      'query_employ',
    ])

    expect(dispose).toBeDefined()
    dispose!()
    expect(pool.end).toHaveBeenCalledTimes(1)
  })

  it('queries any table end-to-end through the generic tool', async () => {
    const createPool = vi.mocked(mysql.createPool)
    const pool = makePool(async (opts) => {
      const sql = opts.sql
      if (sql.includes('information_schema.COLUMNS')) {
        return [[
          { TABLE_NAME: 'guohua_persons', COLUMN_NAME: 'persons_id', COLUMN_KEY: 'PRI' },
          { TABLE_NAME: 'guohua_persons', COLUMN_NAME: 'persons_name', COLUMN_KEY: '' },
          { TABLE_NAME: 'guohua_persons', COLUMN_NAME: 'customer_id', COLUMN_KEY: '' },
        ], []]
      }
      if (sql.includes('COUNT(DISTINCT t.persons_id)')) {
        return [[{ total: 42 }], []]
      }
      if (sql.includes('FROM guohua_persons t')) {
        return [[{ persons_id: '1', persons_name: '张三', customer_id: 9 }], []]
      }
      return [[], []]
    })
    createPool.mockReturnValue(pool as unknown as ReturnType<typeof mysql.createPool>)

    const register = vi.fn()
    const ctx = { tools: { register }, effect: vi.fn() } as unknown as Parameters<typeof apply>[0]
    apply(ctx, Config({}))

    const queryTool = register.mock.calls.find(call => (call[0] as { name: string }).name === 'query_employ')![0] as {
      execute: (args: unknown, exec: { signal: AbortSignal }) => Promise<{ count: number; list: unknown[] }>
    }
    const result = await queryTool.execute(
      { table: 'guohua_persons', filters: { persons_name: '张' }, page: 1, page_size: 20 },
      { signal: new AbortController().signal },
    )

    expect(result.count).toBe(42)
    expect(result.list).toEqual([{ persons_id: '1', persons_name: '张三', customer_id: 9 }])
  })
})
