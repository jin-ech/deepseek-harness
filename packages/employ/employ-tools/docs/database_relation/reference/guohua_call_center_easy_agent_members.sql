-- Table structure for guohua_call_center_easy_agent_members
-- ----------------------------
DROP TABLE IF EXISTS `guohua_call_center_easy_agent_members`;
CREATE TABLE `guohua_call_center_easy_agent_members` (
  `members_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '坐席id',
  `_id` varchar(64) DEFAULT NULL COMMENT '座席的id',
  `userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `agentNumber` varchar(64) DEFAULT NULL COMMENT '坐席编号',
  `weight` varchar(64) DEFAULT NULL COMMENT '坐席优先级',
  `update_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`members_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='极简外呼坐席明细表';

-- ----------------------------
