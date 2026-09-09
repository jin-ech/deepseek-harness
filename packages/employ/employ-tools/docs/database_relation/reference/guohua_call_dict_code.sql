-- Table structure for guohua_call_dict_code
-- ----------------------------
DROP TABLE IF EXISTS `guohua_call_dict_code`;
CREATE TABLE `guohua_call_dict_code` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code_value` varchar(64) NOT NULL DEFAULT '' COMMENT '原因值',
  `code_desc` varchar(64) NOT NULL DEFAULT '' COMMENT '原因描述',
  `is_delete` varchar(64) NOT NULL DEFAULT '1' COMMENT '1 未删除 0已删除',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='外呼错误信息码';

-- ----------------------------
