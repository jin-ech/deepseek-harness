-- Table structure for guohua_region_employment_monitor_monthly
-- ----------------------------
DROP TABLE IF EXISTS `guohua_region_employment_monitor_monthly`;
CREATE TABLE `guohua_region_employment_monitor_monthly` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stat_month` date NOT NULL COMMENT '统计月份，取每月1日',
  `region_id` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地ID',
  `store_name` varchar(255) NOT NULL DEFAULT '' COMMENT '基地名称',
  `store_type` tinyint(4) DEFAULT NULL COMMENT '基地类型',
  `ins_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构ID',
  `onsite_person_count` int(11) NOT NULL DEFAULT 0 COMMENT '月末在职/安置人数',
  `light_disable_count` int(11) NOT NULL DEFAULT 0 COMMENT '轻残人数',
  `weight_disable_count` int(11) NOT NULL DEFAULT 0 COMMENT '重残人数',
  `unknown_disable_count` int(11) NOT NULL DEFAULT 0 COMMENT '未维护轻重残人数',
  `new_employ_count` int(11) NOT NULL DEFAULT 0 COMMENT '当月新增就业人数',
  `leave_count` int(11) NOT NULL DEFAULT 0 COMMENT '当月离职人数',
  `net_increase_count` int(11) NOT NULL DEFAULT 0 COMMENT '净增人数',
  `salary_amount` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '工资发放金额',
  `product_order_count` int(11) NOT NULL DEFAULT 0 COMMENT '劳动产品订单数',
  `product_finished_count` int(11) NOT NULL DEFAULT 0 COMMENT '完成劳动产品订单数',
  `product_amount` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '劳动产品金额',
  `turnover_rate` decimal(8,4) NOT NULL DEFAULT 0.0000 COMMENT '人员流失率',
  `disabled_type_stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '残疾类别分布',
  `job_type_stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '岗位类型分布',
  `employment_duration_stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '就业时长分布',
  `attendance_exception_count` int(11) NOT NULL DEFAULT 0 COMMENT '出勤异常数',
  `salary_warning_count` int(11) NOT NULL DEFAULT 0 COMMENT '工资发放预警数',
  `contract_expire_30d_count` int(11) NOT NULL DEFAULT 0 COMMENT '近1个月合同到期人数',
  `contract_expire_60d_count` int(11) NOT NULL DEFAULT 0 COMMENT '近2个月合同到期人数',
  `high_turnover_risk_count` int(11) NOT NULL DEFAULT 0 COMMENT '高流失风险人数',
  `rights_protection_count` int(11) NOT NULL DEFAULT 0 COMMENT '维权事件数',
  `unhandled_rights_protection_count` int(11) NOT NULL DEFAULT 0 COMMENT '未处理维权事件数',
  `project_interrupt_count` int(11) NOT NULL DEFAULT 0 COMMENT '劳动项目中断数',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_month_region_store` (`stat_month`,`region_id`,`store_id`),
  KEY `idx_region_month` (`region_id`,`stat_month`),
  KEY `idx_store_month` (`store_id`,`stat_month`)
) ENGINE=InnoDB AUTO_INCREMENT=3950 DEFAULT CHARSET=utf8mb4 COMMENT='区域就业监测月度统计表';

-- ----------------------------
