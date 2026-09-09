-- Table structure for guohua_payment
-- ----------------------------
DROP TABLE IF EXISTS `guohua_payment`;
CREATE TABLE `guohua_payment` (
  `payment_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `receivable_amont` int(11) DEFAULT NULL,
  `open_amount` int(11) DEFAULT NULL,
  `payment_amount` double DEFAULT NULL,
  `confirm_amount` double DEFAULT NULL,
  `collection_payment_amount` double DEFAULT NULL,
  `confirm_cp_amount` double DEFAULT NULL,
  `product_amount` int(11) DEFAULT NULL,
  `confirm_product_amount` int(11) DEFAULT NULL,
  `fusion_activity_fees` int(11) DEFAULT NULL,
  `confirm_fusion_activity_fees` int(11) DEFAULT NULL,
  `service_charge` double DEFAULT NULL,
  `confirm_service_charge` double DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `main_department_id` int(11) DEFAULT NULL,
  `service_line_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `add_userid` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `confirm_status` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `pay_company_name` varchar(255) DEFAULT NULL,
  `company_name_norm` varchar(255) DEFAULT NULL,
  `bank_transaction_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
