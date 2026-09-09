-- Table structure for market_salary_batch_confirm
-- ----------------------------
DROP TABLE IF EXISTS `market_salary_batch_confirm`;
CREATE TABLE `market_salary_batch_confirm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(50) NOT NULL COMMENT '批次号（唯一标识）',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `salary_ids` text NOT NULL COMMENT '账单ID列表（JSON数组字符串）',
  `total_count` int(11) DEFAULT 0 COMMENT '包含账单数量',
  `confirm_status` tinyint(2) DEFAULT 0 COMMENT '确认状态：0=待确认，1=全部已确认，2=部分已确认',
  `confirmed_at` datetime DEFAULT NULL COMMENT '全部确认时间',
  `created_by` varchar(50) DEFAULT NULL COMMENT '创建人（客服user_id）',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '1=正常 2=已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_batch_no` (`batch_no`),
  KEY `idx_customer_status` (`customer_id`,`confirm_status`,`is_delete`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账单批量确认记录表';
