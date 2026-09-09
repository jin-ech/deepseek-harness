-- Table structure for guohua_rel_bill_cancel
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_cancel`;
CREATE TABLE `guohua_rel_bill_cancel` (
  `cancel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bill_id` int(11) DEFAULT NULL COMMENT '开票id',
  `bill_detail_id` varchar(255) DEFAULT NULL COMMENT '开票明细id',
  `sp_no` varchar(255) DEFAULT NULL COMMENT '审批编号',
  `sp_status` tinyint(4) DEFAULT 1 COMMENT '审批状态',
  `cancel_reason` varchar(255) DEFAULT NULL COMMENT '作废原因',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '申请人id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加日期',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  PRIMARY KEY (`cancel_id`) USING BTREE,
  KEY `_index_bill_id` (`bill_id`) USING BTREE,
  KEY `idx_bill_cancel_composite` (`bill_id`,`sp_status`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=437 DEFAULT CHARSET=utf8mb4 COMMENT='财务管理系统开票作废记录表';

-- ----------------------------
