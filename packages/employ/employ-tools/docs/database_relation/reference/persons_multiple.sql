-- Table structure for persons_multiple
-- ----------------------------
DROP TABLE IF EXISTS `persons_multiple`;
CREATE TABLE `persons_multiple` (
  `persons_multiple_id` varchar(64) NOT NULL COMMENT '多重残疾id',
  `persons_id` varchar(64) NOT NULL COMMENT '成员id',
  `id_number` varchar(64) NOT NULL DEFAULT '' COMMENT '身份证号',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `disabled_type_id` tinyint(4) NOT NULL DEFAULT 0 COMMENT '残疾类型',
  `disabled_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '残疾等级',
  PRIMARY KEY (`persons_multiple_id`) USING BTREE,
  KEY `_index_persons_id` (`persons_id`) USING BTREE,
  KEY `_index_id_number` (`id_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='成员多重残疾表';

-- ----------------------------
