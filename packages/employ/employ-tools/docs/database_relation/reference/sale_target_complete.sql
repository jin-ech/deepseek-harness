-- Table structure for sale_target_complete
-- ----------------------------
DROP TABLE IF EXISTS `sale_target_complete`;
CREATE TABLE `sale_target_complete` (
  `complete_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_target_id` int(11) DEFAULT NULL COMMENT '目标id',
  `userid` varchar(255) DEFAULT '' COMMENT '人员id',
  `department_id` varchar(32) DEFAULT '' COMMENT '部门ID',
  `new_sign_complete` decimal(10,2) DEFAULT NULL COMMENT '新签回款',
  `renew_sign_complete` decimal(10,2) DEFAULT NULL COMMENT '续约回款',
  `new_sign_contract_complete` decimal(10,2) DEFAULT NULL COMMENT '新签合同额',
  `renew_sign_contract_complete` decimal(10,2) DEFAULT NULL COMMENT '续签合同额',
  `add_time` date DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`complete_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COMMENT='企业营销CRM销售目标完成情况表';

-- ----------------------------
