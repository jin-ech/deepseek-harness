-- Table structure for guohua_rel_persons_files_approval
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_files_approval`;
CREATE TABLE `guohua_rel_persons_files_approval` (
  `rel_persons_files_approval_id` varchar(36) NOT NULL DEFAULT '' COMMENT '文件关联审批ID',
  `persons_files_id` varchar(36) NOT NULL COMMENT '文件ID',
  `audit_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态 2:审核通过 3:驳回',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '审核理由',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '审核人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '审核时间',
  `file_source` varchar(36) NOT NULL DEFAULT '0' COMMENT '资料来源  1就业资料  2申报资料',
  PRIMARY KEY (`rel_persons_files_approval_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-人员资料附件审核表';

-- ----------------------------
