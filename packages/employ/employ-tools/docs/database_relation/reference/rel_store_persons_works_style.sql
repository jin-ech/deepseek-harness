-- Table structure for rel_store_persons_works_style
-- ----------------------------
DROP TABLE IF EXISTS `rel_store_persons_works_style`;
CREATE TABLE `rel_store_persons_works_style` (
  `style_id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` varchar(64) DEFAULT NULL COMMENT '人员id',
  `works_id` varchar(64) DEFAULT NULL COMMENT '作品id',
  `store_id` int(11) DEFAULT NULL COMMENT '基地id',
  `add_time` datetime DEFAULT current_timestamp() COMMENT '添加时间',
  `is_delete` tinyint(4) DEFAULT 1 COMMENT '1未删除 0已删除',
  PRIMARY KEY (`style_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COMMENT='基地学员风采表';

-- ----------------------------
