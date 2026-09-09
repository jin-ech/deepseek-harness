-- Table structure for guohua_customer_opportunity
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_opportunity`;
CREATE TABLE `guohua_customer_opportunity` (
  `opportunity_id` varchar(64) NOT NULL DEFAULT '' COMMENT '商机id',
  `opportunity_sn` varchar(64) DEFAULT NULL COMMENT '商机编号',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `opportunity_name` varchar(255) DEFAULT NULL COMMENT '商机名称',
  `customer_stage` tinyint(4) DEFAULT NULL COMMENT '商机阶段 1需求发现30%  2需求确认40%  3方案报价60%  4商务谈判80%  5赢单100%  6输单0% 7确认赢单 8商机关闭',
  `winning_rate` int(11) DEFAULT NULL COMMENT '赢率',
  `lost_reason_type` tinyint(4) DEFAULT NULL COMMENT '输单原因 1客户需求消失 2价格不满足期望 3其他',
  `lost_reason` varchar(255) DEFAULT NULL COMMENT '输单说明 类型为其他时必填',
  `expect_sign_time` int(11) DEFAULT NULL COMMENT '签约时长',
  `expect_sign_month` varchar(64) DEFAULT NULL COMMENT '预计成单年月',
  `expect_sign_week` int(11) DEFAULT NULL COMMENT '预计成单周',
  `expect_sign_amount` decimal(10,2) DEFAULT NULL COMMENT '预计签单金额',
  `expect_received_month` varchar(255) DEFAULT NULL COMMENT '预计到账年月',
  `expect_received_week` int(11) DEFAULT NULL COMMENT '预计到账周（1-4）',
  `expect_received_amount` decimal(10,2) DEFAULT NULL COMMENT '预计到账金额',
  `sign_type` tinyint(4) DEFAULT NULL COMMENT '签约类型 1新签 2续签',
  `responsible_userid` varchar(255) DEFAULT NULL COMMENT '商机负责人',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门id',
  `department_id` int(11) DEFAULT NULL COMMENT '子部门id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '创建人',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT current_timestamp() COMMENT '修改时间',
  `stage_update_time` datetime DEFAULT current_timestamp() COMMENT '商机阶段变更时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`opportunity_id`) USING BTREE,
  KEY `idx_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户商机表';

-- ----------------------------
