-- Table structure for guohua_supplier
-- ----------------------------
DROP TABLE IF EXISTS `guohua_supplier`;
CREATE TABLE `guohua_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `link_name` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '手机号',
  `bank_account` varchar(255) NOT NULL DEFAULT '' COMMENT '银行账号',
  `open_account` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行',
  `sub_open_account` varchar(255) NOT NULL DEFAULT '' COMMENT '支行',
  `create_user` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='供应商表';

-- ----------------------------
