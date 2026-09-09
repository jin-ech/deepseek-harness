-- Table structure for market_fx_leads_log
-- ----------------------------
DROP TABLE IF EXISTS `market_fx_leads_log`;
CREATE TABLE `market_fx_leads_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联 market_users.market_user_id',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `tel` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `company` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `source` int(11) NOT NULL DEFAULT 11 COMMENT '线索来源(营销小程序固定11)',
  `sign` varchar(64) NOT NULL DEFAULT '' COMMENT '请求签名',
  `req_payload` text DEFAULT NULL COMMENT '完整请求 JSON',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '调用结果 1成功 0失败',
  `clue_data_id` varchar(64) NOT NULL DEFAULT '' COMMENT '成功返回的纷享线索ID(dataId)',
  `resp_code` int(11) DEFAULT NULL COMMENT '外层返回 code',
  `resp_message` varchar(255) NOT NULL DEFAULT '' COMMENT '外层返回 message',
  `resp_body` text DEFAULT NULL COMMENT '完整返回 JSON',
  `err_msg` varchar(500) NOT NULL DEFAULT '' COMMENT '失败原因(本地异常/校验失败)',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '调用时间',
  PRIMARY KEY (`id`),
  KEY `idx_fx_leads_user` (`market_user_id`),
  KEY `idx_fx_leads_tel` (`tel`),
  KEY `idx_fx_leads_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='纷享销客新增线索调用记录表';

-- ----------------------------
