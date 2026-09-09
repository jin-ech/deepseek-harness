-- Table structure for work_disability_homeland_callback_log
-- ----------------------------
DROP TABLE IF EXISTS `work_disability_homeland_callback_log`;
CREATE TABLE `work_disability_homeland_callback_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `evaluation_record_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'work_evaluation_record.id',
  `disabled_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'work_evaluate_disabled.id',
  `callback_url` varchar(512) NOT NULL DEFAULT '' COMMENT '请求完整URL',
  `request_body` longtext DEFAULT NULL COMMENT '请求JSON',
  `http_status` int(11) DEFAULT NULL COMMENT 'HTTP状态码',
  `response_body` longtext DEFAULT NULL COMMENT '响应体文本',
  `error_message` varchar(2000) DEFAULT NULL COMMENT '异常信息（网络/超时等）',
  `duration_ms` int(11) DEFAULT NULL COMMENT '耗时毫秒',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_disabled_id` (`disabled_id`),
  KEY `idx_add_time` (`add_time`),
  KEY `idx_evaluation_record_id` (`evaluation_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人测评报告生成后回调家园系统接口日志';

-- ----------------------------
