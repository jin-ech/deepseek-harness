-- Table structure for guohua_work_task_submit
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_submit`;
CREATE TABLE `guohua_work_task_submit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `task_id` int(10) unsigned NOT NULL COMMENT '任务ID，关联 guohua_work_task.id',
  `subtype_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '任务子类型ID（冗余），关联 guohua_work_task_subtype.id',
  `task_person_rel_id` int(10) unsigned NOT NULL COMMENT '人员分配记录ID，关联 guohua_rel_work_task_person.id',
  `period_key` varchar(16) NOT NULL DEFAULT 'once' COMMENT '周期锚点：日=2026-06-15 周=2026-W25 月=2026-06 一次性=once',
  `period_start` datetime DEFAULT NULL COMMENT '周期起',
  `period_end` datetime DEFAULT NULL COMMENT '周期止',
  `customer_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '所属子企业ID（冗余），关联 guohua_customer.customer_id',
  `store_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '所属基地ID（冗余），关联 guohua_store.store_id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人ID（冗余）',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人姓名（冗余）',
  `audit_status` tinyint(4) NOT NULL DEFAULT 10 COMMENT '审核状态 10:正常 20:拒绝/打回',
  `ai_audit_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'AI审核状态 0:未审核 10:通过 20:打回 30:分析异常',
  `ai_audit_time` datetime DEFAULT NULL COMMENT 'AI审核完成时间',
  `manual_audit_time` datetime DEFAULT NULL COMMENT '最近一次人工审核时间，NULL=从未人工复审',
  `manual_audit_cnt` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT '人工审核次数，>1 表示反复改判',
  `confidence` decimal(6,4) NOT NULL DEFAULT 0.0000 COMMENT '图片分析置信度',
  `analysis_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '图片分析状态 0:未分析/不适用 1:分析通过 2:未通过/异常',
  `image_analysis_content` text DEFAULT NULL COMMENT '图片分析内容',
  `reason` varchar(500) NOT NULL DEFAULT '' COMMENT '图片分析原因',
  `content_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提交成果表单实际内容，由 work_task.submit_schema_snapshot 驱动生成的键值对',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '提交/创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`),
  KEY `idx_task_person_rel_id` (`task_person_rel_id`),
  KEY `idx_persons_id` (`persons_id`),
  KEY `idx_task_customer_store` (`task_id`,`customer_id`,`store_id`,`is_delete`),
  KEY `idx_task_period` (`task_id`,`period_key`,`is_delete`),
  KEY `idx_task_period_person_audit` (`task_id`,`period_key`,`persons_id`,`audit_status`,`is_delete`),
  KEY `idx_task_audit` (`task_id`,`audit_status`,`is_delete`),
  KEY `idx_task_analysis` (`task_id`,`analysis_status`,`is_delete`),
  KEY `idx_task_ai_audit` (`task_id`,`ai_audit_status`,`audit_status`,`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务成果提交明细表';

-- ----------------------------
