-- Table structure for guohua_rel_persons_handbook_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_handbook_files`;
CREATE TABLE `guohua_rel_persons_handbook_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `handbook_id` int(11) DEFAULT NULL COMMENT '劳动手册id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COMMENT='人员劳动手册附件';

-- ----------------------------
