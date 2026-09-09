-- Table structure for guohua_store_persons_bind_photo_file
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_persons_bind_photo_file`;
CREATE TABLE `guohua_store_persons_bind_photo_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(64) DEFAULT '' COMMENT '文件名',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COMMENT='仪表盘就业基地绑定打卡照片数附件导出记录';

-- ----------------------------
