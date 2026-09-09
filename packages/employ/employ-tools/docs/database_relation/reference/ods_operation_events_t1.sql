-- Table structure for ods_operation_events_t1
-- ----------------------------
DROP TABLE IF EXISTS `ods_operation_events_t1`;
CREATE TABLE `ods_operation_events_t1` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一主键ID',
  `event_time` datetime NOT NULL COMMENT '事件发生时间',
  `event_date` date NOT NULL COMMENT '事件发生日期 (用于分区和索引)',
  `event_id` varchar(50) NOT NULL COMMENT '事件ID',
  `event_name` varchar(100) DEFAULT NULL COMMENT '事件中文描述',
  `app_id` varchar(50) DEFAULT NULL COMMENT '产品类型, 馨益通、CRM、助益行',
  `persons_id` varchar(255) DEFAULT NULL COMMENT '残疾人ID',
  `customer_id` bigint(20) unsigned DEFAULT NULL COMMENT '客户ID',
  `contract_id` bigint(20) unsigned DEFAULT NULL COMMENT '合同ID',
  `operator_id` varchar(255) DEFAULT NULL COMMENT '操作员/客服ID',
  `persons_name` varchar(100) DEFAULT NULL COMMENT '冗余-残疾人姓名',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '冗余-客户公司名称',
  `operator_name` varchar(100) DEFAULT NULL COMMENT '冗余-操作员姓名',
  `event_value` decimal(18,4) DEFAULT NULL COMMENT '事件相关数值, 如: 金额',
  `event_count` int(11) DEFAULT 1 COMMENT '事件计数值, 默认为1',
  `event_details_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '存储事件的个性化详细信息',
  `sync_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '数据同步时间',
  PRIMARY KEY (`id`),
  KEY `idx_event_date` (`event_date`),
  KEY `idx_event_id` (`event_id`),
  KEY `idx_persons_id` (`persons_id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_operator_id` (`operator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4277038 DEFAULT CHARSET=utf8mb4 COMMENT='运营活动T-1宽表';

-- ----------------------------
