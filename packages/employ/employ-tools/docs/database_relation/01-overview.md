# 一、数据库全景

> **数据库**: `guohua_operate_fx_crm`（测试环境 `47.93.181.192:3306`）
> **来源**: `guohua_operate_fx_crm.bk.sql`（14,446 行 / 2026-08-04 导出）
> **类型**: MySQL 10.2.25-MariaDB / InnoDB / utf8mb4
> **表总数**: ~633 张（含备份表、临时表）
> **外键约束**: 仅 1 条显式 FK（`base_aigc_model → base_dict_aigc_type`），其余关联均通过字段命名约定

---

## 1.1 表分类统计

| 前缀 | 含义 | 表数 | 说明 |
|------|------|------|------|
| `guohua_*` | 国华核心业务 | ~204 | 客户、合同、需求、人员、账单、基地等 |
| `guohua_rel_*` | 关联表 | ~105 | 多对多关系、附件关联、认领记录 |
| `base_dict_*` | 数据字典 | ~77 | 各业务域的枚举/配置表 |
| `base_guohua_*` | 基础组织 | 7 | 部门、用户、菜单 |
| `base_permission_*` | 权限 | 3 | 角色、角色权限明细 |
| `persons_*` | 残疾人详情 | 25 | 残疾状况、家庭成员、学历等 |
| `market_*` | 营销小程序 | 24 | Agent、用户、会话、绑定 |
| `work_*` | 工作任务/测评 | ~38 | 任务、测评题库、经营分析、待办 |
| `rel_*` | 助益行关联 | ~29 | 活动收藏、积分、交付 |
| `ins_dict_*` | 残疾人字典 | 18 | 致残原因、学历、家庭等 |
| `cockpit_*` | 领导驾驶舱 | 6 | 经营目标、看板数据 |
| `zyx_*` | 助益行基地导览 | 7 | 基地、站点、活动 |
| `kpi_*` | 提成规则 | ~8 | 销售提成、超额奖励 |
| `guohua_incentive_*` | 激励策略 | 2 | 激励规则配置、激励记录 |
| `fx_*` | 纷享销客 | 4 | CRM回调、映射 |
| `policy_*` | 政策 | 4 | 残保金、社保缴纳 |
| `verify_*` | 残联验证 | 3 | 验证残疾人、康复人员 |
| `psc_*` | 智能方案 | 4 | PSC方案生成记录 |
| `sale_*` / `sell_*` | 销售目标 | 6 | 目标、完成情况 |
| `income_*` | 收入目标 | 3 | 部门收入目标 |

## 1.2 Top 10 核心 Hub 表（被引用最多的表）

| 排名 | 表名 | 被引用次数 | 说明 |
|------|------|-----------|------|
| 1 | `guohua_customer` [guohua_customer.sql](./reference/guohua_customer.sql) | 102 | **客户主表** — 整个系统的中心实体 |
| 2 | `guohua_persons` [guohua_persons.sql](./reference/guohua_persons.sql) | 88 | 残疾人/员工记录（通过 `persons_id` 关联） |
| 3 | `cockpit_dict_department` [cockpit_dict_department.sql](./reference/cockpit_dict_department.sql) | 56 | 部门字典（驾驶舱维度） |
| 4 | `base_dict_area_store` [base_dict_area_store.sql](./reference/base_dict_area_store.sql) | 53 | 地区/基地字典 |
| 5 | `guohua_contract` [guohua_contract.sql](./reference/guohua_contract.sql) | 41 | 合同信息表 |
| 6 | `base_dict_xiaomi_area` [base_dict_xiaomi_area.sql](./reference/base_dict_xiaomi_area.sql) | 26 | 小米区域字典 |
| 7 | `guohua_employ_demand` [guohua_employ_demand.sql](./reference/guohua_employ_demand.sql) | 25 | C端需求信息表 |
| 8 | `guohua_rel_policy_social_account` [guohua_rel_policy_social_account.sql](./reference/guohua_rel_policy_social_account.sql) | 24 | 社保缴费账户配置 |
| 9 | `guohua_standard_service_product` [guohua_standard_service_product.sql](./reference/guohua_standard_service_product.sql) | 24 | 标准服务产品 |
| 10 | `base_dict_system` [base_dict_system.sql](./reference/base_dict_system.sql) | 18 | 系统字典 |

## 1.3 整体架构图

```
┌─────────────────────────────────────────────────────────┐
│                    基础数据层 (base)                      │
│  字典表(77) │ 组织/用户 │ 权限/角色 │ 菜单               │
└──────────────────────┬──────────────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────────────┐
│                   核心业务层 (guohua)                     │
│                                                         │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │ 客户管理  │  │ 合同管理  │  │ 需求管理  │  │ 财务管理 │ │
│  │ customer │  │ contract │  │  demand  │  │ payment │ │
│  └────┬─────┘  ────┬─────┘  └────┬─────┘  └────┬────┘ │
│       └──────────────┼──────────────┼─────────────┘      │
│                      ▼              ▼                    │
│              ┌──────────┐  ┌──────────────┐             │
│              │ 人员管理  │  │ 基地/门店管理  │             │
│              │  persons │  │    store     │             │
│              └─────────┘  └─────────────┘             │
│                   │               │                     │
│                   ▼               ▼                     │
│           ┌───────────┐  ────────────────┐            │
│           │ 残疾人详情 │  │ 任务/产品/订单   │            │
│           │ persons_* │  │ work_task/store │            │
│           └───────────┘  └────────────────┘            │
└─────────────────────────────────────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────────────┐
│                   外围应用层                              │
│  助益行小程序(ens) │ 营销小程序(market) │ 测评系统(work)   │
│  领导驾驶舱(cockpit) │ 外呼系统 │ 政策管理                │
└─────────────────────────────────────────────────────────┘
```
