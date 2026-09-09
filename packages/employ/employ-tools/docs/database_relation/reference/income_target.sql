-- Table structure for income_target
-- ----------------------------
DROP TABLE IF EXISTS `income_target`;
CREATE TABLE `income_target` (
  `income_target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收入目标id',
  `target_type` varchar(10) NOT NULL DEFAULT '' COMMENT '指标类型 年度指标：year，季度：quarter，月度：month',
  `main_department_id` varchar(32) NOT NULL DEFAULT '0' COMMENT '主部门id',
  `department_id` varchar(32) NOT NULL DEFAULT '' COMMENT '部门ID',
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品id',
  `income_target` decimal(10,2) NOT NULL COMMENT '收入目标',
  `payback_target` decimal(10,2) NOT NULL COMMENT '回款指标',
  `persons_target` int(11) NOT NULL DEFAULT 0 COMMENT '指标人数',
  `total_target` decimal(10,2) NOT NULL COMMENT '累计指标金额',
  `add_time` date NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `year` year(4) NOT NULL DEFAULT 0000 COMMENT '年份',
  `quarter` varchar(10) NOT NULL DEFAULT '' COMMENT '季度',
  `month` varchar(10) NOT NULL DEFAULT '' COMMENT '月份',
  PRIMARY KEY (`income_target_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='2023年部门收入目标表';

-- ----------------------------
