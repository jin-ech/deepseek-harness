-- Table structure for guohua_compare_data_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_compare_data_log`;
CREATE TABLE `guohua_compare_data_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '确认id',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `persons_name` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `office_status_a` varchar(64) NOT NULL DEFAULT '' COMMENT '就业人员在职状态',
  `office_status_b` varchar(64) NOT NULL DEFAULT '' COMMENT 'ins在职状态',
  `mini_openid_a` varchar(64) NOT NULL DEFAULT '' COMMENT '就业绑定状态',
  `mini_openid_b` varchar(64) NOT NULL DEFAULT '' COMMENT 'ins绑定状态',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期',
  `content` varchar(64) NOT NULL DEFAULT '' COMMENT '错误描述',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT 'persons_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2068 DEFAULT CHARSET=utf8mb4 COMMENT='数据比对日志记录表';

-- ----------------------------
