-- Table structure for guohua_store_product_order_assign_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_assign_record`;
CREATE TABLE `guohua_store_product_order_assign_record` (
  `assign_record_id` varchar(64) NOT NULL COMMENT '分配记录id',
  `product_order_id` varchar(64) NOT NULL COMMENT '劳动产品订单id',
  `assign_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '分配方式 1自动 2手动 3改派',
  `assign_result` tinyint(4) NOT NULL DEFAULT 1 COMMENT '分配结果 1成功 2失败(转人工)',
  `candidate_store_ids` text DEFAULT NULL COMMENT '候选基地store_id集合(operate域) 逗号分隔',
  `assigned_store_ids` text DEFAULT NULL COMMENT '最终分配基地store_id集合(operate域) 逗号分隔',
  `rule_snapshot` text DEFAULT NULL COMMENT '规则快照json：各产品support_store_ids、候选池、评分明细、homeland映射',
  `fail_reason` varchar(255) DEFAULT '' COMMENT '失败原因：候选集为空/含非标准产品等',
  `operator_userid` varchar(64) DEFAULT '' COMMENT '操作人（自动分配为空）',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`assign_record_id`),
  KEY `idx_product_order_id` (`product_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单分配记录表';

-- ----------------------------
