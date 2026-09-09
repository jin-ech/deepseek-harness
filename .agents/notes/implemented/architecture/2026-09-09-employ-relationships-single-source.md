# Agent Note: employ-tools relationship catalog as a validated single source

Status: implemented

English | [中文](2026-09-09-employ-relationships-single-source.zh.md)

## Problem

The employ-tools plugin follows `_id` joins through a curated map of which column references which table, plus the label column to select. That map was an inline `FK_MAP` object literal in the tool source, while the richer relationship knowledge lived in prose Markdown under `docs/database_relation/`. The inline map could drift from the documented DDL with no mechanical check, and a table, key, or label typo would surface only as a broken join at runtime. There was also recurring pressure to parse the prose documentation at runtime or adopt an ORM to recover relationships, both of which misread the database: it has ~633 tables and one explicit foreign key, so every other relationship is a naming convention no schema tool can infer.

## Decision

The relationship catalog lives in one machine-readable, hand-owned TypeScript module, [`src/relationships.ts`](../../../../packages/employ/employ-tools/src/relationships.ts), as a typed `RELATIONSHIPS` array of `{ fk, table, pk, label, alias }`. The tool builds its `FK_MAP` from that constant at module load and never reads prose documentation at runtime.

A build-time gate, [`verify-employ-relationships`](../../../../scripts/verify-employ-relationships.ts), imports the exact `RELATIONSHIPS` constant and validates every entry against the schema reference DDL under [`docs/database_relation/reference/`](../../../../packages/employ/employ-tools/docs/database_relation/reference/): the referenced table must have a DDL file, the key and label columns must exist in that table, the foreign-key column must appear in some table, keys must be unique, and every field must be a bare identifier. The gate runs in the `doc-sync`/`doc-quick` aggregates and the CI primary/static aggregates, so a typo fails CI.

## Alternatives considered

**Parse `docs/database_relation/README.md` or its section files at runtime to build SQL.** The README is a table of contents; the relationship detail is prose spread across fourteen section files and the actual columns live in `reference/*.sql`. Re-deriving relationships from prose is fragile, the snapshot drifts from the live `information_schema`, and the docs directory is not in the published package `files`. It would also widen the join safety boundary from reviewed constants to untyped file content.

**Adopt TypeORM to sync or reflect relationships.** The database has one explicit foreign key across ~633 tables, so there is nothing to synchronize or reflect; `synchronize` would emit DDL writes against the read-only safety model, and the naming-convention `_id` semantics still require hand curation. An ORM is also the wrong abstraction for a tool that queries arbitrary discovered tables.

**Keep the inline `FK_MAP` object literal.** Simplest, but leaves the catalog without any mechanical check against the DDL, which is the drift the gate now prevents.

## Consequences

The catalog is a reviewed, typed constant with a single home and a mechanical drift check. Adding a join is a one-line data edit kept honest by the gate. The prose documentation remains model-readable business reference, distinct from the executable catalog. The cost is one extra gate and a data module, with no runtime effect beyond a module-load `Object.fromEntries` mapping.

## Verification

[`scripts/employ-relationships.spec.ts`](../../../../scripts/employ-relationships.spec.ts) pins the DDL column parser and each violation path: missing table, missing key, missing label, unreferenced foreign key, duplicate key, non-identifier field, and empty catalog. [`packages/employ/employ-tools/tests/employ-tools.spec.ts`](../../../../packages/employ/employ-tools/tests/employ-tools.spec.ts) still pins the derived `FK_MAP` relationships.
