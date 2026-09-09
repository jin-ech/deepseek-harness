-- Table structure for guohua_rel_activity_question
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_activity_question`;
CREATE TABLE `guohua_rel_activity_question` (
  `activity_question_id` int(11) NOT NULL AUTO_INCREMENT,
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡id',
  `question_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '问题id',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1：启用 2：禁用',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `subject_name` varchar(255) NOT NULL DEFAULT '' COMMENT '题目名称',
  `subject_type` varchar(64) NOT NULL DEFAULT '' COMMENT '题目类型 radio  checkbox  content',
  `subject_score` int(11) NOT NULL DEFAULT 0 COMMENT '题目分值',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 2已删除',
  PRIMARY KEY (`activity_question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='活动关卡题目关联表';

-- ----------------------------
