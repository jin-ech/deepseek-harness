-- Table structure for rel_ens_activity_persons_collect
-- ----------------------------
DROP TABLE IF EXISTS `rel_ens_activity_persons_collect`;
CREATE TABLE `rel_ens_activity_persons_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动id',
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='助益行志愿者活动收藏表';

-- ----------------------------
