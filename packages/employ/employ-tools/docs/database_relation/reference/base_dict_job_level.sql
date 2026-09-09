-- Table structure for base_dict_job_level
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_job_level`;
CREATE TABLE `base_dict_job_level` (
  `job_level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '岗位职级id',
  `job_level_name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '岗位职级名称',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`job_level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='民族表';

-- ----------------------------
