-- Table structure for base_dict_accrued_risk_ratio
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_accrued_risk_ratio`;
CREATE TABLE `base_dict_accrued_risk_ratio` (
  `accrued_risk_ratio_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_allocation_ratio` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '渠道分配比例',
  `self_allocation_ratio` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '自有分配比例',
  `accrued_risk_ratio` int(11) NOT NULL DEFAULT 0 COMMENT '风险金计提比例',
  `is_accrued_risk` tinyint(4) NOT NULL COMMENT '是否计提风险 1:是 2:否',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`accrued_risk_ratio_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-风险金计提字典表';

-- ----------------------------
