-- MySQL dump 10.13  Distrib 5.6.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: fm
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL,
  `event_place` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `event_content` text NOT NULL,
  `event_location` point NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'äººæ¨©åçºã»ããã¼ãå­ã©ããã¡ã«å­¦ãã äººæ¨©ï½äº¬é½ã»å¼¥æ ä¸­ã®åæããï½ã','åå·¥è¦³åã»ã³ã¿ã¼ 4é','2015-08-29','äº¬é½å¸ç«å¼¥æ ä¸­å­¦æ ¡ã®äººæ¨©æè²ãå¯çåæãã¦æããäººæ¨©ã®ç¾ç¶','\0\0\0\0\0\0\0MÀ¯¤ì`@0»\'½A@','2015-08-26 20:45:54');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fushinsya`
--

DROP TABLE IF EXISTS `fushinsya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fushinsya` (
  `fushimsya_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fushinsya_date` datetime NOT NULL,
  `fushinsya_content1` text NOT NULL,
  `fushinsya_content2` text NOT NULL,
  `fushinsya_place` varchar(255) NOT NULL,
  `fushinsya_location` geometry NOT NULL,
  `fushinsya_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fushimsya_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fushinsya`
--

LOCK TABLES `fushinsya` WRITE;
/*!40000 ALTER TABLE `fushinsya` DISABLE KEYS */;
INSERT INTO `fushinsya` VALUES (10,'2015-07-14 16:10:00','å¥³å­åç«¥ï¼åãä¸æ ¡éä¸­ãç½ãã¯ã³ããã¯ã¹ã«ã¼ã®ä¸­ãããéããããã«ãæ­¢ã¾ããã¨å£°ããããããã\r\n','ç½ã£ã½ãæãçãè¥ãç·ï¼åä¹èããï¼ã\r\n','èé¶´å¸å­å¥³å¸','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','2015-08-28 05:37:40');
/*!40000 ALTER TABLE `fushinsya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koutu_rosen`
--

DROP TABLE IF EXISTS `koutu_rosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koutu_rosen` (
  `koutu_rosen_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `koutu_time` date DEFAULT NULL,
  `koutu_line` varchar(255) NOT NULL,
  `koutu_station1` varchar(255) NOT NULL,
  `koutu_station2` varchar(255) NOT NULL,
  `koutu_state` varchar(255) NOT NULL,
  `koutu_rosen_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `station1_location` geometry DEFAULT NULL,
  `station2_location` geometry DEFAULT NULL,
  PRIMARY KEY (`koutu_rosen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koutu_rosen`
--

LOCK TABLES `koutu_rosen` WRITE;
/*!40000 ALTER TABLE `koutu_rosen` DISABLE KEYS */;
INSERT INTO `koutu_rosen` VALUES (1,'2015-08-30','舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 06:39:15',NULL,NULL),(2,'2015-08-30','山陰本線','園部駅','福知山駅','運転再開','2015-08-30 06:39:15',NULL,NULL),(3,'2015-08-30','山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 06:39:15',NULL,NULL),(4,'2015-08-30','福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 06:39:15',NULL,NULL),(5,'2015-08-30','小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 06:39:15',NULL,NULL),(6,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 15:53:54',NULL,NULL),(7,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 15:53:54',NULL,NULL),(8,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 15:53:54',NULL,NULL),(9,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 15:53:54',NULL,NULL),(10,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 15:53:54',NULL,NULL),(11,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 15:53:55',NULL,NULL),(12,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 15:53:55',NULL,NULL),(13,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 15:53:55',NULL,NULL),(14,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 15:53:55',NULL,NULL),(15,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 15:53:55',NULL,NULL),(16,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 16:00:41',NULL,NULL),(17,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 16:00:41',NULL,NULL),(18,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 16:00:41',NULL,NULL),(19,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 16:00:41',NULL,NULL),(20,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 16:00:41',NULL,NULL),(21,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 16:00:45',NULL,NULL),(22,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 16:00:45',NULL,NULL),(23,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 16:00:45',NULL,NULL),(24,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 16:00:45',NULL,NULL),(25,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 16:00:45',NULL,NULL),(26,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 22:41:41','',''),(27,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 22:41:55','',''),(28,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 22:42:10','',''),(29,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 22:42:11','',''),(30,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 22:42:12','',''),(31,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 22:43:05','',''),(32,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 22:43:22','',''),(33,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 22:43:40','',''),(34,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 22:43:41','',''),(35,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 22:43:41','',''),(36,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 22:47:20','',''),(37,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 22:47:20','',''),(38,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 22:47:20','',''),(39,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 22:47:20','',''),(40,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 22:47:20','',''),(41,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 22:47:24','',''),(42,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 22:47:24','',''),(43,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 22:47:24','',''),(44,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 22:47:24','',''),(45,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 22:47:24','',''),(46,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 22:48:09','',''),(47,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 22:48:09','',''),(48,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 22:48:09','',''),(49,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 22:48:09','',''),(50,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 22:48:09','',''),(51,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 22:58:51','\0\0\0\0\0\0\0�K�e��A@6Y���`@','\0\0\0\0\0\0\0`W����A@6Y���`@'),(52,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 22:59:07','\0\0\0\0\0\0\0OYM��A@�vx�`@','\0\0\0\0\0\0\0dt@��A@�vx�`@'),(53,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 22:59:22','\0\0\0\0\0\0\0dt@��A@tϺF��`@','\0\0\0\0\0\0\0;�\r��A@tϺF��`@'),(54,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 22:59:24','\0\0\0\0\0\0\0dt@��A@tϺF��`@','\0\0\0\0\0\0\0p��e1�A@tϺF��`@'),(55,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 22:59:25','\0\0\0\0\0\0\0�K�e��A@6Y���`@','\0\0\0\0\0\0\0W�f��A@6Y���`@'),(56,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 23:00:36','\0\0\0\0\0\0\0�K�e��A@6Y���`@','\0\0\0\0\0\0\0`W����A@6Y���`@'),(57,NULL,'舞鶴線','東舞鶴駅','綾部駅','運転再開','2015-08-30 23:00:39','\0\0\0\0\0\0\0�K�e��A@6Y���`@','\0\0\0\0\0\0\0`W����A@6Y���`@'),(58,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 23:00:51','\0\0\0\0\0\0\0OYM��A@�vx�`@','\0\0\0\0\0\0\0dt@��A@�vx�`@'),(59,NULL,'山陰本線','園部駅','福知山駅','運転再開','2015-08-30 23:00:55','\0\0\0\0\0\0\0OYM��A@�vx�`@','\0\0\0\0\0\0\0dt@��A@�vx�`@'),(60,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 23:01:04','\0\0\0\0\0\0\0dt@��A@tϺF��`@','\0\0\0\0\0\0\0;�\r��A@tϺF��`@'),(61,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 23:01:05','\0\0\0\0\0\0\0dt@��A@tϺF��`@','\0\0\0\0\0\0\0p��e1�A@tϺF��`@'),(62,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 23:01:07','\0\0\0\0\0\0\0�K�e��A@6Y���`@','\0\0\0\0\0\0\0W�f��A@6Y���`@'),(63,NULL,'山陰本線','福知山駅','豊岡駅','運転見合わせ中','2015-08-30 23:01:10','\0\0\0\0\0\0\0dt@��A@tϺF��`@','\0\0\0\0\0\0\0;�\r��A@tϺF��`@'),(64,NULL,'福知山線','福知山駅','篠山口駅','運転見合わせ中','2015-08-30 23:01:11','\0\0\0\0\0\0\0dt@��A@tϺF��`@','\0\0\0\0\0\0\0p��e1�A@tϺF��`@'),(65,NULL,'小浜線','東舞鶴駅','敦賀駅','運転再開','2015-08-30 23:01:12','\0\0\0\0\0\0\0�K�e��A@6Y���`@','\0\0\0\0\0\0\0W�f��A@6Y���`@');
/*!40000 ALTER TABLE `koutu_rosen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-31 20:06:44
