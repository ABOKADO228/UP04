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
-- Table structure for table `farm_plot_assignment`
--

DROP TABLE IF EXISTS `farm_plot_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm_plot_assignment` (
  `farm_id` int unsigned NOT NULL,
  `farm_plot_id` int unsigned NOT NULL,
  `status` enum('active','inactive','suspended') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `notes` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`farm_id`,`farm_plot_id`),
  KEY `fk_farm_plot_plot` (`farm_plot_id`),
  CONSTRAINT `fk_farm_plot_farm` FOREIGN KEY (`farm_id`) REFERENCES `farm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_farm_plot_plot` FOREIGN KEY (`farm_plot_id`) REFERENCES `farm_plot` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_plot_assignment`
--

LOCK TABLES `farm_plot_assignment` WRITE;
/*!40000 ALTER TABLE `farm_plot_assignment` DISABLE KEYS */;
INSERT INTO `farm_plot_assignment` VALUES (1,1,'active',NULL),(1,61,'active',NULL),(1,121,'active',NULL),(1,181,'inactive',NULL),(2,2,'active',NULL),(2,62,'inactive',NULL),(2,122,'active',NULL),(2,182,'active',NULL),(3,3,'active',NULL),(3,63,'active',NULL),(3,123,'active',NULL),(3,183,'active',NULL),(4,4,'active',NULL),(4,64,'inactive',NULL),(4,124,'active',NULL),(4,184,'active',NULL),(5,5,'active',NULL),(5,65,'active',NULL),(5,125,'active',NULL),(5,185,'active',NULL),(6,6,'active','Привязка участка 6 к ферме 6'),(6,66,'active','Привязка участка 66 к ферме 6'),(6,126,'active','Привязка участка 126 к ферме 6'),(6,186,'suspended','Привязка участка 186 к ферме 6'),(7,7,'active',NULL),(7,67,'active',NULL),(7,127,'active',NULL),(7,187,'active',NULL),(8,8,'active',NULL),(8,68,'inactive',NULL),(8,128,'active',NULL),(8,188,'active',NULL),(9,9,'active',NULL),(9,69,'active',NULL),(9,129,'inactive',NULL),(9,189,'active',NULL),(10,10,'active',NULL),(10,70,'active',NULL),(10,130,'inactive',NULL),(10,190,'suspended',NULL),(11,11,'active',NULL),(11,71,'suspended',NULL),(11,131,'active',NULL),(11,191,'active',NULL),(12,12,'active','Привязка участка 12 к ферме 12'),(12,72,'active','Привязка участка 72 к ферме 12'),(12,132,'active','Привязка участка 132 к ферме 12'),(12,192,'active','Привязка участка 192 к ферме 12'),(13,13,'suspended',NULL),(13,73,'inactive',NULL),(13,133,'suspended',NULL),(13,193,'active',NULL),(14,14,'inactive',NULL),(14,74,'active',NULL),(14,134,'active',NULL),(14,194,'active',NULL),(15,15,'active',NULL),(15,75,'suspended',NULL),(15,135,'active',NULL),(15,195,'active',NULL),(16,16,'suspended',NULL),(16,76,'active',NULL),(16,136,'active',NULL),(16,196,'active',NULL),(17,17,'inactive',NULL),(17,77,'active',NULL),(17,137,'active',NULL),(17,197,'active',NULL),(18,18,'active','Привязка участка 18 к ферме 18'),(18,78,'active','Привязка участка 78 к ферме 18'),(18,138,'active','Привязка участка 138 к ферме 18'),(18,198,'suspended','Привязка участка 198 к ферме 18'),(19,19,'active',NULL),(19,79,'inactive',NULL),(19,139,'active',NULL),(19,199,'suspended',NULL),(20,20,'inactive',NULL),(20,80,'suspended',NULL),(20,140,'active',NULL),(20,200,'active',NULL),(21,21,'active',NULL),(21,81,'active',NULL),(21,141,'active',NULL),(21,201,'active',NULL),(22,22,'active',NULL),(22,82,'active',NULL),(22,142,'active',NULL),(22,202,'active',NULL),(23,23,'active',NULL),(23,83,'active',NULL),(23,143,'inactive',NULL),(23,203,'active',NULL),(24,24,'active','Привязка участка 24 к ферме 24'),(24,84,'active','Привязка участка 84 к ферме 24'),(24,144,'active','Привязка участка 144 к ферме 24'),(24,204,'suspended','Привязка участка 204 к ферме 24'),(25,25,'active',NULL),(25,85,'active',NULL),(25,145,'active',NULL),(25,205,'suspended',NULL),(26,26,'active',NULL),(26,86,'active',NULL),(26,146,'inactive',NULL),(26,206,'suspended',NULL),(27,27,'active',NULL),(27,87,'active',NULL),(27,147,'active',NULL),(27,207,'suspended',NULL),(28,28,'active',NULL),(28,88,'active',NULL),(28,148,'active',NULL),(28,208,'active',NULL),(29,29,'suspended',NULL),(29,89,'active',NULL),(29,149,'active',NULL),(29,209,'active',NULL),(30,30,'active','Привязка участка 30 к ферме 30'),(30,90,'active','Привязка участка 90 к ферме 30'),(30,150,'active','Привязка участка 150 к ферме 30'),(30,210,'active','Привязка участка 210 к ферме 30'),(31,31,'active',NULL),(31,91,'suspended',NULL),(31,151,'active',NULL),(31,211,'active',NULL),(32,32,'active',NULL),(32,92,'suspended',NULL),(32,152,'active',NULL),(32,212,'active',NULL),(33,33,'active',NULL),(33,93,'active',NULL),(33,153,'active',NULL),(33,213,'active',NULL),(34,34,'active',NULL),(34,94,'active',NULL),(34,154,'active',NULL),(34,214,'active',NULL),(35,35,'inactive',NULL),(35,95,'active',NULL),(35,155,'active',NULL),(35,215,'inactive',NULL),(36,36,'active','Привязка участка 36 к ферме 36'),(36,96,'active','Привязка участка 96 к ферме 36'),(36,156,'suspended','Привязка участка 156 к ферме 36'),(36,216,'active','Привязка участка 216 к ферме 36'),(37,37,'suspended',NULL),(37,97,'active',NULL),(37,157,'active',NULL),(37,217,'active',NULL),(38,38,'active',NULL),(38,98,'active',NULL),(38,158,'active',NULL),(38,218,'active',NULL),(39,39,'active',NULL),(39,99,'active',NULL),(39,159,'active',NULL),(39,219,'active',NULL),(40,40,'active',NULL),(40,100,'active',NULL),(40,160,'inactive',NULL),(40,220,'active',NULL),(41,41,'suspended',NULL),(41,101,'active',NULL),(41,161,'active',NULL),(42,42,'inactive','Привязка участка 42 к ферме 42'),(42,102,'active','Привязка участка 102 к ферме 42'),(42,162,'active','Привязка участка 162 к ферме 42'),(43,43,'inactive',NULL),(43,103,'active',NULL),(43,163,'active',NULL),(44,44,'active',NULL),(44,104,'active',NULL),(44,164,'active',NULL),(45,45,'active',NULL),(45,105,'active',NULL),(45,165,'active',NULL),(46,46,'active',NULL),(46,106,'active',NULL),(46,166,'active',NULL),(47,47,'active',NULL),(47,107,'active',NULL),(47,167,'active',NULL),(48,48,'active','Привязка участка 48 к ферме 48'),(48,108,'active','Привязка участка 108 к ферме 48'),(48,168,'suspended','Привязка участка 168 к ферме 48'),(49,49,'active',NULL),(49,109,'active',NULL),(49,169,'active',NULL),(50,50,'active',NULL),(50,110,'active',NULL),(50,170,'active',NULL),(51,51,'inactive',NULL),(51,111,'active',NULL),(51,171,'active',NULL),(52,52,'active',NULL),(52,112,'active',NULL),(52,172,'inactive',NULL),(53,53,'active',NULL),(53,113,'suspended',NULL),(53,173,'active',NULL),(54,54,'active','Привязка участка 54 к ферме 54'),(54,114,'active','Привязка участка 114 к ферме 54'),(54,174,'active','Привязка участка 174 к ферме 54'),(55,55,'active',NULL),(55,115,'active',NULL),(55,175,'active',NULL),(56,56,'active',NULL),(56,116,'active',NULL),(56,176,'inactive',NULL),(57,57,'active',NULL),(57,117,'active',NULL),(57,177,'active',NULL),(58,58,'active',NULL),(58,118,'active',NULL),(58,178,'suspended',NULL),(59,59,'active',NULL),(59,119,'active',NULL),(59,179,'active',NULL),(60,60,'active','Привязка участка 60 к ферме 60'),(60,120,'active','Привязка участка 120 к ферме 60'),(60,180,'active','Привязка участка 180 к ферме 60');
/*!40000 ALTER TABLE `farm_plot_assignment` ENABLE KEYS */;
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
