-- Table structure for base_dict_cost_type_2024
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_cost_type_2024`;
CREATE TABLE `base_dict_cost_type_2024` (
  `cost_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `cost_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '费用类别名称',
  `department_id` varchar(255) NOT NULL DEFAULT '' COMMENT '部门id',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示i',
  `cost_type_content` varchar(255) NOT NULL DEFAULT '' COMMENT '费用类别内容',
  PRIMARY KEY (`cost_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COMMENT='费用类别字典表';

-- ----------------------------
