-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: staff
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `AVG_zp_depart`
--

DROP TABLE IF EXISTS `AVG_zp_depart`;
/*!50001 DROP VIEW IF EXISTS `AVG_zp_depart`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `AVG_zp_depart` AS SELECT 
 1 AS `name_depart`,
 1 AS `avg_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_employees_in_depart`
--

DROP TABLE IF EXISTS `count_employees_in_depart`;
/*!50001 DROP VIEW IF EXISTS `count_employees_in_depart`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `count_employees_in_depart` AS SELECT 
 1 AS `name_depart`,
 1 AS `count_employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `count_employees_in_depart_with_FOT`
--

DROP TABLE IF EXISTS `count_employees_in_depart_with_FOT`;
/*!50001 DROP VIEW IF EXISTS `count_employees_in_depart_with_FOT`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `count_employees_in_depart_with_FOT` AS SELECT 
 1 AS `name_depart`,
 1 AS `count_employees`,
 1 AS `FOT_depart`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Кадры',4),(2,'Руководство',1),(3,'ИТ',NULL),(4,'Отдел продаж',11),(5,'Бухгалетрия',NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_with_max_salary`
--

DROP TABLE IF EXISTS `employee_with_max_salary`;
/*!50001 DROP VIEW IF EXISTS `employee_with_max_salary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `employee_with_max_salary` AS SELECT 
 1 AS `id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `salary`,
 1 AS `position`*/;
SET character_set_client = @saved_cs_client;

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
  KEY `last_name_ind` (`last_name`),
  CONSTRAINT `foreign_dep_id` FOREIGN KEY (`depart`) REFERENCES `departments` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'Петров','Петр',100000,'Зам. директор',2),(4,'Петрова','Екатерина',50000,'Начальник',1),(5,'Петров','Иван',25000,'Старший специалист',1),(6,'Сидоренко','Павел',45000,'Ведущий специалист',1),(7,'Кравченко','Ирина',55000,'Ведущий программист',3),(8,'Демченко','Татьяна',50000,'Ведущий программист',3),(9,'Сидорня','Анна',35000,'Старший программист',3),(10,'Минаков','Максим',25000,'Менеджер',4),(11,'Горячая','Елена',45000,'Начальник',4),(12,'Холодный','Денис',35000,'Старший менеджер',4),(13,'Савченко','Александр',30000,'Менеджер',4),(14,'Харченко','Руслан',45000,'Бухгалтер',5),(15,'Исянова','Галина',25000,'Программист',3),(16,'Исянова1','Галина1',25000,'Программист',3),(17,'Исянова2','Галина2',35000,'Старший программист',3),(18,'Исянова3','Галина3',45000,'Ведущий программист',3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `new_employee_bonus` AFTER INSERT ON `employees` FOR EACH ROW INSERT INTO `salary` (`id_employee`, `sum`)
VALUES  (NEW.id, NEW.salary * 2) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(4) NOT NULL,
  `sum` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_employee_idx` (`id_employee`),
  CONSTRAINT `fk_id_employee` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,15,50000.00),(2,16,50000.00),(3,17,70000.00),(4,18,90000.00);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `AVG_zp_depart`
--

/*!50001 DROP VIEW IF EXISTS `AVG_zp_depart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AVG_zp_depart` AS select `departments`.`name` AS `name_depart`,`A`.`avg_salary` AS `avg_salary` from ((select avg(`employees`.`salary`) AS `avg_salary`,`employees`.`depart` AS `depart` from `employees` group by `employees`.`depart`) `A` left join `departments` on((`A`.`depart` = `departments`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_employees_in_depart`
--

/*!50001 DROP VIEW IF EXISTS `count_employees_in_depart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `count_employees_in_depart` AS select `departments`.`name` AS `name_depart`,`A`.`count_employees` AS `count_employees` from ((select count(0) AS `count_employees`,`employees`.`depart` AS `depart` from `employees` group by `employees`.`depart`) `A` left join `departments` on((`A`.`depart` = `departments`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `count_employees_in_depart_with_FOT`
--

/*!50001 DROP VIEW IF EXISTS `count_employees_in_depart_with_FOT`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `count_employees_in_depart_with_FOT` AS select `departments`.`name` AS `name_depart`,`A`.`count_employees` AS `count_employees`,`A`.`FOT_depart` AS `FOT_depart` from ((select count(0) AS `count_employees`,sum(`employees`.`salary`) AS `FOT_depart`,`employees`.`depart` AS `depart` from `employees` group by `employees`.`depart`) `A` left join `departments` on((`A`.`depart` = `departments`.`id`))) order by `A`.`FOT_depart` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_with_max_salary`
--

/*!50001 DROP VIEW IF EXISTS `employee_with_max_salary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_with_max_salary` AS select `employees`.`id` AS `id`,`employees`.`first_name` AS `first_name`,`employees`.`last_name` AS `last_name`,`employees`.`salary` AS `salary`,`employees`.`position` AS `position` from `employees` where (`employees`.`salary` = (select max(`employees`.`salary`) from `employees`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-27 14:45:12
