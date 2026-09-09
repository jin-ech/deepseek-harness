-- Table structure for work_rel_stat_bus_target
-- ----------------------------
DROP TABLE IF EXISTS `work_rel_stat_bus_target`;
CREATE TABLE `work_rel_stat_bus_target` (
  `rel_stat_bus_tar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `stat_id` int(11) DEFAULT NULL COMMENT '统计维度id',
  `business_id` int(11) DEFAULT NULL COMMENT '业务ID',
  `target_value` decimal(10,2) DEFAULT 0.00 COMMENT '目标值 单位：万元',
  `target_year` varchar(50) DEFAULT NULL COMMENT '目标年份',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '删除状态 1：未删除 0：已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '新增时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`rel_stat_bus_tar_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='统计维度关联业务板块表-目标值';

-- ----------------------------
