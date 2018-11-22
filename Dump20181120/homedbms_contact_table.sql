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
-- Table structure for table `contact_table`
--

DROP TABLE IF EXISTS `contact_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_table` (
  `username` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `ph_no` varchar(20) NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_table`
--

LOCK TABLES `contact_table` WRITE;
/*!40000 ALTER TABLE `contact_table` DISABLE KEYS */;
INSERT INTO `contact_table` VALUES ('krithi','2197','krithi@gmail.com','8152860726','BSRB HOSTEL','','Bangalore'),('krithis','21977','krithis@gmail.com','8152860726','bsrb havyaka hostel','','bangalore'),('krithishastry','21977','krithishas@gmail.com','8152860726','bsrb havyaka hostel','','bangalore'),('shastry','2197','email@gmail.com','8152860726','BSRB hostel',NULL,'bangaore'),('shruti','1234','shruti@gmail.com','987654321','BSRB LADIES HOSTEL','','BANGALORE');
/*!40000 ALTER TABLE `contact_table` ENABLE KEYS */;
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
