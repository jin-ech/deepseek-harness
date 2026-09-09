-- Table structure for fx_rel_user
-- ----------------------------
DROP TABLE IF EXISTS `fx_rel_user`;
CREATE TABLE `fx_rel_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `mobile` varchar(20) NOT NULL COMMENT '分享逍客用户手机号',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `fx_openUserId` varchar(100) NOT NULL COMMENT '分享逍客系统用户ID',
  `guohua_userid` varchar(50) NOT NULL COMMENT '国华用户UID',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_fx_openUserId` (`fx_openUserId`),
  KEY `idx_fx_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COMMENT='分享逍客与国华用户关联表';

-- ----------------------------
