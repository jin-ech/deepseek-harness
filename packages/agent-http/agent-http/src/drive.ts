/**
 * In-process agent driving for @deepseek-ai/dsh-agent-http routes.
 *
 * `AgentSessions` owns a per-app registry of live agents keyed by their session
 * id. A run reuses an idle live session when the caller passes a known id;
 * an id that is not live but exists on disk is resumed through
 * `ctx.agents.resume` (the persisted JSONL is restored); otherwise a fresh
 * session is created. Owns no HTTP concerns: routes call `sessions.run(...)`.
 *
 * @module @deepseek-ai/dsh-agent-http/drive
 */

import { randomUUID } from 'node:crypto'
import type { Context } from '@deepseek-ai/cordis'
import { brandString } from '@deepseek-ai/dsh-brand'
import { installModelSelection } from '@deepseek-ai/dsh-agent'
import type { Agent, ModelSelectionRef } from '@deepseek-ai/dsh-agent'
import type {} from '@deepseek-ai/dsh-agent-default-model'
import { createUserMessage } from '@deepseek-ai/dsh-llm'
import { SessionSeq } from '@deepseek-ai/dsh-session'
import type { Session, SessionEvent, SessionId, SessionLogOffset } from '@deepseek-ai/dsh-session'
import type {} from '@deepseek-ai/cordis-plugin-loader'

/** HTTP + run options resolved from the Cordis plugin Config. */
export interface AgentHttpOptions {
  host: string
  port: number
  cwd: string
  provider?: string
  model?: string
  maxTokens?: number
  /** CORS origin allowlist; empty means any origin (`*`). */
  allowedOrigins?: string[]
  /** Optional bearer token; when set, `/run`* require `Authorization: Bearer <token>`. */
  accessToken?: string
}

/** Minimal handle shape the registry needs from `agents.create`/`agents.resume`. */
export interface AgentSessionHandle {
  readonly agent: Agent
  dispose(): Promise<unknown>
}

/** Raised when a run targets a session that already has a turn in flight. */
export class SessionBusyError extends Error {
  constructor(sessionId: string) {
    super(`agent-http: session ${sessionId} is busy with another turn`)
    this.name = 'SessionBusyError'
  }
}

/** Raised when a requested session id is neither live nor persisted on disk. */
export class SessionNotFoundError extends Error {
  constructor(sessionId: string) {
    super(`agent-http: session ${sessionId} not found (not live and not persisted)`)
    this.name = 'SessionNotFoundError'
  }
}

/** Options handed to each route Fastify plugin. */
export interface AgentHttpPluginOptions {
  ctx: Context
  opts: AgentHttpOptions
  sessions: AgentSessions
}

/** Aggregate the last assistant text committed after `firstSeq`. */
export function summarize(session: Session, firstSeq: SessionLogOffset): string {
  let started = false
  let text = ''
  const length = session.seq
  for (let seq = firstSeq; seq < length; seq++) {
    const event = session.eventAt(SessionSeq(seq))
    if (event === undefined) continue
    if (event.type === 'turn/start') {
      started = true
      continue
    }
    if (!started) continue
    if (event.type === 'assistant/message') {
      const joined = event.data.message.content
        .filter(block => block.type === 'text')
        .map(block => block.text)
        .join('')
      if (joined !== '') text = joined
    }
    if (event.type === 'turn/end' && event.data.reason?.kind === 'error') {
      text = `${text}\n[${event.data.reason.error.code}] ${event.data.reason.error.message}`.trim()
    }
  }
  return text
}

/** Forward live text deltas of one owned agent to a sink until disposed. */
export function forwardDeltas(ctx: Context, agent: Agent, emit: (text: string) => void): () => void {
  return ctx.on('agent/assistant-stream', ({ agent: subject, frame }) => {
    if (subject !== agent || frame.type !== 'chunk') return
    const chunk = frame.chunk
    if (chunk.type === 'text-delta' && chunk.text !== '') emit(chunk.text)
  })
}

/** Curated execution node forwarded to streaming clients. */
export interface SessionNode {
  type: string
  name?: string
  args?: string
  error?: string
}

function capArgs(value: string): string {
  return value.length > 400 ? value.slice(0, 400) + '…' : value
}

/** Reduce one session event to a small, renderable execution node (or nothing). */
function curateNode(event: SessionEvent): SessionNode | undefined {
  switch (event.type) {
    case 'turn/start':
    case 'step/start':
    case 'step/end':
    case 'turn/end':
      return { type: event.type }
    case 'tool/call':
      return { type: 'tool/call', name: event.data.name, args: capArgs(event.data.arguments) }
    case 'tool/result':
      return { type: 'tool/result', ...(event.data.error === undefined ? {} : { error: event.data.error.code }) }
    default:
      return undefined
  }
}

/** Forward one agent's execution nodes and status transitions until disposed. */
export function forwardNodes(
  ctx: Context,
  agent: Agent,
  onNode: (node: SessionNode) => void,
  onStatus?: (status: 'idle' | 'running') => void,
): () => void {
  const stopEvents = ctx.on('session/event', (session, event) => {
    if (session.id !== agent.session.id) return
    const node = curateNode(event)
    if (node !== undefined) onNode(node)
  })
  const stopStatus = onStatus === undefined
    ? undefined
    : ctx.on('agent/status', ({ agent: subject, status }) => {
      if (subject !== agent) return
      onStatus(status)
    })
  return () => {
    stopEvents()
    stopStatus?.()
  }
}

interface SessionEntry {
  id: string
  handle: AgentSessionHandle
  busy: boolean
}

