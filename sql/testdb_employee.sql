CREATE DATABASE  IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `testdb`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `balance` int(32) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastlogontime` double DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('1','happy@stark.com',1001,'Happy','happyhogan',1474095772284,4000,'security',NULL),('10','teamC@stark.com',500,'TeamC','PASS1234',NULL,100,'employee',NULL),('11','teamD@stark.com',500,'TeamD','PASSWORD4',NULL,100,'employee',NULL),('2','jarvis@stark.com',99,'Jarvis','account',1474039663045,0,'account',NULL),('3','pepper@stark.com',1000,'Pepper Pots','whoknows',1474093141386,5000,'admin','pepper'),('4','rakeshj@stark.com',4500,'Rakesh','1234',1474036051708,5000,'employee',NULL),('5','sachin@stark.com',100,'Sachin','password1234',1474095876362,9999,'engineer','sachin'),('6','Tony@stark.com',1000,'Tony Stark','iamboss',1474091306078,9999,'ceo','tony'),('7','obadiah@stark.com',1000,'Obadiaah Stane','cfo',1474095123344,5555,'cfo',NULL),('8','teamA@stark.com',500,'TeamA','pass1234',NULL,100,'employee',NULL),('9','teamB@stark.com',500,'TeamB','password2',NULL,100,'employee',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-17 12:43:37
