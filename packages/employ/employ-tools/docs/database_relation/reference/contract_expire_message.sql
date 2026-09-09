-- Table structure for contract_expire_message
-- ----------------------------
DROP TABLE IF EXISTS `contract_expire_message`;
CREATE TABLE `contract_expire_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `persons_id` varchar(36) NOT NULL DEFAULT '' COMMENT '成员id',
  `message_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '消息类型 1合同到期通知',
  `message_content` varchar(500) NOT NULL DEFAULT '' COMMENT '消息内容',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '发送时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `userid` varchar(32) NOT NULL DEFAULT '' COMMENT '负责人id',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6714 DEFAULT CHARSET=utf8mb4 COMMENT='人员到期通知';

-- ----------------------------
