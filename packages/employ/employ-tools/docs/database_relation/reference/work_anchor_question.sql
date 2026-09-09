-- Table structure for work_anchor_question
-- ----------------------------
DROP TABLE IF EXISTS `work_anchor_question`;
CREATE TABLE `work_anchor_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `question_set_id` int(11) NOT NULL COMMENT '题集ID（1-3）',
  `question_number` int(11) NOT NULL COMMENT '题号（1-40）',
  `question_text` varchar(255) NOT NULL COMMENT '题目文本',
  `anchor_type` varchar(32) NOT NULL COMMENT '职业锚维度：TF/GM/AU/SE/EC/SV/CH/LS',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_set_num` (`question_set_id`,`question_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COMMENT='施恩职业锚测评题库表';

-- ----------------------------
