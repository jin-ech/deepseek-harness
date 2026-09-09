-- Table structure for rel_store_product_order_deliver_back
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_deliver_back`;
CREATE TABLE `rel_store_product_order_deliver_back` (
  `deliver_back_id` varchar(64) NOT NULL COMMENT 'id',
  `product_order_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单id',
  `back_num` int(11) DEFAULT 0 COMMENT '退回数量',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`deliver_back_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单产品交付记录退回信息表';

-- ----------------------------
