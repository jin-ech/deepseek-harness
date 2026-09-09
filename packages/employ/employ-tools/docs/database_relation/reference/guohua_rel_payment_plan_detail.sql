-- Table structure for guohua_rel_payment_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_payment_plan_detail`;
CREATE TABLE `guohua_rel_payment_plan_detail` (
  `payment_plan_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '付款计划明细ID',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同ID',
  `payment_plan_id` int(11) DEFAULT NULL COMMENT '付款计划ID',
  `payment_amount` decimal(10,2) DEFAULT NULL COMMENT '付款金额',
  `payment_date` varchar(64) DEFAULT NULL COMMENT '付款日期',
  `light_num` int(11) DEFAULT NULL COMMENT '轻残人数',
  `light_price` decimal(10,2) DEFAULT NULL COMMENT '轻残报价',
  `weight_num` int(11) DEFAULT NULL COMMENT '重残人数',
  `weight_price` decimal(10,2) DEFAULT NULL COMMENT '重残报价',
  `is_check` tinyint(4) DEFAULT 0 COMMENT '是否确认 1是 0否',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '添加人',
  PRIMARY KEY (`payment_plan_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11281 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-合同关联付款计划明细表';

-- ----------------------------
