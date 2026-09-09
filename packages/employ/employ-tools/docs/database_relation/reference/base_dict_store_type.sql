-- Table structure for base_dict_store_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_store_type`;
CREATE TABLE `base_dict_store_type` (
  `store_type` int(11) NOT NULL AUTO_INCREMENT COMMENT '基地标准产品类型(基地列表)',
  `store_type_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `status` tinyint(1) DEFAULT 1 COMMENT '1：显示 2：不显示',
  `product_info` varchar(1000) DEFAULT NULL COMMENT '产品介绍',
  `ai_show` tinyint(1) DEFAULT 1 COMMENT '是否在智能生成方案显示 1：显示 0：不显示',
  PRIMARY KEY (`store_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='基地类型表（标准产品类型表）';

-- ----------------------------
