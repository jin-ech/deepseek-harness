-- Table structure for base_dict_budget
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_budget`;
CREATE TABLE `base_dict_budget` (
  `budget_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预算id',
  `budget_year` varchar(255) DEFAULT NULL COMMENT '预算年份',
  `cost_type_id` int(11) DEFAULT NULL COMMENT '费用类别id',
  `budget_amount` decimal(11,2) DEFAULT NULL COMMENT '预算金额',
  `main_department_id` int(11) DEFAULT NULL COMMENT '主部门id',
  `department_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `add_userid` varchar(255) DEFAULT NULL COMMENT '添加人id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_userid` varchar(255) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`budget_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='年预算表';

-- ----------------------------
