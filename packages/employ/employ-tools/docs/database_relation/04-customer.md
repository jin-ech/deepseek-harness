# 四、客户管理域

## 4.1 核心表

### guohua_customer（客户信息表）— 系统中心实体

核心字段：
- `customer_id` [PK] — 客户ID
- `customer_parent_id` — 父级客户ID（自关联 `guohua_customer.customer_id`）
- `customer_code` — 客户编码（如 C20220115014）
- `customer_name` — 客户名称
- `customer_source` — 客户来源（1:FESCO 2:自销）
- `customer_nature_id` — 单位性质ID（关联 `base_dict_customer_nature` [base_dict_customer_nature.sql](./reference/base_dict_customer_nature.sql)）
- `customer_industry_id` — 所属行业ID（关联 `base_dict_customer_industry` [base_dict_customer_industry.sql](./reference/base_dict_customer_industry.sql)）
- `customer_contact_id` — 首要联系人ID
- `add_userid` / `update_userid` — 操作人（关联 `base_guohua_user.userid`）

### guohua_customer_opportunity（客户商机表）

- `customer_id` → `guohua_customer.customer_id`
- 详情在 `guohua_customer_opportunity_detail` [guohua_customer_opportunity_detail.sql](./reference/guohua_customer_opportunity_detail.sql)

### guohua_customer_clue（客户销售线索表）

- `customer_id` → `guohua_customer.customer_id`

### guohua_customer_opt_clue（客户线索信息表）

- 独立线索来源，关联联系人 `guohua_rel_customer_opt_clue_contact` [guohua_rel_customer_opt_clue_contact.sql](./reference/guohua_rel_customer_opt_clue_contact.sql)

### guohua_customer_follow（客户信息跟进表）

- `customer_id` → `guohua_customer.customer_id`
- 关联礼品 `guohua_rel_customer_follow_gift_claim` [guohua_rel_customer_follow_gift_claim.sql](./reference/guohua_rel_customer_follow_gift_claim.sql)

## 4.2 关联表 (guohua_rel_customer_*)

| 表名 | 说明 | 关联主表 |
|------|------|---------|
| `guohua_rel_customer_channel` [guohua_rel_customer_channel.sql](./reference/guohua_rel_customer_channel.sql) | 客户-渠道多对多关系及关系返款比例 | customer、customer_channel |
| `guohua_rel_customer_contact` [guohua_rel_customer_contact.sql](./reference/guohua_rel_customer_contact.sql) | 联系人信息表 | customer |
| `guohua_rel_customer_clue_record` [guohua_rel_customer_clue_record.sql](./reference/guohua_rel_customer_clue_record.sql) | 客户线索记录 | customer |
| `guohua_rel_customer_clue_visit` [guohua_rel_customer_clue_visit.sql](./reference/guohua_rel_customer_clue_visit.sql) | 线索拜访记录 | opportunity |
| `guohua_rel_customer_files` [guohua_rel_customer_files.sql](./reference/guohua_rel_customer_files.sql) | 客户关联附件 | customer |
| `guohua_rel_customer_declare` [guohua_rel_customer_declare.sql](./reference/guohua_rel_customer_declare.sql) | 客户申报记录 | customer |
| `guohua_rel_customer_declare_files` [guohua_rel_customer_declare_files.sql](./reference/guohua_rel_customer_declare_files.sql) | 国华CRM-客户申报附件表 | customer |
| `guohua_rel_customer_record` [guohua_rel_customer_record.sql](./reference/guohua_rel_customer_record.sql) | 客户信息变更记录 | customer |
| `guohua_rel_customer_info_record` [guohua_rel_customer_info_record.sql](./reference/guohua_rel_customer_info_record.sql) | 客户名称变更记录 | customer |
| `guohua_rel_customer_info_record_files` [guohua_rel_customer_info_record_files.sql](./reference/guohua_rel_customer_info_record_files.sql) | 客户信息变更记录附件表 | customer |
| `guohua_rel_customer_invoice` [guohua_rel_customer_invoice.sql](./reference/guohua_rel_customer_invoice.sql) | 发票信息表 | customer |
| `guohua_rel_customer_lost_record` [guohua_rel_customer_lost_record.sql](./reference/guohua_rel_customer_lost_record.sql) | 客户输单记录 | opportunity |
| `guohua_rel_customer_social_security` [guohua_rel_customer_social_security.sql](./reference/guohua_rel_customer_social_security.sql) | 客户社保信息 | customer |
| `guohua_rel_customer_salary` [guohua_rel_customer_salary.sql](./reference/guohua_rel_customer_salary.sql) | 客户发薪规则 | customer |
| `guohua_rel_customer_attendance` [guohua_rel_customer_attendance.sql](./reference/guohua_rel_customer_attendance.sql) | 客户外勤申请 | customer |
| `guohua_rel_customer_attendance_punch` [guohua_rel_customer_attendance_punch.sql](./reference/guohua_rel_customer_attendance_punch.sql) | 客户外勤打卡 | customer |
| `guohua_rel_customer_report_files` [guohua_rel_customer_report_files.sql](./reference/guohua_rel_customer_report_files.sql) | 客户月报附件 | customer |
| `guohua_rel_customer_prove_files` [guohua_rel_customer_prove_files.sql](./reference/guohua_rel_customer_prove_files.sql) | 渠道证明附件 | customer |
| `guohua_rel_customer_gift_claim` [guohua_rel_customer_gift_claim.sql](./reference/guohua_rel_customer_gift_claim.sql) | 礼品认领表 | customer_gift |
| `guohua_rel_customer_opt_clue_contact` [guohua_rel_customer_opt_clue_contact.sql](./reference/guohua_rel_customer_opt_clue_contact.sql) | 客户线索联系人 | customer_opt_clue |
| `guohua_rel_customer_opt_clue_files` [guohua_rel_customer_opt_clue_files.sql](./reference/guohua_rel_customer_opt_clue_files.sql) | 客户线索附件 | customer_opt_clue |

## 4.3 客户域补充表

| 表名 | 说明 |
|------|------|
| `guohua_customer_channel` | 客户渠道信息表 |
| `guohua_customer_bank_record` | 客户银行记录 |
| `guohua_customer_dashboard_monthly_snapshot` | 客户维度看板月度快照 |
| `guohua_customer_gift_budget` | 客户礼品部门预算表 |
| `guohua_customer_operate_record` | 客户运营跟进记录 |
| `guohua_customer_opt_clue_follow` | 客户线索信息跟进表 |
| `guohua_customer_salary` | 客户薪资管理表 |
| `guohua_customer_service_invoice` | 客户服务费账单 |
| `guohua_rel_opt_clue_record` | 就业管理系统-客户线索变更记录 |
| `income_target_clue` | 2023年部门收入目标表 |

## 4.4 客户域关系图

```
guohua_customer
    ├──► guohua_rel_customer_channel (N:M guohua_customer_channel)
    ├──► guohua_rel_customer_contact (1:N)
    ├──► guohua_customer_clue (1:N)
    ├──► guohua_customer_opt_clue (1:N)
    ├──► guohua_customer_opportunity (1:N)
    │       └──► guohua_customer_opportunity_detail (1:N)
    │       └──► guohua_rel_opportunity_files (1:N)
    │       └──► guohua_rel_customer_clue_visit (1:N)
    ├──► guohua_customer_follow (1:N)
    ├──► guohua_customer_gift (1:N)
    │       └──► guohua_rel_customer_gift_claim (1:N)
    ├──► guohua_customer_operate_record (1:N)
    └──► guohua_customer_user (1:N)
```
