-- Table structure for guohua_plan_customer_service_payroll
-- ----------------------------
DROP TABLE IF EXISTS `guohua_plan_customer_service_payroll`;
CREATE TABLE `guohua_plan_customer_service_payroll` (
  `payroll_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` varchar(32) DEFAULT NULL COMMENT '年份2025',
  `month` varchar(32) DEFAULT NULL COMMENT '月份2025-01',
  `area_id` int(11) DEFAULT NULL COMMENT '地区id',
  `area_name` varchar(32) DEFAULT NULL COMMENT '区域名称',
  `department_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `department_name` varchar(32) DEFAULT NULL COMMENT '部门名',
  `payroll_customer_target` int(11) DEFAULT NULL COMMENT '发薪目标客户数',
  `payroll_people_target` int(11) DEFAULT NULL COMMENT '发薪目标人数',
  `payroll_customer_complete` int(11) DEFAULT NULL COMMENT '已发薪客户数',
  `payroll_customer_undone` int(11) DEFAULT NULL COMMENT '未发薪客户数',
  `advance_payment_customer` int(11) DEFAULT NULL COMMENT '垫付客户数',
  `advance_payment_amount` decimal(11,2) DEFAULT NULL COMMENT '垫付金额',
  `advance_overdue_amount` decimal(11,2) DEFAULT NULL COMMENT '逾期欠款金额',
  `event_social_security` int(11) DEFAULT NULL COMMENT '社保类事件',
  `event_expend` int(11) DEFAULT NULL COMMENT '报销类事件',
  `event_other` int(11) DEFAULT NULL COMMENT '其他类事件',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`payroll_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COMMENT='派遣发薪表';

-- ----------------------------
