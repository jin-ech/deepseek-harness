-- Table structure for guohua_rel_salary_log_borrow
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_salary_log_borrow`;
CREATE TABLE `guohua_rel_salary_log_borrow` (
  `salary_borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_id` bigint(20) DEFAULT NULL COMMENT '账单ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `borrow_type` tinyint(4) DEFAULT 1 COMMENT '是否允许连续垫付 1是 0否',
  `salary_month` varchar(32) DEFAULT NULL COMMENT '账单所属月',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`salary_borrow_id`) USING BTREE,
  KEY `_index_customer_id` (`salary_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-账单连续垫付记录表';

-- ----------------------------
