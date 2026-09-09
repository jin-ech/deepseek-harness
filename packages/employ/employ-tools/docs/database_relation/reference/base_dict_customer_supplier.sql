-- Table structure for base_dict_customer_supplier
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_supplier`;
CREATE TABLE `base_dict_customer_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示',
  `sort` tinyint(4) NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='客户供应商字典表';

-- ----------------------------
