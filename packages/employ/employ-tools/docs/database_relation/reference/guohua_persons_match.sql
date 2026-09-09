-- Table structure for guohua_persons_match
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_match`;
CREATE TABLE `guohua_persons_match` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '匹配ID',
  `match_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '匹配编号',
  `mission_id` bigint(32) DEFAULT NULL COMMENT '任务ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '匹配基地ID（任务分配基地）',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID',
  `office_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '入职状态 1:待入职 2:已入职 3:已离职',
  `audit_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '审核编号',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:未提交 2:待审核 3:审核通过 4:审核异常',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信ID',
  `match_date` datetime DEFAULT current_timestamp() COMMENT '匹配日期',
  `is_contract` varchar(64) NOT NULL DEFAULT '0' COMMENT '是否签署合同 0 未签署 1已签署',
  `social_month` varchar(64) NOT NULL DEFAULT '' COMMENT '当前社保缴纳月份',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  `increase_status` tinyint(4) DEFAULT 1 COMMENT '增员状态 1:未提交 2:处理中 3:已完成',
  `reduce_status` tinyint(4) DEFAULT 1 COMMENT '减员状态 1:未提交 2:处理中 3:已完成',
  `tmp_id` varchar(255) NOT NULL DEFAULT '' COMMENT '临时id',
  `demand_id` varchar(64) DEFAULT NULL COMMENT 'demand_id',
  `customer_id` varchar(64) DEFAULT NULL COMMENT 'customer_id',
  `contract_id` varchar(64) DEFAULT NULL COMMENT 'contract_id',
  `persons_remarks` varchar(255) DEFAULT NULL COMMENT '人员备注',
  `history_match_id` int(11) DEFAULT NULL COMMENT '历史匹配ID	',
  `renew_status` int(11) DEFAULT NULL COMMENT '续签标识',
  `increase_social_remarks` varchar(500) DEFAULT NULL COMMENT '增员社保备注',
  `reduce_social_remarks` varchar(500) DEFAULT NULL COMMENT '减员社保备注',
  PRIMARY KEY (`match_id`) USING BTREE,
  KEY `_index_is_delete` (`is_delete`) USING BTREE,
  KEY `_index_persons_id` (`persons_id`) USING BTREE,
  KEY `_index_mission_id` (`mission_id`) USING BTREE,
  KEY `idx_status_delete_id` (`office_status`,`is_delete`,`persons_id`),
  KEY `idx_match_mission_delete` (`mission_id`,`is_delete`),
  KEY `idx_match_persons_delete` (`persons_id`,`is_delete`),
  KEY `idx_match_audit_status` (`audit_status`,`is_delete`),
  KEY `idx_match_office_status` (`office_status`,`is_delete`),
  KEY `idx_match_isdelete_audit_mission` (`is_delete`,`audit_status`,`mission_id`),
  KEY `idx_match_office_del_date` (`is_delete`,`office_status`,`persons_id`,`match_date`,`match_id`),
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72878 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员岗位匹配信息表';

-- ----------------------------
