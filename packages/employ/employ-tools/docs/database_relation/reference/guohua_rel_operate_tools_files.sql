-- Table structure for guohua_rel_operate_tools_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_operate_tools_files`;
CREATE TABLE `guohua_rel_operate_tools_files` (
  `files_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '事件图片ID',
  `file_url` varchar(500) DEFAULT NULL COMMENT '保存地址',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`files_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='运营工具附件表';

-- ----------------------------
