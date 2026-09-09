-- Table structure for guohua_rel_persons_special_event_in_important
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_special_event_in_important`;
CREATE TABLE `guohua_rel_persons_special_event_in_important` (
  `important_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标记id',
  `special_event_in_id` varchar(64) DEFAULT NULL COMMENT '事件ID',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '人员ID',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`important_id`) USING BTREE,
  KEY `img_ acitvity_id` (`add_userid`) USING BTREE,
  KEY `idx_event_delete` (`special_event_in_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='人员特殊事件重要标记关联表';

-- ----------------------------
