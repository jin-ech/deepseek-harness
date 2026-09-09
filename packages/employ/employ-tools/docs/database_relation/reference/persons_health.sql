-- Table structure for persons_health
-- ----------------------------
DROP TABLE IF EXISTS `persons_health`;
CREATE TABLE `persons_health` (
  `health_id` varchar(64) NOT NULL COMMENT '健康状况id',
  `persons_id` varchar(64) NOT NULL DEFAULT '' COMMENT '残疾人id',
  `height` varchar(10) NOT NULL DEFAULT '' COMMENT '身高 cm',
  `weight` varchar(10) NOT NULL DEFAULT '' COMMENT '体重 kg',
  `left_vision` varchar(16) NOT NULL DEFAULT '' COMMENT '左眼视力',
  `right_vision` varchar(16) NOT NULL DEFAULT '' COMMENT '右眼视力',
  `is_color` varchar(10) NOT NULL DEFAULT '' COMMENT '是否色盲 1有 2 无 0 未填写',
  `is_hearing` varchar(10) NOT NULL DEFAULT '' COMMENT '听力有无异常 1有  2无 0未填写',
  `is_health` varchar(10) NOT NULL DEFAULT '' COMMENT '健康情况 1健康 2体弱 3多病 0 未填写',
  `disease_name` varchar(255) NOT NULL DEFAULT '' COMMENT '病名',
  `drug_name` varchar(255) NOT NULL DEFAULT '' COMMENT '目前服用药物名称',
  `drug_method` varchar(255) NOT NULL DEFAULT '' COMMENT '服用药物用法',
  `drug_allergy` varchar(255) NOT NULL DEFAULT '' COMMENT '对何种药物过敏',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`health_id`) USING BTREE,
  UNIQUE KEY `index_persons_id` (`persons_id`) USING BTREE COMMENT '成员id唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='残疾人健康状况表';

-- ----------------------------
