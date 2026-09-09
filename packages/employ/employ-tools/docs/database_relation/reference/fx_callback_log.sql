-- Table structure for fx_callback_log
-- ----------------------------
DROP TABLE IF EXISTS `fx_callback_log`;
CREATE TABLE `fx_callback_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `signature` varchar(255) NOT NULL COMMENT '签名',
  `timestamp` varchar(50) NOT NULL COMMENT '时间戳',
  `nonce` varchar(100) NOT NULL COMMENT '随机数序列',
  `message_id` varchar(100) NOT NULL COMMENT '消息ID（用于幂等）',
  `retry_times` int(11) DEFAULT 0 COMMENT '重试次数',
  `enterprise_account` varchar(100) DEFAULT NULL COMMENT '企业账号',
  `encrypted_content` text DEFAULT NULL COMMENT '加密内容（原始数据）',
  `api_name` varchar(100) DEFAULT NULL COMMENT '回调接口名称（解密后）',
  `event_type` varchar(50) DEFAULT NULL COMMENT '事件类型（解密后）',
  `data_id` varchar(32) DEFAULT NULL COMMENT '业务数据ID（解密后）',
  `decrypted_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '完整解密后的内容',
  `status` tinyint(4) DEFAULT 0 COMMENT '处理状态：0-未处理，1-已处理，2-处理失败',
  `fail_reason` text DEFAULT NULL COMMENT '失败原因（仅在status=2时有效）',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_message_id` (`message_id`),
  KEY `idx_status` (`status`),
  KEY `idx_api_name` (`api_name`),
  KEY `idx_data_id` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=561399 DEFAULT CHARSET=utf8mb4 COMMENT='纷享销客回调日志表';

-- ----------------------------
