CREATE DATABASE  IF NOT EXISTS `timetable` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `timetable`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: timetable
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `idclass` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `predmet_ch` varchar(45) DEFAULT NULL,
  `gruppa_ch` varchar(10) DEFAULT NULL,
  `room_ch` varchar(10) DEFAULT NULL,
  `predmet_zn` varchar(45) DEFAULT NULL,
  `gruppa_zn` varchar(10) DEFAULT NULL,
  `room_zn` varchar(10) DEFAULT NULL,
  `day_of_week_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`idclass`),
  KEY `bgc_idx` (`day_of_week_id`),
  KEY `prof_idx` (`profile_id`),
  CONSTRAINT `day` FOREIGN KEY (`day_of_week_id`) REFERENCES `day_of_week` (`idday_of_week`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prof` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`idprofile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,'матан','913','123','история','913','432',1,1),(2,1,'инжграф','913','53','психолошия','933','3345',2,2),(3,2,'матан','923','74','социология','943','3232',2,3),(4,1,'аипрг','933','3343','МАТАН','933','3341',3,4),(5,2,'аиг','913','3214','пявка','923','123',3,2);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_of_week`
--

DROP TABLE IF EXISTS `day_of_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_of_week` (
  `idday_of_week` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idday_of_week`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_of_week`
--

LOCK TABLES `day_of_week` WRITE;
/*!40000 ALTER TABLE `day_of_week` DISABLE KEYS */;
INSERT INTO `day_of_week` VALUES (1,'понедельник'),(2,'вторник'),(3,'среда'),(4,'четверг'),(5,'пятница'),(6,'суббота');
/*!40000 ALTER TABLE `day_of_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `idprofile` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `sc_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprofile`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'tratata','123','Пивен','Григорий','Георгиевич','препод'),(2,'ololo','1234','Ежеля ','Непомню','Забыловна','профессор');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view1` AS
    SELECT 
        `profile`.`login` AS `Prof login`,
        `class`.`predmet_ch` AS `Predmet_CH`,
        `class`.`gruppa_ch` AS `Group_CH`,
        `class`.`room_ch` AS `Room_CH`,
        `class`.`predmet_zn` AS `Predmet_ZN`,
        `class`.`gruppa_zn` AS `Group_ZN`,
        `class`.`room_zn` AS `Room_ZN`,
        `day_of_week`.`text` AS `Day`,
        `class`.`number` AS `Number`
    FROM
        ((`class`
        LEFT JOIN `day_of_week` ON ((`class`.`day_of_week_id` = `day_of_week`.`idday_of_week`)))
        LEFT JOIN `profile` ON ((`class`.`profile_id` = `profile`.`idprofile`)))
    ORDER BY `day_of_week`.`text`
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view1` (
  `Prof login` tinyint NOT NULL,
  `Predmet_CH` tinyint NOT NULL,
  `Group_CH` tinyint NOT NULL,
  `Room_CH` tinyint NOT NULL,
  `Predmet_ZN` tinyint NOT NULL,
  `Group_ZN` tinyint NOT NULL,
  `Room_ZN` tinyint NOT NULL,
  `Day` tinyint NOT NULL,
  `Number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view1`
--

/*!50001 DROP TABLE IF EXISTS `view1`*/;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `profile`.`login` AS `Prof login`,`class`.`predmet_ch` AS `Predmet_CH`,`class`.`gruppa_ch` AS `Group_CH`,`class`.`room_ch` AS `Room_CH`,`class`.`predmet_zn` AS `Predmet_ZN`,`class`.`gruppa_zn` AS `Group_ZN`,`class`.`room_zn` AS `Room_ZN`,`day_of_week`.`text` AS `Day`,`class`.`number` AS `Number` from ((`class` left join `day_of_week` on((`class`.`day_of_week_id` = `day_of_week`.`idday_of_week`))) left join `profile` on((`class`.`profile_id` = `profile`.`idprofile`))) order by `day_of_week`.`text` */;
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

-- Dump completed on 2014-10-07  8:49:22
