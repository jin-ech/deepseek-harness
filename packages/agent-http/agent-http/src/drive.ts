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

/** Forward live text and reasoning deltas of one owned agent to sinks until disposed. */
export function forwardDeltas(
  ctx: Context,
  agent: Agent,
  emitText: (text: string) => void,
  emitReasoning?: (text: string) => void,
): () => void {
  return ctx.on('agent/assistant-stream', ({ agent: subject, frame }) => {
    if (subject !== agent || frame.type !== 'chunk') return
    const chunk = frame.chunk
    if (chunk.type === 'text-delta' && chunk.text !== '') emitText(chunk.text)
    else if (chunk.type === 'reasoning-delta' && chunk.text !== '' && emitReasoning !== undefined) {
      emitReasoning(chunk.text)
    }
  })
}

/** The presentation meta a `tool/result` event persists for UI bridges. */
type ToolResultMeta = Exclude<Extract<SessionEvent, { type: 'tool/result' }>['data']['meta'], undefined>

/** Curated execution node forwarded to streaming clients. */
export interface SessionNode {
  type: string
  /** Turn number (1-based). */
  turn?: number
  /** Step number within the turn (1-based). */
  step?: number
  /** Tool name for tool/call and tool/result nodes. */
  name?: string
  /** Capped tool arguments JSON for tool/call nodes. */
  args?: string
  /** Extracted file path from tool arguments (read/edit/write/glob/grep). */
  filePath?: string
  /** Short human-readable summary of the tool result. */
  summary?: string
  /** Error code for failed tool results. */
  error?: string
  /** Tool-private presentation payload (e.g. a chart option), forwarded verbatim. */
  meta?: ToolResultMeta
  /** Token usage from assistant/message events. */
  usage?: { input: number; output: number; total: number }
  /** Reasoning/thinking text accumulated for this step. */
  reasoning?: string
}

function capArgs(value: string): string {
  return value.length > 400 ? value.slice(0, 400) + '…' : value
}

/** Extract a file path from common tool argument JSON (read/edit/write/glob/grep). */
function extractFilePath(_name: string, argsJson: string): string | undefined {
  try {
    const parsed = JSON.parse(argsJson) as Record<string, unknown>
    // Common field names across fs tools
    const path = parsed.file_path ?? parsed.path ?? parsed.pattern
    if (typeof path === 'string' && path.length > 0) {
      // Shorten absolute paths to relative-like display
      const cwd = process.cwd()
      return path.startsWith(cwd) ? path.slice(cwd.length + 1) : path
    }
  } catch { /* not parseable — skip */ }
  return undefined
}

/** Produce a short summary from tool result content blocks. */
function summarizeToolResult(
  content: readonly { type: string; text?: string; content?: readonly { type: string; text?: string }[] }[],
): string | undefined {
  for (const block of content) {
    // Tool result messages wrap their blocks one level deep under a `tool-result` envelope.
    const parts = block.type === 'tool-result' ? block.content ?? [] : [block]
    for (const part of parts) {
      if (part.type === 'text' && typeof part.text === 'string') {
        const text = part.text.trim()
        if (text.length === 0) continue
        // Take first meaningful line, capped
        const firstLine = text.split('\n').find(l => l.trim().length > 0) ?? text
        return firstLine.length > 120 ? firstLine.slice(0, 120) + '…' : firstLine
      }
    }
  }
  return undefined
}

/** Reduce one session event to a small, renderable execution node (or nothing). */
function curateNode(event: SessionEvent): SessionNode | undefined {
  switch (event.type) {
    case 'turn/start':
      return { type: event.type, turn: event.data.turn }
    case 'step/start':
      return { type: event.type, turn: event.data.turn, step: event.data.step }
    case 'step/end':
      return { type: event.type, turn: event.data.turn, step: event.data.step }
    case 'turn/end':
      return { type: event.type, turn: event.data.turn }
    case 'tool/call': {
      const filePath = extractFilePath(event.data.name, event.data.arguments)
      return {
        type: 'tool/call',
        turn: event.data.turn,
        step: event.data.step,
        name: event.data.name,
        args: capArgs(event.data.arguments),
        ...(filePath !== undefined ? { filePath } : {}),
      }
    }
    case 'tool/result': {
      const summary = summarizeToolResult(event.data.message.content)
      return {
        type: 'tool/result',
        turn: event.data.turn,
        step: event.data.step,
        ...(summary !== undefined ? { summary } : {}),
        ...(event.data.error === undefined ? {} : { error: event.data.error.code }),
        ...(event.data.meta === undefined ? {} : { meta: event.data.meta }),
      }
    }
    case 'assistant/message': {
      const usage = event.data.usage
      return {
        type: 'assistant/message',
        turn: event.data.turn,
        step: event.data.step,
        ...(usage !== undefined
          ? {
            usage: {
              input: usage.inputTokens,
              output: usage.outputTokens,
              total: usage.totalTokens ?? (usage.inputTokens + usage.outputTokens),
            },
          }
          : {}),
      }
    }
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
    onReasoning?: (text: string) => void,
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
      const stopDeltas = onDelta !== undefined || onReasoning !== undefined
        ? forwardDeltas(ctx, entry.handle.agent, onDelta ?? (() => {}), onReasoning)
        : undefined
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
