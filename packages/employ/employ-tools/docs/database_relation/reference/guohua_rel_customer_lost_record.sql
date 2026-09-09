-- Table structure for guohua_rel_customer_lost_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_lost_record`;
CREATE TABLE `guohua_rel_customer_lost_record` (
  `lost_record_id` varchar(32) NOT NULL COMMENT '输单记录id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `lost_reason` varchar(255) DEFAULT NULL COMMENT '输单原因',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`lost_record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户输单记录';

-- ----------------------------
