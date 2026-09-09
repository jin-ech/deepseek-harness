-- Table structure for rel_store_product_order_delivery
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_delivery`;
CREATE TABLE `rel_store_product_order_delivery` (
  `delivery_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '交付物流信息ID',
  `product_order_id` varchar(64) NOT NULL COMMENT '劳动产品订单ID',
  `express_id` int(11) DEFAULT NULL COMMENT '物流公司ID，关联base_dict_express.express_id',
  `express_sn` varchar(255) NOT NULL COMMENT '快递单号',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`delivery_id`) USING BTREE,
  KEY `idx_delivery_product_order_id` (`product_order_id`) USING BTREE,
  KEY `idx_delivery_express_id` (`express_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单交付物流信息表';

-- ----------------------------
