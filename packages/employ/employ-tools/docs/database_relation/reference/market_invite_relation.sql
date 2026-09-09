-- Table structure for market_invite_relation
-- ----------------------------
DROP TABLE IF EXISTS `market_invite_relation`;
CREATE TABLE `market_invite_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `inviter_user_id` bigint(20) NOT NULL COMMENT '邀请人 market_users.market_user_id',
  `invitee_user_id` bigint(20) NOT NULL COMMENT '被邀请人 market_users.market_user_id',
  `invite_code` varchar(32) NOT NULL DEFAULT '' COMMENT '注册时填写的邀请码快照',
  `invite_customer_id` bigint(20) DEFAULT NULL COMMENT '邀请来源客户id(扫客户码邀请时有值,手填邀请码为空)',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '注册时间',
  PRIMARY KEY (`id`),
  KEY `idx_market_invite_inviter` (`inviter_user_id`),
  KEY `idx_market_invite_invitee` (`invitee_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序邀请关系表';

-- ----------------------------
