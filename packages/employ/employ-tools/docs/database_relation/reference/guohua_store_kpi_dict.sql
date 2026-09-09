-- Table structure for guohua_store_kpi_dict
-- ----------------------------
DROP TABLE IF EXISTS `guohua_store_kpi_dict`;
CREATE TABLE `guohua_store_kpi_dict` (
  `kpi_id` int(11) NOT NULL COMMENT '指标ID',
  `kpi_code` varchar(255) DEFAULT NULL COMMENT '指标编码',
  `kpi_name` varchar(255) DEFAULT NULL COMMENT '指标名称',
  `kpi_info` varchar(255) DEFAULT NULL COMMENT '指标说明',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态 1：显示 0：不显示',
  PRIMARY KEY (`kpi_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基地任务指标字典表';

-- ----------------------------
