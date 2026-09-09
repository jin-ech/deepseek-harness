-- Table structure for base_dict_region_data1
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_region_data1`;
CREATE TABLE `base_dict_region_data1` (
  `code` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '地区代码',
  `p_code` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '上级地区代码',
  `name` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '区域名称',
  `region_data` varchar(255) NOT NULL DEFAULT '' COMMENT 'code连接',
  `region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称连接',
  PRIMARY KEY (`code`) USING BTREE,
  KEY `p_code` (`p_code`) USING BTREE,
  KEY `index_field` (`name`,`region_data`,`region_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='省市区县表';

-- ----------------------------
