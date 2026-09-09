-- Table structure for guohua_rel_mission_claim
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_mission_claim`;
CREATE TABLE `guohua_rel_mission_claim` (
  `claim_id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务id',
  `persons_id` varchar(255) NOT NULL DEFAULT '' COMMENT '人员id',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加日期时间',
  `add_userid` varchar(64) NOT NULL DEFAULT '' COMMENT '认领人id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 2:已删除',
  PRIMARY KEY (`claim_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2532 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-任务认领人';

-- ----------------------------
