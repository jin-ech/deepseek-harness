-- Table structure for guohua_rel_customer_channel
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_channel`;
CREATE TABLE `guohua_rel_customer_channel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int NOT NULL COMMENT '客户ID',
  `channel_id` varchar(32) NOT NULL COMMENT '渠道ID',
  `rebate_ratio` decimal(5,2) DEFAULT NULL COMMENT '客户-渠道返款比例；NULL取渠道默认值，0表示不返款',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人ID',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人ID',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` tinyint NOT NULL DEFAULT 1 COMMENT '是否删除：1未删除，0已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_channel` (`customer_id`, `channel_id`),
  KEY `idx_customer_active` (`customer_id`, `is_delete`),
  KEY `idx_channel_active_customer` (`channel_id`, `is_delete`, `customer_id`),
  CONSTRAINT `chk_customer_channel_rebate_ratio`
    CHECK (`rebate_ratio` IS NULL OR `rebate_ratio` BETWEEN 0 AND 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户-渠道关联表（多对多）';
