-- Table structure for work_rel_operate_metric_target
-- ----------------------------
DROP TABLE IF EXISTS `work_rel_operate_metric_target`;
CREATE TABLE `work_rel_operate_metric_target` (
  `rel_target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `operate_metric_id` int(11) DEFAULT NULL COMMENT '经营指标ID',
  `business_id` int(11) DEFAULT NULL COMMENT '业务板块ID',
  `target_year` year(4) DEFAULT NULL COMMENT '目标年份',
  `year_value` varchar(255) DEFAULT NULL COMMENT '年度目标值 ',
  `quarter_1` varchar(255) DEFAULT NULL COMMENT '第一季度目标值 ',
  `quarter_2` varchar(255) DEFAULT NULL COMMENT '第二季度目标值',
  `quarter_3` varchar(255) DEFAULT NULL COMMENT '第三季度目标值',
  `quarter_4` varchar(255) DEFAULT NULL COMMENT '第四季度目标值',
  `stat_id` int(11) DEFAULT NULL COMMENT '经营分析统计维度ID',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '是否删除 1：未删除 0：已删除',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  PRIMARY KEY (`rel_target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2471 DEFAULT CHARSET=utf8mb4 COMMENT='经营指标分析目标表';

-- ----------------------------
