/**
 * Machine-readable source of truth for the `_id` relationships the
 * `query_employ` tool may follow as joins.
 *
 * This module holds the curated relationship catalog as plain typed data so the
 * runtime never parses prose documentation. The `verify-employ-relationships`
 * gate imports this exact constant and validates every entry against the schema
 * reference DDL under `docs/database_relation/reference/*.sql`, so a table, key,
 * or label column typo fails CI instead of producing a broken join at runtime.
 */

/** One documented `_id` relationship: the referenced table, key, and label column. */
export interface FkJoin {
  /** Referenced table. */
  table: string
  /** Referenced table's key column. */
  pk: string
  /** Human-readable label column selected from the referenced table. */
  label: string
  /** Output column alias for the selected label. */
  alias: string
}

/** A relationship catalog entry, carrying its own foreign-key column name. */
export interface Relationship extends FkJoin {
  /** Foreign-key column name in the referencing table(s). */
  fk: string
}

/**
 * Curated relationship catalog derived from the schema documentation: a
 * foreign-key column name maps to the table it references. Only these
 * relationships can be followed by a join; everything else stays a single-table
 * query.
 */
export const RELATIONSHIPS: readonly Relationship[] = [
  { fk: 'customer_id', table: 'guohua_customer', pk: 'customer_id', label: 'customer_name', alias: 'customer_name' },
  { fk: 'persons_id', table: 'guohua_persons', pk: 'persons_id', label: 'persons_name', alias: 'persons_name' },
  { fk: 'store_id', table: 'guohua_store', pk: 'store_id', label: 'store_name', alias: 'store_name' },
  { fk: 'base_id', table: 'guohua_store', pk: 'store_id', label: 'store_name', alias: 'base_name' },
  { fk: 'contract_id', table: 'guohua_contract', pk: 'contract_id', label: 'contract_name', alias: 'contract_name' },
  { fk: 'clue_id', table: 'guohua_customer_opt_clue', pk: 'clue_id', label: 'clue_name', alias: 'clue_name' },
  { fk: 'demand_id', table: 'guohua_demand', pk: 'demand_id', label: 'demand_sn', alias: 'demand_sn' },
  { fk: 'opportunity_id', table: 'guohua_customer_opportunity', pk: 'opportunity_id', label: 'opportunity_name', alias: 'opportunity_name' },
  { fk: 'payment_confirm_id', table: 'guohua_payment_confirm', pk: 'payment_confirm_id', label: 'company_name', alias: 'payment_confirm_company' },
  { fk: 'project_id', table: 'guohua_project', pk: 'project_id', label: 'project_name', alias: 'project_name' },
  { fk: 'mission_id', table: 'guohua_mission', pk: 'mission_id', label: 'mission_sn', alias: 'mission_sn' },
  { fk: 'service_id', table: 'guohua_service', pk: 'service_id', label: 'service_name', alias: 'service_name' },
  { fk: 'employ_demand_id', table: 'guohua_employ_demand', pk: 'employ_demand_id', label: 'employ_demand_sn', alias: 'employ_demand_sn' },
  { fk: 'product_order_id', table: 'guohua_store_product_order', pk: 'product_order_id', label: 'product_order_num', alias: 'product_order_num' },
  { fk: 'store_product_id', table: 'guohua_store_product', pk: 'store_product_id', label: 'product_name', alias: 'product_name' },
  { fk: 'bill_id', table: 'guohua_bill', pk: 'bill_id', label: 'pay_company_name', alias: 'bill_pay_company' },
  { fk: 'salary_id', table: 'guohua_customer_salary', pk: 'salary_id', label: 'salary_sn', alias: 'salary_sn' },
  { fk: 'expend_id', table: 'guohua_expend', pk: 'expend_id', label: 'expend_sn', alias: 'expend_sn' },
  { fk: 'match_id', table: 'guohua_persons_match', pk: 'match_id', label: 'match_sn', alias: 'match_sn' },
  { fk: 'payment_id', table: 'guohua_payment', pk: 'payment_id', label: 'company_name', alias: 'payment_company' },
]
