-- Table structure for base_dict_product_2024
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_product_2024`;
CREATE TABLE `base_dict_product_2024` (
  `product_id` int(11) NOT NULL,
  `service_line_id` int(11) NOT NULL DEFAULT 0,
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '产品名称',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品父id',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可用：0-不可用；1-可用',
  `level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '产品等级',
  `main_department_id` varchar(255) NOT NULL DEFAULT '' COMMENT '主部门id',
  `store_id` varchar(64) NOT NULL DEFAULT '' COMMENT '单店id',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品字典表';

-- ----------------------------
