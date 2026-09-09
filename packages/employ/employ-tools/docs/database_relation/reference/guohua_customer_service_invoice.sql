-- Table structure for guohua_customer_service_invoice
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_service_invoice`;
CREATE TABLE `guohua_customer_service_invoice` (
  `service_invoice_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '薪资id',
  `service_month` varchar(255) DEFAULT NULL COMMENT '所属月份',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `light_num` int(11) DEFAULT 0 COMMENT '轻残人数',
  `weight_num` int(11) DEFAULT 0 COMMENT '重残人数',
  `light_price` decimal(10,2) DEFAULT NULL COMMENT '轻残报价',
  `weight_price` decimal(10,2) DEFAULT NULL COMMENT '重残报价',
  `service_invoice_total` decimal(10,2) DEFAULT NULL COMMENT '账单金额',
  `is_use` tinyint(4) DEFAULT 0 COMMENT '0未使用 1已使用  （已开票或已回款） ',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `payment_plan_id` varchar(32) DEFAULT '0' COMMENT '回款计划id',
  `difference_amount` decimal(10,2) DEFAULT NULL COMMENT '已确认账单的差额  负数多收钱   正数少收钱 ',
  `supplement_amount` decimal(10,2) DEFAULT NULL COMMENT '当前账单补差金额  ',
  `difference_light_num` int(11) DEFAULT 0 COMMENT '轻残人数',
  `difference_weight_num` int(11) DEFAULT 0 COMMENT '重残人数',
  PRIMARY KEY (`service_invoice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78981 DEFAULT CHARSET=utf8mb4 COMMENT='客户服务费账单';

-- ----------------------------
