/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t382`;
CREATE DATABASE IF NOT EXISTS `t382` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t382`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'upload/config1.jpg'),
	(2, '轮播图2', 'upload/config2.jpg'),
	(3, '轮播图3', 'upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2023-03-24 07:58:22'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2023-03-24 07:58:22'),
	(3, 'liangcang_shifou_types', '是否喷射农药', 1, '是', NULL, NULL, '2023-03-24 07:58:22'),
	(4, 'liangcang_shifou_types', '是否喷射农药', 2, '否', NULL, NULL, '2023-03-24 07:58:22'),
	(5, 'liangcang_types', '水稻种型', 1, '水稻种型1', NULL, NULL, '2023-03-24 07:58:22'),
	(6, 'liangcang_types', '水稻种型', 2, '水稻种型2', NULL, NULL, '2023-03-24 07:58:22'),
	(7, 'liangcang_types', '水稻种型', 3, '水稻种型3', NULL, NULL, '2023-03-24 07:58:22'),
	(8, 'liangcang_types', '水稻种型', 4, '水稻种型4', NULL, NULL, '2023-03-24 07:58:22'),
	(9, 'renwu_shifou_types', '出粮收粮', 1, '出粮', NULL, NULL, '2023-03-24 07:58:22'),
	(10, 'renwu_shifou_types', '出粮收粮', 2, '收粮', NULL, NULL, '2023-03-24 07:58:22'),
	(11, 'renwu_types', '水稻种类', 1, '水稻种类1', NULL, NULL, '2023-03-24 07:58:22'),
	(12, 'renwu_types', '水稻种类', 2, '水稻种类2', NULL, NULL, '2023-03-24 07:58:22'),
	(13, 'renwu_types', '水稻种类', 3, '水稻种类3', NULL, NULL, '2023-03-24 07:58:22'),
	(14, 'renwu_types', '水稻种类', 4, '水稻种类4', NULL, NULL, '2023-03-24 07:58:22'),
	(15, 'liangcang_churu_inout_types', '出入库类型', 1, '出库', NULL, NULL, '2023-03-24 07:58:22'),
	(16, 'liangcang_churu_inout_types', '出入库类型', 2, '入库', NULL, NULL, '2023-03-24 07:58:22');

DROP TABLE IF EXISTS `liangcang`;
CREATE TABLE IF NOT EXISTS `liangcang` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int DEFAULT NULL COMMENT '保管员',
  `liangcang_name` varchar(200) DEFAULT NULL COMMENT '粮仓名称  Search111 ',
  `liangcang_uuid_number` varchar(200) DEFAULT NULL COMMENT '粮仓编号',
  `liangcang_photo` varchar(200) DEFAULT NULL COMMENT '粮仓照片',
  `liangcang_address` varchar(200) DEFAULT NULL COMMENT '粮仓地点',
  `liangcang_types` int DEFAULT NULL COMMENT '水稻种型 Search111',
  `liangcang_zuida_number` int DEFAULT NULL COMMENT '粮食最大容量',
  `liangcang_kucun_number` int DEFAULT NULL COMMENT '粮食现有量',
  `liangcang_wendu` decimal(10,2) DEFAULT NULL COMMENT '当前温度 ',
  `liangcang_shidu` decimal(10,2) DEFAULT NULL COMMENT '当前湿度 ',
  `liangcang_hanchongliang` int DEFAULT NULL COMMENT '含虫量',
  `liangcang_shifou_types` int DEFAULT NULL COMMENT '是否喷射农药',
  `liangcang_hanzalv` int DEFAULT NULL COMMENT '含杂率',
  `liangcang_content` longtext COMMENT '粮仓介绍 ',
  `liangcang_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='粮仓';

DELETE FROM `liangcang`;
INSERT INTO `liangcang` (`id`, `yonghu_id`, `liangcang_name`, `liangcang_uuid_number`, `liangcang_photo`, `liangcang_address`, `liangcang_types`, `liangcang_zuida_number`, `liangcang_kucun_number`, `liangcang_wendu`, `liangcang_shidu`, `liangcang_hanchongliang`, `liangcang_shifou_types`, `liangcang_hanzalv`, `liangcang_content`, `liangcang_delete`, `insert_time`, `create_time`) VALUES
	(1, 1, '粮仓名称1', '1679644734111', 'upload/liangcang1.jpg', '粮仓地点1', 1, 297, 151, 436.14, 300.96, 467, 2, 481, '粮仓介绍1', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(2, 3, '粮仓名称2', '1679644734080', 'upload/liangcang2.jpg', '粮仓地点2', 1, 265, 102, 930.03, 292.38, 390, 2, 206, '粮仓介绍2', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(3, 2, '粮仓名称3', '1679644734084', 'upload/liangcang3.jpg', '粮仓地点3', 1, 125, 103, 118.23, 232.68, 23, 1, 140, '粮仓介绍3', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(4, 2, '粮仓名称4', '1679644734014', 'upload/liangcang4.jpg', '粮仓地点4', 2, 344, 104, 204.34, 84.75, 274, 1, 154, '粮仓介绍4', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(5, 1, '粮仓名称5', '1679644734084', 'upload/liangcang5.jpg', '粮仓地点5', 3, 234, 25, 519.27, 403.68, 35, 1, 471, '粮仓介绍5', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(6, 1, '粮仓名称6', '1679644734095', 'upload/liangcang6.jpg', '粮仓地点6', 3, 419, 106, 608.94, 959.18, 172, 1, 378, '粮仓介绍6', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(7, 1, '粮仓名称7', '1679644734097', 'upload/liangcang7.jpg', '粮仓地点7', 3, 32, 107, 440.75, 566.09, 210, 1, 114, '粮仓介绍7', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(8, 2, '粮仓名称8', '1679644734063', 'upload/liangcang8.jpg', '粮仓地点8', 3, 498, 108, 465.84, 282.47, 84, 2, 90, '粮仓介绍8', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(9, 1, '粮仓名称9', '1679644734101', 'upload/liangcang9.jpg', '粮仓地点9', 4, 450, 109, 809.14, 34.01, 357, 1, 97, '粮仓介绍9', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(10, 3, '粮仓名称10', '1679644734017', 'upload/liangcang10.jpg', '粮仓地点10', 2, 222, 1010, 171.10, 782.71, 94, 1, 364, '粮仓介绍10', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(11, 3, '粮仓名称11', '1679644734099', 'upload/liangcang11.jpg', '粮仓地点11', 1, 30, 1011, 271.48, 810.47, 457, 1, 338, '粮仓介绍11', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(12, 2, '粮仓名称12', '1679644734114', 'upload/liangcang12.jpg', '粮仓地点12', 2, 387, 1012, 896.79, 794.99, 79, 1, 316, '粮仓介绍12', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(13, 2, '粮仓名称13', '1679644734076', 'upload/liangcang13.jpg', '粮仓地点13', 3, 56, 1013, 966.48, 882.64, 4, 1, 85, '粮仓介绍13', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(14, 2, '粮仓名称14', '1679644734019', 'upload/liangcang14.jpg', '粮仓地点14', 2, 239, 1014, 942.66, 794.67, 199, 1, 17, '粮仓介绍14', 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54');

DROP TABLE IF EXISTS `liangcang_churu_inout`;
CREATE TABLE IF NOT EXISTS `liangcang_churu_inout` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `liangcang_churu_inout_uuid_number` varchar(200) DEFAULT NULL COMMENT '出入库流水号',
  `liangcang_churu_inout_name` varchar(200) DEFAULT NULL COMMENT '出入库名称  Search111 ',
  `liangcang_churu_inout_types` int DEFAULT NULL COMMENT '出入库类型  Search111 ',
  `liangcang_churu_inout_content` longtext COMMENT '备注',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='出入库';

DELETE FROM `liangcang_churu_inout`;
INSERT INTO `liangcang_churu_inout` (`id`, `liangcang_churu_inout_uuid_number`, `liangcang_churu_inout_name`, `liangcang_churu_inout_types`, `liangcang_churu_inout_content`, `insert_time`, `create_time`) VALUES
	(1, '1679644734059', '出入库名称1', 1, '备注1', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(2, '1679644734037', '出入库名称2', 2, '备注2', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(3, '1679644734119', '出入库名称3', 1, '备注3', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(4, '1679644734108', '出入库名称4', 1, '备注4', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(5, '1679644734030', '出入库名称5', 1, '备注5', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(6, '1679644734035', '出入库名称6', 1, '备注6', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(7, '1679644734060', '出入库名称7', 1, '备注7', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(8, '1679644734087', '出入库名称8', 1, '备注8', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(9, '1679644734113', '出入库名称9', 1, '备注9', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(10, '1679644734126', '出入库名称10', 1, '备注10', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(11, '1679644734062', '出入库名称11', 1, '备注11', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(12, '1679644734035', '出入库名称12', 1, '备注12', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(13, '1679644734057', '出入库名称13', 2, '备注13', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(14, '1679644734052', '出入库名称14', 1, '备注14', '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(15, '1679646137394', '111', 2, '', '2023-03-24 08:22:17', '2023-03-24 08:22:17'),
	(16, '1679647477515', '11', 1, '', '2023-03-24 08:44:38', '2023-03-24 08:44:38');

DROP TABLE IF EXISTS `liangcang_churu_inout_list`;
CREATE TABLE IF NOT EXISTS `liangcang_churu_inout_list` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `liangcang_churu_inout_id` int DEFAULT NULL COMMENT '出入库',
  `liangcang_id` int DEFAULT NULL COMMENT '粮仓',
  `liangcang_churu_inout_list_number` int DEFAULT NULL COMMENT '操作数量',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='出入库详情';

DELETE FROM `liangcang_churu_inout_list`;
INSERT INTO `liangcang_churu_inout_list` (`id`, `liangcang_churu_inout_id`, `liangcang_id`, `liangcang_churu_inout_list_number`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 81, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(2, 2, 2, 11, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(3, 3, 3, 173, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(4, 4, 4, 143, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(5, 5, 5, 463, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(6, 6, 6, 459, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(7, 7, 7, 263, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(8, 8, 8, 20, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(9, 9, 9, 95, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(10, 10, 10, 308, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(11, 11, 11, 418, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(12, 12, 12, 338, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(13, 13, 13, 130, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(14, 14, 14, 289, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(15, 15, 1, 50, '2023-03-24 08:22:17', '2023-03-24 08:22:17'),
	(16, 16, 5, 80, '2023-03-24 08:44:38', '2023-03-24 08:44:38');

DROP TABLE IF EXISTS `renwu`;
CREATE TABLE IF NOT EXISTS `renwu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int DEFAULT NULL COMMENT '保管员',
  `liangcang_id` int DEFAULT NULL COMMENT '粮仓',
  `renwu_types` int DEFAULT NULL COMMENT '水稻种类 Search111',
  `renwu_xianyou_number` int DEFAULT NULL COMMENT '出受量',
  `renwu_shifou_types` int DEFAULT NULL COMMENT '出粮收粮',
  `renwu_new_money` decimal(10,2) DEFAULT NULL COMMENT '价格 ',
  `renwu_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '录入时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='出受粮任务';

DELETE FROM `renwu`;
INSERT INTO `renwu` (`id`, `yonghu_id`, `liangcang_id`, `renwu_types`, `renwu_xianyou_number`, `renwu_shifou_types`, `renwu_new_money`, `renwu_delete`, `insert_time`, `create_time`) VALUES
	(1, 1, 1, 3, 36, 1, 181.85, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(2, 1, 2, 2, 369, 1, 469.80, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(3, 2, 3, 3, 331, 2, 485.45, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(4, 3, 4, 4, 475, 2, 24.02, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(5, 1, 5, 4, 446, 2, 205.39, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(6, 1, 6, 1, 228, 1, 260.39, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(7, 3, 7, 1, 499, 1, 274.83, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(8, 2, 8, 1, 243, 1, 168.85, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(9, 3, 9, 3, 385, 2, 312.35, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(10, 2, 10, 2, 484, 1, 155.52, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(11, 3, 11, 1, 225, 2, 366.48, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(12, 1, 12, 3, 207, 1, 382.50, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(13, 2, 13, 2, 355, 1, 167.22, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(14, 2, 14, 3, 30, 1, 131.06, 1, '2023-03-24 07:58:54', '2023-03-24 07:58:54'),
	(15, 1, 1, 1, 50, 2, 8.00, 1, '2023-03-24 08:19:39', '2023-03-24 08:19:39'),
	(16, 1, 5, 1, 80, 1, 20.00, 1, '2023-03-24 08:44:10', '2023-03-24 08:44:10');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '儿童id',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', 'zwzfbt0ynfrubom0r6kkveu3i3q4zi5n', '2023-03-24 08:02:03', '2024-08-13 07:06:56'),
	(2, 1, 'a1', 'yonghu', '粮仓保管员', 'jyfy7tad6b6e26kzzcbgy1eulqsx4yvc', '2023-03-24 08:17:13', '2024-08-13 07:07:58');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '儿童名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2023-03-24 07:58:22');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '保管员姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '保管员手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '保管员身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '保管员头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '保管员邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='粮仓保管员';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `yonghu_email`, `create_time`) VALUES
	(1, '保管员1', '123456', '保管员姓名1', '17703786901', '410224199010102001', 'upload/yonghu1.jpg', 2, '1@qq.com', '2023-03-24 07:58:54'),
	(2, '保管员2', '123456', '保管员姓名2', '17703786902', '410224199010102002', 'upload/yonghu2.jpg', 1, '2@qq.com', '2023-03-24 07:58:54'),
	(3, '保管员3', '123456', '保管员姓名3', '17703786903', '410224199010102003', 'upload/yonghu3.jpg', 1, '3@qq.com', '2023-03-24 07:58:54');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
