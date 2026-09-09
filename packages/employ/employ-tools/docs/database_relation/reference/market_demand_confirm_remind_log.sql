-- Table structure for market_demand_confirm_remind_log
-- ----------------------------
DROP TABLE IF EXISTS `market_demand_confirm_remind_log`;
CREATE TABLE `market_demand_confirm_remind_log` (
  `log_id` bigint(20) NOT NULL COMMENT '日志主键（应用层 get_unique_num_id）',
  `demand_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联需求 id（guohua_demand.demand_id）',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户 id',
  `demand_sn` varchar(64) NOT NULL DEFAULT '' COMMENT '需求编号（冗余）',
  `service_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '接收消息的客服 userid',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '推送时的公众号 openid',
  `template_id` varchar(128) NOT NULL DEFAULT '' COMMENT '公众号模板 id',
  `send_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1成功 0失败',
  `errcode` int(11) NOT NULL DEFAULT 0 COMMENT '微信返回 errcode',
  `errmsg` varchar(512) NOT NULL DEFAULT '' COMMENT '错误信息/跳过原因',
  `payload` text DEFAULT NULL COMMENT '推送 payload JSON',
  `response` text DEFAULT NULL COMMENT '微信接口返回原文',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `idx_demand_id` (`demand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='需求确认客服推送日志表';

-- ----------------------------
