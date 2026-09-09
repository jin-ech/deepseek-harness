-- Table structure for work_role_skill
-- ----------------------------
DROP TABLE IF EXISTS `work_role_skill`;
CREATE TABLE `work_role_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `permission_role_id` varchar(64) NOT NULL COMMENT '角色ID（关联 base_permission_roles.permission_role_id）',
  `skill_code` varchar(64) NOT NULL COMMENT '技能编码（关联 base_ai_skills.skill_code）',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_role_skill` (`permission_role_id`,`skill_code`) USING BTREE,
  KEY `idx_role_id` (`permission_role_id`) USING BTREE,
  KEY `idx_skill_code` (`skill_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COMMENT='角色-技能绑定表（控制不同角色可使用的 AI Skill）';

-- ----------------------------
