-- Table structure for base_dict_ens_activity_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_ens_activity_type`;
CREATE TABLE `base_dict_ens_activity_type` (
  `activity_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动类型id',
  `activity_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类型名称',
  `short_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动简称',
  `icon_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon未激活url',
  `icon_activate_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon激活url',
  `bg_color` varchar(64) NOT NULL COMMENT '列表背景色',
  `text_color` varchar(64) NOT NULL DEFAULT '' COMMENT '字体颜色',
  `source` tinyint(4) NOT NULL DEFAULT 2 COMMENT '类型来源 1 系统默认 2 温馨家园自定义',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`activity_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='助益行活动类型表';

-- ----------------------------
