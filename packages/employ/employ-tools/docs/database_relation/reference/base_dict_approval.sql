-- Table structure for base_dict_approval
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_approval`;
CREATE TABLE `base_dict_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approve_name` varchar(255) NOT NULL DEFAULT '' COMMENT '审批名称',
  `template_id` varchar(255) NOT NULL DEFAULT '' COMMENT '审批模板ID',
  `table_name` varchar(255) NOT NULL DEFAULT '' COMMENT '审批申请表名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='国华审批模板表';

-- ----------------------------
