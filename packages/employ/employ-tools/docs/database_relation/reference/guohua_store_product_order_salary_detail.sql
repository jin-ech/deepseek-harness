-- Table structure for guohua_store_product_order_salary_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_salary_detail`;
CREATE TABLE `guohua_store_product_order_salary_detail` (
  `product_order_salary_detail_id` varchar(64) NOT NULL COMMENT '劳动产品账单id',
  `product_order_salary_id` varchar(64) DEFAULT NULL COMMENT '劳动产品账单id',
  `product_order_detail_id` varchar(64) DEFAULT NULL COMMENT '劳动产品订单明细id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `id_number` varchar(64) DEFAULT NULL COMMENT '身份证号',
  `produce_num` int(11) DEFAULT NULL COMMENT '生产数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '劳动产品劳务费单价 单位元',
  `other_price` decimal(10,2) DEFAULT NULL COMMENT '其他扣款',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `account_bank` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_number` varchar(64) DEFAULT NULL COMMENT '银行卡账号',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1：未删除 0 已删除',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  `is_expend` int(11) DEFAULT 0 COMMENT '劳动产品财务支出 1 已发 0未发',
  PRIMARY KEY (`product_order_salary_detail_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地劳动产品交付账单明细表';

-- ----------------------------
