-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: football_fixtures_db
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Creating database with proper character set and collation
DROP DATABASE IF EXISTS `football_fixtures_db`;
CREATE DATABASE `football_fixtures_db` 
    DEFAULT CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci;

USE `football_fixtures_db`;

--
-- Table structure for table `assists`
--

DROP TABLE IF EXISTS `assists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assists` (
  `assist_id` int NOT NULL AUTO_INCREMENT,
  `goal_id` int NOT NULL,
  `player_id` int NOT NULL,
  `assist_type` enum('Pass','Cross','Through Ball','Set Piece') COLLATE utf8mb4_unicode_ci DEFAULT 'Pass',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`assist_id`),
  UNIQUE KEY `uk_goal_assist` (`goal_id`),
  KEY `idx_assist_player` (`player_id`),
  CONSTRAINT `assists_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`goal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assists_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assists`
--

LOCK TABLES `assists` WRITE;
/*!40000 ALTER TABLE `assists` DISABLE KEYS */;
INSERT INTO `assists` VALUES (1,1,6,'Pass','2025-07-06 04:17:27'),(2,2,11,'Cross','2025-07-06 04:17:27'),(3,3,18,'Through Ball','2025-07-06 04:17:27'),(4,4,22,'Pass','2025-07-06 04:17:27'),(5,5,23,'Cross','2025-07-06 04:17:27'),(6,6,49,'Pass','2025-07-06 04:17:27'),(7,7,49,'Through Ball','2025-07-06 04:17:27'),(8,8,28,'Cross','2025-07-06 04:17:27'),(9,9,18,'Pass','2025-07-06 04:17:27'),(10,10,26,'Through Ball','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `assists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `fixture_id` int NOT NULL,
  `player_id` int NOT NULL,
  `team_id` int NOT NULL,
  `card_type` enum('Yellow','Red','Second Yellow') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minute` tinyint unsigned NOT NULL,
  `added_time` tinyint unsigned DEFAULT '0',
  `reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`card_id`),
  KEY `idx_card_fixture` (`fixture_id`),
  KEY `idx_card_player` (`player_id`),
  KEY `idx_card_type` (`card_type`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`fixture_id`) REFERENCES `fixtures` (`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cards_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cards_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,1,3,1,'Yellow',34,0,'Unsporting behavior','2025-07-06 04:17:27'),(2,1,13,2,'Yellow',67,0,'Dissent','2025-07-06 04:17:27'),(3,2,24,3,'Yellow',23,0,'Reckless challenge','2025-07-06 04:17:27'),(4,2,22,4,'Red',85,2,'Serious foul play','2025-07-06 04:17:27'),(5,3,57,6,'Yellow',45,1,'Delaying the game','2025-07-06 04:17:27'),(6,4,8,8,'Yellow',78,0,'Unsporting behavior','2025-07-06 04:17:27'),(7,5,15,2,'Yellow',56,0,'Reckless challenge','2025-07-06 04:17:27'),(8,5,25,3,'Yellow',89,3,'Time wasting','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `license_level` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`coach_id`),
  KEY `idx_coach_name` (`last_name`,`first_name`),
  KEY `idx_coach_nationality` (`nationality`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Erik','ten Hag','Netherlands','1970-02-02','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,'Mikel','Arteta','Spain','1982-03-26','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,'Jurgen','Klopp','Germany','1967-06-16','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,'Mauricio','Pochettino','Argentina','1972-03-02','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,'Pep','Guardiola','Spain','1971-01-18','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,'Antonio','Conte','Italy','1969-07-31','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,'David','Moyes','Scotland','1963-04-25','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,'Sean','Dyche','England','1971-06-28','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,'Unai','Emery','Spain','1971-11-03','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,'Eddie','Howe','England','1977-11-29','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,'Jesse','Marsch','United States','1973-11-08','UEFA A','2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,'Chris','Wilder','England','1967-09-23','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(13,'Daniel','Farke','Germany','1976-10-30','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(14,'Steve','Bruce','England','1960-12-31','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(15,'Marco','Silva','Portugal','1977-07-12','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(16,'Gary','O\'Neil','England','1983-05-18','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(17,'Roberto','De Zerbi','Italy','1979-06-06','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(18,'Rob','Edwards','Wales','1982-12-25','UEFA A','2025-07-06 04:17:27','2025-07-06 04:17:27'),(19,'Vincent','Kompany','Belgium','1986-04-10','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27'),(20,'Oliver','Glasner','Austria','1974-08-28','UEFA Pro','2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competitions` (
  `competition_id` int NOT NULL AUTO_INCREMENT,
  `competition_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sponsor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `season` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`competition_id`),
  UNIQUE KEY `uk_competition_name_season` (`competition_name`,`season`),
  KEY `idx_competition_country` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (1,'Premier League','Barclays','2024-25','England','2025-07-06 04:17:13','2025-07-06 04:17:13'),(2,'Championship','Sky Bet','2024-25','England','2025-07-06 04:17:13','2025-07-06 04:17:13'),(3,'FA Cup','Emirates','2024-25','England','2025-07-06 04:17:13','2025-07-06 04:17:13'),(4,'UEFA Champions League','Heineken','2024-25','Europe','2025-07-06 04:17:13','2025-07-06 04:17:13'),(5,'UEFA Europa League','Just Eat','2024-25','Europe','2025-07-06 04:17:13','2025-07-06 04:17:13');
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixtures`
--

DROP TABLE IF EXISTS `fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixtures` (
  `fixture_id` int NOT NULL AUTO_INCREMENT,
  `match_date` date NOT NULL,
  `kick_off_time` time NOT NULL,
  `home_team_id` int NOT NULL,
  `away_team_id` int NOT NULL,
  `competition_id` int NOT NULL,
  `stadium_id` int NOT NULL,
  `referee_id` int DEFAULT NULL,
  `match_week` tinyint unsigned DEFAULT NULL,
  `status` enum('Scheduled','Live','Finished','Postponed','Cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'Scheduled',
  `attendance` int unsigned DEFAULT NULL,
  `weather_conditions` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fixture_id`),
  KEY `idx_fixture_date` (`match_date`),
  KEY `idx_fixture_home_team` (`home_team_id`),
  KEY `idx_fixture_away_team` (`away_team_id`),
  KEY `idx_fixture_competition` (`competition_id`),
  KEY `idx_fixture_status` (`status`),
  KEY `stadium_id` (`stadium_id`),
  KEY `referee_id` (`referee_id`),
  CONSTRAINT `fixtures_ibfk_1` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixtures_ibfk_2` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixtures_ibfk_3` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fixtures_ibfk_4` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`stadium_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fixtures_ibfk_5` FOREIGN KEY (`referee_id`) REFERENCES `referees` (`referee_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixtures`
--

LOCK TABLES `fixtures` WRITE;
/*!40000 ALTER TABLE `fixtures` DISABLE KEYS */;
INSERT INTO `fixtures` VALUES (1,'2024-08-17','15:00:00',1,2,1,1,1,1,'Finished',74500,'Clear, 22°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,'2024-08-17','17:30:00',3,4,1,3,2,1,'Finished',53200,'Partly cloudy, 19°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,'2024-08-18','14:00:00',5,6,1,5,3,1,'Finished',54800,'Sunny, 25°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,'2024-08-18','16:30:00',7,8,1,7,4,1,'Finished',65900,'Overcast, 18°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,'2024-08-24','15:00:00',2,3,1,2,5,2,'Finished',60400,'Light rain, 16°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,'2024-08-24','17:30:00',4,5,1,4,6,2,'Finished',40600,'Clear, 21°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,'2024-08-25','14:00:00',6,7,1,6,7,2,'Finished',62500,'Sunny, 24°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,'2024-08-25','16:30:00',8,1,1,8,8,2,'Finished',39200,'Partly cloudy, 20°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,'2024-08-31','15:00:00',1,3,1,1,9,3,'Finished',74700,'Clear, 23°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,'2024-08-31','17:30:00',5,2,1,5,10,3,'Finished',54900,'Overcast, 17°C','2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,'2024-12-21','15:00:00',2,4,1,2,1,18,'Scheduled',0,'TBD','2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,'2024-12-21','17:30:00',3,5,1,3,2,18,'Scheduled',0,'TBD','2025-07-06 04:17:27','2025-07-06 04:17:27'),(13,'2024-12-22','14:00:00',6,1,1,6,3,18,'Scheduled',0,'TBD','2025-07-06 04:17:27','2025-07-06 04:17:27'),(14,'2024-12-26','12:30:00',1,7,1,1,4,19,'Scheduled',0,'TBD','2025-07-06 04:17:27','2025-07-06 04:17:27'),(15,'2024-12-26','15:00:00',4,8,1,4,5,19,'Scheduled',0,'TBD','2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `fixtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `fixture_id` int NOT NULL,
  `player_id` int NOT NULL,
  `team_id` int NOT NULL,
  `minute` tinyint unsigned NOT NULL,
  `added_time` tinyint unsigned DEFAULT '0',
  `goal_type` enum('Regular','Penalty','Free Kick','Header','Own Goal') COLLATE utf8mb4_unicode_ci DEFAULT 'Regular',
  `is_own_goal` tinyint(1) DEFAULT '0',
  `body_part` enum('Left Foot','Right Foot','Head','Other') COLLATE utf8mb4_unicode_ci DEFAULT 'Right Foot',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goal_id`),
  KEY `idx_goal_fixture` (`fixture_id`),
  KEY `idx_goal_player` (`player_id`),
  KEY `idx_goal_team` (`team_id`),
  KEY `idx_goal_minute` (`minute`),
  CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`fixture_id`) REFERENCES `fixtures` (`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goals_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `goals_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,1,7,1,23,0,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(2,1,9,1,67,2,'Regular',0,'Left Foot','2025-07-06 04:17:27'),(3,1,17,2,45,1,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(4,2,26,3,34,0,'Regular',0,'Left Foot','2025-07-06 04:17:27'),(5,2,25,4,78,0,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(6,3,50,5,15,0,'Regular',0,'Left Foot','2025-07-06 04:17:27'),(7,3,50,5,33,0,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(8,3,49,5,89,3,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(9,4,8,8,56,0,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(10,4,8,8,82,0,'Regular',0,'Left Foot','2025-07-06 04:17:27'),(11,5,17,2,12,0,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(12,5,19,2,67,0,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(13,5,26,3,23,0,'Regular',0,'Left Foot','2025-07-06 04:17:27'),(14,5,28,3,45,2,'Regular',0,'Right Foot','2025-07-06 04:17:27'),(15,5,29,3,90,4,'Regular',0,'Right Foot','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_events`
--

DROP TABLE IF EXISTS `match_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `fixture_id` int NOT NULL,
  `player_id` int DEFAULT NULL,
  `team_id` int NOT NULL,
  `event_type` enum('Substitution','Injury','VAR Check','Offside','Foul','Corner','Throw In') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minute` tinyint unsigned NOT NULL,
  `added_time` tinyint unsigned DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`),
  KEY `idx_event_fixture` (`fixture_id`),
  KEY `idx_event_player` (`player_id`),
  KEY `idx_event_type` (`event_type`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `match_events_ibfk_1` FOREIGN KEY (`fixture_id`) REFERENCES `fixtures` (`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_events_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `match_events_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_events`
--

LOCK TABLES `match_events` WRITE;
/*!40000 ALTER TABLE `match_events` DISABLE KEYS */;
INSERT INTO `match_events` VALUES (1,1,7,1,'Substitution',75,0,'Marcus Rashford substituted','2025-07-06 04:17:27'),(2,1,17,2,'Injury',89,2,'Gabriel Martinelli injured','2025-07-06 04:17:27'),(3,2,26,3,'VAR Check',34,0,'Goal confirmed after VAR check','2025-07-06 04:17:27'),(4,3,50,5,'Corner',15,0,'Corner kick leading to goal','2025-07-06 04:17:27'),(5,4,8,8,'Substitution',56,0,'Player substituted after penalty','2025-07-06 04:17:27'),(6,5,29,3,'Offside',67,0,'Goal initially disallowed for offside','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `match_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_results`
--

DROP TABLE IF EXISTS `match_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `fixture_id` int NOT NULL,
  `home_goals` tinyint unsigned DEFAULT '0',
  `away_goals` tinyint unsigned DEFAULT '0',
  `home_goals_ht` tinyint unsigned DEFAULT '0',
  `away_goals_ht` tinyint unsigned DEFAULT '0',
  `winner_team_id` int DEFAULT NULL,
  `result_type` enum('Regular','Extra Time','Penalties') COLLATE utf8mb4_unicode_ci DEFAULT 'Regular',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `uk_fixture_result` (`fixture_id`),
  KEY `idx_result_winner` (`winner_team_id`),
  CONSTRAINT `match_results_ibfk_1` FOREIGN KEY (`fixture_id`) REFERENCES `fixtures` (`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `match_results_ibfk_2` FOREIGN KEY (`winner_team_id`) REFERENCES `teams` (`team_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_results`
--

LOCK TABLES `match_results` WRITE;
/*!40000 ALTER TABLE `match_results` DISABLE KEYS */;
INSERT INTO `match_results` VALUES (1,1,2,1,1,0,1,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,2,1,1,0,1,NULL,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,3,3,0,2,0,5,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,4,0,2,0,1,8,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,5,2,3,1,2,3,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,6,1,0,0,0,4,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,7,2,2,1,1,NULL,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,8,1,3,0,1,1,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,9,4,1,2,0,1,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,10,0,1,0,0,2,'Regular','2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `match_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_records`
--

DROP TABLE IF EXISTS `medical_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_records` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `injury_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `injury_description` text COLLATE utf8mb4_unicode_ci,
  `injury_date` date NOT NULL,
  `expected_return_date` date DEFAULT NULL,
  `actual_return_date` date DEFAULT NULL,
  `severity` enum('Minor','Moderate','Severe','Career Threatening') COLLATE utf8mb4_unicode_ci DEFAULT 'Minor',
  `treatment_notes` text COLLATE utf8mb4_unicode_ci,
  `medical_staff` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  KEY `idx_medical_player` (`player_id`),
  KEY `idx_medical_injury_date` (`injury_date`),
  KEY `idx_medical_active` (`is_active`),
  KEY `idx_medical_severity` (`severity`),
  CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_records`
--

LOCK TABLES `medical_records` WRITE;
/*!40000 ALTER TABLE `medical_records` DISABLE KEYS */;
INSERT INTO `medical_records` VALUES (1,3,'Hamstring Strain','Grade 1 hamstring strain during training','2024-08-15','2024-09-01','2024-08-30','Minor','Rest and physiotherapy','Dr. Smith',0,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,13,'Ankle Sprain','Twisted ankle during match','2024-08-20','2024-09-10','2024-09-08','Moderate','Ice, compression, elevation','Dr. Johnson',0,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,22,'Knee Injury','Meniscus tear','2024-08-25','2024-11-15',NULL,'Severe','Arthroscopic surgery required','Dr. Williams',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,15,'Muscle Fatigue','General muscle fatigue','2024-09-01','2024-09-05','2024-09-04','Minor','Rest and recovery','Dr. Brown',0,'2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `medical_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_contracts`
--

DROP TABLE IF EXISTS `player_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_contracts` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `team_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `weekly_salary` decimal(10,2) DEFAULT NULL,
  `signing_bonus` decimal(12,2) DEFAULT NULL,
  `contract_type` enum('Professional','Youth','Loan','Trial') COLLATE utf8mb4_unicode_ci DEFAULT 'Professional',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contract_id`),
  KEY `idx_contract_player` (`player_id`),
  KEY `idx_contract_team` (`team_id`),
  KEY `idx_contract_dates` (`start_date`,`end_date`),
  KEY `idx_contract_active` (`is_active`),
  CONSTRAINT `player_contracts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_contracts_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_contracts`
--

LOCK TABLES `player_contracts` WRITE;
/*!40000 ALTER TABLE `player_contracts` DISABLE KEYS */;
INSERT INTO `player_contracts` VALUES (1,7,1,'2022-07-01','2027-06-30',250000.00,5000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,9,1,'2019-07-01','2025-06-30',200000.00,2000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,17,2,'2021-07-01','2026-06-30',180000.00,2000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,19,2,'2019-07-01','2025-06-30',220000.00,3000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,26,3,'2017-07-01','2025-06-30',300000.00,8000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,28,3,'2017-07-01','2025-06-30',350000.00,10000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,50,5,'2022-07-01','2029-06-30',400000.00,15000000.00,'Professional',1,'2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `player_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_fixture_stats`
--

DROP TABLE IF EXISTS `player_fixture_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_fixture_stats` (
  `player_fixture_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `fixture_id` int NOT NULL,
  `minutes_played` tinyint unsigned DEFAULT '0',
  `goals_scored` tinyint unsigned DEFAULT '0',
  `assists` tinyint unsigned DEFAULT '0',
  `yellow_cards` tinyint unsigned DEFAULT '0',
  `red_cards` tinyint unsigned DEFAULT '0',
  `shots_on_target` tinyint unsigned DEFAULT '0',
  `shots_off_target` tinyint unsigned DEFAULT '0',
  `passes_completed` smallint unsigned DEFAULT '0',
  `passes_attempted` smallint unsigned DEFAULT '0',
  `rating` decimal(3,1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_fixture_id`),
  UNIQUE KEY `uk_player_fixture` (`player_id`,`fixture_id`),
  KEY `idx_pfs_fixture` (`fixture_id`),
  KEY `idx_pfs_rating` (`rating` DESC),
  CONSTRAINT `player_fixture_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_fixture_stats_ibfk_2` FOREIGN KEY (`fixture_id`) REFERENCES `fixtures` (`fixture_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_fixture_stats`
--

LOCK TABLES `player_fixture_stats` WRITE;
/*!40000 ALTER TABLE `player_fixture_stats` DISABLE KEYS */;
INSERT INTO `player_fixture_stats` VALUES (1,7,1,90,1,0,0,0,3,2,28,35,7.8,'2025-07-06 04:17:27'),(2,9,1,75,1,1,0,0,2,1,22,28,8.2,'2025-07-06 04:17:27'),(3,17,1,90,1,0,0,0,4,1,31,38,7.5,'2025-07-06 04:17:27'),(4,26,2,90,1,0,1,0,2,3,45,52,7.3,'2025-07-06 04:17:27'),(5,50,3,90,2,0,0,0,5,2,38,42,9.1,'2025-07-06 04:17:27'),(6,8,4,90,2,0,1,0,3,1,25,31,8.7,'2025-07-06 04:17:27');
/*!40000 ALTER TABLE `player_fixture_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_statistics`
--

DROP TABLE IF EXISTS `player_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_statistics` (
  `stats_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `season` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `competition_id` int DEFAULT NULL,
  `matches_played` smallint unsigned DEFAULT '0',
  `matches_started` smallint unsigned DEFAULT '0',
  `minutes_played` int unsigned DEFAULT '0',
  `goals_scored` smallint unsigned DEFAULT '0',
  `assists` smallint unsigned DEFAULT '0',
  `yellow_cards` smallint unsigned DEFAULT '0',
  `red_cards` smallint unsigned DEFAULT '0',
  `clean_sheets` smallint unsigned DEFAULT '0',
  `saves` smallint unsigned DEFAULT '0',
  `pass_accuracy` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stats_id`),
  UNIQUE KEY `uk_player_season_competition` (`player_id`,`season`,`competition_id`),
  KEY `idx_stats_player` (`player_id`),
  KEY `idx_stats_season` (`season`),
  KEY `competition_id` (`competition_id`),
  CONSTRAINT `player_statistics_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_statistics_ibfk_2` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_statistics`
--

LOCK TABLES `player_statistics` WRITE;
/*!40000 ALTER TABLE `player_statistics` DISABLE KEYS */;
INSERT INTO `player_statistics` VALUES (1,7,'2024-25',1,8,7,630,5,2,1,0,0,0,78.50,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,9,'2024-25',1,6,4,420,3,1,0,0,0,0,82.10,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,6,'2024-25',1,8,8,720,1,4,2,0,0,0,89.30,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,17,'2024-25',1,7,6,540,4,1,1,0,0,0,76.80,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,18,'2024-25',1,8,8,720,2,6,0,0,0,0,91.20,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,19,'2024-25',1,8,8,720,6,3,0,0,0,0,85.70,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,26,'2024-25',1,8,8,720,7,4,1,0,0,0,88.90,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,28,'2024-25',1,8,8,720,8,2,0,0,0,0,87.30,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,29,'2024-25',1,6,5,450,3,2,0,0,0,0,83.40,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,1,'2024-25',1,8,8,720,0,0,0,0,4,32,75.20,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,12,'2024-25',1,8,8,720,0,0,1,0,5,28,82.10,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,23,'2024-25',1,8,8,720,0,0,0,0,6,25,88.50,'2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `player_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_statuses`
--

DROP TABLE IF EXISTS `player_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_statuses` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `uk_status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_statuses`
--

LOCK TABLES `player_statuses` WRITE;
/*!40000 ALTER TABLE `player_statuses` DISABLE KEYS */;
INSERT INTO `player_statuses` VALUES (1,'Active','Player is available for selection'),(2,'Injured','Player is currently injured'),(3,'Suspended','Player is suspended from matches'),(4,'On Loan','Player is on loan to another club'),(5,'Retired','Player has retired from professional football'),(6,'Transfer Listed','Player is available for transfer'),(7,'Youth Development','Player is in youth development program');
/*!40000 ALTER TABLE `player_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `nationality` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `squad_number` tinyint unsigned DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `height_cm` smallint unsigned DEFAULT NULL,
  `weight_kg` smallint unsigned DEFAULT NULL,
  `preferred_foot` enum('Left','Right','Both') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `uk_player_squad_team` (`squad_number`,`team_id`),
  KEY `idx_player_name` (`last_name`,`first_name`),
  KEY `idx_player_team` (`team_id`),
  KEY `idx_player_position` (`position_id`),
  KEY `idx_player_nationality` (`nationality`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `players_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `player_statuses` (`status_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Andre','Onana','1996-04-02','Cameroon',24,1,1,1,190,88,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,'Harry','Maguire','1993-03-05','England',5,1,2,1,194,100,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,'Luke','Shaw','1995-07-12','England',23,1,3,1,185,75,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,'Diogo','Dalot','1999-03-18','Portugal',20,1,4,1,183,73,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,'Casemiro','Santos','1992-02-23','Brazil',18,1,6,1,185,84,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,'Bruno','Fernandes','1994-09-08','Portugal',8,1,8,1,179,69,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,'Marcus','Rashford','1997-10-31','England',10,1,11,1,180,70,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,'Antony','Santos','2000-02-24','Brazil',21,1,12,1,172,62,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,'Rasmus','Hojlund','2003-02-04','Denmark',11,1,14,1,191,87,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,'Raphael','Varane','1993-04-25','France',19,1,2,1,191,81,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,'Christian','Eriksen','1992-02-14','Denmark',14,1,7,1,182,76,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,'David','Raya','1995-09-15','Spain',22,2,1,1,183,74,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(13,'William','Saliba','2001-03-24','France',2,2,2,1,192,83,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(14,'Oleksandr','Zinchenko','1996-12-15','Ukraine',35,2,3,1,175,64,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(15,'Ben','White','1997-10-08','England',4,2,4,1,186,73,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(16,'Declan','Rice','1999-01-14','England',41,2,6,1,185,72,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(17,'Martin','Odegaard','1998-12-17','Norway',8,2,8,1,178,68,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(18,'Gabriel','Martinelli','2001-06-18','Brazil',11,2,11,1,175,70,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(19,'Bukayo','Saka','2001-09-05','England',7,2,12,1,178,70,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(20,'Gabriel','Jesus','1997-04-03','Brazil',9,2,14,1,175,73,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(21,'Gabriel','Magalhaes','1997-12-19','Brazil',6,2,2,1,190,84,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(22,'Kai','Havertz','1999-06-11','Germany',29,2,13,1,190,82,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(23,'Alisson','Becker','1993-10-02','Brazil',1,3,1,1,191,91,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(24,'Virgil','van Dijk','1991-07-08','Netherlands',4,3,2,1,195,92,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(25,'Andrew','Robertson','1994-03-11','Scotland',26,3,3,1,178,64,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(26,'Trent','Alexander-Arnold','1998-10-07','England',66,3,4,1,180,69,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(27,'Alexis','Mac Allister','1998-12-24','Argentina',10,3,6,1,174,67,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(28,'Dominik','Szoboszlai','2000-10-25','Hungary',8,3,7,1,186,74,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(29,'Luis','Diaz','1997-01-13','Colombia',7,3,11,1,178,67,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(30,'Mohamed','Salah','1992-06-15','Egypt',11,3,12,1,175,71,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(31,'Darwin','Nunez','1999-06-24','Uruguay',9,3,14,1,187,81,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(32,'Ibrahima','Konate','1999-05-25','France',5,3,2,1,194,95,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(33,'Ryan','Gravenberch','2002-05-16','Netherlands',38,3,7,1,190,78,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(34,'Robert','Sanchez','1997-11-18','Spain',1,4,1,1,197,85,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(35,'Thiago','Silva','1984-09-22','Brazil',6,4,2,1,183,79,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(36,'Ben','Chilwell','1996-12-21','England',21,4,3,1,178,77,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(37,'Reece','James','1999-12-08','England',24,4,4,1,182,85,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(38,'Enzo','Fernandez','2001-01-17','Argentina',5,4,6,1,178,72,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(39,'Conor','Gallagher','2000-02-06','England',23,4,8,1,182,68,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(40,'Raheem','Sterling','1994-12-08','England',17,4,11,1,170,69,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(41,'Noni','Madueke','2002-03-10','England',31,4,12,1,174,73,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(42,'Nicolas','Jackson','2001-06-20','Senegal',15,4,14,1,185,75,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(43,'Levi','Colwill','2003-02-26','England',26,4,2,1,187,75,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(44,'Moises','Caicedo','2001-11-02','Ecuador',25,4,6,1,176,68,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(45,'Ederson','Moraes','1993-08-17','Brazil',31,5,1,1,188,86,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(46,'Ruben','Dias','1997-05-14','Portugal',3,5,2,1,187,82,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(47,'Josko','Gvardiol','2002-01-23','Croatia',24,5,3,1,185,80,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(48,'Kyle','Walker','1990-05-28','England',2,5,4,1,178,70,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(49,'Rodri','Hernandez','1996-06-22','Spain',16,5,6,1,191,82,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(50,'Kevin','De Bruyne','1991-06-28','Belgium',17,5,8,1,181,70,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(51,'Jack','Grealish','1995-09-10','England',10,5,11,1,180,76,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(52,'Riyad','Mahrez','1991-02-21','Algeria',26,5,12,1,179,67,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(53,'Erling','Haaland','2000-07-21','Norway',9,5,14,1,194,88,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(54,'John','Stones','1994-05-28','England',5,5,2,1,188,70,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(55,'Bernardo','Silva','1994-08-10','Portugal',20,5,7,1,173,64,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(56,'Guglielmo','Vicario','1996-10-07','Italy',13,6,1,1,194,83,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(57,'Cristian','Romero','1998-04-27','Argentina',17,6,2,1,185,79,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(58,'Destiny','Udogie','2002-11-28','Italy',38,6,3,1,185,75,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(59,'Pedro','Porro','1999-09-13','Spain',23,6,4,1,177,65,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(60,'Yves','Bissouma','1996-08-30','Mali',8,6,6,1,182,70,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(61,'James','Maddison','1996-11-23','England',10,6,8,1,175,73,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(62,'Son','Heung-min','1992-07-08','South Korea',7,6,11,1,183,77,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(63,'Dejan','Kulusevski','2000-04-25','Sweden',21,6,12,1,186,74,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(64,'Richarlison','Andrade','1997-05-10','Brazil',9,6,14,1,179,80,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27'),(65,'Micky','van de Ven','2001-04-19','Netherlands',37,6,2,1,193,80,'Left','2025-07-06 04:17:27','2025-07-06 04:17:27'),(66,'Pape','Sarr','2002-09-14','Senegal',29,6,7,1,184,70,'Right','2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_category` enum('Goalkeeper','Defender','Midfielder','Forward') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `uk_position_name` (`position_name`),
  UNIQUE KEY `uk_position_code` (`position_code`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Goalkeeper','GK','Goalkeeper'),(2,'Centre-Back','CB','Defender'),(3,'Left-Back','LB','Defender'),(4,'Right-Back','RB','Defender'),(5,'Wing-Back','WB','Defender'),(6,'Defensive Midfielder','CDM','Midfielder'),(7,'Central Midfielder','CM','Midfielder'),(8,'Attacking Midfielder','CAM','Midfielder'),(9,'Left Midfielder','LM','Midfielder'),(10,'Right Midfielder','RM','Midfielder'),(11,'Left Winger','LW','Forward'),(12,'Right Winger','RW','Forward'),(13,'Centre-Forward','CF','Forward'),(14,'Striker','ST','Forward');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referees`
--

DROP TABLE IF EXISTS `referees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referees` (
  `referee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fifa_badge` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`referee_id`),
  KEY `idx_referee_name` (`last_name`,`first_name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referees`
--

LOCK TABLES `referees` WRITE;
/*!40000 ALTER TABLE `referees` DISABLE KEYS */;
INSERT INTO `referees` VALUES (1,'Michael','Oliver','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,'Anthony','Taylor','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,'Paul','Tierney','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,'Craig','Pawson','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,'Stuart','Attwell','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,'Simon','Hooper','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,'David','Coote','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,'Jarred','Gillett','Australia',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,'Andre','Marriner','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,'Chris','Kavanagh','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,'Robert','Jones','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,'Peter','Bankes','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(13,'Graham','Scott','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(14,'Darren','England','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(15,'John','Brooks','England',1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(16,'Tim','Robinson','England',0,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(17,'Andy','Madley','England',0,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(18,'Darren','Bond','England',0,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(19,'Keith','Stroud','England',0,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(20,'Tony','Harrington','England',0,'2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `referees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `stadium_id` int NOT NULL AUTO_INCREMENT,
  `stadium_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int unsigned DEFAULT NULL,
  `surface_type` enum('Grass','Artificial','Hybrid') COLLATE utf8mb4_unicode_ci DEFAULT 'Grass',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stadium_id`),
  UNIQUE KEY `uk_stadium_name_city` (`stadium_name`,`city`),
  KEY `idx_stadium_location` (`city`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (1,'Old Trafford','Sir Matt Busby Way','Manchester','England',74879,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,'Emirates Stadium','Hornsey Road','London','England',60704,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,'Anfield','Anfield Road','Liverpool','England',53394,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,'Stamford Bridge','Fulham Road','London','England',40834,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,'Etihad Stadium','Etihad Campus','Manchester','England',55017,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,'Tottenham Hotspur Stadium','High Road','London','England',62850,'Hybrid','2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,'London Stadium','Queen Elizabeth Olympic Park','London','England',66000,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,'Goodison Park','Goodison Road','Liverpool','England',39414,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,'Villa Park','Trinity Road','Birmingham','England',42749,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,'St. James Park','Barrack Road','Newcastle','England',52305,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,'Elland Road','Elland Road','Leeds','England',37890,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,'Bramall Lane','Bramall Lane','Sheffield','England',32050,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(13,'Carrow Road','Carrow Road','Norwich','England',27244,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(14,'The Hawthorns','Halfords Lane','West Bromwich','England',26850,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(15,'Craven Cottage','Stevenage Road','London','England',19359,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(16,'Molineux Stadium','Waterloo Road','Wolverhampton','England',31700,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(17,'Amex Stadium','Village Way','Brighton','England',30750,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(18,'Vicarage Road','Vicarage Road','Watford','England',22220,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(19,'Turf Moor','Harry Potts Way','Burnley','England',21944,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27'),(20,'Selhurst Park','Holmesdale Road','London','England',25486,'Grass','2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_staff`
--

DROP TABLE IF EXISTS `team_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` enum('Coaching','Medical','Technical','Administrative','Security') COLLATE utf8mb4_unicode_ci NOT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`),
  KEY `idx_staff_team` (`team_id`),
  KEY `idx_staff_role` (`role`),
  KEY `idx_staff_department` (`department`),
  KEY `idx_staff_active` (`is_active`),
  CONSTRAINT `team_staff_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_staff`
--

LOCK TABLES `team_staff` WRITE;
/*!40000 ALTER TABLE `team_staff` DISABLE KEYS */;
INSERT INTO `team_staff` VALUES (1,1,'Mitchell','van der Gaag','Assistant Coach','Coaching','2022-07-01',150000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,1,'Gary','Walker','Fitness Coach','Coaching','2020-01-15',80000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,1,'Dr. Steve','McNally','Team Doctor','Medical','2018-06-01',120000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,1,'Richard','Hartis','Goalkeeping Coach','Coaching','2022-07-01',90000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,2,'Albert','Stuivenberg','Assistant Coach','Coaching','2019-12-20',140000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,2,'Inaki','Cana','Goalkeeping Coach','Coaching','2021-07-01',90000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,2,'Dr. Gary','O\'Driscoll','Head of Medical','Medical','2009-05-01',130000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,2,'Carlos','Cuesta','Set Piece Coach','Coaching','2019-12-20',75000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,3,'Pepijn','Lijnders','Assistant Coach','Coaching','2018-01-01',160000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,3,'John','Achterberg','Goalkeeping Coach','Coaching','2009-07-01',95000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,3,'Dr. Jim','Moxon','Team Doctor','Medical','2013-08-01',125000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,3,'Vitor','Matos','Elite Development Coach','Coaching','2020-01-01',85000.00,1,'2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `team_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_statistics`
--

DROP TABLE IF EXISTS `team_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_statistics` (
  `team_stats_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `season` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `competition_id` int DEFAULT NULL,
  `matches_played` smallint unsigned DEFAULT '0',
  `wins` smallint unsigned DEFAULT '0',
  `draws` smallint unsigned DEFAULT '0',
  `losses` smallint unsigned DEFAULT '0',
  `goals_for` smallint unsigned DEFAULT '0',
  `goals_against` smallint unsigned DEFAULT '0',
  `goal_difference` smallint DEFAULT '0',
  `points` smallint unsigned DEFAULT '0',
  `clean_sheets` smallint unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`team_stats_id`),
  UNIQUE KEY `uk_team_season_competition` (`team_id`,`season`,`competition_id`),
  KEY `idx_team_stats_season` (`season`),
  KEY `idx_team_stats_points` (`points` DESC),
  KEY `competition_id` (`competition_id`),
  CONSTRAINT `team_statistics_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_statistics_ibfk_2` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_statistics`
--

LOCK TABLES `team_statistics` WRITE;
/*!40000 ALTER TABLE `team_statistics` DISABLE KEYS */;
INSERT INTO `team_statistics` VALUES (1,1,'2024-25',1,10,6,2,2,18,12,6,20,4,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,2,'2024-25',1,10,5,3,2,16,13,3,18,3,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,3,'2024-25',1,10,7,1,2,22,10,12,22,6,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,4,'2024-25',1,10,4,4,2,14,11,3,16,4,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,5,'2024-25',1,10,8,1,1,25,8,17,25,7,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,6,'2024-25',1,10,3,3,4,12,16,-4,12,2,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,7,'2024-25',1,10,4,2,4,13,15,-2,14,3,'2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,8,'2024-25',1,10,5,2,3,15,14,1,17,4,'2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `team_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `founded_year` smallint unsigned DEFAULT NULL,
  `coach_id` int DEFAULT NULL,
  `home_stadium_id` int DEFAULT NULL,
  `primary_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `uk_team_name` (`team_name`),
  KEY `idx_team_coach` (`coach_id`),
  KEY `idx_team_stadium` (`home_stadium_id`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`home_stadium_id`) REFERENCES `stadiums` (`stadium_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Manchester United','MUN',1878,1,1,'Red','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(2,'Arsenal','ARS',1886,2,2,'Red','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(3,'Liverpool','LIV',1892,3,3,'Red','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(4,'Chelsea','CHE',1905,4,4,'Blue','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(5,'Manchester City','MCI',1880,5,5,'Sky Blue','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(6,'Tottenham Hotspur','TOT',1882,6,6,'White','Navy Blue','2025-07-06 04:17:27','2025-07-06 04:17:27'),(7,'West Ham United','WHU',1895,7,7,'Claret','Blue','2025-07-06 04:17:27','2025-07-06 04:17:27'),(8,'Everton','EVE',1878,8,8,'Blue','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(9,'Aston Villa','AVL',1874,9,9,'Claret','Blue','2025-07-06 04:17:27','2025-07-06 04:17:27'),(10,'Newcastle United','NEW',1892,10,10,'Black','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(11,'Leeds United','LEE',1919,11,11,'White','Blue','2025-07-06 04:17:27','2025-07-06 04:17:27'),(12,'Sheffield United','SHU',1889,12,12,'Red','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(13,'Norwich City','NOR',1902,13,13,'Yellow','Green','2025-07-06 04:17:27','2025-07-06 04:17:27'),(14,'West Bromwich Albion','WBA',1878,14,14,'Navy Blue','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(15,'Fulham','FUL',1879,15,15,'White','Black','2025-07-06 04:17:27','2025-07-06 04:17:27'),(16,'Wolverhampton Wanderers','WOL',1877,16,16,'Gold','Black','2025-07-06 04:17:27','2025-07-06 04:17:27'),(17,'Brighton & Hove Albion','BHA',1901,17,17,'Blue','White','2025-07-06 04:17:27','2025-07-06 04:17:27'),(18,'Watford','WAT',1881,18,18,'Yellow','Red','2025-07-06 04:17:27','2025-07-06 04:17:27'),(19,'Burnley','BUR',1882,19,19,'Claret','Blue','2025-07-06 04:17:27','2025-07-06 04:17:27'),(20,'Crystal Palace','CRY',1905,20,20,'Blue','Red','2025-07-06 04:17:27','2025-07-06 04:17:27');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_club_structure`
--

DROP TABLE IF EXISTS `view_club_structure`;
/*!50001 DROP VIEW IF EXISTS `view_club_structure`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_club_structure` AS SELECT 
 1 AS `team_id`,
 1 AS `team_name`,
 1 AS `founded_year`,
 1 AS `coach_name`,
 1 AS `coach_nationality`,
 1 AS `staff_first_name`,
 1 AS `staff_last_name`,
 1 AS `staff_role`,
 1 AS `staff_department`,
 1 AS `hire_date`,
 1 AS `contract_id`,
 1 AS `player_id`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `weekly_salary`,
 1 AS `signing_bonus`,
 1 AS `contract_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_match_events`
--

DROP TABLE IF EXISTS `view_match_events`;
/*!50001 DROP VIEW IF EXISTS `view_match_events`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_match_events` AS SELECT 
 1 AS `goal_id`,
 1 AS `fixture_id`,
 1 AS `event_type`,
 1 AS `player_id`,
 1 AS `team_id`,
 1 AS `minute`,
 1 AS `added_time`,
 1 AS `goal_type`,
 1 AS `body_part`,
 1 AS `is_own_goal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_match_setup`
--

DROP TABLE IF EXISTS `view_match_setup`;
/*!50001 DROP VIEW IF EXISTS `view_match_setup`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_match_setup` AS SELECT 
 1 AS `fixture_id`,
 1 AS `match_date`,
 1 AS `kick_off_time`,
 1 AS `match_week`,
 1 AS `status`,
 1 AS `attendance`,
 1 AS `weather_conditions`,
 1 AS `competition_name`,
 1 AS `stadium_name`,
 1 AS `stadium_city`,
 1 AS `stadium_country`,
 1 AS `referee_name`,
 1 AS `referee_nationality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_player_profiles`
--

DROP TABLE IF EXISTS `view_player_profiles`;
/*!50001 DROP VIEW IF EXISTS `view_player_profiles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_player_profiles` AS SELECT 
 1 AS `player_id`,
 1 AS `full_name`,
 1 AS `date_of_birth`,
 1 AS `nationality`,
 1 AS `squad_number`,
 1 AS `position_name`,
 1 AS `position_code`,
 1 AS `position_category`,
 1 AS `status_name`,
 1 AS `status_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'football_fixtures_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `UpdateTeamStatistics` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateTeamStatistics`(
    IN p_fixture_id INT
)
BEGIN
    DECLARE v_home_team_id INT;
    DECLARE v_away_team_id INT;
    DECLARE v_home_goals INT;
    DECLARE v_away_goals INT;
    DECLARE v_competition_id INT;
    DECLARE v_season VARCHAR(20);
    
    -- Get match details
    SELECT 
        f.home_team_id, f.away_team_id, f.competition_id,
        COALESCE(mr.home_goals, 0), COALESCE(mr.away_goals, 0),
        c.season
    INTO 
        v_home_team_id, v_away_team_id, v_competition_id,
        v_home_goals, v_away_goals, v_season
    FROM fixtures f
    JOIN competitions c ON f.competition_id = c.competition_id
    LEFT JOIN match_results mr ON f.fixture_id = mr.fixture_id
    WHERE f.fixture_id = p_fixture_id;
    
    -- Update home team statistics
    INSERT INTO team_statistics (team_id, season, competition_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
    VALUES (v_home_team_id, v_season, v_competition_id, 1, 
            CASE WHEN v_home_goals > v_away_goals THEN 1 ELSE 0 END,
            CASE WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END,
            CASE WHEN v_home_goals < v_away_goals THEN 1 ELSE 0 END,
            v_home_goals, v_away_goals, v_home_goals - v_away_goals,
            CASE WHEN v_home_goals > v_away_goals THEN 3 
                 WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END)
    ON DUPLICATE KEY UPDATE
        matches_played = matches_played + 1,
        wins = wins + CASE WHEN v_home_goals > v_away_goals THEN 1 ELSE 0 END,
        draws = draws + CASE WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END,
        losses = losses + CASE WHEN v_home_goals < v_away_goals THEN 1 ELSE 0 END,
        goals_for = goals_for + v_home_goals,
        goals_against = goals_against + v_away_goals,
        goal_difference = goals_for - goals_against,
        points = points + CASE WHEN v_home_goals > v_away_goals THEN 3 
                              WHEN v_home_goals = v_away_goals THEN 1 ELSE 0 END;
    
    -- Update away team statistics
    INSERT INTO team_statistics (team_id, season, competition_id, matches_played, wins, draws, losses, goals_for, goals_against, goal_difference, points)
    VALUES (v_away_team_id, v_season, v_competition_id, 1,
            CASE WHEN v_away_goals > v_home_goals THEN 1 ELSE 0 END,
            CASE WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END,
            CASE WHEN v_away_goals < v_home_goals THEN 1 ELSE 0 END,
            v_away_goals, v_home_goals, v_away_goals - v_home_goals,
            CASE WHEN v_away_goals > v_home_goals THEN 3 
                 WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END)
    ON DUPLICATE KEY UPDATE
        matches_played = matches_played + 1,
        wins = wins + CASE WHEN v_away_goals > v_home_goals THEN 1 ELSE 0 END,
        draws = draws + CASE WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END,
        losses = losses + CASE WHEN v_away_goals < v_home_goals THEN 1 ELSE 0 END,
        goals_for = goals_for + v_away_goals,
        goals_against = goals_against + v_home_goals,
        goal_difference = goals_for - goals_against,
        points = points + CASE WHEN v_away_goals > v_home_goals THEN 3 
                              WHEN v_away_goals = v_home_goals THEN 1 ELSE 0 END;
END ;;
DELIMITER ;

SELECT 'Football Fixtures Database has been created successfully via SQL Dump file' AS status_message;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_club_structure`
--

/*!50001 DROP VIEW IF EXISTS `view_club_structure`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_club_structure` AS select `t`.`team_id` AS `team_id`,`t`.`team_name` AS `team_name`,`t`.`founded_year` AS `founded_year`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `coach_name`,`c`.`nationality` AS `coach_nationality`,`ts`.`first_name` AS `staff_first_name`,`ts`.`last_name` AS `staff_last_name`,`ts`.`role` AS `staff_role`,`ts`.`department` AS `staff_department`,`ts`.`hire_date` AS `hire_date`,`pc`.`contract_id` AS `contract_id`,`pc`.`player_id` AS `player_id`,`pc`.`start_date` AS `start_date`,`pc`.`end_date` AS `end_date`,`pc`.`weekly_salary` AS `weekly_salary`,`pc`.`signing_bonus` AS `signing_bonus`,`pc`.`contract_type` AS `contract_type` from (((`teams` `t` left join `coaches` `c` on((`t`.`coach_id` = `c`.`coach_id`))) left join `team_staff` `ts` on((`t`.`team_id` = `ts`.`team_id`))) left join `player_contracts` `pc` on((`t`.`team_id` = `pc`.`team_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_match_events`
--

/*!50001 DROP VIEW IF EXISTS `view_match_events`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_match_events` AS select `g`.`goal_id` AS `goal_id`,`g`.`fixture_id` AS `fixture_id`,'Goal' AS `event_type`,`g`.`player_id` AS `player_id`,`g`.`team_id` AS `team_id`,`g`.`minute` AS `minute`,`g`.`added_time` AS `added_time`,`g`.`goal_type` AS `goal_type`,`g`.`body_part` AS `body_part`,`g`.`is_own_goal` AS `is_own_goal` from `goals` `g` union all select `a`.`assist_id` AS `assist_id`,`g`.`fixture_id` AS `fixture_id`,'Assist' AS `event_type`,`a`.`player_id` AS `player_id`,NULL AS `team_id`,NULL AS `minute`,NULL AS `added_time`,`a`.`assist_type` AS `assist_type`,NULL AS `body_part`,NULL AS `is_own_goal` from (`assists` `a` join `goals` `g` on((`a`.`goal_id` = `g`.`goal_id`))) union all select `c`.`card_id` AS `card_id`,`c`.`fixture_id` AS `fixture_id`,'Card' AS `event_type`,`c`.`player_id` AS `player_id`,`c`.`team_id` AS `team_id`,`c`.`minute` AS `minute`,`c`.`added_time` AS `added_time`,`c`.`card_type` AS `card_type`,NULL AS `body_part`,NULL AS `is_own_goal` from `cards` `c` union all select `e`.`event_id` AS `event_id`,`e`.`fixture_id` AS `fixture_id`,'Match Event' AS `event_type`,`e`.`player_id` AS `player_id`,`e`.`team_id` AS `team_id`,`e`.`minute` AS `minute`,`e`.`added_time` AS `added_time`,`e`.`event_type` AS `event_type`,NULL AS `body_part`,NULL AS `is_own_goal` from `match_events` `e` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_match_setup`
--

/*!50001 DROP VIEW IF EXISTS `view_match_setup`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_match_setup` AS select `f`.`fixture_id` AS `fixture_id`,`f`.`match_date` AS `match_date`,`f`.`kick_off_time` AS `kick_off_time`,`f`.`match_week` AS `match_week`,`f`.`status` AS `status`,`f`.`attendance` AS `attendance`,`f`.`weather_conditions` AS `weather_conditions`,`c`.`competition_name` AS `competition_name`,`s`.`stadium_name` AS `stadium_name`,`s`.`city` AS `stadium_city`,`s`.`country` AS `stadium_country`,concat(`r`.`first_name`,' ',`r`.`last_name`) AS `referee_name`,`r`.`nationality` AS `referee_nationality` from (((`fixtures` `f` join `competitions` `c` on((`f`.`competition_id` = `c`.`competition_id`))) join `stadiums` `s` on((`f`.`stadium_id` = `s`.`stadium_id`))) left join `referees` `r` on((`f`.`referee_id` = `r`.`referee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_player_profiles`
--

/*!50001 DROP VIEW IF EXISTS `view_player_profiles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_player_profiles` AS select `p`.`player_id` AS `player_id`,concat(`p`.`first_name`,' ',`p`.`last_name`) AS `full_name`,`p`.`date_of_birth` AS `date_of_birth`,`p`.`nationality` AS `nationality`,`p`.`squad_number` AS `squad_number`,`pos`.`position_name` AS `position_name`,`pos`.`position_code` AS `position_code`,`pos`.`position_category` AS `position_category`,`s`.`status_name` AS `status_name`,`s`.`status_description` AS `status_description` from ((`players` `p` join `positions` `pos` on((`p`.`position_id` = `pos`.`position_id`))) join `player_statuses` `s` on((`p`.`status_id` = `s`.`status_id`))) */;
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

-- Dump completed on 2025-07-06 12:21:55
