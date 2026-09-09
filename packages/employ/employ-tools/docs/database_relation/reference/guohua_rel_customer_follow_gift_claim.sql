-- Table structure for guohua_rel_customer_follow_gift_claim
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_follow_gift_claim`;
CREATE TABLE `guohua_rel_customer_follow_gift_claim` (
  `follow_claim_id` varchar(64) NOT NULL DEFAULT '',
  `follow_id` varchar(255) DEFAULT NULL COMMENT '跟进记录id',
  `gift_claim_id` varchar(64) DEFAULT NULL COMMENT '礼品认领id',
  `gift_use_num` int(11) DEFAULT NULL COMMENT '使用数量',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '认领时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`follow_claim_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户跟进关联礼品信息表';

-- ----------------------------
