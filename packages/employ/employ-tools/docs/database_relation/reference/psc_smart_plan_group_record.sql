-- Table structure for psc_smart_plan_group_record
-- ----------------------------
DROP TABLE IF EXISTS `psc_smart_plan_group_record`;
CREATE TABLE `psc_smart_plan_group_record` (
  `group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '集团方案记录ID',
  `group_no` varchar(64) NOT NULL DEFAULT '' COMMENT '集团方案编号 GHG{YYYYMMDD}-{6位随机}',
  `group_title` varchar(255) NOT NULL DEFAULT '' COMMENT '方案标题',
  `group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '集团名称',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户ID，没有则为0',
  `region_count` int(11) NOT NULL DEFAULT 0 COMMENT '区域(分子公司)总数',
  `success_region_count` int(11) NOT NULL DEFAULT 0 COMMENT '成功生成区域数',
  `failed_region_count` int(11) NOT NULL DEFAULT 0 COMMENT '失败区域数',
  `total_employee_count` int(11) NOT NULL DEFAULT 0 COMMENT '合计在职职工人数',
  `total_plan_light_count` int(11) NOT NULL DEFAULT 0 COMMENT '合计拟安置轻残人数',
  `total_plan_heavy_count` int(11) NOT NULL DEFAULT 0 COMMENT '合计拟安置重残人数',
  `total_baseline_deposit` decimal(16,2) NOT NULL DEFAULT 0.00 COMMENT '合计基准残保金',
  `total_diff_deposit` decimal(16,2) NOT NULL DEFAULT 0.00 COMMENT '合计差额残保金',
  `total_cost` decimal(16,2) NOT NULL DEFAULT 0.00 COMMENT '合计支出总计',
  `total_saving` decimal(16,2) NOT NULL DEFAULT 0.00 COMMENT '合计全年节约成本',
  `total_saving_rate` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '集团整体节约率(净节省/基准残保金)',
  `html_url` varchar(512) NOT NULL DEFAULT '' COMMENT '汇总HTML OSS地址',
  `pdf_url` varchar(512) NOT NULL DEFAULT '' COMMENT '汇总PDF OSS地址',
  `input_json` mediumtext DEFAULT NULL COMMENT '集团输入快照(通用信息+regions)',
  `result_json` mediumtext DEFAULT NULL COMMENT '汇总结果快照(不含HTML正文)',
  `metrics_json` mediumtext DEFAULT NULL COMMENT '汇总指标数据JSON',
  `generation_trace_json` mediumtext DEFAULT NULL COMMENT 'LLM生成过程/trace',
  `generate_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0生成中 1成功 2部分失败 3全部失败',
  `error_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '失败原因',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '生成用户ID',
  `add_username` varchar(128) NOT NULL DEFAULT '' COMMENT '生成用户名称',
  `session_id` varchar(128) NOT NULL DEFAULT '' COMMENT '会话ID',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `uniq_group_no` (`group_no`),
  KEY `idx_user_time` (`add_userid`,`add_time`),
  KEY `idx_group_name_time` (`group_name`,`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='PSC集团(全国性客户)智能方案汇总记录表';

-- ----------------------------
