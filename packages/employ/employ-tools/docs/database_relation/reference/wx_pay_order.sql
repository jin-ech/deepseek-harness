-- Table structure for wx_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `wx_pay_order`;
CREATE TABLE `wx_pay_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '支付金额 ，单位分',
  `full_name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(64) NOT NULL DEFAULT '' COMMENT '电话',
  `card_id` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `area_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区id',
  `hospital_id` int(11) NOT NULL DEFAULT 0 COMMENT '医院id',
  `start_date` date DEFAULT NULL COMMENT '体检开始日期',
  `end_date` date DEFAULT NULL COMMENT '体检截止日期',
  `openid` varchar(64) NOT NULL COMMENT '用户openid',
  `prepay_id` varchar(64) NOT NULL COMMENT '预支付id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '下单时间',
  `trade_state` varchar(64) NOT NULL DEFAULT 'NOTPAY' COMMENT '交易状态，枚举值：\nSUCCESS：支付成功\nREFUND：转入退款\nNOTPAY：未支付\nCLOSED：已关闭\nREVOKED：已撤销（付款码支付）\nUSERPAYING：用户支付中（付款码支付）\nPAYERROR：支付失败(其他原因，如银行返回失败)',
  `bank_type` varchar(64) NOT NULL DEFAULT '' COMMENT '支付银行',
  `is_callback` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否回调 0 未回调 已回调',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 0 已删除 1未删除',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='微信支付订单';

-- ----------------------------
