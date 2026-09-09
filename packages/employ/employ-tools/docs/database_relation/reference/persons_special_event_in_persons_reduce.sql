-- Table structure for persons_special_event_in_persons_reduce
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_in_persons_reduce`;
CREATE TABLE `persons_special_event_in_persons_reduce` (
  `persons_reduce_id` varchar(64) NOT NULL COMMENT 'id',
  `special_event_in_id` varchar(64) DEFAULT NULL COMMENT '内部事件id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `match_id` varchar(255) DEFAULT NULL COMMENT '匹配id',
  `persons_id` varchar(255) DEFAULT NULL COMMENT '人员id',
  `operation_date` varchar(255) DEFAULT NULL COMMENT '减员时间',
  `light_disability_num` int(11) DEFAULT 0 COMMENT '轻残人数',
  `severe_disability_num` int(11) DEFAULT 0 COMMENT '重残人数',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`persons_reduce_id`) USING BTREE,
  KEY `idx_special_event_in_id` (`special_event_in_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内部事件客户减员扩展表';

-- ----------------------------
