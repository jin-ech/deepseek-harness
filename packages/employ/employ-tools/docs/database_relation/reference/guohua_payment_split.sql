-- Table structure for guohua_payment_split
-- ----------------------------
DROP TABLE IF EXISTS `guohua_payment_split`;
CREATE TABLE `guohua_payment_split` (
  `split_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL COMMENT '未确认到款ID',
  `payment_confirm_id` int(11) NOT NULL COMMENT '关联的确认到款记录ID',
  `parent_confirm_id` int(11) NOT NULL DEFAULT 0 COMMENT '被拆分的源 confirm ID',
  `company_name` varchar(255) DEFAULT '' COMMENT '拆分目标公司名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `confirm_amount` decimal(10,2) DEFAULT 0.00 COMMENT '拆分金额',
  `confirm_cp_amount` decimal(10,2) DEFAULT 0.00 COMMENT '代收代付金额',
  `confirm_product_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '劳动产品金额',
  `confirm_fusion_activity_fees` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '融合活动费用',
  `service_charge` decimal(10,2) DEFAULT 0.00 COMMENT '服务费',
  `department_id` varchar(50) DEFAULT '' COMMENT '归属部门ID',
  `main_department_id` int(11) DEFAULT NULL COMMENT '归属主部门ID',
  `assign_userid` varchar(50) DEFAULT '' COMMENT '归属人员userid',
  `service_line_id` int(11) DEFAULT NULL COMMENT '业务线ID',
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `project_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `remarks` varchar(500) DEFAULT '' COMMENT '备注',
  `add_userid` varchar(50) DEFAULT '' COMMENT '操作人userid',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '1有效 0删除',
  PRIMARY KEY (`split_id`),
  KEY `idx_payment_id` (`payment_id`),
  KEY `idx_payment_confirm_id` (`payment_confirm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='到款拆分记录表';

-- ----------------------------
