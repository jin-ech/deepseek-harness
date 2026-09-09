-- Table structure for guohua_service
-- ----------------------------
DROP TABLE IF EXISTS `guohua_service`;
CREATE TABLE `guohua_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `service_name` varchar(255) NOT NULL DEFAULT '' COMMENT '服务名称',
  `project_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '项目ID',
  `customer_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `service_line_id` int(11) NOT NULL DEFAULT 0 COMMENT '业务线ID',
  `main_department_id` int(11) NOT NULL DEFAULT 0 COMMENT '所属部门ID',
  `product_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品类型ID',
  `service_type_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '服务类型ID',
  `business_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '业务类型ID',
  `subsidy_type_id` int(11) DEFAULT NULL COMMENT '补贴类型ID',
  `tax_rules_type_id` int(11) DEFAULT NULL COMMENT '报税规则ID',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '更新人微信ID',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `tmp_id` varchar(255) NOT NULL DEFAULT '' COMMENT '临时id',
  `contract_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '合同id',
  `demand_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '需求id',
  PRIMARY KEY (`service_id`) USING BTREE,
  KEY `_index_customer_id` (`customer_id`) USING BTREE,
  KEY `_index_demand_id` (`demand_id`) USING BTREE,
  KEY `idx_service_delete` (`is_delete`,`service_id`),
  KEY `idx_service_is_delete` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=20427 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-服务信息表';

-- ----------------------------
