-- Table structure for cockpit_dict_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `cockpit_dict_product_attr`;
CREATE TABLE `cockpit_dict_product_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_attr_name` varchar(500) NOT NULL DEFAULT '' COMMENT '产品属性名称',
  `sort` bigint(20) NOT NULL DEFAULT 99999999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示（1是，2否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='领导人驾驶舱-总体看板-产品属性字典表';

-- ----------------------------
