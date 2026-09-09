-- Table structure for guohua_call_center_notice
-- ----------------------------
DROP TABLE IF EXISTS `guohua_call_center_notice`;
CREATE TABLE `guohua_call_center_notice` (
  `notice_id` varchar(64) NOT NULL COMMENT '呼叫id',
  `eventType` varchar(64) NOT NULL DEFAULT '' COMMENT '状态标识',
  `sessionId` varchar(64) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `timeStamp` varchar(64) NOT NULL DEFAULT '' COMMENT '呼叫时间戳',
  `caller` varchar(64) NOT NULL COMMENT '主叫号码',
  `called` varchar(64) NOT NULL DEFAULT '' COMMENT '被叫号码',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='外呼信息表信息';

-- ----------------------------
