-- Table structure for guohua_customer_gift
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_gift`;
CREATE TABLE `guohua_customer_gift` (
  `gift_id` varchar(64) NOT NULL DEFAULT '' COMMENT '礼品id',
  `gift_name` varchar(255) DEFAULT NULL COMMENT '礼品名称',
  `gift_num` int(11) DEFAULT NULL COMMENT '礼品数量',
  `gift_amount` decimal(10,2) DEFAULT NULL COMMENT '礼品单价',
  `gift_type` tinyint(4) DEFAULT NULL COMMENT '礼品类型 1商务礼品 2公司福利 3生日礼品',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '创建人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `gift_img` varchar(255) DEFAULT NULL COMMENT '礼品封面',
  PRIMARY KEY (`gift_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户礼品信息表';

-- ----------------------------
