-- Table structure for work_evaluate_disabled
-- ----------------------------
DROP TABLE IF EXISTS `work_evaluate_disabled`;
CREATE TABLE `work_evaluate_disabled` (
  `id` varchar(64) NOT NULL COMMENT '主键（UUID）',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `disability_card_no` varchar(64) DEFAULT NULL COMMENT '残疾证号',
  `region_code` varchar(6) DEFAULT NULL COMMENT '行政区划码（证号前6位）',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `district` varchar(64) DEFAULT NULL COMMENT '区',
  `region_json` longtext DEFAULT NULL COMMENT '区域解析JSON',
  `age` int(11) NOT NULL COMMENT '年龄',
  `gender` tinyint(1) NOT NULL COMMENT '性别：1男 2女',
  `disability_type` varchar(64) NOT NULL COMMENT '残疾类型：视力残疾等',
  `disability_type_id` tinyint(1) NOT NULL DEFAULT 1 COMMENT '残疾类型编码：1一级 2二级 3三级 4四级',
  `source_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '来源类型：1职业锚测评 2职业能力测评',
  `evaluate_area_id` varchar(64) DEFAULT NULL COMMENT '区县二维码ID（work_evaluate_area.id）',
  `evaluate_qrcode_pool_id` varchar(64) DEFAULT NULL COMMENT '二维码池ID（work_evaluate_qrcode_pool.id；支持市/区口径）',
  `contact` varchar(64) DEFAULT NULL COMMENT '联系方式（选填）',
  `evaluate_count` tinyint(4) NOT NULL DEFAULT 0 COMMENT '已测评次数（上限3次）',
  `tags` varchar(1024) DEFAULT NULL COMMENT '大模型生成的人物标签（JSON 键值对数组），每次生成报告后覆盖更新',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未删除 1已删除',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_disability_type` (`disability_type`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE,
  KEY `idx_disability_card_no` (`disability_card_no`),
  KEY `idx_evaluate_area_id` (`evaluate_area_id`),
  KEY `idx_disabled_pool` (`evaluate_qrcode_pool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人测评记录表';

-- ----------------------------
