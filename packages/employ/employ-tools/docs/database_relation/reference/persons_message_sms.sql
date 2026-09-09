-- Table structure for persons_message_sms
-- ----------------------------
DROP TABLE IF EXISTS `persons_message_sms`;
CREATE TABLE `persons_message_sms` (
  `persons_message_id` varchar(36) NOT NULL COMMENT '成员消息id',
  `persons_id` varchar(36) NOT NULL DEFAULT '' COMMENT '成员id',
  `message_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '消息类型 1 资料审核 2运营事件',
  `message_name` varchar(255) NOT NULL DEFAULT '' COMMENT '消息名称',
  `message_content` varchar(500) NOT NULL DEFAULT '' COMMENT '消息内容',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '发送时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  `send_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '发送状态0：成功 1：失败',
  PRIMARY KEY (`persons_message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信发送记录';

-- ----------------------------
