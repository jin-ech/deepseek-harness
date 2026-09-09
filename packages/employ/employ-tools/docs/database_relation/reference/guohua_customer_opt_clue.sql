-- Table structure for guohua_customer_opt_clue
-- ----------------------------
DROP TABLE IF EXISTS `guohua_customer_opt_clue`;
CREATE TABLE `guohua_customer_opt_clue` (
  `clue_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线索ID',
  `clue_name` varchar(255) DEFAULT NULL COMMENT '线索名称',
  `prospect_level` varchar(64) DEFAULT NULL COMMENT '线索级别 S已合作 A高意向 B 中意向  C低意向  D无意向',
  `prospect_source` varchar(64) DEFAULT NULL COMMENT '线索来源  1自拓客户 2渠道客户 3客户转介绍 4网站线索 5广告线索 6活动线索 7展会线索',
  `clue_stage` tinyint(4) DEFAULT NULL COMMENT '线索阶段 ',
  `clue_detail` varchar(64) DEFAULT NULL COMMENT '线索明细',
  `customer_address_info` varchar(500) DEFAULT NULL COMMENT '客户详细地址',
  `customer_industry_id` int(11) DEFAULT NULL COMMENT '所属行业ID',
  `customer_size` varchar(64) DEFAULT NULL COMMENT '客户规模',
  `staff_number` int(11) DEFAULT NULL COMMENT '企业现有员工数量',
  `is_disabled_money` tinyint(4) DEFAULT NULL COMMENT '是否在缴纳残保金 1是 2否',
  `disabled_money` int(11) DEFAULT NULL COMMENT '当前缴纳残保金金额',
  `add_userid` varchar(64) DEFAULT NULL COMMENT '添加人ID',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `update_userid` varchar(64) DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `responsible_userid` varchar(64) DEFAULT NULL COMMENT '线索负责人',
  `is_clue_share` tinyint(4) DEFAULT 0 COMMENT '是否已分配 1是0否',
  `is_clue_change` tinyint(4) DEFAULT 0 COMMENT '是否已转客户 1是 0否 2已退回',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `allocate_time` datetime DEFAULT NULL COMMENT '分配时间',
  `is_clue_back` tinyint(4) DEFAULT 0 COMMENT '是否退回 1是 0否',
  PRIMARY KEY (`clue_id`) USING BTREE,
  KEY `index_is_delete` (`is_delete`) USING BTREE,
  KEY `index_customer_name` (`clue_name`) USING BTREE,
  KEY `index_clue_id` (`clue_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1999 DEFAULT CHARSET=utf8mb4 COMMENT='客户线索信息表';

-- ----------------------------
