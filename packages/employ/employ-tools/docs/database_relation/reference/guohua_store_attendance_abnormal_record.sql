-- Table structure for guohua_store_attendance_abnormal_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_attendance_abnormal_record`;
CREATE TABLE `guohua_store_attendance_abnormal_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地ID',
  `stat_month` char(7) NOT NULL DEFAULT '' COMMENT '统计月份 YYYY-MM',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人ID',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人姓名快照',
  `abnormal_count` int(11) NOT NULL DEFAULT 0 COMMENT '月度异常工作日数',
  `continuous_abnormal_days` int(11) NOT NULL DEFAULT 0 COMMENT '最长连续异常工作日数',
  `is_risk` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否风险人员 0否 1是',
  `abnormal_types` varchar(255) NOT NULL DEFAULT '' COMMENT '异常类型，逗号分隔：no_checkin,out_of_range,frequent_abnormal,continuous_abnormal',
  `latest_abnormal_date` date DEFAULT NULL COMMENT '最近异常日期',
  `out_of_range` int(11) NOT NULL DEFAULT 500 COMMENT '超出打卡范围阈值，单位米',
  `follow_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '跟进状态 1待跟进 2已跟进 3已升级风险 4已处理',
  `abnormal_reason` varchar(32) NOT NULL DEFAULT '' COMMENT '异常原因 sick生病 out外出 uncooperative不配合 other其他',
  `communication_method` varchar(32) NOT NULL DEFAULT '' COMMENT '沟通方式 phone电话 wechat微信 onsite现场 other其他',
  `communication_target` varchar(32) NOT NULL DEFAULT '' COMMENT '沟通人 self本人 family家属',
  `follow_content` text DEFAULT NULL COMMENT '最近跟进内容',
  `operation_handler_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '就业运营沟通人userid',
  `operation_handle_content` text DEFAULT NULL COMMENT '就业运营处理意见',
  `latest_follow_time` datetime DEFAULT NULL COMMENT '最近跟进时间',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人userid',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_month_person` (`store_id`,`stat_month`,`persons_id`,`is_delete`),
  KEY `idx_store_month_risk` (`store_id`,`stat_month`,`is_risk`,`is_delete`),
  KEY `idx_persons_month` (`persons_id`,`stat_month`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='基地考勤异常人员月度记录表';

-- ----------------------------
