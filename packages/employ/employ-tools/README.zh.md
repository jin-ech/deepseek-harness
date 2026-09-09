---
description: "面向模型的国华就业管理查询工具（基地、人员、合同、线索），基于国华就业 HTTP API。"
kind: "package-reference"
---

# @deepseek-ai/dsh-employ-tools

[English](README.md) | 中文

## Summary

挂载本插件后，agent 可以回答国华就业系统相关问题。四个只读工具——`query_employ_store`、`query_employ_person`、`query_employ_contract`、`query_employ_clue`——分别分页查询基地、人员、合同、线索列表并返回匹配行。每次请求以 `token` 头携带访问令牌（并镜像为 `access_token` cookie）、以 `system-id` 头携带租户范围；当响应信封的 `code` 非零时，调用以服务器返回的 message 失败。

## Table of Contents

- [挂载与配置](#mount-and-configure)
- [Model Experience](#model-experience)
- [Known Limitations and Deferred Work](#known-limitations-and-deferred-work)
- [Dev Note](#dev-note)

-----

<a id="mount-and-configure"></a>
## 挂载与配置

在 agent 调用工具的任何组合中挂载本插件；它在 `ctx.tools` 上注册四个工具。

```yaml
- name: '@deepseek-ai/dsh-employ-tools'
```

| 字段 | 默认值 | 含义 |
|---|---|---|
| `baseUrl` | `http://operate.test.guohualinks.com/employmentapi` | API 基础地址，不带尾部斜杠 |
| `accessToken` | 写死的测试 token | 作为 `token` 头发送（并镜像为 `access_token` cookie）的登录令牌 |
| `systemId` | `gh0001` | `system-id` 请求头，用于角色权限解析（租户范围） |
| `timeoutMs` | `30000` | 协作式请求超时预算，毫秒 |
| `maxPageSize` | `100` | 单页结果条数上限 |

每个工具接收一个开放的 `filters` 对象（合并进查询串）以及 `page`、`page_size`。工具描述列出了该端点常用的筛选键；空值、null、undefined 会被省略。

-----

<a id="model-experience"></a>
## Model Experience

### Tool schemas

#### What the model sees

四个可见工具，各自暴露精确的 name、description 与 JSON schema：一个开放的 `filters` 对象、可选的 `page` 与可选的 `page_size`。description 列出了该端点常用筛选键及其取值含义。

#### Token effect

每次请求的固定开销，与四个 schema 成正比。

#### KV Cache effect

四个定义及其顺序不变时前缀稳定。

### Tool results

#### What the model sees

一行条数摘要加上该端点的分页 `data` 负载（`count`、`pageSize`、`list`）的 JSON。信封 `code` 非零时返回 `Error: <message> (code <n>)`。

#### Token effect

数据依赖的结果 token，压缩前会持续重发。

#### KV Cache effect

仅追加；结果位于可复用的请求前缀之后。

-----

<a id="known-limitations-and-deferred-work"></a>
## Known Limitations and Deferred Work

- **仅测试端点与 token** — 默认 base URL 与 access token 是短时效的测试值；正式部署必须从 `cordis.yml` 覆盖两者。
- **仅只读查询** — 不暴露任何新增、修改、删除操作。
- **仅扁平筛选** — 不支持嵌套或结构化查询值；每个键传原始值。

-----

<a id="dev-note"></a>
## Dev Note

None.
