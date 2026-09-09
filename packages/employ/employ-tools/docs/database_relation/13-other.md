# 十三、其他域

## 13.1 工作任务

| 表名 | 说明 |
|------|------|
| `guohua_work_task` [guohua_work_task.sql](./reference/guohua_work_task.sql) | 工作任务主表 |
| `guohua_work_task_type` [guohua_work_task_type.sql](./reference/guohua_work_task_type.sql) | 工作任务一级类型 |
| `guohua_work_task_subtype` [guohua_work_task_subtype.sql](./reference/guohua_work_task_subtype.sql) | 工作任务子类型(表单模板挂载层) |
| `guohua_work_task_occurrence` [guohua_work_task_occurrence.sql](./reference/guohua_work_task_occurrence.sql) | 任务周期实例(task×period) |
| `guohua_work_task_schedule_config` [guohua_work_task_schedule_config.sql](./reference/guohua_work_task_schedule_config.sql) | 排班任务配置 |
| `guohua_work_task_schedule_detail` [guohua_work_task_schedule_detail.sql](./reference/guohua_work_task_schedule_detail.sql) | 排班明细(某人在某工作日的一次排班) |
| `guohua_work_task_schedule_period` [guohua_work_task_schedule_period.sql](./reference/guohua_work_task_schedule_period.sql) | 排班周期(task×period) |
| `guohua_work_task_submit` [guohua_work_task_submit.sql](./reference/guohua_work_task_submit.sql) | 任务成果提交明细 |
| `guohua_work_task_activity` [guohua_work_task_activity.sql](./reference/guohua_work_task_activity.sql) | 任务活动日志 |
| `guohua_work_task_person_filter` [guohua_work_task_person_filter.sql](./reference/guohua_work_task_person_filter.sql) | 人员过滤配置 |
| `guohua_work_task_poi_keyword` [guohua_work_task_poi_keyword.sql](./reference/guohua_work_task_poi_keyword.sql) | POI关键字 |
| `guohua_rel_work_task_person` [guohua_rel_work_task_person.sql](./reference/guohua_rel_work_task_person.sql) | 任务-人员分配关联(含进度) |
| `guohua_rel_work_task_person_period` [guohua_rel_work_task_person_period.sql](./reference/guohua_rel_work_task_person_period.sql) | 任务-人员-周期 |
| `guohua_rel_work_task_target` [guohua_rel_work_task_target.sql](./reference/guohua_rel_work_task_target.sql) | 任务-分发目标(企业/基地)关联 |
| `work_todo_item` [work_todo_item.sql](./reference/work_todo_item.sql) | 待办事项 |
| `work_todo_item_role` [work_todo_item_role.sql](./reference/work_todo_item_role.sql) | 角色-待办关联 |
| `work_role_rank` [work_role_rank.sql](./reference/work_role_rank.sql) | 业务板块 |
| `work_role_skill` [work_role_skill.sql](./reference/work_role_skill.sql) | 角色-技能绑定 |
| `work_skills` [work_skills.sql](./reference/work_skills.sql) | AI技能包 |
| `work_skill_share` [work_skill_share.sql](./reference/work_skill_share.sql) | 技能分享 |
| `work_task_share` [work_task_share.sql](./reference/work_task_share.sql) | 工作任务分享代填 |
| `work_business_dict` | 业务板块字典表 |
| `work_rank_dict` | 业务板块字典表 |
| `work_region_code_map` | 行政区划码映射表 |

## 13.2 政策管理

| 表名 | 说明 |
|------|------|
| `guohua_policy` [guohua_policy.sql](./reference/guohua_policy.sql) | 就业政策表 |
| `policy_social` [policy_social.sql](./reference/policy_social.sql) | 社保缴纳比例 |
| `policy_disability_insurance` [policy_disability_insurance.sql](./reference/policy_disability_insurance.sql) | 残保金缴纳政策 |
| `policy_contact_phone` [policy_contact_phone.sql](./reference/policy_contact_phone.sql) | 政策联系人 |
| `guohua_rel_policy_social_account` [guohua_rel_policy_social_account.sql](./reference/guohua_rel_policy_social_account.sql) | 社保缴费比例动态配置（被24张表引用） |
| `guohua_rel_policy_social_account_record` [guohua_rel_policy_social_account_record.sql](./reference/guohua_rel_policy_social_account_record.sql) | 社保配置记录 |
| `guohua_rel_policy_disabled_tel` [guohua_rel_policy_disabled_tel.sql](./reference/guohua_rel_policy_disabled_tel.sql) | 政策残联通讯录 |
| `guohua_rel_policy_tel_book_files` [guohua_rel_policy_tel_book_files.sql](./reference/guohua_rel_policy_tel_book_files.sql) | 通讯录附件 |
| `guohua_rel_policy_min_money` [guohua_rel_policy_min_money.sql](./reference/guohua_rel_policy_min_money.sql) | 最低工资 |
| `guohua_rel_policy_files` [guohua_rel_policy_files.sql](./reference/guohua_rel_policy_files.sql) | 政策其他附件 |
| `guohua_rel_policy_subsidy_policies_files` [guohua_rel_policy_subsidy_policies_files.sql](./reference/guohua_rel_policy_subsidy_policies_files.sql) | 补贴政策 |

