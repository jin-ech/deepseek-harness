-- Table structure for guohua_plan_sale_result_complete
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_sale_result_complete`;
CREATE TABLE `guohua_plan_sale_result_complete` (
  `sale_complete_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售完成id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `quarter` varchar(32) DEFAULT NULL COMMENT '季度',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `new_contract_complete` decimal(11,2) DEFAULT NULL COMMENT '新签已完成',
  `new_payment_complete` decimal(11,2) DEFAULT NULL COMMENT '新签回款完成',
  `renew_payment_complete` decimal(11,2) DEFAULT NULL COMMENT '续签回款完成',
  `area_id` varchar(32) DEFAULT NULL COMMENT '地区id',
  PRIMARY KEY (`sale_complete_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COMMENT='营销结果数据-完成';

-- ----------------------------
