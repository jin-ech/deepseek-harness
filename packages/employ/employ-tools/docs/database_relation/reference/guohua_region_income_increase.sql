-- Table structure for guohua_region_income_increase
-- ----------------------------
DROP TABLE IF EXISTS `guohua_region_income_increase`;
CREATE TABLE `guohua_region_income_increase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_code` varchar(12) NOT NULL DEFAULT '' COMMENT '区域国标码(adcode)，如110000北京',
  `region_name` varchar(64) NOT NULL DEFAULT '' COMMENT '区域名称',
  `stat_year` int(11) NOT NULL DEFAULT 0 COMMENT '统计年度，0=累计/不分年度',
  `income_amount` decimal(16,2) NOT NULL DEFAULT 0.00 COMMENT '增收总额(元)',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人userid',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_region_year` (`region_code`,`stat_year`),
  KEY `idx_region_code` (`region_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='区域增收总额(运营维护)';

-- ----------------------------
