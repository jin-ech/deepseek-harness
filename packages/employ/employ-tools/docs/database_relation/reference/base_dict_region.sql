-- Table structure for base_dict_region
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_region`;
CREATE TABLE `base_dict_region` (
  `code` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '地区代码',
  `p_code` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '上级地区代码',
  `name` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '区域名称',
  `region_data` varchar(255) NOT NULL DEFAULT '' COMMENT 'code连接',
  `region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称连接',
  `level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1省级 2市级 3区级',
  `std_code` varchar(6) NOT NULL DEFAULT '' COMMENT '国标行政区划码(adcode)，与前端 geojson.cn 文件名对应；空串=未映射',
  PRIMARY KEY (`code`) USING BTREE,
  KEY `p_code` (`p_code`) USING BTREE,
  KEY `index_field` (`name`,`region_data`,`region_name`) USING BTREE,
  KEY `idx_std_code` (`std_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='省市区县表';

-- ----------------------------
