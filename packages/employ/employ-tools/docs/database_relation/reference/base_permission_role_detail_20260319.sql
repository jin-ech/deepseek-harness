-- Table structure for base_permission_role_detail_20260319
-- ----------------------------
DROP TABLE IF EXISTS `base_permission_role_detail_20260319`;
CREATE TABLE `base_permission_role_detail_20260319` (
  `permission_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_role_id` varchar(64) NOT NULL DEFAULT '',
  `permission_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`permission_detail_id`) USING BTREE,
  KEY `FK_pms_role_detaill_pms_id` (`permission_id`) USING BTREE,
  KEY `FK_pms_role_detaill_pms_role_id` (`permission_role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=937 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限明细';

-- ----------------------------
