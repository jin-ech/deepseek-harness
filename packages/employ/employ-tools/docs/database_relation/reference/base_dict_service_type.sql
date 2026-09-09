-- Table structure for base_dict_service_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_service_type`;
CREATE TABLE `base_dict_service_type` (
  `service_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '服务类型名称',
  `sort` smallint(6) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`service_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-服务类型字典表';

-- ----------------------------
