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
-- Table structure for table `hedgefund`
--

DROP TABLE IF EXISTS `hedgefund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hedgefund` (
  `REPORTDATE` date NOT NULL,
  `TOTALVALUE` float NOT NULL,
  `DAILYCHANGE` float NOT NULL,
  `CASHPOSITION` float NOT NULL,
  PRIMARY KEY (`REPORTDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hedgefund`
--

LOCK TABLES `hedgefund` WRITE;
/*!40000 ALTER TABLE `hedgefund` DISABLE KEYS */;
INSERT INTO `hedgefund` VALUES ('2024-02-01',1000000,0.005,50000),('2024-02-02',1012000,0.0119,52000),('2024-02-03',990000,-0.0121,48000),('2024-02-04',980000,-0.0102,47000),('2024-02-05',990500,0.0106,48050),('2024-02-06',975000,-0.0159,46000),('2024-02-07',990200,0.0155,48100),('2024-02-08',995000,0.0048,48500),('2024-02-09',1000500,0.0504,50000),('2024-02-10',1010000,0.0095,51000),('2024-02-11',1008000,-0.002,50800),('2024-02-12',995000,-0.053,46500),('2024-02-13',990300,-0.0047,45800),('2024-02-14',1020000,0.0297,52800),('2024-02-15',1030000,0.01,55000),('2024-02-16',1025000,-0.0049,54000),('2024-02-17',1018000,-0.0068,53000),('2024-02-18',1007000,-0.0108,51500),('2024-02-19',1015000,0.0079,52500),('2024-02-20',1023000,0.0079,53500),('2024-02-21',1030000,0.0069,55000),('2024-02-22',1010000,-0.02,51000),('2024-02-23',1025000,0.0148,53000),('2024-02-24',1012000,-0.013,51500),('2024-02-25',1030000,0.0177,53500),('2024-02-26',1040000,0.01,55000),('2024-02-27',1035000,-0.0048,54500),('2024-02-28',1020000,-0.0147,53000),('2024-02-29',1015000,-0.005,52500),('2024-03-01',1028000,0.013,54000);
/*!40000 ALTER TABLE `hedgefund` ENABLE KEYS */;
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