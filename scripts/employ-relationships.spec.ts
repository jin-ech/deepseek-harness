import { mkdtempSync, rmSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { afterEach, describe, expect, it } from 'vitest'
import {
  collectEmployRelationshipViolations,
  parseReferenceColumns,
} from './employ-relationships.ts'
import type { Relationship } from '../packages/employ/employ-tools/src/relationships.ts'

const roots: string[] = []

afterEach(() => {
  for (const root of roots.splice(0)) rmSync(root, { recursive: true, force: true })
})

function makeReferenceDir(): string {
  const dir = mkdtempSync(join(tmpdir(), 'dsh-employ-relationships-'))
  roots.push(dir)
  return dir
}

function writeTable(referenceDir: string, table: string, columns: string[]): void {
  const body = columns.map(column => `  \`${column}\` varchar(255) DEFAULT NULL COMMENT 'x',`).join('\n')
  writeFileSync(
    join(referenceDir, `${table}.sql`),
    `CREATE TABLE \`${table}\` (\n${body}\n  PRIMARY KEY (\`${columns[0]}\`) USING BTREE\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n`,
  )
}

function relationship(overrides: Partial<Relationship> = {}): Relationship {
  return {
    fk: 'customer_id',
    table: 'guohua_customer',
    pk: 'customer_id',
    label: 'customer_name',
    alias: 'customer_name',
    ...overrides,
  }
}

describe('parseReferenceColumns', () => {
  it('extracts column identifiers and skips key, table, and drop lines', () => {
    const ddl = [
      'DROP TABLE IF EXISTS `guohua_customer`;',
      'CREATE TABLE `guohua_customer` (',
      '  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT \'客户ID\',',
      '  `customer_name` varchar(255) DEFAULT NULL,',
      '  `ratio` decimal(3,2) DEFAULT 1.00,',
      '  `state` enum(\'a\',\'b\') DEFAULT \'a\',',
      '  `norm` varchar(255) GENERATED ALWAYS AS (trim(`customer_name`)) STORED,',
      '  PRIMARY KEY (`customer_id`) USING BTREE,',
      '  KEY `index_name` (`customer_name`) USING BTREE',
      ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;',
    ].join('\n')
    expect(parseReferenceColumns(ddl)).toEqual(new Set(['customer_id', 'customer_name', 'ratio', 'state', 'norm']))
  })
})

describe('collectEmployRelationshipViolations', () => {
  it('accepts a catalog whose table, key, label, and foreign key all resolve', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_id', 'customer_name'])
    writeTable(dir, 'guohua_persons', ['persons_id', 'persons_name', 'customer_id'])
    expect(collectEmployRelationshipViolations([relationship()], dir)).toEqual([])
  })

  it('rejects a relationship whose referenced table has no reference DDL', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_id', 'customer_name'])
    const violations = collectEmployRelationshipViolations(
      [relationship({ table: 'guohua_store' })],
      dir,
    )
    expect(violations).toEqual([
      expect.objectContaining({ fk: 'customer_id', message: expect.stringContaining('no reference DDL') }),
    ])
  })

  it('rejects a key column missing from the referenced table', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_name'])
    writeTable(dir, 'guohua_persons', ['persons_id', 'customer_id'])
    const violations = collectEmployRelationshipViolations([relationship()], dir)
    expect(violations).toEqual([
      expect.objectContaining({ message: expect.stringContaining('key column') }),
    ])
  })

  it('rejects a label column missing from the referenced table', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_id'])
    const violations = collectEmployRelationshipViolations([relationship()], dir)
    expect(violations).toEqual([
      expect.objectContaining({ message: expect.stringContaining('label column') }),
    ])
  })

  it('rejects a foreign-key column that appears in no reference table', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_id', 'customer_name'])
    const violations = collectEmployRelationshipViolations(
      [relationship({ fk: 'nope_id' })],
      dir,
    )
    expect(violations).toEqual([
      expect.objectContaining({ message: expect.stringContaining('appears in no reference table') }),
    ])
  })

  it('rejects duplicate relationship keys', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_id', 'customer_name'])
    const violations = collectEmployRelationshipViolations(
      [relationship(), relationship()],
      dir,
    )
    expect(violations).toEqual([
      expect.objectContaining({ message: expect.stringContaining('duplicate relationship key') }),
    ])
  })

  it('rejects fields that are not bare identifiers', () => {
    const dir = makeReferenceDir()
    writeTable(dir, 'guohua_customer', ['customer_id', 'customer_name'])
    const violations = collectEmployRelationshipViolations(
      [relationship({ pk: 'customer-id' })],
      dir,
    )
    expect(violations).toEqual(expect.arrayContaining([
      expect.objectContaining({ message: expect.stringContaining('not a bare identifier') }),
    ]))
  })

  it('rejects an empty catalog', () => {
    const dir = makeReferenceDir()
    expect(collectEmployRelationshipViolations([], dir)).toEqual([
      { fk: '<catalog>', message: 'relationship catalog is empty' },
    ])
  })
})
