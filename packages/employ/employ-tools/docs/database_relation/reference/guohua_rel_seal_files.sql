-- Table structure for guohua_rel_seal_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_seal_files`;
CREATE TABLE `guohua_rel_seal_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seal_id` int(11) DEFAULT NULL COMMENT '用印申请id',
  `file_url` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `media_id` varchar(255) DEFAULT NULL COMMENT '企业微信素材保存路径',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1498 DEFAULT CHARSET=utf8mb4 COMMENT='账单开票关联附件表';

-- ----------------------------
