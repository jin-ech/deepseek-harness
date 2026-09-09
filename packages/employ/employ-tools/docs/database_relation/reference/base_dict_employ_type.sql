-- Table structure for base_dict_employ_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_employ_type`;
CREATE TABLE `base_dict_employ_type` (
  `employ_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '就业类型ID',
  `employ_type_name` varchar(64) NOT NULL DEFAULT '' COMMENT '就业类型名称',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '级别',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0 不显示',
  PRIMARY KEY (`employ_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-就业类型字典表';

-- ----------------------------
