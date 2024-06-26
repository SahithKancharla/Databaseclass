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
-- Table structure for table `investor`
--

DROP TABLE IF EXISTS `investor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investor` (
  `INVESTORID` int NOT NULL,
  `FIRSTNAME` varchar(45) NOT NULL,
  `LASTNAME` varchar(45) NOT NULL,
  `PORTFOLIOID` int DEFAULT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `PASSWORD` varchar(512) NOT NULL,
  PRIMARY KEY (`INVESTORID`),
  KEY `PORTFOLIOID` (`PORTFOLIOID`),
  CONSTRAINT `investor_ibfk_1` FOREIGN KEY (`PORTFOLIOID`) REFERENCES `portfolio` (`PORTFOLIOID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor`
--

LOCK TABLES `investor` WRITE;
/*!40000 ALTER TABLE `investor` DISABLE KEYS */;
INSERT INTO `investor` VALUES (1,'Wade','SMITH',1,'user1@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(2,'Dave','JOHNSON',2,'user2@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(3,'Seth','WILLIAMS',3,'user3@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(4,'Ivan','BROWN',4,'user4@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(5,'Riley','JONES',5,'user5@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(6,'Gilbert','GARCIA',6,'user6@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(7,'Jorge','MILLER',7,'user7@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(8,'Dan','DAVIS',8,'user8@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(9,'Brian','RODRIGUEZ',9,'user9@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(10,'Roberto','MARTINEZ',10,'user10@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(11,'Ramon','HERNANDEZ',11,'user11@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(12,'Miles','LOPEZ',12,'user12@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(13,'Liam','GONZALEZ',13,'user13@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(14,'Nathaniel','WILSON',14,'user14@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(15,'Ethan','ANDERSON',15,'user15@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(16,'Lewis','THOMAS',16,'user16@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(17,'Milton','TAYLOR',17,'user17@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(18,'Claude','MOORE',18,'user18@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(19,'Joshua','JACKSON',19,'user19@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(20,'Glen','MARTIN',20,'user20@gmail.com','a97a7743097812cbca8ae294001d5fb0069b8d6e2055925e16285a686e86ff16'),(21,'Sahith','kancharla',21,'sahith@vt.edu','15f4770913e1878147f11944b997df9af6072438bb2a4aa0b2ce252e448bca8d');
/*!40000 ALTER TABLE `investor` ENABLE KEYS */;
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
