-- Table structure for guohua_activity_question
-- ----------------------------
DROP TABLE IF EXISTS `guohua_activity_question`;
CREATE TABLE `guohua_activity_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '问卷id',
  `subject_name` varchar(255) NOT NULL DEFAULT '' COMMENT '题目名称',
  `subject_type` varchar(64) NOT NULL DEFAULT '' COMMENT '题目类型 radio  checkbox  content',
  `subject_score` int(11) NOT NULL DEFAULT 0 COMMENT '题目分值',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1：启用 2：禁用',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 2已删除',
  `add_userid` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `subject_label` varchar(255) NOT NULL DEFAULT '' COMMENT '题目标签',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COMMENT='活动题目表';

-- ----------------------------
