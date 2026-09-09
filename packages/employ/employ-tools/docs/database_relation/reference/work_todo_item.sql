-- Table structure for work_todo_item
-- ----------------------------
DROP TABLE IF EXISTS `work_todo_item`;
CREATE TABLE `work_todo_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(128) NOT NULL COMMENT '待办事项名称',
  `code` varchar(64) NOT NULL COMMENT '唯一标识（英文）',
  `sort_value` int(11) NOT NULL DEFAULT 999 COMMENT '排序值，越小越靠前',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除：0未删除，1已删除',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='待办事项表';

-- ----------------------------
