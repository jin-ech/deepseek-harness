-- Table structure for rel_ens_persons_recommend_job_audit
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_persons_recommend_job_audit`;
CREATE TABLE `rel_ens_persons_recommend_job_audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `job_id` int(11) DEFAULT 0 COMMENT '推荐岗位id',
  `audit_status` tinyint(4) DEFAULT NULL COMMENT '审核情况 1通过 2未通过',
  `audit_record` text DEFAULT NULL COMMENT '审核意见',
  `audit_userid` varchar(255) DEFAULT '' COMMENT '审核人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1:未删除 0:删除',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行志愿者推荐岗位审核记录表';

-- ----------------------------
