-- Table structure for work_task_share
-- ----------------------------
DROP TABLE IF EXISTS `work_task_share`;
CREATE TABLE `work_task_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `share_id` varchar(36) NOT NULL COMMENT '分享ID(分享链接里的id)',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `task_person_rel_id` int(11) NOT NULL DEFAULT 0 COMMENT '人员任务关联ID(0=无)',
  `schedule_detail_id` int(11) NOT NULL DEFAULT 0 COMMENT '排班明细ID(0=无)',
  `period_key` varchar(32) NOT NULL DEFAULT '' COMMENT '补交周期key(空=当期)',
  `product_order_produce_id` varchar(64) NOT NULL DEFAULT '' COMMENT '劳动产品明细ID',
  `extra_json` text DEFAULT NULL COMMENT '产品名/数量等展示字段',
  `sharer_persons_id` varchar(36) NOT NULL COMMENT '分享者',
  `sharer_persons_name` varchar(50) NOT NULL DEFAULT '',
  `ins_id` int(11) NOT NULL DEFAULT 0,
  `helper_openid` varchar(64) NOT NULL DEFAULT '' COMMENT '代填者openid',
  `helper_nickname` varchar(64) NOT NULL DEFAULT '',
  `submit_id` int(11) NOT NULL DEFAULT 0 COMMENT '代填完成后回填',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=待代填 1=已完成',
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `complete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_share_id` (`share_id`),
  KEY `idx_sharer` (`sharer_persons_id`),
  KEY `idx_task` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='工作任务分享代填';

-- ----------------------------
