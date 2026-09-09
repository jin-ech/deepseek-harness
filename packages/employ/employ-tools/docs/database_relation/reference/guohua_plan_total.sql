-- Table structure for guohua_plan_total
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_total`;
CREATE TABLE `guohua_plan_total` (
  `plan_total_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经营计划id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份',
  `quarter` varchar(32) DEFAULT NULL COMMENT '季度',
  `month` varchar(32) DEFAULT NULL COMMENT '月份',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `center_id` varchar(32) DEFAULT NULL COMMENT '中心id',
  `center_name` varchar(32) DEFAULT NULL COMMENT '中心名称',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `full_people_num` varchar(32) DEFAULT NULL COMMENT '编制全职人数',
  `full_office_people_num` varchar(32) DEFAULT NULL COMMENT '在职全职人数',
  `part_people_num` varchar(32) DEFAULT NULL COMMENT '编制兼职人数',
  `part_office_people_num` varchar(32) DEFAULT NULL COMMENT '在职兼职人数',
  `sign_year_target` decimal(10,2) DEFAULT NULL COMMENT '签单年度目标',
  `sign_year_complete` decimal(10,2) DEFAULT NULL COMMENT '签单年度完成',
  `sign_quarter_target` decimal(10,2) DEFAULT NULL COMMENT '签单季度目标',
  `sign_quarter_complete` decimal(10,2) DEFAULT NULL COMMENT '签单季度完成',
  `payment_year_target` decimal(10,2) DEFAULT NULL COMMENT '回款年度目标',
  `payment_year_complete` decimal(10,2) DEFAULT NULL COMMENT '回款年度完成',
  `payment_quarter_target` decimal(10,2) DEFAULT NULL COMMENT '回款季度目标',
  `payment_quarter_complete` decimal(10,2) DEFAULT NULL COMMENT '回款季度完成',
  `profit_year_target` decimal(10,2) DEFAULT NULL COMMENT '利润年度目标',
  `profit_year_complete` decimal(10,2) DEFAULT NULL COMMENT '利润年度完成',
  `profit_quarter_target` decimal(10,2) DEFAULT NULL COMMENT '利润季度目标',
  `profit_quarter_complete` decimal(10,2) DEFAULT NULL COMMENT '回款季度完成',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`plan_total_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COMMENT='年度经营计划完成表';

-- ----------------------------
