-- Table structure for guohua_rel_activity_game
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_activity_game`;
CREATE TABLE `guohua_rel_activity_game` (
  `activity_game_id` int(11) NOT NULL AUTO_INCREMENT,
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡id',
  `game_id` int(11) NOT NULL DEFAULT 0 COMMENT '游戏id',
  `game_score` int(11) NOT NULL DEFAULT 0 COMMENT '过关分值',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 2已删除',
  PRIMARY KEY (`activity_game_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='活动关卡游戏关联表';

-- ----------------------------
