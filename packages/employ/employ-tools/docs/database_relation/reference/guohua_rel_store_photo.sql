-- Table structure for guohua_rel_store_photo
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_store_photo`;
CREATE TABLE `guohua_rel_store_photo` (
  `store_photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '单店id',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '类型 1默认 2基地照片',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述/内容说明',
  PRIMARY KEY (`store_photo_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8mb4 COMMENT='单店照片附件表';

-- ----------------------------
