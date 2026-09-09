-- Table structure for guohua_activity_photo
-- ----------------------------
DROP TABLE IF EXISTS `guohua_activity_photo`;
CREATE TABLE `guohua_activity_photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡id',
  `subject_type` varchar(64) NOT NULL DEFAULT 'photo' COMMENT '题目类型 photo 拍照打卡',
  `subject_name` varchar(64) NOT NULL DEFAULT '' COMMENT '题目名称',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1：启用 2：禁用',
  PRIMARY KEY (`photo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动拍照附件表';

-- ----------------------------
