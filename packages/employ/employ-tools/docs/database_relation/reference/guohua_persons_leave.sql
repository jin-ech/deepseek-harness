-- Table structure for guohua_persons_leave
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_leave`;
CREATE TABLE `guohua_persons_leave` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `leave_no` varchar(32) NOT NULL COMMENT '请假单号 LV{yyyymmdd}{6位雪花后缀}',
  `special_event_in_id` varchar(36) NOT NULL COMMENT '关联运营事件ID',
  `persons_id` varchar(36) NOT NULL COMMENT '申请人ID',
  `persons_name` varchar(50) NOT NULL DEFAULT '' COMMENT '申请人姓名快照',
  `ins_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构ID快照',
  `store_id` varchar(36) NOT NULL DEFAULT '' COMMENT '基地ID快照',
  `leave_type` varchar(32) NOT NULL DEFAULT '' COMMENT '请假类型编码 sick/personal/other',
  `leave_type_name` varchar(32) NOT NULL DEFAULT '' COMMENT '请假类型名称快照',
  `start_date` date NOT NULL COMMENT '开始日期',
  `end_date` date NOT NULL COMMENT '结束日期',
  `leave_days` decimal(5,1) NOT NULL DEFAULT 0.0 COMMENT '有效请假天数',
  `reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '请假原因',
  `status` tinyint(4) NOT NULL DEFAULT 10 COMMENT '10待审批 20已通过 30已驳回 40已撤回 50已销假',
  `handler_userid` varchar(36) NOT NULL DEFAULT '' COMMENT '运营事件处理人',
  `cc_userid` varchar(500) NOT NULL DEFAULT '' COMMENT '抄送人逗号分隔',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approve_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '审批意见',
  `version` int(11) NOT NULL DEFAULT 1 COMMENT '乐观锁版本号',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 2删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_leave_no` (`leave_no`),
  UNIQUE KEY `uk_special_event` (`special_event_in_id`),
  KEY `idx_person_status` (`persons_id`,`status`),
  KEY `idx_person_date` (`persons_id`,`start_date`,`end_date`),
  KEY `idx_handler_status` (`handler_userid`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人请假申请主表';

-- ----------------------------
