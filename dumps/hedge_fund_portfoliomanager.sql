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
-- Table structure for table `portfoliomanager`
--

DROP TABLE IF EXISTS `portfoliomanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfoliomanager` (
  `MANAGERID` int NOT NULL,
  `FIRSTNAME` varchar(20) NOT NULL,
  `LASTNAME` varchar(20) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `PASSWORD` varchar(256) NOT NULL,
  `TOTALCASH` int NOT NULL DEFAULT '0',
  `TOTALINVESTED` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MANAGERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfoliomanager`
--

LOCK TABLES `portfoliomanager` WRITE;
/*!40000 ALTER TABLE `portfoliomanager` DISABLE KEYS */;
INSERT INTO `portfoliomanager` VALUES (1,'Default','Value','default@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(2,'Dave','JOHNSON','user2@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(3,'Seth','WILLIAMS','user3@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(4,'Ivan','BROWN','user4@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(5,'Riley','JONES','user5@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(6,'Gilbert','GARCIA','user6@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(7,'Jorge','MILLER','user7@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(8,'Dan','DAVIS','user8@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(9,'Brian','RODRIGUEZ','user9@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(10,'Roberto','MARTINEZ','user10@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(11,'Ramon','HERNANDEZ','user11@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(12,'Miles','LOPEZ','user12@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(13,'Liam','GONZALEZ','user13@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(14,'Nathaniel','WILSON','user14@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(15,'Ethan','ANDERSON','user15@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(16,'Lewis','THOMAS','user16@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(17,'Milton','TAYLOR','user17@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(18,'Claude','MOORE','user18@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(19,'Joshua','JACKSON','user19@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(20,'Glen','MARTIN','user20@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(21,'Harvey','LEE','user21@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(22,'Blake','PEREZ','user22@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(23,'Antonio','THOMPSON','user23@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(24,'Connor','WHITE','user24@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(25,'Julian','HARRIS','user25@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(26,'Aidan','SANCHEZ','user26@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(27,'Harold','CLARK','user27@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(28,'Conner','RAMIREZ','user28@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(29,'Peter','LEWIS','user29@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(30,'Hunter','ROBINSON','user30@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16',0,0),(31,'Sahith','kancharla','sahith@vt.edu','15f4770913e1878147f11944b997df9af6072438bb2a4aa0b2ce252e448bca8d',54572,45428);
/*!40000 ALTER TABLE `portfoliomanager` ENABLE KEYS */;
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
