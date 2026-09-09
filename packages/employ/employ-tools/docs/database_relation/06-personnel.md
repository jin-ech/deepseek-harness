# 六、人员与就业域

## 6.1 残疾人主表

### guohua_persons（残疾人表）

核心关联：
- `persons_id` [PK] — 人员ID
- `customer_id` → `guohua_customer.customer_id`
- `demand_id` → `guohua_demand.id`
- `store_id` → `guohua_store.id`
- `contract_id` → `guohua_contract.id`

### persons_* 详情表

| 表名 | 说明 | 关联字段 |
|------|------|---------|
| `persons_disability` [persons_disability.sql](./reference/persons_disability.sql) | 残疾状况表 | persons_id |
| `persons_family` [persons_family.sql](./reference/persons_family.sql) | 家庭成员表 | persons_id |
| `persons_family_situation` [persons_family_situation.sql](./reference/persons_family_situation.sql) | 家庭情况表 | persons_id |
| `persons_education` [persons_education.sql](./reference/persons_education.sql) | 学历表 | persons_id |
| `persons_health` [persons_health.sql](./reference/persons_health.sql) | 健康状况表 | persons_id |
| `persons_environment` [persons_environment.sql](./reference/persons_environment.sql) | 生活环境表 | persons_id |
| `persons_guardian` [persons_guardian.sql](./reference/persons_guardian.sql) | 监护人表 | persons_id |
| `persons_bank` [persons_bank.sql](./reference/persons_bank.sql) | 银行信息表 | persons_id |
| `persons_work` [persons_work.sql](./reference/persons_work.sql) | 工作经历/就职记录 | persons_id |
| `persons_work_history` [persons_work_history.sql](./reference/persons_work_history.sql) | 工作经历(历史) | persons_id |
| `persons_assist_utensil` [persons_assist_utensil.sql](./reference/persons_assist_utensil.sql) | 辅助器具表 | persons_id |
| `persons_multiple` [persons_multiple.sql](./reference/persons_multiple.sql) | 多重残疾表 | persons_id |
| `persons_payslip` [persons_payslip.sql](./reference/persons_payslip.sql) | 工资条图片表 | persons_id |
| `persons_img` [persons_img.sql](./reference/persons_img.sql) | 附件图片表 | persons_id |
| `persons_performance` [persons_performance.sql](./reference/persons_performance.sql) | 绩效评价表 | persons_id |
| `persons_transfer` [persons_transfer.sql](./reference/persons_transfer.sql) | 转签记录表 | persons_id |
| `persons_message_sms` [persons_message_sms.sql](./reference/persons_message_sms.sql) | 短信发送记录 | persons_id |
| `guohua_persons_face_profile` | 人员人脸档案表 | persons_id |
| `guohua_persons_leave` | 残疾人请假申请主表 | persons_id |
| `guohua_persons_leave_detail` | 请假日期明细 | persons_id |
| `guohua_persons_leave_schedule_rel` | 请假单与排班挂起关联 | persons_id |
| `guohua_persons_edit_log` [guohua_persons_edit_log.sql](./reference/guohua_persons_edit_log.sql) | 人员编辑记录 | persons_id |
| `guohua_persons_update_record` [guohua_persons_update_record.sql](./reference/guohua_persons_update_record.sql) | 人员更新记录 | persons_id |

## 6.2 需求管理

### guohua_demand（需求信息表 B端）

- `customer_id` → `guohua_customer.customer_id`
- `contract_id` → `guohua_contract.id`

### guohua_employ_demand（C端需求信息表）

- 独立C端需求，可关联合同

### 需求关联表

| 表名 | 说明 |
|------|------|
| `guohua_rel_demand_job` [guohua_rel_demand_job.sql](./reference/guohua_rel_demand_job.sql) | 需求关联岗位需求 |
| `guohua_rel_demand_files` [guohua_rel_demand_files.sql](./reference/guohua_rel_demand_files.sql) | 需求人员合同附件 |
| `guohua_rel_demand_audit` [guohua_rel_demand_audit.sql](./reference/guohua_rel_demand_audit.sql) | 需求审核记录 |
| `guohua_rel_demand_change_record` [guohua_rel_demand_change_record.sql](./reference/guohua_rel_demand_change_record.sql) | 需求变更记录 |
| `guohua_rel_demand_customize_product` [guohua_rel_demand_customize_product.sql](./reference/guohua_rel_demand_customize_product.sql) | 需求定制劳动产品 |
| `guohua_audit_employ_demand` [guohua_audit_employ_demand.sql](./reference/guohua_audit_employ_demand.sql) | 需求审核记录 |

## 6.3 岗位与匹配