## 13.3 外呼系统

| 表名 | 说明 |
|------|------|
| `guohua_call_center` [guohua_call_center.sql](./reference/guohua_call_center.sql) | 外呼信息表 |
| `guohua_call_center_easy` [guohua_call_center_easy.sql](./reference/guohua_call_center_easy.sql) | 极简外呼 |
| `guohua_call_center_easy_agent` [guohua_call_center_easy_agent.sql](./reference/guohua_call_center_easy_agent.sql) | 极简外呼坐席 |
| `guohua_call_center_easy_agent_members` [guohua_call_center_easy_agent_members.sql](./reference/guohua_call_center_easy_agent_members.sql) | 极简外呼坐席明细 |
| `guohua_call_center_moor` [guohua_call_center_moor.sql](./reference/guohua_call_center_moor.sql) | 七陌外呼 |
| `guohua_call_center_moor_agent` [guohua_call_center_moor_agent.sql](./reference/guohua_call_center_moor_agent.sql) | 七陌外呼坐席 |
| `guohua_call_center_ruoyun_agent` [guohua_call_center_ruoyun_agent.sql](./reference/guohua_call_center_ruoyun_agent.sql) | 若云外呼坐席 |
| `guohua_call_center_notice` [guohua_call_center_notice.sql](./reference/guohua_call_center_notice.sql) | 外呼通知 |
| `guohua_call_dict_code` [guohua_call_dict_code.sql](./reference/guohua_call_dict_code.sql) | 外呼错误码 |

## 13.4 其他业务表

