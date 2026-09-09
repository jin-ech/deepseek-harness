-- Table structure for guohua_ens_persons_recommend_job
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_persons_recommend_job`;
CREATE TABLE `guohua_ens_persons_recommend_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐岗位id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '志愿者ID',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `job_name` varchar(255) DEFAULT NULL COMMENT '岗位名称',
  `job_salary` decimal(10,2) DEFAULT NULL COMMENT '薪资待遇',
  `area_name` varchar(255) DEFAULT NULL COMMENT '所在地区',
  `entry_time` date DEFAULT NULL COMMENT '入职时间',
  `employ_name` varchar(255) DEFAULT NULL COMMENT '员工名称',
  `disabled_type_id` tinyint(4) DEFAULT NULL COMMENT '残疾类别id',
  `disabled_level` tinyint(4) DEFAULT NULL COMMENT '残疾等级 1,2,3,4',
  `education_info` varchar(255) DEFAULT NULL COMMENT '学历（毕业院校）',
  `audit_status` tinyint(4) DEFAULT 0 COMMENT '审核情况 0待审核 1通过 2未通过',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '后台添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行企业用户推荐岗位表';

-- ----------------------------
