-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hedge_fund
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade` (
  `TRADEID` int NOT NULL AUTO_INCREMENT,
  `ENTRYPRICE` int NOT NULL,
  `EXITPRICE` int DEFAULT NULL,
  `QUANTITY` int NOT NULL,
  `EXITED` tinyint(1) NOT NULL DEFAULT '0',
  `FULFILLEDTIME` datetime NOT NULL,
  `CONTRACTID` int DEFAULT '0',
  `EMPLOYEEID` int DEFAULT '0',
  PRIMARY KEY (`TRADEID`),
  KEY `trade_ibfk_1` (`CONTRACTID`),
  KEY `trade_ibfk_3` (`EMPLOYEEID`),
  CONSTRAINT `trade_ibfk_1` FOREIGN KEY (`CONTRACTID`) REFERENCES `contracttype` (`CONTRACTID`) ON DELETE SET NULL,
  CONSTRAINT `trade_ibfk_3` FOREIGN KEY (`EMPLOYEEID`) REFERENCES `employee` (`EMPLOYEEID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (61,516,516,32,1,'2024-04-13 20:36:03',4,31),(62,512,512,5,1,'2024-04-13 22:58:18',6,31),(63,6563,6563,2,1,'2024-04-13 23:22:32',5,31),(64,785,785,13,1,'2024-04-13 23:32:10',3,31),(65,12,12,263,1,'2024-04-13 23:34:07',2,31),(66,56,NULL,21,0,'2024-04-13 23:44:52',2,31),(67,78,NULL,134,0,'2024-04-14 10:55:49',8,31),(68,520,NULL,65,0,'2024-04-14 13:11:51',7,31);
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-26 11:13:57
