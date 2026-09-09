-- Table structure for guohua_emp_product_distfix_bak_20260624
-- ----------------------------
DROP TABLE IF EXISTS `guohua_emp_product_distfix_bak_20260624`;
CREATE TABLE `guohua_emp_product_distfix_bak_20260624` (
  `product_id` bigint(20) NOT NULL COMMENT '产品ID（应用层 get_unique_num_id 生成）',
  `cust_district_code` varchar(255) NOT NULL DEFAULT '0' COMMENT '客户区域-区 国标码，全市通用=0，多个逗号分隔（如顺义、昌平：110113,110114）',
  `cust_apply_scope` varchar(255) NOT NULL DEFAULT '' COMMENT '客户区域-适用范围文字描述（如：全市通用（不含苏州产业园区））'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
