-- Table structure for guohua_employ_demand
-- ----------------------------
DROP TABLE IF EXISTS `guohua_employ_demand`;
CREATE TABLE `guohua_employ_demand` (
  `employ_demand_id` int(11) NOT NULL AUTO_INCREMENT,
  `employ_demand_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '需求编号',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '申请人员ID',
  `employ_type_id` varchar(64) NOT NULL DEFAULT '' COMMENT '就业类型ID',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:待审核 2:审核通过 3:审核未通过',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0已删除',
  PRIMARY KEY (`employ_demand_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2237 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-C端需求信息表';

-- ----------------------------
