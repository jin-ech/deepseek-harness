-- Table structure for guohua_rights_protection
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rights_protection`;
CREATE TABLE `guohua_rights_protection` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `rights_protection_id` varchar(36) NOT NULL COMMENT '维权记录ID',
  `persons_id` varchar(36) NOT NULL COMMENT '提交人员ID',
  `persons_name` varchar(50) NOT NULL DEFAULT '' COMMENT '提交人员姓名',
  `complaint_type` tinyint(4) NOT NULL COMMENT '投诉类别：1=被索取费用 2=工资未收到 3=其他 4=未合理安排工作',
  `description` text DEFAULT NULL COMMENT '文字说明',
  `audio_url` varchar(500) NOT NULL DEFAULT '' COMMENT '语音文件地址',
  `video_url` varchar(500) NOT NULL DEFAULT '' COMMENT '视频文件地址',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '联系电话',
  `ins_id` int(11) NOT NULL DEFAULT 0 COMMENT '机构ID',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '处理状态：0=待处理 1=处理中 2=已处理',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `store_id` int(11) DEFAULT NULL COMMENT '基地id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rights_protection_id` (`rights_protection_id`),
  KEY `idx_persons_id` (`persons_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='维权信息记录';

-- ----------------------------
