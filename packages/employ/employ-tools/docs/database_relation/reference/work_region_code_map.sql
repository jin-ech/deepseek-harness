-- Table structure for work_region_code_map
-- ----------------------------
DROP TABLE IF EXISTS `work_region_code_map`;
CREATE TABLE `work_region_code_map` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `province_code` varchar(2) NOT NULL COMMENT '省编码（2位）',
  `province_name` varchar(64) NOT NULL COMMENT '省名称',
  `city_code` varchar(4) NOT NULL COMMENT '市编码（4位）',
  `city_name` varchar(64) NOT NULL COMMENT '市名称',
  `area_code` varchar(6) NOT NULL COMMENT '区县编码（6位）',
  `area_name` varchar(64) NOT NULL COMMENT '区县名称',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_area_code` (`area_code`) USING BTREE,
  KEY `idx_city_code` (`city_code`) USING BTREE,
  KEY `idx_province_code` (`province_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2983 DEFAULT CHARSET=utf8mb4 COMMENT='行政区划码映射表';

-- ----------------------------
