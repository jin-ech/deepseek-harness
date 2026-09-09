-- Table structure for fx_crm_rel_mapping
-- ----------------------------
DROP TABLE IF EXISTS `fx_crm_rel_mapping`;
CREATE TABLE `fx_crm_rel_mapping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `table_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关联的业务表名',
  `fx_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '外部系统ID (纷享销客)',
  `guohua_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '内部系统ID (例如国画ID)',
  `extra_args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '额外参数，以JSON格式存储',
  `extra_args_version` int(11) NOT NULL DEFAULT 1 COMMENT '额外参数的版本号',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除，1-未删除，0-已删除',
  `guohua_id_int` bigint(20) GENERATED ALWAYS AS (case when `guohua_id` regexp '^[0-9]+$' then cast(`guohua_id` as unsigned) else NULL end) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fx_crm_rel_mapping` (`table_key`,`fx_id`,`is_delete`),
  KEY `idx_table_key_guohua_id` (`table_key`,`guohua_id`),
  KEY `idx_table_key_fx_id` (`table_key`,`fx_id`),
  KEY `idx_table_key_guohua_id_int` (`table_key`,`guohua_id_int`,`is_delete`),
  KEY `idx_fx_id` (`fx_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CRM关系映射表';

-- ----------------------------
