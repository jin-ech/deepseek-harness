-- Table structure for guohua_rel_policy_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_policy_files`;
CREATE TABLE `guohua_rel_policy_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `policy_id` int(11) DEFAULT NULL COMMENT '政策id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1068 DEFAULT CHARSET=utf8mb4 COMMENT='就业政策其他附件表';

-- ----------------------------
