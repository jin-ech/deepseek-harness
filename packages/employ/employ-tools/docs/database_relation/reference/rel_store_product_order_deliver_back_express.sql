-- Table structure for rel_store_product_order_deliver_back_express
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_deliver_back_express`;
CREATE TABLE `rel_store_product_order_deliver_back_express` (
  `deliver_back_express_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deliver_back_id` varchar(64) DEFAULT NULL COMMENT '劳动产品交付退回id',
  `express_id` int(11) DEFAULT NULL COMMENT '物流公司id',
  `express_sn` varchar(255) DEFAULT NULL COMMENT '物流编号',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`deliver_back_express_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单产品交付退回物流信息表';

-- ----------------------------
