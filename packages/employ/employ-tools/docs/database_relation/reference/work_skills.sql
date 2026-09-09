-- Table structure for work_skills
-- ----------------------------
DROP TABLE IF EXISTS `work_skills`;
CREATE TABLE `work_skills` (
  `skill_id` varchar(64) NOT NULL COMMENT '技能包唯一ID(UUID)',
  `skill_name` varchar(128) NOT NULL COMMENT '技能包名称',
  `skill_code` varchar(64) NOT NULL COMMENT '技能包编码（英文，调用标识）',
  `skill_desc` text DEFAULT NULL COMMENT '技能包描述',
  `skill_type` varchar(32) NOT NULL DEFAULT '' COMMENT '技能类型: data_stat/doc_parse/notification/custom',
  `author` varchar(64) NOT NULL DEFAULT '' COMMENT '开发者/负责人',
  `version` varchar(16) NOT NULL DEFAULT '1.0.0' COMMENT '版本号',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：1启用，0禁用',
  `system_id` varchar(64) DEFAULT '' COMMENT '所属平台ID（关联 base_dict_system）',
  `tags` varchar(512) DEFAULT '' COMMENT '标签（逗号分隔）',
  `input_schema` text DEFAULT NULL COMMENT '输入参数描述（JSON Schema 字符串）',
  `output_schema` text DEFAULT NULL COMMENT '输出参数描述（JSON Schema 字符串）',
  `is_share` tinyint(1) NOT NULL DEFAULT 2 COMMENT '是否可以分享：1可以，2不可以',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序值，越小越靠前',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_over_answer` tinyint(1) NOT NULL DEFAULT 1 COMMENT '问答结果后是否结束：1是，0否',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效：1有效，0已删除',
  PRIMARY KEY (`skill_id`) USING BTREE,
  UNIQUE KEY `uk_skill_code` (`skill_code`,`is_over_answer`) USING BTREE,
  KEY `idx_system_id` (`system_id`) USING BTREE,
  KEY `idx_skill_type` (`skill_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI Agent 技能包统计注册表';

-- ----------------------------
