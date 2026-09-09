-- Table structure for guohua_rel_salary_confirm
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_salary_confirm`;
CREATE TABLE `guohua_rel_salary_confirm` (
  `salary_confirm_id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_id` bigint(20) DEFAULT NULL COMMENT '账单ID',
  `payment_confirm_id` int(11) DEFAULT NULL COMMENT '认款ID',
  `rel_confirm_amount` decimal(10,2) DEFAULT NULL COMMENT '关联认款金额',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`salary_confirm_id`) USING BTREE,
  KEY `_index_customer_id` (`salary_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9178 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-账单关联认款表';

-- ----------------------------
