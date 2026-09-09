---
description: "暴露进程内 agent 于 HTTP 之上的包地图：agent-http bundle + HTTP 服务插件。"
kind: "package-group"
---

# agent-http/ — HTTP agent 服务

[English](README.md) | 中文

## Summary

`agent-http/` 组用普通 HTTP 暴露当前 dsh 进程内运行的 agent。该组唯一的包既是 bundle 又是插件：叠在 `dsh-base` 之上后，它启动一个 HTTP 服务器驱动进程内 agent，并返回或流式输出答案。本页负责组地图；各包契约以包 README 为准。

## Table of Contents

- [Packages](#packages)
- [Dev Note](#dev-note)

-----

<a id="packages"></a>
## Packages

| Package | Role |
|---|---|
| [`agent-http/`](agent-http/README.zh.md) | Bundle + 插件：面向进程内 agent 的 HTTP `/run` 与流式 `/run/stream` |

-----

<a id="dev-note"></a>
## Dev Note

None.
