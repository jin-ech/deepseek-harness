# 数据库表关系文档

> **数据库**: `guohua_operate_fx_crm`（测试环境 `47.93.181.192:3306`）
> **来源**: `guohua_operate_fx_crm.bk.sql`（14,446 行 / 2026-08-04 导出）
> **类型**: MySQL 10.2.25-MariaDB / InnoDB / utf8mb4
> **表总数**: ~633 张（含备份表、临时表）
> **外键约束**: 仅 1 条显式 FK（`base_aigc_model → base_dict_aigc_type`），其余关联均通过字段命名约定

---

## 目录导读

本文档按**由总到分、由核心到边缘**的顺序组织，各章节内容已拆分至独立文件，点击标题即可跳转深入阅读：

| 序号 | 章节 | 说明 | 详情 |
|------|------|------|------|
| 1 | [数据库全景](01-overview.md) | 表分类统计、Top 10 Hub 表、整体架构图 | [查看详情 →](01-overview.md) |
| 2 | [核心业务关系图](02-core-relationships.md) | 六大核心实体关联、财务流转、数据主线 | [查看详情 →](02-core-relationships.md) |
| 3 | [基础数据层](03-base-data.md) | 字典(79张)、组织/权限、部门、菜单 | [查看详情 →](03-base-data.md) |
| 4 | [客户管理域](04-customer.md) | 客户、商机、线索、跟进 | [查看详情 →](04-customer.md) |
| 5 | [合同与财务域](05-contract-finance.md) | 合同、账单、回款、付款、薪资 | [查看详情 →](05-contract-finance.md) |
| 6 | [人员与就业域](06-personnel.md) | 残疾人、需求、岗位、匹配、事件 | [查看详情 →](06-personnel.md) |
| 7 | [基地与门店域](07-store.md) | 基地、任务、产品、订单、看板 | [查看详情 →](07-store.md) |
| 8 | [助益行小程序域](08-zyx.md) | 活动、积分、作品、商城 | [查看详情 →](08-zyx.md) |
| 9 | [营销AI域](09-marketing-ai.md) | Agent、Claw、Skill、Tool | [查看详情 →](09-marketing-ai.md) |
| 10 | [测评与残疾人评估域](10-evaluation.md) | 题库、测评、二维码 | [查看详情 →](10-evaluation.md) |
| 11 | [经营分析与看板域](11-dashboard.md) | 指标、日报、快照 | [查看详情 →](11-dashboard.md) |
| 12 | [激励策略域](12-incentive.md) | 触发节点、角色字典、激励记录、冲刺活动 | [查看详情 →](12-incentive.md) |
| 13 | [其他域](13-other.md) | 外呼、政策、任务、公告 | [查看详情 →](13-other.md) |
| 14 | [表间关联关系汇总](14-relationships-summary.md) | 通过字段命名推断的关联、附件模式、ER 简图 | [查看详情 →](14-relationships-summary.md) |

---

## 快速导航

### 核心表查询
- **客户主表**: `guohua_customer` → [客户管理域](04-customer.md)
- **合同信息**: `guohua_contract` → [合同与财务域](05-contract-finance.md)
- **残疾人**: `guohua_persons` → [人员与就业域](06-personnel.md)
- **基地/门店**: `guohua_store` → [基地与门店域](07-store.md)
- **冲刺活动人员提成**: `guohua_sprint_activity_user_rel` → [激励策略域](12-incentive.md)

### 字典表查询
- 客户字典 → [基础数据层](03-base-data.md)
- 合同字典 → [基础数据层](03-base-data.md)
- 财务字典 → [基础数据层](03-base-data.md)
- 激励节点字典 → [激励策略域](12-incentive.md)

### 关联查询
- 所有关联模式汇总 → [表间关联关系汇总](14-relationships-summary.md)

---

> **说明**: 本文档基于 SQL 导出文件 `guohua_operate_fx_crm.bk.sql` 解析生成。项目未使用外键约束（FOREIGN KEY），所有关联关系通过字段命名约定实现（如 `customer_id` 指向 `guohua_customer` 表）。带 `_bak`、日期后缀的表为历史备份，不参与业务逻辑。
