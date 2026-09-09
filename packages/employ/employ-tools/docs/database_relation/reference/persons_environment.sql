-- Table structure for persons_environment
-- ----------------------------
DROP TABLE IF EXISTS `persons_environment`;
CREATE TABLE `persons_environment` (
  `environment_id` varchar(64) NOT NULL COMMENT '生活环境id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `like_food` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的食物',
  `dislike_food` varchar(255) NOT NULL DEFAULT '' COMMENT '不喜欢的食物',
  `careful_food` varchar(255) NOT NULL DEFAULT '' COMMENT '饮食上需注意的',
  `like_daytime_acitvity` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的日间活动',
  `like_evening_activity` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的晚间活动',
  `like_holiday_activity` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的假日活动',
  `travel_mode_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '到康复站的方式，0 未填写',
  `is_barrier_free` varchar(10) NOT NULL DEFAULT '' COMMENT '是否需要无障碍设施 1是 2否 0：未填写',
  `like_place` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢去的场所',
  `like_activity` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的活动',
  `like_neighbor` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的邻居',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`environment_id`) USING BTREE,
  UNIQUE KEY `environment_persons_id` (`persons_id`) USING BTREE COMMENT '成员唯一id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人生活环境表';

-- ----------------------------
