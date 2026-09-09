-- Table structure for product_redeem_code
-- ----------------------------
DROP TABLE IF EXISTS `product_redeem_code`;
CREATE TABLE `product_redeem_code` (
  `redeem_code_id` varchar(64) NOT NULL COMMENT '兑换码id',
  `redeem_batch` varchar(64) DEFAULT NULL COMMENT '兑换码批次（时间戳）',
  `redeem_batch_name` varchar(255) DEFAULT NULL COMMENT '兑换码批次名称',
  `redeem_code` varchar(255) DEFAULT NULL COMMENT '兑换码',
  `product_id` longtext DEFAULT NULL COMMENT '可兑换商品',
  `customer_id` int(11) DEFAULT NULL COMMENT '企业id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `is_use` tinyint(4) DEFAULT 0 COMMENT '是否使用 1是 0否',
  `is_usable` tinyint(4) DEFAULT 1 COMMENT '是否可用 1是 0否',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  PRIMARY KEY (`redeem_code_id`) USING BTREE,
  UNIQUE KEY `index_redeem_code` (`redeem_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品兑换码表';

-- ----------------------------
