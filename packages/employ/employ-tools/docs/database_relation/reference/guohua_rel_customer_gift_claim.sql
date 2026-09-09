-- Table structure for guohua_rel_customer_gift_claim
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_gift_claim`;
CREATE TABLE `guohua_rel_customer_gift_claim` (
  `gift_claim_id` varchar(64) NOT NULL DEFAULT '' COMMENT '认领id',
  `gift_id` varchar(64) DEFAULT NULL COMMENT '礼品id',
  `claim_num` int(11) DEFAULT NULL COMMENT '认领数量',
  `claim_userid` varchar(255) DEFAULT NULL COMMENT '认领人',
  `main_department_id` varchar(64) DEFAULT NULL COMMENT '主部门id',
  `operator_userid` varchar(255) DEFAULT NULL COMMENT '操作人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '认领时间',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `sp_no` varchar(255) DEFAULT NULL COMMENT '审批编号',
  `sp_status` varchar(255) DEFAULT '0' COMMENT '审批状态',
  `gift_reason` varchar(255) DEFAULT NULL COMMENT '申请礼品事由',
  `gift_date` varchar(255) DEFAULT NULL COMMENT '期望交付日期',
  `gift_remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `claim_type` varchar(32) DEFAULT NULL COMMENT '1 认领 2分配',
  PRIMARY KEY (`gift_claim_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户礼品信息认领表';

-- ----------------------------
