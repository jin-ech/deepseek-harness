-- Table structure for dis_emp_person_mentor_match
-- ----------------------------
DROP TABLE IF EXISTS `dis_emp_person_mentor_match`;
CREATE TABLE `dis_emp_person_mentor_match` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID，关联 persons.persons_id',
  `mentor_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '导师ID，关联 dis_emp_mentor.id',
  `mentor_no` varchar(20) NOT NULL DEFAULT '' COMMENT '导师编号，冗余关联 dis_emp_mentor.mentor_no',
  `match_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '匹配状态 1:已匹配 2:取消匹配',
  `match_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '匹配操作人userid',
  `match_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '匹配时间',
  `unmatch_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '取消匹配操作人userid',
  `unmatch_time` datetime DEFAULT NULL COMMENT '取消匹配时间',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否删除，1=未删除，0=已删除',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_persons_id` (`persons_id`) USING BTREE,
  KEY `idx_mentor_id` (`mentor_id`) USING BTREE,
  KEY `idx_mentor_no` (`mentor_no`) USING BTREE,
  KEY `idx_match_status_delete` (`match_status`,`is_delete`) USING BTREE,
  KEY `idx_person_mentor_delete` (`persons_id`,`mentor_id`,`is_delete`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人人员导师匹配关系表';

-- ----------------------------
