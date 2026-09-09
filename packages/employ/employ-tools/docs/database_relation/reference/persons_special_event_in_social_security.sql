-- Table structure for persons_special_event_in_social_security
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_in_social_security`;
CREATE TABLE `persons_special_event_in_social_security` (
  `social_security_id` varchar(64) NOT NULL COMMENT 'id',
  `special_event_in_id` varchar(64) DEFAULT NULL COMMENT '内部事件id',
  `demand_id` int(11) DEFAULT NULL COMMENT '需求id',
  `operation_date` varchar(255) DEFAULT NULL COMMENT '增减员时间',
  `fund_base` int(11) DEFAULT 0 COMMENT '公积金缴费基数',
  `social_security_base` int(11) NOT NULL DEFAULT 0 COMMENT '社保缴纳基数',
  `social_security_payment_date` varchar(255) DEFAULT NULL COMMENT '社保缴纳时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`social_security_id`) USING BTREE,
  KEY `idx_special_event_in_id` (`special_event_in_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内部事件社保增减员扩展表';

-- ----------------------------
