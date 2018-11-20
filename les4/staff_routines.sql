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

-- Dump completed on 2018-11-20 15:24:51
