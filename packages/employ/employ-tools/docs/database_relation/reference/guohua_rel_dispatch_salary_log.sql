-- Table structure for guohua_rel_dispatch_salary_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_dispatch_salary_log`;
CREATE TABLE `guohua_rel_dispatch_salary_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `dispatch_wages_id` varchar(64) NOT NULL COMMENT '工资发放ID',
  `dispatch_wages_sn` varchar(64) NOT NULL COMMENT '工资发放单号',
  `batch_no` varchar(64) DEFAULT NULL COMMENT 'CMB批次号',
  `account_id` int(11) DEFAULT NULL COMMENT '付款账户ID',
  `total_amount` decimal(12,2) DEFAULT NULL COMMENT '代发总金额',
  `total_people` int(11) DEFAULT NULL COMMENT '代发总人数',
  `status` varchar(20) DEFAULT 'pending' COMMENT 'pending/success/failed',
  `cmb_request` text DEFAULT NULL COMMENT '发送给CMB的请求JSON',
  `cmb_response` text DEFAULT NULL COMMENT 'CMB返回的响应JSON',
  `cmb_batch_status` varchar(30) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  `operator_id` varchar(64) DEFAULT NULL,
  `is_delete` tinyint(4) DEFAULT 1,
  `create_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`log_id`),
  KEY `idx_dispatch_wages_id` (`dispatch_wages_id`),
  KEY `idx_status` (`status`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='代发工资支付日志';

-- ----------------------------
