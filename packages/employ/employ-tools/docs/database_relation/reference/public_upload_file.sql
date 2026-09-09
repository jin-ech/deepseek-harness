-- Table structure for public_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `public_upload_file`;
CREATE TABLE `public_upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `up_id` varchar(32) NOT NULL DEFAULT '' COMMENT '扫码上传ID',
  `file_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件类型 1：图片 2：文件',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '文件说明',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1174 DEFAULT CHARSET=utf8mb4 COMMENT='扫码上传文件表';

-- ----------------------------
