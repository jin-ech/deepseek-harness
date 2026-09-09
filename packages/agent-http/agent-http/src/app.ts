/**
 * Fastify application assembly for @deepseek-ai/dsh-agent-http.
 *
 * `buildAgentHttpApp` constructs a Fastify instance, registers `@fastify/cors`,
 * owns one `AgentSessions` registry (disposed on close), and mounts the
 * per-route Fastify plugins under the Cordis context. Framework-agnostic of
 * Cordis — the plugin entry passes the `ctx` it boots under.
 *
 * @module @deepseek-ai/dsh-agent-http/app
 */

import Fastify, { type FastifyInstance } from 'fastify'
import cors from '@fastify/cors'
import fastifySse from '@fastify/sse'
import fastifyStatic from '@fastify/static'
import { fileURLToPath } from 'node:url'
import type { Context } from '@deepseek-ai/cordis'
import { AgentSessions, type AgentHttpOptions } from './drive.ts'
import { healthRoutes } from './routes/health.ts'
import { runRoutes } from './routes/run.ts'
import { streamRoutes } from './routes/stream.ts'

/** Build the Fastify app: pino logger to stderr, CORS + SSE, route plugins. */
export async function buildAgentHttpApp(ctx: Context, opts: AgentHttpOptions): Promise<FastifyInstance> {
  const app = Fastify({
    logger: { level: 'info', stream: process.stderr },
  })
  const sessions = new AgentSessions()
  app.addHook('onClose', async () => { await sessions.disposeAll(ctx) })
  // Browser pages are cross-origin by design; @fastify/cors answers preflight
  // (OPTIONS -> 204) and attaches allow headers to every response. An empty
  // allowlist means any origin; otherwise only the listed origins are admitted.
  const corsOrigin = opts.allowedOrigins && opts.allowedOrigins.length > 0
    ? opts.allowedOrigins
    : '*'
  await app.register(cors, {
    origin: corsOrigin,
    methods: ['GET', 'POST', 'OPTIONS'],
    allowedHeaders: ['content-type', 'authorization'],
  })
  // Token allowlist: when configured, only clients presenting the bearer token
  // may drive an agent turn.
  const accessToken = opts.accessToken
  if (accessToken !== undefined && accessToken !== '') {
    app.addHook('onRequest', async (request, reply) => {
      if (request.method !== 'POST' || !(request.url === '/run' || request.url === '/run/stream')) return
      if (request.headers.authorization !== `Bearer ${accessToken}`) {
        return reply.code(401).send({ error: 'unauthorized' })
      }
    })
  }
  await app.register(fastifySse)
  // Serve the call page from the same origin so the browser never needs CORS;
  // @fastify/cors above still covers a page opened straight from file://.
  await app.register(fastifyStatic, {
    root: fileURLToPath(new URL('../static', import.meta.url)),
    index: ['index.html'],
    // The call page is a live debugging surface; never let a browser cache it.
    cacheControl: false,
    setHeaders: (res, path) => {
      if (path.endsWith('index.html')) res.setHeader('cache-control', 'no-store')
    },
  })
  await app.register(healthRoutes, { ctx, opts, sessions })
  await app.register(runRoutes, { ctx, opts, sessions })
  await app.register(streamRoutes, { ctx, opts, sessions })
  app.setNotFoundHandler(async (_request, reply) => reply.code(404).send({ error: 'not found' }))
  return app
}
