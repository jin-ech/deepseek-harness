-- Table structure for guohua_store_attendance_abnormal_follow
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_attendance_abnormal_follow`;
CREATE TABLE `guohua_store_attendance_abnormal_follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `record_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '异常月度记录ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地ID',
  `stat_month` char(7) NOT NULL DEFAULT '' COMMENT '统计月份 YYYY-MM',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人ID',
  `abnormal_reason` varchar(32) NOT NULL DEFAULT '' COMMENT '异常原因',
  `communication_method` varchar(32) NOT NULL DEFAULT '' COMMENT '沟通方式',
  `communication_target` varchar(32) NOT NULL DEFAULT '' COMMENT '沟通人 self本人 family家属',
  `follow_content` text DEFAULT NULL COMMENT '跟进内容',
  `operation_handler_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '就业运营沟通人userid',
  `operation_handle_content` text DEFAULT NULL COMMENT '就业运营处理意见',
  `follow_status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '跟进状态 1待跟进 2已跟进 3已升级风险 4已处理',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_record_id` (`record_id`,`is_delete`),
  KEY `idx_store_month_persons` (`store_id`,`stat_month`,`persons_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='基地考勤异常跟进明细表';

-- ----------------------------
