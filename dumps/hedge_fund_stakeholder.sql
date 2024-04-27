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
-- Table structure for table `stakeholder`
--

DROP TABLE IF EXISTS `stakeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stakeholder` (
  `STAKEHOLDERID` int NOT NULL,
  `FIRSTNAME` varchar(20) NOT NULL,
  `LASTNAME` varchar(20) NOT NULL,
  `STAKEPERCENT` float NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `PASSWORD` varchar(512) NOT NULL,
  PRIMARY KEY (`STAKEHOLDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stakeholder`
--

LOCK TABLES `stakeholder` WRITE;
/*!40000 ALTER TABLE `stakeholder` DISABLE KEYS */;
INSERT INTO `stakeholder` VALUES (1,'Wade','SMITH',0.7591,'user1@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(2,'Dave','JOHNSON',0.1542,'user2@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(3,'Seth','WILLIAMS',0.6243,'user3@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(4,'Ivan','BROWN',0.8957,'user4@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(5,'Riley','JONES',0.2876,'user5@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(6,'Gilbert','GARCIA',0.4812,'user6@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(7,'Jorge','MILLER',0.9024,'user7@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(8,'Dan','DAVIS',0.3658,'user8@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(9,'Brian','RODRIGUEZ',0.0437,'user9@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(10,'Roberto','MARTINEZ',0.7189,'user10@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(11,'Ramon','HERNANDEZ',0.8306,'user11@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(12,'Miles','LOPEZ',0.1098,'user12@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(13,'Liam','GONZALEZ',0.5471,'user13@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(14,'Nathaniel','WILSON',0.6703,'user14@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(15,'Ethan','ANDERSON',0.2465,'user15@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(16,'Lewis','THOMAS',0.8134,'user16@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(17,'Milton','TAYLOR',0.3912,'user17@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(18,'Claude','MOORE',0.6047,'user18@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(19,'Joshua','JACKSON',0.9512,'user19@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(20,'Glen','MARTIN',0.1823,'user20@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(21,'Harvey','LEE',0.7389,'user21@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(22,'Blake','PEREZ',0.5024,'user22@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(23,'Antonio','THOMPSON',0.6598,'user23@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(24,'Connor','WHITE',0.2976,'user24@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(25,'Julian','HARRIS',0.8741,'user25@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(26,'Aidan','SANCHEZ',0.4156,'user26@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(27,'Harold','CLARK',0.0743,'user27@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(28,'Conner','RAMIREZ',0.8265,'user28@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(29,'Peter','LEWIS',0.1357,'user29@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(30,'Hunter','ROBINSON',0.9284,'user30@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(31,'Gurkirat','Singh',40.9667,'user31@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(32,'Sahith','Kancharla',43,'sahith@vt.edu','15f4770913e1878147f11944b997df9af6072438bb2a4aa0b2ce252e448bca8d');
/*!40000 ALTER TABLE `stakeholder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-26 11:13:56