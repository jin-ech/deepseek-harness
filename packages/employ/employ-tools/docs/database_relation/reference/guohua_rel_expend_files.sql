-- Table structure for guohua_rel_expend_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_expend_files`;
CREATE TABLE `guohua_rel_expend_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款申请id',
  `file_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '文件类型 1：图片 2：文件',
  `file_url` varchar(2000) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '文件说明',
  `media_id` varchar(255) NOT NULL DEFAULT '' COMMENT '企业微信素材保存路径',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `storage` varchar(10) NOT NULL DEFAULT 'local' COMMENT '文件存放位置local:本地 oss：阿里云oss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19967 DEFAULT CHARSET=utf8mb4 COMMENT='OA-付款申请关联附件表';

-- ----------------------------
