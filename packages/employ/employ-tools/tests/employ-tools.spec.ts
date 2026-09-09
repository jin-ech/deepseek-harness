import { describe, expect, it } from 'vitest'
import {
  buildHeaders,
  buildQueryString,
  Config,
  DEFAULT_BASE_URL,
  DEFAULT_MAX_PAGE_SIZE,
  DEFAULT_SYSTEM_ID,
  DEFAULT_TIMEOUT_MS,
  inject,
  name,
} from '../src/index.ts'

describe('employ-tools', () => {
  it('declares the tool plugin shape', () => {
    expect(name).toBe('employ-tools')
    expect(inject).toEqual(['tools'])
  })

  it('builds a query string and skips empty values', () => {
    const query = buildQueryString({ area_name: '上海', is_flag: '1', empty: '' }, 1, 20)
    expect(query).toContain('area_name=')
    expect(query).toContain('is_flag=1')
    expect(query).toContain('page=1')
    expect(query).toContain('page_size=20')
    expect(query).not.toContain('empty=')
  })

  it('applies config defaults', () => {
    const resolved = Config({})
    expect(resolved.baseUrl).toBe(DEFAULT_BASE_URL)
    expect(resolved.timeoutMs).toBe(DEFAULT_TIMEOUT_MS)
    expect(resolved.maxPageSize).toBe(DEFAULT_MAX_PAGE_SIZE)
    expect(resolved.systemId).toBe(DEFAULT_SYSTEM_ID)
    expect(resolved.accessToken).toBe('')
  })

  it('authenticates with the token header and mirrors it as the cookie', () => {
    const headers = buildHeaders({ accessToken: 'abc', systemId: 'gh0001' })
    expect(headers.token).toBe('abc')
    expect(headers.Cookie).toBe('access_token=abc')
    expect(headers['system-id']).toBe('gh0001')
    expect(headers.Accept).toBe('application/json')
  })

  it('omits the auth and role headers when unset', () => {
    const headers = buildHeaders({ accessToken: '', systemId: '' })
    expect(headers.token).toBeUndefined()
    expect(headers.Cookie).toBeUndefined()
    expect(headers['system-id']).toBeUndefined()
  })
})
