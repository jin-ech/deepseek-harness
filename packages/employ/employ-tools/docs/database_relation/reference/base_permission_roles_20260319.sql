-- Table structure for base_permission_roles_20260319
-- ----------------------------
DROP TABLE IF EXISTS `base_permission_roles_20260319`;
CREATE TABLE `base_permission_roles_20260319` (
  `permission_role_id` varchar(64) NOT NULL,
  `permission_role_name` varchar(32) NOT NULL,
  `persistence` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` int(11) NOT NULL DEFAULT 999,
  `permission_sort` int(11) NOT NULL DEFAULT 999,
  `system_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`permission_role_id`) USING BTREE,
  UNIQUE KEY `uk_pmsn_name` (`permission_role_name`,`is_deleted`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限角色';

-- ----------------------------
