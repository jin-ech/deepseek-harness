-- Table structure for guohua_rel_bill_store
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_store`;
CREATE TABLE `guohua_rel_bill_store` (
  `bill_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL DEFAULT 11 COMMENT '确认回款id',
  `bill_detail_id` int(11) NOT NULL DEFAULT 0 COMMENT '费用明细id',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '单店id',
  `bill_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '单店确认金额',
  PRIMARY KEY (`bill_store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COMMENT='确认收款关联单店表';

-- ----------------------------
