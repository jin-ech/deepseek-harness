-- Table structure for guohua_sales_monthly_stats
-- ----------------------------
DROP TABLE IF EXISTS `guohua_sales_monthly_stats`;
CREATE TABLE `guohua_sales_monthly_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat_month` char(7) NOT NULL COMMENT '统计月份 (YYYY-MM)',
  `user_id` varchar(64) NOT NULL COMMENT '销售人员ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '销售姓名',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(100) DEFAULT NULL COMMENT '所属部门名称',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门ID',
  `main_department_name` varchar(100) DEFAULT NULL COMMENT '主部门名称',
  `payment_amount` decimal(14,2) DEFAULT 0.00 COMMENT '当月回款',
  `new_contracts_amount` decimal(14,2) DEFAULT 0.00 COMMENT '当月新签合同金额',
  `visit_count` int(11) DEFAULT 0 COMMENT '当月拜访量',
  `call_count` int(11) DEFAULT 0 COMMENT '当月电话量',
  `add_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_month_user` (`stat_month`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
