# 十一、经营分析与看板域

## 11.1 指标定义

| 表名 | 说明 |
|------|------|
| `guohua_dashboard_metric` [guohua_dashboard_metric.sql](./reference/guohua_dashboard_metric.sql) | 看板指标定义（元数据配置） |
| `guohua_dashboard_metric_value` [guohua_dashboard_metric_value.sql](./reference/guohua_dashboard_metric_value.sql) | 看板指标快照（历史数据） |
| `guohua_dashboard_user_metric` [guohua_dashboard_user_metric.sql](./reference/guohua_dashboard_user_metric.sql) | 用户个性化指标开关/排序 |
| `work_operate_metric_dict` [work_operate_metric_dict.sql](./reference/work_operate_metric_dict.sql) | 经营分析指标字典 |

## 11.2 经营日报

| 表名 | 说明 |
|------|------|
| `guohua_metric_daily_stats` [guohua_metric_daily_stats.sql](./reference/guohua_metric_daily_stats.sql) | 经营指标日报 |
| `guohua_metric_daily_stats_1` | 经营指标日报（备份/副本） |
| `guohua_daily_department_stats` [guohua_daily_department_stats.sql](./reference/guohua_daily_department_stats.sql) | 部门每日统计快照 |
| `guohua_daily_department_user_stats` [guohua_daily_department_user_stats.sql](./reference/guohua_daily_department_user_stats.sql) | 部门负责人每日统计 |
| `work_rel_operate_metric_actual` [work_rel_operate_metric_actual.sql](./reference/work_rel_operate_metric_actual.sql) | 经营分析实际值 |
| `work_rel_operate_metric_target` [work_rel_operate_metric_target.sql](./reference/work_rel_operate_metric_target.sql) | 经营分析目标值 |
| `work_stat_dict` [work_stat_dict.sql](./reference/work_stat_dict.sql) | 统计维度 |
| `work_operate_analysis` [work_operate_analysis.sql](./reference/work_operate_analysis.sql) | 经营分析总结与建议 |
| `work_operate_suggestion` [work_operate_suggestion.sql](./reference/work_operate_suggestion.sql) | 经营分析建议 |
| `work_rel_stat_bus_actual` [work_rel_stat_bus_actual.sql](./reference/work_rel_stat_bus_actual.sql) | 统计维度关联业务板块-实际值 |
| `work_rel_stat_bus_target` [work_rel_stat_bus_target.sql](./reference/work_rel_stat_bus_target.sql) | 统计维度关联业务板块-目标值 |

## 11.3 领导驾驶舱 (cockpit_*)

| 表名 | 说明 |
|------|------|
| `cockpit_dict_area` [cockpit_dict_area.sql](./reference/cockpit_dict_area.sql) | 总体看板-区域字典 |
| `cockpit_dict_centre` [cockpit_dict_centre.sql](./reference/cockpit_dict_centre.sql) | 总体看板-中心字典 |
| `cockpit_dict_department` [cockpit_dict_department.sql](./reference/cockpit_dict_department.sql) | 总体看板-部门字典（被56张表引用） |
| `cockpit_dict_product_attr` [cockpit_dict_product_attr.sql](./reference/cockpit_dict_product_attr.sql) | 总体看板-产品属性字典 |
| `cockpit_operate_data` [cockpit_operate_data.sql](./reference/cockpit_operate_data.sql) | 经营计划数据 |
| `cockpit_operate_target` [cockpit_operate_target.sql](./reference/cockpit_operate_target.sql) | 经营计划指标 |

## 11.4 年度计划 (guohua_plan_*)

