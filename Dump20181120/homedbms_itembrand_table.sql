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
-- Table structure for table `itembrand_table`
--

DROP TABLE IF EXISTS `itembrand_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itembrand_table` (
  `itembrand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brandname` varchar(45) NOT NULL,
  `prize` int(11) DEFAULT NULL,
  `itemmodelid` int(11) DEFAULT NULL,
  `bquantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`itembrand_id`),
  KEY `itemmodelid_idx` (`itemmodelid`),
  CONSTRAINT `itemmodelid` FOREIGN KEY (`itemmodelid`) REFERENCES `itemmodel_table` (`itemmodelid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itembrand_table`
--

LOCK TABLES `itembrand_table` WRITE;
/*!40000 ALTER TABLE `itembrand_table` DISABLE KEYS */;
INSERT INTO `itembrand_table` VALUES (31,'Usha ',1448,11,2),(32,'Bajaj',999,13,3),(33,'Usha',800,12,15),(34,'Philips ',200,14,10),(35,'Surya',200,14,10),(36,'Philips',250,15,14),(37,'Surya',200,15,12),(38,'Finolex ',100,16,55);
/*!40000 ALTER TABLE `itembrand_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 11:27:12
