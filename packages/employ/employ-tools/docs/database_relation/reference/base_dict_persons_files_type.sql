-- Table structure for base_dict_persons_files_type
-- ----------------------------
DROP TABLE IF EXISTS `base_dict_persons_files_type`;
CREATE TABLE `base_dict_persons_files_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `file_type_id` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型 1身份证正面 2户口本首页 3残疾证正面 4银行卡正面 5体检报告 6电子照片 10身份证背面 11户口本本人页 12户口本变更页 13残疾证背面 14银行卡背面 15身份证扫描件 16户口本扫描件 17残疾证扫描件 18银行卡扫描件 19电子照片',
  `file_type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型名称',
  `file_source_type` varchar(64) NOT NULL DEFAULT '' COMMENT '资料来源类型 1:电子件(拍照) 2:扫描件(上传)',
  `sort` smallint(5) NOT NULL DEFAULT 9999 COMMENT '排序',
  `is_show` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否显示 1:是 2:否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1223 DEFAULT CHARSET=utf8mb4 COMMENT='就业管理系统-电子附件类型字典表';

-- ----------------------------