| 表名 | 说明 |
|------|------|
| `guohua_mission` [guohua_mission.sql](./reference/guohua_mission.sql) | 任务信息表 |
| `guohua_rel_mission_claim` [guohua_rel_mission_claim.sql](./reference/guohua_rel_mission_claim.sql) | 任务认领人 |
| `guohua_rel_mission_files` [guohua_rel_mission_files.sql](./reference/guohua_rel_mission_files.sql) | 任务材料附件 |
| `guohua_rel_mission_store` [guohua_rel_mission_store.sql](./reference/guohua_rel_mission_store.sql) | 任务分配基地 |
| `guohua_seal` [guohua_seal.sql](./reference/guohua_seal.sql) | 用印申请 |
| `guohua_rights_protection` [guohua_rights_protection.sql](./reference/guohua_rights_protection.sql) | 维权信息 |
| `guohua_message` [guohua_message.sql](./reference/guohua_message.sql) | 消息通知 |
| `guohua_regulation` [guohua_regulation.sql](./reference/guohua_regulation.sql) | 规章制度 |
| `guohua_version` [guohua_version.sql](./reference/guohua_version.sql) | 系统版本记录 |
| `guohua_holiday_calendar` [guohua_holiday_calendar.sql](./reference/guohua_holiday_calendar.sql) | 节假日与调休补班 |
| `guohua_audit` [guohua_audit.sql](./reference/guohua_audit.sql) | 审核记录表 |
| `guohua_audit_employ_demand` [guohua_audit_employ_demand.sql](./reference/guohua_audit_employ_demand.sql) | 就业需求审核记录 |
| `guohua_audit_employ_job` [guohua_audit_employ_job.sql](./reference/guohua_audit_employ_job.sql) | 岗位审核记录 |
| `guohua_project` [guohua_project.sql](./reference/guohua_project.sql) | 项目表 |
| `guohua_notice_data` [guohua_notice_data.sql](./reference/guohua_notice_data.sql) | 检查事项数据 |
| `guohua_notice_summary` [guohua_notice_summary.sql](./reference/guohua_notice_summary.sql) | 检查事项通知汇总 |
| `guohua_notice_type_dic` [guohua_notice_type_dic.sql](./reference/guohua_notice_type_dic.sql) | 检查事项通知类型字典 |
| `guohua_notice_ignore_config` [guohua_notice_ignore_config.sql](./reference/guohua_notice_ignore_config.sql) | 检查事项忽略配置 |
| `public_notice` [public_notice.sql](./reference/public_notice.sql) | 公共公告 |
| `public_notice_audio` [public_notice_audio.sql](./reference/public_notice_audio.sql) | 公告语音附件 |
| `public_upload_file` [public_upload_file.sql](./reference/public_upload_file.sql) | 扫码上传文件 |
| `community` [community.sql](./reference/community.sql) | 机构社群 |
| `contract_expire_message` [contract_expire_message.sql](./reference/contract_expire_message.sql) | 人员到期通知 |
| `customer_ip` [customer_ip.sql](./reference/customer_ip.sql) | 官网提交限制IP |
| `auto_checkin_persons` [auto_checkin_persons.sql](./reference/auto_checkin_persons.sql) | 定时打卡人员 |
| `dis_emp_person_mentor_match` [dis_emp_person_mentor_match.sql](./reference/dis_emp_person_mentor_match.sql) | 残疾人导师匹配 |
| `prize_setting` [prize_setting.sql](./reference/prize_setting.sql) | 奖项概率配置 |
| `prize_user_record` [prize_user_record.sql](./reference/prize_user_record.sql) | 抽奖记录 |
| `product_redeem_code` [product_redeem_code.sql](./reference/product_redeem_code.sql) | 产品兑换码 |
| `prize_ratio` | 奖项个数和概率表 |
| `guohua_supplier` [guohua_supplier.sql](./reference/guohua_supplier.sql) | 供应商 |
| `guohua_payer_mapping` [guohua_payer_mapping.sql](./reference/guohua_payer_mapping.sql) | 付款人映射 |
| `fx_callback_log` [fx_callback_log.sql](./reference/fx_callback_log.sql) | 纷享销客回调日志 |
| `fx_crm_rel_mapping` [fx_crm_rel_mapping.sql](./reference/fx_crm_rel_mapping.sql) | CRM关系映射 |
| `fx_rel_user` [fx_rel_user.sql](./reference/fx_rel_user.sql) | 纷享逍客与国华用户关联 |
| `activity_cookie` | 网站活动cookie表 |
| `guohua_call_center_ruoyun` | 七陌外呼信息表 |
| `guohua_compare_data_log` | 数据比对日志记录表 |
| `guohua_department_stat_relation` | 部门统计展示归属关系 |
| `guohua_dispatch_wages` | OA-工资发放表 |
| `guohua_emp_product_publish_record` | 就业标准化产品发布记录表 |
| `guohua_emp_product_region` | 就业标准化产品地区表（客户区域/交付地区） |
| `guohua_employee_abnormal_analysis` | 员工异常分析表 |
| `guohua_employment_risk_warning` | 就业风险预警明细表 |
| `guohua_expend` | OA-付款表 |
| `guohua_face_verify_log` | 人脸核验失败日志表 |
| `guohua_monthly_caring` | 月度关怀记录 |
| `guohua_opportunity_stage_history` | 商机阶段流转记录表 |
| `guohua_own_persons_summary` | 自有人员社保汇总表 |
| `guohua_point_level_config` | 积分等级配置 |
| `guohua_region_employment_monitor_monthly` | 区域就业监测月度统计表 |
| `guohua_region_income_increase` | 区域增收总额(运营维护) |
| `guohua_service_customer_exception` | 服务客户统计特殊纳入规则表 |
| `guohua_service_performance` | 客服人员绩效月度表 |
| `guohua_service_performance_default` | 客服人员绩效默认配置表 |
| `guohua_service_staff_monthly` | 客服月度人员基础信息表 |
| `guohua_MBGC_disabled_dispatch_fee_detail` | 残疾派遣费用收费明细表 |
| `guohua_MBGC_disabled_dispatch_fee_summary` | 残疾派遣费用汇总表 |
| `guohua_business_model_city_investment_meta` | 城市投资预测模型-头部假设（手动录入） |
| `guohua_business_model_city_investment_yearly` | 城市投资预测模型-逐年财务（手动录入） |

## 13.5 PSC 智能方案

