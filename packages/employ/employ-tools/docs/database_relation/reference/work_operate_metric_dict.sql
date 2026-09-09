-- Table structure for work_operate_metric_dict
-- ----------------------------
DROP TABLE IF EXISTS `work_operate_metric_dict`;
CREATE TABLE `work_operate_metric_dict` (
  `operate_metric_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经营指标ID',
  `operate_metric_name` varchar(255) DEFAULT NULL COMMENT '指标名称',
  `operate_metric_code` varchar(255) DEFAULT NULL COMMENT '指标编码',
  `pid` int(11) DEFAULT 0 COMMENT '父级ID，0为一级',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `business_ids` varchar(255) DEFAULT NULL COMMENT '各个分公司关联业务板块ids',
  `value_type` varchar(255) DEFAULT NULL COMMENT '目标值类型  数字：number，百分比：percent，字符串：string',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT ' 1：未删除  0：已删除',
  `stat_ids` varchar(255) DEFAULT NULL COMMENT '经营分析统计维度表 stat_ids 多个用,连接',
  `total_business_ids` varchar(255) DEFAULT NULL COMMENT '总表对应的业务板块ID',
  `total_sort` int(11) DEFAULT 999 COMMENT '总表指标排序字段',
  `total_metric_name` varchar(255) DEFAULT NULL COMMENT '总表显示的指标名称，这个字段空的时候读operate_metric_name',
  `rel_operate_metric_ids` varchar(255) DEFAULT NULL COMMENT '关联指标ID',
  `rel_operate_metric_stat_methd` varchar(255) DEFAULT NULL COMMENT '关联指标统计方式\nyear：按年\nquarter：按季度\nmoon：按月',
  `value_agg_rule` varchar(255) DEFAULT 'sum' COMMENT '计算实际值聚合规则 sum:求和，agv:平均值，last：最后一条',
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`operate_metric_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COMMENT='经营分析指标字典表';

-- ----------------------------
