-- Table structure for base_dict_customer_source
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_customer_source`;
CREATE TABLE `base_dict_customer_source` (
  `customer_source_id` varchar(255) NOT NULL DEFAULT '',
  `customer_source_name` varchar(255) NOT NULL DEFAULT '' COMMENT '来源名称',
  `sort` smallint(6) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示(1:显示,2:不显示)',
  KEY `index_customer_source_id` (`customer_source_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户管理系统-客户来源字典表';

-- ----------------------------
