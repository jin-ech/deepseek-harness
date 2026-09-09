-- Table structure for guohua_audit
-- ----------------------------
DROP TABLE IF EXISTS `guohua_audit`;
CREATE TABLE `guohua_audit` (
  `audit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核ID',
  `audit_sn` varchar(255) NOT NULL DEFAULT '' COMMENT '审核编号',
  `audit_type` varchar(64) NOT NULL DEFAULT '' COMMENT '审核类型 1:人员新增 2:人岗匹配',
  `employ_type` varchar(64) NOT NULL DEFAULT '' COMMENT '就职类型 1:入职 2:离职  audit_type=2',
  `audit_status` varchar(64) NOT NULL DEFAULT '1' COMMENT '审核状态 1:待审核 2:审核通过 3:审核异常',
  `review_id` varchar(64) NOT NULL DEFAULT '' COMMENT '待审核记录ID',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '提交人微信ID',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '提交时间',
  `audit_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '审核人微信ID',
  `audit_record` varchar(255) NOT NULL DEFAULT '' COMMENT '审核记录意见',
  `audit_time` varchar(255) NOT NULL DEFAULT '' COMMENT '审核时间',
  `quit_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '离职原因',
  `quit_way` varchar(10) NOT NULL DEFAULT '' COMMENT '离职方式 1:在岗离职 2:未上岗离职 3:辞职 4:转岗 5:劳动合同期满终止6:死亡离职 7:残疾证注销 8:客户需求减少 9:客户提前终止合作 10:退休前离职 11:其他',
  `fund_end_month` varchar(10) NOT NULL DEFAULT '' COMMENT '公积金缴纳停止月',
  `social_end_month` varchar(10) NOT NULL DEFAULT '' COMMENT '社保缴纳停止月',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '是否删除 1:未删除 0:删除',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '人员ID',
  `actual_end_date` varchar(10) DEFAULT NULL COMMENT '实际结束日期',
  PRIMARY KEY (`audit_id`) USING BTREE,
  KEY `idx_review_id` (`review_id`) USING BTREE,
  KEY `idx_audit_review_type_employ_delete` (`review_id`,`audit_type`,`employ_type`,`is_delete`),
  KEY `idx_audit_is_delete` (`is_delete`)
) ENGINE=InnoDB AUTO_INCREMENT=111425 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-审核记录表';

-- ----------------------------
