-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 192.168.1.60    Database: staff
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(6) NOT NULL,
  `position` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `depart` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_dep_id` (`depart`),
  CONSTRAINT `foreign_dep_id` FOREIGN KEY (`depart`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'Петров','Петр',100000,'Зам. директор',2),(3,'Сидоров','Михаил',150000,'Зам. директор',2),(4,'Петрова','Екатерина',50000,'Начальник',1),(5,'Петров','Иван',25000,'Старший специалист',1),(6,'Сидоренко','Павел',45000,'Ведущий специалист',1),(7,'Кравченко','Ирина',55000,'Ведущий программист',3),(8,'Демченко','Татьяна',50000,'Ведущий программист',3),(9,'Сидорня','Анна',35000,'Старший программист',3),(10,'Минаков','Максим',25000,'Менеджер',4),(11,'Горячая','Елена',45000,'Начальник',4),(12,'Холодный','Денис',35000,'Старший менеджер',4),(13,'Савченко','Александр',30000,'Менеджер',4),(14,'Харченко','Руслан',45000,'Бухгалтер',5),(15,'Исянова','Галина',25000,'Программист',3),(16,'Исянова1','Галина1',25000,'Программист',3),(17,'Исянова2','Галина2',35000,'Старший программист',3),(18,'Исянова3','Галина3',45000,'Ведущий программист',3),(19,'Исянова4','Галина4',55000,'Главный программист',3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 15:24:51
