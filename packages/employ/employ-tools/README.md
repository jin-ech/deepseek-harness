---
description: "Model-facing employment management query tools (base, person, contract, clue) over the Guohua employment HTTP API."
kind: "package-reference"
---

# @deepseek-ai/dsh-employ-tools

English | [中文](README.zh.md)

## Summary

Register this plugin to let agents answer questions about the Guohua employment system. Four read-only tools — `query_employ_store`, `query_employ_person`, `query_employ_contract`, and `query_employ_clue` — page over the base, person, contract, and clue list endpoints and return the matching rows. Every request authenticates with the access token as the `token` header, mirrored as an `access_token` cookie and carrying the tenant scope as the `system-id` header; a non-zero envelope `code` fails the call with the server's message.

## Table of Contents

- [Mount and configure](#mount-and-configure)
- [Model Experience](#model-experience)
- [Known Limitations and Deferred Work](#known-limitations-and-deferred-work)
- [Dev Note](#dev-note)

-----

<a id="mount-and-configure"></a>
## Mount and configure

Mount the plugin wherever agents call tools; it registers four tools on `ctx.tools`.

```yaml
- name: '@deepseek-ai/dsh-employ-tools'
```

| Field | Default | Meaning |
|---|---|---|
| `baseUrl` | `http://operate.test.guohualinks.com/employmentapi` | API base URL, no trailing slash |
| `accessToken` | hardcoded test token | Login token sent as the `token` header (and mirrored as the `access_token` cookie) |
| `systemId` | `gh0001` | `system-id` header carrying the tenant scope for role resolution |
| `timeoutMs` | `30000` | Cooperative request timeout budget in milliseconds |
| `maxPageSize` | `100` | Upper bound on one page of results |

Each tool takes an open `filters` object merged into the query string plus `page` and `page_size`. The description lists the common filter keys for that endpoint, and empty, null, or undefined values are omitted.

-----

<a id="model-experience"></a>
## Model Experience

### Tool schemas

#### What the model sees

Four visible tools, each exposing the exact name, description, and JSON schema: an open `filters` object, an optional `page`, and an optional `page_size`. The description names the endpoint's common filter keys and value meanings.

#### Token effect

Fixed per-request cost proportional to the four schemas.

#### KV Cache effect

Prefix-stable while the four definitions and their order are unchanged.

### Tool results

#### What the model sees

A count summary line plus the endpoint's paged `data` payload (`count`, `pageSize`, `list`) as JSON. A non-zero envelope `code` returns `Error: <message> (code <n>)`.

#### Token effect

Data-dependent result tokens, resent until compaction.

#### KV Cache effect

Append-only; results follow the reusable request prefix.

-----

<a id="known-limitations-and-deferred-work"></a>
## Known Limitations and Deferred Work

- **Test endpoint and token only** — the default base URL and access token are short-lived test values; a real deployment must override both from `cordis.yml`.
- **Read-only queries only** — no create, update, or delete operations are exposed.
- **Flat filters only** — nested or structured query values are not supported; pass primitive values per key.

-----

<a id="dev-note"></a>
## Dev Note

None.
