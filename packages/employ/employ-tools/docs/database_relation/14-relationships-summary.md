# 十四、表间关联关系汇总

## 14.1 通过字段命名推断的关联

本项目不使用外键约束，所有关联通过字段命名约定实现。以下是主要的关联模式：

### customer_id 关联（指向 guohua_customer）

被以下核心表引用（共 **102 张**）：
- `guohua_contract` [guohua_contract.sql](./reference/guohua_contract.sql), `guohua_demand` [guohua_demand.sql](./reference/guohua_demand.sql), `guohua_service` [guohua_service.sql](./reference/guohua_service.sql), `guohua_store` [guohua_store.sql](./reference/guohua_store.sql)
- `guohua_persons` [guohua_persons.sql](./reference/guohua_persons.sql), `guohua_project` [guohua_project.sql](./reference/guohua_project.sql), `guohua_bill` [guohua_bill.sql](./reference/guohua_bill.sql)
- `guohua_customer_clue` [guohua_customer_clue.sql](./reference/guohua_customer_clue.sql), `guohua_customer_opportunity` [guohua_customer_opportunity.sql](./reference/guohua_customer_opportunity.sql), `guohua_customer_follow` [guohua_customer_follow.sql](./reference/guohua_customer_follow.sql)
- `guohua_customer_opt_clue` [guohua_customer_opt_clue.sql](./reference/guohua_customer_opt_clue.sql), `guohua_customer_gift` [guohua_customer_gift.sql](./reference/guohua_customer_gift.sql), `guohua_customer_total` [guohua_customer_total.sql](./reference/guohua_customer_total.sql)
- `guohua_customer_user` [guohua_customer_user.sql](./reference/guohua_customer_user.sql), 所有 `guohua_rel_customer_*` 系列
- `guohua_emp_product` [guohua_emp_product.sql](./reference/guohua_emp_product.sql), `guohua_employ_demand` [guohua_employ_demand.sql](./reference/guohua_employ_demand.sql)
- `market_customer_*` 系列

### persons_id 关联（指向 guohua_persons）

被以下表引用（共 **88 张**）：
- 全部 `persons_*` 系列（详情扩展）
- `guohua_persons_match` [guohua_persons_match.sql](./reference/guohua_persons_match.sql), `guohua_persons_match_expect` [guohua_persons_match_expect.sql](./reference/guohua_persons_match_expect.sql), `guohua_persons_match_wide` [guohua_persons_match_wide.sql](./reference/guohua_persons_match_wide.sql)
- `guohua_persons_edit_log` [guohua_persons_edit_log.sql](./reference/guohua_persons_edit_log.sql), `guohua_persons_update_record` [guohua_persons_update_record.sql](./reference/guohua_persons_update_record.sql)
- `persons_special_event` [persons_special_event.sql](./reference/persons_special_event.sql), `persons_special_event_in` [persons_special_event_in.sql](./reference/persons_special_event_in.sql) 系列
- `guohua_rel_persons_*` 系列
- `rel_activity_*_persons`, `rel_store_persons_works_style` [rel_store_persons_works_style.sql](./reference/rel_store_persons_works_style.sql)
- `rel_ens_activity_persons_*`, `rel_ens_persons_*`

### store_id 关联（指向 guohua_store）

被以下表引用：
- `guohua_store_product` [guohua_store_product.sql](./reference/guohua_store_product.sql), `guohua_store_product_order` [guohua_store_product_order.sql](./reference/guohua_store_product_order.sql)
- `guohua_store_task` [guohua_store_task.sql](./reference/guohua_store_task.sql), `guohua_store_message` [guohua_store_message.sql](./reference/guohua_store_message.sql)
- `guohua_rel_store_files` [guohua_rel_store_files.sql](./reference/guohua_rel_store_files.sql), `guohua_rel_store_photo` [guohua_rel_store_photo.sql](./reference/guohua_rel_store_photo.sql)
- `rel_store_task_kpi` [rel_store_task_kpi.sql](./reference/rel_store_task_kpi.sql), `rel_store_persons_works_style` [rel_store_persons_works_style.sql](./reference/rel_store_persons_works_style.sql)
- `guohua_rel_confirm_sotre` [guohua_rel_confirm_sotre.sql](./reference/guohua_rel_confirm_sotre.sql), `guohua_rel_bill_store` [guohua_rel_bill_store.sql](./reference/guohua_rel_bill_store.sql)
- `guohua_rel_expend_store` [guohua_rel_expend_store.sql](./reference/guohua_rel_expend_store.sql), `guohua_rel_mission_store` [guohua_rel_mission_store.sql](./reference/guohua_rel_mission_store.sql)

