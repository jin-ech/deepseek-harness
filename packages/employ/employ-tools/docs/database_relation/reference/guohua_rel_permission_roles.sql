-- Table structure for guohua_rel_permission_roles
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_permission_roles`;
CREATE TABLE `guohua_rel_permission_roles` (
  `rel_roles_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_tools_key` varchar(255) NOT NULL,
  `permission_tools_name` varchar(255) NOT NULL DEFAULT '',
  `permission_id` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 999,
  `system_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`rel_roles_id`) USING BTREE,
  UNIQUE KEY `uk_pmsn_name` (`permission_tools_key`,`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='权限角色';

-- ----------------------------
