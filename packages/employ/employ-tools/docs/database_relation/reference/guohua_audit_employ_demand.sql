-- Table structure for guohua_audit_employ_demand
-- ----------------------------
DROP TABLE IF EXISTS `guohua_audit_employ_demand`;
CREATE TABLE `guohua_audit_employ_demand` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `employ_demand_id` varchar(64) NOT NULL DEFAULT '' COMMENT '审核记录ID',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:待审核 2:审核通过 3:审核异常',
  `audit_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '审核人微信ID',
  `audit_record` text NOT NULL COMMENT '审核记录意见',
  `audit_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '审核时间',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-就业需求审核记录表';

-- ----------------------------
