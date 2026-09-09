-- Table structure for guohua_persons_update_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_update_record`;
CREATE TABLE `guohua_persons_update_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '操作人',
  `event_content` varchar(255) DEFAULT NULL COMMENT '事件内容',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `filed_name` varchar(64) NOT NULL DEFAULT '' COMMENT '字段名',
  `old_word` varchar(64) NOT NULL DEFAULT '0' COMMENT '旧内容',
  `new_word` varchar(64) NOT NULL DEFAULT '0' COMMENT '新内容',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除  0已删除',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17099 DEFAULT CHARSET=utf8mb4 COMMENT='人员更新记录表';

-- ----------------------------
