-- Table structure for guohua_rel_customer_invoice
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_invoice`;
CREATE TABLE `guohua_rel_customer_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开票信息id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `customer_head` varchar(255) DEFAULT NULL COMMENT '公司抬头',
  `customer_tin_code` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `customer_account_bank` varchar(255) DEFAULT NULL COMMENT '客户开户银行',
  `customer_account_phone` varchar(255) DEFAULT NULL COMMENT '客户开户行电话',
  `customer_bank_number` varchar(255) DEFAULT NULL COMMENT '客户银行账号',
  `customer_registration_address` varchar(255) DEFAULT NULL COMMENT '客户注册地址',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-发票信息表';

-- ----------------------------
