-- Table structure for guohua_employee_abnormal_analysis
-- ----------------------------
DROP TABLE IF EXISTS `guohua_employee_abnormal_analysis`;
CREATE TABLE `guohua_employee_abnormal_analysis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(64) DEFAULT '' COMMENT '客户ID',
  `customer_name` varchar(255) DEFAULT '' COMMENT '客户名称',
  `responsible_userid` varchar(64) DEFAULT '' COMMENT '负责人用户ID',
  `responsible_name` varchar(64) DEFAULT '' COMMENT '负责人姓名',
  `service_userid` varchar(64) DEFAULT '' COMMENT '服务专员用户ID',
  `service_name` varchar(64) DEFAULT '' COMMENT '服务专员姓名',
  `contract_id` varchar(64) DEFAULT '' COMMENT '合同ID',
  `contract_name` varchar(255) DEFAULT '' COMMENT '合同名称',
  `demand_id` varchar(64) DEFAULT '' COMMENT '需求ID',
  `demand_name` varchar(255) DEFAULT '' COMMENT '需求名称',
  `match_id` varchar(64) DEFAULT '' COMMENT '匹配ID',
  `match_office_status` tinyint(4) DEFAULT NULL COMMENT '匹配入职状态',
  `work_id` varchar(64) DEFAULT '' COMMENT '入离职记录ID',
  `work_type` tinyint(4) DEFAULT NULL COMMENT '入离职类型',
  `persons_id` varchar(64) DEFAULT '' COMMENT '人员ID',
  `persons_name` varchar(64) DEFAULT '' COMMENT '人员姓名',
  `id_number` varchar(64) DEFAULT '' COMMENT '身份证号',
  `abnormal_remark` varchar(255) DEFAULT '' COMMENT '异常说明',
  `abnormal_type` varchar(64) DEFAULT '' COMMENT '异常类型',
  `abnormal_type_name` varchar(64) DEFAULT '' COMMENT '异常类型名称',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_persons_customer_abnormal` (`persons_id`,`customer_id`,`abnormal_type`),
  KEY `idx_abnormal_type` (`abnormal_type`),
  KEY `idx_persons_id` (`persons_id`),
  KEY `idx_match_id` (`match_id`),
  KEY `idx_customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=782 DEFAULT CHARSET=utf8mb4 COMMENT='员工异常分析表';

-- ----------------------------
