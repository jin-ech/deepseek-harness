-- Table structure for persons_education
-- ----------------------------
DROP TABLE IF EXISTS `persons_education`;
CREATE TABLE `persons_education` (
  `persons_education_id` varchar(64) NOT NULL COMMENT '残疾人学历id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `education_school` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `major` varchar(255) NOT NULL DEFAULT '' COMMENT '专业',
  `start_date` varchar(64) NOT NULL DEFAULT '' COMMENT '就学开始日期',
  `end_date` varchar(64) NOT NULL DEFAULT '' COMMENT '就学结束日期',
  `is_graduation` varchar(10) NOT NULL DEFAULT '' COMMENT '是否毕业 1毕业 2 肄业 0：未填写',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`persons_education_id`) USING BTREE,
  KEY `education_persons_id` (`persons_id`) USING BTREE COMMENT '成员索引id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人学历表';

-- ----------------------------
