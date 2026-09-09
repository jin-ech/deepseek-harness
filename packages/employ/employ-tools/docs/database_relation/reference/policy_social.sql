-- Table structure for policy_social
-- ----------------------------
DROP TABLE IF EXISTS `policy_social`;
CREATE TABLE `policy_social` (
  `social_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社会保险id',
  `policy_id` int(11) DEFAULT NULL COMMENT '政策id',
  `city_name` varchar(255) DEFAULT NULL COMMENT '城市名',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `company_old_rate` decimal(10,0) DEFAULT NULL COMMENT '企业养老',
  `our_old_rate` decimal(10,2) DEFAULT NULL COMMENT '自身养老',
  `old_min_base` decimal(10,2) DEFAULT NULL COMMENT '养老基数',
  `company_medicine_rate` decimal(10,2) DEFAULT NULL COMMENT '企业医疗',
  `our_medicine_rate` decimal(10,2) DEFAULT NULL COMMENT '自身医疗',
  `our_medicine_extra_amount` decimal(10,2) DEFAULT 0.00 COMMENT '自身医疗额外金额',
  `medicine_min_base` decimal(10,2) DEFAULT NULL COMMENT '医疗基数',
  `company_medicine_heavy_rate` decimal(10,2) DEFAULT NULL COMMENT '企业大病医疗',
  `our_medicine_heavy_rate` decimal(10,2) DEFAULT NULL COMMENT '自身大病医疗',
  `medicine_heavy_min_base` decimal(10,2) DEFAULT NULL COMMENT '大病医疗基数',
  `company_injury_rate` decimal(10,2) DEFAULT NULL COMMENT '企业工伤',
  `our_injury_rate` decimal(10,2) DEFAULT NULL COMMENT '自身工伤',
  `injury_min_base` decimal(10,2) DEFAULT NULL COMMENT '工伤基数',
  `company_work_rate` decimal(10,2) DEFAULT NULL COMMENT '企业失业',
  `our_work_rate` decimal(10,2) DEFAULT NULL COMMENT '自身失业',
  `work_min_base` decimal(10,2) DEFAULT NULL COMMENT '失业基数',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 2已删除',
  `company_total_rate` decimal(10,2) DEFAULT NULL COMMENT '五险合计',
  `our_total_rate` decimal(10,2) DEFAULT NULL COMMENT '五险合计',
  `min_money` decimal(10,2) DEFAULT NULL COMMENT '最低薪资',
  `min_base` decimal(10,2) DEFAULT NULL COMMENT '最低基数',
  `fund_base` decimal(10,2) DEFAULT NULL COMMENT '企业公积金缴费基数',
  `company_fund_rate` decimal(10,2) DEFAULT NULL COMMENT '企业公积金比例5%-12%',
  `our_fund_rate` decimal(10,2) DEFAULT NULL COMMENT '个人公积金比例0%-12%',
  `region_id` varchar(255) DEFAULT NULL COMMENT '客户关联城市id',
  `old_base` decimal(10,2) DEFAULT NULL COMMENT '养老基数',
  `medical_base` decimal(10,2) DEFAULT NULL COMMENT '医疗基数',
  `injury_base` decimal(10,2) DEFAULT NULL COMMENT '工伤基数',
  `work_base` decimal(10,2) DEFAULT NULL COMMENT '失业基数',
  `medicine_heavy_base` decimal(10,2) DEFAULT NULL COMMENT '大病医疗基数',
  `medicine_levy_model` tinyint(4) DEFAULT NULL COMMENT '大病医疗征收方式 1按年 2按月',
  PRIMARY KEY (`social_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COMMENT='残保金政策社会保险缴纳比例表';

-- ----------------------------
