-- Table structure for base_dict_customer_group
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_group`;
CREATE TABLE `base_dict_customer_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '集团名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  `company_nature` tinyint(4) NOT NULL DEFAULT 0 COMMENT '企业性质 1国企 2非国企',
  `level` tinyint(4) DEFAULT 3 COMMENT '标签级别 1公司 2团队 3个人',
  PRIMARY KEY (`group_id`) USING BTREE,
  KEY `idx_group_name` (`group_name`) USING BTREE,
  KEY `idx_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户集团信息表';

-- ----------------------------
