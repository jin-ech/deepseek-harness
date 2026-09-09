-- Table structure for guohua_customer_gift_budget
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_gift_budget`;
CREATE TABLE `guohua_customer_gift_budget` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预算id',
  `budget_year` varchar(64) DEFAULT NULL COMMENT '预算年度',
  `department_id` int(11) DEFAULT NULL COMMENT '部门id',
  `budget_amount` decimal(10,2) DEFAULT NULL COMMENT '预算金额',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`budget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='客户礼品部门预算表';

-- ----------------------------
