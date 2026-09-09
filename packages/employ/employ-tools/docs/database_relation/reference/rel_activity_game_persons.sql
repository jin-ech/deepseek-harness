-- Table structure for rel_activity_game_persons
-- ----------------------------
DROP TABLE IF EXISTS `rel_activity_game_persons`;
CREATE TABLE `rel_activity_game_persons` (
  `persons_game_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员游戏id',
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡id',
  `photo_id` int(11) NOT NULL DEFAULT 0 COMMENT '游戏id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`persons_game_id`) USING BTREE,
  KEY `_index_persons_id` (`id_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动游戏人员完成情况';

-- ----------------------------
