-- Table structure for base_dict_contract_status
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_contract_status`;
CREATE TABLE `base_dict_contract_status` (
  `contract_status_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同签署状态id',
  `contract_status_name` varchar(10) NOT NULL DEFAULT '0' COMMENT '合同签署状态',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  PRIMARY KEY (`contract_status_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='客户管理系统-合同签署状态字典表';

-- ----------------------------
