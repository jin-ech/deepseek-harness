-- Table structure for guohua_notice_type_dic
-- ----------------------------
DROP TABLE IF EXISTS `guohua_notice_type_dic`;
CREATE TABLE `guohua_notice_type_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `code` varchar(255) DEFAULT NULL COMMENT '类型code',
  `type_name` varchar(255) DEFAULT NULL COMMENT '事项具体名称',
  `mongo_table_name` varchar(255) DEFAULT NULL COMMENT '对应的Mongodb数据表名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_delete` int(11) DEFAULT 1 COMMENT '是否已删除',
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '元数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='检查事项通知类型字典表';

-- ----------------------------
