-- Table structure for guohua_store_login_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_login_log`;
CREATE TABLE `guohua_store_login_log` (
  `login_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `store_id` int(11) NOT NULL COMMENT '基地ID，对应 guohua_store.store_id',
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '登录账号，对应 base_guohua_user.userid',
  `login_time` datetime NOT NULL COMMENT '登录时间，统计按自然月归属此字段',
  `login_source` tinyint(4) NOT NULL DEFAULT 0 COMMENT '登录来源：0未知 1PC后台 2小程序 3App',
  `login_ip` varchar(64) NOT NULL DEFAULT '' COMMENT '登录IP',
  `user_agent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent，便于排查异常登录',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 0已删除，与本库其它表一致',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '入库时间',
  PRIMARY KEY (`login_log_id`),
  KEY `idx_store_login_time` (`store_id`,`login_time`),
  KEY `idx_login_time` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='基地端登录日志，用于基地登录活跃度统计';

-- ----------------------------
