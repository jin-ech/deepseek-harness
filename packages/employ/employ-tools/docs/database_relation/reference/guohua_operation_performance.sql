-- Table structure for guohua_operation_performance
-- ----------------------------
DROP TABLE IF EXISTS `guohua_operation_performance`;
CREATE TABLE `guohua_operation_performance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `stat_month` char(7) NOT NULL COMMENT '考核月份 (YYYY-MM)',
  `user_id` varchar(64) NOT NULL COMMENT '企业微信用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(100) DEFAULT NULL COMMENT '所属部门名称',
  `salary_standard` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '工资标准 (H列)',
  `target_headcount` int(11) NOT NULL DEFAULT 0 COMMENT '标准运营人数-上限 (I列)',
  `headcount_lower_limit` int(11) NOT NULL DEFAULT 0 COMMENT '运营人数差额起算下限-如李宁上限900下限800,800-900之间不扣不奖',
  `headcount_discount_rate` decimal(5,4) NOT NULL DEFAULT 1.0000 COMMENT '人数折算系数-上海按0.75折算,默认1.0不折算',
  `service_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '服务单价-元/人 (J列)',
  `actual_headcount` int(11) NOT NULL DEFAULT 0 COMMENT '实际运营人数 (O列)-系统同步',
  `checkin_count` int(11) NOT NULL DEFAULT 0 COMMENT '打卡人数 (T列)-系统同步',
  `photo_count` int(11) NOT NULL DEFAULT 0 COMMENT '照片上传人数 (X列)-系统同步',
  `delivery_accuracy` decimal(5,4) NOT NULL DEFAULT 1.0000 COMMENT '交付准确率实际值 (AB列) 1=100%',
  `complaint_count` int(11) NOT NULL DEFAULT 0 COMMENT '交付运营投诉次数 (AE列)',
  `extra_performance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '其他工作绩效奖励 (AH列)-手工填写',
  `checkin_target_rate` decimal(5,4) NOT NULL DEFAULT 0.9500 COMMENT '打卡完成率目标值-北京95%/外地80%等',
  `photo_target_rate` decimal(5,4) NOT NULL DEFAULT 0.9500 COMMENT '照片上传完成率目标值-北京95%/外地80%等',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0:否 1:是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_month_user` (`stat_month`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COMMENT='运营人员绩效考核原始数据表';

-- ----------------------------
