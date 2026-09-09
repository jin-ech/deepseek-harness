-- Table structure for fx_contract_persons_per_month
-- ----------------------------
DROP TABLE IF EXISTS `fx_contract_persons_per_month`;
CREATE TABLE `fx_contract_persons_per_month` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `fx_contract_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '纷享销客合同ID',
  `contract_id` bigint(20) unsigned NOT NULL COMMENT '合同ID',
  `dispatch_date` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '派遣日期，格式：yyyy-mm',
  `actual_weight_num` int(10) unsigned DEFAULT 0 COMMENT '实际人数-重残',
  `actual_light_num` int(10) unsigned DEFAULT 0 COMMENT '实际人数-轻残',
  `contract_weight_num` int(10) unsigned DEFAULT 0 COMMENT '合同人数-重残',
  `contract_light_num` int(10) unsigned DEFAULT 0 COMMENT '合同人数-轻残',
  `actual_weight_unit_price` decimal(10,2) DEFAULT 0.00 COMMENT '实际单价-重残',
  `actual_light_unit_price` decimal(10,2) DEFAULT 0.00 COMMENT '实际单价-轻残',
  `contract_weight_unit_price` decimal(10,2) DEFAULT 0.00 COMMENT '合同单价-重残',
  `contract_light_unit_price` decimal(10,2) DEFAULT 0.00 COMMENT '合同单价-轻残',
  `actual_dp_service_unit_price` decimal(10,2) DEFAULT 0.00 COMMENT '实际派遣服务单价',
  `contract_dp_service_unit_price` decimal(10,2) DEFAULT 0.00 COMMENT '合同派遣服务单价',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '是否删除：1-未删除，0-已删除',
  `created_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建人',
  `last_modified_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '最后修改时间',
  `last_modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '最后修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_contract_date` (`contract_id`,`dispatch_date`,`is_delete`),
  KEY `idx_dispatch_date` (`dispatch_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='合同月度人数表';

-- ----------------------------
