-- Table structure for base_dict_service_department
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_service_department`;
CREATE TABLE `base_dict_service_department` (
  `service_department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务部门id',
  `service_department_name` varchar(64) NOT NULL DEFAULT '' COMMENT '业务部门名称',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0不显示i',
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '人员id',
  PRIMARY KEY (`service_department_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COMMENT='外企服务部门表';

-- ----------------------------
