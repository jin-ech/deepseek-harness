-- Table structure for base_dict_job
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_job`;
CREATE TABLE `base_dict_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位名称',
  `job_mark_name` varchar(255) NOT NULL DEFAULT '' COMMENT '岗位标识名',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-工作岗位字典表';

-- ----------------------------
