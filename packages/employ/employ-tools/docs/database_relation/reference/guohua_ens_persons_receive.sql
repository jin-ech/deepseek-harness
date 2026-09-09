-- Table structure for guohua_ens_persons_receive
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_persons_receive`;
CREATE TABLE `guohua_ens_persons_receive` (
  `address_id` varchar(64) NOT NULL COMMENT '收货地址id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '用户id',
  `receive_name` varchar(64) DEFAULT NULL COMMENT '收件人姓名',
  `receive_phone` varchar(32) DEFAULT NULL COMMENT '收货人联系电话',
  `region_id` varchar(10) DEFAULT NULL COMMENT '地区id',
  `receive_province` varchar(64) DEFAULT NULL COMMENT '活动地点省份',
  `receive_city` varchar(64) DEFAULT NULL COMMENT '活动地点城市',
  `receive_district` varchar(64) DEFAULT NULL COMMENT '活动地点地区',
  `receive_address` varchar(500) DEFAULT NULL COMMENT '收货人详细地址',
  `is_default` tinyint(4) DEFAULT 2 COMMENT '是否是默认地址 1是 0否',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1是 0否',
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行用户收货地址表';

-- ----------------------------
