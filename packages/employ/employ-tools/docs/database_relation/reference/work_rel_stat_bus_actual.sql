-- Table structure for work_rel_stat_bus_actual
-- ----------------------------
DROP TABLE IF EXISTS `work_rel_stat_bus_actual`;
CREATE TABLE `work_rel_stat_bus_actual` (
  `rel_stat_bus_acl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `stat_id` int(11) DEFAULT NULL COMMENT '统计维度ID',
  `business_id` int(11) DEFAULT NULL COMMENT '业务ID',
  `stat_month` varchar(50) DEFAULT NULL COMMENT '统计月份',
  `actual_value` decimal(10,2) DEFAULT 0.00 COMMENT '实际值（默认统计的）',
  `update_actual_value` decimal(10,2) DEFAULT 0.00 COMMENT '手动更新后的实际值，优先使用这个值',
  `warning` varchar(50) DEFAULT NULL COMMENT '警告',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '统计时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '删除状态 1：未删除 0：已删除',
  `modify_user_id` varchar(255) DEFAULT NULL COMMENT '修改实际值人员ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`rel_stat_bus_acl_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COMMENT='统计维度关联业务板块表-实际值';

-- ----------------------------
