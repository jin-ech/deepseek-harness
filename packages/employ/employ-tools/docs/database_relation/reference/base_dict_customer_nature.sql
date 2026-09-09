-- Table structure for base_dict_customer_nature
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_nature`;
CREATE TABLE `base_dict_customer_nature` (
  `nature_id` int(11) NOT NULL AUTO_INCREMENT,
  `nature_name` varchar(255) NOT NULL DEFAULT '' COMMENT '性质名称',
  `sort` smallint(6) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`nature_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户单位性质字典表';

-- ----------------------------
