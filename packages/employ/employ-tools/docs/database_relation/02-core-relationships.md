# 二、核心业务关系图

## 2.1 六大核心实体

```
                    ┌───────────────────────┐
                    │   guohua_customer     │  客户信息表
                    │   (PK: customer_id)   │  ← 被102张表引用
                    └──┬──────────┬─────────┘
                       │          │
            ┌──────────┘          └──────────┐
            ▼                                ▼
  ┌──────────────────┐           ┌─────────────────────┐
  │ guohua_contract  │           │ guohua_customer_    │
  │   合同信息表      │           │ opportunity         │
  │ (PK: contract_id)│           │   客户商机表         │
  └──┬───────────────┘           └─────────────────────┘
     │ customer_id
     ▼
  ┌──────────────────           ┌─────────────────────┐
  │ guohua_demand    │◄─────────►│ guohua_employ_demand│
  │  需求信息表(B端)  │           │  C端需求信息表       │
  │ (PK: id)         │           └──────────┬──────────┘
  └──┬───────────────┘                      │
     │ demand_id                            │ demand_id
     ▼                                      ▼
  ──────────────────┐           ┌─────────────────────┐
  │ guohua_persons   │           │ guohua_persons_match│
  │  残疾人表        │           │  人员岗位匹配表       │
  │ (PK: persons_id) │           └─────────────────────┘
  │  ← 被88张表引用   │
  └──┬───────────────┘
     │ persons_id
     ▼
  ┌──────────────────┐           ─────────────────────┐
  │ guohua_store     │           │ guohua_service      │
  │  培就单店/基地    │           │  服务信息表          │
  │ (PK: id)         │           │ (PK: id)            │
  └──────────────────┘           └─────────────────────┘
```

## 2.2 财务流转关系

```
  guohua_customer (客户)
       │
       ├──► guohua_bill (开票信息)
       │         │
       │         ──► guohua_rel_bill_detail (账单明细关联)
       │                   │
       │                   ──► guohua_rel_bill_claim (开票确认)
       │
       ├──► guohua_payment (到款)
       │         │
       │         ├──► guohua_payment_confirm (回款确认)
       │         │         │
       │         │         └──► guohua_rel_bill_payment_confirm (核销关联)
       │         │
       │         └──► guohua_payment_split (到款拆分)
       │
       ──► guohua_customer_payment_detail (FESCO到款明细)
                 │
                 └──► guohua_customer_payment_risk (风险金汇总)
```

## 2.3 数据流转主线

```
【获客】客户线索/商机 → 跟进记录 → 签约合同
         ↓
【运营】合同 → 需求 → 人员入职 → 基地安排
         ↓
【财务】合同 → 账单 → 开票 → 回款确认 → 核销
         ↓
【交付】人员 → 打卡/考勤 → 任务完成 → 薪资发放
         ↓
【分析】日报/月报 → 指标快照 → 驾驶舱看板
```
