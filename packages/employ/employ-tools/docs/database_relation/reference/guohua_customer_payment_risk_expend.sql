-- Table structure for guohua_customer_payment_risk_expend
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_payment_risk_expend`;
CREATE TABLE `guohua_customer_payment_risk_expend` (
  `risk_expend_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '风险金支出id',
  `risk_id` int(11) DEFAULT 0 COMMENT '风险金id',
  `customer_id` int(11) DEFAULT 0 COMMENT '客户id',
  `service_department_id` int(11) DEFAULT 0 COMMENT '业务部门id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '添加人微信ID',
  `risk_expend_amount` float(10,2) DEFAULT 0.00 COMMENT '风险金支出金额',
  `risk_attribute` varchar(10) DEFAULT '0' COMMENT '1直雇 2派遣  ',
  `risk_expend_date` varchar(255) DEFAULT NULL COMMENT '风险金支出日期',
  `risk_expend_status` tinyint(4) DEFAULT 0 COMMENT '0 未确认 1已确认',
  PRIMARY KEY (`risk_expend_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='FESCO风险金汇总';

-- ----------------------------
