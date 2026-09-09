-- Table structure for guohua_rel_customer_social_security
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_social_security`;
CREATE TABLE `guohua_rel_customer_social_security` (
  `security_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `pension_base` int(11) NOT NULL DEFAULT 0 COMMENT '养老基数',
  `unemployment_base` int(11) NOT NULL DEFAULT 0 COMMENT '失业基数',
  `medical_base` int(11) NOT NULL DEFAULT 0 COMMENT '医疗基数',
  `fertility_base` int(11) NOT NULL DEFAULT 0 COMMENT '生育基数',
  `work_injury_base` int(11) NOT NULL DEFAULT 0 COMMENT '工伤基数',
  `provident_fund_base` int(11) NOT NULL DEFAULT 0 COMMENT '公积金基数',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`security_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户社保信息表';

-- ----------------------------
