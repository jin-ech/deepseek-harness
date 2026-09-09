-- Table structure for guohua_store_product_order_confirm_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_confirm_record`;
CREATE TABLE `guohua_store_product_order_confirm_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_order_id` varchar(64) NOT NULL COMMENT '劳动产品订单id',
  `confirm_token_hash` varchar(64) NOT NULL DEFAULT '' COMMENT '确认token哈希',
  `token_iat` int(11) NOT NULL DEFAULT 0 COMMENT 'token签发时间(秒)',
  `token_exp` int(11) NOT NULL DEFAULT 0 COMMENT 'token过期时间(秒)',
  `token_nonce` varchar(32) NOT NULL DEFAULT '' COMMENT 'token随机串',
  `is_expired` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否过期 1是 0否',
  `status_before` tinyint(4) NOT NULL DEFAULT 0 COMMENT '确认前订单状态',
  `status_after` tinyint(4) NOT NULL DEFAULT 0 COMMENT '确认后订单状态',
  `confirm_result` tinyint(4) NOT NULL DEFAULT 1 COMMENT '确认结果 1成功 2重复确认',
  `confirm_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '确认人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_gspocr_order_id` (`product_order_id`) USING BTREE,
  KEY `idx_gspocr_token_hash` (`confirm_token_hash`) USING BTREE,
  KEY `idx_gspocr_add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COMMENT='劳动产品订单确认记录表';

-- ----------------------------
