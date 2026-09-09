-- Table structure for base_dict_customer_position
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_position`;
CREATE TABLE `base_dict_customer_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) NOT NULL DEFAULT '' COMMENT '职位名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:政府,2:企业 3不显示)',
  PRIMARY KEY (`position_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='机构运营CRM系统-决策人职位字典表';

-- ----------------------------
