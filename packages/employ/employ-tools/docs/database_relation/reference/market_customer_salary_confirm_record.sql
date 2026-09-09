-- Table structure for market_customer_salary_confirm_record
-- ----------------------------
DROP TABLE IF EXISTS `market_customer_salary_confirm_record`;
CREATE TABLE `market_customer_salary_confirm_record` (
  `confirm_id` bigint(20) NOT NULL COMMENT '主键（应用层 get_unique_num_id）',
  `salary_id` bigint(20) NOT NULL COMMENT '账单 id（guohua_customer_salary.salary_id）',
  `customer_id` int(11) NOT NULL COMMENT '客户 id（冗余，方便审计）',
  `market_user_id` bigint(20) NOT NULL COMMENT '操作人 market_users.market_user_id',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人手机号（冗余自 market_users.phone）',
  `confirm_time` datetime NOT NULL COMMENT '确认时间',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `source` tinyint(4) NOT NULL DEFAULT 1 COMMENT '来源 1小程序客户确认 2后台确认',
  `operate_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '后台操作人 userid（source=2 时）',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`confirm_id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_market_user_id` (`market_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户确认账单记录表';

-- ----------------------------
