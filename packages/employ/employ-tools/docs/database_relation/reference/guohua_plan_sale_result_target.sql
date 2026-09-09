-- Table structure for guohua_plan_sale_result_target
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_sale_result_target`;
CREATE TABLE `guohua_plan_sale_result_target` (
  `sale_target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售目标id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `target_type` varchar(32) DEFAULT NULL COMMENT '1 年度目标 2季度目标 3月度目标',
  `area_id` varchar(32) DEFAULT NULL COMMENT '地区id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `new_contract` decimal(10,2) DEFAULT NULL COMMENT '新签合同总目标',
  `new_payment` decimal(10,2) DEFAULT NULL COMMENT '新签回款总目标',
  `renew_payment` decimal(10,2) DEFAULT NULL COMMENT '续签回款总目标',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `quarter` varchar(32) DEFAULT NULL COMMENT '季度',
  `start_date` varchar(32) DEFAULT NULL COMMENT '开始月',
  `end_date` varchar(32) DEFAULT NULL COMMENT '结束月',
  PRIMARY KEY (`sale_target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COMMENT='营销结果数据-目标';

-- ----------------------------
