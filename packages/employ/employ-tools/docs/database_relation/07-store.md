# 七、基地与门店域

## 7.1 基地主表

### guohua_store（培就单店表）

核心字段：
- `id` [PK]
- `store_name` — 基地名称
- `customer_id` → `guohua_customer.customer_id`
- `store_type_id` → `base_dict_store_type` [base_dict_store_type.sql](./reference/base_dict_store_type.sql)

### 基地关联表

| 表名 | 说明 |
|------|------|
| `guohua_rel_store_files` [guohua_rel_store_files.sql](./reference/guohua_rel_store_files.sql) | 单店协议附件 |
| `guohua_rel_store_photo` [guohua_rel_store_photo.sql](./reference/guohua_rel_store_photo.sql) | 单店照片附件 |
| `guohua_rel_store_feature_photo` [guohua_rel_store_feature_photo.sql](./reference/guohua_rel_store_feature_photo.sql) | 特色项目照片 |
| `guohua_store_task` [guohua_store_task.sql](./reference/guohua_store_task.sql) | 基地任务表 |
| `guohua_store_kpi_dict` [guohua_store_kpi_dict.sql](./reference/guohua_store_kpi_dict.sql) | 基地任务指标字典 |
| `guohua_store_visit_record` [guohua_store_visit_record.sql](./reference/guohua_store_visit_record.sql) | 基地拜访留痕 |
| `guohua_store_message` [guohua_store_message.sql](./reference/guohua_store_message.sql) | 基地订单消息 |
| `guohua_store_login_log` [guohua_store_login_log.sql](./reference/guohua_store_login_log.sql) | 基地登录日志 |
| `guohua_store_attendance_abnormal_follow` [guohua_store_attendance_abnormal_follow.sql](./reference/guohua_store_attendance_abnormal_follow.sql) | 考勤异常跟进 |
| `guohua_store_attendance_abnormal_record` [guohua_store_attendance_abnormal_record.sql](./reference/guohua_store_attendance_abnormal_record.sql) | 考勤异常记录 |
| `guohua_store_manage_fees` [guohua_store_manage_fees.sql](./reference/guohua_store_manage_fees.sql) | 基地管理费统计 |
| `guohua_store_manage_fee_person` [guohua_store_manage_fee_person.sql](./reference/guohua_store_manage_fee_person.sql) | 基地管理费人员明细 |
| `guohua_store_score_record` [guohua_store_score_record.sql](./reference/guohua_store_score_record.sql) | 基地年度评分记录 |
| `guohua_store_potential_update_record` [guohua_store_potential_update_record.sql](./reference/guohua_store_potential_update_record.sql) | 残疾人潜力修改记录 |
| `guohua_store_persons_bind_photo_file` [guohua_store_persons_bind_photo_file.sql](./reference/guohua_store_persons_bind_photo_file.sql) | 绑定打卡照片记录 |
| `guohua_store_type_work_content` [guohua_store_type_work_content.sql](./reference/guohua_store_type_work_content.sql) | 基地类型工作内容分配 |

## 7.2 基地产品与订单

### guohua_store_product（基地劳动产品表）

| 表名 | 说明 |
|------|------|
| `guohua_store_product_order` [guohua_store_product_order.sql](./reference/guohua_store_product_order.sql) | 基地劳动产品订单 |
| `guohua_store_product_order_detail` [guohua_store_product_order_detail.sql](./reference/guohua_store_product_order_detail.sql) | 订单产品信息 |
| `guohua_store_product_order_detail_produce` [guohua_store_product_order_detail_produce.sql](./reference/guohua_store_product_order_detail_produce.sql) | 订单产品生产信息 |
| `guohua_store_product_order_assign_record` [guohua_store_product_order_assign_record.sql](./reference/guohua_store_product_order_assign_record.sql) | 订单分配记录 |
| `guohua_store_product_order_confirm_record` [guohua_store_product_order_confirm_record.sql](./reference/guohua_store_product_order_confirm_record.sql) | 订单确认记录 |
| `guohua_store_product_order_confirm_link_record` [guohua_store_product_order_confirm_link_record.sql](./reference/guohua_store_product_order_confirm_link_record.sql) | 订单确认链接记录 |
| `guohua_store_product_order_external` [guohua_store_product_order_external.sql](./reference/guohua_store_product_order_external.sql) | 外部订单关联 |

### 订单交付物流

