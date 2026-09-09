-- Table structure for guohua_store_product_order_external
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_external`;
CREATE TABLE `guohua_store_product_order_external` (
  `external_order_id` varchar(64) NOT NULL COMMENT '外部订单关联记录ID',
  `product_order_id` varchar(64) NOT NULL COMMENT '内部劳动产品订单ID',
  `source_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单来源 0:劳动产品订单 1:爱立方 2:线下活动 3:自动售卖机',
  `has_external_order_no` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有外部订单号 1:是 0:否',
  `external_order_no` varchar(128) NOT NULL DEFAULT '' COMMENT '外部订单号',
  `order_amount` decimal(12,2) NOT NULL DEFAULT 0.00 COMMENT '外部订单金额（元）',
  `product_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '产品数量',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '添加人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '最后编辑人userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '编辑时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未删除 0:已删除',
  PRIMARY KEY (`external_order_id`),
  KEY `idx_product_order_id` (`product_order_id`,`is_delete`),
  KEY `idx_source_external_no` (`source_type`,`external_order_no`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单外部订单关联表';

-- ----------------------------
