-- Table structure for market_agents
-- ----------------------------
DROP TABLE IF EXISTS `market_agents`;
CREATE TABLE `market_agents` (
  `agent_id` bigint(20) NOT NULL COMMENT '主键（应用层 get_unique_num_id）',
  `agent_code` varchar(64) NOT NULL COMMENT '业务唯一编码，前端传入',
  `agent_name` varchar(128) NOT NULL DEFAULT '' COMMENT '展示名称',
  `agent_desc` varchar(512) NOT NULL DEFAULT '' COMMENT '友好描述',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标 url/emoji',
  `remark` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1启用 0禁用',
  `is_show_home` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页展示',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`agent_id`),
  UNIQUE KEY `uk_agent_code` (`agent_code`),
  KEY `idx_status` (`status`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Agent 定义表';

-- ----------------------------
