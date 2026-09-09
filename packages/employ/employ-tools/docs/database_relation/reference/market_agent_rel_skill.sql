-- Table structure for market_agent_rel_skill
-- ----------------------------
DROP TABLE IF EXISTS `market_agent_rel_skill`;
CREATE TABLE `market_agent_rel_skill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agent_code` varchar(64) NOT NULL COMMENT 'market_agents.agent_code',
  `skill_code` varchar(64) NOT NULL COMMENT 'market_agent_skills.skill_code',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序，越小越靠前',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_agent_skill` (`agent_code`,`skill_code`),
  KEY `idx_agent_code` (`agent_code`),
  KEY `idx_skill_code` (`skill_code`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='Agent 与技能关联表';

-- ----------------------------
