-- Table structure for persons_family_situation
-- ----------------------------
DROP TABLE IF EXISTS `persons_family_situation`;
CREATE TABLE `persons_family_situation` (
  `family_situation_id` varchar(64) NOT NULL COMMENT '家庭情况id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `is_room` varchar(10) NOT NULL DEFAULT '' COMMENT '残疾人有无自己的房间 1 有 2 无',
  `room_type` varchar(10) NOT NULL DEFAULT '' COMMENT '房间类型 1楼房 2平房',
  `room_num` varchar(11) NOT NULL DEFAULT '' COMMENT '房间数',
  `neighbour_id` varchar(11) NOT NULL DEFAULT '' COMMENT '邻里关系id',
  `requisite_neighbour_id` varchar(11) NOT NULL DEFAULT '' COMMENT '必要时邻里关系id',
  `parent_marriage_id` varchar(11) NOT NULL DEFAULT '' COMMENT '父母婚姻情况id',
  `parent_marriage_other` varchar(255) NOT NULL DEFAULT '' COMMENT '父母婚姻情况其他',
  `family_relation_id` varchar(11) NOT NULL DEFAULT '' COMMENT '家人关系id',
  `family_relation_other` varchar(255) NOT NULL DEFAULT '' COMMENT '家人关系其他',
  `like_family_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '喜欢的家人id',
  `economic_state_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '经济状况id',
  `main_economic_source_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '主要经济来源id',
  `main_economic_source_other` varchar(255) NOT NULL DEFAULT '' COMMENT '主要经济来源其他',
  `main_look_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '主要照顾者',
  `main_look_other` varchar(255) NOT NULL DEFAULT '' COMMENT '主要照顾者其他',
  `main_arder_activity_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '主要休闲活动id',
  `main_arder_activity_other` varchar(255) NOT NULL DEFAULT '' COMMENT '主要休闲活动其他',
  `housework_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '会做的家务事id',
  `housework_other` varchar(255) NOT NULL DEFAULT '' COMMENT '会做的家务事其他',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`family_situation_id`) USING BTREE,
  UNIQUE KEY `family_situation_persons_id` (`persons_id`) USING BTREE COMMENT '成员唯一id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人家庭情况表';

-- ----------------------------
