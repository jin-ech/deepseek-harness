-- Table structure for guohua_rel_policy_social_account_new
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_policy_social_account_new`;
CREATE TABLE `guohua_rel_policy_social_account_new` (
  `social_account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社会保险id',
  `account_id` int(11) DEFAULT NULL COMMENT '主体id',
  `city_name` varchar(255) DEFAULT NULL COMMENT '城市名',
  `account_name` varchar(255) DEFAULT NULL,
  `social_security_base` float(11,2) DEFAULT NULL,
  `found_base` float(11,2) DEFAULT NULL,
  `old_base` float(11,2) DEFAULT NULL,
  `work_base` float(11,2) DEFAULT NULL,
  `injury_base` float(11,2) DEFAULT NULL,
  `medical_base` float(11,2) DEFAULT NULL,
  `account_code` varchar(255) DEFAULT NULL COMMENT '主体编号',
  `company_injury_rate` varchar(32) DEFAULT NULL COMMENT '企业工伤',
  `company_old_rate` varchar(32) DEFAULT NULL COMMENT '企业养老',
  `company_medicine_rate` varchar(32) DEFAULT NULL COMMENT '企业医疗',
  `company_work_rate` varchar(32) DEFAULT NULL COMMENT '企业失业',
  `our_injury_rate` varchar(32) DEFAULT NULL COMMENT '自身工伤',
  `our_old_rate` varchar(32) DEFAULT NULL COMMENT '自身养老',
  `our_medicine_rate` varchar(32) DEFAULT NULL COMMENT '自身医疗',
  `our_medicine_heavy_rate` varchar(32) DEFAULT NULL COMMENT '自身大病医疗',
  `our_work_rate` varchar(32) DEFAULT NULL COMMENT '自身失业',
  `company_total_rate` varchar(32) DEFAULT NULL COMMENT '企业五险合计',
  `our_total_rate` varchar(32) DEFAULT NULL COMMENT '个人五险合计',
  `min_money` varchar(32) DEFAULT NULL COMMENT '最低薪资',
  `min_base` varchar(32) DEFAULT NULL COMMENT '最低基数',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 2已删除',
  `company_medical_base` float(11,1) DEFAULT NULL COMMENT '企业医疗基数',
  `social_start_date` varchar(32) DEFAULT NULL COMMENT '社保增减员开始日期',
  `social_end_date` varchar(32) DEFAULT NULL COMMENT '社保增增员结束日期',
  `fund_start_date` varchar(32) DEFAULT NULL COMMENT '公积金增减员开始日期',
  `fund_end_date` varchar(32) DEFAULT NULL COMMENT '公积金减员结束日期',
  `social_remarks` varchar(255) DEFAULT NULL COMMENT '社保备注',
  PRIMARY KEY (`social_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='社保缴费比例动态配置表';

-- ----------------------------
