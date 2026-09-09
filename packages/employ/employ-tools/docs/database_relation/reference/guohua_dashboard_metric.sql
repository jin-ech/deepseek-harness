-- Table structure for guohua_dashboard_metric
-- ----------------------------
DROP TABLE IF EXISTS `guohua_dashboard_metric`;
CREATE TABLE `guohua_dashboard_metric` (
  `metric_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `metric_code` varchar(64) NOT NULL COMMENT '指标唯一编码，如：month_payment、year_contract',
  `metric_name` varchar(128) NOT NULL COMMENT '指标显示名称，如：当月回款、年累计签单',
  `metric_desc` varchar(255) DEFAULT '' COMMENT '指标描述说明，用于tooltip提示',
  `category` varchar(32) DEFAULT '' COMMENT '指标分类：payment回款/contract签单/commission提成/customer客户/employment雇佣',
  `display_type` enum('user_config','sales_result','both','commission_bonus') NOT NULL DEFAULT 'user_config' COMMENT '显示类型: user_config用户可配置/sales_result销售结果/both两者都有',
  `value_type` enum('amount','count','ratio','list') NOT NULL COMMENT '值类型：amount金额/count数量/ratio比例/list列表',
  `unit` varchar(16) DEFAULT '' COMMENT '单位：元/个/%/人等',
  `is_show_ratio` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否显示目标完成率：1显示/0不显示',
  `scope_type` enum('global','user','department') NOT NULL DEFAULT 'global' COMMENT '统计范围：global全局/user用户/department部门',
  `refresh_type` enum('realtime','hourly','daily') NOT NULL DEFAULT 'daily' COMMENT '刷新频率：realtime实时查询/hourly每小时/daily每天',
  `default_visible` tinyint(4) NOT NULL DEFAULT 1 COMMENT '新用户默认是否展示：1是/0否',
  `sort` int(11) DEFAULT 0 COMMENT '显示排序值，数值越小越靠前',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除：1正常0删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `jump_route` varchar(255) DEFAULT NULL COMMENT '指标跳转路由',
  `jump_system_id` varchar(64) DEFAULT NULL COMMENT '跳转系统ID',
  `jump_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '跳转参数模板(JSON)',
  `is_jump` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否支持跳转：1是0否',
  PRIMARY KEY (`metric_id`),
  UNIQUE KEY `metric_code` (`metric_code`),
  KEY `idx_category` (`category`) COMMENT '按分类查询索引',
  KEY `idx_refresh` (`refresh_type`,`is_delete`) COMMENT '定时任务查询索引',
  KEY `idx_display_type` (`display_type`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COMMENT='看板指标定义表：存储所有可用指标的元数据配置';

-- ----------------------------
