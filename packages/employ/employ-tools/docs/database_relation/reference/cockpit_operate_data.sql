-- Table structure for cockpit_operate_data
-- ----------------------------
DROP TABLE IF EXISTS `cockpit_operate_data`;
CREATE TABLE `cockpit_operate_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centre_id` varchar(64) NOT NULL DEFAULT '' COMMENT '中心ID',
  `area_id` varchar(64) NOT NULL DEFAULT '' COMMENT '区域ID',
  `department_id` varchar(64) NOT NULL DEFAULT '' COMMENT '部门ID',
  `product_attr_id` varchar(64) NOT NULL DEFAULT '' COMMENT '产品属性ID',
  `org_onjob` int(11) NOT NULL DEFAULT 0 COMMENT '组织在职',
  `org_onjob_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '同比上周浮动 : +1 -1',
  `complete` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '已完成',
  `inc_arr_pct` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '到账完成比例',
  `sp_org_onjob` int(11) NOT NULL DEFAULT 0 COMMENT '冲刺组织在职',
  `sp_org_onjob_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '同比上周浮动 : +1 -1',
  `sp_complete` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '冲刺已完成',
  `sp_inc_arr_pct` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '冲刺到账完成比例',
  `year` int(11) NOT NULL DEFAULT 0 COMMENT '年',
  `month` int(11) NOT NULL DEFAULT 0 COMMENT '月',
  `week` int(11) NOT NULL DEFAULT 0 COMMENT '周',
  `inc_date` date NOT NULL COMMENT '日期（每周周日）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COMMENT='领导人驾驶舱-总体看板-经营计划数据表';

-- ----------------------------
