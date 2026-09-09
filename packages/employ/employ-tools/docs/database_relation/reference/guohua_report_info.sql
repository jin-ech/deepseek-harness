-- Table structure for guohua_report_info
-- ----------------------------
DROP TABLE IF EXISTS `guohua_report_info`;
CREATE TABLE `guohua_report_info` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '月报id',
  `persons_id` varchar(36) NOT NULL DEFAULT '' COMMENT '人员id',
  `report_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '月报类型id',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `report_year` varchar(64) NOT NULL DEFAULT '' COMMENT '年份',
  `report_month` varchar(64) NOT NULL DEFAULT '' COMMENT '月份',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  `customer_id` varchar(32) DEFAULT NULL COMMENT '客户id',
  `report_year_month` varchar(7) GENERATED ALWAYS AS (concat(`report_year`,'-',lpad(`report_month`,2,'0'))) STORED,
  PRIMARY KEY (`report_id`) USING BTREE,
  KEY `persons_id_report_year_month` (`persons_id`,`report_year_month`),
  KEY `idx_persons_id_is_delete` (`persons_id`,`is_delete`),
  KEY `persons_id_report_year_month_is_delete` (`persons_id`,`report_year_month`,`is_delete`),
  KEY `idx_persons_id` (`persons_id`),
  KEY `idx_report_ym_sort` (`is_delete`,`report_year_month`,`add_time`,`report_month`,`persons_id`),
  KEY `idx_report_sort` (`is_delete`,`add_time`,`report_month`,`persons_id`),
  KEY `idx_report_list` (`is_delete`,`report_year_month`,`add_time`,`report_month`,`persons_id`),
  KEY `is_delete_add_time_report_year_month_persons_id` (`is_delete`,`add_time`,`report_year_month`,`persons_id`),
  KEY `idx_gri_isdel_addtime_reportmonth_personsid_reportid` (`is_delete`,`add_time`,`report_month`,`persons_id`,`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124344 DEFAULT CHARSET=utf8mb4 COMMENT='月报信息记录表';

-- ----------------------------
