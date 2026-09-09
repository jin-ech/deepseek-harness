-- Table structure for work_evaluate_qrcode_pool
-- ----------------------------
DROP TABLE IF EXISTS `work_evaluate_qrcode_pool`;
CREATE TABLE `work_evaluate_qrcode_pool` (
  `id` varchar(64) NOT NULL COMMENT '主键（UUID）',
  `scope_type` varchar(16) NOT NULL DEFAULT 'city' COMMENT '作用范围：city/district',
  `province` varchar(64) DEFAULT NULL COMMENT '省（冗余）',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `district` varchar(64) DEFAULT NULL COMMENT '区/县（scope_type=district 时使用）',
  `qrcode_url` varchar(1024) DEFAULT NULL COMMENT '二维码链接（可为空，由前端拼接或后端生成）',
  `total` int(11) NOT NULL DEFAULT 0 COMMENT '总量',
  `generated` int(11) NOT NULL DEFAULT 0 COMMENT '已使用/已占用',
  `remaining` int(11) NOT NULL DEFAULT 0 COMMENT '剩余（非负）',
  `gen_report_immediately` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否答完题立即生成报告：1是 0否',
  `max_eval_count` int(11) NOT NULL DEFAULT 0 COMMENT '题库版测评次数上限：0使用系统默认',
  `default_question_limits_json` longtext DEFAULT NULL COMMENT '题库版默认抽题 limits（JSON 字符串）',
  `is_show_backend` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否在后台列表显示：1显示 0隐藏',
  `pool_login_username` varchar(64) DEFAULT NULL COMMENT '池管理端登录用户名（池内独立，非全局唯一）',
  `pool_login_password_hash` varchar(255) DEFAULT NULL COMMENT '池管理端登录密码哈希（werkzeug pbkdf2）',
  `pool_login_enabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '池管理端是否要求登录：0免登录 1必须登录',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_pool_scope` (`scope_type`,`city`,`district`),
  KEY `idx_pool_city` (`city`),
  KEY `idx_pool_district` (`district`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='职业能力测评二维码池（市/区口径统一）';

-- ----------------------------
