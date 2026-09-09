# 九、营销AI域

## 9.1 Agent 体系 (market_*)

| 表名 | 说明 |
|------|------|
| `market_agents` [market_agents.sql](./reference/market_agents.sql) | Agent 定义表 |
| `market_agent_claw` [market_agent_claw.sql](./reference/market_agent_claw.sql) | 智能体空间(claw)定义 |
| `market_agent_skills` [market_agent_skills.sql](./reference/market_agent_skills.sql) | AI Agent 技能包 |
| `market_agent_tools` [market_agent_tools.sql](./reference/market_agent_tools.sql) | AI Agent 工具 |
| `market_agent_rel_claw` [market_agent_rel_claw.sql](./reference/market_agent_rel_claw.sql) | claw ↔ agent 多对多 |
| `market_agent_rel_skill` [market_agent_rel_skill.sql](./reference/market_agent_rel_skill.sql) | Agent ↔ 技能 |
| `market_agent_rel_tool` [market_agent_rel_tool.sql](./reference/market_agent_rel_tool.sql) | Agent/Claw/Skill ↔ 工具多对多 |
| `market_app_session` [market_app_session.sql](./reference/market_app_session.sql) | 营销小程序会话 |
| `market_users` [market_users.sql](./reference/market_users.sql) | 营销小程序用户 |
| `market_roles` [market_roles.sql](./reference/market_roles.sql) | 营销小程序角色 |
| `market_user_roles` [market_user_roles.sql](./reference/market_user_roles.sql) | 用户-角色关联 |
| `market_system_var` [market_system_var.sql](./reference/market_system_var.sql) | 系统变量(kv配置) |

## 9.2 营销小程序业务

| 表名 | 说明 |
|------|------|
| `market_customer_bind_apply` [market_customer_bind_apply.sql](docs/sql/database_relation/reference/market_customer_bind_apply.sql) | 客户绑定申请(扫码邀请) |
| `market_invite_relation` [market_invite_relation.sql](docs/sql/database_relation/reference/market_invite_relation.sql) | 邀请关系 |
| `market_invite_scan_log` [market_invite_scan_log.sql](docs/sql/database_relation/reference/market_invite_scan_log.sql) | 邀请码扫码日志 |
| `market_customer_demand_confirm_record` [market_customer_demand_confirm_record.sql](docs/sql/database_relation/reference/market_customer_demand_confirm_record.sql) | 客户需求确认记录 |
| `market_customer_salary_confirm_record` [market_customer_salary_confirm_record.sql](docs/sql/database_relation/reference/market_customer_salary_confirm_record.sql) | 客户账单确认记录 |
| `market_salary_batch_confirm` [market_salary_batch_confirm.sql](docs/sql/database_relation/reference/market_salary_batch_confirm.sql) | 账单批量合并展示记录 |
| `market_customer_service_report_file` [market_customer_service_report_file.sql](docs/sql/database_relation/reference/market_customer_service_report_file.sql) | 月度服务报告记录 |
| `market_customer_service_report_stat` [market_customer_service_report_stat.sql](docs/sql/database_relation/reference/market_customer_service_report_stat.sql) | 服务报告统计快照 |
| `market_demand_confirm_remind_log` [market_demand_confirm_remind_log.sql](docs/sql/database_relation/reference/market_demand_confirm_remind_log.sql) | 需求确认客服推送日志 |
| `market_salary_confirm_remind_log` [market_salary_confirm_remind_log.sql](docs/sql/database_relation/reference/market_salary_confirm_remind_log.sql) | 账单确认客服推送日志 |
| `market_fx_leads_log` [market_fx_leads_log.sql](docs/sql/database_relation/reference/market_fx_leads_log.sql) | 纷享销客新增线索日志 |
| `market_feedback` [market_feedback.sql](docs/sql/database_relation/reference/market_feedback.sql) | 意见反馈 |
| `market_material_generate_record` [market_material_generate_record.sql](docs/sql/database_relation/reference/market_material_generate_record.sql) | 素材生成记录 |

## 9.2.1 销售陪练 (work_sales_coach_*)

> 大模型驱动的销售对话陪练系统，支持考试、学习、知识卡片等功能。

| 表名 | 说明 |
|------|------|
| `work_sales_coach_card_category` | 销售陪练知识卡片专题 |
| `work_sales_coach_chat_session` | 大模型销售对话陪练会话 |
| `work_sales_coach_exam` | 销售陪练考试任务 |
| `work_sales_coach_exam_attempt` | 销售陪练考试作答记录 |
| `work_sales_coach_learning` | 案例/知识卡片学习进度 |
| `work_sales_coach_question` | 销售陪练题库 |
| `work_sales_coach_resource` | 销售陪练通用资源表（场景/案例/知识卡片） |

## 9.3 AIGC 模型

| 表名 | 说明 |
|------|------|
| `base_aigc_model` [base_aigc_model.sql](./reference/base_aigc_model.sql) | AIGC模型定义 |
| `base_dict_aigc_type` [base_dict_aigc_type.sql](./reference/base_dict_aigc_type.sql) | AIGC类型字典 |
| `work_aigc_app_session` [work_aigc_app_session.sql](./reference/work_aigc_app_session.sql) | AIGC应用会话 |

**FK关系**: `base_aigc_model.aigc_type_id` → `base_dict_aigc_type.aigc_type_id`（整个库唯一显式外键）
