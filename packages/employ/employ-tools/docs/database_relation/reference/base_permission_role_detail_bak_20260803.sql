-- Table structure for base_permission_role_detail_bak_20260803
-- ----------------------------
DROP TABLE IF EXISTS `base_permission_role_detail_bak_20260803`;
CREATE TABLE `base_permission_role_detail_bak_20260803` (
  `permission_detail_id` int(11) NOT NULL DEFAULT 0,
  `permission_role_id` varchar(64) NOT NULL DEFAULT '',
  `permission_id` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
