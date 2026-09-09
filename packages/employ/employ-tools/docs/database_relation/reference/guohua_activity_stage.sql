-- Table structure for guohua_activity_stage
-- ----------------------------
DROP TABLE IF EXISTS `guohua_activity_stage`;
CREATE TABLE `guohua_activity_stage` (
  `stage_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关卡id',
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_name` varchar(64) NOT NULL DEFAULT '' COMMENT '关卡名称',
  `stage_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '关卡类型 1地点打卡拍照  2答题  3小游戏',
  `stage_location` varchar(255) NOT NULL DEFAULT '' COMMENT '关卡位置坐标',
  `them_stage_bg` varchar(255) NOT NULL DEFAULT '' COMMENT '关卡图标',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0删除',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `stage_score` int(11) NOT NULL DEFAULT 0 COMMENT '关卡分数',
  PRIMARY KEY (`stage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='活动主题关卡表';

-- ----------------------------
