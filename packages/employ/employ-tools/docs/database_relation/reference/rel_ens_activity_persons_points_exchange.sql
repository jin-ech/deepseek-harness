-- Table structure for rel_ens_activity_persons_points_exchange
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_activity_persons_points_exchange`;
CREATE TABLE `rel_ens_activity_persons_points_exchange` (
  `exchange_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换记录id',
  `product_id` varchar(64) DEFAULT NULL COMMENT '产品id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `order_id` varchar(64) DEFAULT NULL COMMENT '兑换订单id',
  `product_num` int(11) DEFAULT NULL COMMENT '兑换商品数量',
  `exchange_points` int(11) DEFAULT NULL COMMENT '兑换单个商品积分',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`exchange_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行志愿者活动积分兑换记录表';

-- ----------------------------
