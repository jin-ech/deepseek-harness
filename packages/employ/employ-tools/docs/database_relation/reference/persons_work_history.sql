-- Table structure for persons_work_history
-- ----------------------------
DROP TABLE IF EXISTS `persons_work_history`;
CREATE TABLE `persons_work_history` (
  `history_id` int(64) NOT NULL AUTO_INCREMENT COMMENT '历史记录id',
  `date` varchar(64) NOT NULL DEFAULT '' COMMENT '日期',
  `day_in` int(11) NOT NULL DEFAULT 0 COMMENT '当日入职',
  `day_off` int(11) NOT NULL DEFAULT 0 COMMENT '当日离职',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `job_num` int(11) NOT NULL DEFAULT 0 COMMENT '在职人数',
  `clock_in` int(11) NOT NULL DEFAULT 0 COMMENT '打卡人数',
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8mb4 COMMENT='残疾人工作经历表-就职记录表';

-- ----------------------------
