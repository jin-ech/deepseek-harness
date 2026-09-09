-- Table structure for ins_dict_limb_parts
-- ----------------------------
DROP TABLE IF EXISTS `ins_dict_limb_parts`;
CREATE TABLE `ins_dict_limb_parts` (
  `limb_parts_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '致残肢体部位id',
  `disabled_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '残疾类型id',
  `limb_parts_name` varchar(255) NOT NULL DEFAULT '' COMMENT '肢体部位',
  PRIMARY KEY (`limb_parts_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='致残肢体部位字典表';

-- ----------------------------
