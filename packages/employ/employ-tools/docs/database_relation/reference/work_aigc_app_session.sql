-- Table structure for work_aigc_app_session
-- ----------------------------
DROP TABLE IF EXISTS `work_aigc_app_session`;
CREATE TABLE `work_aigc_app_session` (
  `session_id` varchar(64) NOT NULL COMMENT '会话ID（UUID）',
  `skill_code` varchar(64) DEFAULT NULL COMMENT '技能编码',
  `session_name` varchar(255) DEFAULT NULL COMMENT '会话名称',
  `user_id` varchar(64) DEFAULT NULL COMMENT '操作用户ID（userid）',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:未删除 1:已删除',
  `prompt_list` varchar(2000) DEFAULT NULL COMMENT '提示词变量(JSON)',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 0:否 1:是',
  `session_type` varchar(50) NOT NULL DEFAULT 'report' COMMENT '会话类型 report:智能报表 search:定制检索',
  PRIMARY KEY (`session_id`) USING BTREE,
  KEY `ix_work_aigc_app_session_app_id` (`skill_code`) USING BTREE,
  KEY `ix_work_aigc_app_session_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AIGC 应用会话表';

-- ----------------------------
