-- Table structure for guohua_rel_confirm_expend
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_confirm_expend`;
CREATE TABLE `guohua_rel_confirm_expend` (
  `expend_confirm_id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_id` bigint(20) DEFAULT NULL COMMENT '支出id',
  `payment_confirm_id` int(11) DEFAULT NULL COMMENT '认款ID',
  `rebate_amount` decimal(10,2) DEFAULT NULL COMMENT '实际支出金额',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `expend_detail_id` int(11) DEFAULT 0 COMMENT '付款申请ID',
  `rebate_ratio` float(11,2) DEFAULT NULL COMMENT '返款比例',
  `customer_id` varchar(32) DEFAULT NULL COMMENT '客户id',
  `deduct_costs` decimal(10,2) DEFAULT 0.00 COMMENT '扣除成本明细(用于渠道返款功能)',
  `channel_id` varchar(32) NOT NULL COMMENT '渠道id',
  PRIMARY KEY (`expend_confirm_id`) USING BTREE,
  KEY `_index_customer_id` (`expend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=utf8mb4 COMMENT='认款支出明细表';

-- ----------------------------
