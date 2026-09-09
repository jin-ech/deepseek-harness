-- Table structure for rel_store_product_order_deliver_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_deliver_record_detail`;
CREATE TABLE `rel_store_product_order_deliver_record_detail` (
  `deliver_record_detail_id` varchar(64) NOT NULL COMMENT '劳动产品交付明细id',
  `deliver_record_id` varchar(64) DEFAULT NULL COMMENT '劳动产品交付id',
  `product_order_detail_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单详情id',
  `deliver_num` int(11) DEFAULT NULL COMMENT '交付数量',
  `deliver_pass_num` int(11) DEFAULT 0 COMMENT '交付合格数量',
  `deliver_status` tinyint(4) DEFAULT 1 COMMENT '交付状态 1待验收 2合格 3不合格',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`deliver_record_detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单产品交付记录明细信息表';

-- ----------------------------
