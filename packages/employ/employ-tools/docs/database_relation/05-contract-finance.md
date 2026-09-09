# 五、合同与财务域

## 5.1 合同管理

### guohua_contract（合同信息表）

- `customer_id` → `guohua_customer.customer_id`
- `demand_id` → `guohua_demand.id`
- 合同状态通过 `base_dict_contract_status` [base_dict_contract_status.sql](./reference/base_dict_contract_status.sql) 字典

### 合同关联表

| 表名 | 说明 |
|------|------|
| `guohua_rel_contract_approval` [guohua_rel_contract_approval.sql](./reference/guohua_rel_contract_approval.sql) | 合同审批 |
| `guohua_rel_contract_files` [guohua_rel_contract_files.sql](./reference/guohua_rel_contract_files.sql) | 合同附件 |
| `guohua_rel_contract_demand_files` [guohua_rel_contract_demand_files.sql](./reference/guohua_rel_contract_demand_files.sql) | 合同需求附件 |
| `guohua_rel_contract_operate_record` [guohua_rel_contract_operate_record.sql](./reference/guohua_rel_contract_operate_record.sql) | 合同运营跟进记录 |
| `guohua_rel_contract_persons_total` [guohua_rel_contract_persons_total.sql](./reference/guohua_rel_contract_persons_total.sql) | 合同人员报价计算 |
| `guohua_rel_contract_persons_work` [guohua_rel_contract_persons_work.sql](./reference/guohua_rel_contract_persons_work.sql) | 合同人员就职信息 |
| `guohua_rel_contract_sign_files` [guohua_rel_contract_sign_files.sql](./reference/guohua_rel_contract_sign_files.sql) | 合同盖章附件 |
| `guohua_rel_contract_sign_files_record` [guohua_rel_contract_sign_files_record.sql](./reference/guohua_rel_contract_sign_files_record.sql) | 合同盖章附件记录 |
| `guohua_rel_contract_advance_approval` [guohua_rel_contract_advance_approval.sql](./reference/guohua_rel_contract_advance_approval.sql) | 合同提前批办 |
| `guohua_rel_contract_sign_approve_files` [guohua_rel_contract_sign_approve_files.sql](./reference/guohua_rel_contract_sign_approve_files.sql) | 合同批办附件 |
| `guohua_contract_annual_review` [guohua_contract_annual_review.sql](./reference/guohua_contract_annual_review.sql) | 合同年度年审备注 |
| `guohua_contract_renewal` [guohua_contract_renewal.sql](./reference/guohua_contract_renewal.sql) | 合同续签机会池 |
| `guohua_rel_payment_plan` [guohua_rel_payment_plan.sql](./reference/guohua_rel_payment_plan.sql) | 合同付款计划 |
| `guohua_rel_payment_plan_detail` [guohua_rel_payment_plan_detail.sql](./reference/guohua_rel_payment_plan_detail.sql) | 合同付款计划明细 |
| `guohua_rel_payment_dispatch_plan` [guohua_rel_payment_dispatch_plan.sql](./reference/guohua_rel_payment_dispatch_plan.sql) | 合同付款计划(代发) |
| `guohua_rel_service_offer_quotes` [guohua_rel_service_offer_quotes.sql](./reference/guohua_rel_service_offer_quotes.sql) | 服务报价 |
| `guohua_rel_service_payment_plan` [guohua_rel_service_payment_plan.sql](./reference/guohua_rel_service_payment_plan.sql) | 服务付款计划 |
| `fx_contract_persons_per_month` [fx_contract_persons_per_month.sql](./reference/fx_contract_persons_per_month.sql) | 纷享合同月度人数 |

## 5.2 财务管理

### guohua_bill（开票信息表）

