-- Table structure for base_dict_customer_industry
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_industry`;
CREATE TABLE `base_dict_customer_industry` (
  `industry_id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_name` varchar(255) NOT NULL DEFAULT '' COMMENT '行业名称',
  `sort` smallint(6) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`industry_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户所属行业字典表';

-- ----------------------------
