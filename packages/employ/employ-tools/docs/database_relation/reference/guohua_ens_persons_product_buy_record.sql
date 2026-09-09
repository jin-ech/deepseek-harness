-- Table structure for guohua_ens_persons_product_buy_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_persons_product_buy_record`;
CREATE TABLE `guohua_ens_persons_product_buy_record` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购买id',
  `customer_id` varchar(255) DEFAULT NULL COMMENT '企业id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '志愿者ID',
  `plat_type` tinyint(4) DEFAULT NULL COMMENT '平台类型 1 善馨小屋 2爱立方旗舰店',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `product_num` int(11) DEFAULT NULL COMMENT '产品数量',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '购买金额',
  `audit_status` tinyint(4) DEFAULT 0 COMMENT '审核情况 0待审核 1通过 2未通过',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '后台添加人id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行企业用户劳动产品购买记录表';

-- ----------------------------
