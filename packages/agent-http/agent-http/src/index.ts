/**
 * HTTP server plugin that exposes the in-process agent over Fastify.
 *
 * Mount it on a profile that composes an agent + session + model (for example
 * `dsh-base` plus this bundle). The HTTP layer is Fastify; routes live in
 * per-route Fastify plugins under `src/routes/`. Each `POST /run` creates a
 * fresh Agent through the core registry, follows up with the prompt, waits for
 * quiescence, flushes its Session, and returns the final assistant text.
 * `POST /run/stream` additionally relays `agent/assistant-stream` text deltas
 * over server-sent events, so the browser sees the answer as it is generated.
 *
 * The plugin owns no model adapter or session persistence — it reuses the
 * surrounding composition, exactly like the one-shot headless runner.
 *
 * @module @deepseek-ai/dsh-agent-http
 */

import type { Context } from '@deepseek-ai/cordis'
import type { FastifyInstance } from 'fastify'
import z from '@deepseek-ai/schemastery'
import { buildAgentHttpApp } from './app.ts'
import type { AgentHttpOptions } from './drive.ts'

/** Stable Cordis plugin name shown in loader diagnostics. */
export const name = 'agent-http-server'

/** Plugin config: listener host/port and optional model overrides. */
export interface Config {
  /** Listen host. Loopback by default; bind `0.0.0.0` for LAN exposure. */
  host?: string
  /** Listen port. */
  port?: number
  /** Optional provider route override; defaults to the deployment selection. */
  provider?: string
  /** Optional model override; defaults to the deployment selection. */
  model?: string
  /** Optional per-request output token cap. */
  maxTokens?: number
  /** CORS origin allowlist; empty means any origin (`*`). */
  allowedOrigins?: string[]
  /** Optional bearer token; when set, `/run`* require `Authorization: Bearer <token>`. */
  accessToken?: string
  /** Workspace cwd recorded on created sessions. */
  cwd?: string
}

export const Config: z<Config> = z.object({
  host: z.string().default('127.0.0.1'),
  port: z.number().default(8787),
  provider: z.string(),
  model: z.string(),
  maxTokens: z.number(),
  allowedOrigins: z.array(z.string()).default([]),
  accessToken: z.string(),
  cwd: z.string().default(process.cwd()),
})

/** Build the app options, omitting absent optional fields (exactOptionalPropertyTypes). */
function resolveHttpOptions(config: Config): AgentHttpOptions {
  const host = config.host ?? '127.0.0.1'
  const port = config.port ?? 8787
  const cwd = config.cwd ?? process.cwd()
  return {
    host,
    port,
    cwd,
    ...(config.provider === undefined ? {} : { provider: config.provider }),
    ...(config.model === undefined ? {} : { model: config.model }),
    ...(config.maxTokens === undefined ? {} : { maxTokens: config.maxTokens }),
    ...(config.allowedOrigins === undefined ? {} : { allowedOrigins: config.allowedOrigins }),
    ...(config.accessToken === undefined ? {} : { accessToken: config.accessToken }),
  }
}

/** Start the Fastify app; its lifecycle follows the plugin fiber. */
export function apply(ctx: Context, config: Config): void {
  const opts = resolveHttpOptions(config)
  if (!Number.isInteger(opts.port) || opts.port < 1 || opts.port > 65535) {
    throw new Error('agent-http: port must be an integer between 1 and 65535')
  }
  ctx.effect(() => {
    let app: FastifyInstance | undefined
    void buildAgentHttpApp(ctx, opts)
      .then(async (instance) => {
        app = instance
        return instance.listen({ host: opts.host, port: opts.port })
      })
      .then(() => {
        console.error(`[agent-http] listening on http://${opts.host}:${opts.port}`)
      })
      .catch((error: unknown) => {
        const message = error instanceof Error ? error.message : String(error)
        console.error(`[agent-http] listen failed: ${message}`)
      })
    return async () => {
      if (app === undefined) return
      try {
        await app.close()
      } catch (error) {
        const message = error instanceof Error ? error.message : String(error)
        ctx.logger.warn(`agent-http: close failed: ${message}`)
      }
    }
  })
}
