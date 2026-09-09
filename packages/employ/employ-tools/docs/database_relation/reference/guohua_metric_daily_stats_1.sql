-- Table structure for guohua_metric_daily_stats_1
-- ----------------------------
DROP TABLE IF EXISTS `guohua_metric_daily_stats_1`;
CREATE TABLE `guohua_metric_daily_stats_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `stat_year` int(11) NOT NULL COMMENT '年份',
  `stat_month` tinyint(4) NOT NULL COMMENT '月份',
  `sales_count` int(11) DEFAULT 0 COMMENT '销售人数',
  `customer_count` int(11) DEFAULT 0 COMMENT '客户数',
  `new_sign_amount` decimal(18,2) DEFAULT 0.00 COMMENT '新签金额',
  `payment_received_amount` decimal(18,2) DEFAULT 0.00 COMMENT '回款金额',
  `avg_new_sign_per_sales` decimal(18,2) DEFAULT 0.00 COMMENT '销售人均新签',
  `avg_payment_per_sales` decimal(18,2) DEFAULT 0.00 COMMENT '销售人均回款',
  `persons_work_count` int(11) NOT NULL DEFAULT 0 COMMENT '在职人数',
  `store_count` int(11) DEFAULT 0 COMMENT '基地数',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_stat_date` (`stat_date`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='经营指标日报';

-- ----------------------------
