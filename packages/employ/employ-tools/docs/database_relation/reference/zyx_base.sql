-- Table structure for zyx_base
-- ----------------------------
DROP TABLE IF EXISTS `zyx_base`;
CREATE TABLE `zyx_base` (
  `base_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '基地ID',
  `base_name` varchar(255) NOT NULL DEFAULT '' COMMENT '基地名称',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联就业基地ID',
  `station_id` int(11) NOT NULL DEFAULT 0 COMMENT '菜单ID',
  `homeland_id` varchar(36) NOT NULL DEFAULT '' COMMENT '关联温馨家园ID',
  `region_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区ID',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '在站人数',
  `street` varchar(255) NOT NULL DEFAULT '' COMMENT '街道信息',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `cover_url` varchar(255) NOT NULL DEFAULT '' COMMENT '基地封面图片',
  `sort` int(11) NOT NULL DEFAULT 999999 COMMENT '999999',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1：显示 0：不显示',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '新增时间',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未删除 0：已删除',
  `base_content` varchar(500) DEFAULT NULL COMMENT '基地简介',
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8mb4 COMMENT='基地表';

-- ----------------------------
