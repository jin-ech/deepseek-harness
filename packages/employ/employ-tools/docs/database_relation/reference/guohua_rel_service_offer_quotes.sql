-- Table structure for guohua_rel_service_offer_quotes
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_service_offer_quotes`;
CREATE TABLE `guohua_rel_service_offer_quotes` (
  `offer_quotes_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL DEFAULT 0 COMMENT '服务ID',
  `offer_type_one` varchar(64) NOT NULL DEFAULT '' COMMENT '报价类型1 （1:按客户 2:按人）',
  `offer_type_two` varchar(64) NOT NULL DEFAULT '' COMMENT '报价类型2 （1:按月 2:按年）',
  `light_disability_price` int(11) NOT NULL DEFAULT 0 COMMENT '轻残报价',
  `severe_disability_price` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '重残报价',
  `light_disability_three_num` int(11) NOT NULL DEFAULT 0 COMMENT '轻残三类人数',
  `severe_disability_three_num` int(11) NOT NULL DEFAULT 0 COMMENT '重残三类人数',
  `service_price` float(11,2) NOT NULL DEFAULT 0.00 COMMENT '服务报价(服务类型为申报代办)',
  `channel_allocation_ratio` float(11,1) NOT NULL DEFAULT 0.0 COMMENT '渠道分配比例',
  `self_allocation_ratio` float(11,0) NOT NULL DEFAULT 0 COMMENT '自有分配比例',
  `is_accrued_risk` varchar(64) NOT NULL DEFAULT '' COMMENT '是否计提风险 1是 2否',
  `accrued_risk_ratio` int(11) NOT NULL DEFAULT 0 COMMENT '风险金计提比例',
  `apartment_charge_type` varchar(64) NOT NULL DEFAULT '' COMMENT '公寓收费类型 1:按天 2:按月',
  `apartment_charge` int(11) NOT NULL DEFAULT 0 COMMENT '公寓收费',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '更新人微信ID',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  `tmp_id` varchar(255) NOT NULL DEFAULT '' COMMENT '临时id',
  PRIMARY KEY (`offer_quotes_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22941 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-服务信息关联报价表';

-- ----------------------------
