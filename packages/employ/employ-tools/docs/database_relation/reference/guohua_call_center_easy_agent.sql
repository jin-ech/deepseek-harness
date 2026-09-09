-- Table structure for guohua_call_center_easy_agent
-- ----------------------------
DROP TABLE IF EXISTS `guohua_call_center_easy_agent`;
CREATE TABLE `guohua_call_center_easy_agent` (
  `agent_id` varchar(64) NOT NULL COMMENT '坐席id',
  `_id` varchar(64) DEFAULT NULL COMMENT '座席的id',
  `userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `accountId` varchar(64) DEFAULT NULL COMMENT '账户编号\n',
  `queueNumber` varchar(64) DEFAULT NULL COMMENT '服务组编号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，1:启用，0:停用',
  `name` varchar(64) DEFAULT NULL COMMENT '服务组名称\n',
  `strategy` varchar(64) DEFAULT NULL COMMENT '分配策略，rrmemory：轮选, random：随机, order：顺序, skill：技能值, maxFreeTime：最长空闲时间, leastAnswerTimes：最小接听次数, longestAnswerTimes: 最大接听时长"',
  `maxWaitLimit` int(11) DEFAULT NULL COMMENT '最大排队数\n',
  `waitTime` int(11) DEFAULT NULL COMMENT '排队时长\n排队时长\n',
  `broadcastMember` tinyint(4) DEFAULT NULL COMMENT '是否拨号工号\n',
  PRIMARY KEY (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='极简外呼坐席表';

-- ----------------------------
