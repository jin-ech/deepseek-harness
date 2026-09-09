-- Table structure for guohua_rel_expend_borrow
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_expend_borrow`;
CREATE TABLE `guohua_rel_expend_borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bx_expend_id` int(11) NOT NULL DEFAULT 0 COMMENT '报销id',
  `bx_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '报销金额',
  `bx_expend_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '报销支出编号',
  `jk_expend_id` int(11) NOT NULL DEFAULT 0 COMMENT '借款id',
  `jk_expend_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '借款支出编号',
  `jk_amount` decimal(11,2) NOT NULL DEFAULT 0.00 COMMENT '借款总金额',
  `borrow_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '借款事由',
  `return_time` varchar(255) NOT NULL DEFAULT '' COMMENT '归还时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_bx_expend_id` (`bx_expend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COMMENT='财务管理系统支出借款关联表';

-- ----------------------------
