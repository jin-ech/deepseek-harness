-- Table structure for guohua_dashboard_metric_value
-- ----------------------------
DROP TABLE IF EXISTS `guohua_dashboard_metric_value`;
CREATE TABLE `guohua_dashboard_metric_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `metric_code` varchar(64) NOT NULL COMMENT '指标编码，关联guohua_dashboard_metric.metric_code',
  `stat_date` date NOT NULL COMMENT '统计日期，格式：2025-01-27',
  `stat_type` enum('day','month','year') NOT NULL DEFAULT 'day' COMMENT '统计周期类型：day日/month月/year年',
  `scope_type` enum('global','user','department') NOT NULL COMMENT '统计范围类型：global全局/user用户/department部门',
  `scope_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '范围ID：global时为0/user时为userid/department时为部门ID',
  `value_decimal` decimal(18,2) DEFAULT 0.00 COMMENT '金额类数值，用于amount类型',
  `value_int` bigint(20) DEFAULT 0 COMMENT '数量类数值，用于count类型',
  `value_ratio` decimal(5,2) DEFAULT 0.00 COMMENT '比例类数值，用于ratio类型',
  `value_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '列表类数据，用于list类型，如：["客户A","客户B"]',
  `business_dimension` varchar(32) DEFAULT '' COMMENT '业务维度标识：新签/续签/KA客户/中大客户/轻残/重残等',
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '扩展信息JSON，如：{"detail":"说明","trend":"up"}',
  `calc_time` datetime NOT NULL COMMENT '数据计算时间，记录定时任务执行时间',
  `data_version` int(11) DEFAULT 1 COMMENT '数据版本号，用于支持数据重算和版本管理',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除：1正常0删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_metric_stat` (`metric_code`,`stat_date`,`stat_type`,`scope_type`,`scope_id`,`business_dimension`) COMMENT '指标快照唯一索引，防止重复数据',
  KEY `idx_scope_date` (`scope_type`,`scope_id`,`stat_date`,`stat_type`) COMMENT '按范围+日期查询索引',
  KEY `idx_date_range` (`stat_date`,`metric_code`) COMMENT '时间范围查询索引',
  KEY `idx_calc_time` (`metric_code`,`calc_time`) COMMENT '计算时间索引'
) ENGINE=InnoDB AUTO_INCREMENT=4753 DEFAULT CHARSET=utf8mb4 COMMENT='看板指标快照表：存储定时任务计算的指标历史数据';

-- ----------------------------
