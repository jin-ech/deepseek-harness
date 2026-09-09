-- Table structure for guohua_plan_kf_income_complete
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_kf_income_complete`;
CREATE TABLE `guohua_plan_kf_income_complete` (
  `income_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回款id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(255) DEFAULT NULL COMMENT '区域名称',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `account_year` varchar(255) DEFAULT NULL COMMENT '结算年度',
  `debt_amount` decimal(10,2) DEFAULT NULL COMMENT '欠款金额',
  `income_amount` decimal(10,2) DEFAULT NULL COMMENT '回款金额',
  `income_type_name` varchar(255) DEFAULT NULL COMMENT '回款类目',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`income_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='康复回款完成情况表';

-- ----------------------------
