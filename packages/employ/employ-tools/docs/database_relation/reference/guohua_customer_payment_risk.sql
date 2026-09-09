-- Table structure for guohua_customer_payment_risk
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_payment_risk`;
CREATE TABLE `guohua_customer_payment_risk` (
  `risk_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `service_department_id` int(11) DEFAULT 0 COMMENT 'fesco业务部门id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '添加人微信ID',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '更新人微信ID',
  `fesco_department_name` varchar(64) DEFAULT '' COMMENT 'fesco业务部门',
  `risk_amount_one` float(10,2) DEFAULT 0.00 COMMENT '直雇风险金',
  `risk_amount_two` float(10,2) DEFAULT 0.00 COMMENT '派遣风险金',
  `risk_amount` float(10,2) DEFAULT 0.00 COMMENT '风险金总额',
  `supplier_amount_one` float(10,2) DEFAULT 0.00 COMMENT '供应商直雇金额',
  `supplier_amount_two` float(10,2) DEFAULT 0.00 COMMENT '供应商派遣金额',
  `supplier_amount` float(10,2) DEFAULT 0.00 COMMENT '供应商总金额',
  `sale_amount_one` float(10,2) DEFAULT 0.00 COMMENT '部门留存直雇金额(销售方金额)',
  `sale_amount_two` float(10,2) DEFAULT 0.00 COMMENT '部门留存派遣金额(销售方金额)',
  `sale_amount` float(10,2) DEFAULT 0.00 COMMENT '部门留存总金额(销售方金额)',
  `risk_amount_residue_one` float(10,2) DEFAULT 0.00 COMMENT '直雇风险金剩余',
  `risk_amount_residue_two` float(10,2) DEFAULT 0.00 COMMENT '派遣风险金剩余',
  `risk_amount_residue` float(10,2) DEFAULT 0.00 COMMENT '风险金剩余',
  PRIMARY KEY (`risk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='FESCO风险金汇总';

-- ----------------------------
