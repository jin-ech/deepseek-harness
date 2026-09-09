-- Table structure for guohua_plan_sale_process
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_sale_process`;
CREATE TABLE `guohua_plan_sale_process` (
  `sale_process_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售过程id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份',
  `month` varchar(32) DEFAULT NULL COMMENT '月份',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `department_people_num` int(11) DEFAULT NULL COMMENT '部门人数',
  `visit_num_target` int(11) DEFAULT NULL COMMENT '月客户拜访量',
  `opportunity_num_target` int(11) DEFAULT NULL COMMENT '月有效商机数',
  `follow_num_target` int(11) DEFAULT NULL COMMENT '月有效客户沟通数',
  `talk_num_target` decimal(10,2) DEFAULT NULL COMMENT '月沟通时长',
  `visit_num_complete` int(11) DEFAULT NULL COMMENT '客户拜访完成',
  `opportunity_num_complete` int(11) DEFAULT NULL COMMENT '有效商机完成',
  `follow_num_complete` int(11) DEFAULT NULL COMMENT '有效客户完成',
  `talk_num_complete` int(11) DEFAULT NULL COMMENT '合作客户完成',
  `customer_num_a` int(11) DEFAULT NULL COMMENT 'A类客户数',
  `contract_money_a` int(11) DEFAULT NULL COMMENT 'A类合同金额',
  `light_num_a` int(11) DEFAULT NULL COMMENT 'A类轻残人数',
  `weight_num_a` int(11) DEFAULT NULL COMMENT 'A类重残人数',
  `customer_num_b` int(11) DEFAULT NULL COMMENT 'B类客户数',
  `contract_money_b` int(11) DEFAULT NULL COMMENT 'B类合同金额',
  `light_num_b` int(11) DEFAULT NULL COMMENT 'B类轻残人数',
  `weight_num_b` int(11) DEFAULT NULL COMMENT 'B类重残人数',
  `customer_num_c` int(11) DEFAULT NULL COMMENT 'C类客户数',
  `contract_money_c` int(11) DEFAULT NULL COMMENT 'C类合同金额',
  `light_num_c` int(11) DEFAULT NULL COMMENT 'C类轻残人数',
  `weight_num_c` int(11) DEFAULT NULL COMMENT 'C类重残人数',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`sale_process_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COMMENT='营销过程数据';

-- ----------------------------
