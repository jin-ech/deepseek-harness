-- Table structure for guohua_rel_customer_salary
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_salary`;
CREATE TABLE `guohua_rel_customer_salary` (
  `salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `payroll_rules` tinyint(4) DEFAULT 2 COMMENT '发薪规则 1:当月发  2:次月发',
  `pay_day` varchar(64) NOT NULL DEFAULT '' COMMENT '每月公司发薪日',
  `deadline_day` varchar(64) NOT NULL DEFAULT '' COMMENT '每月社保截止日',
  `customer_quotation` decimal(18,2) NOT NULL DEFAULT 0.00 COMMENT '客户报价（元）',
  `customer_bank_id` int(11) DEFAULT NULL COMMENT '工资卡所属银行ID',
  `customer_bank_number` varchar(255) DEFAULT NULL COMMENT '客户银行账号',
  `docking_person_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '对接人ID',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`salary_id`) USING BTREE,
  KEY `_index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34997 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户发薪规则表';

-- ----------------------------
