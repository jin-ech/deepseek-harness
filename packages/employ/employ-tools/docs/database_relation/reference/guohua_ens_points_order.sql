-- Table structure for guohua_ens_points_order
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_points_order`;
CREATE TABLE `guohua_ens_points_order` (
  `points_order_id` varchar(64) NOT NULL COMMENT '积分订单id',
  `order_num` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `product_user_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户id',
  `receive_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系电话',
  `receive_address` varchar(500) NOT NULL DEFAULT '' COMMENT '收货地址',
  `receive_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `is_invoice` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否开发票 1开 2不开',
  `invoice_header` varchar(255) NOT NULL DEFAULT '' COMMENT '发票抬头',
  `duty_number` varchar(64) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `express_name` varchar(255) NOT NULL DEFAULT '' COMMENT '快递名称',
  `express_number` varchar(64) NOT NULL DEFAULT '' COMMENT '快递单号',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单状态0：已取消 1：待发货 2：已发货 3已确认',
  `remarks` varchar(1000) NOT NULL DEFAULT '' COMMENT '备注信息',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '下单时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 0已删除',
  `prepay_id` varchar(255) NOT NULL DEFAULT '' COMMENT '预支付id',
  `trade_state` varchar(30) NOT NULL DEFAULT 'NOTPAY' COMMENT '交易状态，枚举值：\\nSUCCESS：支付成功\\nREFUND：转入退款\\nNOTPAY：未支付\\nCLOSED：已关闭\\nREVOKED：已撤销（付款码支付）\\nUSERPAYING：用户支付中（付款码支付）\\nPAYERROR：支付失败(其他原因，如银行返回失败)',
  `bank_type` varchar(30) NOT NULL DEFAULT '' COMMENT '交易银行',
  `is_callback` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否回调1：已回调0：未回调',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT 'openid',
  `time_expire` datetime DEFAULT NULL COMMENT '支付结束截止时间',
  `is_pickup` tinyint(4) DEFAULT 0 COMMENT '是否自提1是 0否',
  `is_exchange` tinyint(4) DEFAULT 0 COMMENT '是否兑换 1是 0否',
  `redeem_code` varchar(255) DEFAULT NULL COMMENT '兑换码',
  PRIMARY KEY (`points_order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行礼品兑换订单表';

-- ----------------------------
