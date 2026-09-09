-- Table structure for guohua_plan_employ_operate_target
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_employ_operate_target`;
CREATE TABLE `guohua_plan_employ_operate_target` (
  `employ_operate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '目标id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型1:FESCO 2:自销',
  `base_self` int(11) DEFAULT NULL COMMENT '基地数量自营目标',
  `base_example` int(11) DEFAULT NULL COMMENT '基地数量示范目标',
  `base_common` int(11) DEFAULT NULL COMMENT '基地数量普通目标',
  `people_light` int(11) DEFAULT NULL COMMENT '人数轻残目标',
  `people_weight` int(11) DEFAULT NULL COMMENT '人数重残目标',
  `income_target` decimal(11,2) DEFAULT NULL COMMENT '收入数目标',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `base_self_complete` int(11) DEFAULT NULL COMMENT '基地数量自营完成',
  `base_example_complete` int(11) DEFAULT NULL COMMENT '基地数量示范完成',
  `base_common_complete` int(11) DEFAULT NULL COMMENT '基地数量普通完成',
  `people_light_complete` int(11) DEFAULT NULL COMMENT '人数轻残完成',
  `people_weight_complete` int(11) DEFAULT NULL COMMENT '人数重残完成',
  `base_light_reserve` int(11) DEFAULT NULL COMMENT '储备轻残',
  `base_weight_reserve` int(11) DEFAULT NULL COMMENT '储备重残',
  `income_target_complete` decimal(11,2) DEFAULT NULL COMMENT '收入数完成',
  `receivable_complete` decimal(11,2) DEFAULT NULL COMMENT '应收数',
  PRIMARY KEY (`employ_operate_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COMMENT='就业运营结果数据-目标';

-- ----------------------------
