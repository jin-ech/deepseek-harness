-- Table structure for work_evaluate_area_20260507备份
-- ----------------------------
DROP TABLE IF EXISTS `work_evaluate_area_20260507备份`;
CREATE TABLE `work_evaluate_area_20260507备份` (
  `id` varchar(64) NOT NULL COMMENT '主键（UUID）',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `district` varchar(64) DEFAULT NULL COMMENT '区/县',
  `total` int(11) NOT NULL DEFAULT 0 COMMENT '总量',
  `generated` int(11) NOT NULL DEFAULT 0 COMMENT '已生成',
  `remaining` int(11) NOT NULL DEFAULT 0 COMMENT '剩余（非负）',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `gen_report_immediately` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否答完题立即生成报告：1是 0否（默认0，仍走后台task）',
  `max_eval_count` int(11) NOT NULL DEFAULT 0 COMMENT '题库版测评次数上限：0使用系统默认（Controller 常量）',
  `default_question_limits_json` longtext DEFAULT NULL COMMENT '题库版默认抽题 limits（JSON 字符串）；为空/无效则使用系统默认 DEFAULT_QUESTION_LIMITS',
  PRIMARY KEY (`id`),
  KEY `idx_remaining` (`remaining`),
  KEY `idx_area` (`province`,`city`,`district`),
  KEY `idx_is_delete` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区县二维码表';

-- ----------------------------
