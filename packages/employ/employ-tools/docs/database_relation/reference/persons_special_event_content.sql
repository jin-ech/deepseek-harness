-- Table structure for persons_special_event_content
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_content`;
CREATE TABLE `persons_special_event_content` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作记录id',
  `special_event_in_id` varchar(36) NOT NULL DEFAULT '0' COMMENT '事件id',
  `content` text NOT NULL COMMENT '操作记录',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8986 DEFAULT CHARSET=utf8mb4 COMMENT='时间操作记录表';

-- ----------------------------
