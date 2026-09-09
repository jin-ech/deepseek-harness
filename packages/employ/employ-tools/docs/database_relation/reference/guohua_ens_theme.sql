-- Table structure for guohua_ens_theme
-- ----------------------------
DROP TABLE IF EXISTS `guohua_ens_theme`;
CREATE TABLE `guohua_ens_theme` (
  `theme_id` varchar(20) NOT NULL COMMENT '主题ID',
  `theme_name` varchar(255) DEFAULT NULL COMMENT '主题名称',
  `theme_sub_name` varchar(255) DEFAULT NULL COMMENT '专区副标题',
  `theme_type` tinyint(4) DEFAULT 1 COMMENT '主题类型 1默认',
  `theme_mini_code` varchar(255) DEFAULT NULL COMMENT '主题小程序码',
  `theme_status` tinyint(4) DEFAULT 1 COMMENT '主题状态1启用 0禁用',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除1未删除 0已删除',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  PRIMARY KEY (`theme_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助益行小程序主题表';

-- ----------------------------
