-- Table structure for guohua_report_settings_option
-- ----------------------------
DROP TABLE IF EXISTS `guohua_report_settings_option`;
CREATE TABLE `guohua_report_settings_option` (
  `settings_option_id` varchar(255) NOT NULL DEFAULT '' COMMENT '设置选项id',
  `settings_id` int(11) NOT NULL DEFAULT 0 COMMENT '设置id',
  `option_name` varchar(255) NOT NULL DEFAULT '' COMMENT '选项名称',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1：未删除 0:已删除',
  PRIMARY KEY (`settings_option_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='月报信息设置选项表';

-- ----------------------------
