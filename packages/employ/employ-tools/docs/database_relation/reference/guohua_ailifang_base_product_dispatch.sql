-- Table structure for guohua_ailifang_base_product_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ailifang_base_product_dispatch`;
CREATE TABLE `guohua_ailifang_base_product_dispatch` (
  `dispatch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '爱立方基地产品分配统计主键',
  `stat_month` char(7) NOT NULL COMMENT '统计月份YYYY-MM',
  `rank_no` int(11) NOT NULL DEFAULT 0 COMMENT '展示排名',
  `base_name` varchar(255) NOT NULL DEFAULT '' COMMENT '基地名称快照',
  `base_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '基地类型：1正式基地 2合作职康劳动基地',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '正式基地guohua_store.store_id',
  `cooperative_base_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '合作基地cooperative_rehab_labor_base主键',
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分配产品名称',
  `assigned_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '分配件数',
  `source_tag` varchar(128) NOT NULL DEFAULT '' COMMENT '数据来源标识',
  `source_hash` char(64) NOT NULL COMMENT '来源数据SHA-256，保证幂等',
  `remarks` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1启用 0停用',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`dispatch_id`),
  UNIQUE KEY `uk_ailifang_base_dispatch_source_hash` (`source_hash`),
  KEY `idx_ailifang_base_dispatch_month_rank` (`stat_month`,`rank_no`),
  KEY `idx_ailifang_base_dispatch_store` (`base_type`,`store_id`,`cooperative_base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='爱立方基地产品分配统计表';

-- ----------------------------
