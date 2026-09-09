-- Table structure for guohua_customer_clue
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_clue`;
CREATE TABLE `guohua_customer_clue` (
  `clue_id` varchar(255) NOT NULL DEFAULT '' COMMENT '线索id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `project_chance_id` int(11) NOT NULL COMMENT '项目机会id',
  `supplier_id` int(11) NOT NULL COMMENT '供应商id',
  `purchase_amount` decimal(10,2) DEFAULT NULL COMMENT '采购金额',
  `expect_sign_month` varchar(64) DEFAULT NULL COMMENT '预计签约月份',
  `development_rate` int(11) DEFAULT 0 COMMENT '开发进度',
  `cooperation_model` varchar(64) DEFAULT NULL COMMENT '合作模式 1政府采购 2招标',
  `bidding_date` varchar(64) DEFAULT NULL COMMENT '招投标合约到期时间',
  `cut_chance` text DEFAULT NULL COMMENT '切入机会',
  `clear_desc` text DEFAULT NULL COMMENT '结算信息',
  `closing_strategy` text DEFAULT NULL COMMENT '成交策略',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `responsible_userid` varchar(255) DEFAULT NULL COMMENT '负责人',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改时间',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门id',
  `department_id` int(11) DEFAULT NULL COMMENT '子部门id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_renewal` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否续约 1是 0否',
  `is_close` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否关闭 1是 0否',
  PRIMARY KEY (`clue_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户销售线索表';

-- ----------------------------
