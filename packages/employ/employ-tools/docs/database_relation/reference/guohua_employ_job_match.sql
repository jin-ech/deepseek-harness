-- Table structure for guohua_employ_job_match
-- ----------------------------
DROP TABLE IF EXISTS `guohua_employ_job_match`;
CREATE TABLE `guohua_employ_job_match` (
  `small_match_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小程序匹配ID',
  `match_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '匹配编号',
  `company_job_id` varchar(64) NOT NULL DEFAULT '' COMMENT '发布岗位id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID',
  `office_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '入职状态 1:待入职 2:已入职 3:已离职',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:未提交 2:审核中 3:审核通过 4:审核未通过',
  `audit_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '修改人微信ID',
  `match_date` datetime DEFAULT current_timestamp() COMMENT '匹配日期',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  `is_agree` varchar(64) NOT NULL DEFAULT '0' COMMENT '是否接受岗位 1是 0未选择',
  `is_active` varchar(64) NOT NULL DEFAULT '1' COMMENT '岗位分配方式 1.主动申请  2.后台派发',
  PRIMARY KEY (`small_match_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=utf8mb4 COMMENT='小程序-人员申请匹配表';

-- ----------------------------
