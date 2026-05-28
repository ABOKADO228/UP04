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
-- Table structure for table `farm_association`
--

DROP TABLE IF EXISTS `farm_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farm_association` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `inn` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `ogrn` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `legal_address` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive','suspended','archived') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_association`
--

LOCK TABLES `farm_association` WRITE;
/*!40000 ALTER TABLE `farm_association` DISABLE KEYS */;
INSERT INTO `farm_association` VALUES (1,'7700000001','1027700000001','Ассоциация фермеров «Агросоюз-01»','г. Краснодар, ул. Садовая, д. 11','active'),(2,'7700000002','1027700000002','Ассоциация фермеров «Агросоюз-02»','г. Ростов-на-Дону, ул. Степная, д. 12','active'),(3,'7700000003','1027700000003','Ассоциация фермеров «Агросоюз-03»','г. Белгород, ул. Школьная, д. 13','active'),(4,'7700000004','1027700000004','Ассоциация фермеров «Агросоюз-04»','г. Воронеж, ул. Луговая, д. 14','active'),(5,'7700000005','1027700000005','Ассоциация фермеров «Агросоюз-05»','г. Тамбов, ул. Центральная, д. 15','inactive'),(6,'7700000006','1027700000006','Ассоциация фермеров «Агросоюз-06»','г. Липецк, ул. Садовая, д. 16','suspended'),(7,'7700000007','1027700000007','Ассоциация фермеров «Агросоюз-07»','г. Ставрополь, ул. Степная, д. 17','active'),(8,'7700000008','1027700000008','Ассоциация фермеров «Агросоюз-08»','г. Саратов, ул. Школьная, д. 18','active');
/*!40000 ALTER TABLE `farm_association` ENABLE KEYS */;
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
