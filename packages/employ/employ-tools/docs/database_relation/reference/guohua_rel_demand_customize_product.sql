-- Table structure for guohua_rel_demand_customize_product
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_demand_customize_product`;
CREATE TABLE `guohua_rel_demand_customize_product` (
  `customize_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '定制id',
  `demand_id` bigint(20) DEFAULT NULL COMMENT '需求ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `product_budget` decimal(10,2) DEFAULT NULL COMMENT '劳动产品预算/月均/人',
  `product_amount` decimal(10,2) DEFAULT NULL COMMENT '劳动产品金额',
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '费用承担方1企业现结算 2服务费结算',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`customize_id`) USING BTREE,
  KEY `_index_demand_id` (`demand_id`) USING BTREE,
  KEY `_index_demand_job_id` (`customize_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-需求定制劳动产品记录表';

-- ----------------------------
