-- Table structure for base_guohua_menu_20260730
-- ----------------------------
DROP TABLE IF EXISTS `base_guohua_menu_20260730`;
CREATE TABLE `base_guohua_menu_20260730` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单名称',
  `menu_title` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单英文名-前端控制菜单使用',
  `parentid` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `hide_in_menu` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否隐藏 是1 否0',
  `parent_keys` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '父级路径',
  `sort` smallint(5) unsigned NOT NULL DEFAULT 999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  `level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '级别',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `system_id` varchar(64) NOT NULL DEFAULT '' COMMENT '系统id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COMMENT='国华内部系统菜单表';

-- ----------------------------
