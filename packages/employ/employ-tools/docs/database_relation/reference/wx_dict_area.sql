-- Table structure for wx_dict_area
-- ----------------------------
DROP TABLE IF EXISTS `wx_dict_area`;
CREATE TABLE `wx_dict_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `area_name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区名称',
  `status` tinyint(4) NOT NULL COMMENT '是否显示 1显示 0不显示',
  PRIMARY KEY (`area_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='微信预约体检功能地区字典表';

-- ----------------------------
