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
-- Table structure for table `farm_plot_type`
--

DROP TABLE IF EXISTS `farm_plot_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm_plot_type` (
  `id` int unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `farm_plot_level` int unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_plot_type`
--

LOCK TABLES `farm_plot_type` WRITE;
/*!40000 ALTER TABLE `farm_plot_type` DISABLE KEYS */;
INSERT INTO `farm_plot_type` VALUES (1,'Сельхозземля','Корневой тип земель сельхозназначения',1,NULL),(2,'Полевой участок','Открытый полевой участок',2,1),(3,'Орошаемый участок','Полевой участок с орошением',3,2),(4,'Богарный участок','Полевой участок без орошения',3,2),(5,'Тепличный комплекс','Участок защищенного грунта',2,1),(6,'Стеклянная теплица','Капитальная стеклянная теплица',3,5),(7,'Пленочная теплица','Легкая пленочная теплица',3,5),(8,'Сад','Плодовый участок',2,1),(9,'Яблоневый сад','Сад яблонь',3,8),(10,'Грушевый сад','Сад груш',3,8),(11,'Пастбище','Участок для выпаса животных',2,1),(12,'Культурное пастбище','Улучшенное пастбище',3,11),(13,'Животноводческая зона','Корневой тип для производственных зон',1,NULL),(14,'Коровник','Здание/зона для содержания КРС',2,13),(15,'Птичник','Здание/зона для птицы',2,13);
/*!40000 ALTER TABLE `farm_plot_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 17:39:43
