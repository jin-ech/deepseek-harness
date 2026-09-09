-- Table structure for guohua_store_type_work_content
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_type_work_content`;
CREATE TABLE `guohua_store_type_work_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `store_type` int(11) NOT NULL COMMENT '基地类型（关联 base_dict_store_type.store_type）',
  `work_position_content_id` bigint(20) NOT NULL COMMENT '工作内容ID（关联 guohua_work_position_content.id）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态：1启用 0停用',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_type_work_content` (`store_type`,`work_position_content_id`),
  KEY `idx_work_position_content_id` (`work_position_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='基地类型工作内容分配表';

-- ----------------------------
