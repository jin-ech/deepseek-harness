-- Table structure for market_agent_rel_tool
-- ----------------------------
DROP TABLE IF EXISTS `market_agent_rel_tool`;
CREATE TABLE `market_agent_rel_tool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agent_code` varchar(64) NOT NULL COMMENT 'agent_code（也可用 claw_code/skill_code）',
  `tool_code` varchar(64) NOT NULL COMMENT 'market_agent_tools.tool_code',
  `scope` varchar(16) NOT NULL DEFAULT 'agent' COMMENT '绑定粒度：agent/claw/skill',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_agent_tool` (`agent_code`,`tool_code`,`scope`),
  KEY `idx_tool_code` (`tool_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='Agent/Claw/Skill 与工具多对多关联表';

-- ----------------------------
