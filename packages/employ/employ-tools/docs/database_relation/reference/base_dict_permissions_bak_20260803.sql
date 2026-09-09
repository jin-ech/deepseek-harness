-- Table structure for base_dict_permissions_bak_20260803
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_permissions_bak_20260803`;
CREATE TABLE `base_dict_permissions_bak_20260803` (
  `permission_id` varchar(32) NOT NULL DEFAULT '',
  `menu_id` int(11) DEFAULT NULL COMMENT '系统菜单id',
  `permission_name` varchar(64) NOT NULL DEFAULT '' COMMENT '权限名',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `urls` varchar(255) NOT NULL DEFAULT '' COMMENT '动作名称，对应的是方法名',
  `system_id` varchar(64) NOT NULL DEFAULT '' COMMENT '系统ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
