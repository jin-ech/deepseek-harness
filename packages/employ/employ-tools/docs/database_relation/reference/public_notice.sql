-- Table structure for public_notice
-- ----------------------------
DROP TABLE IF EXISTS `public_notice`;
CREATE TABLE `public_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID（主键）',
  `title` varchar(255) NOT NULL COMMENT '公告标题',
  `content` longtext DEFAULT NULL COMMENT '公告内容（富文本/纯文本）',
  `type` tinyint(4) DEFAULT 1 COMMENT '公告类型：1=公告 2=紧急公告 3=系统公告',
  `status` tinyint(4) DEFAULT 1 COMMENT '状态：0=未发布 1=已发布 2=已下架',
  `sort` int(11) DEFAULT 0 COMMENT '排序号（数字越大越靠前）',
  `publisher` varchar(64) DEFAULT NULL COMMENT '发布人姓名/账号',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `trigger_position` tinyint(4) DEFAULT NULL COMMENT '触发位置：1=打卡 2=上传工作照片',
  `is_force_read` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否强制阅读：0=否 1=是',
  `is_voice_play` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否语音播放：0=否 1=是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='公共公告表';

-- ----------------------------
