-- Table structure for guohua_activity_them
-- ----------------------------
DROP TABLE IF EXISTS `guohua_activity_them`;
CREATE TABLE `guohua_activity_them` (
  `them_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `them_name` varchar(255) NOT NULL DEFAULT '' COMMENT '主题名称',
  `them_abbr` text NOT NULL COMMENT '主题简介',
  `them_bg` varchar(255) NOT NULL DEFAULT '' COMMENT '主题背景图',
  `them_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '活动状态：1启用 0禁用',
  `start_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除：1未删除 0已删除',
  `add_userid` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`them_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='活动主题配置表';

-- ----------------------------
