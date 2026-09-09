-- Table structure for base_dict_target_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_target_type`;
CREATE TABLE `base_dict_target_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type_id` varchar(255) DEFAULT NULL COMMENT '模板id',
  `target_type_name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否显示  1 显示 0 不显示',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='目标表格类型字典表';

-- ----------------------------
