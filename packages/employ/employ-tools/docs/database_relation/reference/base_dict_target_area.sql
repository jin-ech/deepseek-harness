-- Table structure for base_dict_target_area
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_target_area`;
CREATE TABLE `base_dict_target_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '区域',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示  1 显示 0 不显示',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='区域表';

-- ----------------------------
