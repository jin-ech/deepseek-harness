-- Table structure for sell_target_data
-- ----------------------------
DROP TABLE IF EXISTS `sell_target_data`;
CREATE TABLE `sell_target_data` (
  `sell_target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '签单目标id',
  `customer_num_target` int(11) NOT NULL DEFAULT 0 COMMENT '客户目标数',
  `phone_num_target` int(11) NOT NULL DEFAULT 0 COMMENT '电话目标',
  `visit_num_target` int(11) NOT NULL DEFAULT 0 COMMENT '拜访目标',
  `sign_amount_target` int(11) NOT NULL DEFAULT 0 COMMENT '签单金额',
  `back_amount_target` int(11) NOT NULL DEFAULT 0 COMMENT '回款金额',
  `week_date_id` varchar(32) NOT NULL DEFAULT '' COMMENT '日期范围',
  `add_time` date NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '添加人',
  `department_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `responsible_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '负责人',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  PRIMARY KEY (`sell_target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='销售完成情况目标表';

-- ----------------------------
