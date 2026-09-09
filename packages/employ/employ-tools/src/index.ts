/**
 * Model-facing employment-management query tools over the Guohua employment HTTP API.
 * Registers four read-only tools — `query_employ_store`, `query_employ_person`,
 * `query_employ_contract`, and `query_employ_clue` — that page over the base, person,
 * contract, and clue list endpoints. Every request authenticates with the access token
 * as the `token` header, mirrored as an `access_token` cookie, and carries the tenant
 * scope as the `system-id` header; responses follow the unified
 * `{ code, message, data, errors }` envelope, and a non-zero `code` fails the call with
 * the server's message.
 * @module @deepseek-ai/dsh-employ-tools
 */

import type { Context } from '@deepseek-ai/cordis'
import z from '@deepseek-ai/schemastery'
import { defineTool } from '@deepseek-ai/dsh-tools'
import type { JsonValue } from '@deepseek-ai/dsh-util-values'

export const name = 'employ-tools'

export const inject = ['tools']

export const DEFAULT_BASE_URL = 'http://operate.test.guohualinks.com/employmentapi'
export const DEFAULT_TIMEOUT_MS = 30_000
export const DEFAULT_MAX_PAGE_SIZE = 100
export const DEFAULT_SYSTEM_ID = 'gh0001'

/** Plugin config: API base URL, cookie access token, optional role header, and bounds. */
export interface Config {
  /** Guohua employment API base URL, without a trailing slash. */
  baseUrl?: string
  /** Login token sent as the `token` header and mirrored as the `access_token` cookie. Empty means unauthenticated. */
  accessToken?: string
  /** `system-id` header carrying the tenant scope for role-permission resolution. */
  systemId?: string
  /** Cooperative timeout budget (ms) per request. */
  timeoutMs?: number
  /** Upper bound on one page of results. */
  maxPageSize?: number
}

export const Config: z<Config> = z.object({
  baseUrl: z.string().default(DEFAULT_BASE_URL),
  accessToken: z.string().default(''),
  systemId: z.string().default(DEFAULT_SYSTEM_ID),
  timeoutMs: z.number().default(DEFAULT_TIMEOUT_MS),
  maxPageSize: z.number().default(DEFAULT_MAX_PAGE_SIZE),
})

/** Complete config after schemastery applies every field default. */
type ResolvedConfig = Required<Config>

/**
 * Serialize flat filter key/values plus pagination into a query string. Empty,
 * null, and undefined values are omitted so they never override the server's
 * own defaults.
 */
export function buildQueryString(
  filters: Record<string, unknown> | undefined,
  page: number | undefined,
  pageSize: number | undefined,
): string {
  const params = new URLSearchParams()
  for (const [key, value] of Object.entries(filters ?? {})) {
    if (value === undefined || value === null || value === '') continue
    params.set(key, String(value))
  }
  if (page !== undefined) params.set('page', String(page))
  if (pageSize !== undefined) params.set('page_size', String(pageSize))
  return params.toString()
}

/** Configured counts must be positive integers. */
function assertPositiveInteger(field: string, value: number): void {
  if (!Number.isInteger(value) || value < 1) {
    throw new Error(`employ-tools: ${field} must be a positive integer`)
  }
}

/**
 * Build the request headers from resolved config. The API authenticates via the
 * `token` header, not the `access_token` cookie; the token is also mirrored as the
 * `access_token` cookie to match the browser request the API expects. A non-empty
 * `systemId` adds the role-permission scope header.
 * @param config The login token and the optional role-permission scope.
 * @returns The request headers, including the `token` auth header and its cookie mirror.
 */
export function buildHeaders(config: { accessToken: string; systemId: string }): Record<string, string> {
  const headers: Record<string, string> = { Accept: 'application/json' }
  if (config.accessToken) {
    headers.token = config.accessToken
    headers.Cookie = `access_token=${config.accessToken}`
  }
  if (config.systemId) headers['system-id'] = config.systemId
  return headers
}

/** Render the paged `data` payload as a count summary plus lossless JSON. */
function renderData(value: unknown): string {
  const data = (value ?? {}) as { count?: unknown; list?: unknown }
  const count = typeof data.count === 'number' ? data.count : 0
  const list = Array.isArray(data.list) ? data.list : []
  return `查询成功：共 ${count} 条，本页返回 ${list.length} 条。\n${JSON.stringify(value, null, 2)}`
}

