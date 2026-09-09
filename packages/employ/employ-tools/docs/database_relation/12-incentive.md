# 十二、激励策略域

> 激励策略域为新增模块，SQL 见 [reference](./reference/) 目录下各表文件。与既有 `kpi_*` 销售提成体系并存：
> `kpi_*` 专注销售提成计算；`guohua_incentive_*` 面向多角色（销售/运营/客服/经理）通用激励规则配置与执行记录。

## 12.1 冲刺活动表

| 表名 | 说明 |
|------|------|
| `guohua_sprint_activity` [sprint_activity.sql](./reference/sprint_activity.sql) | 冲刺活动主表 |

**核心字段**：`activity_name`(活动名称)、`reward_pool`(奖励池总额/元)、`target_description`(目标说明)、`department_id`(关联部门ID)、`start_time`/`end_time`(活动时间窗)、`status`(0=未开始 1=进行中 2=已结束)

> 目标金额维度（回款/赢单/续签）及挂钩节点（trigger_node）已迁移至 `guohua_sprint_activity_user_rel` 人员配置表，按人独立设定。

**关联查询**：`department_id` → `base_guohua_user.department_id`（LEFT JOIN 查部门名称）；回款统计关联 `guohua_payment_confirm`（按部门+时间窗汇总）

## 12.2 冲刺活动人员提成配置表

| 表名 | 说明 |
|------|------|
| `guohua_sprint_activity_user_rel` [guohua_sprint_activity_user_rel.sql](./reference/guohua_sprint_activity_user_rel.sql) | 冲刺活动人员提成配置表 |

**核心字段**：`activity_id`(活动ID)、`user_id`(人员userid)

- **新签签约提成**：`win_sign_rate_percent`(提成比例%)、`win_sign_fixed_amount`(固定提成金额/元)，二选一填写
- **续签单提成**：`renew_rate_percent`(提成比例%)、`renew_fixed_amount`(固定提成金额/元)，二选一填写
- **个人目标**：`target_win_sign_amount`(赢单签约)、`target_renew_amount`(续签完成)
- **领导提成**：`leader_rate_percent`(领导提成比例%)、`leader_fixed_amount`(领导固定提成金额/元)，二选一填写

> **变更**：原统一的 `rate_type`/`rate_percent`/`fixed_amount`（成员提成）已拆分为新签签约/续签单两组独立配置字段（旧字段 `rate_type` 已移除，按字段是否非空判定生效值）；回款入账提成配置及 `target_payment_amount` 已移除。旧数据已迁移至新签签约提成字段。

**关联关系**：`activity_id` → `guohua_sprint_activity.id`（N:1）；`user_id` → `base_guohua_user.userid`（N:1）；同一活动中同一人员唯一（uk_activity_user）

## 12.3 兑现记录表

| 表名 | 说明 |
|------|------|
| `guohua_sprint_settlement_record` [guohua_sprint_settlement_record.sql](./reference/guohua_sprint_settlement_record.sql) | 冲刺活动兑现记录表 |

**核心字段**：
- **单号 & 审批**：`settlement_no`(兑现单号)、`sp_no`(审批实例ID)、`sp_status`(1=审批中 2=待核算 3=已兑现)
- **关联**：`activity_id`(活动ID)、`user_id`(人员userid)
- **业绩快照**：`related_performance`(业绩描述文案)
- **提成快照**：`commission_method`(提成方式)、`leader_commission_method`(领导提成方式)
- **金额**：`base_commission`(基础提成)、`leader_commission`(领导提成)、`total_commission`(总提成)

**关联关系**：`activity_id` → `guohua_sprint_activity.id`（N:1）；`user_id` → `base_guohua_user.userid`（N:1）

**审批状态流转**：

```
台账列表"核算" → 创建记录(sp_status=1 审批中)
              → 审批通过(sp_status=2 待核算)
              → 核算完成(sp_status=3 已兑现)
```

## 12.5 运营人员绩效

| 表名 | 说明 |
|------|------|
| `guohua_operation_performance` | 运营人员绩效考核原始数据表 |
| `guohua_operation_performance_default` | 运营人员绩效考核默认配置表 |

## 12.6 激励规则

| 表名 | 说明 |
|------|------|
| `guohua_incentive_rule` | 激励规则配置表 |
| `guohua_incentive_simulation` | 提成模拟计算记录表 |

## 12.7 KPI 销售提成体系（补充）

> 与激励策略域并存，专注销售提成计算。

| 表名 | 说明 |
|------|------|
| `kpi_commission_rule` | 提成规则配置表 |
| `kpi_job_position` | 岗位职级基础表 |
| `kpi_overage_reward` | 超额奖励配置表 |
| `kpi_sales_commission_alloc_line` | 销售提成拆分子项明细 |
| `kpi_sales_commission_change_request` | 销售提成修改审批记录表 |
| `kpi_sales_commission_monthly_detail` | 销售提成月度明细表 |
| `kpi_team_manager_commission_rule` | 团队经理团队提成规则表 |

## 12.8 销售分析

| 表名 | 说明 |
|------|------|
| `guohua_sales_basic_info` | 销售基本信息表 |
| `guohua_sales_gap` | 销售看板-回款计划差异数据 |
| `guohua_sales_gap_reason` | 销售看板-差异原因字典 |
| `guohua_sales_monthly_stats` | 销售月度统计 |
| `sale_customer_abnormal_analysis` | 销售客户异常分析表 |
| `sale_rank_config` | 销售排行榜过滤用户配置表 |

## 12.4 激励域关系图

```
guohua_sprint_activity (冲刺活动)
       ├── department_id ──► base_guohua_department.department_id
       └─► guohua_payment_confirm (按部门+时间窗汇总回款)
       │
       └── guohua_sprint_activity_user_rel (人员提成配置)
              ├── activity_id ──► guohua_sprint_activity.id
              └── user_id ──► base_guohua_user.userid
       │
       └── guohua_sprint_settlement_record (兑现记录)
              ├── activity_id ──► guohua_sprint_activity.id
              └── user_id ──► base_guohua_user.userid
```
