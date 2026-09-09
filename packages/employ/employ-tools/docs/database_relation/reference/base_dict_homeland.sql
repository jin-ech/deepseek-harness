-- Table structure for base_dict_homeland
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_homeland`;
CREATE TABLE `base_dict_homeland` (
  `homeland_id` int(11) NOT NULL AUTO_INCREMENT,
  `homeland_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  `district_name` varchar(255) NOT NULL DEFAULT '' COMMENT '所在区县',
  PRIMARY KEY (`homeland_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4 COMMENT='温馨家园字典表';

-- ----------------------------
