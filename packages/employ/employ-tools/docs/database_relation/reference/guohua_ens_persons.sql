-- Table structure for guohua_ens_persons
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_persons`;
CREATE TABLE `guohua_ens_persons` (
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '志愿者id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `persons_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(4) DEFAULT 0 COMMENT '性别 0未知 1男 2女',
  `phone` varchar(64) DEFAULT NULL COMMENT '电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `department_id` tinyint(4) DEFAULT NULL COMMENT ' 1集团 2华北 3华东 4成都',
  `department_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
  `nick_name` varchar(64) DEFAULT NULL COMMENT '微信昵称',
  `mini_openid` varchar(64) DEFAULT NULL COMMENT '小程序openid',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `unionid` varchar(64) DEFAULT NULL COMMENT '微信唯一id',
  `session_key` varchar(255) DEFAULT NULL COMMENT 'session_key',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`persons_id`) USING BTREE,
  UNIQUE KEY `uni_phone` (`phone`) USING BTREE,
  KEY `index_is_delete_` (`is_delete`) USING BTREE,
  KEY `_index_persons_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行企业用户表';

-- ----------------------------
