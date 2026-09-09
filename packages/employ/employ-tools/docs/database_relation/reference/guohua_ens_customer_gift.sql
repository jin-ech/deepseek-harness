-- Table structure for guohua_ens_customer_gift
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_customer_gift`;
CREATE TABLE `guohua_ens_customer_gift` (
  `ens_gift_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '礼品数据id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `product_id` varchar(64) DEFAULT NULL COMMENT '产品id',
  `product_num` int(11) DEFAULT NULL COMMENT '产品可用数量',
  `exchange_points` int(11) DEFAULT NULL COMMENT '产品兑换积分',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_show` tinyint(4) DEFAULT 1 COMMENT '是否显示 1显示 0 不显示 状态同步c端小程序',
  `is_top` tinyint(4) DEFAULT 0 COMMENT '是否置顶 1是 0否',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_comment` tinyint(4) DEFAULT 1 COMMENT '是否开启评论 1开启 0未开启',
  PRIMARY KEY (`ens_gift_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='助益行企业商城礼品表';

-- ----------------------------
