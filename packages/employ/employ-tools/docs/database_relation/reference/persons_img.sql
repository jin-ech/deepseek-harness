-- Table structure for persons_img
-- ----------------------------
DROP TABLE IF EXISTS `persons_img`;
CREATE TABLE `persons_img` (
  `persons_img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人员图片id',
  `persons_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '人员id',
  `img_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '图片类型1标准材料 2非标准材料',
  `img_name` varchar(255) NOT NULL DEFAULT '' COMMENT '图片名称',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片地址',
  `file_type` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型',
  `add_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `create_user_id` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人id',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否删除 1未删除 0已删除',
  PRIMARY KEY (`persons_img_id`) USING BTREE,
  KEY `img_ acitvity_id` (`persons_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人员附件图片表';

-- ----------------------------
