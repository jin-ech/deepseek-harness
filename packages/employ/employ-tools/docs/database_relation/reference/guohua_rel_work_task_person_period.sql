-- Table structure for guohua_rel_work_task_person_period
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_work_task_person_period`;
CREATE TABLE `guohua_rel_work_task_person_period` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联 guohua_work_task.id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人ID，关联 persons.persons_id',
  `period_key` varchar(16) NOT NULL DEFAULT '' COMMENT '周期锚点：2026-06-15 / 2026-W25 / 2026-06 / once',
  `period_start` datetime DEFAULT NULL COMMENT '周期起（冗余，便于范围查询）',
  `period_end` datetime DEFAULT NULL COMMENT '周期止（冗余）',
  `phone_notice_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '本期电话催办次数',
  `last_notice_time` datetime DEFAULT NULL COMMENT '本期最近催办时间',
  `last_notice_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '本期最近催办操作人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '首次催办时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_task_person_period` (`task_id`,`persons_id`,`period_key`),
  KEY `idx_task_period` (`task_id`,`period_key`),
  KEY `idx_persons_id` (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='任务-人员-周期';

-- ----------------------------
