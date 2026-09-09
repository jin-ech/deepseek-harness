-- Table structure for guohua_rel_service_payment_plan
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_service_payment_plan`;
CREATE TABLE `guohua_rel_service_payment_plan` (
  `payment_plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '付款计划ID',
  `service_id` int(11) NOT NULL DEFAULT 0 COMMENT '服务ID',
  `payment_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款方式ID',
  `payment_form` int(11) NOT NULL DEFAULT 0 COMMENT '付款形式(1:预付款 2:应付款)',
  `payment_period_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款周期ID',
  `payment_ratio` int(11) NOT NULL COMMENT '付款比例',
  `payment_amount` int(11) NOT NULL COMMENT '付款金额',
  `payment_date` varchar(255) NOT NULL DEFAULT '' COMMENT '付款日期',
  `account_period` varchar(64) NOT NULL DEFAULT '' COMMENT '账期(天)',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `test_payment_date` varchar(255) NOT NULL DEFAULT '' COMMENT '测试付款年月',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`payment_plan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-服务信息关联付款计划表';

-- ----------------------------
