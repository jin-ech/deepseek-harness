-- Table structure for guohua_audit_employ_job
-- ----------------------------
DROP TABLE IF EXISTS `guohua_audit_employ_job`;
CREATE TABLE `guohua_audit_employ_job` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `small_match_id` varchar(64) NOT NULL DEFAULT '' COMMENT '小程序匹配id',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核进度 1资料提交  2资料初审 3资料复审 4企业终审 5通过 6驳回',
  `audit_sn` varchar(255) NOT NULL DEFAULT '',
  `audit_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '审核人微信ID',
  `audit_record` text NOT NULL COMMENT '审核记录意见',
  `verify_status` varchar(64) NOT NULL DEFAULT '0' COMMENT '审核情况 1 通过  2异常',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`audit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-岗位审核记录表';

-- ----------------------------