### demand_id 关联（指向 guohua_demand / guohua_employ_demand）

被以下表引用：
- `guohua_persons` [guohua_persons.sql](./reference/guohua_persons.sql), `guohua_persons_match` [guohua_persons_match.sql](./reference/guohua_persons_match.sql)
- `guohua_rel_demand_job` [guohua_rel_demand_job.sql](./reference/guohua_rel_demand_job.sql), `guohua_rel_demand_files` [guohua_rel_demand_files.sql](./reference/guohua_rel_demand_files.sql)
- `guohua_rel_demand_audit` [guohua_rel_demand_audit.sql](./reference/guohua_rel_demand_audit.sql), `guohua_rel_demand_change_record` [guohua_rel_demand_change_record.sql](./reference/guohua_rel_demand_change_record.sql)
- `guohua_audit_employ_demand` [guohua_audit_employ_demand.sql](./reference/guohua_audit_employ_demand.sql)

### contract_id 关联（指向 guohua_contract）

被以下表引用（共 **41 张**）：
- `guohua_persons` [guohua_persons.sql](./reference/guohua_persons.sql)
- 全部 `guohua_rel_contract_*` 系列
- `fx_contract_persons_per_month` [fx_contract_persons_per_month.sql](./reference/fx_contract_persons_per_month.sql)

### payment_confirm_id 关联（指向 guohua_payment_confirm）

被以下表引用（共 **16 张**）：
- `guohua_rel_bill_payment_confirm` [guohua_rel_bill_payment_confirm.sql](./reference/guohua_rel_bill_payment_confirm.sql)
- `guohua_rel_confirm_expend` [guohua_rel_confirm_expend.sql](./reference/guohua_rel_confirm_expend.sql)
- 账单核销相关表

### bill_id 关联（指向 guohua_bill）

被以下表引用（共 **15 张**）：
- `guohua_rel_bill_detail` [guohua_rel_bill_detail.sql](./reference/guohua_rel_bill_detail.sql)
- `guohua_rel_bill_payment_confirm` [guohua_rel_bill_payment_confirm.sql](./reference/guohua_rel_bill_payment_confirm.sql)
- `guohua_payment_confirm_bill_detail` [guohua_payment_confirm_bill_detail.sql](./reference/guohua_payment_confirm_bill_detail.sql)
- `guohua_rel_seal_files` [guohua_rel_seal_files.sql](./reference/guohua_rel_seal_files.sql)

### product_order_id 关联（指向 guohua_store_product_order）

被以下表引用（共 **16 张**）：
- `guohua_store_product_order_detail` [guohua_store_product_order_detail.sql](./reference/guohua_store_product_order_detail.sql)
- `guohua_store_product_order_salary` [guohua_store_product_order_salary.sql](./reference/guohua_store_product_order_salary.sql)
- `rel_store_product_order_delivery` [rel_store_product_order_delivery.sql](./reference/rel_store_product_order_delivery.sql)
- `rel_store_product_order_deliver_record` [rel_store_product_order_deliver_record.sql](./reference/rel_store_product_order_deliver_record.sql)
- `rel_store_product_order_deliver_record_detail` | 交付记录明细
- `rel_store_product_order_deliver_record_express` | 交付物流信息
- `rel_store_product_order_deliver_record_files` | 交付附件信息
- `rel_store_product_order_deliver_back` [rel_store_product_order_deliver_back.sql](./reference/rel_store_product_order_deliver_back.sql)
- `rel_store_product_order_deliver_back_detail` | 退回明细
- `rel_store_product_order_deliver_back_express` [rel_store_product_order_deliver_back_express.sql](./reference/rel_store_product_order_deliver_back_express.sql)
- `rel_store_product_order_deliver_back_files` [rel_store_product_order_deliver_back_files.sql](./reference/rel_store_product_order_deliver_back_files.sql)
- `rel_store_product_order_material` [rel_store_product_order_material.sql](./reference/rel_store_product_order_material.sql)

