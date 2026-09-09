-- Table structure for guohua_sales_target_plan_month
-- ----------------------------
DROP TABLE IF EXISTS `guohua_sales_target_plan_month`;
CREATE TABLE `guohua_sales_target_plan_month` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `target_type` tinyint(4) NOT NULL COMMENT '目标类型：1合同签约目标 2新签回款目标 3续签回款目标',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户ID',
  `target_year` int(11) NOT NULL COMMENT '目标年度，如 2026',
  `target_month` tinyint(4) NOT NULL COMMENT '目标月份：1-12',
  `target_quarter` tinyint(4) NOT NULL COMMENT '目标季度：1-4',
  `target_amount` decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '当月目标金额',
  `created_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_by` bigint(20) DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除：1否 0是',
  PRIMARY KEY (`id`),
  KEY `idx_user_year_month_del` (`user_id`,`target_year`,`target_month`,`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=1081 DEFAULT CHARSET=utf8mb4 COMMENT='目标计划月度明细表';

-- ----------------------------
