-- Table structure for guohua_customer_salary_files
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_salary_files`;
CREATE TABLE `guohua_customer_salary_files` (
  `salary_file_id` bigint(20) NOT NULL COMMENT '凭证文件ID，应用层 get_unique_num_id 生成',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `salary_id` bigint(20) NOT NULL COMMENT '账单 id',
  `salary_month` date NOT NULL COMMENT '账单月份，统一保存为当月1日',
  `voucher_type` tinyint(4) NOT NULL COMMENT '凭证类型：1社保 2公积金 3个税 4银行流水 5医保',
  `file_url` varchar(500) NOT NULL DEFAULT '' COMMENT '文件访问地址',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `file_ext` varchar(32) NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `file_size` bigint(20) NOT NULL DEFAULT 0 COMMENT '文件大小，单位字节',
  `oss_key` varchar(500) NOT NULL DEFAULT '' COMMENT 'OSS对象Key',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '上传操作人ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  PRIMARY KEY (`salary_file_id`),
  KEY `idx_salary_id_is_delete` (`salary_id`,`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户账单凭证附件表';

-- ----------------------------
