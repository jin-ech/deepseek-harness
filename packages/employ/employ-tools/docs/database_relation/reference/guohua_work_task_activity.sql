-- Table structure for guohua_work_task_activity
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_activity`;
CREATE TABLE `guohua_work_task_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联 guohua_work_task.id',
  `action_type` varchar(32) NOT NULL DEFAULT '' COMMENT '动作类型 create/assign_store/assign_person/submit/finish/terminate 等',
  `operator_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '操作者类型 1:平台用户 2:残疾人 3:系统',
  `operator_id` varchar(64) NOT NULL DEFAULT '' COMMENT '操作者ID（userid 或 persons_id）',
  `operator_name` varchar(64) NOT NULL DEFAULT '' COMMENT '操作者姓名（冗余）',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '日志文案，如“吴敏 提交了任务成果”',
  `ref_type` varchar(32) NOT NULL DEFAULT '' COMMENT '关联业务类型 submit/person/store 等',
  `ref_id` varchar(64) NOT NULL DEFAULT '' COMMENT '关联业务ID（如 submit.id）',
  `extra_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '附加数据（如本次涉及条数等）',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '发生时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`,`add_time`),
  KEY `idx_action_type` (`action_type`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务活动日志表';

-- ----------------------------
