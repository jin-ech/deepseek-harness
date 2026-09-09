-- Table structure for guohua_regulation
-- ----------------------------
DROP TABLE IF EXISTS `guohua_regulation`;
CREATE TABLE `guohua_regulation` (
  `regulation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规章制度id',
  `system_id` varchar(64) DEFAULT NULL COMMENT '所属系统id',
  `regulation_type` tinyint(4) DEFAULT 1 COMMENT '规章制度类型 1一线销售  2销售经理  3区域总 4cmo及以上 5业务员    已弃用',
  `visible_roles` varchar(255) DEFAULT NULL COMMENT '可见角色id',
  `regulation_name` varchar(255) DEFAULT NULL COMMENT '规章制度名称',
  `file_url` varchar(1024) DEFAULT NULL COMMENT '文件路径',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  `is_release` tinyint(4) DEFAULT 0 COMMENT '是否发布 1是 0否',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `sort` int(11) DEFAULT 999 COMMENT '排序',
  PRIMARY KEY (`regulation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='国华众联规章制度表';

-- ----------------------------
