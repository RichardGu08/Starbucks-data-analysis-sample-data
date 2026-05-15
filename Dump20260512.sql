-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bidw
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
-- Table structure for table `bi_channels`
--

DROP TABLE IF EXISTS `bi_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bi_channels` (
  `offer_id` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` tinyint DEFAULT NULL,
  `web` tinyint DEFAULT NULL,
  `social` tinyint DEFAULT NULL,
  `mobile` tinyint DEFAULT NULL,
  `reward` int DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `offer_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`offer_id`),
  UNIQUE KEY `offer_id_UNIQUE` (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bi_profile`
--

DROP TABLE IF EXISTS `bi_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bi_profile` (
  `MyUnknownColumn` int DEFAULT NULL,
  `gender` text,
  `age` int DEFAULT NULL,
  `id` varchar(512) DEFAULT NULL,
  `became_member_on` int DEFAULT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `signup_date` date DEFAULT NULL,
  KEY `idx_bi_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bi_transcripts`
--

DROP TABLE IF EXISTS `bi_transcripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bi_transcripts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person` varchar(300) DEFAULT NULL,
  `event` varchar(200) DEFAULT NULL,
  `value` json DEFAULT NULL COMMENT 'Offer events → contains offer id\n\nTransaction → contains amount',
  `time` int DEFAULT NULL COMMENT 'Time since start (in hours):\n0 = start of dataset\n\n72 = 3 days later',
  `hours_passed` int DEFAULT NULL COMMENT 'Hours (bins of 6 hours) since last event happened (recieved, viewed, transaction, completed offer)',
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `reward` int DEFAULT NULL COMMENT 'reward\nReward value of offer\n\n\n\nExample:\n\n\nSpend $10 → get $5 \n→ reward = 5',
  `difficulty` int DEFAULT NULL COMMENT 'How hard the offer is\n\n\nExample:\n\n\nSpend $20 to unlock reward\n\n\n\n=> Higher = harder to complete',
  `duration` int DEFAULT NULL COMMENT 'Offer validity period (in days)\n\n\n\nExample:\n\n\nOffer expires after 7 days',
  `offer_type` varchar(200) DEFAULT NULL COMMENT '- Buy one get one\\n- Direct discount\\n- Informational: no money incentive, only advertisement/new product etc. (engagement/awareness)',
  `signup_date` date DEFAULT NULL COMMENT 'When user joined platform',
  `offer_id` varchar(512) DEFAULT NULL,
  `completed_reward` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_person_time` (`person`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=306535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 22:12:30
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: starbucks
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
-- Table structure for table `channel_names`
--

DROP TABLE IF EXISTS `channel_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_names` (
  `channel_id` int NOT NULL AUTO_INCREMENT,
  `channel` text,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` text,
  `channels` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio` (
  `MyUnknownColumn` int DEFAULT NULL,
  `id` text,
  `reward` int DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `offer_type` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `MyUnknownColumn` int DEFAULT NULL,
  `gender` text,
  `age` int DEFAULT NULL,
  `id` text,
  `became_member_on` int DEFAULT NULL,
  `income` text,
  `signup_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transcript`
--

DROP TABLE IF EXISTS `transcript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transcript` (
  `MyUnknownColumn` int DEFAULT NULL,
  `person` text,
  `event` text,
  `value` json DEFAULT NULL,
  `time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-12 22:12:30
