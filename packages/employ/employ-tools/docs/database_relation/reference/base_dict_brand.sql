-- Table structure for base_dict_brand
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_brand`;
CREATE TABLE `base_dict_brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌',
  `brand_name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`brand_id`) USING BTREE,
  KEY `idx_group_name` (`brand_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-品牌字典表';

-- ----------------------------
