-- Table structure for work_skill_share
-- ----------------------------
DROP TABLE IF EXISTS `work_skill_share`;
CREATE TABLE `work_skill_share` (
  `share_id` varchar(64) NOT NULL COMMENT '分享ID(UUID)',
  `skill_codes` varchar(2048) NOT NULL DEFAULT '' COMMENT '分享的技能编码，逗号分割',
  `share_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分享名称',
  `share_desc` text DEFAULT NULL COMMENT '分享描述',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否删除：1有效，0已删除',
  `expire_time` datetime DEFAULT NULL COMMENT '分享截止时间',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`share_id`) USING BTREE,
  KEY `idx_share_is_delete` (`is_delete`) USING BTREE,
  KEY `idx_share_expire_time` (`expire_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='技能分享表';

-- ----------------------------
