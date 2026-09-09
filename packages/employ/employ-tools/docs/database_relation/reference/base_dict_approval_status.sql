-- Table structure for base_dict_approval_status
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_approval_status`;
CREATE TABLE `base_dict_approval_status` (
  `sp_status` int(11) DEFAULT NULL COMMENT '审批状态',
  `sp_name` varchar(255) DEFAULT '' COMMENT '审批状态名称',
  `sp_color` varchar(255) NOT NULL DEFAULT '' COMMENT '标签颜色',
  KEY `_index_sp_status` (`sp_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业微信审批状态字典表';

-- ----------------------------
