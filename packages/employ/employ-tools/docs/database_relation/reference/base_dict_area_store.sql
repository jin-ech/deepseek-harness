-- Table structure for base_dict_area_store
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_area_store`;
CREATE TABLE `base_dict_area_store` (
  `base_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区名称表',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `sort` int(11) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示  1 显示 0 不显示',
  PRIMARY KEY (`base_area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COMMENT='地区表';

-- ----------------------------
