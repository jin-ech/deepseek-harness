-- Table structure for market_customer_bind_apply
-- ----------------------------
DROP TABLE IF EXISTS `market_customer_bind_apply`;
CREATE TABLE `market_customer_bind_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_user_id` bigint(20) NOT NULL COMMENT '申请人 market_users.market_user_id',
  `customer_id` bigint(20) NOT NULL COMMENT '来源客户 guohua_customer.customer_id',
  `invite_user_id` bigint(20) DEFAULT NULL COMMENT '邀请人 market_users.market_user_id',
  `invite_user_gh_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '邀请人对应 base_guohua_user.userid（查不到为空）',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '申请人手机号（审核通过时写客户联系人用）',
  `contact_name` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人姓名快照',
  `is_new_user` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=注册时申请(需激活用户) 0=已注册登录时申请',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待审核 2通过 3拒绝',
  `reviewer_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '审核人 base_guohua_user.userid',
  `review_time` datetime DEFAULT NULL COMMENT '审核时间',
  `review_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '审核备注',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_bind_apply_user` (`market_user_id`),
  KEY `idx_bind_apply_customer` (`customer_id`),
  KEY `idx_bind_apply_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序客户绑定申请表（扫码邀请绑定需后台审核）';

-- ----------------------------
