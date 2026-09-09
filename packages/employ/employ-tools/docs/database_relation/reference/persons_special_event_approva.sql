-- Table structure for persons_special_event_approva
-- ----------------------------
DROP TABLE IF EXISTS `persons_special_event_approva`;
CREATE TABLE `persons_special_event_approva` (
  `special_event_approval_id` varchar(36) NOT NULL DEFAULT '' COMMENT '事件资料审核id',
  `special_event_files_id` varchar(36) NOT NULL DEFAULT '0' COMMENT '事件图片id',
  `persons_id` varchar(36) NOT NULL COMMENT '人员id',
  `audit_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态 2:审核通过 3:驳回 4交付审核通过',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '审核理由',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '审核时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`special_event_approval_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-事件审核记录表';

-- ----------------------------
