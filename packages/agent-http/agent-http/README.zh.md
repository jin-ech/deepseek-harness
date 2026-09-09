---
description: "暴露进程内 agent 的 HTTP 服务插件：在 agent + session profile 上提供 JSON /run 与 SSE /run/stream。"
kind: "package-reference"
---

# @deepseek-ai/dsh-agent-http

[English](README.md) | 中文

## Summary

挂载本 bundle 即可用普通 HTTP 暴露当前进程内运行的 agent。它既是 bundle 又是插件：bundle patch 插入 `agent-http-server` 行，插件启动一个 HTTP 服务器，通过核心注册表驱动进程内 agent——与一次性 headless runner 完全一致，但可被客户端访问。`POST /run` 返回最终 assistant 文本；`POST /run/stream` 以 server-sent events 流式转发 `agent/assistant-stream` 的文本增量。插件复用周边组合提供 agents、sessions 与模型选择；它本身不拥有适配器或持久化。

## Table of Contents

- [使用本包](#use-this-package)
- [Model Experience](#model-experience)
- [Known Limitations and Deferred Work](#known-limitations-and-deferred-work)
- [Dev Note](#dev-note)

-----

<a id="use-this-package"></a>
## 使用本包

把该 bundle 加进一个组合了 `dsh-base` 的 profile，然后启动：

```sh
dsh --profile agent-http
```

| 字段 | 默认值 | 含义 |
|---|---|---|
| `host` | `127.0.0.1` | 监听地址；局域网访问绑定 `0.0.0.0` |
| `port` | `8787` | 监听端口 |
| `provider` / `model` | 部署默认 | 可选模型路由覆盖 |
| `maxTokens` | — | 每次请求可选输出 token 上限 |
| `cwd` | `process.cwd()` | 建会话时记录的工作区 cwd |

接口：

```sh
curl http://127.0.0.1:8787/health
curl -s http://127.0.0.1:8787/run -H 'content-type: application/json' -d '{"prompt":"hi"}'
curl -N http://127.0.0.1:8787/run/stream -H 'content-type: application/json' -d '{"prompt":"hi"}'
```

每次请求创建全新 agent Session，turn 结束后释放。

-----

<a id="model-experience"></a>
## Model Experience

### Tool schemas

#### What the model sees

除周边 profile 的正常工具外没有额外内容；本插件不注册任何面向模型的工具。

#### Token effect

无直接 token 影响；新建会话按普通对话历史增长。

#### KV Cache effect

无；每次请求都开启全新会话。

-----

<a id="known-limitations-and-deferred-work"></a>
## Known Limitations and Deferred Work

- **会话复用与恢复** — 传入上次返回的 `sessionId` 可续聊，重启后也能按 ID 从落盘 JSONL 恢复；进程内存活上限 64。
- **无认证** — 纯 HTTP，默认只绑回环；对外暴露前请自行绑定与鉴权。
- **单轮阻塞** — `/run` 等待 agent 收敛；只有流式端点会实时推送增量。

-----

<a id="dev-note"></a>
## Dev Note

None.
