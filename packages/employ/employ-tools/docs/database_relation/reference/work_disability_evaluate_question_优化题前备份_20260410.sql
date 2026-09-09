-- Table structure for work_disability_evaluate_question_优化题前备份_20260410
-- ----------------------------
DROP TABLE IF EXISTS `work_disability_evaluate_question_优化题前备份_20260410`;
CREATE TABLE `work_disability_evaluate_question_优化题前备份_20260410` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `question_code` varchar(64) NOT NULL COMMENT '题目编码',
  `source_doc` varchar(128) NOT NULL DEFAULT '残疾人职业能力测评题_0331.docx' COMMENT '题目来源文档',
  `version_tag` varchar(32) NOT NULL DEFAULT '0331' COMMENT '版本标签',
  `category_l1` varchar(64) NOT NULL COMMENT '一级分类（如：职业能力测评/职业人格特征）',
  `category_l2` varchar(64) NOT NULL DEFAULT '' COMMENT '二级分类（如：通用题目/专业题目/残疾类型适配）',
  `category_l3` varchar(64) NOT NULL DEFAULT '' COMMENT '三级分类（如：职场沟通与信息解析能力/肢体残疾适配题）',
  `question_level` tinyint(1) NOT NULL DEFAULT 1 COMMENT '题目层级（1-3，当前最高3）',
  `question_no` int(11) NOT NULL DEFAULT 0 COMMENT '分类内顺序号',
  `question_type` varchar(16) NOT NULL DEFAULT 'single' COMMENT '题型：single',
  `stem` varchar(2000) NOT NULL COMMENT '题干',
  `options_json` longtext NOT NULL COMMENT '选项JSON，当前固定4个选项',
  `correct_answer` varchar(8) DEFAULT NULL COMMENT '参考答案（可空）',
  `option_count` tinyint(1) NOT NULL DEFAULT 4 COMMENT '选项数量，当前为4',
  `disability_type` varchar(32) DEFAULT NULL COMMENT '残疾类型标签（如肢体/视力/听力/言语/智力/精神）',
  `tags_json` longtext DEFAULT NULL COMMENT '标签JSON',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wdeq_code` (`question_code`),
  KEY `idx_wdeq_filter` (`is_delete`,`category_l1`,`category_l2`,`category_l3`,`disability_type`,`question_type`),
  KEY `idx_wdeq_source` (`source_doc`,`version_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=1679 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人职业能力测评题库';

-- ----------------------------
