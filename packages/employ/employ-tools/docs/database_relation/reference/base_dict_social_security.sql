-- Table structure for base_dict_social_security
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_social_security`;
CREATE TABLE `base_dict_social_security` (
  `social_security_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社保id',
  `city_id` int(32) NOT NULL DEFAULT 0 COMMENT '城市id',
  `min_base` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '社保最小缴纳基数',
  `max_base` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '社保最大缴纳基数',
  `social_security_code` varchar(32) NOT NULL DEFAULT '' COMMENT '社保code',
  `social_security_type` varchar(32) NOT NULL DEFAULT '1' COMMENT '社保类型',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1是 2否',
  `remarks` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注',
  `min_pay` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '最低工资',
  `year` varchar(32) NOT NULL DEFAULT '2022' COMMENT '年份',
  `tmp` varchar(1000) NOT NULL DEFAULT '' COMMENT '临时备注城市名',
  PRIMARY KEY (`social_security_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=utf8mb4 COMMENT='社会保险缴纳基数表';

-- ----------------------------
