-- Table structure for market_material_generate_record
-- ----------------------------
DROP TABLE IF EXISTS `market_material_generate_record`;
CREATE TABLE `market_material_generate_record` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户ID',
  `skill_code` varchar(64) NOT NULL DEFAULT '' COMMENT '技能编码',
  `gen_type` varchar(16) NOT NULL DEFAULT '' COMMENT '生成类型：text/image',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '列表标题',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '状态：1失败 2进行中 3已完成',
  `prompt` text DEFAULT NULL COMMENT '提示词/用户输入',
  `result_summary` varchar(512) NOT NULL DEFAULT '' COMMENT '结果摘要',
  `result_json` text DEFAULT NULL COMMENT '结果详情 JSON',
  `extra_json` varchar(1024) NOT NULL DEFAULT '' COMMENT '扩展参数 JSON',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标记：0否 1是',
  `create_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_delete_create` (`user_id`,`is_delete`,`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='素材生成记录';

-- ----------------------------
