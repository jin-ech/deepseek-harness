-- Table structure for market_feedback
-- ----------------------------
DROP TABLE IF EXISTS `market_feedback`;
CREATE TABLE `market_feedback` (
  `feedback_id` bigint(20) NOT NULL COMMENT '主键（应用层 get_unique_num_id）',
  `market_user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '提交人 market_user_id',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '提交人手机号',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '反馈名称/标题',
  `description` text DEFAULT NULL COMMENT '反馈描述',
  `files` text DEFAULT NULL COMMENT '附件文件 URL，JSON 数组字符串',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1有效 0已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`feedback_id`),
  KEY `idx_market_feedback_user` (`market_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='营销小程序意见反馈表';

-- ----------------------------
