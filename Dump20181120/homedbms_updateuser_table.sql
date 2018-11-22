CREATE DATABASE  IF NOT EXISTS `homedbms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `homedbms`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: homedbms
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `updateuser_table`
--

DROP TABLE IF EXISTS `updateuser_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updateuser_table` (
  `updateuser_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `totalbill` int(11) DEFAULT NULL,
  `billdate` varchar(45) DEFAULT NULL,
  `itembrand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`updateuser_id`),
  KEY `itembrand_id_idx` (`itembrand_id`),
  KEY `username_idx` (`username`),
  CONSTRAINT `itembrand_id` FOREIGN KEY (`itembrand_id`) REFERENCES `itembrand_table` (`itembrand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `contact_table` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updateuser_table`
--

LOCK TABLES `updateuser_table` WRITE;
/*!40000 ALTER TABLE `updateuser_table` DISABLE KEYS */;
INSERT INTO `updateuser_table` VALUES (1,'krithi',2,400,NULL,35),(34,'krithi',15,1500,'Mon Nov 12 14:31:02 IST 2018',38),(35,'krithi',1,100,'Mon Nov 12 18:49:58 IST 2018',38),(36,'krithi',1,800,'Mon Nov 12 23:14:17 IST 2018',33),(37,'krithi',15,1500,'Mon Nov 12 23:39:10 IST 2018',38),(38,'krithi',1,800,'Mon Nov 12 23:43:12 IST 2018',33),(40,'krithi',1,800,'Wed Nov 14 21:19:04 IST 2018',33),(41,'krithi',9,2250,'Sat Nov 17 12:35:35 IST 2018',36),(45,'krithi',1,800,'Sat Nov 17 12:38:57 IST 2018',33);
/*!40000 ALTER TABLE `updateuser_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 11:27:11
