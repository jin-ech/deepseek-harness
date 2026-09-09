-- Table structure for base_dict_social_salary
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_social_salary`;
CREATE TABLE `base_dict_social_salary` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL DEFAULT '' COMMENT '账户名称',
  `account_code` varchar(255) NOT NULL DEFAULT '' COMMENT '主体编码',
  `account_number` varchar(255) NOT NULL DEFAULT '' COMMENT '银行账号',
  `open_bank` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行',
  `link_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `taxpayer_number` varchar(255) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='收款账户字典表';

-- ----------------------------
