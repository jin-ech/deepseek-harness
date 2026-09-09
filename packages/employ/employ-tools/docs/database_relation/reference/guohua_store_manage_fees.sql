-- Table structure for guohua_store_manage_fees
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_manage_fees`;
CREATE TABLE `guohua_store_manage_fees` (
  `manage_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理费ID',
  `year_month` varchar(10) DEFAULT NULL COMMENT '统计年月',
  `store_id` int(11) DEFAULT NULL COMMENT '基地ID',
  `manage_fee` decimal(10,2) DEFAULT NULL COMMENT '管理费金额',
  `status` tinyint(1) DEFAULT 0 COMMENT '金额状态 1： 已提现 0冻结金额 2：待提现 -1 ：已扣除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加记录时间',
  `withdraw_time` datetime DEFAULT NULL COMMENT '提现时间',
  `expend_id` int(11) DEFAULT NULL COMMENT '支出ID，支出表，和审批流对应上',
  `withdraw_user` varchar(255) DEFAULT NULL COMMENT '提现人',
  PRIMARY KEY (`manage_fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地管理费统计表（按月）';

-- ----------------------------
