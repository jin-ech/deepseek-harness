-- Table structure for guohua_rel_persons_special_event_content_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_special_event_content_files`;
CREATE TABLE `guohua_rel_persons_special_event_content_files` (
  `files_id` varchar(64) NOT NULL COMMENT '文件id',
  `log_id` int(11) DEFAULT NULL COMMENT '记录id',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存地址',
  `add_userid` varchar(64) NOT NULL DEFAULT '0' COMMENT '人员ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`files_id`) USING BTREE,
  KEY `img_ acitvity_id` (`add_userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='事件操作记录附件表';

-- ----------------------------
