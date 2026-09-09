-- Table structure for guohua_rel_customer_report_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_report_files`;
CREATE TABLE `guohua_rel_customer_report_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `group_id` int(11) DEFAULT NULL COMMENT '集团id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `report_date` varchar(64) DEFAULT NULL COMMENT '月报周期',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COMMENT='客户月报附件表';

-- ----------------------------
