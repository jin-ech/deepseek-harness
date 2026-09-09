-- Table structure for guohua_ens_settings
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_settings`;
CREATE TABLE `guohua_ens_settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `settings_type` tinyint(4) DEFAULT NULL COMMENT '配置类型 1积分规则',
  `settings_name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `settings_content` text DEFAULT NULL COMMENT '字段内容',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1否 0是',
  `add_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`settings_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='助益行小程序配置表';

-- ----------------------------