| 表名 | 说明 |
|------|------|
| `psc_smart_plan_record` [psc_smart_plan_record.sql](./reference/psc_smart_plan_record.sql) | PSC智能方案生成记录 |
| `psc_smart_plan_editable_record` [psc_smart_plan_editable_record.sql](./reference/psc_smart_plan_editable_record.sql) | PSC智能方案简洁模式(可编辑)生成记录 |
| `psc_smart_plan_group_record` [psc_smart_plan_group_record.sql](./reference/psc_smart_plan_group_record.sql) | PSC集团(全国性客户)智能方案汇总记录 |
| `psc_smart_plan_group_item` [psc_smart_plan_group_item.sql](./reference/psc_smart_plan_group_item.sql) | PSC集团智能方案逐区域(分子公司)明细表 |

## 13.6 爱立方模块

| 表名 | 说明 |
|------|------|
| `guohua_ailifang_base_product_dispatch` [guohua_ailifang_base_product_dispatch.sql](./reference/guohua_ailifang_base_product_dispatch.sql) | 爱立方基地产品分配统计 |
| `guohua_ailifang_order_base_dispatch` [guohua_ailifang_order_base_dispatch.sql](./reference/guohua_ailifang_order_base_dispatch.sql) | 爱立方订单与基地产品分配关系 |
| `guohua_ailifang_product_order` [guohua_ailifang_product_order.sql](./reference/guohua_ailifang_product_order.sql) | 爱立方劳动产品销售订单明细 |

## 13.7 基地导览 (zyx_*)

| 表名 | 说明 |
|------|------|
| `zyx_base` [zyx_base.sql](./reference/zyx_base.sql) | 基地表 |
| `zyx_station` [zyx_station.sql](./reference/zyx_station.sql) | 基地导览站点 |
| `zyx_activity_orders` [zyx_activity_orders.sql](./reference/zyx_activity_orders.sql) | 基地导览活动预约 |
| `zyx_activity_type` [zyx_activity_type.sql](./reference/zyx_activity_type.sql) | 基地导览活动类型 |
| `zyx_base_content` [zyx_base_content.sql](./reference/zyx_base_content.sql) | 基地内容表 |
| `zyx_base_rel_img` [zyx_base_rel_img.sql](./reference/zyx_base_rel_img.sql) | 基地图片关联 |
| `zyx_dict_icon` [zyx_dict_icon.sql](./reference/zyx_dict_icon.sql) | 基地导览-icon |

## 13.8 微信模块

| 表名 | 说明 |
|------|------|
| `wx_dict_area` [wx_dict_area.sql](./reference/wx_dict_area.sql) | 微信预约体检地区字典 |
| `wx_dict_hospital` [wx_dict_hospital.sql](./reference/wx_dict_hospital.sql) | 微信预约体检医院字典 |
| `wx_pay_order` [wx_pay_order.sql](./reference/wx_pay_order.sql) | 微信支付订单 |

## 13.9 报表/月报（补充）

| 表名 | 说明 |
|------|------|
| `guohua_report_info` | 月报信息记录表 |
| `guohua_report_settings` | 月报信息设置表 |
| `guohua_report_settings_option` | 月报信息设置选项表 |
| `rel_report_info_settings` | 月报信息选项关联表 |

## 13.10 研发看板（rd_board_*）

> 独立的研发管理看板模块，涵盖需求、缺陷、版本、知识产权、资质、人力投入等维度。

| 表名 | 说明 |
|------|------|
| `rd_board_activity` | 研发看板操作日志 |
| `rd_board_bug` | 研发看板缺陷 |
| `rd_board_data_asset` | 科创数据资产 |
| `rd_board_domain` | 研发看板业务域字典 |
| `rd_board_innovation_kpi` | 科创资产自定义指标 |
| `rd_board_intellectual_property` | 科创知识产权进度 |
| `rd_board_ip_attachment` | 科创知识产权附件 |
| `rd_board_manpower` | 科创专项人力投入 |
| `rd_board_qualification` | 科创资质认定进度 |
| `rd_board_release` | 研发看板上线版本 |
| `rd_board_requirement` | 研发看板需求 |
| `rd_board_risk_alert` | 科创风险告警 |
| `rd_board_system` | 研发看板业务系统 |

## 13.11 附件关联表（补充）

| 表名 | 说明 |
|------|------|
| `guohua_rel_attendance_files` | 外勤打卡关联附件表 |
| `guohua_rel_channel_files` | 渠道协议附件表 |
| `guohua_rel_operate_tools_files` | 运营工具附件表 |
| `guohua_rel_opportunity_files` | 商机阶段关联附件表 |
| `guohua_rel_permission_roles` | 权限角色 |
| `guohua_rel_renew` | 就业管理系统-转签记录关联表 |
| `guohua_rel_transfer_record` | 客户信息变更记录表 |
