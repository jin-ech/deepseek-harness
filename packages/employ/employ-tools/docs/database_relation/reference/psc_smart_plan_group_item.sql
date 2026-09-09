-- Table structure for psc_smart_plan_group_item
-- ----------------------------
DROP TABLE IF EXISTS `psc_smart_plan_group_item`;
CREATE TABLE `psc_smart_plan_group_item` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  `group_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '集团方案记录ID(psc_smart_plan_group_record.group_id)',
  `group_no` varchar(64) NOT NULL DEFAULT '' COMMENT '集团方案编号',
  `seq` int(11) NOT NULL DEFAULT 0 COMMENT '区域序号(从1开始)',
  `sub_company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '分子公司名称',
  `region_code` varchar(16) NOT NULL DEFAULT '' COMMENT '用工地区编码',
  `region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用工所在地',
  `product_code` varchar(64) NOT NULL DEFAULT '' COMMENT '推荐产品编码',
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐产品名称',
  `store_ids` varchar(500) NOT NULL DEFAULT '' COMMENT '匹配基地ID，逗号分隔',
  `store_names` varchar(1000) NOT NULL DEFAULT '' COMMENT '匹配基地名称',
  `employee_count` int(11) NOT NULL DEFAULT 0 COMMENT '在职职工人数',
  `existing_light_count` int(11) NOT NULL DEFAULT 0 COMMENT '自有轻残人数',
  `existing_heavy_count` int(11) NOT NULL DEFAULT 0 COMMENT '自有重残人数',
  `plan_light_count` int(11) NOT NULL DEFAULT 0 COMMENT '方案轻残人数',
  `plan_heavy_count` int(11) NOT NULL DEFAULT 0 COMMENT '方案重残人数',
  `baseline_deposit` decimal(14,2) NOT NULL DEFAULT 0.00 COMMENT '基准残保金',
  `diff_deposit` decimal(14,2) NOT NULL DEFAULT 0.00 COMMENT '差额残保金',
  `total_cost` decimal(14,2) NOT NULL DEFAULT 0.00 COMMENT '支出总计',
  `saving` decimal(14,2) NOT NULL DEFAULT 0.00 COMMENT '全年节约成本',
  `saving_rate` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '节约率',
  `plan_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1成功 2失败',
  `fail_reason` varchar(1000) NOT NULL DEFAULT '' COMMENT '该区域失败原因',
  `metrics_json` mediumtext DEFAULT NULL COMMENT '该区域指标数据JSON',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`item_id`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_group_no` (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='PSC集团智能方案逐区域(分子公司)明细表';

-- ----------------------------
