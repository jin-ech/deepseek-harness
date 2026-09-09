-- Table structure for guohua_persons_match_expect
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_match_expect`;
CREATE TABLE `guohua_persons_match_expect` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预匹配ID',
  `match_sn` varchar(255) DEFAULT NULL COMMENT '匹配编号',
  `mission_id` varchar(64) DEFAULT NULL COMMENT '任务ID',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员ID',
  `office_status` varchar(64) DEFAULT '1' COMMENT '入职状态 1:待入职 2:已入职 3:已离职',
  `audit_sn` varchar(255) DEFAULT NULL COMMENT '审核编号',
  `audit_status` varchar(64) DEFAULT '1' COMMENT '审核状态 1:未提交 2:待审核 3:审核通过 4:审核异常',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '添加人微信ID',
  `match_date` datetime DEFAULT current_timestamp() COMMENT '匹配日期',
  `is_contract` varchar(64) DEFAULT '0' COMMENT '是否签署合同 0 未签署 1已签署',
  `social_month` varchar(64) DEFAULT NULL COMMENT '当前社保缴纳月份',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_delete` varchar(64) DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  `increase_status` tinyint(4) DEFAULT 1 COMMENT '增员状态 1:未提交 2:处理中 3:已完成',
  `reduce_status` tinyint(4) DEFAULT 1 COMMENT '减员状态 1:未提交 2:处理中 3:已完成',
  `tmp_id` varchar(255) DEFAULT NULL COMMENT '临时id',
  `demand_id` varchar(64) DEFAULT NULL COMMENT 'demand_id',
  `customer_id` varchar(64) DEFAULT NULL COMMENT 'customer_id',
  `contract_id` varchar(64) DEFAULT NULL COMMENT 'contract_id',
  `expect_error_msg` varchar(2000) DEFAULT NULL COMMENT '预期错误信息',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`match_id`) USING BTREE,
  KEY `_index_is_delete` (`is_delete`) USING BTREE,
  KEY `_index_persons_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员岗位预匹配信息表';

-- ----------------------------
