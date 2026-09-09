-- Table structure for base_dict_customer_maincode
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_maincode`;
CREATE TABLE `base_dict_customer_maincode` (
  `customer_main_code` int(11) NOT NULL AUTO_INCREMENT,
  `customer_main_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主体名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  PRIMARY KEY (`customer_main_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COMMENT='客户管理系统-客户主体编码表';

-- ----------------------------
