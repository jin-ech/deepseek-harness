-- Table structure for kpi_sales_commission_change_request
-- ----------------------------
DROP TABLE IF EXISTS `kpi_sales_commission_change_request`;
CREATE TABLE `kpi_sales_commission_change_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sp_no` varchar(32) NOT NULL COMMENT '单号 CR-YYYYMMDD-序号',
  `detail_id` bigint(20) NOT NULL COMMENT 'kpi_sales_commission_monthly_detail.id',
  `stat_month` char(7) NOT NULL COMMENT '冗余，便于列表筛选',
  `sp_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1待审 2通过 3驳回 4撤回 5作废',
  `submit_userid` varchar(64) NOT NULL COMMENT '申请人',
  `submit_user_name` varchar(50) DEFAULT '' COMMENT '申请人姓名',
  `submit_time` datetime NOT NULL COMMENT '申请时间',
  `submit_reason` varchar(500) DEFAULT '' COMMENT '申请说明',
  `approve_userid` varchar(64) DEFAULT NULL,
  `approve_user_name` varchar(50) DEFAULT NULL,
  `approve_time` datetime DEFAULT NULL,
  `approve_comment` varchar(500) DEFAULT '',
  `patch_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '仅含 _DETAIL_RECALC_PATCH_KEYS 内的变更',
  `proof_file_urls` longtext DEFAULT NULL COMMENT '销售提交的证明文件URL JSON',
  `before_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '提交时明细快照（展示+重算输入）',
  `after_preview` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '提交时预演重算结果',
  `applied` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=已落库',
  `apply_time` datetime DEFAULT NULL,
  `apply_error` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='销售提成修改审批记录表';

-- ----------------------------
