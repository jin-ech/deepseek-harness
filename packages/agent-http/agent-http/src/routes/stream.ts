/**
 * Fastify route plugin: `POST /run/stream` — server-sent events for one turn.
 *
 * Uses `@fastify/sse` (`sse: 'manual'` since the stream is requested by JSON
 * body, not an Accept header). Streams `delta` frames (text deltas from
 * `agent/assistant-stream`), then a final `done` with `{ sessionId, text }`,
 * or `error` when the turn fails or the session is unknown/busy.
 *
 * @module @deepseek-ai/dsh-agent-http/routes/stream
 */

import type { FastifyInstance } from 'fastify'
import { SessionBusyError, SessionNotFoundError, type AgentHttpPluginOptions } from '../drive.ts'

const bodySchema = {
  type: 'object',
  properties: {
    prompt: { type: 'string', minLength: 1 },
    sessionId: { type: 'string' },
  },
  required: ['prompt'],
  additionalProperties: false,
} as const

/** Register the SSE streaming route. */
export async function streamRoutes(app: FastifyInstance, options: AgentHttpPluginOptions): Promise<void> {
  const { ctx, opts, sessions } = options
  app.post('/run/stream', { schema: { body: bodySchema }, sse: 'manual' }, async (request, reply) => {
    const body = request.body as { prompt: string; sessionId?: string }
    const sse = reply.sse
    let aborted = false
    sse.onClose(() => { aborted = true })
    // Serialize writes so frames leave in order; never reject on a closed socket.
    let chain: Promise<void> = Promise.resolve()
    const send = (event: string, data: unknown): void => {
      chain = chain.then(() => sse.send({ event, data })).catch(() => {})
    }
    try {
      const result = await sessions.run(
        ctx, opts, body.prompt, body.sessionId,
        (text) => { if (!aborted) send('delta', { text }) },
        (node) => { if (!aborted) send('node', node) },
        (status) => { if (!aborted) send('status', { status }) },
      )
      send('done', { sessionId: result.sessionId, text: result.text })
    } catch (error) {
      const message = error instanceof SessionBusyError || error instanceof SessionNotFoundError
        ? error.message
        : error instanceof Error ? error.message : String(error)
      send('error', { message })
    } finally {
      await chain.catch(() => {})
      // sse: 'manual' closes the connection when the handler resolves.
    }
  })
}
