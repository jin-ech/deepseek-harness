-- Table structure for ins_dict_personal_income
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_personal_income`;
CREATE TABLE `ins_dict_personal_income` (
  `personal_income_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '个人收入id',
  `personal_income_name` varchar(255) NOT NULL DEFAULT '' COMMENT '对应名称',
  PRIMARY KEY (`personal_income_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人个人收入字典表';

-- ----------------------------
