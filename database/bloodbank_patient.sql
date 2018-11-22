-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: bloodbank
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `Id` int(4) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Age` int(3) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Phone_no` char(20) DEFAULT NULL,
  `Blood_gp` varchar(4) DEFAULT NULL,
  `Health_issue` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (702,'Pramoda',36,'Basavanagudi','7729326105','B+','Heart'),(703,'Harini',27,'Hebbal','9723295322','AB+','Anemia'),(704,'Lakshmi',20,'Laggere','8877881122','O+','Anemia'),(705,'Lavanya',6,'RR Nagar','8844552200','O+','Heart Problem'),(706,'Kavya',16,'Vijayanagar','9977551133','O+','Anemia'),(707,'Anju',35,'Hebbal','8899770044','O+','Accident'),(708,'Adhi',23,'Kormangala','9944550012','AB-','Accident'),(709,'Abhi',24,'Kormangala','9977553300','AB+','Heart attack'),(710,'Sharu',30,'Bank Colony','9874561102','AB-','Cancer'),(711,'harshini',20,'srinagar','9584769521','B+','Accident'),(712,'Bhanu',20,'Srinivasnagar','8866112200','O+','Accident'),(713,'Hiranmayee',20,'Padmanabhanagar','9449216899','A+','accident');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 21:50:38
