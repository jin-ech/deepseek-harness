-- Table structure for ins_dict_medical_security
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_medical_security`;
CREATE TABLE `ins_dict_medical_security` (
  `medical_security_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医疗保障id',
  `medical_security_name` varchar(255) NOT NULL DEFAULT '' COMMENT '医疗保障名称',
  PRIMARY KEY (`medical_security_id`) USING BTREE,
  KEY `_index_name` (`medical_security_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='医疗保障字典表';

-- ----------------------------
