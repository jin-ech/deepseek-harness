-- Table structure for zyx_station
-- ----------------------------
DROP TABLE IF EXISTS `zyx_station`;
CREATE TABLE `zyx_station` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站ID',
  `region_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区ID',
  `station_name` varchar(255) NOT NULL DEFAULT '' COMMENT '站名称',
  `introduce` varchar(255) NOT NULL DEFAULT '' COMMENT '介绍',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `background` varchar(255) NOT NULL DEFAULT '',
  `is_delete` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 未删除 0已删除',
  PRIMARY KEY (`station_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='基地导览站点表';

-- ----------------------------
-- Function structure for get_all_child_dept_ids
-- ----------------------------
DROP FUNCTION IF EXISTS `get_all_child_dept_ids`;
delimiter ;;
CREATE FUNCTION `get_all_child_dept_ids`(root_id INT)
 RETURNS varchar(2000) CHARSET utf8mb4
  DETERMINISTIC
BEGIN
    DECLARE child_ids VARCHAR(2000);
    DECLARE temp_ids VARCHAR(2000);

    SET child_ids = '';
    SET temp_ids = CAST(root_id AS CHAR);

    -- 循环查找所有层级的子部门
    WHILE temp_ids IS NOT NULL DO
        -- 拼接当前批次的子部门ID
        SET child_ids = CONCAT_WS(',', child_ids, temp_ids);

        -- 查询当前批次ID的所有直接子部门
        SELECT GROUP_CONCAT(department_id) INTO temp_ids
        FROM base_guohua_department
        WHERE FIND_IN_SET(parentid, temp_ids) > 0;
    END WHILE;

    -- 移除根ID，只保留子部门ID（去除多余逗号）
    RETURN TRIM(BOTH ',' FROM REPLACE(child_ids, root_id, ''));
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
