-- Table structure for market_agent_tools
-- ----------------------------
DROP TABLE IF EXISTS `market_agent_tools`;
CREATE TABLE `market_agent_tools` (
  `tool_id` bigint(20) NOT NULL COMMENT '主键（应用层 get_unique_num_id）',
  `tool_code` varchar(64) NOT NULL COMMENT '业务唯一编码（英文）',
  `tool_name` varchar(128) NOT NULL DEFAULT '' COMMENT '展示名称',
  `tool_desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '一句话能力描述（供 LLM 路由/Planner 选用工具）',
  `category` varchar(32) NOT NULL DEFAULT '' COMMENT '分类：search/parse/ocr/storage/other',
  `input_schema` text DEFAULT NULL COMMENT '输入参数 JSON Schema',
  `output_schema` text DEFAULT NULL COMMENT '输出参数 JSON Schema',
  `timeout_ms` int(11) NOT NULL DEFAULT 30000 COMMENT '默认超时（毫秒）',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `supports_stream` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持流式',
  `default_stream` tinyint(1) NOT NULL DEFAULT 1 COMMENT '默认是否流式',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1启用 0禁用',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`tool_id`),
  UNIQUE KEY `uk_tool_code` (`tool_code`),
  KEY `idx_status_delete` (`status`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AI Agent 工具注册表';

-- ----------------------------
