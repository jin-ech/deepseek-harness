-- Table structure for guohua_rel_mission_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_mission_files`;
CREATE TABLE `guohua_rel_mission_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务ID',
  `file_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件类型 1:标准材料 2:非标准材料',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '文件说明',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-任务材料附件表';

-- ----------------------------
