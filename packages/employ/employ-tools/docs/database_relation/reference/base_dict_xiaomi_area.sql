-- Table structure for base_dict_xiaomi_area
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_xiaomi_area`;
CREATE TABLE `base_dict_xiaomi_area` (
  `xiaomi_area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌',
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`xiaomi_area_id`) USING BTREE,
  KEY `idx_group_name` (`area_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='小米区域';

-- ----------------------------
