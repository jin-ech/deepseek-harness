-- Table structure for guohua_face_verify_log
-- ----------------------------
DROP TABLE IF EXISTS `guohua_face_verify_log`;
CREATE TABLE `guohua_face_verify_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `persons_id` varchar(64) NOT NULL COMMENT '人员ID',
  `face_img_url` varchar(512) NOT NULL DEFAULT '' COMMENT '失败照片OSS地址',
  `liveness_passed` tinyint(4) NOT NULL COMMENT '活体检测是否通过 1是 0否',
  `liveness_score` decimal(5,2) DEFAULT NULL COMMENT '活体检测评分',
  `compare_passed` tinyint(4) DEFAULT NULL COMMENT '人脸比对是否通过 1是 0否\n  NULL表示未进行',
  `confidence` decimal(5,2) DEFAULT NULL COMMENT '人脸比对置信度',
  `fail_reason` varchar(64) NOT NULL COMMENT '失败原因\n  liveness_failed/compare_failed',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `idx_face_verify_log_persons_id` (`persons_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='人脸核验失败日志表';

-- ----------------------------
