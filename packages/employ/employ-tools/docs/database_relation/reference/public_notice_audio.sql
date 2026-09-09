-- Table structure for public_notice_audio
-- ----------------------------
DROP TABLE IF EXISTS `public_notice_audio`;
CREATE TABLE `public_notice_audio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `notice_id` bigint(20) NOT NULL COMMENT '关联公告ID',
  `audio_url` varchar(500) NOT NULL COMMENT '语音文件访问地址',
  `audio_name` varchar(255) DEFAULT NULL COMMENT '语音原文件名',
  `audio_duration` int(11) DEFAULT 0 COMMENT '语音时长(秒)',
  `sort` int(11) DEFAULT 0 COMMENT '播放排序',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_notice_id` (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='公告语音附件表';

-- ----------------------------
