-- Table structure for guohua_employment_risk_warning
-- ----------------------------
DROP TABLE IF EXISTS `guohua_employment_risk_warning`;
CREATE TABLE `guohua_employment_risk_warning` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warning_id` varchar(36) NOT NULL DEFAULT '' COMMENT '预警ID',
  `warning_type` varchar(64) NOT NULL DEFAULT '' COMMENT '预警类型',
  `warning_sub_type` varchar(64) NOT NULL DEFAULT '' COMMENT '预警子类型',
  `region_id` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地ID',
  `store_name` varchar(255) NOT NULL DEFAULT '' COMMENT '基地名称',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '人员姓名',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `warning_level` tinyint(4) NOT NULL DEFAULT 2 COMMENT '风险等级 1低 2中 3高',
  `warning_title` varchar(255) NOT NULL DEFAULT '' COMMENT '预警标题',
  `warning_content` text DEFAULT NULL COMMENT '预警说明',
  `trigger_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '触发时间',
  `source_table` varchar(64) NOT NULL DEFAULT '' COMMENT '来源表',
  `source_id` varchar(64) NOT NULL DEFAULT '' COMMENT '来源记录ID',
  `source_extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '来源补充信息',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '处理状态 0待处理 1处理中 2已处理 3已忽略',
  `handle_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '处理人',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `handle_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '处理说明',
  `dedupe_key` varchar(255) NOT NULL DEFAULT '' COMMENT '预警去重Key',
  `is_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否当前有效 1是 0否',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_warning_id` (`warning_id`),
  UNIQUE KEY `uk_dedupe_active` (`dedupe_key`,`is_active`),
  KEY `idx_region_status` (`region_id`,`status`),
  KEY `idx_store_status` (`store_id`,`status`),
  KEY `idx_type_trigger` (`warning_type`,`trigger_time`),
  KEY `idx_persons` (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='就业风险预警明细表';

-- ----------------------------
