-- Table structure for guohua_store_manage_fee_person
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_manage_fee_person`;
CREATE TABLE `guohua_store_manage_fee_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `store_id` int(11) NOT NULL COMMENT '基地ID',
  `stat_month` char(7) NOT NULL COMMENT '统计月份 YYYY-MM',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID',
  `persons_name` varchar(64) DEFAULT '' COMMENT '人员姓名',
  `work_id` int(11) DEFAULT NULL COMMENT '就职记录ID',
  `employed_months` int(11) DEFAULT 0 COMMENT '当月在职月数',
  `personal_fee` decimal(12,2) DEFAULT 0.00 COMMENT '个人管理费(元)',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_manage_fee_person` (`store_id`,`stat_month`,`persons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地管理费人员月度明细表';

-- ----------------------------
