/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.22 : Database - time_management_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`time_management_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `time_management_system`;

/*Table structure for table `class_table` */

DROP TABLE IF EXISTS `class_table`;

CREATE TABLE `class_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `week` date DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `classcontent` varchar(30) DEFAULT NULL,
  `classconversion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `class_table` */

insert  into `class_table`(`id`,`date`,`week`,`createdate`,`class`,`address`,`classcontent`,`classconversion`) values (21,'2018-08-08','2018-08-08','2018-08-15 00:00:00','java','花溪大道','javaspringmvc',5),(23,'2018-08-08','2018-08-08','2018-08-15 00:00:00','java','花溪大道','javaspringmvc',2),(24,'2018-08-08','2018-08-08','2018-08-15 00:00:00','java','花溪大道','javaspringmvc',2),(25,'2018-08-08','2018-08-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(26,'2018-08-07','2018-08-07','2018-08-07 15:38:28','python','民族大学1123','main',3),(27,'2018-08-08','2018-08-08','2018-08-15 00:00:00','php','民族大学','javaspringmvc',2),(29,'2018-08-08','2018-08-08','2018-08-15 00:00:00','python','花溪大道','javaspringmvc',2),(32,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(33,'2018-08-06','2018-08-06','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(36,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(41,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(42,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(43,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(44,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(45,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(46,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(47,'2018-07-08','2018-07-08','2018-08-15 00:00:00','java','花溪大道','java springmvc',2),(49,'2018-08-08','2018-08-08','2018-08-14 16:34:11','python','大学城','python基础',1),(50,'2018-08-07','2018-08-07','2018-08-07 16:41:59','python','民族大学1123','main',3);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户序列',
  `s_id` bigint(20) NOT NULL COMMENT 'ID号',
  `s_name` varchar(30) NOT NULL COMMENT '学生名字',
  `s_email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `s_passwd` char(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `s_id` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`s_id`,`s_name`,`s_email`,`s_passwd`) values (1,20160105,'admin','admin@admin.com','670b14728ad9902aecba32e22fa4f6bd'),(2,20160106,'kieryum','kieryum@kieryum.com','670b14728ad9902aecba32e22fa4f6bd'),(3,20160103,'admin2','admin@admin1.com','670b14728ad9902aecba32e22fa4f6bd'),(12,20160113,'admin23','admin@admin.com','ea516de9604b788767e47c59cb1f0b24'),(13,20160114,'admin222','admi34n@admin.com','7dcc8496584a0f4199fae14a4dea3d0b'),(14,20160115,'admin222','admin@admin.com','040b7cf4a55014e185813e0644502ea9'),(15,20160116,'admin23','admin@admin.com','24c6aa74f058c1ab7f1c9c656d35394b');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
