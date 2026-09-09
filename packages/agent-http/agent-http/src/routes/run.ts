/**
 * Fastify route plugin: `POST /run` — run one turn and return the final text.
 *
 * @module @deepseek-ai/dsh-agent-http/routes/run
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

/** Register the blocking single-turn route. */
export async function runRoutes(app: FastifyInstance, options: AgentHttpPluginOptions): Promise<void> {
  const { ctx, opts, sessions } = options
  app.post('/run', { schema: { body: bodySchema } }, async (request, reply) => {
    const body = request.body as { prompt: string; sessionId?: string }
    try {
      const result = await sessions.run(ctx, opts, body.prompt, body.sessionId)
      return { sessionId: result.sessionId, finalResponse: result.text }
    } catch (error) {
      if (error instanceof SessionBusyError) return reply.code(409).send({ error: error.message })
      if (error instanceof SessionNotFoundError) return reply.code(404).send({ error: error.message })
      throw error
    }
  })
}
