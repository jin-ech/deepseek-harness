/**
 * dsh-memory-evolve uses its own build script (scripts/build.mjs) that
 * produces lib/index.js and lib/client.js directly. The root tsdown
 * workspace pass expects lib/types/{index,invariant,startup}.js entries
 * from tsc — this package has none. Point tsdown at the already-built
 * host entry so the workspace pass finds a valid input and re-emits it
 * unchanged (the file is already bundled ESM).
 */
import { defineConfig } from 'tsdown'

export default defineConfig({
  entry: ['lib/index.js'],
  outDir: 'lib',
  clean: false,
  format: ['esm'],
  platform: 'node',
  target: 'es2024',
  dts: false,
})
