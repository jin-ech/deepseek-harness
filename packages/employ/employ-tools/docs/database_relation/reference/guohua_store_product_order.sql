-- Table structure for guohua_store_product_order
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_product_order`;
CREATE TABLE `guohua_store_product_order` (
  `product_order_id` varchar(64) NOT NULL COMMENT '劳动产品订单id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同id',
  `product_type` int(11) DEFAULT NULL COMMENT '产品类型（1-普通，2-高端，3-定制）',
  `product_order_type` tinyint(4) DEFAULT NULL COMMENT '劳动产品订单类型 1指定基地 2未指定基地',
  `product_order_num` varchar(255) DEFAULT NULL COMMENT '劳动产品订单号',
  `store_id` varchar(1000) DEFAULT NULL COMMENT '基地id（store_type=1为homeland_id集合，2为store_id集合，逗号分隔）',
  `store_type` tinyint(4) DEFAULT NULL COMMENT '基地类型 1温馨家园职康站 2帮扶性就业基地',
  `order_status` tinyint(4) DEFAULT 1 COMMENT '订单状态 1待确认2待分配 3待交付4待发薪5已完成',
  `delivery_date` varchar(255) DEFAULT NULL COMMENT '交付日期',
  `delivery_order_num` varchar(100) DEFAULT NULL COMMENT '交付单号',
  `is_mail_material` tinyint(4) DEFAULT 0 COMMENT '是否邮寄材料包1是0否',
  `customer_mail_address` varchar(500) DEFAULT NULL COMMENT '客户邮寄地址',
  `is_top` tinyint(4) DEFAULT 2 COMMENT '是否置顶 1是 2否',
  `release_userid` varchar(64) DEFAULT NULL COMMENT '发布人',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '确认人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1：未删除 0 已删除',
  `assign_status` tinyint(4) DEFAULT 1 COMMENT '分配状态 1待分配 2已分配',
  `remarks` text DEFAULT NULL COMMENT '备注信息',
  `sp_status` tinyint(4) DEFAULT 1 COMMENT '确认状态 0待确认 1已确认',
  `task_id` int(11) DEFAULT 0,
  `budget_type` tinyint(4) DEFAULT 1 COMMENT '采购类型 1标准预算 2额外预算',
  PRIMARY KEY (`product_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地劳动产品订单表';

-- ----------------------------
