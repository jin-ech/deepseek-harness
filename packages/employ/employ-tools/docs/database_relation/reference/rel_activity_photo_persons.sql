-- Table structure for rel_activity_photo_persons
-- ----------------------------
DROP TABLE IF EXISTS `rel_activity_photo_persons`;
CREATE TABLE `rel_activity_photo_persons` (
  `persons_photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员图片id',
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡id',
  `photo_id` int(11) NOT NULL DEFAULT 0 COMMENT '拍照图片id',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `file_type` varchar(64) NOT NULL DEFAULT '1' COMMENT '文件类型 1拍照',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '保存路径',
  `file_name` varchar(64) NOT NULL DEFAULT '' COMMENT '文件名',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`persons_photo_id`) USING BTREE,
  KEY `_index_persons_id` (`id_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动拍照人员完成情况';

-- ----------------------------
