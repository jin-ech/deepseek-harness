-- Table structure for work_business_dict
-- ----------------------------
DROP TABLE IF EXISTS `work_business_dict`;
CREATE TABLE `work_business_dict` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务ID',
  `business_name` varchar(50) DEFAULT NULL COMMENT '业务名称',
  `department_id` int(11) DEFAULT NULL COMMENT '关联主部门ID',
  `sort` varchar(255) DEFAULT '999' COMMENT '排序',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '删除状态 1： 未删除 0：已删除',
  `department_ids` varchar(255) DEFAULT NULL COMMENT '部门ids',
  `exclude_service_userids` varchar(2000) NOT NULL DEFAULT '' COMMENT '排除的客服userid，逗号分隔（用于客服指标统计口径）',
  `exclude_sale_userids` varchar(500) DEFAULT NULL COMMENT '排除的销售',
  PRIMARY KEY (`business_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='业务板块字典表';

-- ----------------------------
