-- Table structure for base_dict_contract_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_contract_type`;
CREATE TABLE `base_dict_contract_type` (
  `contract_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同类型ID',
  `contract_type_name` varchar(10) NOT NULL DEFAULT '0' COMMENT '合同类型',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  PRIMARY KEY (`contract_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='客户管理系统-合同类型字典表';

-- ----------------------------
