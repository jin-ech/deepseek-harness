-- Table structure for guohua_payment_confirm_bill_detail_0408备份
-- ----------------------------
DROP TABLE IF EXISTS `guohua_payment_confirm_bill_detail_0408备份`;
CREATE TABLE `guohua_payment_confirm_bill_detail_0408备份` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `payment_confirm_id` int(11) NOT NULL COMMENT '确认回款id',
  `bill_id` int(11) NOT NULL COMMENT '开票id',
  `bill_detail_id` int(11) NOT NULL COMMENT '开票明细id',
  `bill_detail_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '明细分摊金额',
  `confirm_cp_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '代收代付金额',
  `confirm_service_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '服务费',
  `confirm_product_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '劳动产品费用',
  `confirm_fusion_activity_fees` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '融合活动费用',
  `confirm_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '认领人',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '明细插入时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_payment_confirm_id` (`payment_confirm_id`),
  KEY `idx_bill_detail_id` (`bill_detail_id`),
  KEY `idx_bill_id` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19316 DEFAULT CHARSET=utf8mb4 COMMENT='回款认领-开票明细关联表';

-- ----------------------------