/**
 * Per-app registry of live agents. One turn at a time per session; idle agents
 * are reused across requests, and persisted sessions can be resumed after a
 * restart until the cap evicts them.
 */
export class AgentSessions {
  private readonly entries = new Map<string, SessionEntry>()
  private readonly order: string[] = []

  constructor(private readonly cap: number = 64) {}

  /** Number of live agent sessions in the registry. */
  size(): number {
    return this.entries.size
  }

  private insert(handle: AgentSessionHandle, id: string): SessionEntry {
    const entry: SessionEntry = { id, handle, busy: false }
    this.entries.set(id, entry)
    this.order.push(id)
    return entry
  }

  private routeOptions(ctx: Context, opts: AgentHttpOptions): {
    selection: ModelSelectionRef
    agentOptions: { provider: string; model: string; maxTokens?: number }
  } {
    const defaultModel = ctx.get('agentDefaultModel')
    if (defaultModel === undefined) throw new Error('agent-http: profile does not provide agentDefaultModel service')
    const current = defaultModel.currentSelection()
    const selection: ModelSelectionRef = { current, assembled: undefined }
    const provider = opts.provider ?? current.provider
    const model = opts.model ?? current.model
    return {
      selection,
      agentOptions: {
        provider,
        model,
        ...(opts.maxTokens === undefined ? {} : { maxTokens: opts.maxTokens }),
      },
    }
  }

  /** Create a brand-new session and return its entry. */
  private async create(ctx: Context, opts: AgentHttpOptions): Promise<SessionEntry> {
    const agents = ctx.get('agents')
    if (agents === undefined) throw new Error('agent-http: profile does not provide agents service')
    const { selection, agentOptions } = this.routeOptions(ctx, opts)
    const sessionId = brandString<SessionId>(`agent-http-${randomUUID()}`)
    const handle = (await agents.create({
      sessionId,
      meta: { cwd: opts.cwd },
      agentOptions,
      setup: (agentCtx) => {
        installModelSelection(agentCtx, selection)
      },
    })) as AgentSessionHandle
    return this.insert(handle, String(sessionId))
  }

  /** Resume a persisted session by id through `agents.resume`. */
  private async resume(ctx: Context, opts: AgentHttpOptions, id: string): Promise<SessionEntry> {
    const agents = ctx.get('agents')
    if (agents === undefined) throw new Error('agent-http: profile does not provide agents service')
    const { agentOptions } = this.routeOptions(ctx, opts)
    let handle: AgentSessionHandle
    try {
      handle = (await agents.resume({
        resumeSessionId: brandString<SessionId>(id),
        agentOptions,
      })) as AgentSessionHandle
    } catch {
      throw new SessionNotFoundError(id)
    }
    return this.insert(handle, id)
  }

  /** Evict oldest idle sessions above the cap. */
  private async trim(): Promise<void> {
    while (this.entries.size > this.cap && this.order.length > 0) {
      const id = this.order.shift() as string
      const entry = this.entries.get(id)
      if (entry === undefined || entry.busy) continue
      this.entries.delete(id)
      try {
        await entry.handle.dispose()
      } catch {
        // eviction is best-effort
      }
    }
  }

  /**
   * Run one turn. Resolution order: reuse a live idle session named by
   * `requestedId`, resume the persisted session when it exists on disk, or
   * create a fresh session when no id is given.
   */
  async run(
    ctx: Context,
    opts: AgentHttpOptions,
    prompt: string,
    requestedId: string | undefined,
    onDelta?: (text: string) => void,
    onNode?: (node: SessionNode) => void,
    onStatus?: (status: 'idle' | 'running') => void,
  ): Promise<{ sessionId: string; text: string }> {
    await ctx.get('loader')?.await()
    let entry = requestedId === undefined ? undefined : this.entries.get(requestedId)
    if (entry === undefined) {
      entry = requestedId === undefined
        ? await this.create(ctx, opts)
        : await this.resume(ctx, opts, requestedId)
    }
    if (entry.busy) throw new SessionBusyError(entry.id)
    entry.busy = true
    try {
      await entry.handle.agent.whenIdle()
      const firstSeq = entry.handle.agent.session.seq
      const stopDeltas = onDelta ? forwardDeltas(ctx, entry.handle.agent, onDelta) : undefined
      const stopNodes = onNode !== undefined || onStatus !== undefined
        ? forwardNodes(ctx, entry.handle.agent, onNode ?? (() => {}), onStatus)
        : undefined
      try {
        entry.handle.agent.followup(createUserMessage({
          content: [{ type: 'text', text: prompt }],
          source: { kind: 'user' },
        }))
        await entry.handle.agent.whenIdle()
      } finally {
        stopDeltas?.()
        stopNodes?.()
      }
      const sessions = ctx.get('sessions')
      if (sessions !== undefined) await sessions.flush(entry.handle.agent.session)
      return { sessionId: entry.id, text: summarize(entry.handle.agent.session, firstSeq) }
    } finally {
      entry.busy = false
      await this.trim()
    }
  }

  /** Flush and dispose every live agent; call on app close. */
  async disposeAll(ctx: Context): Promise<void> {
    const sessions = ctx.get('sessions')
    const entries = [...this.entries.values()]
    this.entries.clear()
    this.order.length = 0
    await Promise.all(entries.map(async (entry) => {
      try {
        if (sessions !== undefined) await sessions.flush(entry.handle.agent.session)
        await entry.handle.dispose()
      } catch {
        // best-effort teardown
      }
    }))
  }
}
