-- Table structure for guohua_rel_confirm_sotre
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_confirm_sotre`;
CREATE TABLE `guohua_rel_confirm_sotre` (
  `confirm_store_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_confirm_id` int(11) NOT NULL DEFAULT 11 COMMENT '确认回款id',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '单店id',
  `confirm_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '单店确认金额',
  PRIMARY KEY (`confirm_store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COMMENT='确认收款关联单店表';

-- ----------------------------
