/** Verify the employ-tools relationship catalog against the schema reference DDL. */

import { resolve } from 'node:path'
import { RELATIONSHIPS } from '../packages/employ/employ-tools/src/relationships.ts'
import {
  collectEmployRelationshipViolations,
  formatEmployRelationshipViolation,
} from './employ-relationships.ts'

const root = resolve(import.meta.dirname, '..')
const referenceDir = resolve(root, 'packages/employ/employ-tools/docs/database_relation/reference')
const violations = collectEmployRelationshipViolations(RELATIONSHIPS, referenceDir)

if (violations.length > 0) {
  console.error('verify-employ-relationships: violations found:')
  for (const violation of violations) {
    console.error(`  ${formatEmployRelationshipViolation(violation)}`)
  }
  process.exit(1)
}

console.log(`verify-employ-relationships: ${RELATIONSHIPS.length} relationship(s) conform to the schema reference DDL.`)
