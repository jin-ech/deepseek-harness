-- Table structure for guohua_rel_bill_payment_confirm
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_payment_confirm`;
CREATE TABLE `guohua_rel_bill_payment_confirm` (
  `rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联明细ID',
  `bill_id` int(11) NOT NULL COMMENT '开票ID（guohua_bill.bill_id）',
  `payment_confirm_id` int(11) NOT NULL COMMENT '已确认回款ID（guohua_payment_confirm.payment_confirm_id）',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同ID（冗余，便于查询）',
  `payment_plan_id` int(11) DEFAULT NULL COMMENT '回款计划ID（guohua_rel_payment_plan.payment_plan_id，可空）',
  `rel_amount_total` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本次核销总金额',
  `rel_cp_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本次核销代收代付金额',
  `rel_service_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本次核销服务费金额',
  `rel_product_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本次核销劳动产品金额',
  `rel_activity_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '本次核销融合活动费用',
  `confirm_date` date DEFAULT NULL COMMENT '确认日期（冗余）',
  `payment_date` date DEFAULT NULL COMMENT '回款日期（冗余）',
  `rel_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '关联状态 1生效 0作废',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`rel_id`) USING BTREE,
  UNIQUE KEY `uniq_rel_bill_confirm_plan_active` (`bill_id`,`payment_confirm_id`,`payment_plan_id`,`is_delete`) USING BTREE,
  KEY `idx_rel_bill_delete` (`bill_id`,`is_delete`) USING BTREE,
  KEY `idx_rel_payment_confirm_delete` (`payment_confirm_id`,`is_delete`) USING BTREE,
  KEY `idx_rel_contract_delete` (`contract_id`,`is_delete`) USING BTREE,
  KEY `idx_rel_plan_delete` (`payment_plan_id`,`is_delete`) USING BTREE,
  KEY `idx_rel_confirm_date` (`confirm_date`) USING BTREE,
  KEY `idx_rel_payment_date` (`payment_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开票-已确认回款核销关联明细表（支持一对多/多对多）';

-- ----------------------------
