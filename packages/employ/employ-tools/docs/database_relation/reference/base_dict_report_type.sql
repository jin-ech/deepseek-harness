-- Table structure for base_dict_report_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_report_type`;
CREATE TABLE `base_dict_report_type` (
  `report_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '月报类型id',
  `report_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '月报类型名称',
  `short_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'c端显示名称',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示1:是 0:否',
  PRIMARY KEY (`report_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='月报类型表';

-- ----------------------------
