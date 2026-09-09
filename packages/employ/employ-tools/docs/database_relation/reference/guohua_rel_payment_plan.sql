-- Table structure for guohua_rel_payment_plan
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_payment_plan`;
CREATE TABLE `guohua_rel_payment_plan` (
  `payment_plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '付款计划ID',
  `sp_no` varchar(255) NOT NULL DEFAULT '' COMMENT '审批编号',
  `sp_status` varchar(255) NOT NULL DEFAULT '0' COMMENT '审批状态 1审批中，2已通过，3已驳回，4已撤销',
  `contract_id` int(11) NOT NULL DEFAULT 0 COMMENT '合同ID',
  `payment_method` varchar(64) NOT NULL DEFAULT '0' COMMENT '回款方式 1年付 2季度付 3月付 4一次性 5按比例 6按固定金额',
  `payment_form` int(11) NOT NULL DEFAULT 2 COMMENT '付款形式(1:预付款 2:应付款)',
  `payment_ratio` int(11) NOT NULL DEFAULT 0 COMMENT '付款比例',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '付款金额',
  `product_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '劳动产品金额',
  `fusion_activity_fees` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '融合活动费用',
  `payment_date` varchar(64) NOT NULL DEFAULT '' COMMENT '付款日期',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT '回款计划更新时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '添加人',
  `light_num` int(11) DEFAULT 0 COMMENT '当月在职人数',
  `weight_num` int(11) DEFAULT 0 COMMENT '当月在职人数',
  `light_price` decimal(10,2) DEFAULT NULL COMMENT '轻残报价',
  `weight_price` decimal(10,2) DEFAULT NULL COMMENT '重残报价',
  `bill_id` int(11) DEFAULT NULL COMMENT 'id',
  `payment_confirm_id` int(11) DEFAULT NULL COMMENT '回款id',
  `is_update` int(11) DEFAULT NULL COMMENT '1 手动修改 ',
  `payment_date_postpone` int(11) NOT NULL DEFAULT 0 COMMENT '其他计划的时间跟随填写的计划还款时间顺延,1是0否',
  `amount_price_postpone` int(11) NOT NULL DEFAULT 0 COMMENT '其他计划延续使用此处的报价和回款计划金额,1是0否',
  `history_payment_plan_id` int(11) DEFAULT 0 COMMENT '临时id(旧的计划id)',
  `change_reason` varchar(255) DEFAULT NULL COMMENT '变更原因',
  PRIMARY KEY (`payment_plan_id`) USING BTREE,
  KEY `idx_payment_plan_delete_contract` (`is_delete`,`contract_id`,`payment_date`),
  KEY `idx_payment_plan_bill_delete` (`bill_id`,`is_delete`),
  KEY `idx_payment_confirm_id` (`payment_confirm_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=169520 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-合同关联付款计划表';

-- ----------------------------
