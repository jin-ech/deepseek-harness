-- Table structure for guohua_rel_customer_attendance
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_attendance`;
CREATE TABLE `guohua_rel_customer_attendance` (
  `attendance_id` varchar(64) NOT NULL DEFAULT '' COMMENT '外勤申请id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `customer_address` varchar(255) DEFAULT NULL COMMENT '客户地址',
  `visit_userids` varchar(255) DEFAULT NULL COMMENT '外出人员id',
  `defender_userids` varchar(255) DEFAULT NULL COMMENT '协防人人员id',
  `visit_start_time` varchar(64) DEFAULT NULL COMMENT '拜访开始时间',
  `visit_end_time` varchar(64) DEFAULT NULL COMMENT '拜访结束时间',
  `visit_content` text DEFAULT NULL COMMENT '拜访内容',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改时间',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门id',
  `department_id` int(11) DEFAULT NULL COMMENT '子部门id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`attendance_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户外勤申请信息表';

-- ----------------------------
