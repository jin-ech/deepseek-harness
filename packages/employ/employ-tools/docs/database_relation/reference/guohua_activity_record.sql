-- Table structure for guohua_activity_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_activity_record`;
CREATE TABLE `guohua_activity_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动记录id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '主体关卡id',
  `is_complete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '关卡完成状态 1已完成 0未完成',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `stage_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '关卡类型 1地点打卡拍照  2答题  3小游戏',
  `stage_score` int(11) NOT NULL DEFAULT 0 COMMENT '关卡总得分',
  `game_score` int(11) NOT NULL DEFAULT 0 COMMENT '游戏得分',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8mb4 COMMENT='活动记录表';

-- ----------------------------
