-- Table structure for persons_special_event_in_process
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_in_process`;
CREATE TABLE `persons_special_event_in_process` (
  `process_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '处理进度id',
  `special_event_in_id` varchar(64) NOT NULL DEFAULT '' COMMENT '内部事件id',
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '处理人员id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `process_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '处理状态 1处理中 2已完成',
  `process_date` datetime DEFAULT NULL COMMENT '处理时间',
  `match_id` int(11) DEFAULT NULL COMMENT '匹配id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`process_id`) USING BTREE,
  KEY `index_special_event_in_id` (`special_event_in_id`) USING BTREE,
  KEY `idx_match_id` (`match_id`) USING BTREE,
  KEY `idx_event_delete` (`special_event_in_id`,`is_delete`),
  KEY `idx_persons_id` (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33007 DEFAULT CHARSET=utf8mb4 COMMENT='内部事件处理进度表';

-- ----------------------------
