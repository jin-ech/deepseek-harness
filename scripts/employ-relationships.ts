/**
 * Data-integrity gate for the employ-tools relationship catalog. It validates a
 * relationship catalog against the schema reference DDL under
 * `docs/database_relation/reference/*.sql`, so a table, key, or label column
 * typo fails CI instead of shipping a broken join at runtime.
 */

import { globSync, readFileSync } from 'node:fs'
import { resolve } from 'node:path'
import type { Relationship } from '../packages/employ/employ-tools/src/relationships.ts'

/** One catalog violation, keyed by the offending foreign-key column name. */
export interface EmployRelationshipViolation {
  /** Foreign-key column name, or a sentinel label for catalog-level failures. */
  readonly fk: string
  /** Human-readable violation description. */
  readonly message: string
}

/** A bare SQL identifier: letters, digits, and underscores, not starting with a digit. */
const IDENTIFIER = /^[A-Za-z_][A-Za-z0-9_]*$/

/** A reference DDL column line: a backtick-quoted identifier followed by its type. */
const COLUMN_LINE = /^\s*`([A-Za-z_][A-Za-z0-9_]*)`\s+/

/** The CREATE TABLE header naming the table whose columns follow. */
const CREATE_TABLE = /CREATE TABLE\s+`([^`]+)`/i

/**
 * Parse the backtick-quoted column names from one reference `.sql` DDL file.
 * `PRIMARY KEY`, `KEY`, and `UNIQUE KEY` lines are not column definitions and
 * are skipped; type suffixes such as `decimal(3,2)`, `enum(...)`, and generated
 * columns do not disturb the leading column identifier.
 * @param source The raw DDL file text.
 * @returns The lowercased column names.
 */
export function parseReferenceColumns(source: string): Set<string> {
  const columns = new Set<string>()
  for (const line of source.split('\n')) {
    const column = COLUMN_LINE.exec(line)?.[1]
    if (column !== undefined) columns.add(column.toLowerCase())
  }
  return columns
}

/**
 * Validate a relationship catalog against the reference DDL in one directory.
 * @param relationships The catalog to validate (the plugin's `RELATIONSHIPS`).
 * @param referenceDir Absolute path to the `reference/` directory of `.sql` files.
 * @returns Every violation, empty when the catalog conforms.
 */
export function collectEmployRelationshipViolations(
  relationships: readonly Relationship[],
  referenceDir: string,
): EmployRelationshipViolation[] {
  const violations: EmployRelationshipViolation[] = []
  if (relationships.length === 0) {
    violations.push({ fk: '<catalog>', message: 'relationship catalog is empty' })
    return violations
  }

  const columnsByTable = new Map<string, Set<string>>()
  const allColumns = new Set<string>()
  for (const file of globSync('*.sql', { cwd: referenceDir })) {
    const source = readFileSync(resolve(referenceDir, file), 'utf8')
    const table = CREATE_TABLE.exec(source)?.[1]?.toLowerCase()
    const columns = parseReferenceColumns(source)
    if (table !== undefined) columnsByTable.set(table, columns)
    for (const column of columns) allColumns.add(column)
  }

  const seen = new Set<string>()
  for (const relationship of relationships) {
    const { fk, table, pk, label, alias } = relationship
    if (seen.has(fk)) {
      violations.push({ fk, message: `duplicate relationship key ${JSON.stringify(fk)}` })
    }
    seen.add(fk)
    for (const [kind, value] of [['fk', fk], ['table', table], ['pk', pk], ['label', label], ['alias', alias]] as const) {
      if (!IDENTIFIER.test(value)) {
        violations.push({ fk, message: `${kind} ${JSON.stringify(value)} is not a bare identifier` })
      }
    }
    const columns = columnsByTable.get(table.toLowerCase())
    if (columns === undefined) {
      violations.push({ fk, message: `referenced table ${JSON.stringify(table)} has no reference DDL (${table}.sql)` })
      continue
    }
    if (!columns.has(pk.toLowerCase())) {
      violations.push({ fk, message: `key column ${JSON.stringify(pk)} is missing from ${table}` })
    }
    if (!columns.has(label.toLowerCase())) {
      violations.push({ fk, message: `label column ${JSON.stringify(label)} is missing from ${table}` })
    }
    if (!allColumns.has(fk.toLowerCase())) {
      violations.push({ fk, message: `foreign-key column ${JSON.stringify(fk)} appears in no reference table` })
    }
  }
  return violations
}

/**
 * Format one violation for the command-line gate.
 * @param violation The violation to render.
 * @returns A single-line, repo-relative message.
 */
export function formatEmployRelationshipViolation(violation: EmployRelationshipViolation): string {
  return `relationship ${JSON.stringify(violation.fk)}: ${violation.message}`
}
