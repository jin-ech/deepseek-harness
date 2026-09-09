-- Table structure for cmb_alert_subscription
-- ----------------------------
DROP TABLE IF EXISTS `cmb_alert_subscription`;
CREATE TABLE `cmb_alert_subscription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(4) NOT NULL COMMENT 'P0/P1/P2',
  `category` varchar(16) NOT NULL COMMENT 'payment/salary/income/system',
  `channel` varchar(8) NOT NULL COMMENT 'app=应用消息@个人 / group=群webhook',
  `target` varchar(512) NOT NULL COMMENT 'app→企微userid / group→webhook URL',
  `enabled` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=启用 0=停用',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注（接收人姓名/群名）',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_lookup` (`level`,`category`,`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='企业微信告警订阅（连接器+后端共读）';

-- ----------------------------
