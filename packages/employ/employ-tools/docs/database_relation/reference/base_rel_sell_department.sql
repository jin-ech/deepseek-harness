-- Table structure for base_rel_sell_department
-- ----------------------------
DROP TABLE IF EXISTS `base_rel_sell_department`;
CREATE TABLE `base_rel_sell_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '部门层级  1营销中心 2地区大部门  3小部门',
  `department_id` int(11) NOT NULL DEFAULT 0 COMMENT '部门ID',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示（1是，2否）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `_index_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='仪表盘销售合计小计部门表';

-- ----------------------------
