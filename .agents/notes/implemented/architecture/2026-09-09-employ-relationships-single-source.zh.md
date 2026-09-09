# Agent Note: employ-tools 关系目录作为经校验的单一来源

Status: implemented

[English](2026-09-09-employ-relationships-single-source.md) | 中文

## 问题

employ-tools 插件通过一份精编映射来决定哪些 `_id` 列关联到哪张表、并选取哪个名称列。此前该映射是工具源码里内联的 `FK_MAP` 对象字面量，而更丰富的关系知识则散落在 `docs/database_relation/` 的散文式 Markdown 里。内联映射可能在无任何机械校验的情况下与文档化的 DDL 漂移，表名、键或名称列的拼写错误只会在运行时以一次坏 join 的形式暴露。同时存在反复出现的压力：要么在运行时解析散文文档，要么引入 ORM 来还原关系——两者都误读了该库：它有约 633 张表却只有一条显式外键，其余关系全是命名约定，任何 schema 工具都无法推断。

## 决策

关系目录放在一个机读、人工持有的 TypeScript 模块 [`src/relationships.ts`](../../../../packages/employ/employ-tools/src/relationships.ts) 里，以带类型的 `RELATIONSHIPS` 数组（元素为 `{ fk, table, pk, label, alias }`）表达。工具在模块加载时从该常量构建 `FK_MAP`，运行时绝不读取散文文档。

一道构建期 gate [`verify-employ-relationships`](../../../../scripts/verify-employ-relationships.ts) 导入同一个 `RELATIONSHIPS` 常量，并对照 [`docs/database_relation/reference/`](../../../../packages/employ/employ-tools/docs/database_relation/reference/) 下的 schema 参考 DDL 校验每条记录：被引用表必须有 DDL 文件、键与名称列必须存在于该表、外键列必须出现在某张表中、键必须唯一、每个字段都必须是裸标识符。该 gate 运行在 `doc-sync`/`doc-quick` 聚合与 CI 主/静态聚合中，拼写错误会使 CI 失败。

## 曾考虑的替代方案

**在运行时解析 `docs/database_relation/README.md` 或其章节文件来构建 SQL。** README 只是目录；关系细节是散落在十四个章节文件里的散文，真正的列则在 `reference/*.sql` 里。从散文重建关系脆弱、快照会相对实时的 `information_schema` 漂移，且 `docs` 目录不在发布包的 `files` 里。它还会把 join 安全边界从"评审过的常量"扩大到"未类型化的文件内容"。

**采用 TypeORM 来同步或反射关系。** 该库在约 633 张表上只有一条显式外键，没有可同步或反射的东西；`synchronize` 会发出 DDL 写操作，与只读安全模型冲突；命名约定的 `_id` 语义仍需人工精编。ORM 对"查询任意已发现表"的工具而言也是错误的抽象。

**保留内联的 `FK_MAP` 对象字面量。** 最简单，但目录对 DDL 没有任何机械校验，正是这道 gate 现在要防的漂移。

## 后果

目录是一份经评审、带类型、有单一归宿并有机械漂移校验的常量。新增一条 join 只是加一行数据，由 gate 约束其正确性。散文文档继续作为模型可读的业务参考，与可执行目录保持分离。代价是多一道 gate 和一个数据模块，运行期开销仅是一次模块加载时的 `Object.fromEntries` 映射。

## 验证

[`scripts/employ-relationships.spec.ts`](../../../../scripts/employ-relationships.spec.ts) 固定了 DDL 列解析器与每条违规路径：缺表、缺键、缺名称列、无引用外键、重复键、非标识符字段、空目录。[`packages/employ/employ-tools/tests/employ-tools.spec.ts`](../../../../packages/employ/employ-tools/tests/employ-tools.spec.ts) 仍固定派生的 `FK_MAP` 关系。
