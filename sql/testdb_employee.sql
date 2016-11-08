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
INSERT INTO `employee` VALUES ('1','happy@stark.com',199,'Happy Hogan','happyhogan',1478175738085,4000,'security','happy'),('10','teamC@stark.com',700,'TeamC','PASS1234',1478594194391,100,'employee',NULL),('11','teamD@stark.com',100,'TeamD','PASSWORD4',1478594191086,100,'employee',NULL),('12','teamE@stark.com',3600,'TeamE','Password5',1478594188011,100,'employee',NULL),('13','teamF@stark.com',100,'TeamF','pass1324',1478596656263,100,'employee',NULL),('14','teamG@stark.com',100,'TeamG','gpass1234',1478596539402,100,'employee',NULL),('15','teamH@stark.com',100,'TeamH','1234pass',1478596548605,100,'employee',NULL),('2','jarvis@stark.com',9999,'Jarvis','account',1478611757613,0,'account',NULL),('3','pepper@stark.com',600,'Pepper Pots','whoknows',1478177492852,5000,'admin','pepper'),('4','rakeshj@stark.com',9500,'Rakesh','1234',1474521419527,5000,'employee',NULL),('5','sachin@stark.com',3212,'Sachin','password1234',1478596921909,9999,'engineer','sachin'),('6','Tony@stark.com',97687,'Tony Stark','iamboss',1478609318591,9999,'ceo','tony'),('7','obadiah@stark.com',600,'Obadiaah Stane','cfo',1475239229103,5555,'cfo',NULL),('8','teamA@stark.com',800,'TeamA','pass1234',1478600621143,100,'employee',NULL),('9','teamB@stark.com',800,'TeamB','password2',1478600588294,100,'employee',NULL);
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

-- Dump completed on 2016-11-08 19:02:16
