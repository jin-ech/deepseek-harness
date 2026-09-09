-- Table structure for guohua_rel_persons_special_event_in_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_special_event_in_files`;
CREATE TABLE `guohua_rel_persons_special_event_in_files` (
  `special_event_in_files_id` varchar(64) NOT NULL COMMENT '事件图片ID',
  `special_event_in_id` varchar(64) DEFAULT NULL COMMENT '事件ID',
  `file_url` text NOT NULL COMMENT '保存地址',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名称',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`special_event_in_files_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内部事件信息附件表';

-- ----------------------------
