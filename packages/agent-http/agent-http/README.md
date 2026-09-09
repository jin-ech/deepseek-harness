---
description: "HTTP server plugin exposing the in-process agent: JSON /run and SSE /run/stream over an agent + session profile."
kind: "package-reference"
---

# @deepseek-ai/dsh-agent-http

English | [中文](README.zh.md)

## Summary

Mount this bundle to expose the agent running in this process over plain HTTP. It is both a bundle and a plugin: the bundle patch inserts the `agent-http-server` row, and the plugin starts an HTTP server that drives the in-process agent through the core registry — exactly like the one-shot headless runner, but reachable by clients. `POST /run` returns the final assistant text; `POST /run/stream` streams `agent/assistant-stream` text deltas over server-sent events. The plugin reuses the surrounding composition for agents, sessions, and model selection; it owns no adapter or persistence.

## Table of Contents

- [Use this package](#use-this-package)
- [Model Experience](#model-experience)
- [Known Limitations and Deferred Work](#known-limitations-and-deferred-work)
- [Dev Note](#dev-note)

-----

<a id="use-this-package"></a>
## Use this package

Add the bundle to a profile that composes `dsh-base`, then launch it:

```sh
dsh --profile agent-http
```

| Field | Default | Meaning |
|---|---|---|
| `host` | `127.0.0.1` | Listen host; bind `0.0.0.0` for LAN access |
| `port` | `8787` | Listen port |
| `provider` / `model` | deployment default | Optional model route override |
| `maxTokens` | — | Optional output token cap per request |
| `cwd` | `process.cwd()` | Workspace cwd recorded on created sessions |

Endpoints:

```sh
curl http://127.0.0.1:8787/health
curl -s http://127.0.0.1:8787/run -H 'content-type: application/json' -d '{"prompt":"hi"}'
curl -N http://127.0.0.1:8787/run/stream -H 'content-type: application/json' -d '{"prompt":"hi"}'
```

Each request creates a fresh agent Session and disposes it after the turn settles.

-----

<a id="model-experience"></a>
## Model Experience

### Tool schemas

#### What the model sees

Nothing beyond the surrounding profile's normal tools; this plugin adds no model-facing tool.

#### Token effect

No direct token effect; created sessions follow ordinary conversation history.

#### KV Cache effect

None; every request opens a fresh session.

-----

<a id="known-limitations-and-deferred-work"></a>
## Known Limitations and Deferred Work

- **Session reuse and resume** — pass a returned `sessionId` to continue that session; live sessions cap at 64 and persisted sessions can be resumed by id after a restart.
- **No authentication** — plain HTTP, loopback by default; bind and authenticate deliberately before exposure.
- **Blocking single turn** — `/run` waits for agent quiescence; only the stream endpoint pushes live deltas.

-----

<a id="dev-note"></a>
## Dev Note

None.
