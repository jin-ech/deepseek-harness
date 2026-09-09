-- Table structure for guohua_rel_store_feature_photo
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_store_feature_photo`;
CREATE TABLE `guohua_rel_store_feature_photo` (
  `feature_photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '特色项目照片id',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '单店id',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `photo_name` varchar(255) NOT NULL DEFAULT '' COMMENT '照片名字',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名',
  PRIMARY KEY (`feature_photo_id`) USING BTREE,
  KEY `idx_store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COMMENT='单店特色项目照片';

-- ----------------------------
