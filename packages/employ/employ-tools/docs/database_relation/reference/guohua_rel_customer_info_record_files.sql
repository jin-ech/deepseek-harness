-- Table structure for guohua_rel_customer_info_record_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_info_record_files`;
CREATE TABLE `guohua_rel_customer_info_record_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `record_id` int(11) DEFAULT NULL COMMENT '修改记录id',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `file_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '文件类型 1:图片 2：视频',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '保存路径',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COMMENT='客户信息变更记录附件表';

-- ----------------------------
