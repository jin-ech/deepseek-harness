-- Table structure for work_todo_item_role
-- ----------------------------
DROP TABLE IF EXISTS `work_todo_item_role`;
CREATE TABLE `work_todo_item_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `todo_item_id` int(11) NOT NULL COMMENT '关联待办事项ID',
  `permission_role_id` varchar(64) NOT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_todo_item_id` (`todo_item_id`) USING BTREE,
  KEY `idx_permission_role_id` (`permission_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COMMENT='角色-待办事项关联表';

-- ----------------------------
