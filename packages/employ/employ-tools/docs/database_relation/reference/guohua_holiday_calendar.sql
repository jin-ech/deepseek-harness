-- Table structure for guohua_holiday_calendar
-- ----------------------------
DROP TABLE IF EXISTS `guohua_holiday_calendar`;
CREATE TABLE `guohua_holiday_calendar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_date` date NOT NULL COMMENT '日期',
  `date_type` tinyint(4) NOT NULL COMMENT '1=法定假日(不上班), 2=调休补班(周末需上班)',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '节假日名称，如 春节/国庆节',
  `year_num` smallint(6) NOT NULL COMMENT '年份，方便按年查询',
  `create_time` int(10) unsigned NOT NULL DEFAULT 0,
  `update_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_calendar_date` (`calendar_date`),
  KEY `idx_year_type` (`year_num`,`date_type`)
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=utf8mb4 COMMENT='节假日与调休补班日历';

-- ----------------------------
