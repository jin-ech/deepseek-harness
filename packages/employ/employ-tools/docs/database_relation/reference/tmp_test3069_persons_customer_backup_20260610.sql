-- Table structure for tmp_test3069_persons_customer_backup_20260610
-- ----------------------------
DROP TABLE IF EXISTS `tmp_test3069_persons_customer_backup_20260610`;
CREATE TABLE `tmp_test3069_persons_customer_backup_20260610` (
  `persons_id` varchar(64) NOT NULL,
  `old_customer_id` int(11) NOT NULL,
  `old_customer_name` varchar(255) NOT NULL,
  `backup_time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`persons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
