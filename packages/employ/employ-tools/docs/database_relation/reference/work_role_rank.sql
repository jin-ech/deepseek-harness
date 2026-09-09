-- Table structure for work_role_rank
-- ----------------------------
DROP TABLE IF EXISTS `work_role_rank`;
CREATE TABLE `work_role_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_role_id` varchar(50) NOT NULL COMMENT '角色id',
  `rank_id` int(11) NOT NULL COMMENT '排行id',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '删除状态 1： 未删除 0：已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='业务板块字典表';

-- ----------------------------
