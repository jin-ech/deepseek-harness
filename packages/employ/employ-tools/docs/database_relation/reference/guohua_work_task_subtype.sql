-- Table structure for guohua_work_task_subtype
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_subtype`;
CREATE TABLE `guohua_work_task_subtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `type_id` int(10) unsigned NOT NULL COMMENT '一级类型ID，关联 guohua_work_task_type.id',
  `subtype_code` varchar(32) NOT NULL DEFAULT '' COMMENT '子类型编码，如 public_opinion/daily_checkin',
  `subtype_name` varchar(64) NOT NULL DEFAULT '' COMMENT '子类型名称，如 舆情收集',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '子类型描述，如 多平台舆情信息收集与上报',
  `disable_frequency_types` varchar(32) NOT NULL DEFAULT '' COMMENT '前端禁用周期类型，逗号分隔，如 1,2；1一次性 2日 3周 4月',
  `is_unlimited_store_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否不限基地类型 0:继承一级类型store_types 1:不限基地类型',
  `config_schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '管理端创建/分配任务配置表单当前结构，驱动 config_json',
  `submit_schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '执行人提交成果表单当前结构，驱动 submit.content_json',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标URL（可选）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序，越小越靠前',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1:启用 2:停用',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人 userid',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人 userid',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_type_id` (`type_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务子类型表（表单模板挂载层）';

-- ----------------------------
