-- Table structure for guhua_notice_summary_table
-- ----------------------------
DROP TABLE IF EXISTS `guhua_notice_summary_table`;
CREATE TABLE `guhua_notice_summary_table` (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `persons_id` varchar(255) NOT NULL COMMENT '人员ID',
  `notice_type_id` int(11) NOT NULL COMMENT '通知类型ID',
  `notice_number` int(11) DEFAULT NULL COMMENT '数量',
  `send_status` varchar(255) NOT NULL COMMENT '发送状态：1已发送，0未发送',
  `add_time` datetime NOT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
