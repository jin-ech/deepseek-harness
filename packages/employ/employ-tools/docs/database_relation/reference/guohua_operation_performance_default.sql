-- Table structure for guohua_operation_performance_default
-- ----------------------------
DROP TABLE IF EXISTS `guohua_operation_performance_default`;
CREATE TABLE `guohua_operation_performance_default` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `user_id` varchar(64) NOT NULL COMMENT '企业微信用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `department_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `department_name` varchar(100) DEFAULT NULL COMMENT '所属部门名称',
  `salary_standard` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '工资标准 (H列)-默认值',
  `target_headcount` int(11) NOT NULL DEFAULT 0 COMMENT '标准运营人数-上限 (I列)-默认值',
  `headcount_lower_limit` int(11) NOT NULL DEFAULT 0 COMMENT '运营人数差额起算下限-默认值',
  `headcount_discount_rate` decimal(5,4) NOT NULL DEFAULT 1.0000 COMMENT '人数折算系数-默认值',
  `service_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '服务单价-元/人 (J列)-默认值',
  `checkin_target_rate` decimal(5,4) NOT NULL DEFAULT 0.9500 COMMENT '打卡完成率目标值-默认值',
  `photo_target_rate` decimal(5,4) NOT NULL DEFAULT 0.9500 COMMENT '照片上传完成率目标值-默认值',
  `is_delete` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除 0:否 1:是',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_operation_default_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='运营人员绩效考核默认配置表';

-- ----------------------------
