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
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `legal_address` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive','suspended','archived') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'АгроТрейд-01','г. Белгород, ул. Степная, д. 51','active'),(2,'ЗерноСнаб-02','г. Тамбов, ул. Луговая, д. 52','inactive'),(3,'ФермерМаркет-03','г. Ставрополь, ул. Садовая, д. 53','active'),(4,'ТехноПоставка-04','г. Волгоград, ул. Школьная, д. 54','active'),(5,'СеменаЮг-05','г. Краснодар, ул. Центральная, д. 55','active'),(6,'УдобренияПлюс-06','г. Белгород, ул. Степная, д. 56','active'),(7,'КомбикормСервис-07','г. Тамбов, ул. Луговая, д. 57','active'),(8,'ЛогистикАгро-08','г. Ставрополь, ул. Садовая, д. 58','active'),(9,'СкладРесурс-09','г. Волгоград, ул. Школьная, д. 59','suspended'),(10,'ПолевойПартнер-10','г. Краснодар, ул. Центральная, д. 60','active'),(11,'АгроТрейд-11','г. Белгород, ул. Степная, д. 61','active'),(12,'ЗерноСнаб-12','г. Тамбов, ул. Луговая, д. 62','active'),(13,'ФермерМаркет-13','г. Ставрополь, ул. Садовая, д. 63','active'),(14,'ТехноПоставка-14','г. Волгоград, ул. Школьная, д. 64','inactive'),(15,'СеменаЮг-15','г. Краснодар, ул. Центральная, д. 65','active'),(16,'УдобренияПлюс-16','г. Белгород, ул. Степная, д. 66','active'),(17,'КомбикормСервис-17','г. Тамбов, ул. Луговая, д. 67','suspended'),(18,'ЛогистикАгро-18','г. Ставрополь, ул. Садовая, д. 68','inactive'),(19,'СкладРесурс-19','г. Волгоград, ул. Школьная, д. 69','active'),(20,'ПолевойПартнер-20','г. Краснодар, ул. Центральная, д. 70','active'),(21,'АгроТрейд-21','г. Белгород, ул. Степная, д. 71','inactive'),(22,'ЗерноСнаб-22','г. Тамбов, ул. Луговая, д. 72','active'),(23,'ФермерМаркет-23','г. Ставрополь, ул. Садовая, д. 73','active'),(24,'ТехноПоставка-24','г. Волгоград, ул. Школьная, д. 74','active'),(25,'СеменаЮг-25','г. Краснодар, ул. Центральная, д. 75','archived');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
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
