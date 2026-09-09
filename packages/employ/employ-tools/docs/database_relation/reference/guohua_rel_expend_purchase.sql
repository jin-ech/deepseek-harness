-- Table structure for guohua_rel_expend_purchase
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_expend_purchase`;
CREATE TABLE `guohua_rel_expend_purchase` (
  `expend_id` int(11) NOT NULL DEFAULT 0 COMMENT '支出ID',
  `activity_budget_id` int(11) NOT NULL DEFAULT 0 COMMENT '预算明细ID',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_num` int(11) NOT NULL DEFAULT 0 COMMENT '采购数量',
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '开票金额',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收件地址',
  `purchase_remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '采购备注',
  `use_date` varchar(10) NOT NULL DEFAULT '' COMMENT '使用日期',
  `express_remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '快递信息',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`expend_id`) USING BTREE,
  UNIQUE KEY `uid_activity_budget_id` (`activity_budget_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='采购单表';

-- ----------------------------
