-- Table structure for persons_special_event_in_urge_record
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_in_urge_record`;
CREATE TABLE `persons_special_event_in_urge_record` (
  `urge_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '催办记录id',
  `special_event_in_id` varchar(64) NOT NULL DEFAULT '' COMMENT '内部事件id',
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '负责人id',
  `add_userid` varchar(32) NOT NULL DEFAULT '' COMMENT '添加人员id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`urge_record_id`) USING BTREE,
  KEY `idx_event_id` (`special_event_in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1023 DEFAULT CHARSET=utf8mb4 COMMENT='内部事件催办记录表';

-- ----------------------------
