-- Table structure for base_dict_policy_social
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_policy_social`;
CREATE TABLE `base_dict_policy_social` (
  `social_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社会保险id',
  `company_old_rate` decimal(10,0) DEFAULT NULL COMMENT '企业养老',
  `our_old_rate` decimal(10,2) DEFAULT NULL COMMENT '自身养老',
  `company_medicine_rate` decimal(10,2) DEFAULT NULL COMMENT '企业医疗',
  `our_medicine_rate` decimal(10,2) DEFAULT NULL COMMENT '自身医疗',
  `company_medicine_heavy_rate` decimal(10,2) DEFAULT NULL COMMENT '企业大病医疗',
  `our_medicine_heavy_rate` decimal(10,2) DEFAULT NULL COMMENT '自身大病医疗',
  `company_injury_rate` decimal(10,2) DEFAULT NULL COMMENT '企业工伤',
  `our_injury_rate` decimal(10,2) DEFAULT NULL COMMENT '自身工伤',
  `company_work_rate` decimal(10,2) DEFAULT NULL COMMENT '企业失业',
  `our_work_rate` decimal(10,2) DEFAULT NULL COMMENT '自身失业',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 2已删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `city_name` varchar(32) DEFAULT NULL COMMENT '城市名',
  `min_money` decimal(10,2) DEFAULT NULL COMMENT '最低薪资',
  `min_base` decimal(10,2) DEFAULT NULL COMMENT '最低基数',
  `fund_base` decimal(10,2) DEFAULT NULL COMMENT '公积金基数',
  `region_id` varchar(32) DEFAULT NULL COMMENT '客户关联城市id',
  `old_base` decimal(10,2) DEFAULT NULL COMMENT '养老基数',
  `medical_base` decimal(10,2) DEFAULT NULL COMMENT '医疗基数',
  `injury_base` decimal(10,2) DEFAULT NULL COMMENT '工伤基数',
  `work_base` decimal(10,2) DEFAULT NULL COMMENT '失业基数',
  `medicine_heavy_base` decimal(10,2) DEFAULT NULL COMMENT '大病医疗基数',
  `year` varchar(32) DEFAULT NULL COMMENT '所属年份',
  PRIMARY KEY (`social_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社会保险比例表';

-- ----------------------------
