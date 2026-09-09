-- Table structure for base_dict_budget_2023
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_budget_2023`;
CREATE TABLE `base_dict_budget_2023` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预算id',
  `budget_amount` decimal(11,2) NOT NULL COMMENT '预算金额',
  `cost_type_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '费用名称',
  `cost_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '费用类别id',
  `department_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `add_time` date NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `is_allow` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否允许选择',
  `product_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '产品类别',
  PRIMARY KEY (`budget_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COMMENT='年预算表';

-- ----------------------------
