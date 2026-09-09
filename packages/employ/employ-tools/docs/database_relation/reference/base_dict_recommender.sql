-- Table structure for base_dict_recommender
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_recommender`;
CREATE TABLE `base_dict_recommender` (
  `recommender_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推荐人id',
  `recommender_name` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐人姓名',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示1:是 2:否',
  PRIMARY KEY (`recommender_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COMMENT='关系户字典表';

-- ----------------------------
