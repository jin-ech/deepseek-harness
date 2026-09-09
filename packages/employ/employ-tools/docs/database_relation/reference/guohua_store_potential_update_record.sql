-- Table structure for guohua_store_potential_update_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_potential_update_record`;
CREATE TABLE `guohua_store_potential_update_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `store_id` int(11) NOT NULL COMMENT '基地id，关联guohua_store.store_id',
  `light_potential_num` int(11) NOT NULL DEFAULT 0 COMMENT '轻残潜力人数',
  `weight_potential_num` int(11) NOT NULL DEFAULT 0 COMMENT '重残潜力人数',
  `update_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '修改时间',
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `idx_store_potential_store_time` (`store_id`,`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='基地残疾人潜力人数修改记录表';

-- ----------------------------
