-- Table structure for guohua_activity_game_list
-- ----------------------------
DROP TABLE IF EXISTS `guohua_activity_game_list`;
CREATE TABLE `guohua_activity_game_list` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏名称',
  `game_img` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏图片',
  `game_url` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏地址',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除：1未删除 0已删除',
  PRIMARY KEY (`game_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='活动游戏表';

-- ----------------------------
