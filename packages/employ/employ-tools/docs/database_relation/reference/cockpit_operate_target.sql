-- Table structure for cockpit_operate_target
-- ----------------------------
DROP TABLE IF EXISTS `cockpit_operate_target`;
CREATE TABLE `cockpit_operate_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centre_id` varchar(64) NOT NULL DEFAULT '' COMMENT '中心ID',
  `area_id` varchar(64) NOT NULL DEFAULT '' COMMENT '区域ID',
  `department_id` varchar(64) NOT NULL DEFAULT '' COMMENT '部门ID',
  `product_attr_id` varchar(64) NOT NULL DEFAULT '' COMMENT '产品属性ID',
  `org_target` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '组织目标',
  `inc_cp_target` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '收入完成目标',
  `inc_arr_target` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '收入到账目标',
  `sp_org_target` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '冲刺组织目标',
  `sp_inc_cp_target` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '冲刺收入完成目标',
  `sp_inc_arr_target` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '冲刺收入到账目标',
  `year` int(11) NOT NULL DEFAULT 0 COMMENT '年',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='领导人驾驶舱-总体看板-经营计划数据指标表';

-- ----------------------------
