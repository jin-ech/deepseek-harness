-- Table structure for guohua_MBGC_disabled_dispatch_fee_summary
-- ----------------------------
DROP TABLE IF EXISTS `guohua_MBGC_disabled_dispatch_fee_summary`;
CREATE TABLE `guohua_MBGC_disabled_dispatch_fee_summary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `source_file` varchar(255) DEFAULT NULL COMMENT '来源文件',
  `source_sheet` varchar(50) DEFAULT '汇总表' COMMENT '来源sheet',
  `source_row` int(11) DEFAULT NULL COMMENT 'Excel原始行号',
  `entity` varchar(20) DEFAULT NULL COMMENT 'Entity',
  `hc` int(11) DEFAULT NULL COMMENT 'HC',
  `is_applicable` varchar(10) DEFAULT NULL COMMENT '是否适用',
  `required_dispatch_disabled_count` int(11) DEFAULT NULL COMMENT '需安排残疾派遣员工人数',
  `estimated_disabled_security_fund` decimal(18,6) DEFAULT NULL COMMENT '预计应缴纳残保金',
  `employment_type` varchar(50) DEFAULT NULL COMMENT '雇佣类型',
  `proportional_calculation` decimal(18,6) DEFAULT NULL COMMENT '按比例计算',
  `estimated_disabled_person_count` int(11) DEFAULT NULL COMMENT '预估残疾人人数',
  `actual_employed_count` int(11) DEFAULT NULL COMMENT '实际雇佣人数',
  `confirmed_month_employed_count` int(11) DEFAULT NULL COMMENT '确认当月雇佣人数',
  `actual_male_count` int(11) DEFAULT NULL COMMENT '实际雇佣男性员工人数',
  `actual_female_count` int(11) DEFAULT NULL COMMENT '实际雇佣女性员工人数',
  `household_location` varchar(50) DEFAULT NULL COMMENT '户籍所在地',
  `household_type` varchar(50) DEFAULT NULL COMMENT '户口性质',
  `month_count` int(11) DEFAULT NULL COMMENT '月份数',
  `period_raw` varchar(50) DEFAULT NULL COMMENT '年月-原始值',
  `period_date` date DEFAULT NULL COMMENT '年月-标准日期',
  `period_label` varchar(50) DEFAULT NULL COMMENT '年月-展示文本',
  `labor_cost_total` decimal(18,6) DEFAULT NULL COMMENT '人工成本（工资社保公积金）合计',
  `service_fee_total` decimal(18,6) DEFAULT NULL COMMENT '服务费合计',
  `total_amount` decimal(18,6) DEFAULT NULL COMMENT '总计',
  `employee_salary_total` decimal(18,6) DEFAULT NULL COMMENT '从业人员工资总额',
  `confirmed_month_salary_total` decimal(18,6) DEFAULT NULL COMMENT '确认当月从业人员工资总额',
  `service_fee` decimal(18,6) DEFAULT NULL COMMENT '服务费',
  `collection_payment_amount` decimal(18,6) DEFAULT NULL COMMENT '代收代付（工资社保公积金）',
  `fesco_payment_total` decimal(18,6) DEFAULT NULL COMMENT '支付FESCO合计',
  `remark` text DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_entity` (`entity`),
  KEY `idx_period_date` (`period_date`),
  KEY `idx_source_row` (`source_row`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COMMENT='残疾派遣费用汇总表';

-- ----------------------------
