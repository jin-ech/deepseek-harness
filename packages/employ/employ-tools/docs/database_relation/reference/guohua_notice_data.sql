-- Table structure for guohua_notice_data
-- ----------------------------
DROP TABLE IF EXISTS `guohua_notice_data`;
CREATE TABLE `guohua_notice_data` (
  `id` int(11) NOT NULL COMMENT '事项ID',
  `type_one_id` int(11) NOT NULL COMMENT '事项一级类型ID',
  `type_two_id` int(11) NOT NULL COMMENT '事项二级类型ID',
  `type_three_id` int(11) NOT NULL COMMENT '事项三级类型ID',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `content` varchar(255) DEFAULT NULL COMMENT '事项详细内容',
  PRIMARY KEY (`id`,`customer_id`,`type_one_id`,`type_two_id`,`type_three_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='检查事项数据表';

-- ----------------------------
