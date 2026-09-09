-- Table structure for guohua_plan_employ_operate_complete
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_employ_operate_complete`;
CREATE TABLE `guohua_plan_employ_operate_complete` (
  `employ_complete_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '完成id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型1:FESCO 2:自销',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `base_self_complete` int(11) DEFAULT NULL COMMENT '基地数量自营完成',
  `base_example_complete` int(11) DEFAULT NULL COMMENT '基地数量示范完成',
  `base_common_complete` int(11) DEFAULT NULL COMMENT '基地数量普通完成',
  `people_light_complete` int(11) DEFAULT NULL COMMENT '人数轻残完成',
  `people_weight_complete` int(11) DEFAULT NULL COMMENT '人数重残完成',
  `base_light_reserve` int(11) DEFAULT NULL COMMENT '储备轻残',
  `base_weight_reserve` int(11) DEFAULT NULL COMMENT '储备重残',
  `income_target_complete` decimal(11,2) DEFAULT NULL COMMENT '收入数完成',
  `receivable_complete` decimal(11,2) DEFAULT NULL COMMENT '应收数',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`employ_complete_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='就业运营结果数据-完成';

-- ----------------------------
