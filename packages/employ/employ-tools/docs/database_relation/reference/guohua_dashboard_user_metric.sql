-- Table structure for guohua_dashboard_user_metric
-- ----------------------------
DROP TABLE IF EXISTS `guohua_dashboard_user_metric`;
CREATE TABLE `guohua_dashboard_user_metric` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userid` varchar(64) NOT NULL COMMENT '用户ID',
  `metric_code` varchar(64) NOT NULL COMMENT '指标编码，关联guohua_dashboard_metric.metric_code',
  `is_enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '用户是否启用该指标：1启用/0禁用',
  `sort` int(11) DEFAULT 0 COMMENT '用户自定义排序，数值越小越靠前',
  `pinned` tinyint(4) DEFAULT 0 COMMENT '是否置顶显示：1置顶/0不置顶',
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户个性化配置JSON，如：{"threshold":10000,"color":"red","showTrend":true}',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除：1正常0删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_metric` (`userid`,`metric_code`) COMMENT '用户+指标唯一索引',
  KEY `idx_userid_enabled` (`userid`,`is_enabled`) COMMENT '查询用户启用的指标索引',
  KEY `idx_metric_code` (`metric_code`) COMMENT '反向查询使用该指标的用户索引'
) ENGINE=InnoDB AUTO_INCREMENT=1962 DEFAULT CHARSET=utf8mb4 COMMENT='用户看板指标配置表：存储用户个性化的指标开关、排序、配置';

-- ----------------------------
