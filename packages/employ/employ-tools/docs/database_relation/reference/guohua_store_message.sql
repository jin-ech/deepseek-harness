-- Table structure for guohua_store_message
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_message`;
CREATE TABLE `guohua_store_message` (
  `message_id` varchar(32) NOT NULL DEFAULT '' COMMENT '消息id',
  `store_id` varchar(255) DEFAULT NULL COMMENT '基地id',
  `store_type` tinyint(4) DEFAULT NULL COMMENT '基地类型 1温馨家园职康站 2帮扶性就业基地',
  `message_type` tinyint(4) DEFAULT 1 COMMENT '消息类型 1通知',
  `message_title` varchar(64) DEFAULT NULL COMMENT '消息标题',
  `message_content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `jump_param` text DEFAULT NULL COMMENT '跳转参数',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_global` tinyint(4) DEFAULT 0 COMMENT '是否全局 1是 0否',
  `is_read` tinyint(4) DEFAULT 0 COMMENT '是否已读 1已读 0未读',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地劳动产品订单消息表';

-- ----------------------------
