-- Table structure for market_customer_service_report_file
-- ----------------------------
DROP TABLE IF EXISTS `market_customer_service_report_file`;
CREATE TABLE `market_customer_service_report_file` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stat_id` bigint(20) DEFAULT NULL COMMENT '关联统计快照ID',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `report_date` varchar(7) NOT NULL COMMENT '报告月份 YYYY-MM',
  `report_no` varchar(64) DEFAULT '' COMMENT '报告编号',
  `file_url` varchar(512) DEFAULT '' COMMENT 'PDF OSS 地址',
  `file_size` int(11) DEFAULT 0 COMMENT '文件字节数',
  `generate_status` tinyint(4) DEFAULT 1 COMMENT '生成状态 0生成中 1成功 2失败',
  `error_msg` varchar(512) DEFAULT '' COMMENT '失败原因',
  `add_userid` varchar(64) DEFAULT '' COMMENT '生成人ID',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`file_id`),
  KEY `idx_customer_report_date` (`customer_id`,`report_date`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='客户月度服务报告生成记录表';

-- ----------------------------
