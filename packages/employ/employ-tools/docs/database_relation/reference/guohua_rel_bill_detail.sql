-- Table structure for guohua_rel_bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_bill_detail`;
CREATE TABLE `guohua_rel_bill_detail` (
  `bill_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL DEFAULT 0 COMMENT '账单发票id',
  `bill_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发票类型：0:增值税普通发票；1:增值税专用发票',
  `bill_content_id` int(11) NOT NULL DEFAULT 0 COMMENT '费用类别id',
  `bill_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '开票金额',
  `is_cp_amount` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否含代收代付 1含 0 不含',
  `sb_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '社保费用',
  `gjx_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '公积金费用',
  `gz_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '工资费用',
  `fw_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '服务费用',
  `bill_remarks` varchar(1000) NOT NULL DEFAULT '' COMMENT '发票备注栏内容',
  `invoice_status` tinyint(4) DEFAULT 1 COMMENT '发票状态 1正常 0作废',
  `account_id` int(11) NOT NULL DEFAULT 0 COMMENT '开票主体；base_dict_account.account_id，0表示沿用单据级主体',
  PRIMARY KEY (`bill_detail_id`) USING BTREE,
  KEY `_index_bill_id` (`bill_id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23822 DEFAULT CHARSET=utf8mb4 COMMENT='账单开票关联明细表';

-- ----------------------------
