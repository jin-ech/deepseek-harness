-- Table structure for persons_performance
-- ----------------------------
DROP TABLE IF EXISTS `persons_performance`;
CREATE TABLE `persons_performance` (
  `performance_id` int(11) NOT NULL,
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '人员ID',
  `month` varchar(255) NOT NULL DEFAULT '' COMMENT '所属月份',
  `attendance` varchar(64) NOT NULL DEFAULT '' COMMENT '考勤情况 1:优秀 2:不合格',
  `work_done` varchar(64) NOT NULL DEFAULT '' COMMENT '工作完成情况 1:优秀 2:合格 3:不合格',
  `coordination` varchar(64) NOT NULL DEFAULT '' COMMENT '工作配合程度 1:优秀 2:合格 3:不合格',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`performance_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人员绩效评价表';

-- ----------------------------
