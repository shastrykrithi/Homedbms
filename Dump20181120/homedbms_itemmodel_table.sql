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
-- Table structure for table `itemmodel_table`
--

DROP TABLE IF EXISTS `itemmodel_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemmodel_table` (
  `itemmodelid` int(11) NOT NULL AUTO_INCREMENT,
  `itemmodelname` varchar(45) NOT NULL,
  `itemid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemmodelid`),
  KEY `itemid_idx` (`itemid`),
  CONSTRAINT `itemid` FOREIGN KEY (`itemid`) REFERENCES `item_table` (`itemid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmodel_table`
--

LOCK TABLES `itemmodel_table` WRITE;
/*!40000 ALTER TABLE `itemmodel_table` DISABLE KEYS */;
INSERT INTO `itemmodel_table` VALUES (11,'3 Wings',1),(12,'Four Wings fan',1),(13,'Table Fans',1),(14,'40 Watt bulb',2),(15,'60 Watt bulb',2),(16,'Single way switch',3),(17,'Dual way switch',3),(18,'Soft touch switch',3),(19,'5 step regulator',4),(20,'360 way purifier',5),(21,'One way purifier ',5),(23,'Large sized',6),(30,'table grinder',13),(31,'Asha',1),(32,'Asha',1);
/*!40000 ALTER TABLE `itemmodel_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 11:27:14