### rule_id 关联（指向 guohua_incentive_rule）

被以下表引用：
- `guohua_incentive_simulation.simulation_result` JSON 中包含规则匹配结果

### apply_userid 关联（指向 base_guohua_user）

被以下表引用：
- `guohua_*.add_userid / update_userid`（各表操作人）
- `guohua_sprint_activity.create_userid / update_userid`（活动操作人）

### contract_id / payment_confirm_id / persons_id 在激励域的关联

激励模拟计算结果的 JSON 中可能包含业务关联 ID，由前端传入。

## 14.2 附件关联模式

项目中大量 `guohua_rel_*_files` 表遵循统一模式：

```
主表 (如 guohua_contract)
    └──► guohua_rel_contract_files
            ├── contract_id → guohua_contract.id
            ├── file_type → base_dict_persons_files_type
            ├── file_url
            └── add_time / add_userid
```

### 新增附件关联表

| 表名 | 关联主表 |
|------|---------|
| `guohua_rel_attendance_files` | 外勤打卡 |
| `guohua_rel_channel_files` | 渠道协议 |
| `guohua_rel_contract_sign_files_record` | 合同盖章 |
| `guohua_rel_customer_declare_files` | 客户申报 |
| `guohua_rel_customer_info_record_files` | 客户信息变更记录 |
| `guohua_rel_operate_tools_files` | 运营工具 |
| `guohua_rel_opportunity_files` | 商机阶段 |
| `guohua_rel_persons_declare_files` | 人员申报 |
| `guohua_rel_persons_files` | 人员资料 |
| `guohua_rel_persons_files_approval` | 人员资料审核 |
| `guohua_rel_persons_handbook` | 人员劳动手册 |
| `guohua_rel_persons_handbook_files` | 人员劳动手册附件 |

## 14.3 核心 ER 简图

```
base_guohua_user          base_guohua_department
      │                          │
      ├──► base_guohua_user_role │
      │                          ──► (department_id)
      └──► guohua_*.add_userid / update_userid

base_permission_roles ◄──► base_guohua_user_role ◄──► base_guohua_user
      │
      └──► base_permission_role_detail ◄──► base_dict_permissions
      └──► guohua_rel_permission_roles

guohua_customer  ← 中心实体
      ├──► guohua_contract ──┬──► guohua_bill ──► guohua_rel_bill_detail
      │                      │       │
      │                      │       └──► guohua_rel_bill_payment_confirm ──► guohua_payment_confirm
      │                      │
      │                      ├──► guohua_rel_payment_plan ──► guohua_rel_payment_plan_detail
      │                      │
      │                      ├──► guohua_service ──► guohua_rel_service_offer_quotes
      │                      │
      │                      ──► guohua_rel_contract_*
      │
      ├──► guohua_demand ──► guohua_persons ──► persons_* (详情扩展)
      ├──► guohua_store ─► guohua_store_product ──► guohua_store_product_order
      ├──► guohua_customer_opportunity
      ├──► guohua_customer_clue
      ├──► guohua_customer_follow
      └──► guohua_rel_customer_*

guohua_expend ──► guohua_rel_expend_detail
guohua_customer_salary ──► guohua_customer_salary_detail

-- 激励策略域
guohua_incentive_rule (规则配置)
       │ role_type / trigger_node → 直接代码枚举
       │
       ▼
guohua_incentive_simulation (模拟计算记录)
       └──► simulation_result JSON ──► 含规则匹配及计算结果

guohua_sprint_activity (冲刺活动)
       ├──► department_id ──► base_guohua_department.department_id
       └──► 通过部门→用户→回款/合同 汇总业务进度

-- 销售提成体系 (kpi_*)
kpi_commission_rule ──► kpi_sales_commission_monthly_detail ──► kpi_sales_commission_alloc_line
kpi_overage_reward ───┘                                       └──► kpi_sales_commission_change_request
kpi_team_manager_commission_rule ──┘
```
