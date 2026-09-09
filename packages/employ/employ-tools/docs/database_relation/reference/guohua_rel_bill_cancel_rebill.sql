-- Table structure for guohua_rel_bill_cancel_rebill
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_cancel_rebill`;
CREATE TABLE `guohua_rel_bill_cancel_rebill` (
  `rebill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bill_id` int(11) DEFAULT NULL COMMENT '新开票id',
  `sp_no` varchar(255) DEFAULT NULL COMMENT '新审批编号',
  `old_bill_id` int(11) DEFAULT NULL COMMENT '原开票id',
  `old_sp_no` varchar(255) DEFAULT NULL COMMENT '原审批编号',
  `old_sp_status` tinyint(4) DEFAULT 1 COMMENT '原审批状态',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加日期',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  PRIMARY KEY (`rebill_id`) USING BTREE,
  KEY `_index_bill_id` (`bill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COMMENT='财务管理系统发票作废重开记录表';

-- ----------------------------
