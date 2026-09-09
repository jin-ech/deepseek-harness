-- Table structure for persons_special_event_in
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_in`;
CREATE TABLE `persons_special_event_in` (
  `special_event_in_id` varchar(64) NOT NULL DEFAULT '' COMMENT '内部事件id',
  `special_event_type_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '事件类id',
  `special_event_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '事件状态 0 未开始  1进行中  2已完成  3已中止 4已逾期',
  `persons_id` text NOT NULL COMMENT '人员ids',
  `customer_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '客户ids',
  `customer_source` varchar(64) DEFAULT NULL COMMENT '事件来源1FESCO 2自销',
  `area_id` varchar(255) NOT NULL DEFAULT '' COMMENT '区域ids',
  `store_id` varchar(255) NOT NULL DEFAULT '' COMMENT '基地ids',
  `expire_date` varchar(32) NOT NULL DEFAULT '' COMMENT '截止日期',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `is_month` varchar(64) NOT NULL DEFAULT '2' COMMENT '是否包含月份 1是 2否',
  `is_push` varchar(32) NOT NULL DEFAULT '0' COMMENT '发布状态 1 已发布 0未发布',
  `is_important` tinyint(4) DEFAULT 0 COMMENT '是否重要 1是 0否',
  `is_top` tinyint(4) DEFAULT 0 COMMENT '是否置顶 1是 0否',
  `remarks` text NOT NULL COMMENT '具体事由',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `add_userid` varchar(32) NOT NULL COMMENT '添加人',
  `add_source` varchar(16) NOT NULL DEFAULT 'admin' COMMENT '事件创建渠道 admin=后台 mini=小程序 wecom=企微 ...',
  `userid` varchar(255) NOT NULL DEFAULT '' COMMENT '任务执行人',
  `cc_userid` varchar(255) DEFAULT NULL COMMENT '任务抄送人',
  `month` varchar(255) NOT NULL DEFAULT '' COMMENT '事件所属月',
  `fesco_service_name` varchar(255) DEFAULT NULL COMMENT '外企服务人员',
  `file_event_type_id` varchar(255) DEFAULT NULL COMMENT '档案类型',
  PRIMARY KEY (`special_event_in_id`) USING BTREE,
  KEY `img_ acitvity_id` (`special_event_type_id`) USING BTREE,
  KEY `idx_area_id` (`area_id`) USING BTREE,
  KEY `idx_add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内部事件处理';

-- ----------------------------