| 表名 | 说明 |
|------|------|
| `guohua_store_product_order_salary` [guohua_store_product_order_salary.sql](./reference/guohua_store_product_order_salary.sql) | 基地产品交付账单 |
| `guohua_store_product_order_salary_detail` [guohua_store_product_order_salary_detail.sql](./reference/guohua_store_product_order_salary_detail.sql) | 交付账单明细 |
| `guohua_store_product_order_salary_persons_bank` [guohua_store_product_order_salary_persons_bank.sql](./reference/guohua_store_product_order_salary_persons_bank.sql) | 人员银行卡信息 |
| `rel_store_product_order_delivery` [rel_store_product_order_delivery.sql](./reference/rel_store_product_order_delivery.sql) | 交付物流信息 |
| `rel_store_product_order_delivery_files` [rel_store_product_order_delivery_files.sql](./reference/rel_store_product_order_delivery_files.sql) | 交付附件 |
| `rel_store_product_order_deliver_record` [rel_store_product_order_deliver_record.sql](./reference/rel_store_product_order_deliver_record.sql) | 交付记录 |
| `rel_store_product_order_deliver_back` [rel_store_product_order_deliver_back.sql](./reference/rel_store_product_order_deliver_back.sql) | 退回信息 |
| `rel_store_product_order_deliver_back_detail` | 劳动产品订单产品交付记录退回明细信息表 |
| `rel_store_product_order_deliver_back_express` [rel_store_product_order_deliver_back_express.sql](./reference/rel_store_product_order_deliver_back_express.sql) | 退回物流 |
| `rel_store_product_order_deliver_back_files` [rel_store_product_order_deliver_back_files.sql](./reference/rel_store_product_order_deliver_back_files.sql) | 退回附件 |
| `rel_store_product_order_deliver_record` [rel_store_product_order_deliver_record.sql](./reference/rel_store_product_order_deliver_record.sql) | 交付记录 |
| `rel_store_product_order_deliver_record_detail` | 劳动产品订单产品交付记录明细信息表 |
| `rel_store_product_order_deliver_record_express` | 劳动产品订单产品交付物流信息表 |
| `rel_store_product_order_deliver_record_files` | 劳动产品订单产品交付附件信息表 |

### 订单材料包

| 表名 | 说明 |
|------|------|
| `rel_store_product_order_material` [rel_store_product_order_material.sql](./reference/rel_store_product_order_material.sql) | 材料包信息 |
| `rel_store_product_order_material_files` [rel_store_product_order_material_files.sql](./reference/rel_store_product_order_material_files.sql) | 材料包附件 |

## 7.3 基地看板

| 表名 | 说明 |
|------|------|
| `guohua_store_dashboard_daily_snapshot` [guohua_store_dashboard_daily_snapshot.sql](./reference/guohua_store_dashboard_daily_snapshot.sql) | 基地按天考勤快照 |
| `guohua_store_dashboard_monthly_snapshot` [guohua_store_dashboard_monthly_snapshot.sql](./reference/guohua_store_dashboard_monthly_snapshot.sql) | 基地月度公共指标快照 |
| `guohua_store_dashboard_source_snapshot` | 基地看板月度快照-客户来源维度(可拆人级指标) |
| `guohua_store_rank_monthly` [guohua_store_rank_monthly.sql](./reference/guohua_store_rank_monthly.sql) | 基地月度榜单 |
| `guohua_store_rank_monthly_stats` [guohua_store_rank_monthly_stats.sql](./reference/guohua_store_rank_monthly_stats.sql) | 基地月度排行榜 |
| `guohua_store_total_detail` [guohua_store_total_detail.sql](./reference/guohua_store_total_detail.sql) | 销售目标完成情况 |
| `rel_store_task_kpi` [rel_store_task_kpi.sql](./reference/rel_store_task_kpi.sql) | 基地任务目标完成情况 |
| `rel_store_persons_works_style` [rel_store_persons_works_style.sql](./reference/rel_store_persons_works_style.sql) | 基地学员风采 |
| `threading` | 基地线程id统计表 |

## 7.4 基地关系图

```
guohua_store
    ├──► guohua_store_product (1:N)
    │       ──► guohua_store_product_order (1:N)
    │               ├──► guohua_store_product_order_detail (1:N)
    │               ├──► guohua_store_product_order_salary (1:N)
    │               ├──► rel_store_product_order_delivery (1:N)
    │               └──► rel_store_product_order_material (1:N)
    │
    ├──► guohua_store_task (1:N)
    │       └──► rel_store_task_kpi (1:N)
    │
    ├──► guohua_rel_store_files (1:N)
    ├──► guohua_rel_store_photo (1:N)
    └──► guohua_store_visit_record (1:N)
```