| 表名 | 说明 |
|------|------|
| `guohua_work_position` [guohua_work_position.sql](./reference/guohua_work_position.sql) | 工作岗位表 |
| `guohua_work_position_content` [guohua_work_position_content.sql](./reference/guohua_work_position_content.sql) | 岗位工作内容 |
| `guohua_work_position_type` [guohua_work_position_type.sql](./reference/guohua_work_position_type.sql) | 岗位工种 |
| `guohua_company_job` [guohua_company_job.sql](./reference/guohua_company_job.sql) | 企业工作岗位信息 |
| `guohua_employ_job_match` [guohua_employ_job_match.sql](./reference/guohua_employ_job_match.sql) | 小程序人员申请匹配 |
| `guohua_persons_match` [guohua_persons_match.sql](./reference/guohua_persons_match.sql) | 人员岗位匹配信息 |
| `guohua_persons_match_expect` [guohua_persons_match_expect.sql](./reference/guohua_persons_match_expect.sql) | 人员岗位预匹配 |
| `guohua_persons_match_expect_record` [guohua_persons_match_expect_record.sql](./reference/guohua_persons_match_expect_record.sql) | 就业管理系统-人员岗位预匹配信息表 |
| `guohua_persons_match_wide` [guohua_persons_match_wide.sql](./reference/guohua_persons_match_wide.sql) | 人员匹配大宽表 |

## 6.4 特殊事件

### persons_special_event（人员特殊事件上报信息表）

| 表名 | 说明 |
|------|------|
| `persons_special_event_content` [persons_special_event_content.sql](./reference/persons_special_event_content.sql) | 事件操作记录 |
| `persons_special_event_approva` [persons_special_event_approva.sql](./reference/persons_special_event_approva.sql) | 事件审核记录 |
| `persons_special_event_in` [persons_special_event_in.sql](./reference/persons_special_event_in.sql) | 内部事件处理 |
| `persons_special_event_in_process` [persons_special_event_in_process.sql](./reference/persons_special_event_in_process.sql) | 内部事件进度 |
| `persons_special_event_in_social_security` [persons_special_event_in_social_security.sql](./reference/persons_special_event_in_social_security.sql) | 内部事件社保增减员 |
| `persons_special_event_in_persons_reduce` [persons_special_event_in_persons_reduce.sql](./reference/persons_special_event_in_persons_reduce.sql) | 内部事件客户减员 |
| `persons_special_event_in_urge_record` [persons_special_event_in_urge_record.sql](./reference/persons_special_event_in_urge_record.sql) | 内部事件催办记录 |

| 表名 | 说明 |
|------|------|
| `guohua_rel_persons_special_event_files` [guohua_rel_persons_special_event_files.sql](./reference/guohua_rel_persons_special_event_files.sql) | 事件附件 |
| `guohua_rel_persons_special_event_content_files` [guohua_rel_persons_special_event_content_files.sql](./reference/guohua_rel_persons_special_event_content_files.sql) | 事件操作附件 |
| `guohua_rel_persons_special_event_in_files` [guohua_rel_persons_special_event_in_files.sql](./reference/guohua_rel_persons_special_event_in_files.sql) | 内部事件附件 |
| `guohua_rel_persons_special_event_in_important` [guohua_rel_persons_special_event_in_important.sql](./reference/guohua_rel_persons_special_event_in_important.sql) | 重要事件标记 |
| `guohua_rel_persons_files` | 就业管理系统-人员资料附件表 |
| `guohua_rel_persons_files_approval` | 就业管理系统-人员资料附件审核表 |
| `guohua_rel_persons_declare_files` | 就业管理系统-人员申报资料表 |
| `guohua_rel_persons_handbook` | 人员劳动手册记录 |
| `guohua_rel_persons_handbook_files` | 人员劳动手册附件 |
| `guohua_rel_persons_unbind_log` | 就业管理系统-人员解绑记录表 |

## 6.5 人员关系图

```
guohua_persons
    ├──► persons_disability (1:1)
    ├──► persons_family (1:N)
    ├──► persons_education (1:1)
    ├──► persons_health (1:1)
    ├──► persons_work (1:N)
    ├──► persons_bank (1:N)
    ├──► persons_transfer (1:N)
    │
    ├──► guohua_persons_match (1:N)
    ├──► guohua_persons_match_expect (1:N)
    │
    ├──► persons_special_event (1:N)
    │       └──► persons_special_event_in (1:N)
    │
    ├──► guohua_rel_persons_files (1:N)
    ├──► guohua_rel_persons_declare_files (1:N)
    ├──► guohua_rel_persons_handbook (1:N)
    └──► guohua_rel_persons_work_contract_info (1:N)

guohua_demand
    ├──► guohua_rel_demand_job (1:N)
    └──► guohua_persons_match (1:N)
```
