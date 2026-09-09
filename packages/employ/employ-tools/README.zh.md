---
description: "面向模型的国华就业管理只读查询工具（可查任意业务表、按业务关系连表），直接查询国华 MySQL 业务库。"
kind: "package-reference"
---

# @deepseek-ai/dsh-employ-tools

[English](README.md) | 中文

## Summary

挂载本插件后，agent 可以通过直接查询国华就业系统的 MySQL 业务库来回答问题。注册两个只读工具：

- `query_employ_schema` — 列出业务库的表清单，或某张表的字段与可连表关系（读取 `information_schema`，首次使用后缓存）。
- `query_employ` — 对**任意**已发现的表分页查询，支持可选筛选条件和按文档化 `_id` 关系连表。

模型始终不提供 SQL。表名、列名都会作为标识符对照已发现的目录进行校验；筛选值一律以 `?` 占位符绑定；连表仅来自精编的关系映射；关闭 `multipleStatements`；且每条语句执行前都会再次断言只读（单条 `SELECT`）。任何 INSERT、UPDATE、DELETE 或 DDL 都无法触达数据库。

## Table of Contents

- [挂载与配置](#mount-and-configure)
- [Model Experience](#model-experience)
- [Known Limitations and Deferred Work](#known-limitations-and-deferred-work)
- [Dev Note](#dev-note)

-----

<a id="mount-and-configure"></a>
## 挂载与配置

在 agent 调用工具的任何组合中挂载本插件；它在 `ctx.tools` 上注册两个工具。

```yaml
- name: '@deepseek-ai/dsh-employ-tools'
  config:
    host: 47.93.181.192
    user: root
    password: wfn031641
```

| 字段 | 默认值 | 含义 |
|---|---|---|
| `host` | `47.93.181.192` | MySQL 主机 |
| `port` | `3306` | MySQL TCP 端口 |
| `user` | `root` | MySQL 用户（建议使用仅授予 `SELECT` 权限的账号作纵深防御） |
| `password` | `wfn031641` | MySQL 密码；其它环境请从 `cordis.yml` 覆盖 |
| `database` | `guohua_operate_fx_crm` | 存放 `guohua_*` 表的业务库 |
| `charset` | `utf8mb4` | 连接字符集 |
| `connectionLimit` | `5` | 池化连接数上限 |
| `queryTimeoutMs` | `30000` | 协作式查询空闲超时预算，毫秒 |
| `maxPageSize` | `100` | 单页结果条数上限 |

### 筛选条件

`query_employ` 接收一个 `filters` 对象，其键为被查表的列名。标量字符串按不区分大小写的子串匹配（`LIKE %v%`），标量数字/布尔按精确匹配，对象则选择显式操作符：`{ eq: v }`、`{ like: v }`、`{ in: [v1, v2] }`，以及 `{ gte: v }` / `{ lte: v }`（可同时给两个表示区间）。未知列或格式错误的值会显式报错。

### 业务关系连表

连表通过精编映射遵循文档化的 `_id` 命名约定。该映射是唯一的机读来源，位于 [`src/relationships.ts`](src/relationships.ts)，并由 `verify-employ-relationships` 这道 gate 对照 schema 参考 DDL 校验。传 `joins: ["customer_id", "store_id"]` 会以 `LEFT JOIN` 关联对应表并把其名称列追加到每一行。支持的关系如下：

| 外键 | 关联表 | 输出列 |
|---|---|---|
| `customer_id` | `guohua_customer` | `customer_name` |
| `persons_id` | `guohua_persons` | `persons_name` |
| `store_id` / `base_id` | `guohua_store` | `store_name` / `base_name` |
| `contract_id` | `guohua_contract` | `contract_name` |
| `clue_id` | `guohua_customer_opt_clue` | `clue_name` |
| `demand_id` | `guohua_demand` | `demand_sn` |
| `opportunity_id` | `guohua_customer_opportunity` | `opportunity_name` |
| `project_id` / `mission_id` / `service_id` | `guohua_project` / `guohua_mission` / `guohua_service` | `project_name` / `mission_sn` / `service_name` |
| `bill_id` / `payment_id` / `payment_confirm_id` | `guohua_bill` / `guohua_payment` / `guohua_payment_confirm` | `bill_pay_company` / `payment_company` / `payment_confirm_company` |
| `salary_id` / `expend_id` / `match_id` | `guohua_customer_salary` / `guohua_expend` / `guohua_persons_match` | `salary_sn` / `expend_sn` / `match_sn` |
| `employ_demand_id` / `product_order_id` / `store_product_id` | `guohua_employ_demand` / `guohua_store_product_order` / `guohua_store_product` | `employ_demand_sn` / `product_order_num` / `product_name` |

-----

<a id="model-experience"></a>
## Model Experience

### Tool schemas

#### What the model sees

两个可见工具。`query_employ_schema` 暴露可选的 `table`，返回表清单或某张表的字段、主键与可连表关系。`query_employ` 暴露必填的 `table`、可选的 `filters` 对象、可选的 `joins` 数组，以及可选的 `page`/`page_size`。

#### Token effect

每次请求的固定开销，与两个 schema 成正比。

#### KV Cache effect

两个定义及其顺序不变时前缀稳定。

### Tool results

#### What the model sees

`query_employ` 返回一行条数摘要加上分页结果（`count`、`page`、`page_size`、`list`）的 JSON。每行 `list` 包含表本身列以及连表得到的别名名称列。连接、目录发现或查询失败时返回 `Error: <message>`。

#### Token effect

数据依赖的结果 token，压缩前会持续重发。

#### KV Cache effect

仅追加；结果位于可复用的请求前缀之后。

-----

<a id="known-limitations-and-deferred-work"></a>
## Known Limitations and Deferred Work

- **仅只读查询** — 不暴露任何新增、修改、删除或 DDL 操作；插件拒绝任何非单条 `SELECT`。
- **筛选仅限单表** — 筛选键只对被查表本身的列解析；要按关联实体筛选时，先查关联表得到键值，再据此筛选，或用 `joins` 在基础表筛选的同时读出关联名称列。
- **连表扇出** — 连表假定一对一并入；当被引用键不唯一时，`COUNT(DISTINCT …)` 仍正确，但 `list` 行可能重复基础行。
- **目录惰性发现** — 表/列目录在首次使用时从 `information_schema` 读取并缓存；任一工具运行都需要数据库可达。
- **无主键表** — 未声明主键的表以 `COUNT(*)` 分页且无确定性排序。

-----

<a id="dev-note"></a>
## Dev Note

连表目录以纯类型数据的形式存放在 `src/relationships.ts`，而不是内联在工具代码里。`pnpm run verify-employ-relationships` 会把每一条都对照 `docs/database_relation/reference/*.sql` 校验；扩充目录时新增条目并保持该 gate 通过即可。
