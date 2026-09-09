-- Table structure for rel_store_product_order_delivery_files
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_delivery_files`;
CREATE TABLE `rel_store_product_order_delivery_files` (
  `file_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `delivery_id` bigint(20) unsigned NOT NULL COMMENT '交付物流信息ID',
  `product_order_id` varchar(64) NOT NULL COMMENT '劳动产品订单ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(500) DEFAULT NULL COMMENT '文件路径',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '1显示 0不显示',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`file_id`) USING BTREE,
  KEY `idx_delivery_files_delivery_id` (`delivery_id`) USING BTREE,
  KEY `idx_delivery_files_product_order_id` (`product_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单交付附件表';

-- ----------------------------