/** Perform one authenticated GET and return the envelope's `data` payload. */
async function queryEndpoint(
  config: ResolvedConfig,
  path: string,
  filters: Record<string, unknown> | undefined,
  page: number | undefined,
  pageSize: number | undefined,
  signal: AbortSignal,
): Promise<Record<string, JsonValue>> {
  const query = buildQueryString(filters, page, pageSize)
  const url = `${config.baseUrl.replace(/\/+$/, '')}${path}${query ? `?${query}` : ''}`
  const headers = buildHeaders(config)

  const timeout = AbortSignal.timeout(config.timeoutMs)
  const aborted = AbortSignal.any([signal, timeout])
  let response: Response
  try {
    // The cookie is a credential; fail on any redirect rather than forward it.
    response = await fetch(url, { method: 'GET', headers, signal: aborted, redirect: 'error' })
  } catch (error) {
    if (timeout.aborted) throw new Error(`employ-tools: request timed out after ${config.timeoutMs}ms`)
    throw error
  }
  if (!response.ok) {
    throw new Error(`employ-tools: HTTP ${response.status} ${response.statusText}`)
  }
  const body: unknown = await response.json().catch(() => {
    throw new Error('employ-tools: response was not valid JSON')
  })
  if (typeof body !== 'object' || body === null) {
    throw new Error('employ-tools: unexpected response envelope')
  }
  const envelope = body as { code?: unknown; message?: unknown; data?: unknown }
  if (envelope.code !== 0) {
    const message = typeof envelope.message === 'string' ? envelope.message : '请求失败'
    throw new Error(`employ-tools: ${message} (code ${String(envelope.code)})`)
  }
  const data = envelope.data
  if (typeof data === 'object' && data !== null && !Array.isArray(data)) {
    return data as Record<string, JsonValue>
  }
  return {}
}

/** Static description of one query tool. */
interface ToolSpec {
  toolName: string
  path: string
  description: string
  filtersHint: string
}

/** The four query tools and their endpoint paths. */
const TOOLS: ToolSpec[] = [
  {
    toolName: 'query_employ_store',
    path: '/employ/store/list',
    description: '按条件分页查询就业基地（单店）列表，返回基地基本信息及实时人员/打卡/人脸核验等统计指标。',
    filtersHint: '可选查询条件（键值对）。常用键：store_name 基地名称、area_name 地区名、is_flag 基地类型(0普通/1示范/2自营)、is_recommend 是否推荐(0/1)、is_face_clock 是否人脸打卡(0/1)、persons_status 人员状态、department_id 部门ID、start_date/end_date 日期范围。',
  },
  {
    toolName: 'query_employ_person',
    path: '/employ/persons',
    description: '按条件分页查询人员信息列表，支持按客户、基地、姓名、身份证、残疾信息、工作状态、合同到期等多维度筛选，并附带当月考勤指标。',
    filtersHint: '可选查询条件（键值对）。常用键：persons_name 姓名、id_number 身份证号、disabled_no 残疾证号、phone 手机号、persons_status 人员状态(1候选人/2在职/3离职/4在册)、office_status 入职状态、base_id/store_id 基地ID、base_name 基地名称、customer_name 客户名、department 部门、attendance_month 考勤月份(YYYY-MM)。',
  },
  {
    toolName: 'query_employ_contract',
    path: '/contract',
    description: '按条件分页查询合同列表，支持按客户、合同编号/名称、合同状态、签约状态、日期范围、部门等多维度筛选，并返回合同可用状态。',
    filtersHint: '可选查询条件（键值对）。常用键：contract_name 合同名称、contract_no 合同编号、customer_name 客户名称、contract_status_id 合同状态(逗号分隔)、is_signed 签约状态(0/1)、sign_type 签约类型(1新签/2续签)、department_id 部门ID、start_date/end_date 合同起止日期。',
  },
  {
    toolName: 'query_employ_clue',
    path: '/employ/customer/opt/clue',
    description: '按条件分页查询客户线索列表，支持按线索名称、客户、负责人、线索来源/级别、行业、规模、签约/转客户/退回状态、日期等维度筛选。',
    filtersHint: '可选查询条件（键值对）。常用键：clue_name 线索名称、customer_name 客户名、prospect_level 线索级别、prospect_source 线索来源、responsible_userid 负责人、is_clue_share 是否分配(0/1)、is_clue_change 是否转客户(0/1)、is_contract 是否签约(0/1)、start_date/end_date 创建日期范围。',
  },
]

/** Register the four query tools; their schemas flow into prompt assembly automatically. */
export function apply(ctx: Context, config: Config): void {
  const resolved = config as ResolvedConfig
  assertPositiveInteger('timeoutMs', resolved.timeoutMs)
  assertPositiveInteger('maxPageSize', resolved.maxPageSize)
  for (const spec of TOOLS) {
    ctx.tools.register(defineTool({
      name: spec.toolName,
      description: spec.description,
      parameters: {
        filters: { type: 'object', additionalProperties: true, description: spec.filtersHint },
        page: { type: 'number', description: '页码，从 1 开始，默认 1' },
        page_size: { type: 'number', description: `每页条数，默认 20，最大 ${resolved.maxPageSize}` },
      },
      output: {
        schema: { type: 'object', additionalProperties: true },
        render: (_args, value) => [{ type: 'text', text: renderData(value) }],
      },
      timeoutMs: resolved.timeoutMs,
      async execute(args, exec) {
        const page = args.page === undefined ? undefined : Math.max(1, Math.trunc(args.page))
        const pageSize = args.page_size === undefined
          ? undefined
          : Math.min(resolved.maxPageSize, Math.max(1, Math.trunc(args.page_size)))
        return queryEndpoint(resolved, spec.path, args.filters, page, pageSize, exec.signal)
      },
    }))
  }
}
