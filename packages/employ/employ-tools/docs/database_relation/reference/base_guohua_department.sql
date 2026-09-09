-- Table structure for base_guohua_department
-- ----------------------------
DROP TABLE IF EXISTS `base_guohua_department`;
CREATE TABLE `base_guohua_department` (
  `department_id` int(11) NOT NULL COMMENT '部门ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parentid` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `department_leader` varchar(255) NOT NULL DEFAULT '' COMMENT '部门领导ID',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `other_name` varchar(255) NOT NULL DEFAULT '' COMMENT '别名',
  `department_type` varchar(255) NOT NULL DEFAULT '' COMMENT '1销售  2运营  3康复',
  `department_level` varchar(255) NOT NULL DEFAULT '' COMMENT '级别',
  `previous_name` varchar(255) DEFAULT NULL COMMENT '曾用名',
  PRIMARY KEY (`department_id`) USING BTREE,
  KEY `_index_name` (`name`) USING BTREE,
  KEY `_index_department_id` (`department_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='国华企业微信部门表';

-- ----------------------------
