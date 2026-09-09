-- Table structure for guohua_rel_attendance_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_attendance_files`;
CREATE TABLE `guohua_rel_attendance_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `punch_id` varchar(64) DEFAULT NULL COMMENT '打卡id',
  `file_url` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `add_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8630 DEFAULT CHARSET=utf8mb4 COMMENT='外勤打卡关联附件表';

-- ----------------------------
