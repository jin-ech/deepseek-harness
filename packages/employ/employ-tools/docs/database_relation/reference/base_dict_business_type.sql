-- Table structure for base_dict_business_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_business_type`;
CREATE TABLE `base_dict_business_type` (
  `business_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '业务类型名称',
  `sort` smallint(6) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`business_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-业务类型字典表';

-- ----------------------------
