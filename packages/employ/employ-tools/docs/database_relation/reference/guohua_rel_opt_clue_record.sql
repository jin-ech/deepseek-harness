-- Table structure for guohua_rel_opt_clue_record
-- ----------------------------
DROP TABLE IF EXISTS `guohua_rel_opt_clue_record`;
CREATE TABLE `guohua_rel_opt_clue_record` (
  `clue_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线索记录id',
  `customer_id` int(11) NOT NULL DEFAULT 0 COMMENT '客户id',
  `clue_id` int(11) NOT NULL DEFAULT 0 COMMENT '线索id',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '分配时间',
  `add_userid` varchar(255) DEFAULT '' COMMENT '添加人',
  `responsible_userid` varchar(255) DEFAULT '' COMMENT '负责人',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `clue_status` varchar(255) DEFAULT '0' COMMENT '1线索分配  2线索转客户  3线索退公海  4线索成单  5线索客户编辑 6客户跟进 7线索退回 8线索跟进 9线索阶段变更',
  `content` varchar(255) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`clue_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13288 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-客户线索变更记录';

-- ----------------------------
