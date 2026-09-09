---
description: "Model-facing read-only employment management query tools over the Guohua MySQL business database (any table, relationship joins)."
kind: "package-reference"
---

# @deepseek-ai/dsh-employ-tools

English | [中文](README.zh.md)

## Summary

Register this plugin to let agents answer questions about the Guohua employment system by querying its MySQL business database directly. Two read-only tools are registered:

- `query_employ_schema` — lists the business database's tables, or the columns and joinable relationships of one table (read from `information_schema`, cached after first use).
- `query_employ` — pages over **any** discovered table with optional filters and optional joins that follow the documented `_id` relationships.

The model never supplies SQL. Table and column names are validated as identifiers against the discovered catalog; filter values are bound as `?` placeholders; joins come only from a curated relationship map; `multipleStatements` is off; and every statement is re-asserted read-only (a single `SELECT`) before execution. No INSERT, UPDATE, DELETE, or DDL can reach the database.

## Table of Contents

- [Mount and configure](#mount-and-configure)
- [Model Experience](#model-experience)
- [Known Limitations and Deferred Work](#known-limitations-and-deferred-work)
- [Dev Note](#dev-note)

-----

<a id="mount-and-configure"></a>
## Mount and configure

Mount the plugin wherever agents call tools; it registers two tools on `ctx.tools`.

```yaml
- name: '@deepseek-ai/dsh-employ-tools'
  config:
    host: 47.93.181.192
    user: root
    password: wfn031641
```

| Field | Default | Meaning |
|---|---|---|
| `host` | `47.93.181.192` | MySQL host |
| `port` | `3306` | MySQL TCP port |
| `user` | `root` | MySQL user (use an account with only `SELECT` grants for defense-in-depth) |
| `password` | `wfn031641` | MySQL password; override from `cordis.yml` for other environments |
| `database` | `guohua_operate_fx_crm` | Business database holding the `guohua_*` tables |
| `charset` | `utf8mb4` | Connection character set |
| `connectionLimit` | `5` | Maximum pooled connections |
| `queryTimeoutMs` | `30000` | Cooperative query inactivity timeout budget in milliseconds |
| `maxPageSize` | `100` | Upper bound on one page of results |

### Filters

`query_employ` takes a `filters` object whose keys are the queried table's columns. A scalar string matches as a case-insensitive substring (`LIKE %v%`), a scalar number/boolean matches exactly, and an object selects explicit operators: `{ eq: v }`, `{ like: v }`, `{ in: [v1, v2] }`, and `{ gte: v }` / `{ lte: v }` (both may be given for a range). Unknown columns and malformed values fail loudly.

### Relationships

Joins follow the documented `_id` naming convention through a curated map. The map is the single machine-readable source in [`src/relationships.ts`](src/relationships.ts), validated against the schema reference DDL by the `verify-employ-relationships` gate. Passing `joins: ["customer_id", "store_id"]` adds the referenced tables as `LEFT JOIN`s and appends their label columns to each row. The supported relationships are:

| Foreign key | References | Output column |
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

Two visible tools. `query_employ_schema` exposes an optional `table` and returns the table list or one table's columns, primary key, and joinable relationships. `query_employ` exposes a required `table`, an optional `filters` object, an optional `joins` array, and optional `page`/`page_size`.

#### Token effect

Fixed per-request cost proportional to the two schemas.

#### KV Cache effect

Prefix-stable while the two definitions and their order are unchanged.

### Tool results

#### What the model sees

`query_employ` returns a count summary line plus the paged result (`count`, `page`, `page_size`, `list`) as JSON. Each `list` row carries the table's columns plus the aliased label columns of any joined tables. A connection, discovery, or query failure returns an `Error: <message>`.

#### Token effect

Data-dependent result tokens, resent until compaction.

#### KV Cache effect

Append-only; results follow the reusable request prefix.

-----

<a id="known-limitations-and-deferred-work"></a>
## Known Limitations and Deferred Work

- **Read-only queries only** — no create, update, delete, or DDL operations are exposed; the plugin rejects anything that is not a single `SELECT`.
- **Filters are single-table** — filter keys resolve against the queried table only; to filter by a related entity, query that table first and re-filter on the returned key, or use `joins` to read related label columns alongside a base-table filter.
- **Join fan-out** — joins assume a one-to-one or one-to-many-into-one relationship; when the referenced key is not unique, `COUNT(DISTINCT …)` stays correct but a `list` row may repeat the base row.
- **Schema is discovered lazily** — the table/column catalog is read from `information_schema` on first use and cached; the database must be reachable for either tool to run.
- **No-primary-key tables** — tables without a declared primary key page with `COUNT(*)` and no deterministic ordering.

-----

<a id="dev-note"></a>
## Dev Note

The join catalog lives in `src/relationships.ts` as plain typed data, not inline in the tool code. `pnpm run verify-employ-relationships` checks every entry against `docs/database_relation/reference/*.sql`; extend the catalog by adding an entry and keeping the gate green.
