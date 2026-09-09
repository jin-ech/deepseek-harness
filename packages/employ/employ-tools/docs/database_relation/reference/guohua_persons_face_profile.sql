-- Table structure for guohua_persons_face_profile
-- ----------------------------
DROP TABLE IF EXISTS `guohua_persons_face_profile`;
CREATE TABLE `guohua_persons_face_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `persons_id` varchar(64) NOT NULL COMMENT '人员id',
  `face_img_url` varchar(512) DEFAULT NULL COMMENT '人脸图片OSS地址',
  `liveness_score` decimal(5,2) DEFAULT NULL COMMENT '活体检测评分(0-100)',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 1:正常 0:失效',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `create_user_id` varchar(64) DEFAULT NULL COMMENT '创建人id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1:未删除 0:已删除',
  PRIMARY KEY (`id`),
  KEY `idx_persons_id` (`persons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人员人脸档案表';

-- ----------------------------