| 表名 | 说明 |
|------|------|
| `guohua_rel_bill_detail` [guohua_rel_bill_detail.sql](./reference/guohua_rel_bill_detail.sql) | 账单开票关联明细 |
| `guohua_rel_bill_files` [guohua_rel_bill_files.sql](./reference/guohua_rel_bill_files.sql) | 账单开票附件 |
| `guohua_rel_bill_claim` [guohua_rel_bill_claim.sql](./reference/guohua_rel_bill_claim.sql) | 开票确认 |
| `guohua_rel_bill_cancel` [guohua_rel_bill_cancel.sql](./reference/guohua_rel_bill_cancel.sql) | 开票作废记录 |
| `guohua_rel_bill_cancel_files` [guohua_rel_bill_cancel_files.sql](./reference/guohua_rel_bill_cancel_files.sql) | 开票作废附件 |
| `guohua_rel_bill_cancel_rebill` [guohua_rel_bill_cancel_rebill.sql](./reference/guohua_rel_bill_cancel_rebill.sql) | 发票作废重开 |
| `guohua_rel_bill_payment_confirm` [guohua_rel_bill_payment_confirm.sql](./reference/guohua_rel_bill_payment_confirm.sql) | 开票-回款核销关联（N:M） |
| `guohua_rel_bill_store` [guohua_rel_bill_store.sql](./reference/guohua_rel_bill_store.sql) | 确认收款关联单店 |
| `guohua_rel_seal_files` [guohua_rel_seal_files.sql](./reference/guohua_rel_seal_files.sql) | 开票关联附件 |

### guohua_payment（到款表）

| 表名 | 说明 |
|------|------|
| `guohua_payment_confirm` [guohua_payment_confirm.sql](./reference/guohua_payment_confirm.sql) | 回款已确认 / 应收款 |
| `guohua_payment_split` [guohua_payment_split.sql](./reference/guohua_payment_split.sql) | 到款拆分记录 |
| `guohua_payment_confirm_bill_detail` [guohua_payment_confirm_bill_detail.sql](./reference/guohua_payment_confirm_bill_detail.sql) | 回款认领-开票明细关联 |
| `guohua_customer_payment_detail` [guohua_customer_payment_detail.sql](./reference/guohua_customer_payment_detail.sql) | FESCO到款明细统计 |
| `guohua_customer_payment_risk` [guohua_customer_payment_risk.sql](./reference/guohua_customer_payment_risk.sql) | FESCO风险金汇总 |
| `guohua_customer_payment_risk_expend` [guohua_customer_payment_risk_expend.sql](./reference/guohua_customer_payment_risk_expend.sql) | FESCO风险金支出 |
| `guohua_rel_confirm_expend` [guohua_rel_confirm_expend.sql](./reference/guohua_rel_confirm_expend.sql) | 认款支出明细 |
| `guohua_rel_confirm_sotre` [guohua_rel_confirm_sotre.sql](./reference/guohua_rel_confirm_sotre.sql) | 确认收款关联单店 |

### guohua_expend（OA-付款表）

| 表名 | 说明 |
|------|------|
| `guohua_rel_expend_detail` [guohua_rel_expend_detail.sql](./reference/guohua_rel_expend_detail.sql) | 付款申请明细 |
| `guohua_rel_expend_files` [guohua_rel_expend_files.sql](./reference/guohua_rel_expend_files.sql) | 付款申请附件 |
| `guohua_rel_expend_claim` [guohua_rel_expend_claim.sql](./reference/guohua_rel_expend_claim.sql) | 支出确认 |
| `guohua_rel_expend_borrow` [guohua_rel_expend_borrow.sql](./reference/guohua_rel_expend_borrow.sql) | 支出借款关联 |
| `guohua_rel_expend_purchase` [guohua_rel_expend_purchase.sql](./reference/guohua_rel_expend_purchase.sql) | 采购单 |
| `guohua_rel_expend_store` [guohua_rel_expend_store.sql](./reference/guohua_rel_expend_store.sql) | 付款关联单店 |
| `guohua_rel_expend_payment_log` [guohua_rel_expend_payment_log.sql](./reference/guohua_rel_expend_payment_log.sql) | 支出招行支付日志 |

## 5.5 财务预算（fin_*/cost_*）

