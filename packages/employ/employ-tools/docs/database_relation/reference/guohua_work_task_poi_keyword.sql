-- Table structure for guohua_work_task_poi_keyword
-- ----------------------------
DROP TABLE IF EXISTS `guohua_work_task_poi_keyword`;
CREATE TABLE `guohua_work_task_poi_keyword` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customer_id` varchar(64) NOT NULL COMMENT '客户ID（企业唯一标识）',
  `keyword` varchar(64) NOT NULL COMMENT '舆情关键词',
  `source` varchar(32) DEFAULT NULL COMMENT '关键词来源(llm:模型生成，manual:人工添加)',
  `weight` float DEFAULT 1 COMMENT '权重',
  `is_delete` tinyint(1) DEFAULT 1 COMMENT '是否删除（1：未删除，0：已删除）',
  `created_at` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_keyword` (`customer_id`,`keyword`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=2437 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
