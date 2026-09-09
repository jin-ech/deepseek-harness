-- Table structure for guohua_company_job
-- ----------------------------
DROP TABLE IF EXISTS `guohua_company_job`;
CREATE TABLE `guohua_company_job` (
  `company_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '企业名称',
  `employ_type_id` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位类型ID',
  `expect_entry_time` varchar(255) NOT NULL DEFAULT '' COMMENT '期望入职时间',
  `company_details` text NOT NULL COMMENT '企业详情',
  `job_name` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `job_introduction` text NOT NULL COMMENT '岗位介绍',
  `job_requirements` text NOT NULL COMMENT '岗位要求',
  `job_contacts` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位联系电话',
  `demand_num` int(11) NOT NULL DEFAULT 1 COMMENT '岗位所需人数',
  `recruit_status` varchar(64) DEFAULT '1' COMMENT '招聘状态 1:未开始 2:招聘中 3:已完成 4:已关闭',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '添加人微信ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0 已删除',
  `is_push` tinyint(4) NOT NULL DEFAULT 1 COMMENT '发布状态 1 已发布  2未发布',
  `customer_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '客户ID',
  PRIMARY KEY (`company_job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-企业工作岗位信息表';

-- ----------------------------
