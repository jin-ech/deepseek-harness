-- Table structure for zyx_base_rel_img
-- ----------------------------
DROP TABLE IF EXISTS `zyx_base_rel_img`;
CREATE TABLE `zyx_base_rel_img` (
  `rel_base_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联基地id',
  `base_id` varchar(32) DEFAULT NULL COMMENT '关联基地id',
  `img_name` varchar(64) DEFAULT '' COMMENT '图片名称',
  `img_url` varchar(255) DEFAULT '' COMMENT '图片地址',
  `content` varchar(255) DEFAULT '' COMMENT '描述信息',
  `model_type` varchar(32) DEFAULT NULL COMMENT '模块类型 1基地风采  2园长寄语 3学员风采',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未删除 0：已删除',
  `persons_id` varchar(32) DEFAULT NULL COMMENT '人员id',
  `station_name` varchar(32) DEFAULT NULL COMMENT '站长名称',
  PRIMARY KEY (`rel_base_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='基地表';

-- ----------------------------
