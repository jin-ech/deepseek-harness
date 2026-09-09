-- Table structure for guohua_customer_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_payment_detail`;
CREATE TABLE `guohua_customer_payment_detail` (
  `payment_detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `customer_business_id` int(11) NOT NULL DEFAULT 0 COMMENT '业务客户id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `fesco_department_name` varchar(64) DEFAULT '' COMMENT 'fesco业务部门',
  `payment_amount` float(10,2) DEFAULT 0.00 COMMENT '收入金额',
  `should_amount` float(10,2) DEFAULT 0.00 COMMENT '应收金额',
  `not_should_amount` float(10,2) DEFAULT 0.00 COMMENT '未收金额',
  `customer_order_num` varchar(64) DEFAULT '' COMMENT '企业订单号',
  `customer_order_detail_num` varchar(64) DEFAULT '' COMMENT '企业订单明细号',
  `supplier_amount` float(10,2) DEFAULT 0.00 COMMENT '供应商利润',
  `sale_amount` float(10,2) DEFAULT 0.00 COMMENT '销售方利润',
  `risk_amount` float(10,2) DEFAULT 0.00 COMMENT '风险金金额',
  `supplier_rate` float(10,2) DEFAULT 0.00 COMMENT '供应商利润比例',
  `sale_rate` float(10,2) DEFAULT 0.00 COMMENT '销售方利润比例',
  `risk_rate` float(10,2) DEFAULT 0.00 COMMENT '风险金预留比例',
  `payment_plan_id` int(11) DEFAULT 0 COMMENT '回款计划id',
  `risk_expend_amount` float(10,2) DEFAULT 0.00 COMMENT '风险金支出金额',
  `service_department_id` int(11) DEFAULT 0 COMMENT 'fesco业务部门id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `risk_rule_name` varchar(64) DEFAULT NULL COMMENT '风险金规则名称',
  `contract_attribute` varchar(64) DEFAULT NULL COMMENT '合同属性 1:直雇 2:派遣',
  `payment_status` varchar(64) DEFAULT NULL COMMENT '1待生效 2已生效 3已履约 4已作废',
  `month` varchar(64) DEFAULT NULL COMMENT '所属年月',
  `deal_date` varchar(64) DEFAULT NULL COMMENT '交易日期',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '添加人微信ID',
  `customer_business_type` varchar(64) DEFAULT NULL COMMENT '业务客户类型  1自营 2受托',
  `contract_id` int(11) DEFAULT 0 COMMENT '合同id',
  `id_number` varchar(64) DEFAULT NULL COMMENT '身份证号',
  `customer_name` varchar(64) DEFAULT NULL COMMENT '客户名',
  PRIMARY KEY (`payment_detail_id`) USING BTREE,
  KEY `index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8274 DEFAULT CHARSET=utf8mb4 COMMENT='FESCO到款明细统计';

-- ----------------------------
