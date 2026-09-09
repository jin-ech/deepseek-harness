-- Table structure for base_guohua_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_guohua_user_role`;
CREATE TABLE `base_guohua_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '' COMMENT '用户id',
  `system_id` varchar(64) NOT NULL DEFAULT '' COMMENT '系统id',
  `permission_role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色id',
  `visible_department` varchar(255) DEFAULT NULL COMMENT '可见部门id',
  `visible_userid` varchar(255) DEFAULT NULL COMMENT '可见人员id',
  `permission` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '其他权限\n\n部门预算  \n新增 budget_add\n删除 budget_delete\n\n礼品\n新增 gift_add\n编辑 gift_edit\n分配 gift_assign\n申请 gift_claim',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100172 DEFAULT CHARSET=utf8mb4 COMMENT='员工系统角色id';

-- ----------------------------
