-- Table structure for guohua_rel_customer_clue_visit
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_customer_clue_visit`;
CREATE TABLE `guohua_rel_customer_clue_visit` (
  `visit_id` varchar(64) NOT NULL DEFAULT '' COMMENT '拜访id',
  `clue_id` varchar(64) NOT NULL DEFAULT '' COMMENT '销售线索id',
  `visit_userids` varchar(255) DEFAULT NULL COMMENT '外出人员id',
  `visit_time` datetime DEFAULT NULL COMMENT '拜访时间',
  `visit_content` text DEFAULT NULL COMMENT '拜访内容',
  `add_userid` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改时间',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门id',
  `department_id` int(11) DEFAULT NULL COMMENT '子部门id',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`visit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户销售线索拜访记录表';

-- ----------------------------
