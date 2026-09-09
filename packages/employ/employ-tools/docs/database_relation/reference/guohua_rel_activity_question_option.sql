-- Table structure for guohua_rel_activity_question_option
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_activity_question_option`;
CREATE TABLE `guohua_rel_activity_question_option` (
  `rel_question_option_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题关联问卷id',
  `question_id` int(11) NOT NULL DEFAULT 0 COMMENT '问题id  activity_question_id',
  `question_option_name` varchar(255) NOT NULL DEFAULT '' COMMENT '答案名称',
  `question_option_value` float(5,2) NOT NULL DEFAULT 0.00 COMMENT '对应的值',
  `is_answer` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1正确答案  2错误答案  3开放型答案',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1启用 2禁用',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 未删除 2已删除',
  PRIMARY KEY (`rel_question_option_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COMMENT='活动题目选项表';

-- ----------------------------
