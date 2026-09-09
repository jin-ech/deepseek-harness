-- Table structure for work_todo_item_role_bak
-- ----------------------------
DROP TABLE IF EXISTS `work_todo_item_role_bak`;
CREATE TABLE `work_todo_item_role_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `todo_item_id` int(11) NOT NULL COMMENT '关联待办事项ID',
  `permission_role_id` varchar(64) NOT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_todo_item_id` (`todo_item_id`),
  KEY `idx_permission_role_id` (`permission_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='角色-待办事项关联表';

-- ----------------------------
