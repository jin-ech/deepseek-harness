-- Table structure for sale_target
-- ----------------------------
DROP TABLE IF EXISTS `sale_target`;
CREATE TABLE `sale_target` (
  `sale_target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售目标id',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `quarter` int(11) DEFAULT 0 COMMENT '季度',
  `month` varchar(32) DEFAULT NULL COMMENT '月份',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门ID',
  `userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `new_sign` decimal(10,2) DEFAULT NULL COMMENT '新签回款目标',
  `renew_sign` decimal(10,2) DEFAULT NULL COMMENT '续约回款目标',
  `new_sign_contract` decimal(10,2) DEFAULT NULL COMMENT '新签合同目标',
  `renew_sign_contract` decimal(10,2) DEFAULT NULL COMMENT '续签合同目标',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `update_time` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`sale_target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COMMENT='企业营销CRM销售目标表';

-- ----------------------------
