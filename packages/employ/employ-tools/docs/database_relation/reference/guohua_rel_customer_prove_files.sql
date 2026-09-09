-- Table structure for guohua_rel_customer_prove_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_prove_files`;
CREATE TABLE `guohua_rel_customer_prove_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type` tinyint(4) DEFAULT NULL COMMENT '文件类型 1:图片 2：视频',
  `file_url` varchar(255) DEFAULT NULL COMMENT '保存路径',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=utf8mb4 COMMENT='客户关联渠道证明附件表';

-- ----------------------------
