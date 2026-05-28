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
-- Table structure for table `farm_owner`
--

DROP TABLE IF EXISTS `farm_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm_owner` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int unsigned NOT NULL,
  `status` enum('active','inactive','archived') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `rating` decimal(5,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_owner_person` (`person_id`),
  CONSTRAINT `fk_owner_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_owner`
--

LOCK TABLES `farm_owner` WRITE;
/*!40000 ALTER TABLE `farm_owner` DISABLE KEYS */;
INSERT INTO `farm_owner` VALUES (1,120,'inactive',85.70),(2,78,'active',73.77),(3,177,'inactive',62.42),(4,42,'active',87.33),(5,176,'archived',92.57),(6,122,'active',95.55),(7,44,'active',80.32),(8,28,'active',82.20),(9,43,'inactive',82.21),(10,164,'inactive',94.16),(11,93,'active',94.68),(12,137,'active',76.72),(13,134,'inactive',74.61),(14,82,'active',84.15),(15,71,'active',93.64),(16,144,'active',88.09),(17,59,'active',64.97),(18,69,'archived',93.85),(19,60,'active',85.63),(20,40,'active',74.26),(21,138,'active',76.45),(22,75,'active',83.54),(23,79,'active',91.78),(24,72,'inactive',82.27),(25,161,'active',96.58),(26,74,'active',75.88),(27,126,'active',62.36),(28,141,'inactive',69.27),(29,61,'active',67.38),(30,81,'active',79.50),(31,63,'active',91.36),(32,178,'active',74.77),(33,171,'active',58.92),(34,57,'active',69.06),(35,152,'archived',88.16),(36,151,'active',72.95),(37,109,'active',79.43),(38,142,'inactive',90.23),(39,116,'archived',83.37),(40,130,'inactive',80.02),(41,179,'active',75.30),(42,67,'active',91.73),(43,29,'inactive',92.57),(44,112,'active',89.15),(45,133,'active',86.89),(46,91,'active',75.14),(47,27,'active',84.32),(48,25,'active',70.80),(49,165,'active',90.60),(50,70,'active',71.64),(51,20,'active',94.91),(52,92,'active',91.57),(53,158,'active',73.21),(54,50,'active',63.72),(55,64,'active',92.92),(56,89,'active',91.69),(57,51,'active',70.04),(58,55,'inactive',57.07),(59,117,'active',84.91),(60,30,'active',94.68),(61,38,'active',81.22),(62,105,'active',97.89),(63,125,'active',87.76),(64,65,'active',74.26),(65,124,'active',96.13),(66,168,'inactive',95.50),(67,87,'active',62.73),(68,45,'inactive',59.61),(69,172,'active',81.97),(70,159,'active',94.22),(71,114,'active',82.10),(72,56,'active',66.05),(73,110,'active',70.26),(74,85,'active',90.81),(75,119,'active',81.81),(76,128,'inactive',77.80),(77,37,'inactive',79.38),(78,97,'active',87.79),(79,157,'active',64.67),(80,86,'active',86.79);
/*!40000 ALTER TABLE `farm_owner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 17:39:42
