-- Table structure for rel_report_info_settings
-- ----------------------------
DROP TABLE IF EXISTS `rel_report_info_settings`;
CREATE TABLE `rel_report_info_settings` (
  `rel_report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `report_id` varchar(36) NOT NULL DEFAULT '' COMMENT '月报信息id',
  `persons_id` varchar(36) NOT NULL DEFAULT '' COMMENT '人员id',
  `report_year` varchar(64) NOT NULL DEFAULT '' COMMENT '年份',
  `report_month` varchar(64) NOT NULL DEFAULT '' COMMENT '月份',
  `report_option_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '月报选项类型id',
  `settings_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '月报选项id',
  `settings_id` int(11) NOT NULL DEFAULT 0 COMMENT '月报设置id',
  `settings_value` varchar(500) NOT NULL DEFAULT '' COMMENT '月报选项值',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`rel_report_id`) USING BTREE,
  KEY `idx_report_settings` (`report_id`,`settings_id`),
  KEY `idx_rris_report_settings_option` (`report_id`,`settings_id`,`report_option_type_id`,`settings_value`),
  KEY `idx_rris_isdel_report_settings_option` (`is_delete`,`report_id`,`settings_id`,`report_option_type_id`,`settings_value`)
) ENGINE=InnoDB AUTO_INCREMENT=2115372 DEFAULT CHARSET=utf8mb4 COMMENT='月报信息选项关联表';

-- ----------------------------
