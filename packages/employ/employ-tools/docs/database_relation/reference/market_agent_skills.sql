-- Table structure for market_agent_skills
-- ----------------------------
DROP TABLE IF EXISTS `market_agent_skills`;
CREATE TABLE `market_agent_skills` (
  `skill_id` bigint(20) NOT NULL COMMENT '技能主键',
  `skill_name` varchar(128) NOT NULL COMMENT '技能包名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标 url/emoji',
  `skill_code` varchar(64) NOT NULL COMMENT '技能包编码（英文，调用标识）',
  `skill_desc` text DEFAULT NULL COMMENT '技能包描述',
  `skill_type` varchar(32) NOT NULL DEFAULT '' COMMENT '技能类型',
  `author` varchar(64) NOT NULL DEFAULT '' COMMENT '开发者/负责人',
  `version` varchar(16) NOT NULL DEFAULT '1.0.0' COMMENT '版本号',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1启用 0禁用',
  `tags` varchar(512) NOT NULL DEFAULT '' COMMENT '标签（逗号分隔）',
  `input_schema` text DEFAULT NULL COMMENT '输入参数描述（JSON Schema）',
  `output_schema` text DEFAULT NULL COMMENT '输出参数描述（JSON Schema）',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序，越小越靠前',
  `is_over_answer` tinyint(1) NOT NULL DEFAULT 1 COMMENT '问答后是否结束 1是 0否',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_show_home` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页展示',
  `supports_stream` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持流式',
  `default_stream` tinyint(1) NOT NULL DEFAULT 1 COMMENT '默认是否流式',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `uk_skill_code` (`skill_code`),
  KEY `idx_status_delete` (`status`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI Agent 技能包注册表';

-- ----------------------------
