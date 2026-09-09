-- Table structure for cockpit_dict_area
-- ----------------------------
DROP TABLE IF EXISTS `cockpit_dict_area`;
CREATE TABLE `cockpit_dict_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(500) NOT NULL DEFAULT '' COMMENT '区域名称',
  `sort` bigint(20) NOT NULL DEFAULT 99999999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示（1是，2否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='领导人驾驶舱-总体看板-区域字典表';

-- ----------------------------
