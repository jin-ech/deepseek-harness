-- Table structure for guohua_rel_work_task_person
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_work_task_person`;
CREATE TABLE `guohua_rel_work_task_person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联 guohua_work_task.id',
  `target_rel_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '来源分发目标ID，关联 guohua_rel_work_task_target.id（该人由哪个企业/基地目标展开而来）',
  `period_key` varchar(16) NOT NULL DEFAULT 'once' COMMENT '周期锚点：2026-06-15 / W:2026-06-15 / M:2026-06-15 / once',
  `group_customer_id` int(10) unsigned DEFAULT NULL COMMENT '所属集团客户ID（冗余，便于按集团归组），关联 guohua_customer.customer_id，无集团时为NULL',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '所属子企业ID（冗余，便于按企业归组），关联 guohua_customer.customer_id',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属基地ID，关联 guohua_store.store_id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人ID，关联 persons.persons_id',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人姓名（冗余）',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '分配人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `exclude_reason` varchar(32) NOT NULL DEFAULT '' COMMENT '系统剔除原因，manual_schedule_overlap:与手动排班任务冲突',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`),
  KEY `idx_target_rel_id` (`target_rel_id`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_persons_id` (`persons_id`),
  KEY `idx_task_person` (`task_id`,`persons_id`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=7139 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务-人员分配关联表（含人员进度）';

-- ----------------------------