| 表名 | 说明 |
|------|------|
| `guohua_plan_total` [guohua_plan_total.sql](./reference/guohua_plan_total.sql) | 年度经营计划完成表 |
| `guohua_plan_sale_result_target` [guohua_plan_sale_result_target.sql](./reference/guohua_plan_sale_result_target.sql) | 营销结果数据-目标 |
| `guohua_plan_sale_result_complete` [guohua_plan_sale_result_complete.sql](./reference/guohua_plan_sale_result_complete.sql) | 营销结果数据-完成 |
| `guohua_plan_sale_process` [guohua_plan_sale_process.sql](./reference/guohua_plan_sale_process.sql) | 营销过程数据 |
| `guohua_plan_sale_product_gov` [guohua_plan_sale_product_gov.sql](./reference/guohua_plan_sale_product_gov.sql) | 政务产品销售表 |
| `guohua_plan_sale_product_process` [guohua_plan_sale_product_process.sql](./reference/guohua_plan_sale_product_process.sql) | 劳动产品进展表 |
| `guohua_plan_employ_operate_target` [guohua_plan_employ_operate_target.sql](./reference/guohua_plan_employ_operate_target.sql) | 就业运营目标 |
| `guohua_plan_employ_operate_complete` [guohua_plan_employ_operate_complete.sql](./reference/guohua_plan_employ_operate_complete.sql) | 就业运营完成 |
| `guohua_plan_employ_base_layout` [guohua_plan_employ_base_layout.sql](./reference/guohua_plan_employ_base_layout.sql) | 基地布局数据 |
| `guohua_plan_employ_important_event` [guohua_plan_employ_important_event.sql](./reference/guohua_plan_employ_important_event.sql) | 重点运营事件 |
| `guohua_plan_customer_service` [guohua_plan_customer_service.sql](./reference/guohua_plan_customer_service.sql) | 客户服务表 |
| `guohua_plan_customer_renew` [guohua_plan_customer_renew.sql](./reference/guohua_plan_customer_renew.sql) | 客户续签进度 |
| `guohua_plan_customer_service_payroll` [guohua_plan_customer_service_payroll.sql](./reference/guohua_plan_customer_service_payroll.sql) | 派遣发薪表 |
| `guohua_plan_store_direct` [guohua_plan_store_direct.sql](./reference/guohua_plan_store_direct.sql) | 直营店数据 |
| `guohua_plan_store_franchise` [guohua_plan_store_franchise.sql](./reference/guohua_plan_store_franchise.sql) | 加盟店数据 |
| `guohua_plan_kf_income_complete` [guohua_plan_kf_income_complete.sql](./reference/guohua_plan_kf_income_complete.sql) | 康复回款完成情况 |
| `guohua_plan_kf_station_complete` [guohua_plan_kf_station_complete.sql](./reference/guohua_plan_kf_station_complete.sql) | 康复站点建设及预测 |
| `guohua_plan_kf_task_complete` [guohua_plan_kf_task_complete.sql](./reference/guohua_plan_kf_task_complete.sql) | 康复任务完成表 |
| `guohua_plan_self_employ` [guohua_plan_self_employ.sql](./reference/guohua_plan_self_employ.sql) | 自雇残疾人表 |
| `guohua_plan_update_record` [guohua_plan_update_record.sql](./reference/guohua_plan_update_record.sql) | 驾驶舱目标更新记录 |
| `guohua_plan_update_record_append` [guohua_plan_update_record_append.sql](./reference/guohua_plan_update_record_append.sql) | 驾驶舱目标新增记录 |

## 11.5 销售目标

| 表名 | 说明 |
|------|------|
| `sale_target` [sale_target.sql](./reference/sale_target.sql) | 销售目标 |
| `sale_target_complete` [sale_target_complete.sql](./reference/sale_target_complete.sql) | 销售目标完成 |
| `sell_target_data` [sell_target_data.sql](./reference/sell_target_data.sql) | 销售完成情况目标 |
| `sell_week_date` [sell_week_date.sql](./reference/sell_week_date.sql) | 销售完成情况指标 |
| `income_target` [income_target.sql](./reference/income_target.sql) | 部门收入目标 |
| `income_target_data` [income_target_data.sql](./reference/income_target_data.sql) | 销售完成情况目标 |
| `guohua_sales_target_plan_month` [guohua_sales_target_plan_month.sql](./reference/guohua_sales_target_plan_month.sql) | 目标计划月度明细 |
| `base_rel_sell_department` [base_rel_sell_department.sql](./reference/base_rel_sell_department.sql) | 仪表盘销售合计小计部门 |

## 11.6 月度快照

| 表名 | 说明 |
|------|------|
| `guohua_emp_global_dashboard_monthly_snapshot` [guohua_emp_global_dashboard_monthly_snapshot.sql](./reference/guohua_emp_global_dashboard_monthly_snapshot.sql) | 全市帮扶就业大屏月度快照 |
| `guohua_service_dashboard_contract_monthly_snapshot` [guohua_service_dashboard_contract_monthly_snapshot.sql](./reference/guohua_service_dashboard_contract_monthly_snapshot.sql) | 客服看板合同月度快照 |
| `guohua_service_dashboard_customer_monthly_snapshot` [guohua_service_dashboard_customer_monthly_snapshot.sql](./reference/guohua_service_dashboard_customer_monthly_snapshot.sql) | 客服看板客户月度快照 |
| `guohua_store_dashboard_daily_snapshot` [guohua_store_dashboard_daily_snapshot.sql](./reference/guohua_store_dashboard_daily_snapshot.sql) | 基地看板按天考勤快照 |
| `guohua_store_dashboard_monthly_snapshot` [guohua_store_dashboard_monthly_snapshot.sql](./reference/guohua_store_dashboard_monthly_snapshot.sql) | 基地月度公共指标快照 |
