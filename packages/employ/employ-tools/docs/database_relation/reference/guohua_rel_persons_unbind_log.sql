-- Table structure for guohua_rel_persons_unbind_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_unbind_log`;
CREATE TABLE `guohua_rel_persons_unbind_log` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '人员ID',
  `id_number` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证号',
  `unionid` varchar(64) NOT NULL DEFAULT '' COMMENT '微信唯一id',
  `mini_openid` varchar(64) NOT NULL DEFAULT '' COMMENT '小程序openid',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 2已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `_index_persons_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员解绑记录表';

-- ----------------------------
