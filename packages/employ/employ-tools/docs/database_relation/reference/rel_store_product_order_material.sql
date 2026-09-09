-- Table structure for rel_store_product_order_material
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_product_order_material`;
CREATE TABLE `rel_store_product_order_material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '材料包id',
  `product_order_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单id',
  `express_id` int(11) DEFAULT NULL COMMENT '物流公司id',
  `express_sn` varchar(255) DEFAULT NULL COMMENT '物流编号',
  `remarks` varchar(255) DEFAULT NULL COMMENT '材料包备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单材料包信息表';

-- ----------------------------
