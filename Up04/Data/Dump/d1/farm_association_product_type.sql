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
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `id` int unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `sku` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `product_level` int unsigned NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,NULL,'PT-001',1,'Растениеводство','Корневая категория продукции растениеводства'),(2,1,'PT-002',2,'Зерновые','Категория зерновых культур'),(3,2,'PT-003',3,'Пшеница','Зерновая культура'),(4,2,'PT-004',3,'Кукуруза','Зерновая культура'),(5,2,'PT-005',3,'Ячмень','Зерновая культура'),(6,1,'PT-006',2,'Овощи','Категория овощей'),(7,6,'PT-007',3,'Картофель','Корнеплод'),(8,6,'PT-008',3,'Морковь','Корнеплод'),(9,6,'PT-009',3,'Капуста','Овощная культура'),(10,1,'PT-010',2,'Фрукты','Категория фруктов'),(11,10,'PT-011',3,'Яблоко','Плодовая культура'),(12,10,'PT-012',3,'Груша','Плодовая культура'),(13,NULL,'PT-013',1,'Животноводство','Корневая категория продукции животноводства'),(14,13,'PT-014',2,'Крупный рогатый скот','Категория КРС'),(15,14,'PT-015',3,'Молочное стадо','Животноводческая категория'),(16,14,'PT-016',3,'Мясное стадо','Животноводческая категория'),(17,13,'PT-017',2,'Птицеводство','Категория птицеводства'),(18,17,'PT-018',3,'Куры-несушки','Категория яичного направления'),(19,17,'PT-019',3,'Бройлеры','Категория мясного направления'),(20,NULL,'PT-020',1,'Переработка','Корневая категория переработанной продукции'),(21,20,'PT-021',2,'Молочная продукция','Группа молочной продукции'),(22,21,'PT-022',3,'Молоко','Готовая молочная продукция'),(23,21,'PT-023',3,'Сыр','Готовая молочная продукция'),(24,21,'PT-024',3,'Масло сливочное','Готовая молочная продукция'),(25,NULL,'PT-025',1,'Материалы','Материалы и ресурсы для хозяйств'),(26,25,'PT-026',2,'Корма','Категория кормов'),(27,26,'PT-027',3,'Комбикорм','Корм для животных'),(28,26,'PT-028',3,'Сено','Корм грубый'),(29,25,'PT-029',2,'Удобрения','Категория удобрений'),(30,29,'PT-030',3,'Минеральные удобрения','Удобрения химического происхождения'),(31,29,'PT-031',3,'Органические удобрения','Удобрения органического происхождения'),(32,25,'PT-032',2,'Семена','Категория семенного материала'),(33,32,'PT-033',3,'Семена пшеницы','Посевной материал для пшеницы'),(34,32,'PT-034',3,'Семена кукурузы','Посевной материал для кукурузы');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
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
