-- Table structure for guohua_call_center
-- ----------------------------
DROP TABLE IF EXISTS `guohua_call_center`;
CREATE TABLE `guohua_call_center` (
  `call_id` varchar(64) NOT NULL COMMENT '呼叫id',
  `maxid` varchar(64) DEFAULT NULL,
  `sessionId` varchar(64) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `event_type` varchar(64) NOT NULL DEFAULT '' COMMENT '状态标识',
  `time_stamp` varchar(64) NOT NULL DEFAULT '' COMMENT '呼叫时间戳',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '人员id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `bindNum` varchar(64) NOT NULL DEFAULT '' COMMENT '业务号码',
  `calleeNum` varchar(64) NOT NULL COMMENT '主叫号码',
  `fwdDstNum` varchar(64) NOT NULL DEFAULT '' COMMENT '被叫号码',
  `fwdDisplayNum` varchar(64) NOT NULL DEFAULT '' COMMENT '转接号码',
  `fwdStartTime` varchar(64) NOT NULL DEFAULT '' COMMENT '主叫号码呼叫开始时间',
  `fwdAlertingTime` varchar(64) NOT NULL DEFAULT '' COMMENT '主叫号码振铃时间',
  `fwdAnswerTime` varchar(64) NOT NULL DEFAULT '' COMMENT '主叫号码应答时间',
  `callEndTime` varchar(64) NOT NULL DEFAULT '' COMMENT '主叫号码呼叫结束时间',
  `failTime` varchar(64) NOT NULL DEFAULT '' COMMENT '呼入呼出的失败时间',
  `callOutStartTime` varchar(64) NOT NULL DEFAULT '' COMMENT '被叫号码呼叫开始时间',
  `callOutAlertingTime` varchar(64) NOT NULL DEFAULT '' COMMENT '被叫号码振铃时间',
  `callOutAnswerTime` varchar(64) NOT NULL DEFAULT '' COMMENT '被叫号码应答时间',
  `billsec` int(11) NOT NULL DEFAULT 0 COMMENT '通话时长',
  `recordFlag` varchar(64) NOT NULL DEFAULT '' COMMENT '录音标识 0 未录音 1已录音',
  `recordStartTime` varchar(64) NOT NULL DEFAULT '' COMMENT '录音开始时间',
  `recordFileDownloadUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '录音文件下载地址',
  `fwdUnaswRsn` varchar(64) NOT NULL DEFAULT '' COMMENT '原因值附录1',
  `ulFailReason` varchar(64) NOT NULL DEFAULT '' COMMENT '拆线点附录2、3',
  `direction` varchar(64) NOT NULL DEFAULT '' COMMENT '预留参数',
  `update_time` datetime DEFAULT current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1否 0是',
  PRIMARY KEY (`call_id`) USING BTREE,
  KEY `index_sessionid` (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='外呼信息表';

-- ----------------------------
