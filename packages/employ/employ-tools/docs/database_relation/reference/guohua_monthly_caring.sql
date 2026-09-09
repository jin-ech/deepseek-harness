-- Table structure for guohua_monthly_caring
-- ----------------------------
DROP TABLE IF EXISTS `guohua_monthly_caring`;
CREATE TABLE `guohua_monthly_caring` (
  `monthly_caring_id` varchar(36) NOT NULL,
  `persons_id` varchar(36) NOT NULL COMMENT '人员ID',
  `year_month` varchar(7) NOT NULL COMMENT '年月 如 2026-06',
  `phone` varchar(20) DEFAULT '' COMMENT '联系方式',
  `info_change` tinyint(1) NOT NULL DEFAULT 0 COMMENT '证件是否变化 0无变化 1有变化',
  `disabled_level_change` tinyint(1) NOT NULL DEFAULT 0 COMMENT '残疾等级是否变化 0无变化 1有变化',
  `is_hospitalized` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否患病入院 0否 1是',
  `is_fee_charged` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否被索取费用 0否 1是',
  `is_wage_withheld` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否存在工资未收到 0否 1是',
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `detail_json` text DEFAULT NULL COMMENT '证件/等级/患病详情JSON',
  PRIMARY KEY (`monthly_caring_id`),
  KEY `idx_persons_month` (`persons_id`,`year_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='月度关怀记录';

-- ----------------------------
