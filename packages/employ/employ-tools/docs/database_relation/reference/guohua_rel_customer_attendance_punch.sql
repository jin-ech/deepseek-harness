-- Table structure for guohua_rel_customer_attendance_punch
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_attendance_punch`;
CREATE TABLE `guohua_rel_customer_attendance_punch` (
  `punch_id` varchar(64) NOT NULL DEFAULT '' COMMENT '打卡id',
  `attendance_id` varchar(64) DEFAULT NULL COMMENT '外勤申请id',
  `punch_type` varchar(64) DEFAULT NULL COMMENT '打卡类型 1签到 2签退',
  `punch_address` varchar(255) DEFAULT NULL COMMENT '打卡地址',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '打卡时间',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '打卡人',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`punch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户外勤打卡记录信息表';

-- ----------------------------
