-- Table structure for guohua_rel_payment_dispatch_plan
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_payment_dispatch_plan`;
CREATE TABLE `guohua_rel_payment_dispatch_plan` (
  `dispatch_payment_plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '付款计划ID',
  `contract_id` int(11) NOT NULL DEFAULT 0 COMMENT '合同ID',
  `payment_method` varchar(64) NOT NULL DEFAULT '0' COMMENT '1年付 2季度付 3月付 7半年付',
  `payment_form` int(11) NOT NULL DEFAULT 2 COMMENT '付款形式(1:预付款 2:应付款)',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '付款金额',
  `payment_date` varchar(64) NOT NULL DEFAULT '' COMMENT '付款日期',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '添加人',
  `light_num` int(11) DEFAULT NULL COMMENT '当月在职人数',
  `weight_num` int(11) DEFAULT NULL COMMENT '当月在职人数',
  `light_price` decimal(10,2) DEFAULT NULL COMMENT '轻残报价',
  `weight_price` decimal(10,2) DEFAULT NULL COMMENT '重残报价',
  `bill_id` int(11) DEFAULT NULL COMMENT 'id',
  `payment_confirm_id` int(11) DEFAULT NULL COMMENT '回款id',
  `is_update` int(11) DEFAULT NULL COMMENT '1 手动修改 ',
  PRIMARY KEY (`dispatch_payment_plan_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3646 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-合同关联付款计划表';

-- ----------------------------
