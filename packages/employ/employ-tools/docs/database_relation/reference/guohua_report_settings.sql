-- Table structure for guohua_report_settings
-- ----------------------------
DROP TABLE IF EXISTS `guohua_report_settings`;
CREATE TABLE `guohua_report_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '设置id',
  `report_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '月报类型id',
  `report_option_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '选项类型id',
  `field_name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `field_content` varchar(255) NOT NULL DEFAULT '' COMMENT '字段内容',
  `sort` int(11) NOT NULL DEFAULT 99999 COMMENT '排序',
  `placeholder` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `default_value` varchar(64) NOT NULL DEFAULT '' COMMENT '默认值',
  `is_ext` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否为扩展字段 1:是 0:否',
  `is_required` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否必填 1:必填   0:非必填',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除   0:已删除',
  `is_hidden` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否隐藏 1:是  0:否',
  `is_master` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否关键字 1:是 0:否',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`settings_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='月报信息设置表';

-- ----------------------------
