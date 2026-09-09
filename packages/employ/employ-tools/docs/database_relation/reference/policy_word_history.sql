-- Table structure for policy_word_history
-- ----------------------------
DROP TABLE IF EXISTS `policy_word_history`;
CREATE TABLE `policy_word_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `policy_id` varchar(64) NOT NULL DEFAULT '' COMMENT '政策id',
  `content` text NOT NULL COMMENT '内容',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='数据比对日志记录表';

-- ----------------------------
