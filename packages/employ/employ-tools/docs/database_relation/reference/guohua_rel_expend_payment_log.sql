-- Table structure for guohua_rel_expend_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_expend_payment_log`;
CREATE TABLE `guohua_rel_expend_payment_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_id` int(11) NOT NULL COMMENT '支出ID',
  `expend_sn` varchar(64) DEFAULT NULL COMMENT '支出单号',
  `payment_no` varchar(64) DEFAULT NULL COMMENT '业务参考号(=expend_sn)',
  `account_id` int(11) DEFAULT NULL COMMENT '付款账户ID',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '支付金额',
  `payee_name` varchar(128) DEFAULT NULL COMMENT '收款人户名',
  `payee_account` varchar(64) DEFAULT NULL COMMENT '收款人银行账号',
  `payee_bank` varchar(128) DEFAULT NULL COMMENT '收款人开户行',
  `status` varchar(20) DEFAULT 'pending' COMMENT '日志状态: pending/success/failed',
  `cmb_request` text DEFAULT NULL COMMENT '发送给CMB的请求JSON',
  `cmb_response` text DEFAULT NULL COMMENT 'CMB返回的响应JSON',
  `cmb_transaction_id` varchar(128) DEFAULT NULL COMMENT 'CMB交易号/reqNbr',
  `error_message` text DEFAULT NULL COMMENT '错误信息',
  `operator_id` varchar(64) DEFAULT NULL COMMENT '操作人userid',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1=有效',
  `create_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`log_id`),
  KEY `idx_expend_id` (`expend_id`),
  KEY `idx_status` (`status`),
  KEY `idx_payment_no` (`payment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COMMENT='支出招行支付日志';

-- ----------------------------