> 独立于既有财务体系的预算管理模块，支持多版本、多部门、多维度的预算编制与执行跟踪。

| 表名 | 说明 |
|------|------|
| `fin_budget_version` | 支出预算版本 |
| `fin_budget_plan` | 年度支出预算容器 |
| `fin_budget_file` | 预算工作簿文件登记及孤儿清理 |
| `fin_budget_line` | 支出预算业务明细 |
| `fin_budget_month` | 支出预算月度分配 |
| `fin_cost_type_alias` | 预算导入费用类别别名 |
| `fin_department` | 财务口径部门树(对应预算执行表) |
| `fin_department_closure` | 财务部门闭包表 |
| `fin_department_map` | 真实部门->财务口径映射(挂最近祖先,查询时递归下沉) |
| `fin_user_department` | 员工预算部门归属关系 |
| `cost_budget_department` | 支出预算专用三级部门树 |
| `cost_budget_user_department` | 员工预算部门多对多归属关系 |
| `guohua_sign_account_monthly_payment` | 签约主体月度缴纳费用及备注 |

## 5.3 薪资管理

### guohua_customer_salary（客户薪资管理表）

| 表名 | 说明 |
|------|------|
| `guohua_customer_salary_detail` [guohua_customer_salary_detail.sql](./reference/guohua_customer_salary_detail.sql) | 客户薪资明细 |
| `guohua_customer_salary_files` [guohua_customer_salary_files.sql](./reference/guohua_customer_salary_files.sql) | 客户账单凭证附件 |
| `guohua_customer_salary_settings` [guohua_customer_salary_settings.sql](./reference/guohua_customer_salary_settings.sql) | 客户发薪配置 |
| `guohua_rel_customer_salary` [guohua_rel_customer_salary.sql](./reference/guohua_rel_customer_salary.sql) | 客户发薪规则 |
| `guohua_rel_salary_confirm` [guohua_rel_salary_confirm.sql](./reference/guohua_rel_salary_confirm.sql) | 账单关联认款 |
| `guohua_rel_salary_log` [guohua_rel_salary_log.sql](./reference/guohua_rel_salary_log.sql) | 账单更新日志 |
| `guohua_rel_salary_log_borrow` [guohua_rel_salary_log_borrow.sql](./reference/guohua_rel_salary_log_borrow.sql) | 账单连续垫付记录 |

### guohua_dispatch_wages（OA-工资发放表）

| 表名 | 说明 |
|------|------|
| `guohua_rel_dispatch_claim` [guohua_rel_dispatch_claim.sql](./reference/guohua_rel_dispatch_claim.sql) | 工资发放确认 |
| `guohua_rel_dispatch_wages_files` [guohua_rel_dispatch_wages_files.sql](./reference/guohua_rel_dispatch_wages_files.sql) | 工资发放附件 |
| `guohua_rel_dispatch_salary_log` [guohua_rel_dispatch_salary_log.sql](./reference/guohua_rel_dispatch_salary_log.sql) | 代发工资支付日志 |

## 5.4 财务关系图

```
guohua_contract
    ├──► guohua_bill (1:N)
    │       ├──► guohua_rel_bill_detail (1:N)
    │       ├──► guohua_rel_bill_claim (1:1)
    │       └──► guohua_rel_bill_payment_confirm (N:M) ◄── guohua_payment_confirm
    │
    ├──► guohua_rel_payment_plan (1:N)
    │       └──► guohua_rel_payment_plan_detail (1:N)
    │
    ──► guohua_service (1:N)
            └──► guohua_rel_service_offer_quotes (1:N)
            └──► guohua_rel_service_payment_plan (1:N)

guohua_payment
    └──► guohua_payment_confirm (1:N)
            └──► guohua_rel_bill_payment_confirm (N:M) ← 核销关联

guohua_expend
    ├──► guohua_rel_expend_detail (1:N)
    ├──► guohua_rel_expend_claim (1:1)
    └──► guohua_rel_expend_purchase (1:N)

guohua_customer_salary
    └──► guohua_customer_salary_detail (1:N)
```
