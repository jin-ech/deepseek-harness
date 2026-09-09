-- Table structure for guohua_payer_mapping
-- ----------------------------
DROP TABLE IF EXISTS `guohua_payer_mapping`;
CREATE TABLE `guohua_payer_mapping` (
  `mapping_id` int(11) NOT NULL AUTO_INCREMENT,
  `payer_name` varchar(255) NOT NULL COMMENT '付款方名称',
  `payer_customer_id` int(11) DEFAULT NULL COMMENT '付款方客户ID',
  `customer_id` int(11) NOT NULL COMMENT '对应系统内部客户ID',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` int(11) DEFAULT 1 COMMENT '是否删除 1-未删除 0-已删除',
  PRIMARY KEY (`mapping_id`),
  UNIQUE KEY `payer_name` (`payer_name`),
  KEY `idx_payer_name` (`payer_name`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
