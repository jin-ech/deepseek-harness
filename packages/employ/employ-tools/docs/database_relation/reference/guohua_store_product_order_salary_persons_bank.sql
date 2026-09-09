-- Table structure for guohua_store_product_order_salary_persons_bank
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order_salary_persons_bank`;
CREATE TABLE `guohua_store_product_order_salary_persons_bank` (
  `persons_bank_id` varchar(64) NOT NULL COMMENT '残疾人银行卡id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '残疾人id',
  `bank_id` int(11) DEFAULT NULL COMMENT '银行id',
  `account_bank` varchar(255) DEFAULT NULL COMMENT '开户行',
  `bank_number` varchar(64) DEFAULT NULL COMMENT '银行卡账号',
  `is_bank` varchar(64) DEFAULT NULL COMMENT '是否是工资卡  1是 0 否',
  `remarks` varchar(64) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_make_up` varchar(64) DEFAULT '0' COMMENT '是否为补办卡 1是 0否',
  PRIMARY KEY (`persons_bank_id`) USING BTREE,
  KEY `index_persons_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地劳动产品人员银行卡信息表';

-- ----------------------------
