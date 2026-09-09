-- Table structure for guohua_store_product_order_detail_produce
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_detail_produce`;
CREATE TABLE `guohua_store_product_order_detail_produce` (
  `product_order_produce_id` varchar(64) NOT NULL COMMENT '劳动产品订单生产d',
  `product_order_detail_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单详情id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `id_number` varchar(64) DEFAULT NULL COMMENT '身份证',
  `produce_num` int(11) DEFAULT NULL COMMENT '生产数量',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  `submit_id` int(11) DEFAULT 0,
  PRIMARY KEY (`product_order_produce_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单产品生产信息表';

-- ----------------------------
