-- Table structure for guohua_work_position_content
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_position_content`;
CREATE TABLE `guohua_work_position_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(200) NOT NULL COMMENT '工作内容名称',
  `remark` varchar(500) DEFAULT NULL COMMENT '说明（如：河道巡护、森林防火）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1启用 0停用',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `work_type_id` int(11) DEFAULT 0,
  `requirements` text DEFAULT NULL COMMENT '岗位/内容执行要求（场景、条件、行为、拍摄等约束集合）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='岗位工作内容表';

-- ----------------------------
