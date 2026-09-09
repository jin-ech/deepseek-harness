-- Table structure for guohua_customer_salary_detail
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_salary_detail`;
CREATE TABLE `guohua_customer_salary_detail` (
  `salary_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `salary_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '薪资管理id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `salary_month` date DEFAULT NULL COMMENT '统计月份',
  `persons_id` varchar(36) NOT NULL DEFAULT '' COMMENT '人员id',
  `company_salary` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '基本工资',
  `net_salary` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '实发工资',
  `real_money` decimal(10,2) DEFAULT NULL COMMENT '实得工资',
  `company_social_insurance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业社保',
  `persons_social_insurance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个人社保',
  `company_housing` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业公积金',
  `persons_housing` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个人公积金',
  `persons_housing_base` decimal(10,2) DEFAULT 0.00 COMMENT '个人公积金缴费基数',
  `service_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '服务费',
  `dispatch_service_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '派遣服务费',
  `other_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '其他费用',
  `other_performance` decimal(10,2) DEFAULT 0.00 COMMENT '其他绩效（客户特殊要求时手动输入）',
  `performance_salary` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '绩效工资（1.2时使用，基本薪资*0.2）',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未删除 0：已删除',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `other_discrepancy` decimal(10,2) DEFAULT NULL COMMENT '其他差额（补社保差额）',
  `five_social_fund` decimal(10,2) DEFAULT NULL COMMENT '五险一金补扣',
  `total` decimal(10,2) DEFAULT NULL COMMENT '收费总额',
  `is_flag` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1可用 0不可用',
  `product_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '劳动产品金额',
  `fusion_activity_fees` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '融合活动费用',
  PRIMARY KEY (`salary_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120066 DEFAULT CHARSET=utf8mb4 COMMENT='客户薪资明细表';

-- ----------------------------
