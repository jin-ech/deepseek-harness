-- Table structure for guohua_rel_contract_persons_total
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_contract_persons_total`;
CREATE TABLE `guohua_rel_contract_persons_total` (
  `contract_bill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同价格id',
  `contract_id` int(11) NOT NULL DEFAULT 0 COMMENT '合同id',
  `light_disability_price` float(11,2) DEFAULT 0.00 COMMENT '轻残报价 人/年',
  `severe_disability_price` float(11,2) DEFAULT 0.00 COMMENT '重残报价 人/年',
  `dispatch_service_price` decimal(10,2) DEFAULT NULL COMMENT '派遣服务费',
  `light_num` int(11) NOT NULL DEFAULT 0 COMMENT '轻残人数 实际在职',
  `weight_num` int(11) NOT NULL DEFAULT 0 COMMENT '轻残人数 实际在职',
  `month` varchar(32) NOT NULL DEFAULT '' COMMENT '应收月份',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `bill_amount` decimal(11,2) DEFAULT NULL COMMENT '开票金额',
  `confirm_amount` decimal(11,2) DEFAULT NULL COMMENT '回款金额',
  `plan_amount` decimal(11,2) DEFAULT NULL COMMENT '应收金额',
  `real_amount` decimal(11,2) DEFAULT NULL COMMENT '账单金额',
  `amount` decimal(11,2) DEFAULT NULL COMMENT '账单金额',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  PRIMARY KEY (`contract_bill_id`) USING BTREE,
  KEY `index_contract_id` (`contract_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=182018 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-合同关联人员报价计算表';

-- ----------------------------
