-- Table structure for guohua_message
-- ----------------------------
DROP TABLE IF EXISTS `guohua_message`;
CREATE TABLE `guohua_message` (
  `message_id` varchar(32) NOT NULL DEFAULT '' COMMENT '消息id',
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '人员id',
  `userid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户id',
  `message_type` varchar(32) NOT NULL DEFAULT '' COMMENT '消息类型 notice:通知  todo:待办',
  `message_title` varchar(64) NOT NULL DEFAULT '' COMMENT '消息标题',
  `message_content` text NOT NULL COMMENT '消息内容',
  `notice_type` varchar(64) NOT NULL DEFAULT '' COMMENT '通知类型 contract合同到期 idcard身份证到期 tudo催办',
  `todo_status` varchar(64) NOT NULL DEFAULT '' COMMENT '待办状态',
  `jump_param` text NOT NULL COMMENT '跳转参数',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_read` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已读 1已读 0未读',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-消息通知表';

-- ----------------------------
