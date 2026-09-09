-- Table structure for base_dict_social_security_fund
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_social_security_fund`;
CREATE TABLE `base_dict_social_security_fund` (
  `fund_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公积金id',
  `social_security_id` int(11) NOT NULL DEFAULT 0 COMMENT '社保id',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市id',
  `min_fund` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '公积金最小缴纳基数',
  `max_fund` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '公积金最大缴纳基数',
  `code_fund` varchar(32) NOT NULL DEFAULT '' COMMENT '公积金code',
  `remarks` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `company_old_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '企业养老',
  `our_old_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '自身养老',
  `company_medicine_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '企业医疗',
  `our_medicine_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '自身医疗',
  `company_injury_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '企业工伤',
  `our_injury_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '自身工伤',
  `company_work_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '企业失业',
  `our_work_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '自身失业',
  `company_medicine_heavy_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '企业大病医疗',
  `our_medicine_heavy_rate` varchar(32) NOT NULL DEFAULT '0' COMMENT '自身大病医疗',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1是 2否',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 未删除 2已删除',
  PRIMARY KEY (`fund_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=917 DEFAULT CHARSET=utf8mb4 COMMENT='社会保险公积金基数表';

-- ----------------------------
