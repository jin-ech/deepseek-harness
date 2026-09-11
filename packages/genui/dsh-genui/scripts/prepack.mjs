#!/usr/bin/env node
/**
 * Cross-platform `prepack` wrapper: rebuild lib before packing, but keep the
 * build's stdout OFF the process stdout. `npm pack --json` parses stdout as
 * JSON, so any tsdown banner leaking to stdout corrupts the pack gate and
 * tooling that drives npm pack programmatically. Build progress is forwarded
 * to stderr instead.
 *
 * When lib/ already contains compiled output (e.g. built by the workspace
 * toolchain with a newer TypeScript), skip the rebuild to avoid re-compiling
 * with an older bundled TypeScript that may not support the tsconfig options.
 */
import { spawnSync } from 'node:child_process'
import { existsSync } from 'node:fs'
import { join, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const libEntry = join(__dirname, '..', 'lib', 'index.js')

if (existsSync(libEntry)) {
  process.stderr.write('[prepack] lib/ already built — skipping rebuild\n')
} else {
  const isWindows = process.platform === 'win32'
  const result = spawnSync(
    isWindows ? (process.env.ComSpec || 'cmd.exe') : 'pnpm',
    isWindows
      ? ['/d', '/s', '/c', 'pnpm run build']
      : ['run', 'build'],
    {
      env: process.env,
      stdio: ['ignore', 'pipe', 'pipe'],
    },
  )

  if (result.stdout?.length) process.stderr.write(result.stdout)
  if (result.stderr?.length) process.stderr.write(result.stderr)
  if (result.error) throw result.error
  if (result.status !== 0) process.exit(result.status ?? 1)
}
