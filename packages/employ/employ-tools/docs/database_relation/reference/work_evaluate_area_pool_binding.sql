-- Table structure for work_evaluate_area_pool_binding
-- ----------------------------
DROP TABLE IF EXISTS `work_evaluate_area_pool_binding`;
CREATE TABLE `work_evaluate_area_pool_binding` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `evaluate_area_id` varchar(64) NOT NULL COMMENT '区县ID（work_evaluate_area.id）',
  `qrcode_pool_id` varchar(64) NOT NULL COMMENT '二维码池ID（work_evaluate_qrcode_pool.id）',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bind_area` (`evaluate_area_id`),
  KEY `idx_bind_area` (`evaluate_area_id`),
  KEY `idx_bind_pool` (`qrcode_pool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区县与二维码池绑定（覆盖默认回退规则）';

-- ----------------------------
