-- Table structure for market_app_session
-- ----------------------------
DROP TABLE IF EXISTS `market_app_session`;
CREATE TABLE `market_app_session` (
  `session_id` bigint(20) NOT NULL COMMENT '会话ID（应用层 get_unique_num_id）',
  `market_user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '归属用户 market_users.market_user_id',
  `skill_code` varchar(64) DEFAULT NULL COMMENT '技能编码',
  `session_name` varchar(255) DEFAULT NULL COMMENT '会话名称',
  `prompt_list` varchar(2000) DEFAULT NULL COMMENT '提示词变量(JSON)',
  `session_type` varchar(50) NOT NULL DEFAULT 'report' COMMENT '会话类型 report/search 等',
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`session_id`),
  KEY `idx_market_session_user` (`market_user_id`),
  KEY `idx_market_session_skill` (`skill_code`),
  KEY `idx_market_session_type_time` (`session_type`,`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序应用会话表';

-- ----------------------------
