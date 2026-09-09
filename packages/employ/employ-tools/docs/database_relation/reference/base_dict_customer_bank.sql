-- Table structure for base_dict_customer_bank
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_bank`;
CREATE TABLE `base_dict_customer_bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  PRIMARY KEY (`bank_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户工资所属银行字典';

-- ----------------------------
