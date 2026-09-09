/**
 * Fastify route plugin: `GET /health`.
 *
 * @module @deepseek-ai/dsh-agent-http/routes/health
 */

import type { FastifyInstance } from 'fastify'
import type { AgentHttpPluginOptions } from '../drive.ts'

/** Register the health check route. */
export async function healthRoutes(app: FastifyInstance, options: AgentHttpPluginOptions): Promise<void> {
  const { ctx, sessions } = options
  app.get('/health', async () => {
    const services = ['agents', 'sessions', 'agentDefaultModel'].filter(s => ctx.get(s) !== undefined)
    return { ok: true, ready: services.length === 3, services, liveSessions: sessions.size() }
  })
}
