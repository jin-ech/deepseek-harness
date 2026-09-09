-- Table structure for guohua_rel_channel_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_channel_files`;
CREATE TABLE `guohua_rel_channel_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'id',
  `file_url` varchar(1000) NOT NULL DEFAULT '' COMMENT '保存路径',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COMMENT='渠道协议附件表';

-- ----------------------------
