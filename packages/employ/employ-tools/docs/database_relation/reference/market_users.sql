-- Table structure for market_users
-- ----------------------------
DROP TABLE IF EXISTS `market_users`;
CREATE TABLE `market_users` (
  `market_user_id` bigint(20) NOT NULL COMMENT '主键（应用层 get_unique_num_id）',
  `gender` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别：0未知 1男 2女',
  `user_name` varchar(64) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `real_name` varchar(64) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nick_name` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `unionid` varchar(64) NOT NULL DEFAULT '' COMMENT '开放平台唯一id',
  `mini_openid` varchar(64) NOT NULL DEFAULT '' COMMENT '小程序openid',
  `mp_openid` varchar(74) NOT NULL DEFAULT '' COMMENT '公众号openid',
  `current_role_id` int(11) DEFAULT NULL COMMENT '当前登录角色id',
  `current_customer_id` int(11) DEFAULT NULL COMMENT '当前所选客户id（customer 角色用，关联 guohua_customer.customer_id）',
  `clue_id` varchar(255) DEFAULT NULL COMMENT '线索id（关联 guohua_customer_clue.clue_id）',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '审核状态：1审核通过 2审核中 3已拒绝',
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '账号启用状态：1启用 0禁用',
  `invite_code` varchar(32) NOT NULL DEFAULT '' COMMENT '邀请码 GH/CU+序号',
  `invite_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '邀请码小程序码图片URL',
  `demand` varchar(500) NOT NULL DEFAULT '' COMMENT '需求描述（前端填写)',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '企业名称',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`market_user_id`),
  KEY `idx_market_users_phone` (`phone`),
  KEY `idx_market_users_openid` (`mini_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序用户表';

-- ----------------------------
