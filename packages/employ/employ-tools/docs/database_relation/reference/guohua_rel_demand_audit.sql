-- Table structure for guohua_rel_demand_audit
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_demand_audit`;
CREATE TABLE `guohua_rel_demand_audit` (
  `demand_audit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `demand_id` int(11) DEFAULT NULL COMMENT '需求id',
  `audit_status` tinyint(4) DEFAULT NULL COMMENT '审核状态 1通过 2拒绝',
  `audit_record` varchar(255) DEFAULT NULL COMMENT '审核记录意见',
  `add_userid` varchar(255) DEFAULT '' COMMENT '审核人微信ID',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` varchar(64) DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  PRIMARY KEY (`demand_audit_id`) USING BTREE,
  KEY `_index_demand_id` (`demand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4042 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-需求审核记录表';

-- ----------------------------
