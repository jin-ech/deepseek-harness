-- Table structure for guohua_seal
-- ----------------------------
DROP TABLE IF EXISTS `guohua_seal`;
CREATE TABLE `guohua_seal` (
  `seal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用章申请id',
  `salary_id` int(11) DEFAULT NULL COMMENT '薪资账单id',
  `account_id` int(11) DEFAULT NULL COMMENT '用印单位id',
  `seal_type` varchar(64) DEFAULT NULL COMMENT '印章类型 1公章 2合同章 3法人章 4其他',
  `seal_reason` varchar(255) DEFAULT NULL COMMENT '用印事由',
  `seal_date` date DEFAULT NULL COMMENT '用印日期',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_num` int(11) DEFAULT NULL COMMENT '文件份数',
  `sp_no` varchar(255) DEFAULT NULL COMMENT '审批编号',
  `userid` varchar(64) DEFAULT NULL COMMENT '申请人id',
  `department_id` int(11) DEFAULT NULL COMMENT '子部门id',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门id',
  `sp_status` tinyint(4) DEFAULT 1 COMMENT '审批状态',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`seal_id`) USING BTREE,
  KEY `index_customer_id` (`salary_id`) USING BTREE,
  KEY `index_sp_status` (`sp_status`,`is_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1284 DEFAULT CHARSET=utf8mb4 COMMENT='用印申请信息表';

-- ----------------------------
