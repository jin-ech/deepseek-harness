-- Table structure for guohua_store_rank_monthly
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_rank_monthly`;
CREATE TABLE `guohua_store_rank_monthly` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat_month` char(7) NOT NULL COMMENT '统计月份 YYYY-MM',
  `store_id` int(11) NOT NULL COMMENT '基地ID',
  `store_name` varchar(255) DEFAULT '' COMMENT '基地名称',
  `department_id` int(11) DEFAULT 0 COMMENT '部门ID',
  `department_name` varchar(255) DEFAULT '' COMMENT '部门名称',
  `area_name` varchar(255) DEFAULT '' COMMENT '地区名称',
  `checkin_person_num` int(11) DEFAULT 0 COMMENT '当月有打卡的人数',
  `photo_upload_num` int(11) DEFAULT 0 COMMENT '当月有工作照的人数',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_num` int(11) DEFAULT 0 COMMENT '月末在职人数',
  `bind_num` int(11) DEFAULT 0 COMMENT '月末绑定人数',
  `new_onboard_num` int(11) DEFAULT 0 COMMENT '当月新增上岗人数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_month_store` (`stat_month`,`store_id`),
  KEY `idx_month` (`stat_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地月度榜单快照';

-- ----------------------------
