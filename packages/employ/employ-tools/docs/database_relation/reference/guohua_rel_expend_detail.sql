-- Table structure for guohua_rel_expend_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_expend_detail`;
CREATE TABLE `guohua_rel_expend_detail` (
  `expend_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款账单ID',
  `service_line_id` int(11) NOT NULL COMMENT '业务线ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `expend_reason` text DEFAULT NULL COMMENT '付款事由',
  `cost_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '费用类别ID',
  `deduct_costs` decimal(10,2) DEFAULT 0.00 COMMENT '扣除成本(用于渠道返款功能)',
  `expend_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '付款金额',
  `store_has` int(11) NOT NULL COMMENT '是否有单店信息',
  `refund_invoice_number` varchar(255) DEFAULT NULL COMMENT '返款发票号码',
  PRIMARY KEY (`expend_detail_id`) USING BTREE,
  KEY `idx_expend_id` (`expend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18365 DEFAULT CHARSET=utf8mb4 COMMENT='OA-付款申请关联明细表';

-- ----------------------------
