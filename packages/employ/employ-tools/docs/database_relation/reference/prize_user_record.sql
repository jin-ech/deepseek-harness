-- Table structure for prize_user_record
-- ----------------------------
DROP TABLE IF EXISTS `prize_user_record`;
CREATE TABLE `prize_user_record` (
  `prize_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '抽奖记录id',
  `userid` varchar(50) NOT NULL DEFAULT '' COMMENT '人员id',
  `prize_id` int(11) NOT NULL COMMENT '奖项id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`prize_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COMMENT='抽奖记录表';

-- ----------------------------
