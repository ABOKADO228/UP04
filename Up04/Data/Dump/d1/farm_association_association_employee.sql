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
-- Table structure for table `association_employee`
--

DROP TABLE IF EXISTS `association_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `association_employee` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int unsigned NOT NULL,
  `association_id` int unsigned NOT NULL,
  `role_id` tinyint unsigned NOT NULL,
  `employment_status_id` tinyint unsigned NOT NULL,
  `hire_date` date NOT NULL,
  `dismissal_date` date DEFAULT NULL,
  `salary` decimal(10,2) unsigned DEFAULT NULL,
  `contract_number` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assoc_emp_person` (`person_id`),
  KEY `fk_assoc_emp_association` (`association_id`),
  KEY `fk_assoc_emp_role` (`role_id`),
  KEY `fk_assoc_emp_status` (`employment_status_id`),
  CONSTRAINT `fk_assoc_emp_association` FOREIGN KEY (`association_id`) REFERENCES `farm_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_assoc_emp_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_assoc_emp_role` FOREIGN KEY (`role_id`) REFERENCES `association_role` (`id`),
  CONSTRAINT `fk_assoc_emp_status` FOREIGN KEY (`employment_status_id`) REFERENCES `employment_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `association_employee`
--

LOCK TABLES `association_employee` WRITE;
/*!40000 ALTER TABLE `association_employee` DISABLE KEYS */;
INSERT INTO `association_employee` VALUES (1,12,1,1,1,'2024-05-18',NULL,78271.49,'AE-01-0001'),(2,23,2,2,1,'2019-07-14',NULL,73413.87,'AE-02-0002'),(3,34,3,3,1,'2018-12-27',NULL,173232.51,'AE-03-0003'),(4,45,4,4,1,'2017-05-05',NULL,176631.98,'AE-04-0004'),(5,56,5,5,4,'2023-02-17',NULL,186928.53,'AE-05-0005'),(6,67,6,6,1,'2024-07-22',NULL,148688.83,'AE-06-0006'),(7,78,7,7,1,'2023-07-20',NULL,117323.87,'AE-07-0007'),(8,89,8,8,1,'2023-03-17',NULL,105128.41,'AE-08-0008'),(9,100,1,1,1,'2014-04-12',NULL,142439.78,'AE-01-0009'),(10,111,2,2,1,'2018-11-21',NULL,55570.36,'AE-02-0010'),(11,122,3,3,1,'2016-01-14',NULL,37469.18,'AE-03-0011'),(12,133,4,4,1,'2017-08-18',NULL,144012.20,'AE-04-0012'),(13,144,5,5,3,'2014-07-19',NULL,186345.22,'AE-05-0013'),(14,155,6,6,1,'2017-02-09',NULL,170500.85,'AE-06-0014'),(15,166,7,7,1,'2024-11-24',NULL,170090.53,'AE-07-0015'),(16,177,8,8,1,'2014-01-12',NULL,168359.31,'AE-08-0016'),(17,188,1,1,1,'2021-06-20',NULL,117292.65,'AE-01-0017'),(18,199,2,2,1,'2020-01-20',NULL,143198.52,'AE-02-0018'),(19,210,3,3,1,'2025-01-12',NULL,158144.21,'AE-03-0019'),(20,221,4,4,2,'2015-10-26',NULL,131170.56,'AE-04-0020'),(21,232,5,5,1,'2015-03-26',NULL,114784.15,'AE-05-0021'),(22,243,6,6,4,'2022-03-01',NULL,172636.58,'AE-06-0022'),(23,4,7,7,1,'2022-03-14',NULL,107129.70,'AE-07-0023'),(24,15,8,8,1,'2019-08-22',NULL,62166.45,'AE-08-0024'),(25,26,1,1,1,'2015-07-03',NULL,121917.52,'AE-01-0025'),(26,37,2,2,1,'2020-06-25',NULL,187094.00,'AE-02-0026'),(27,48,3,3,1,'2016-07-19',NULL,135600.95,'AE-03-0027'),(28,59,4,4,1,'2018-09-15',NULL,151741.89,'AE-04-0028'),(29,70,5,5,1,'2021-03-10',NULL,89670.31,'AE-05-0029'),(30,81,6,6,1,'2023-06-27',NULL,77957.53,'AE-06-0030'),(31,92,7,7,1,'2021-09-29',NULL,105123.65,'AE-07-0031'),(32,103,8,8,1,'2016-10-02',NULL,107875.40,'AE-08-0032'),(33,114,1,1,1,'2020-07-22',NULL,105056.65,'AE-01-0033'),(34,125,2,2,1,'2015-06-22',NULL,64194.81,'AE-02-0034'),(35,136,3,3,4,'2020-06-03',NULL,47426.41,'AE-03-0035');
/*!40000 ALTER TABLE `association_employee` ENABLE KEYS */;
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
