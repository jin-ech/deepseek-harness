-- Table structure for market_agent_claw
-- ----------------------------
DROP TABLE IF EXISTS `market_agent_claw`;
CREATE TABLE `market_agent_claw` (
  `claw_id` bigint(20) NOT NULL COMMENT '主键（应用层 get_unique_num_id）',
  `app_code` varchar(32) NOT NULL DEFAULT 'market' COMMENT '所属应用：market/work',
  `claw_code` varchar(64) NOT NULL COMMENT '业务唯一编码（英文）',
  `claw_name` varchar(128) NOT NULL DEFAULT '' COMMENT '展示名称',
  `claw_desc` varchar(512) NOT NULL DEFAULT '' COMMENT '用户展示简介',
  `route_desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '能力摘要，供 LLM 一级路由使用',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标 url/emoji',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序，越小越靠前',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1启用 0禁用',
  `is_show_home` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页展示',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`claw_id`),
  UNIQUE KEY `uk_app_claw_code` (`app_code`,`claw_code`),
  KEY `idx_app_status_delete` (`app_code`,`status`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='智能体空间（claw）定义表';

-- ----------------------------
