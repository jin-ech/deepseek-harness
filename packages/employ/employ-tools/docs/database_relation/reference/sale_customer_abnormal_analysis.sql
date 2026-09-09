-- Table structure for sale_customer_abnormal_analysis
-- ----------------------------
DROP TABLE IF EXISTS `sale_customer_abnormal_analysis`;
CREATE TABLE `sale_customer_abnormal_analysis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(64) DEFAULT '' COMMENT '客户ID',
  `customer_name` varchar(255) DEFAULT '' COMMENT '客户名称',
  `responsible_userid` varchar(64) DEFAULT '' COMMENT '负责人用户ID',
  `responsible_name` varchar(64) DEFAULT '' COMMENT '负责人姓名',
  `service_userid` varchar(64) DEFAULT '' COMMENT '客服ID',
  `service_name` varchar(64) DEFAULT '' COMMENT '客服姓名',
  `contract_id` varchar(64) DEFAULT '' COMMENT '合同ID',
  `contract_name` varchar(255) DEFAULT '' COMMENT '合同名称',
  `abnormal_remark` varchar(255) DEFAULT '' COMMENT '异常说明',
  `abnormal_type` varchar(64) DEFAULT '' COMMENT '异常类型',
  `abnormal_type_name` varchar(64) DEFAULT '' COMMENT '异常类型名称',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_customer_contract_abnormal` (`customer_id`,`contract_id`,`abnormal_type`),
  KEY `idx_abnormal_type` (`abnormal_type`),
  KEY `idx_responsible_userid` (`responsible_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2735 DEFAULT CHARSET=utf8mb4 COMMENT='销售客户异常分析表';

-- ----------------------------
