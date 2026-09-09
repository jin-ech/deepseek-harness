-- Table structure for cockpit_dict_department
-- ----------------------------
DROP TABLE IF EXISTS `cockpit_dict_department`;
CREATE TABLE `cockpit_dict_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(500) NOT NULL DEFAULT '' COMMENT '部门名称',
  `sort` bigint(20) NOT NULL DEFAULT 99999999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示（1是，2否）',
  `base_department_id` varchar(11) NOT NULL DEFAULT '0' COMMENT '对应部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='领导人驾驶舱-总体看板-部门字典表';

-- ----------------------------
