-- Table structure for market_invite_scan_log
-- ----------------------------
DROP TABLE IF EXISTS `market_invite_scan_log`;
CREATE TABLE `market_invite_scan_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invite_code` varchar(32) NOT NULL DEFAULT '' COMMENT '被扫描的邀请码',
  `scanner_openid` varchar(64) NOT NULL DEFAULT '' COMMENT '扫码人小程序openid',
  `scan_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '扫码时间',
  PRIMARY KEY (`id`),
  KEY `idx_scan_log_invite_code` (`invite_code`),
  KEY `idx_scan_log_openid` (`scanner_openid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序邀请码扫码日志表';

-- ----------------------------
