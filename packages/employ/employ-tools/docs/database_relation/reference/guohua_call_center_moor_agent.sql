-- Table structure for guohua_call_center_moor_agent
-- ----------------------------
DROP TABLE IF EXISTS `guohua_call_center_moor_agent`;
CREATE TABLE `guohua_call_center_moor_agent` (
  `agent_id` varchar(64) NOT NULL COMMENT '坐席id',
  `_id` varchar(64) DEFAULT NULL COMMENT '座席的id',
  `userid` varchar(64) DEFAULT NULL COMMENT '用户id',
  `displayName` varchar(64) DEFAULT NULL COMMENT '坐席姓名',
  `exten` varchar(64) DEFAULT NULL COMMENT '座席工号',
  `loginName` varchar(64) DEFAULT NULL COMMENT '座席登陆呼叫中心用户名，都与工号一致',
  `password` varchar(64) DEFAULT NULL COMMENT '座席登陆呼叫中心密码',
  `pbx` varchar(64) DEFAULT NULL COMMENT '座席所属的pbx',
  `mobile` varchar(64) DEFAULT NULL COMMENT '座席绑定的手机\n',
  `email` varchar(64) DEFAULT NULL COMMENT '座席绑定的邮箱\n',
  `status` varchar(64) DEFAULT NULL COMMENT '座席状态，启用或者停用（enable/disable）\n',
  `uversion` varchar(64) DEFAULT NULL COMMENT '座席版本，标准版/外呼版/监控版（enterprise/outcall/monitor）',
  `callerIDNum` varchar(64) DEFAULT NULL COMMENT '座席外呼透传号，如果此字段没有，此座席外呼时使用，账号总透传号。可以用此字段关联座席与服务号关系\n',
  `role` varchar(64) DEFAULT NULL COMMENT '此座席拥有的角色\n',
  `parentId` varchar(64) DEFAULT NULL COMMENT '座席的上级座席ID\n',
  `AutoBusyTime` varchar(64) DEFAULT NULL COMMENT '后处理时长\n',
  `type` varchar(64) DEFAULT NULL COMMENT '是否为监控座席（agent/manager）\n',
  `nickName` varchar(64) DEFAULT NULL COMMENT '昵称',
  `maxImDealCount` varchar(64) DEFAULT NULL COMMENT '最大同时接待会话数\n',
  `minImDealCount` varchar(64) DEFAULT NULL COMMENT '最小同时接待会话数\n',
  `imClaimStatus` varchar(64) DEFAULT NULL COMMENT '在线咨询自动领取\n',
  `deptId` varchar(255) DEFAULT NULL,
  `department` varchar(64) DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='七陌外呼坐席表';

-- ----------------------------
