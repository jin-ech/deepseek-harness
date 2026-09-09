-- Table structure for base_aigc_model
-- ----------------------------
DROP TABLE IF EXISTS `base_aigc_model`;
CREATE TABLE `base_aigc_model` (
  `aigc_model_id` varchar(64) NOT NULL COMMENT 'aigc模型id',
  `aigc_type_id` varchar(64) DEFAULT NULL COMMENT '模型唯一编码',
  `model_name` varchar(255) DEFAULT NULL COMMENT 'aigc模型名称',
  `model_url` varchar(255) DEFAULT NULL COMMENT 'aigc的请求地址',
  `model_icon` varchar(255) DEFAULT NULL COMMENT '模型icon',
  `model_path` varchar(255) DEFAULT NULL COMMENT '模型路径',
  `status` tinyint(1) DEFAULT 1 COMMENT '1:显示 0：隐藏',
  `delete_flag` tinyint(1) DEFAULT 0 COMMENT '1:已删除 0：未删除',
  `model_code` varchar(255) DEFAULT NULL COMMENT '模型编码',
  `use_range` tinyint(1) DEFAULT -1 COMMENT '使用范围 -1：全部 1：素材生产 2：内容检索 3:生成向量',
  `dims` int(11) DEFAULT 0 COMMENT '向量纬度',
  `aol` varchar(8) NOT NULL DEFAULT 'api' COMMENT 'api or local',
  `has_reason` tinyint(4) DEFAULT 0 COMMENT '模型是否带推理过程 0 不带，1带',
  `is_default` tinyint(1) DEFAULT 0 COMMENT '是否是默认大模型',
  `param_size_b` float DEFAULT 70 COMMENT '模型参数：参数量',
  `param_config` text DEFAULT NULL COMMENT '模型参数：配置信息',
  `param_preference` varchar(100) DEFAULT NULL COMMENT '模型参数：适配任务类型',
  `param_human_rating` int(11) DEFAULT 5 COMMENT '模型参数：主观评分0-10',
  `enable_decision` tinyint(1) NOT NULL DEFAULT 0 COMMENT '决策模型是否使用此模型',
  `priority` int(11) DEFAULT 0 COMMENT '请求优先级',
  `concurrency_count` int(11) DEFAULT 0 COMMENT '并发请求数量',
  `max_tokens` int(11) DEFAULT 0 COMMENT '最大token数',
  `max_input_tokens` int(11) DEFAULT 30000 COMMENT '最大输入token数',
  `temperature` float DEFAULT NULL COMMENT '温度',
  `top_p` float DEFAULT NULL COMMENT 'top_p',
  `add_time` datetime DEFAULT current_timestamp(),
  `update_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`aigc_model_id`) USING BTREE,
  KEY `fk_aigc_model_dict_aigc_type_1` (`aigc_type_id`) USING BTREE,
  CONSTRAINT `fk_aigc_model_dict_aigc_type_1` FOREIGN KEY (`aigc_type_id`) REFERENCES `base_dict_aigc_type` (`aigc_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='aigc模型';

-- ----------------------------
