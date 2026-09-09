-- Table structure for guohua_work_position_type
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_position_type`;
CREATE TABLE `guohua_work_position_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `position_id` bigint(20) NOT NULL COMMENT '所属岗位ID（关联 guohua_work_position.id）',
  `name` varchar(100) NOT NULL COMMENT '工种名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1启用 0停用',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='岗位工种表';

-- ----------------------------
