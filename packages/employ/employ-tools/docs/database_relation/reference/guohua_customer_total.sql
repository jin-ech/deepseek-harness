-- Table structure for guohua_customer_total
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_total`;
CREATE TABLE `guohua_customer_total` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `customer_name` varchar(64) NOT NULL DEFAULT '' COMMENT '客户名',
  `total_contract` int(11) DEFAULT 0 COMMENT '合同数',
  `total_price` decimal(10,2) unsigned DEFAULT NULL COMMENT '应收金额',
  `bill_amount` decimal(10,2) DEFAULT NULL COMMENT '总开票',
  `bill_no_amount` decimal(10,2) DEFAULT NULL COMMENT '开票未回款',
  `bill_amount_month` decimal(10,2) DEFAULT NULL COMMENT '月度开票',
  `total_confirm_amount` decimal(10,2) DEFAULT NULL COMMENT '累计结算金额',
  `month_total_confirm_amount` decimal(10,2) DEFAULT NULL COMMENT '月度结算金额',
  `total_noconfirm_amount` decimal(10,2) DEFAULT NULL COMMENT '未结算金额',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18877 DEFAULT CHARSET=utf8mb4 COMMENT='客户数据统计表';

-- ----------------------------
