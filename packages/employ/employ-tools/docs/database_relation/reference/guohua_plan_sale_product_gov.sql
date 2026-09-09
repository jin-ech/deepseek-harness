-- Table structure for guohua_plan_sale_product_gov
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_sale_product_gov`;
CREATE TABLE `guohua_plan_sale_product_gov` (
  `product_gov_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '政务产品id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` varchar(32) DEFAULT NULL COMMENT '区域id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名',
  `department_id` varchar(32) DEFAULT '' COMMENT '部门',
  `department_name` varchar(64) DEFAULT '' COMMENT '部门',
  `cost_type_name` varchar(64) DEFAULT '' COMMENT '产品类别',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `project_name` varchar(64) DEFAULT NULL COMMENT '项目名',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `customer_name` varchar(64) DEFAULT NULL COMMENT '客户名称',
  `expect_purchase_amount` decimal(10,2) DEFAULT 0.00 COMMENT '预计采购金额',
  `dev_status` varchar(64) DEFAULT NULL COMMENT '开发进度',
  `progress_status` varchar(64) DEFAULT NULL COMMENT '进展情况',
  `sign_status` varchar(64) DEFAULT NULL COMMENT '签约状态',
  `sign_amount` decimal(10,2) DEFAULT 0.00 COMMENT '签约金额',
  `confirm_amount` decimal(10,2) DEFAULT 0.00 COMMENT '到账金额',
  `already_confirm_amount` decimal(10,2) DEFAULT 0.00 COMMENT '已到账金额',
  `should_amount` decimal(10,2) DEFAULT 0.00 COMMENT '应收金额',
  `wait_should_amount` decimal(10,2) DEFAULT 0.00 COMMENT '待收金额',
  PRIMARY KEY (`product_gov_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COMMENT='政务产品销售表';

-- ----------------------------
