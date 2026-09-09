-- Table structure for base_dict_report_option_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_report_option_type`;
CREATE TABLE `base_dict_report_option_type` (
  `report_option_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '选项类型id',
  `report_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '月报类型id',
  `report_option_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '选项类型名称',
  `sort` int(11) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示1:是 0:否',
  PRIMARY KEY (`report_option_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='选项类型表';

-- ----------------------------
