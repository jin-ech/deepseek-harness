-- Table structure for guohua_daily_department_user_stats
-- ----------------------------
DROP TABLE IF EXISTS `guohua_daily_department_user_stats`;
CREATE TABLE `guohua_daily_department_user_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL COMMENT '统计日期',
  `department_id` int(11) NOT NULL COMMENT '部门ID',
  `department_name` varchar(100) DEFAULT '' COMMENT '部门名称',
  `userid` varchar(50) NOT NULL COMMENT '负责人ID',
  `user_name` varchar(100) DEFAULT '' COMMENT '负责人姓名',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '基地ID',
  `store_name` varchar(200) DEFAULT '' COMMENT '基地名称',
  `area_name` varchar(255) DEFAULT '' COMMENT '基地地区',
  `total_num` int(11) DEFAULT 0 COMMENT '在职人数',
  `bind_num` int(11) DEFAULT 0 COMMENT '绑定人数',
  `not_bind_num` int(11) DEFAULT 0 COMMENT '未绑定人数',
  `photo_num` int(11) DEFAULT 0 COMMENT '照片上传人数',
  `business_photo_num` int(11) DEFAULT 0 COMMENT '商务照片人数',
  `success_photo_num` int(11) DEFAULT 0 COMMENT '审核通过照片人数',
  `photo_num_one` int(11) DEFAULT 0 COMMENT '公益性劳动照片',
  `photo_num_two` int(11) DEFAULT 0 COMMENT '职业性劳动照片',
  `check_num` int(11) DEFAULT 0 COMMENT '打卡人数',
  `customer_num` int(11) DEFAULT 0 COMMENT '客户数',
  `store_num` int(11) DEFAULT 0 COMMENT '基地数',
  `add_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_date_dept_user` (`stat_date`,`department_id`,`userid`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=348132 DEFAULT CHARSET=utf8mb4 COMMENT='部门负责人每日统计快照';

-- ----------------------------
