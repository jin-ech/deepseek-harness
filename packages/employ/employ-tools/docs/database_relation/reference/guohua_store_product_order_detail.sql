-- Table structure for guohua_store_product_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_detail`;
CREATE TABLE `guohua_store_product_order_detail` (
  `product_order_detail_id` varchar(64) NOT NULL COMMENT '劳动产品订单详情id',
  `product_order_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单id',
  `store_product_id` varchar(64) DEFAULT NULL COMMENT '劳动产品id',
  `standard_product_id` varchar(64) DEFAULT '' COMMENT '标准服务产品id（guohua_standard_service_product）',
  `product_name` varchar(255) DEFAULT NULL COMMENT '劳动产品名称',
  `product_img_url` varchar(255) DEFAULT NULL COMMENT '劳动产品图片',
  `product_num` int(11) DEFAULT NULL COMMENT '劳动产品数量',
  `product_price` decimal(10,2) DEFAULT 0.00 COMMENT '劳动产品单价 元',
  `product_labour_price` decimal(10,2) DEFAULT 0.00 COMMENT '劳动产品劳务费单价 元',
  `product_unit` varchar(64) DEFAULT NULL COMMENT '劳动产品单位',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`product_order_detail_id`) USING BTREE,
  KEY `idx_standard_product_id` (`standard_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单产品信息表';

-- ----------------------------
