-- Table structure for guohua_rel_persons_handbook
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_persons_handbook`;
CREATE TABLE `guohua_rel_persons_handbook` (
  `handbook_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '劳动手册id',
  `work_id` int(11) DEFAULT NULL COMMENT '就职信息id',
  `handbook_type` tinyint(4) DEFAULT NULL COMMENT '劳动手册状态  0:客户未交接 1:客户已交接 2客户已返回',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '添加人',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`handbook_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COMMENT='人员劳动手册记录';

-- ----------------------------
