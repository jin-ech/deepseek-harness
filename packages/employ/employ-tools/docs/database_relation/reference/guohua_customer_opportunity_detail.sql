-- Table structure for guohua_customer_opportunity_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_opportunity_detail`;
CREATE TABLE `guohua_customer_opportunity_detail` (
  `opportunity_detail_id` varchar(64) NOT NULL DEFAULT '' COMMENT '商机详情id',
  `opportunity_id` varchar(64) DEFAULT NULL COMMENT '商机id',
  `disability_type` varchar(64) DEFAULT NULL COMMENT '残疾类型 1重残 2轻残',
  `disability_num` int(11) DEFAULT NULL COMMENT '人数',
  `disability_price` decimal(10,2) DEFAULT NULL COMMENT '报价',
  `discount_rate` int(11) DEFAULT NULL COMMENT '折扣率',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`opportunity_detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户商机详情表';

-- ----------------------------
