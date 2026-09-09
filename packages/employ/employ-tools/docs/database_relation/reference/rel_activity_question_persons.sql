-- Table structure for rel_activity_question_persons
-- ----------------------------
DROP TABLE IF EXISTS `rel_activity_question_persons`;
CREATE TABLE `rel_activity_question_persons` (
  `persons_question_id` int(36) NOT NULL AUTO_INCREMENT COMMENT '关联活动问题id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `them_id` int(11) NOT NULL DEFAULT 0 COMMENT '主题id',
  `stage_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡id',
  `activity_question_id` int(11) NOT NULL DEFAULT 0 COMMENT '活动问题id',
  `question_option_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '选项id',
  `question_option_name` varchar(255) NOT NULL DEFAULT '' COMMENT '答案名称',
  `question_option_value` float(5,2) NOT NULL DEFAULT 5.00 COMMENT '对应的值',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  `is_answer` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1正确答案  2错误答案  3开放型答案',
  `flag` int(11) NOT NULL DEFAULT 1 COMMENT '第几次答题',
  `time_score` int(11) NOT NULL DEFAULT 0 COMMENT '时间分',
  PRIMARY KEY (`persons_question_id`) USING BTREE,
  KEY `idx_persons_id` (`id_number`(36)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20340 DEFAULT CHARSET=utf8mb4 COMMENT='活动题目人员完成情况';

-- ----------------------------
