-- Table structure for guohua_own_persons_summary
-- ----------------------------
DROP TABLE IF EXISTS `guohua_own_persons_summary`;
CREATE TABLE `guohua_own_persons_summary` (
  `summary_id` bigint(20) NOT NULL COMMENT '主键（雪花id）',
  `account_id` int(11) NOT NULL DEFAULT 0 COMMENT '签约主体id',
  `social_month` varchar(10) DEFAULT NULL COMMENT '社保月份 YYYY-MM',
  `persons_old` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个人养老',
  `persons_work` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个人失业',
  `persons_medical` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个人医疗',
  `persons_social_insurance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '个人社保合计',
  `company_old` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业养老',
  `company_work` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业失业',
  `company_injury` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业工伤',
  `company_medical` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业医疗',
  `company_social_insurance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '企业社保合计',
  `persons_housing` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '公积金（个人）',
  `company_housing` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '公积金（单位）',
  `persons_count` int(11) NOT NULL DEFAULT 0 COMMENT '总人数',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '添加人id',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '编辑时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '删除状态 1未删除 0已删除',
  PRIMARY KEY (`summary_id`),
  KEY `idx_account_month` (`account_id`,`social_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自有人员社保汇总表';

-- ----------------------------
