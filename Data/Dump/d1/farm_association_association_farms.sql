-- MySQL dump 10.13  Distrib 8.4.8, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: farm_association
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `association_farms`
--

DROP TABLE IF EXISTS `association_farms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `association_farms` (
  `farm_id` int unsigned NOT NULL,
  `association_id` int unsigned NOT NULL,
  `join_date` date NOT NULL,
  `status` enum('active','inactive','suspended') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `notes` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`farm_id`,`association_id`),
  KEY `fk_association_af` (`association_id`),
  CONSTRAINT `fk_association_af` FOREIGN KEY (`association_id`) REFERENCES `farm_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_farm_af` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `association_farms`
--

LOCK TABLES `association_farms` WRITE;
/*!40000 ALTER TABLE `association_farms` DISABLE KEYS */;
INSERT INTO `association_farms` VALUES (1,1,'2022-10-15','active',NULL),(2,2,'2022-01-29','active',NULL),(3,3,'2023-04-26','active',NULL),(4,4,'2022-01-26','active',NULL),(5,5,'2018-04-08','inactive','Ферма 5 включена в программу развития'),(6,6,'2019-06-19','active',NULL),(7,7,'2021-11-15','inactive',NULL),(8,8,'2020-10-27','suspended',NULL),(9,1,'2024-08-20','active',NULL),(10,2,'2022-05-02','inactive','Ферма 10 включена в программу развития'),(11,3,'2019-07-24','active',NULL),(12,4,'2021-12-23','suspended',NULL),(13,5,'2017-04-29','active',NULL),(14,6,'2025-05-31','inactive',NULL),(15,7,'2024-02-26','active','Ферма 15 включена в программу развития'),(16,8,'2019-07-29','inactive',NULL),(17,1,'2020-08-22','suspended',NULL),(18,2,'2019-05-27','active',NULL),(19,3,'2025-03-19','inactive',NULL),(20,4,'2024-04-12','active','Ферма 20 включена в программу развития'),(21,5,'2024-09-26','active',NULL),(22,6,'2017-06-22','active',NULL),(23,7,'2024-07-19','suspended',NULL),(24,8,'2022-12-02','active',NULL),(25,1,'2022-05-11','active','Ферма 25 включена в программу развития'),(26,2,'2022-09-08','active',NULL),(27,3,'2023-09-16','active',NULL),(28,4,'2016-11-21','active',NULL),(29,5,'2021-05-06','active',NULL),(30,6,'2025-06-27','active','Ферма 30 включена в программу развития'),(31,7,'2023-12-26','active',NULL),(32,8,'2018-01-23','inactive',NULL),(33,1,'2021-07-05','active',NULL),(34,2,'2017-11-01','active',NULL),(35,3,'2016-05-12','active','Ферма 35 включена в программу развития'),(36,4,'2016-03-02','inactive',NULL),(37,5,'2020-08-18','active',NULL),(38,6,'2023-07-12','suspended',NULL),(39,7,'2024-06-30','active',NULL),(40,8,'2017-12-26','inactive','Ферма 40 включена в программу развития'),(41,1,'2020-12-04','inactive',NULL),(42,2,'2021-06-29','active',NULL),(43,3,'2025-09-20','active',NULL),(44,4,'2018-10-07','active',NULL),(45,5,'2024-09-14','active','Ферма 45 включена в программу развития'),(46,6,'2024-03-30','active',NULL),(47,7,'2024-01-28','active',NULL),(48,8,'2022-11-09','suspended',NULL),(49,1,'2022-05-31','active',NULL),(50,2,'2021-11-21','active','Ферма 50 включена в программу развития'),(51,3,'2023-11-24','active',NULL),(52,4,'2021-11-02','active',NULL),(53,5,'2021-02-14','active',NULL),(54,6,'2016-06-22','inactive',NULL),(55,7,'2018-10-03','active','Ферма 55 включена в программу развития'),(56,8,'2020-06-08','suspended',NULL),(57,1,'2016-06-09','active',NULL),(58,2,'2021-10-15','active',NULL),(59,3,'2016-07-20','active',NULL),(60,4,'2020-12-05','active','Ферма 60 включена в программу развития');
/*!40000 ALTER TABLE `association_farms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 17:39:41
