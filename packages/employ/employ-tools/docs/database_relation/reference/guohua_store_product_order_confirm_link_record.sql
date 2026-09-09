-- Table structure for guohua_store_product_order_confirm_link_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_confirm_link_record`;
CREATE TABLE `guohua_store_product_order_confirm_link_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_order_id` varchar(64) NOT NULL COMMENT '劳动产品订单id',
  `confirm_token` text DEFAULT NULL COMMENT '确认token',
  `confirm_url` text DEFAULT NULL COMMENT '确认链接',
  `token_iat` int(11) NOT NULL DEFAULT 0 COMMENT 'token签发时间(秒)',
  `token_exp` int(11) NOT NULL DEFAULT 0 COMMENT 'token过期时间(秒)',
  `expire_at` datetime DEFAULT NULL COMMENT '过期时间',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '生成人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_gspoclr_order_id` (`product_order_id`) USING BTREE,
  KEY `idx_gspoclr_token_exp` (`token_exp`) USING BTREE,
  KEY `idx_gspoclr_add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单确认链接记录表';

-- ----------------------------
