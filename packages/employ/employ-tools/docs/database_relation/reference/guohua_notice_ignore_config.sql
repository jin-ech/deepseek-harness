-- Table structure for guohua_notice_ignore_config
-- ----------------------------
DROP TABLE IF EXISTS `guohua_notice_ignore_config`;
CREATE TABLE `guohua_notice_ignore_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_type_id` int(11) NOT NULL COMMENT '通知类型ID',
  `receiver_userid` varchar(64) NOT NULL COMMENT '接收人userid',
  `notice_uuid` varchar(255) NOT NULL COMMENT '通知唯一标识',
  `operator_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '操作人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_notice_ignore` (`notice_type_id`,`receiver_userid`,`notice_uuid`),
  KEY `idx_receiver_notice_type` (`receiver_userid`,`notice_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='检查事项忽略配置';

-- ----------------------------
