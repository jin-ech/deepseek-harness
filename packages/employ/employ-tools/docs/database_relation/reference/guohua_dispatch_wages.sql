-- Table structure for guohua_dispatch_wages
-- ----------------------------
DROP TABLE IF EXISTS `guohua_dispatch_wages`;
CREATE TABLE `guohua_dispatch_wages` (
  `dispatch_wages_id` varchar(64) NOT NULL COMMENT '工资发放id',
  `dispatch_wages_sn` varchar(255) NOT NULL COMMENT '工资发放单号',
  `account_id` int(11) NOT NULL DEFAULT 0 COMMENT '付款单位id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `belong_month` varchar(255) NOT NULL DEFAULT '' COMMENT '发放月份',
  `total_people` int(11) NOT NULL DEFAULT 0 COMMENT '发放总人数',
  `payment_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '发放总金额',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收款人姓名',
  `bank_account` varchar(255) NOT NULL DEFAULT '' COMMENT '银行账号',
  `open_bank` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行',
  `remarks` varchar(255) NOT NULL COMMENT '备注',
  `sp_no` varchar(255) NOT NULL DEFAULT '' COMMENT '审批编号',
  `sp_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审批状态',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `userid` varchar(255) NOT NULL COMMENT '申请人id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_claim` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已付 1已付 0未付',
  `is_borrow` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否垫付 1是 0否',
  `salary_id` int(11) DEFAULT NULL COMMENT '薪资id',
  `payment_id` int(11) DEFAULT NULL COMMENT '到款id',
  `payment_confirm_id` varchar(64) DEFAULT NULL COMMENT '认款id  多条逗号分隔',
  `payment_time` varchar(255) DEFAULT NULL COMMENT '付款时间',
  `cmb_status` enum('待处理','处理中','待审批','代发成功','部分成功','代发失败','代发撤销','审批否决','审批过期','已退回') DEFAULT NULL COMMENT '银行处理状态(中文枚举)',
  `cmb_reqnbr` varchar(30) DEFAULT NULL,
  `cmb_rtnflg` varchar(10) DEFAULT NULL,
  `cmb_result_time` datetime DEFAULT NULL,
  `receipt_file_url` varchar(512) DEFAULT NULL COMMENT '回执PDF的OSS URL',
  `receipt_printid` varchar(128) DEFAULT NULL COMMENT '回执打印任务ID',
  PRIMARY KEY (`dispatch_wages_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='OA-工资发放表';

-- ----------------------------
