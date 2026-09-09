-- Table structure for guohua_store_product_order_salary
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_salary`;
CREATE TABLE `guohua_store_product_order_salary` (
  `product_order_salary_id` varchar(64) NOT NULL COMMENT '劳动产品账单id',
  `product_order_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1：未删除 0 已删除',
  PRIMARY KEY (`product_order_salary_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地劳动产品交付账单表';

-- ----------------------------
