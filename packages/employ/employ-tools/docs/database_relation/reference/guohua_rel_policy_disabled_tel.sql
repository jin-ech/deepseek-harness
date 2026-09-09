-- Table structure for guohua_rel_policy_disabled_tel
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_policy_disabled_tel`;
CREATE TABLE `guohua_rel_policy_disabled_tel` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `policy_id` int(11) DEFAULT NULL COMMENT '政策id',
  `enter_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `enter_tel` varchar(255) DEFAULT NULL COMMENT '单位电话',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1968 DEFAULT CHARSET=utf8mb4 COMMENT='就业政策残联通讯录表';

-- ----------------------------
