-- Table structure for work_rel_operate_metric_actual
-- ----------------------------
DROP TABLE IF EXISTS `work_rel_operate_metric_actual`;
CREATE TABLE `work_rel_operate_metric_actual` (
  `rel_actual_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经营指标分析关联实际值ID',
  `operate_metric_id` int(11) DEFAULT NULL COMMENT '经营指标ID',
  `business_id` int(11) DEFAULT NULL COMMENT '业务板块ID',
  `stat_month` varchar(10) DEFAULT NULL COMMENT '统计年月',
  `actual_value` varchar(100) DEFAULT NULL COMMENT '实际值',
  `modify_actual_value` varchar(100) DEFAULT NULL COMMENT '修改后实际值',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '统计时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '删除状态 1：未删除 0：已删除',
  `modify_user_id` varchar(255) DEFAULT NULL COMMENT '修改实际值人员ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '状态分析',
  PRIMARY KEY (`rel_actual_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3604 DEFAULT CHARSET=utf8mb4 COMMENT='经营指标分析实际值表';

-- ----------------------------
