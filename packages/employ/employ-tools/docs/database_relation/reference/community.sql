-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `community_id` varchar(64) NOT NULL COMMENT '社群id',
  `ins_id` int(11) NOT NULL COMMENT '机构id',
  `homeland_id` varchar(64) NOT NULL DEFAULT '' COMMENT '家园id',
  `community_name` varchar(255) NOT NULL DEFAULT '' COMMENT '社群名称',
  `community_num` int(11) NOT NULL DEFAULT 0 COMMENT '社群人数',
  `person_charge` varchar(255) NOT NULL DEFAULT '' COMMENT '负责人',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `create_date` date DEFAULT NULL COMMENT '建群时间',
  `remarks` varchar(255) NOT NULL COMMENT '备注',
  `is_delete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`community_id`) USING BTREE,
  KEY `_index_name` (`community_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='机构社群表';

-- ----------------------------
