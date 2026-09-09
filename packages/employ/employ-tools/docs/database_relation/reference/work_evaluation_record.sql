-- Table structure for work_evaluation_record
-- ----------------------------
DROP TABLE IF EXISTS `work_evaluation_record`;
CREATE TABLE `work_evaluation_record` (
  `id` varchar(64) NOT NULL COMMENT '主键UUID',
  `disabled_id` varchar(64) NOT NULL COMMENT '被测评人ID（work_evaluate_disabled.id）',
  `evaluation_number` tinyint(1) NOT NULL COMMENT '第几次测评（1-3）',
  `question_set_id` int(11) NOT NULL DEFAULT 0 COMMENT '题集ID（1-3，AI模式为0）',
  `mode` varchar(16) NOT NULL COMMENT '答题模式：form/ai',
  `answers_json` longtext NOT NULL COMMENT '答题记录JSON',
  `answer_seconds` int(11) NOT NULL DEFAULT 0 COMMENT '答题时长（秒）',
  `anchor_scores` longtext DEFAULT NULL COMMENT '职业锚得分JSON',
  `report_text` longtext DEFAULT NULL COMMENT '报告文本',
  `report_pdf_url` varchar(255) DEFAULT NULL COMMENT '报告PDF链接',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_disabled` (`disabled_id`) USING BTREE,
  KEY `idx_disabled_eval` (`disabled_id`,`evaluation_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人测评记录详表';

-- ----------------------------
