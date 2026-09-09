-- Table structure for market_customer_service_report_stat
-- ----------------------------
DROP TABLE IF EXISTS `market_customer_service_report_stat`;
CREATE TABLE `market_customer_service_report_stat` (
  `stat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(255) DEFAULT '' COMMENT '客户名称',
  `report_date` varchar(7) NOT NULL COMMENT '报告月份 YYYY-MM',
  `since_date` date DEFAULT NULL COMMENT '累计起算日（首份合同起始日）',
  `contract_attribute` varchar(8) DEFAULT '' COMMENT '合作类型 1直雇 2派遣',
  `on_job_total` int(11) DEFAULT 0 COMMENT '月末在岗总数',
  `on_job_light` int(11) DEFAULT 0 COMMENT '轻残人数',
  `on_job_weight` int(11) DEFAULT 0 COMMENT '重残人数',
  `attendance_rate` decimal(5,2) DEFAULT 0.00 COMMENT '月度出勤率',
  `salary_total` decimal(14,2) DEFAULT 0.00 COMMENT '本月工资发放总额',
  `salary_total_cumulative` decimal(16,2) DEFAULT 0.00 COMMENT '累计工资发放总额',
  `social_persons` int(11) DEFAULT 0 COMMENT '社保缴纳人数',
  `fund_persons` int(11) DEFAULT 0 COMMENT '公积金缴纳人数',
  `labor_project_count` int(11) DEFAULT 0 COMMENT '本月劳动项目完成数',
  `labor_project_count_cumulative` int(11) DEFAULT 0 COMMENT '累计劳动项目完成数',
  `training_count` int(11) DEFAULT 0 COMMENT '本月培训次数',
  `training_count_cumulative` int(11) DEFAULT 0 COMMENT '累计培训次数',
  `person_add_count` int(11) DEFAULT 0 COMMENT '本月增员数',
  `person_reduce_count` int(11) DEFAULT 0 COMMENT '本月减员数',
  `audit_login_count` int(11) DEFAULT 0 COMMENT '企业端登录次数',
  `audit_esg_count` int(11) DEFAULT 0 COMMENT 'ESG看板访问次数',
  `audit_employee_query_count` int(11) DEFAULT 0 COMMENT '员工查询次数',
  `audit_report_view_count` int(11) DEFAULT 0 COMMENT '报表查看次数',
  `audit_agent_chat_count` int(11) DEFAULT 0 COMMENT '智能客服问答次数',
  `report_json` mediumtext DEFAULT NULL COMMENT '完整结构化快照 JSON',
  `calc_time` datetime DEFAULT current_timestamp() COMMENT '统计计算时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`stat_id`),
  UNIQUE KEY `uk_customer_report_date` (`customer_id`,`report_date`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='客户月度服务报告统计快照表';

-- ----------------------------
