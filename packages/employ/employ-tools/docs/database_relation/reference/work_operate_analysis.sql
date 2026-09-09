-- Table structure for work_operate_analysis
-- ----------------------------
DROP TABLE IF EXISTS `work_operate_analysis`;
CREATE TABLE `work_operate_analysis` (
  `summary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '总结ID',
  `analysis_name` varchar(255) DEFAULT NULL COMMENT '分析维度名称',
  `analysis_month` varchar(10) DEFAULT NULL COMMENT '分析年月',
  `summary_content` text DEFAULT NULL COMMENT '总结与发现内容',
  `risk_level` varchar(255) DEFAULT NULL COMMENT '风险等级 高风险 中风险 低风险',
  `modify_summary_content` text DEFAULT NULL COMMENT '修改后的 总结与发现内容',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `modify_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '修改时间',
  `user_id` varchar(36) DEFAULT NULL COMMENT '修改人ID',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '是否删除 1未删除 0：已删除',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='经营分析总结与建议';

-- ----------------------------
