/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: gantengdann
-- ------------------------------------------------------
-- Server version	10.6.23-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_log_subjects`
--

DROP TABLE IF EXISTS `activity_log_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log_subjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `activity_log_id` bigint(20) unsigned NOT NULL,
  `subject_type` varchar(191) NOT NULL,
  `subject_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_subjects_activity_log_id_foreign` (`activity_log_id`),
  KEY `activity_log_subjects_subject_type_subject_id_index` (`subject_type`,`subject_id`),
  CONSTRAINT `activity_log_subjects_activity_log_id_foreign` FOREIGN KEY (`activity_log_id`) REFERENCES `activity_logs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log_subjects`
--

LOCK TABLES `activity_log_subjects` WRITE;
/*!40000 ALTER TABLE `activity_log_subjects` DISABLE KEYS */;
INSERT INTO `activity_log_subjects` VALUES (1,1,'user',1),(2,2,'user',1),(3,3,'user',1),(4,4,'user',1),(5,5,'user',1),(6,7,'user',2),(7,8,'user',2),(8,9,'user',2),(9,10,'user',2),(10,14,'user',1),(11,15,'user',1),(12,16,'user',1),(13,17,'user',3),(14,18,'user',3);
/*!40000 ALTER TABLE `activity_log_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch` char(36) DEFAULT NULL,
  `event` varchar(191) NOT NULL,
  `ip` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `actor_type` varchar(191) DEFAULT NULL,
  `actor_id` bigint(20) unsigned DEFAULT NULL,
  `api_key_id` int(10) unsigned DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`properties`)),
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `prev_hash` varchar(191) DEFAULT NULL,
  `hash` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_logs_actor_type_actor_id_index` (`actor_type`,`actor_id`),
  KEY `activity_logs_event_index` (`event`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,NULL,'auth:risk.new_ip','103.134.220.49','Detected login from new IP address.','user',1,NULL,'{\"ip\":\"103.134.220.49\"}','2026-02-28 07:39:55','GENESIS_HASH','5f94a02c5465d6d2fddbdf131ecf9043cb4795441e58a9e4f9394e15f1c5fb76'),(2,NULL,'auth:success','103.134.220.49',NULL,'user',1,NULL,'{\"ip\":\"103.134.220.49\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\"}','2026-02-28 07:39:55','5f94a02c5465d6d2fddbdf131ecf9043cb4795441e58a9e4f9394e15f1c5fb76','e9680f8bee017e53981c7b756c60fb637eda18706e45913b849ba5413a64430e'),(3,NULL,'auth:risk.new_ip','52.220.157.15','Detected login from new IP address.','user',1,NULL,'{\"ip\":\"52.220.157.15\"}','2026-02-28 08:01:07','e9680f8bee017e53981c7b756c60fb637eda18706e45913b849ba5413a64430e','9b6d91f0f09b34bb7e80d56c8d842613f1177fa638ae6ad565f1972940a09970'),(4,NULL,'auth:success','52.220.157.15',NULL,'user',1,NULL,'{\"ip\":\"52.220.157.15\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\"}','2026-02-28 08:01:07','9b6d91f0f09b34bb7e80d56c8d842613f1177fa638ae6ad565f1972940a09970','9c2d97a5388b6aca2b5af165228eb1a48206021aa88a0ccaab0d903420628096'),(5,NULL,'auth:success','52.220.157.15',NULL,'user',1,NULL,'{\"ip\":\"52.220.157.15\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\"}','2026-02-28 08:07:13','9c2d97a5388b6aca2b5af165228eb1a48206021aa88a0ccaab0d903420628096','c205c1893540cebc46c3bb94032cb5fb87af375ec0c6bc989268ed3b79521cc4'),(6,NULL,'auth:fail','114.10.155.134',NULL,NULL,NULL,NULL,'{\"ip\":\"114.10.155.134\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/135.0.7049.100 Safari\\/537.36\",\"username\":\"yaa\"}','2026-02-28 08:18:31','c205c1893540cebc46c3bb94032cb5fb87af375ec0c6bc989268ed3b79521cc4','d1578bbbd739c473096b82e7672a2bebaa587bdef6b340c2b3ed938236a811ee'),(7,NULL,'auth:risk.new_ip','104.28.163.34','Detected login from new IP address.','user',2,NULL,'{\"ip\":\"104.28.163.34\"}','2026-02-28 08:49:35','d1578bbbd739c473096b82e7672a2bebaa587bdef6b340c2b3ed938236a811ee','b0a76d10cb1e00011f7019da0424e4bfa6aad61b066a45e7ad9bf975a8e628d2'),(8,NULL,'auth:risk.new_ip','104.28.163.34','Detected login from new IP address.','user',2,NULL,'{\"ip\":\"104.28.163.34\"}','2026-02-28 08:51:38','b0a76d10cb1e00011f7019da0424e4bfa6aad61b066a45e7ad9bf975a8e628d2','30a66c88667449e0d9ff017d925bc5c8e321a15810ed577deb26137c0d1e8712'),(9,NULL,'auth:risk.new_ip','104.28.163.34','Detected login from new IP address.','user',2,NULL,'{\"ip\":\"104.28.163.34\"}','2026-02-28 08:58:45','30a66c88667449e0d9ff017d925bc5c8e321a15810ed577deb26137c0d1e8712','b4a0ba949420589f52b7cdf8f4ae8d97dd33714dcbc74e6964e5879876bbf849'),(10,NULL,'auth:risk.new_ip','104.28.163.34','Detected login from new IP address.','user',2,NULL,'{\"ip\":\"104.28.163.34\"}','2026-02-28 09:03:12','b4a0ba949420589f52b7cdf8f4ae8d97dd33714dcbc74e6964e5879876bbf849','93440932183fadd836f413cd89f1d2e80dc38d08addad328e6601020d396f458'),(11,NULL,'auth:fail','104.28.163.34',NULL,NULL,NULL,NULL,'{\"ip\":\"104.28.163.34\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"username\":\"kontolll\"}','2026-02-28 09:10:25','93440932183fadd836f413cd89f1d2e80dc38d08addad328e6601020d396f458','2592ad2d23527fe965f37867191f872dc398a86cebf6a10ab4835337889c4c19'),(12,NULL,'auth:fail','104.28.163.34',NULL,NULL,NULL,NULL,'{\"ip\":\"104.28.163.34\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"username\":\"kontolll\"}','2026-02-28 09:11:01','2592ad2d23527fe965f37867191f872dc398a86cebf6a10ab4835337889c4c19','b577d2d0a2550449ff5e4a109d0bf449a2d49a940fecb2f90965360370a1324d'),(13,NULL,'auth:fail','104.28.163.34',NULL,NULL,NULL,NULL,'{\"ip\":\"104.28.163.34\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"username\":\"kontolll\"}','2026-02-28 09:15:59','b577d2d0a2550449ff5e4a109d0bf449a2d49a940fecb2f90965360370a1324d','d8b2b76611d39acce77f3f4998995ebed0d4bca3fa478e79badc3e75c59780b4'),(14,NULL,'auth:fail','104.28.163.34',NULL,NULL,NULL,NULL,'{\"ip\":\"104.28.163.34\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"username\":\"kontoll\"}','2026-02-28 09:19:58','d8b2b76611d39acce77f3f4998995ebed0d4bca3fa478e79badc3e75c59780b4','b8d2f29c42dc5662634c0e6b1fa0b51def7c0908a7aa168de205bb719fa4d67c'),(15,NULL,'auth:risk.new_ip','104.28.163.34','Detected login from new IP address.','user',1,NULL,'{\"ip\":\"104.28.163.34\"}','2026-02-28 09:21:04','b8d2f29c42dc5662634c0e6b1fa0b51def7c0908a7aa168de205bb719fa4d67c','0ff8b862325f961cc2a4605b88a55def346e46bc8c021d30206c04b96d81698f'),(16,NULL,'auth:success','104.28.163.34',NULL,'user',1,NULL,'{\"ip\":\"104.28.163.34\",\"useragent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\"}','2026-02-28 09:21:04','0ff8b862325f961cc2a4605b88a55def346e46bc8c021d30206c04b96d81698f','b6ed78dbe0e1d355ea4273a603fa15bfbd16ad3c1a2ff02cdf6455b361f39f10'),(17,NULL,'auth:risk.new_ip','104.28.163.34','Detected login from new IP address.','user',3,NULL,'{\"ip\":\"104.28.163.34\"}','2026-02-28 10:09:51','b6ed78dbe0e1d355ea4273a603fa15bfbd16ad3c1a2ff02cdf6455b361f39f10','a800a794c594fc45e220be7d52001813697a7f1f48f7884f4ad979b0657d2d99'),(18,NULL,'auth:success','104.28.163.34',NULL,'user',3,NULL,'{\"ip\":\"104.28.163.34\",\"useragent\":\"Mozilla\\/5.0 (Linux; U; Android 15; en-US; TECNO CM5 Build\\/AP3A.240905.015.A2) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/123.0.6312.80 UCBrowser\\/15.1.0.1386 Mobile Safari\\/537.36\"}','2026-02-28 10:09:51','a800a794c594fc45e220be7d52001813697a7f1f48f7884f4ad979b0657d2d99','b2a7cbc62e3a2d6cc2a8905d23b49f19fb5912c44a414d5de4589ec276d7260d');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adaptive_baselines`
--

DROP TABLE IF EXISTS `adaptive_baselines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `adaptive_baselines` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned DEFAULT NULL,
  `metric_key` varchar(120) NOT NULL,
  `ewma` double NOT NULL DEFAULT 0,
  `variance` double NOT NULL DEFAULT 1,
  `last_value` double NOT NULL DEFAULT 0,
  `anomaly_score` double NOT NULL DEFAULT 0,
  `sample_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adaptive_baselines_server_metric_unique` (`server_id`,`metric_key`),
  KEY `adaptive_baselines_metric_key_anomaly_score_index` (`metric_key`,`anomaly_score`),
  CONSTRAINT `adaptive_baselines_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adaptive_baselines`
--

LOCK TABLES `adaptive_baselines` WRITE;
/*!40000 ALTER TABLE `adaptive_baselines` DISABLE KEYS */;
/*!40000 ALTER TABLE `adaptive_baselines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocations`
--

DROP TABLE IF EXISTS `allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(10) unsigned NOT NULL,
  `ip` varchar(191) NOT NULL,
  `ip_alias` text DEFAULT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `server_id` int(10) unsigned DEFAULT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `allocations_node_id_ip_port_unique` (`node_id`,`ip`,`port`),
  KEY `allocations_server_id_foreign` (`server_id`),
  CONSTRAINT `allocations_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `allocations_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocations`
--

LOCK TABLES `allocations` WRITE;
/*!40000 ALTER TABLE `allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `key_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `identifier` char(16) DEFAULT NULL,
  `token` text NOT NULL,
  `allowed_ips` text DEFAULT NULL,
  `memo` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `r_servers` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_nodes` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_allocations` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_users` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_locations` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_nests` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_eggs` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_database_hosts` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `r_server_databases` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_identifier_unique` (`identifier`),
  KEY `api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
INSERT INTO `api_keys` VALUES (1,1,2,'ptla_RtbRHhfokLt','eyJpdiI6ImFkQnJsZUhZcEE2SzZ1TW84T253NHc9PSIsInZhbHVlIjoid29JekRlUTlZSER4a2FNcDRMeXF2WnJkcVUvTk5IOHRQMm9SUlVvanVFUTdGRFRrOFhSZnk4SjRCNytPc1RpbiIsIm1hYyI6IjRkNTAyOWViZTc2YzEyNTBiNjA5MmNkODNmMWQ3MzcxNGY3ODFmZWVkYmE2MDU0MDc2OWE1MWFlNzg3YzFiNTUiLCJ0YWciOiIifQ==','[]','Automatically generated node deployment key.','2026-02-28 09:31:51',NULL,'2026-02-28 09:28:01','2026-02-28 09:31:51',0,1,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_logs`
--

DROP TABLE IF EXISTS `api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorized` tinyint(1) NOT NULL,
  `error` text DEFAULT NULL,
  `key` char(16) DEFAULT NULL,
  `method` char(6) NOT NULL,
  `route` text NOT NULL,
  `content` text DEFAULT NULL,
  `user_agent` text NOT NULL,
  `request_ip` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_logs`
--

LOCK TABLES `api_logs` WRITE;
/*!40000 ALTER TABLE `api_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT NULL,
  `server_id` int(10) unsigned DEFAULT NULL,
  `action` varchar(191) NOT NULL,
  `subaction` varchar(191) DEFAULT NULL,
  `device` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`device`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `audit_logs_user_id_foreign` (`user_id`),
  KEY `audit_logs_server_id_foreign` (`server_id`),
  KEY `audit_logs_action_server_id_index` (`action`,`server_id`),
  CONSTRAINT `audit_logs_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `uuid` char(36) NOT NULL,
  `upload_id` text DEFAULT NULL,
  `is_successful` tinyint(1) NOT NULL DEFAULT 0,
  `is_locked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL,
  `ignored_files` text NOT NULL,
  `disk` varchar(191) NOT NULL,
  `checksum` varchar(191) DEFAULT NULL,
  `bytes` bigint(20) unsigned NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_uuid_unique` (`uuid`),
  KEY `backups_server_id_foreign` (`server_id`),
  CONSTRAINT `backups_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backups`
--

LOCK TABLES `backups` WRITE;
/*!40000 ALTER TABLE `backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message_receipts`
--

DROP TABLE IF EXISTS `chat_message_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message_receipts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` bigint(20) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_message_receipts_message_id_user_id_unique` (`message_id`,`user_id`),
  KEY `chat_message_receipts_user_id_read_at_index` (`user_id`,`read_at`),
  CONSTRAINT `chat_message_receipts_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_message_receipts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message_receipts`
--

LOCK TABLES `chat_message_receipts` WRITE;
/*!40000 ALTER TABLE `chat_message_receipts` DISABLE KEYS */;
INSERT INTO `chat_message_receipts` VALUES (1,1,3,'2026-02-28 10:10:26','2026-02-28 10:10:26','2026-02-28 10:10:26','2026-02-28 10:10:26'),(2,2,1,'2026-02-28 10:18:22','2026-02-28 10:18:22','2026-02-28 10:18:22','2026-02-28 10:18:22');
/*!40000 ALTER TABLE `chat_message_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_type` varchar(16) NOT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `body` text DEFAULT NULL,
  `media_url` varchar(2048) DEFAULT NULL,
  `reply_to_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_messages_room_type_room_id_created_at_index` (`room_type`,`room_id`,`created_at`),
  KEY `chat_messages_user_id_foreign` (`user_id`),
  KEY `chat_messages_reply_to_id_foreign` (`reply_to_id`),
  CONSTRAINT `chat_messages_reply_to_id_foreign` FOREIGN KEY (`reply_to_id`) REFERENCES `chat_messages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (1,'global',NULL,1,'woi anj',NULL,NULL,'2026-02-28 09:21:20','2026-02-28 09:21:20'),(2,'global',NULL,3,'apa',NULL,NULL,'2026-02-28 10:10:44','2026-02-28 10:10:44');
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_stats`
--

DROP TABLE IF EXISTS `daily_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `total_suspend` int(11) DEFAULT 0,
  `total_files_deleted` int(11) DEFAULT 0,
  `total_process_killed` int(11) DEFAULT 0,
  `unique_users` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`),
  KEY `idx_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_stats`
--

LOCK TABLES `daily_stats` WRITE;
/*!40000 ALTER TABLE `daily_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_hosts`
--

DROP TABLE IF EXISTS `database_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_hosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `host` varchar(191) NOT NULL,
  `port` int(10) unsigned NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `max_databases` int(10) unsigned DEFAULT NULL,
  `node_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `database_hosts_node_id_foreign` (`node_id`),
  CONSTRAINT `database_hosts_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_hosts`
--

LOCK TABLES `database_hosts` WRITE;
/*!40000 ALTER TABLE `database_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `database_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databases`
--

DROP TABLE IF EXISTS `databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `databases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `database_host_id` int(10) unsigned NOT NULL,
  `database` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `remote` varchar(191) NOT NULL DEFAULT '%',
  `password` text NOT NULL,
  `max_connections` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `databases_database_host_id_username_unique` (`database_host_id`,`username`),
  UNIQUE KEY `databases_database_host_id_server_id_database_unique` (`database_host_id`,`server_id`,`database`),
  KEY `databases_server_id_foreign` (`server_id`),
  CONSTRAINT `databases_database_host_id_foreign` FOREIGN KEY (`database_host_id`) REFERENCES `database_hosts` (`id`),
  CONSTRAINT `databases_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databases`
--

LOCK TABLES `databases` WRITE;
/*!40000 ALTER TABLE `databases` DISABLE KEYS */;
/*!40000 ALTER TABLE `databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egg_mount`
--

DROP TABLE IF EXISTS `egg_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `egg_mount` (
  `egg_id` int(10) unsigned NOT NULL,
  `mount_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `egg_mount_egg_id_mount_id_unique` (`egg_id`,`mount_id`),
  KEY `egg_mount_mount_id_foreign` (`mount_id`),
  CONSTRAINT `egg_mount_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `egg_mount_mount_id_foreign` FOREIGN KEY (`mount_id`) REFERENCES `mounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egg_mount`
--

LOCK TABLES `egg_mount` WRITE;
/*!40000 ALTER TABLE `egg_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `egg_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egg_variables`
--

DROP TABLE IF EXISTS `egg_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `egg_variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `egg_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `env_variable` varchar(191) NOT NULL,
  `default_value` text NOT NULL,
  `user_viewable` tinyint(3) unsigned NOT NULL,
  `user_editable` tinyint(3) unsigned NOT NULL,
  `rules` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_variables_egg_id_foreign` (`egg_id`),
  CONSTRAINT `service_variables_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egg_variables`
--

LOCK TABLES `egg_variables` WRITE;
/*!40000 ALTER TABLE `egg_variables` DISABLE KEYS */;
INSERT INTO `egg_variables` VALUES (1,1,'Sponge Version','The version of SpongeVanilla to download and use.','SPONGE_VERSION','1.12.2-7.3.0',1,1,'required|regex:/^([a-zA-Z0-9.\\-_]+)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(2,1,'Server Jar File','The name of the Jarfile to use when running SpongeVanilla.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(3,2,'Bungeecord Version','The version of Bungeecord to download and use.','BUNGEE_VERSION','latest',1,1,'required|alpha_num|between:1,6','2026-02-28 07:22:23','2026-02-28 07:37:16'),(4,2,'Bungeecord Jar File','The name of the Jarfile to use when running Bungeecord.','SERVER_JARFILE','bungeecord.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(5,3,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(6,3,'Server Version','The version of Minecraft Vanilla to install. Use \"latest\" to install the latest version, or use \"snapshot\" to install the latest snapshot. Go to Settings > Reinstall Server to apply.','VANILLA_VERSION','latest',1,1,'required|string|between:3,15','2026-02-28 07:22:23','2026-02-28 07:37:16'),(7,4,'Minecraft Version','The version of minecraft to download. \r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.','MINECRAFT_VERSION','latest',1,1,'nullable|string|max:20','2026-02-28 07:22:23','2026-02-28 07:37:16'),(8,4,'Server Jar File','The name of the server jarfile to run the server with.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(9,4,'Download Path','A URL to use to download a server.jar rather than the ones in the install script. This is not user viewable.','DL_PATH','',0,0,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(10,4,'Build Number','The build number for the paper release.\r\n\r\nLeave at latest to always get the latest version. Invalid versions will default to latest.','BUILD_NUMBER','latest',1,1,'required|string|max:20','2026-02-28 07:22:23','2026-02-28 07:37:16'),(11,5,'Server Jar File','The name of the Jarfile to use when running Forge version below 1.17.','SERVER_JARFILE','server.jar',1,1,'required|regex:/^([\\w\\d._-]+)(\\.jar)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(12,5,'Minecraft Version','The version of minecraft you want to install for.\r\n\r\nLeaving latest will install the latest recommended version.','MC_VERSION','latest',1,1,'required|string|max:9','2026-02-28 07:22:23','2026-02-28 07:37:16'),(13,5,'Build Type','The type of server jar to download from forge.\r\n\r\nValid types are \"recommended\" and \"latest\".','BUILD_TYPE','recommended',1,1,'required|string|in:recommended,latest','2026-02-28 07:22:23','2026-02-28 07:37:16'),(14,5,'Forge Version','The full exact version.\r\n\r\nEx. 1.15.2-31.2.4\r\n\r\nOverrides MC_VERSION and BUILD_TYPE. If it fails to download the server files it will fail to install.','FORGE_VERSION','',1,1,'nullable|regex:/^[0-9\\.\\-]+$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(15,6,'Game ID','The ID corresponding to the game to download and run using SRCDS.','SRCDS_APPID','232250',1,0,'required|regex:/^(232250)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(16,6,'Default Map','The default map to use when starting the server.','SRCDS_MAP','cp_dustbowl',1,1,'required|regex:/^(\\w{1,20})$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(17,6,'Steam','The Steam Game Server Login Token to display servers publicly. Generate one at https://steamcommunity.com/dev/managegameservers','STEAM_ACC','',1,1,'required|string|alpha_num|size:32','2026-02-28 07:22:23','2026-02-28 07:37:16'),(18,7,'Server Password','If specified, players must provide this password to join the server.','ARK_PASSWORD','',1,1,'nullable|alpha_dash|between:1,100','2026-02-28 07:22:23','2026-02-28 07:37:16'),(19,7,'Admin Password','If specified, players must provide this password (via the in-game console) to gain access to administrator commands on the server.','ARK_ADMIN_PASSWORD','PleaseChangeMe',1,1,'required|alpha_dash|between:1,100','2026-02-28 07:22:23','2026-02-28 07:37:16'),(20,7,'Server Map','Available Maps: TheIsland, TheCenter, Ragnarok, ScorchedEarth_P, Aberration_P, Extinction, Valguero_P, Genesis, CrystalIsles, Gen2, Fjordur','SERVER_MAP','TheIsland',1,1,'required|string|max:20','2026-02-28 07:22:23','2026-02-28 07:37:16'),(21,7,'Server Name','ARK server name','SESSION_NAME','A Pterodactyl Hosted ARK Server',1,1,'required|string|max:128','2026-02-28 07:22:23','2026-02-28 07:37:16'),(22,7,'Rcon Port','ARK rcon port used by rcon tools.','RCON_PORT','27020',1,1,'required|numeric','2026-02-28 07:22:23','2026-02-28 07:37:16'),(23,7,'Query Port','ARK query port used by steam server browser and ark client server browser.','QUERY_PORT','27015',1,1,'required|numeric','2026-02-28 07:22:23','2026-02-28 07:37:16'),(24,7,'Auto-update server','This is to enable auto-updating for servers.\r\n\r\nDefault is 0. Set to 1 to update','AUTO_UPDATE','0',1,1,'required|boolean','2026-02-28 07:22:23','2026-02-28 07:37:16'),(25,7,'Battle Eye','Enable BattleEye\r\n\r\n0 to disable\r\n1 to enable\r\n\r\ndefault=\"1\"','BATTLE_EYE','1',1,1,'required|boolean','2026-02-28 07:22:23','2026-02-28 07:37:16'),(26,7,'App ID','ARK steam app id for auto updates. Leave blank to avoid auto update.','SRCDS_APPID','376030',1,0,'nullable|numeric','2026-02-28 07:22:23','2026-02-28 07:37:16'),(27,7,'Additional Arguments','Specify additional launch parameters such as -crossplay. You must include a dash - and separate each parameter with space: -crossplay -exclusivejoin','ARGS','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(28,7,'Mods','Specifies the order and which mods are loaded. ModIDs need to be comma-separated such as: ModID1,ModID2','MOD_ID','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(29,7,'Max Players','Specifies the maximum amount of players able to join the server.','MAX_PLAYERS','12',1,1,'numeric','2026-02-28 07:22:23','2026-02-28 07:37:16'),(30,8,'Map','The default map for the server.','SRCDS_MAP','de_dust2',1,1,'required|string|alpha_dash','2026-02-28 07:22:23','2026-02-28 07:37:16'),(31,8,'Steam Account Token','The Steam Account Token required for the server to be displayed publicly.','STEAM_ACC','',1,1,'required|string|alpha_num|size:32','2026-02-28 07:22:23','2026-02-28 07:37:16'),(32,8,'Source AppID','Required for game to update on server restart. Do not modify this.','SRCDS_APPID','740',0,0,'required|string|max:20','2026-02-28 07:22:23','2026-02-28 07:37:16'),(33,9,'Map','The default map for the server.','SRCDS_MAP','gm_flatgrass',1,1,'required|string|alpha_dash','2026-02-28 07:22:23','2026-02-28 07:37:16'),(34,9,'Steam Account Token','The Steam Account Token required for the server to be displayed publicly.','STEAM_ACC','',1,1,'nullable|string|alpha_num|size:32','2026-02-28 07:22:23','2026-02-28 07:37:16'),(35,9,'Source AppID','Required for game to update on server restart. Do not modify this.','SRCDS_APPID','4020',0,0,'required|string|max:20','2026-02-28 07:22:23','2026-02-28 07:37:16'),(36,9,'Workshop ID','The ID of your workshop collection (the numbers at the end of the URL)','WORKSHOP_ID','',1,1,'nullable|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(37,9,'Gamemode','The gamemode of your server.','GAMEMODE','sandbox',1,1,'required|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(38,9,'Max Players','The maximum amount of players allowed on your game server.','MAX_PLAYERS','32',1,1,'required|integer|max:128','2026-02-28 07:22:23','2026-02-28 07:37:16'),(39,9,'Tickrate','The tickrate defines how fast the server will update each entity\'s location.','TICKRATE','22',1,1,'required|integer|max:100','2026-02-28 07:22:23','2026-02-28 07:37:16'),(40,9,'Lua Refresh','0 = disable Lua refresh,\r\n1 = enable Lua refresh','LUA_REFRESH','0',1,1,'required|boolean','2026-02-28 07:22:23','2026-02-28 07:37:16'),(41,10,'Game ID','The ID corresponding to the game to download and run using SRCDS.','SRCDS_APPID','237410',1,0,'required|regex:/^(237410)$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(42,10,'Default Map','The default map to use when starting the server.','SRCDS_MAP','sinjar',1,1,'required|regex:/^(\\w{1,20})$/','2026-02-28 07:22:23','2026-02-28 07:37:16'),(43,11,'Game ID','The ID corresponding to the game to download and run using SRCDS.','SRCDS_APPID','',1,0,'required|numeric|digits_between:1,6','2026-02-28 07:22:23','2026-02-28 07:37:16'),(44,11,'Game Name','The name corresponding to the game to download and run using SRCDS.','SRCDS_GAME','',1,0,'required|alpha_dash|between:1,100','2026-02-28 07:22:23','2026-02-28 07:37:16'),(45,11,'Map','The default map for the server.','SRCDS_MAP','',1,1,'required|string|alpha_dash','2026-02-28 07:22:23','2026-02-28 07:37:16'),(46,11,'Steam Username','','STEAM_USER','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(47,11,'Steam Password','','STEAM_PASS','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(48,11,'Steam Auth','','STEAM_AUTH','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(49,12,'Maximum Users','Maximum concurrent users on the mumble server.','MAX_USERS','100',1,0,'required|numeric|digits_between:1,5','2026-02-28 07:22:23','2026-02-28 07:37:16'),(50,13,'Server Version','The version of Teamspeak 3 to use when running the server.','TS_VERSION','latest',1,1,'required|string|max:6','2026-02-28 07:22:23','2026-02-28 07:37:16'),(51,13,'File Transfer Port','The Teamspeak file transfer port','FILE_TRANSFER','30033',1,0,'required|integer|between:1025,65535','2026-02-28 07:22:23','2026-02-28 07:37:16'),(52,13,'Query Port','The Teamspeak Query Port','QUERY_PORT','10011',1,0,'required|integer|between:1025,65535','2026-02-28 07:22:23','2026-02-28 07:37:16'),(53,13,'Query Protocols','Comma separated list of protocols that can be used to connect to the ServerQuery | \r\nPossible values are raw, ssh and http | \r\nE.g.: raw,ssh,http','QUERY_PROTOCOLS_VAR','raw,http,ssh',1,1,'required|string|max:12','2026-02-28 07:22:23','2026-02-28 07:37:16'),(54,13,'Query SSH Port','TCP Port opened for ServerQuery connections using SSH','QUERY_SSH','10022',1,0,'required|integer|between:1025,65535','2026-02-28 07:22:23','2026-02-28 07:37:16'),(55,13,'Query HTTP Port','TCP Port opened for ServerQuery connections using http','QUERY_HTTP','10080',1,0,'required|integer|between:1025,65535','2026-02-28 07:22:23','2026-02-28 07:37:16'),(56,13,'Server Query Admin Password','The password for the server query admin user.','SERVERADMIN_PASSWORD','',1,1,'nullable|string|max:32','2026-02-28 07:22:23','2026-02-28 07:37:16'),(57,14,'Server Name','The name of your server in the public server list.','HOSTNAME','A Rust Server',1,1,'required|string|max:60','2026-02-28 07:22:23','2026-02-28 07:37:16'),(58,14,'Modding Framework','The modding framework to be used: carbon, oxide, vanilla.\r\nDefaults to \"vanilla\" for a non-modded server installation.','FRAMEWORK','vanilla',1,1,'required|in:vanilla,oxide,carbon','2026-02-28 07:22:23','2026-02-28 07:37:16'),(59,14,'Level','The world file for Rust to use.','LEVEL','Procedural Map',1,1,'required|string|max:20','2026-02-28 07:22:23','2026-02-28 07:37:16'),(60,14,'Description','The description under your server title. Commonly used for rules & info. Use \\n for newlines.','DESCRIPTION','Powered by Pterodactyl',1,1,'required|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(61,14,'URL','The URL for your server. This is what comes up when clicking the \"Visit Website\" button.','SERVER_URL','http://pterodactyl.io',1,1,'nullable|url','2026-02-28 07:22:23','2026-02-28 07:37:16'),(62,14,'World Size','The world size for a procedural map.','WORLD_SIZE','3000',1,1,'required|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(63,14,'World Seed','The seed for a procedural map.','WORLD_SEED','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(64,14,'Max Players','The maximum amount of players allowed in the server at once.','MAX_PLAYERS','40',1,1,'required|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(65,14,'Server Image','The header image for the top of your server listing.','SERVER_IMG','',1,1,'nullable|url','2026-02-28 07:22:23','2026-02-28 07:37:16'),(66,14,'Query Port','Server Query Port. Can\'t be the same as Game\'s primary port.','QUERY_PORT','27017',1,0,'required|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(67,14,'RCON Port','Port for RCON connections.','RCON_PORT','28016',1,0,'required|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(68,14,'RCON Password','RCON access password.','RCON_PASS','',1,1,'required|regex:/^[\\w.-]*$/|max:64','2026-02-28 07:22:23','2026-02-28 07:37:16'),(69,14,'Save Interval','Sets the server’s auto-save interval in seconds.','SAVEINTERVAL','60',1,1,'required|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(70,14,'Additional Arguments','Add additional startup parameters to the server.','ADDITIONAL_ARGS','',1,1,'nullable|string','2026-02-28 07:22:23','2026-02-28 07:37:16'),(71,14,'App Port','Port for the Rust+ App. -1 to disable.','APP_PORT','28082',1,0,'required|integer','2026-02-28 07:22:23','2026-02-28 07:37:16'),(72,14,'Server Logo','The circular server logo for the Rust+ app.','SERVER_LOGO','',1,1,'nullable|url','2026-02-28 07:22:23','2026-02-28 07:37:16'),(73,14,'Custom Map URL','Overwrites the map with the one from the direct download URL. Invalid URLs will cause the server to crash.','MAP_URL','',1,1,'nullable|url','2026-02-28 07:22:23','2026-02-28 07:37:16');
/*!40000 ALTER TABLE `egg_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eggs`
--

DROP TABLE IF EXISTS `eggs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `eggs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `nest_id` int(10) unsigned NOT NULL,
  `author` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`features`)),
  `docker_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`docker_images`)),
  `file_denylist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`file_denylist`)),
  `update_url` text DEFAULT NULL,
  `config_files` text DEFAULT NULL,
  `config_startup` text DEFAULT NULL,
  `config_logs` text DEFAULT NULL,
  `config_stop` varchar(191) DEFAULT NULL,
  `config_from` int(10) unsigned DEFAULT NULL,
  `startup` text DEFAULT NULL,
  `script_container` varchar(191) NOT NULL DEFAULT 'alpine:3.4',
  `copy_script_from` int(10) unsigned DEFAULT NULL,
  `script_entry` varchar(191) NOT NULL DEFAULT 'ash',
  `script_is_privileged` tinyint(1) NOT NULL DEFAULT 1,
  `script_install` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `force_outgoing_ip` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_options_uuid_unique` (`uuid`),
  KEY `service_options_nest_id_foreign` (`nest_id`),
  KEY `eggs_config_from_foreign` (`config_from`),
  KEY `eggs_copy_script_from_foreign` (`copy_script_from`),
  CONSTRAINT `eggs_config_from_foreign` FOREIGN KEY (`config_from`) REFERENCES `eggs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eggs_copy_script_from_foreign` FOREIGN KEY (`copy_script_from`) REFERENCES `eggs` (`id`) ON DELETE SET NULL,
  CONSTRAINT `service_options_nest_id_foreign` FOREIGN KEY (`nest_id`) REFERENCES `nests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eggs`
--

LOCK TABLES `eggs` WRITE;
/*!40000 ALTER TABLE `eggs` DISABLE KEYS */;
INSERT INTO `eggs` VALUES (1,'956e7157-be77-4eed-a094-916bedb2f339',1,'support@pterodactyl.io','Sponge (SpongeVanilla)','SpongeVanilla is the SpongeAPI implementation for Vanilla Minecraft.','[\"eula\",\"java_version\",\"pid_limit\"]','{\"Java 21\":\"ghcr.io\\/pterodactyl\\/yolks:java_21\",\"Java 16\":\"ghcr.io\\/pterodactyl\\/yolks:java_16\",\"Java 11\":\"ghcr.io\\/pterodactyl\\/yolks:java_11\",\"Java 8\":\"ghcr.io\\/pterodactyl\\/yolks:java_8\"}','[]',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \"\r\n}','{}','stop',NULL,'java -Xms128M -XX:MaxRAMPercentage=95.0 -jar {{SERVER_JARFILE}}','ghcr.io/pterodactyl/installers:alpine',NULL,'ash',1,'#!/bin/ash\r\n# Sponge Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\ncd /mnt/server\r\n\r\ncurl -sSL \"https://repo.spongepowered.org/maven/org/spongepowered/spongevanilla/${SPONGE_VERSION}/spongevanilla-${SPONGE_VERSION}.jar\" -o ${SERVER_JARFILE}','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(2,'1e81003e-fc9c-43ea-808f-89757b08068e',1,'support@pterodactyl.io','Bungeecord','For a long time, Minecraft server owners have had a dream that encompasses a free, easy, and reliable way to connect multiple Minecraft servers together. BungeeCord is the answer to said dream. Whether you are a small server wishing to string multiple game-modes together, or the owner of the ShotBow Network, BungeeCord is the ideal solution for you. With the help of BungeeCord, you will be able to unlock your community\'s full potential.','[\"eula\",\"java_version\",\"pid_limit\"]','{\"Java 21\":\"ghcr.io\\/pterodactyl\\/yolks:java_21\",\"Java 17\":\"ghcr.io\\/pterodactyl\\/yolks:java_17\",\"Java 16\":\"ghcr.io\\/pterodactyl\\/yolks:java_16\",\"Java 11\":\"ghcr.io\\/pterodactyl\\/yolks:java_11\",\"Java 8\":\"ghcr.io\\/pterodactyl\\/yolks:java_8\"}','[]',NULL,'{\r\n    \"config.yml\": {\r\n        \"parser\": \"yaml\",\r\n        \"find\": {\r\n            \"listeners[0].query_port\": \"{{server.build.default.port}}\",\r\n            \"listeners[0].host\": \"0.0.0.0:{{server.build.default.port}}\",\r\n            \"servers.*.address\": {\r\n                \"regex:^(127\\\\.0\\\\.0\\\\.1|localhost)(:\\\\d{1,5})?$\": \"{{config.docker.interface}}$2\"\r\n            }\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \"Listening on \"\r\n}','{}','end',NULL,'java -Xms128M -XX:MaxRAMPercentage=95.0 -jar {{SERVER_JARFILE}}','ghcr.io/pterodactyl/installers:alpine',NULL,'ash',1,'#!/bin/ash\r\n# Bungeecord Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\ncd /mnt/server\r\n\r\nif [ -z \"${BUNGEE_VERSION}\" ] || [ \"${BUNGEE_VERSION}\" == \"latest\" ]; then\r\n    BUNGEE_VERSION=\"lastStableBuild\"\r\nfi\r\n\r\ncurl -o ${SERVER_JARFILE} https://ci.md-5.net/job/BungeeCord/${BUNGEE_VERSION}/artifact/bootstrap/target/BungeeCord.jar','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(3,'31f80381-502a-41e0-a9c3-da616c02f060',1,'support@pterodactyl.io','Vanilla Minecraft','Minecraft is a game about placing blocks and going on adventures. Explore randomly generated worlds and build amazing things from the simplest of homes to the grandest of castles. Play in Creative Mode with unlimited resources or mine deep in Survival Mode, crafting weapons and armor to fend off dangerous mobs. Do all this alone or with friends.','[\"eula\",\"java_version\",\"pid_limit\"]','{\"Java 21\":\"ghcr.io\\/pterodactyl\\/yolks:java_21\",\"Java 17\":\"ghcr.io\\/pterodactyl\\/yolks:java_17\",\"Java 16\":\"ghcr.io\\/pterodactyl\\/yolks:java_16\",\"Java 11\":\"ghcr.io\\/pterodactyl\\/yolks:java_11\",\"Java 8\":\"ghcr.io\\/pterodactyl\\/yolks:java_8\"}','[]',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \"\r\n}','{}','stop',NULL,'java -Xms128M -XX:MaxRAMPercentage=95.0 -jar {{SERVER_JARFILE}}','ghcr.io/pterodactyl/installers:alpine',NULL,'ash',1,'#!/bin/ash\r\n# Vanilla MC Installation Script\r\n#\r\n# Server Files: /mnt/server\r\nmkdir -p /mnt/server\r\ncd /mnt/server\r\n\r\nLATEST_VERSION=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r \'.latest.release\'`\r\nLATEST_SNAPSHOT_VERSION=`curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r \'.latest.snapshot\'`\r\n\r\necho -e \"latest version is $LATEST_VERSION\"\r\necho -e \"latest snapshot is $LATEST_SNAPSHOT_VERSION\"\r\n\r\nif [ -z \"$VANILLA_VERSION\" ] || [ \"$VANILLA_VERSION\" == \"latest\" ]; then\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $LATEST_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nelif [ \"$VANILLA_VERSION\" == \"snapshot\" ]; then\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $LATEST_SNAPSHOT_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nelse\r\n  MANIFEST_URL=$(curl -sSL https://launchermeta.mojang.com/mc/game/version_manifest.json | jq --arg VERSION $VANILLA_VERSION -r \'.versions | .[] | select(.id== $VERSION )|.url\')\r\nfi\r\n\r\nDOWNLOAD_URL=$(curl ${MANIFEST_URL} | jq .downloads.server | jq -r \'. | .url\')\r\n\r\necho -e \"running: curl -o ${SERVER_JARFILE} $DOWNLOAD_URL\"\r\ncurl -o ${SERVER_JARFILE} $DOWNLOAD_URL\r\n\r\necho -e \"Install Complete\"','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(4,'9baabbef-0536-45d6-a9c7-e634b49b03e0',1,'parker@pterodactyl.io','Paper','High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.','[\"eula\",\"java_version\",\"pid_limit\"]','{\"Java 21\":\"ghcr.io\\/pterodactyl\\/yolks:java_21\",\"Java 17\":\"ghcr.io\\/pterodactyl\\/yolks:java_17\",\"Java 16\":\"ghcr.io\\/pterodactyl\\/yolks:java_16\",\"Java 11\":\"ghcr.io\\/pterodactyl\\/yolks:java_11\",\"Java 8\":\"ghcr.io\\/pterodactyl\\/yolks:java_8\"}','[]',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \"\r\n}','{}','stop',NULL,'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar {{SERVER_JARFILE}}','ghcr.io/pterodactyl/installers:alpine',NULL,'ash',1,'#!/bin/ash\r\n# Paper Installation Script\r\n#\r\n# Server Files: /mnt/server\r\nPROJECT=paper\r\n\r\nif [ -n \"${DL_PATH}\" ]; then\r\n	echo -e \"Using supplied download url: ${DL_PATH}\"\r\n	DOWNLOAD_URL=`eval echo $(echo ${DL_PATH} | sed -e \'s/{{/${/g\' -e \'s/}}/}/g\')`\r\nelse\r\n	VER_EXISTS=`curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r --arg VERSION $MINECRAFT_VERSION \'.versions[] | contains($VERSION)\' | grep -m1 true`\r\n	LATEST_VERSION=`curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r \'.versions\' | jq -r \'.[-1]\'`\r\n\r\n	if [ \"${VER_EXISTS}\" == \"true\" ]; then\r\n		echo -e \"Version is valid. Using version ${MINECRAFT_VERSION}\"\r\n	else\r\n		echo -e \"Specified version not found. Defaulting to the latest ${PROJECT} version\"\r\n		MINECRAFT_VERSION=${LATEST_VERSION}\r\n	fi\r\n\r\n	BUILD_EXISTS=`curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} \'.builds[] | tostring | contains($BUILD)\' | grep -m1 true`\r\n	LATEST_BUILD=`curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r \'.builds\' | jq -r \'.[-1]\'`\r\n\r\n	if [ \"${BUILD_EXISTS}\" == \"true\" ]; then\r\n		echo -e \"Build is valid for version ${MINECRAFT_VERSION}. Using build ${BUILD_NUMBER}\"\r\n	else\r\n		echo -e \"Using the latest ${PROJECT} build for version ${MINECRAFT_VERSION}\"\r\n		BUILD_NUMBER=${LATEST_BUILD}\r\n	fi\r\n\r\n	JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar\r\n\r\n	echo \"Version being downloaded\"\r\n	echo -e \"MC Version: ${MINECRAFT_VERSION}\"\r\n	echo -e \"Build: ${BUILD_NUMBER}\"\r\n	echo -e \"JAR Name of Build: ${JAR_NAME}\"\r\n	DOWNLOAD_URL=https://api.papermc.io/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}\r\nfi\r\n\r\ncd /mnt/server\r\n\r\necho -e \"Running curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}\"\r\n\r\nif [ -f ${SERVER_JARFILE} ]; then\r\n	mv ${SERVER_JARFILE} ${SERVER_JARFILE}.old\r\nfi\r\n\r\ncurl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}\r\n\r\nif [ ! -f server.properties ]; then\r\n    echo -e \"Downloading MC server.properties\"\r\n    curl -o server.properties https://raw.githubusercontent.com/parkervcp/eggs/master/minecraft/java/server.properties\r\nfi','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(5,'ec0878ef-928a-4dc8-a2f1-55715e1c4927',1,'support@pterodactyl.io','Forge Minecraft','Minecraft Forge Server. Minecraft Forge is a modding API (Application Programming Interface), which makes it easier to create mods, and also make sure mods are compatible with each other.','[\"eula\",\"java_version\",\"pid_limit\"]','{\"Java 21\":\"ghcr.io\\/pterodactyl\\/yolks:java_21\",\"Java 17\":\"ghcr.io\\/pterodactyl\\/yolks:java_17\",\"Java 16\":\"ghcr.io\\/pterodactyl\\/yolks:java_16\",\"Java 11\":\"ghcr.io\\/pterodactyl\\/yolks:java_11\",\"Java 8\":\"ghcr.io\\/pterodactyl\\/yolks:java_8\"}','[]',NULL,'{\r\n    \"server.properties\": {\r\n        \"parser\": \"properties\",\r\n        \"find\": {\r\n            \"server-ip\": \"0.0.0.0\",\r\n            \"server-port\": \"{{server.build.default.port}}\",\r\n            \"query.port\": \"{{server.build.default.port}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \")! For help, type \"\r\n}','{}','stop',NULL,'java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true $( [[  ! -f unix_args.txt ]] && printf %s \"-jar {{SERVER_JARFILE}}\" || printf %s \"@unix_args.txt\" )','eclipse-temurin:8-jdk-jammy',NULL,'bash',1,'#!/bin/bash\r\n# Forge Installation Script\r\n#\r\n# Server Files: /mnt/server\r\napt update\r\napt install -y curl jq\r\n\r\nif [[ ! -d /mnt/server ]]; then\r\n  mkdir /mnt/server\r\nfi\r\n\r\ncd /mnt/server\r\n\r\n# Remove spaces from the version number to avoid issues with curl\r\nFORGE_VERSION=\"$(echo \"$FORGE_VERSION\" | tr -d \' \')\"\r\nMC_VERSION=\"$(echo \"$MC_VERSION\" | tr -d \' \')\"\r\n\r\nif [[ ! -z ${FORGE_VERSION} ]]; then\r\n  DOWNLOAD_LINK=https://maven.minecraftforge.net/net/minecraftforge/forge/${FORGE_VERSION}/forge-${FORGE_VERSION}\r\n  FORGE_JAR=forge-${FORGE_VERSION}*.jar\r\nelse\r\n  JSON_DATA=$(curl -sSL https://files.minecraftforge.net/maven/net/minecraftforge/forge/promotions_slim.json)\r\n\r\n  if [[ \"${MC_VERSION}\" == \"latest\" ]] || [[ \"${MC_VERSION}\" == \"\" ]]; then\r\n    echo -e \"getting latest version of forge.\"\r\n    MC_VERSION=$(echo -e ${JSON_DATA} | jq -r \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains(\"latest\")) | split(\"-\")[0]\' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | tail -1)\r\n    BUILD_TYPE=latest\r\n  fi\r\n\r\n  if [[ \"${BUILD_TYPE}\" != \"recommended\" ]] && [[ \"${BUILD_TYPE}\" != \"latest\" ]]; then\r\n    BUILD_TYPE=recommended\r\n  fi\r\n\r\n  echo -e \"minecraft version: ${MC_VERSION}\"\r\n  echo -e \"build type: ${BUILD_TYPE}\"\r\n\r\n  ## some variables for getting versions and things\r\n  FILE_SITE=https://maven.minecraftforge.net/net/minecraftforge/forge/\r\n  VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION \"${MC_VERSION}\" --arg BUILD_TYPE \"${BUILD_TYPE}\" \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains($BUILD_TYPE))\')\r\n\r\n  ## locating the forge version\r\n  if [[ \"${VERSION_KEY}\" == \"\" ]] && [[ \"${BUILD_TYPE}\" == \"recommended\" ]]; then\r\n    echo -e \"dropping back to latest from recommended due to there not being a recommended version of forge for the mc version requested.\"\r\n    VERSION_KEY=$(echo -e ${JSON_DATA} | jq -r --arg MC_VERSION \"${MC_VERSION}\" \'.promos | del(.\"latest-1.7.10\") | del(.\"1.7.10-latest-1.7.10\") | to_entries[] | .key | select(contains($MC_VERSION)) | select(contains(\"latest\"))\')\r\n  fi\r\n\r\n  ## Error if the mc version set wasn\'t valid.\r\n  if [ \"${VERSION_KEY}\" == \"\" ] || [ \"${VERSION_KEY}\" == \"null\" ]; then\r\n    echo -e \"The install failed because there is no valid version of forge for the version of minecraft selected.\"\r\n    exit 1\r\n  fi\r\n\r\n  FORGE_VERSION=$(echo -e ${JSON_DATA} | jq -r --arg VERSION_KEY \"$VERSION_KEY\" \'.promos | .[$VERSION_KEY]\')\r\n\r\n  if [[ \"${MC_VERSION}\" == \"1.7.10\" ]] || [[ \"${MC_VERSION}\" == \"1.8.9\" ]]; then\r\n    DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}\r\n    FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}.jar\r\n    if [[ \"${MC_VERSION}\" == \"1.7.10\" ]]; then\r\n      FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}-${MC_VERSION}-universal.jar\r\n    fi\r\n  else\r\n    DOWNLOAD_LINK=${FILE_SITE}${MC_VERSION}-${FORGE_VERSION}/forge-${MC_VERSION}-${FORGE_VERSION}\r\n    FORGE_JAR=forge-${MC_VERSION}-${FORGE_VERSION}.jar\r\n  fi\r\nfi\r\n\r\n#Adding .jar when not eding by SERVER_JARFILE\r\nif [[ ! $SERVER_JARFILE = *\\.jar ]]; then\r\n  SERVER_JARFILE=\"$SERVER_JARFILE.jar\"\r\nfi\r\n\r\n#Downloading jars\r\necho -e \"Downloading forge version ${FORGE_VERSION}\"\r\necho -e \"Download link is ${DOWNLOAD_LINK}\"\r\n\r\nif [[ ! -z \"${DOWNLOAD_LINK}\" ]]; then\r\n  if curl --output /dev/null --silent --head --fail ${DOWNLOAD_LINK}-installer.jar; then\r\n    echo -e \"installer jar download link is valid.\"\r\n  else\r\n    echo -e \"link is invalid. Exiting now\"\r\n    exit 2\r\n  fi\r\nelse\r\n  echo -e \"no download link provided. Exiting now\"\r\n  exit 3\r\nfi\r\n\r\ncurl -s -o installer.jar -sS ${DOWNLOAD_LINK}-installer.jar\r\n\r\n#Checking if downloaded jars exist\r\nif [[ ! -f ./installer.jar ]]; then\r\n  echo \"!!! Error downloading forge version ${FORGE_VERSION} !!!\"\r\n  exit\r\nfi\r\n\r\nfunction  unix_args {\r\n  echo -e \"Detected Forge 1.17 or newer version. Setting up forge unix args.\"\r\n  ln -sf libraries/net/minecraftforge/forge/*/unix_args.txt unix_args.txt\r\n}\r\n\r\n# Delete args to support downgrading/upgrading\r\nrm -rf libraries/net/minecraftforge/forge\r\nrm unix_args.txt\r\n\r\n#Installing server\r\necho -e \"Installing forge server.\\n\"\r\njava -jar installer.jar --installServer || { echo -e \"\\nInstall failed using Forge version ${FORGE_VERSION} and Minecraft version ${MINECRAFT_VERSION}.\\nShould you be using unlimited memory value of 0, make sure to increase the default install resource limits in the Wings config or specify exact allocated memory in the server Build Configuration instead of 0! \\nOtherwise, the Forge installer will not have enough memory.\"; exit 4; }\r\n\r\n# Check if we need a symlink for 1.17+ Forge JPMS args\r\nif [[ $MC_VERSION =~ ^1\\.(17|18|19|20|21|22|23) || $FORGE_VERSION =~ ^1\\.(17|18|19|20|21|22|23) ]]; then\r\n  unix_args\r\n\r\n# Check if someone has set MC to latest but overwrote it with older Forge version, otherwise we would have false positives\r\nelif [[ $MC_VERSION == \"latest\" && $FORGE_VERSION =~ ^1\\.(17|18|19|20|21|22|23) ]]; then\r\n  unix_args\r\nelse\r\n  # For versions below 1.17 that ship with jar\r\n  mv $FORGE_JAR $SERVER_JARFILE\r\nfi\r\n\r\necho -e \"Deleting installer.jar file.\\n\"\r\nrm -rf installer.jar\r\necho -e \"Installation process is completed\"','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(6,'efa493d3-f6ff-4afc-bfb0-7df5de48b500',2,'support@pterodactyl.io','Team Fortress 2','Team Fortress 2 is a team-based first-person shooter multiplayer video game developed and published by Valve Corporation. It is the sequel to the 1996 mod Team Fortress for Quake and its 1999 remake.','[\"gsl_token\",\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:source\":\"ghcr.io\\/pterodactyl\\/games:source\"}','[]',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\"\r\n}','{}','quit',NULL,'./srcds_run -game tf -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}}','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'debian:buster-slim\'\r\n\r\n##\r\n#\r\n# Variables\r\n# STEAM_USER, STEAM_PASS, STEAM_AUTH - Steam user setup. If a user has 2fa enabled it will most likely fail due to timeout. Leave blank for anon install.\r\n# WINDOWS_INSTALL - if it\'s a windows server you want to install set to 1\r\n# SRCDS_APPID - steam app id ffound here - https://developer.valvesoftware.com/wiki/Dedicated_Servers_List\r\n# EXTRA_FLAGS - when a server has extra glas for things like beta installs or updates.\r\n#\r\n##\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\nmkdir -p /mnt/server/steamapps # Fix steamcmd disk write error when this folder is missing\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +force_install_dir /mnt/server +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(7,'d854d6ad-86b3-4cad-a0ba-9642b276de4e',2,'support@pterodactyl.io','Ark: Survival Evolved','As a man or woman stranded, naked, freezing, and starving on the unforgiving shores of a mysterious island called ARK, use your skill and cunning to kill or tame and ride the plethora of leviathan dinosaurs and other primeval creatures roaming the land. Hunt, harvest resources, craft items, grow crops, research technologies, and build shelters to withstand the elements and store valuables, all while teaming up with (or preying upon) hundreds of other players to survive, dominate... and escape! — Gamepedia: ARK','[\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:source\":\"ghcr.io\\/pterodactyl\\/games:source\"}','[]',NULL,'{}','{\r\n    \"done\": \"Waiting commands for 127.0.0.1:\"\r\n}','{}','^C',NULL,'rmv() { echo  \"stopping server\"; rcon -t rcon -a 127.0.0.1:${RCON_PORT} -p ${ARK_ADMIN_PASSWORD} saveworld &&rcon -t rcon -a 127.0.0.1:${RCON_PORT} -p ${ARK_ADMIN_PASSWORD} DoExit && wait ${ARK_PID}; echo \"Server Closed\"; exit; }; trap rmv 15 2; cd ShooterGame/Binaries/Linux && ./ShooterGameServer {{SERVER_MAP}}?listen?SessionName=\"{{SESSION_NAME}}\"?ServerPassword={{ARK_PASSWORD}}?ServerAdminPassword={{ARK_ADMIN_PASSWORD}}?Port={{SERVER_PORT}}?RCONPort={{RCON_PORT}}?QueryPort={{QUERY_PORT}}?RCONEnabled=True?MaxPlayers={{MAX_PLAYERS}}?GameModIds={{MOD_ID}}$( [ \"$BATTLE_EYE\" == \"1\" ] || printf %s \' -NoBattlEye\' ) -server -automanagedmods {{ARGS}} -log & ARK_PID=$! ; until echo \"waiting for rcon connection...\"; (rcon -t rcon -a 127.0.0.1:${RCON_PORT} -p ${ARK_ADMIN_PASSWORD})<&0 & wait $!; do sleep 5; done','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n# Image to install with is \'ubuntu:18.04\'\r\napt -y update\r\napt -y --no-install-recommends --no-install-suggests install curl lib32gcc-s1 ca-certificates\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\n\r\nmkdir -p /mnt/server/Engine/Binaries/ThirdParty/SteamCMD/Linux\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/Engine/Binaries/ThirdParty/SteamCMD/Linux\r\nmkdir -p /mnt/server/steamapps # Fix steamcmd disk write error when this folder is missing\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +force_install_dir /mnt/server +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so\r\n\r\n## create a symbolic link for loading mods\r\ncd /mnt/server/Engine/Binaries/ThirdParty/SteamCMD/Linux\r\nln -sf ../../../../../Steam/steamapps steamapps\r\ncd /mnt/server','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(8,'74e7d048-536e-45d7-82a7-923320b3fd78',2,'support@pterodactyl.io','Counter-Strike: Global Offensive','Counter-Strike: Global Offensive is a multiplayer first-person shooter video game developed by Hidden Path Entertainment and Valve Corporation.','[\"gsl_token\",\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:source\":\"ghcr.io\\/pterodactyl\\/games:source\"}','[]',NULL,'{}','{\r\n    \"done\": \"Connection to Steam servers successful\"\r\n}','{}','quit',NULL,'./srcds_run -game csgo -console -port {{SERVER_PORT}} +ip 0.0.0.0 +map {{SRCDS_MAP}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}}','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\nmkdir -p /mnt/server/steamapps # Fix steamcmd disk write error when this folder is missing\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +force_install_dir /mnt/server +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(9,'58b3de7d-bdf9-47e0-b034-55264b664914',2,'support@pterodactyl.io','Garrys Mod','Garrys Mod, is a sandbox physics game created by Garry Newman, and developed by his company, Facepunch Studios.','[\"gsl_token\",\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:source\":\"ghcr.io\\/pterodactyl\\/games:source\"}','[]',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\"\r\n}','{}','quit',NULL,'./srcds_run -game garrysmod -console -port {{SERVER_PORT}} +ip 0.0.0.0 +host_workshop_collection {{WORKSHOP_ID}} +map {{SRCDS_MAP}} +gamemode {{GAMEMODE}} -strictportbind -norestart +sv_setsteamaccount {{STEAM_ACC}} +maxplayers {{MAX_PLAYERS}}  -tickrate {{TICKRATE}}  $( [ \"$LUA_REFRESH\" == \"1\" ] || printf %s \'-disableluarefresh\' )','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\nmkdir -p /mnt/server/steamapps # Fix steamcmd disk write error when this folder is missing\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +force_install_dir /mnt/server +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so\r\n\r\n# Creating needed default files for the game\r\ncd /mnt/server/garrysmod/lua/autorun/server\r\necho \'\r\n-- Docs: https://wiki.garrysmod.com/page/resource/AddWorkshop\r\n-- Place the ID of the workshop addon you want to be downloaded to people who join your server, not the collection ID\r\n-- Use https://beta.configcreator.com/create/gmod/resources.lua to easily create a list based on your collection ID\r\n\r\nresource.AddWorkshop( \"\" )\r\n\' > workshop.lua\r\n\r\ncd /mnt/server/garrysmod/cfg\r\necho \'\r\n// Please do not set RCon in here, use the startup parameters.\r\n\r\nhostname		\"New Gmod Server\"\r\nsv_password		\"\"\r\nsv_loadingurl   \"\"\r\nsv_downloadurl  \"\"\r\n\r\n// Steam Server List Settings\r\n// sv_location \"eu\"\r\nsv_region \"255\"\r\nsv_lan \"0\"\r\nsv_max_queries_sec_global \"30000\"\r\nsv_max_queries_window \"45\"\r\nsv_max_queries_sec \"5\"\r\n\r\n// Server Limits\r\nsbox_maxprops		100\r\nsbox_maxragdolls	5\r\nsbox_maxnpcs		10\r\nsbox_maxballoons	10\r\nsbox_maxeffects		10\r\nsbox_maxdynamite	10\r\nsbox_maxlamps		10\r\nsbox_maxthrusters	10\r\nsbox_maxwheels		10\r\nsbox_maxhoverballs	10\r\nsbox_maxvehicles	20\r\nsbox_maxbuttons		10\r\nsbox_maxsents		20\r\nsbox_maxemitters	5\r\nsbox_godmode		0\r\nsbox_noclip		    0\r\n\r\n// Network Settings - Please keep these set to default.\r\n\r\nsv_minrate		75000\r\nsv_maxrate		0\r\ngmod_physiterations	2\r\nnet_splitpacket_maxrate	45000\r\ndecalfrequency		12 \r\n\r\n// Execute Ban Files - Please do not edit\r\nexec banned_ip.cfg \r\nexec banned_user.cfg \r\n\r\n// Add custom lines under here\r\n\' > server.cfg','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(10,'e457bc47-ff8b-4817-98dd-a1c54397c828',2,'support@pterodactyl.io','Insurgency','Take to the streets for intense close quarters combat, where a team\'s survival depends upon securing crucial strongholds and destroying enemy supply in this multiplayer and cooperative Source Engine based experience.','[\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:source\":\"ghcr.io\\/pterodactyl\\/games:source\"}','[]',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\"\r\n}','{}','quit',NULL,'./srcds_run -game insurgency -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +force_install_dir /mnt/server +login anonymous +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} +quit\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(11,'7e29b867-756b-4311-b7b6-555e7bfe71ff',2,'support@pterodactyl.io','Custom Source Engine Game','This option allows modifying the startup arguments and other details to run a custom SRCDS based game on the panel.','[\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:source\":\"ghcr.io\\/pterodactyl\\/games:source\"}','[]',NULL,'{}','{\r\n    \"done\": \"gameserver Steam ID\"\r\n}','{}','quit',NULL,'./srcds_run -game {{SRCDS_GAME}} -console -port {{SERVER_PORT}} +map {{SRCDS_MAP}} +ip 0.0.0.0 -strictportbind -norestart','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\n##\r\n#\r\n# Variables\r\n# STEAM_USER, STEAM_PASS, STEAM_AUTH - Steam user setup. If a user has 2fa enabled it will most likely fail due to timeout. Leave blank for anon install.\r\n# WINDOWS_INSTALL - if it\'s a windows server you want to install set to 1\r\n# SRCDS_APPID - steam app id ffound here - https://developer.valvesoftware.com/wiki/Dedicated_Servers_List\r\n# EXTRA_FLAGS - when a server has extra glas for things like beta installs or updates.\r\n#\r\n##\r\n\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\nmkdir -p /mnt/server/steamapps # Fix steamcmd disk write error when this folder is missing\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +force_install_dir /mnt/server +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} $( [[ \"${WINDOWS_INSTALL}\" == \"1\" ]] && printf %s \'+@sSteamCmdForcePlatformType windows\' ) +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(12,'ef4de556-a9af-4050-bcc3-67ac76877137',3,'support@pterodactyl.io','Mumble Server','Mumble is an open source, low-latency, high quality voice chat software primarily intended for use while gaming.',NULL,'{\"Mumble\":\"ghcr.io\\/parkervcp\\/yolks:voice_mumble\"}','[]',NULL,'{\r\n    \"murmur.ini\": {\r\n        \"parser\": \"ini\",\r\n        \"find\": {\r\n            \"database\": \"/home/container/murmur.sqlite\",\r\n            \"logfile\": \"/home/container/murmur.log\",\r\n            \"port\": \"{{server.build.default.port}}\",\r\n            \"host\": \"0.0.0.0\",\r\n            \"users\": \"{{server.build.env.MAX_USERS}}\"\r\n        }\r\n    }\r\n}','{\r\n    \"done\": \"Server listening on\"\r\n}','{}','^C',NULL,'mumble-server -fg -ini murmur.ini','ghcr.io/pterodactyl/installers:alpine',NULL,'ash',1,'#!/bin/ash\r\n\r\nif [ ! -d /mnt/server/ ]; then\r\n    mkdir /mnt/server/\r\nfi\r\n\r\ncd /mnt/server\r\n\r\nFILE=/mnt/server/murmur.ini\r\nif [ -f \"$FILE\" ]; then\r\n    echo \"Config file already exists.\"\r\nelse \r\n    echo \"Downloading the config file.\"\r\n    apk add --no-cache murmur\r\n    cp /etc/murmur.ini /mnt/server/murmur.ini\r\n    apk del murmur\r\nfi\r\necho \"done\"','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(13,'f0b9009d-a422-48a4-8e04-a8945bd8c9bc',3,'support@pterodactyl.io','Teamspeak3 Server','VoIP software designed with security in mind, featuring crystal clear voice quality, endless customization options, and scalabilty up to thousands of simultaneous users.',NULL,'{\"ghcr.io\\/pterodactyl\\/yolks:debian\":\"ghcr.io\\/pterodactyl\\/yolks:debian\"}','[]',NULL,'{}','{\r\n    \"done\": \"listening on 0.0.0.0:\"\r\n}','{\r\n    \"custom\": true,\r\n    \"location\": \"logs/ts3.log\"\r\n}','^C',NULL,'./ts3server default_voice_port={{SERVER_PORT}} query_port={{QUERY_PORT}} filetransfer_ip=0.0.0.0 filetransfer_port={{FILE_TRANSFER}} query_http_port={{QUERY_HTTP}} query_ssh_port={{QUERY_SSH}} query_protocols={{QUERY_PROTOCOLS_VAR}} serveradmin_password={{SERVERADMIN_PASSWORD}} license_accepted=1','ghcr.io/pterodactyl/installers:alpine',NULL,'ash',1,'#!/bin/ash\r\n# TS3 Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\nif [ -z ${TS_VERSION} ] || [ ${TS_VERSION} == latest ]; then\r\n    TS_VERSION=$(curl -sSL https://teamspeak.com/versions/server.json | jq -r \'.linux.x86_64.version\')\r\nfi\r\n\r\ncd /mnt/server\r\n\r\necho -e \"getting files from http://files.teamspeak-services.com/releases/server/${TS_VERSION}/teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2\" \r\ncurl -L http://files.teamspeak-services.com/releases/server/${TS_VERSION}/teamspeak3-server_linux_amd64-${TS_VERSION}.tar.bz2 | tar -xvj --strip-components=1\r\ncp ./redist/libmariadb.so.2 ./','2026-02-28 07:22:23','2026-02-28 07:22:23',0),(14,'b991532b-8ef1-4382-89d6-e86dde5639a2',4,'support@pterodactyl.io','Rust','The only aim in Rust is to survive. To do this you will need to overcome struggles such as hunger, thirst and cold. Build a fire. Build a shelter. Kill animals for meat. Protect yourself from other players, and kill them for meat. Create alliances with other players and form a town. Do whatever it takes to survive.','[\"steam_disk_space\"]','{\"ghcr.io\\/pterodactyl\\/games:rust\":\"ghcr.io\\/pterodactyl\\/games:rust\"}','[]',NULL,'{}','{\r\n    \"done\": \"Server startup complete\"\r\n}','{}','quit',NULL,'./RustDedicated -batchmode +server.port {{SERVER_PORT}} +server.queryport {{QUERY_PORT}} +server.identity \"rust\" +rcon.port {{RCON_PORT}} +rcon.web true +server.hostname \\\"{{HOSTNAME}}\\\" +server.level \\\"{{LEVEL}}\\\" +server.description \\\"{{DESCRIPTION}}\\\" +server.url \\\"{{SERVER_URL}}\\\" +server.headerimage \\\"{{SERVER_IMG}}\\\" +server.logoimage \\\"{{SERVER_LOGO}}\\\" +server.maxplayers {{MAX_PLAYERS}} +rcon.password \\\"{{RCON_PASS}}\\\" +server.saveinterval {{SAVEINTERVAL}} +app.port {{APP_PORT}}  $( [ -z ${MAP_URL} ] && printf %s \"+server.worldsize \\\"{{WORLD_SIZE}}\\\" +server.seed \\\"{{WORLD_SEED}}\\\"\" || printf %s \"+server.levelurl {{MAP_URL}}\" ) {{ADDITIONAL_ARGS}}','ghcr.io/pterodactyl/installers:debian',NULL,'bash',1,'#!/bin/bash\r\n# steamcmd Base Installation Script\r\n#\r\n# Server Files: /mnt/server\r\n\r\nSRCDS_APPID=258550\r\n\r\n## just in case someone removed the defaults.\r\nif [ \"${STEAM_USER}\" == \"\" ]; then\r\n    echo -e \"steam user is not set.\\n\"\r\n    echo -e \"Using anonymous user.\\n\"\r\n    STEAM_USER=anonymous\r\n    STEAM_PASS=\"\"\r\n    STEAM_AUTH=\"\"\r\nelse\r\n    echo -e \"user set to ${STEAM_USER}\"\r\nfi\r\n\r\n## download and install steamcmd\r\ncd /tmp\r\nmkdir -p /mnt/server/steamcmd\r\ncurl -sSL -o steamcmd.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz\r\ntar -xzvf steamcmd.tar.gz -C /mnt/server/steamcmd\r\nmkdir -p /mnt/server/steamapps # Fix steamcmd disk write error when this folder is missing\r\ncd /mnt/server/steamcmd\r\n\r\n# SteamCMD fails otherwise for some reason, even running as root.\r\n# This is changed at the end of the install process anyways.\r\nchown -R root:root /mnt\r\nexport HOME=/mnt/server\r\n\r\n## install game using steamcmd\r\n./steamcmd.sh +force_install_dir /mnt/server +login ${STEAM_USER} ${STEAM_PASS} ${STEAM_AUTH} +app_update ${SRCDS_APPID} ${EXTRA_FLAGS} validate +quit ## other flags may be needed depending on install. looking at you cs 1.6\r\n\r\n## set up 32 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk32\r\ncp -v linux32/steamclient.so ../.steam/sdk32/steamclient.so\r\n\r\n## set up 64 bit libraries\r\nmkdir -p /mnt/server/.steam/sdk64\r\ncp -v linux64/steamclient.so ../.steam/sdk64/steamclient.so','2026-02-28 07:22:23','2026-02-28 07:22:23',0);
/*!40000 ALTER TABLE `eggs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_bus_events`
--

DROP TABLE IF EXISTS `event_bus_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_bus_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_key` varchar(140) NOT NULL,
  `source` varchar(80) DEFAULT NULL,
  `server_id` int(10) unsigned DEFAULT NULL,
  `actor_user_id` int(10) unsigned DEFAULT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `event_bus_events_event_key_created_at_index` (`event_key`,`created_at`),
  KEY `event_bus_events_server_id_foreign` (`server_id`),
  KEY `event_bus_events_actor_user_id_foreign` (`actor_user_id`),
  CONSTRAINT `event_bus_events_actor_user_id_foreign` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `event_bus_events_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_bus_events`
--

LOCK TABLES `event_bus_events` WRITE;
/*!40000 ALTER TABLE `event_bus_events` DISABLE KEYS */;
INSERT INTO `event_bus_events` VALUES (1,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":150,\"to\":155,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 07:25:03'),(2,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":150,\"to\":155,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 07:25:03'),(3,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:server_error_guard.triggered\",\"risk_level\":\"high\",\"ip\":\"176.65.148.161\",\"meta\":{\"path\":\"\\/__rsc\",\"method\":\"HEAD\",\"error_class\":\"FatalError\",\"count_per_minute\":8,\"threshold_per_minute\":8,\"block_minutes\":15}}','2026-02-28 07:30:43'),(4,'security.event.logged','security_event',NULL,1,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"103.134.220.49\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 07:39:55'),(5,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":155,\"to\":160,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 07:40:03'),(6,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":155,\"to\":160,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 07:40:03'),(7,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":160,\"to\":165,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 07:55:02'),(8,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":160,\"to\":165,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 07:55:02'),(9,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":165,\"to\":170,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:00:03'),(10,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":165,\"to\":170,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:00:03'),(11,'security.event.logged','security_event',NULL,1,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"52.220.157.15\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 08:01:06'),(12,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":170,\"to\":175,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:05:03'),(13,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":170,\"to\":175,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:05:03'),(14,'security.event.logged','security_event',NULL,1,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"52.220.157.15\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 08:07:13'),(15,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":175,\"to\":180,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:10:02'),(16,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":175,\"to\":180,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:10:02'),(17,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":180,\"to\":185,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:15:02'),(18,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":180,\"to\":185,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:15:02'),(19,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":185,\"to\":190,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:25:02'),(20,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":185,\"to\":190,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:25:02'),(21,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":190,\"to\":195,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:30:03'),(22,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":190,\"to\":195,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:30:03'),(23,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":195,\"to\":200,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:40:03'),(24,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":195,\"to\":200,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:40:03'),(25,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":200,\"to\":205,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:45:03'),(26,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":200,\"to\":205,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:45:03'),(27,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"104.28.163.34\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 08:49:35'),(28,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":205,\"to\":210,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:50:03'),(29,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":205,\"to\":210,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:50:03'),(30,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"104.28.163.34\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 08:51:38'),(31,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":210,\"to\":215,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 08:55:02'),(32,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":210,\"to\":215,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 08:55:02'),(33,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"104.28.163.34\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 08:58:45'),(34,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":215,\"to\":220,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 09:00:03'),(35,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":215,\"to\":220,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 09:00:03'),(36,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"104.28.163.34\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 09:03:12'),(37,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":220,\"to\":225,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 09:05:02'),(38,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":220,\"to\":225,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 09:05:02'),(39,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":225,\"to\":230,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 09:10:02'),(40,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":225,\"to\":230,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 09:10:02'),(41,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":230,\"to\":235,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 09:15:03'),(42,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":230,\"to\":235,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 09:15:03'),(43,'security.event.logged','security_event',NULL,1,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"104.28.163.34\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 09:21:04'),(44,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":235,\"to\":240,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 09:25:03'),(45,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":235,\"to\":240,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 09:25:03'),(46,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":240,\"to\":245,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 10:00:03'),(47,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":240,\"to\":245,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 10:00:03'),(48,'security.event.logged','security_event',NULL,3,'{\"event_type\":\"auth:login.success\",\"risk_level\":\"info\",\"ip\":\"104.28.163.34\",\"meta\":{\"user_agent\":\"Mozilla\\/5.0 (Linux; U; Android 15; en-US; TECNO CM5 Build\\/AP3A.240905.015.A2) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/123.0.6312.80 UCBrowser\\/15.1.0.1386 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}}','2026-02-28 10:09:51'),(49,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:hardening.blocked_request\",\"risk_level\":\"high\",\"ip\":\"104.28.163.34\",\"meta\":{\"path\":\"\\/api\\/client\\/account\\/chat\\/messages\",\"method\":\"POST\",\"reason\":\"chat_messages_invalid_media_url\"}}','2026-02-28 10:10:38'),(50,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":245,\"to\":250,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 10:15:03'),(51,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":245,\"to\":250,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 10:15:03'),(52,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":250,\"to\":255,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 10:20:03'),(53,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":250,\"to\":255,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 10:20:03'),(54,'security.event.logged','security_event',NULL,NULL,'{\"event_type\":\"security:adaptive.ddos_threshold_tuned\",\"risk_level\":\"low\",\"ip\":null,\"meta\":{\"from\":255,\"to\":260,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}}','2026-02-28 10:25:02'),(55,'adaptive.ddos.tuned','adaptive',NULL,NULL,'{\"from\":255,\"to\":260,\"bursts_30m\":0,\"direction\":\"increase\"}','2026-02-28 10:25:02');
/*!40000 ALTER TABLE `event_bus_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) DEFAULT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `exception` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'a18a86bd-0150-4f74-b546-2398bc39060a','redis','standard','{\"uuid\":\"a18a86bd-0150-4f74-b546-2398bc39060a\",\"timeout\":null,\"id\":\"uXoVKLuqG9sBR9yzH9Ioo2HhryAAlwt2\",\"backoff\":null,\"displayName\":\"Pterodactyl\\\\Notifications\\\\AccountCreated\",\"maxTries\":null,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"data\":{\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:40:\\\"Pterodactyl\\\\Notifications\\\\AccountCreated\\\":3:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"Pterodactyl\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"token\\\";N;s:2:\\\"id\\\";s:36:\\\"c508e388-ac87-47b5-bbc0-feb7097cc00e\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\",\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\"},\"attempts\":2}','2026-02-28 07:31:15','ErrorException: file_put_contents(/var/hextyl/storage/framework/views/6691142be57a7e177e2daf84234e4355.php): Failed to open stream: Permission denied in /var/hextyl/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php:204\nStack trace:\n#0 /var/hextyl/vendor/laravel/framework/src/Illuminate/Foundation/Bootstrap/HandleExceptions.php(258): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->Illuminate\\Foundation\\Bootstrap\\{closure}()\n#2 /var/hextyl/vendor/laravel/framework/src/Illuminate/Filesystem/Filesystem.php(204): file_put_contents()\n#3 /var/hextyl/vendor/laravel/framework/src/Illuminate/View/Compilers/BladeCompiler.php(196): Illuminate\\Filesystem\\Filesystem->put()\n#4 /var/hextyl/vendor/laravel/framework/src/Illuminate/View/Engines/CompilerEngine.php(67): Illuminate\\View\\Compilers\\BladeCompiler->compile()\n#5 /var/hextyl/vendor/laravel/framework/src/Illuminate/View/View.php(209): Illuminate\\View\\Engines\\CompilerEngine->get()\n#6 /var/hextyl/vendor/laravel/framework/src/Illuminate/View/View.php(192): Illuminate\\View\\View->getContents()\n#7 /var/hextyl/vendor/laravel/framework/src/Illuminate/View/View.php(161): Illuminate\\View\\View->renderContents()\n#8 /var/hextyl/vendor/laravel/framework/src/Illuminate/Mail/Markdown.php(94): Illuminate\\View\\View->render()\n#9 [internal function]: Illuminate\\Mail\\Markdown->Illuminate\\Mail\\{closure}()\n#10 /var/hextyl/vendor/laravel/framework/src/Illuminate/View/Compilers/BladeCompiler.php(1020): call_user_func()\n#11 /var/hextyl/vendor/laravel/framework/src/Illuminate/Mail/Markdown.php(76): Illuminate\\View\\Compilers\\BladeCompiler->usingEchoFormat()\n#12 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(115): Illuminate\\Mail\\Markdown->render()\n#13 /var/hextyl/vendor/laravel/framework/src/Illuminate/Collections/helpers.php(236): Illuminate\\Notifications\\Channels\\MailChannel->Illuminate\\Notifications\\Channels\\{closure}()\n#14 /var/hextyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(441): value()\n#15 /var/hextyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(420): Illuminate\\Mail\\Mailer->renderView()\n#16 /var/hextyl/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(313): Illuminate\\Mail\\Mailer->addContent()\n#17 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/Channels/MailChannel.php(67): Illuminate\\Mail\\Mailer->send()\n#18 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(148): Illuminate\\Notifications\\Channels\\MailChannel->send()\n#19 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(106): Illuminate\\Notifications\\NotificationSender->sendToNotifiable()\n#20 /var/hextyl/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#21 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/NotificationSender.php(101): Illuminate\\Notifications\\NotificationSender->withLocale()\n#22 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow()\n#23 /var/hextyl/vendor/laravel/framework/src/Illuminate/Notifications/SendQueuedNotifications.php(119): Illuminate\\Notifications\\ChannelManager->sendNow()\n#24 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle()\n#25 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#26 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#27 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#28 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(696): Illuminate\\Container\\BoundMethod::call()\n#29 /var/hextyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(126): Illuminate\\Container\\Container->call()\n#30 /var/hextyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(170): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#31 /var/hextyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#32 /var/hextyl/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then()\n#33 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(126): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#34 /var/hextyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(170): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#35 /var/hextyl/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then()\n#37 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#38 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#39 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#40 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(392): Illuminate\\Queue\\Worker->process()\n#41 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(178): Illuminate\\Queue\\Worker->runJob()\n#42 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon()\n#43 /var/hextyl/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#44 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#45 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#46 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#47 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#48 /var/hextyl/vendor/laravel/framework/src/Illuminate/Container/Container.php(696): Illuminate\\Container\\BoundMethod::call()\n#49 /var/hextyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(213): Illuminate\\Container\\Container->call()\n#50 /var/hextyl/vendor/symfony/console/Command/Command.php(335): Illuminate\\Console\\Command->execute()\n#51 /var/hextyl/vendor/laravel/framework/src/Illuminate/Console/Command.php(182): Symfony\\Component\\Console\\Command\\Command->run()\n#52 /var/hextyl/vendor/symfony/console/Application.php(1103): Illuminate\\Console\\Command->run()\n#53 /var/hextyl/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#54 /var/hextyl/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#55 /var/hextyl/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run()\n#56 /var/hextyl/artisan(41): Illuminate\\Foundation\\Console\\Kernel->handle()\n#57 {main}');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ide_sessions`
--

DROP TABLE IF EXISTS `ide_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ide_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `launch_url` varchar(1024) DEFAULT NULL,
  `request_ip` varchar(45) DEFAULT NULL,
  `terminal_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `extensions_allowed` tinyint(1) NOT NULL DEFAULT 0,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `consumed_at` timestamp NULL DEFAULT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ide_sessions_token_hash_unique` (`token_hash`),
  KEY `ide_sessions_server_id_expires_at_index` (`server_id`,`expires_at`),
  KEY `ide_sessions_user_id_expires_at_index` (`user_id`,`expires_at`),
  CONSTRAINT `ide_sessions_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ide_sessions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ide_sessions`
--

LOCK TABLES `ide_sessions` WRITE;
/*!40000 ALTER TABLE `ide_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ide_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illegal_files`
--

DROP TABLE IF EXISTS `illegal_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `illegal_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_hash` varchar(64) DEFAULT NULL,
  `file_name` varchar(512) DEFAULT NULL,
  `file_path` text DEFAULT NULL,
  `server_uuid` varchar(36) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detection_reason` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `first_seen` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `seen_count` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_hash` (`file_hash`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illegal_files`
--

LOCK TABLES `illegal_files` WRITE;
/*!40000 ALTER TABLE `illegal_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `illegal_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short` varchar(191) NOT NULL,
  `long` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_short_unique` (`short`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'jembif','ss','2026-02-28 09:21:48','2026-02-28 09:21:48');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_01_23_195641_add_allocations_table',1),(2,'2016_01_23_195851_add_api_keys',1),(3,'2016_01_23_200044_add_api_permissions',1),(4,'2016_01_23_200159_add_downloads',1),(5,'2016_01_23_200421_create_failed_jobs_table',1),(6,'2016_01_23_200440_create_jobs_table',1),(7,'2016_01_23_200528_add_locations',1),(8,'2016_01_23_200648_add_nodes',1),(9,'2016_01_23_201433_add_password_resets',1),(10,'2016_01_23_201531_add_permissions',1),(11,'2016_01_23_201649_add_server_variables',1),(12,'2016_01_23_201748_add_servers',1),(13,'2016_01_23_202544_add_service_options',1),(14,'2016_01_23_202731_add_service_varibles',1),(15,'2016_01_23_202943_add_services',1),(16,'2016_01_23_203119_create_settings_table',1),(17,'2016_01_23_203150_add_subusers',1),(18,'2016_01_23_203159_add_users',1),(19,'2016_01_23_203947_create_sessions_table',1),(20,'2016_01_25_234418_rename_permissions_column',1),(21,'2016_02_07_172148_add_databases_tables',1),(22,'2016_02_07_181319_add_database_servers_table',1),(23,'2016_02_13_154306_add_service_option_default_startup',1),(24,'2016_02_20_155318_add_unique_service_field',1),(25,'2016_02_27_163411_add_tasks_table',1),(26,'2016_02_27_163447_add_tasks_log_table',1),(27,'2016_03_18_155649_add_nullable_field_lastrun',1),(28,'2016_08_30_212718_add_ip_alias',1),(29,'2016_08_30_213301_modify_ip_storage_method',1),(30,'2016_09_01_193520_add_suspension_for_servers',1),(31,'2016_09_01_211924_remove_active_column',1),(32,'2016_09_02_190647_add_sftp_password_storage',1),(33,'2016_09_04_171338_update_jobs_tables',1),(34,'2016_09_04_172028_update_failed_jobs_table',1),(35,'2016_09_04_182835_create_notifications_table',1),(36,'2016_09_07_163017_add_unique_identifier',1),(37,'2016_09_14_145945_allow_longer_regex_field',1),(38,'2016_09_17_194246_add_docker_image_column',1),(39,'2016_09_21_165554_update_servers_column_name',1),(40,'2016_09_29_213518_rename_double_insurgency',1),(41,'2016_10_07_152117_build_api_log_table',1),(42,'2016_10_14_164802_update_api_keys',1),(43,'2016_10_23_181719_update_misnamed_bungee',1),(44,'2016_10_23_193810_add_foreign_keys_servers',1),(45,'2016_10_23_201624_add_foreign_allocations',1),(46,'2016_10_23_202222_add_foreign_api_keys',1),(47,'2016_10_23_202703_add_foreign_api_permissions',1),(48,'2016_10_23_202953_add_foreign_database_servers',1),(49,'2016_10_23_203105_add_foreign_databases',1),(50,'2016_10_23_203335_add_foreign_nodes',1),(51,'2016_10_23_203522_add_foreign_permissions',1),(52,'2016_10_23_203857_add_foreign_server_variables',1),(53,'2016_10_23_204157_add_foreign_service_options',1),(54,'2016_10_23_204321_add_foreign_service_variables',1),(55,'2016_10_23_204454_add_foreign_subusers',1),(56,'2016_10_23_204610_add_foreign_tasks',1),(57,'2016_11_04_000949_add_ark_service_option_fixed',1),(58,'2016_11_11_220649_add_pack_support',1),(59,'2016_11_11_231731_set_service_name_unique',1),(60,'2016_11_27_142519_add_pack_column',1),(61,'2016_12_01_173018_add_configurable_upload_limit',1),(62,'2016_12_02_185206_correct_service_variables',1),(63,'2017_01_03_150436_fix_misnamed_option_tag',1),(64,'2017_01_07_154228_create_node_configuration_tokens_table',1),(65,'2017_01_12_135449_add_more_user_data',1),(66,'2017_02_02_175548_UpdateColumnNames',1),(67,'2017_02_03_140948_UpdateNodesTable',1),(68,'2017_02_03_155554_RenameColumns',1),(69,'2017_02_05_164123_AdjustColumnNames',1),(70,'2017_02_05_164516_AdjustColumnNamesForServicePacks',1),(71,'2017_02_09_174834_SetupPermissionsPivotTable',1),(72,'2017_02_10_171858_UpdateAPIKeyColumnNames',1),(73,'2017_03_03_224254_UpdateNodeConfigTokensColumns',1),(74,'2017_03_05_212803_DeleteServiceExecutableOption',1),(75,'2017_03_10_162934_AddNewServiceOptionsColumns',1),(76,'2017_03_10_173607_MigrateToNewServiceSystem',1),(77,'2017_03_11_215455_ChangeServiceVariablesValidationRules',1),(78,'2017_03_12_150648_MoveFunctionsFromFileToDatabase',1),(79,'2017_03_14_175631_RenameServicePacksToSingluarPacks',1),(80,'2017_03_14_200326_AddLockedStatusToTable',1),(81,'2017_03_16_181109_ReOrganizeDatabaseServersToDatabaseHost',1),(82,'2017_03_16_181515_CleanupDatabasesDatabase',1),(83,'2017_03_18_204953_AddForeignKeyToPacks',1),(84,'2017_03_31_221948_AddServerDescriptionColumn',1),(85,'2017_04_02_163232_DropDeletedAtColumnFromServers',1),(86,'2017_04_15_125021_UpgradeTaskSystem',1),(87,'2017_04_20_171943_AddScriptsToServiceOptions',1),(88,'2017_04_21_151432_AddServiceScriptTrackingToServers',1),(89,'2017_04_27_145300_AddCopyScriptFromColumn',1),(90,'2017_04_27_223629_AddAbilityToDefineConnectionOverSSLWithDaemonBehindProxy',1),(91,'2017_05_01_141528_DeleteDownloadTable',1),(92,'2017_05_01_141559_DeleteNodeConfigurationTable',1),(93,'2017_06_10_152951_add_external_id_to_users',1),(94,'2017_06_25_133923_ChangeForeignKeyToBeOnCascadeDelete',1),(95,'2017_07_08_152806_ChangeUserPermissionsToDeleteOnUserDeletion',1),(96,'2017_07_08_154416_SetAllocationToReferenceNullOnServerDelete',1),(97,'2017_07_08_154650_CascadeDeletionWhenAServerOrVariableIsDeleted',1),(98,'2017_07_24_194433_DeleteTaskWhenParentServerIsDeleted',1),(99,'2017_08_05_115800_CascadeNullValuesForDatabaseHostWhenNodeIsDeleted',1),(100,'2017_08_05_144104_AllowNegativeValuesForOverallocation',1),(101,'2017_08_05_174811_SetAllocationUnqiueUsingMultipleFields',1),(102,'2017_08_15_214555_CascadeDeletionWhenAParentServiceIsDeleted',1),(103,'2017_08_18_215428_RemovePackWhenParentServiceOptionIsDeleted',1),(104,'2017_09_10_225749_RenameTasksTableForStructureRefactor',1),(105,'2017_09_10_225941_CreateSchedulesTable',1),(106,'2017_09_10_230309_CreateNewTasksTableForSchedules',1),(107,'2017_09_11_002938_TransferOldTasksToNewScheduler',1),(108,'2017_09_13_211810_UpdateOldPermissionsToPointToNewScheduleSystem',1),(109,'2017_09_23_170933_CreateDaemonKeysTable',1),(110,'2017_09_23_173628_RemoveDaemonSecretFromServersTable',1),(111,'2017_09_23_185022_RemoveDaemonSecretFromSubusersTable',1),(112,'2017_10_02_202000_ChangeServicesToUseAMoreUniqueIdentifier',1),(113,'2017_10_02_202007_ChangeToABetterUniqueServiceConfiguration',1),(114,'2017_10_03_233202_CascadeDeletionWhenServiceOptionIsDeleted',1),(115,'2017_10_06_214026_ServicesToNestsConversion',1),(116,'2017_10_06_214053_ServiceOptionsToEggsConversion',1),(117,'2017_10_06_215741_ServiceVariablesToEggVariablesConversion',1),(118,'2017_10_24_222238_RemoveLegacySFTPInformation',1),(119,'2017_11_11_161922_Add2FaLastAuthorizationTimeColumn',1),(120,'2017_11_19_122708_MigratePubPrivFormatToSingleKey',1),(121,'2017_12_04_184012_DropAllocationsWhenNodeIsDeleted',1),(122,'2017_12_12_220426_MigrateSettingsTableToNewFormat',1),(123,'2018_01_01_122821_AllowNegativeValuesForServerSwap',1),(124,'2018_01_11_213943_AddApiKeyPermissionColumns',1),(125,'2018_01_13_142012_SetupTableForKeyEncryption',1),(126,'2018_01_13_145209_AddLastUsedAtColumn',1),(127,'2018_02_04_145617_AllowTextInUserExternalId',1),(128,'2018_02_10_151150_remove_unique_index_on_external_id_column',1),(129,'2018_02_17_134254_ensure_unique_allocation_id_on_servers_table',1),(130,'2018_02_24_112356_add_external_id_column_to_servers_table',1),(131,'2018_02_25_160152_remove_default_null_value_on_table',1),(132,'2018_02_25_160604_define_unique_index_on_users_external_id',1),(133,'2018_03_01_192831_add_database_and_port_limit_columns_to_servers_table',1),(134,'2018_03_15_124536_add_description_to_nodes',1),(135,'2018_05_04_123826_add_maintenance_to_nodes',1),(136,'2018_09_03_143756_allow_egg_variables_to_have_longer_values',1),(137,'2018_09_03_144005_allow_server_variables_to_have_longer_values',1),(138,'2019_03_02_142328_set_allocation_limit_default_null',1),(139,'2019_03_02_151321_fix_unique_index_to_account_for_host',1),(140,'2020_03_22_163911_merge_permissions_table_into_subusers',1),(141,'2020_03_22_164814_drop_permissions_table',1),(142,'2020_04_03_203624_add_threads_column_to_servers_table',1),(143,'2020_04_03_230614_create_backups_table',1),(144,'2020_04_04_131016_add_table_server_transfers',1),(145,'2020_04_10_141024_store_node_tokens_as_encrypted_value',1),(146,'2020_04_17_203438_allow_nullable_descriptions',1),(147,'2020_04_22_055500_add_max_connections_column',1),(148,'2020_04_26_111208_add_backup_limit_to_servers',1),(149,'2020_05_20_234655_add_mounts_table',1),(150,'2020_05_21_192756_add_mount_server_table',1),(151,'2020_07_02_213612_create_user_recovery_tokens_table',1),(152,'2020_07_09_201845_add_notes_column_for_allocations',1),(153,'2020_08_20_205533_add_backup_state_column_to_backups',1),(154,'2020_08_22_132500_update_bytes_to_unsigned_bigint',1),(155,'2020_08_23_175331_modify_checksums_column_for_backups',1),(156,'2020_09_13_110007_drop_packs_from_servers',1),(157,'2020_09_13_110021_drop_packs_from_api_key_permissions',1),(158,'2020_09_13_110047_drop_packs_table',1),(159,'2020_09_13_113503_drop_daemon_key_table',1),(160,'2020_10_10_165437_change_unique_database_name_to_account_for_server',1),(161,'2020_10_26_194904_remove_nullable_from_schedule_name_field',1),(162,'2020_11_02_201014_add_features_column_to_eggs',1),(163,'2020_12_12_102435_support_multiple_docker_images_and_updates',1),(164,'2020_12_14_013707_make_successful_nullable_in_server_transfers',1),(165,'2020_12_17_014330_add_archived_field_to_server_transfers_table',1),(166,'2020_12_24_092449_make_allocation_fields_json',1),(167,'2020_12_26_184914_add_upload_id_column_to_backups_table',1),(168,'2021_01_10_153937_add_file_denylist_to_egg_configs',1),(169,'2021_01_13_013420_add_cron_month',1),(170,'2021_01_17_102401_create_audit_logs_table',1),(171,'2021_01_17_152623_add_generic_server_status_column',1),(172,'2021_01_26_210502_update_file_denylist_to_json',1),(173,'2021_02_23_205021_add_index_for_server_and_action',1),(174,'2021_02_23_212657_make_sftp_port_unsigned_int',1),(175,'2021_03_21_104718_force_cron_month_field_to_have_value_if_missing',1),(176,'2021_05_01_092457_add_continue_on_failure_option_to_tasks',1),(177,'2021_05_01_092523_add_only_run_when_server_online_option_to_schedules',1),(178,'2021_05_03_201016_add_support_for_locking_a_backup',1),(179,'2021_07_12_013420_remove_userinteraction',1),(180,'2021_07_17_211512_create_user_ssh_keys_table',1),(181,'2021_08_03_210600_change_successful_field_to_default_to_false_on_backups_table',1),(182,'2021_08_21_175111_add_foreign_keys_to_mount_node_table',1),(183,'2021_08_21_175118_add_foreign_keys_to_mount_server_table',1),(184,'2021_08_21_180921_add_foreign_keys_to_egg_mount_table',1),(185,'2022_01_25_030847_drop_google_analytics',1),(186,'2022_05_07_165334_migrate_egg_images_array_to_new_format',1),(187,'2022_05_28_135717_create_activity_logs_table',1),(188,'2022_05_29_140349_create_activity_log_actors_table',1),(189,'2022_06_18_112822_track_api_key_usage_for_activity_events',1),(190,'2022_08_16_214400_add_force_outgoing_ip_column_to_eggs_table',1),(191,'2022_08_16_230204_add_installed_at_column_to_servers_table',1),(192,'2022_12_12_213937_update_mail_settings_to_new_format',1),(193,'2023_01_24_210051_add_uuid_column_to_failed_jobs_table',1),(194,'2023_02_23_191004_add_expires_at_column_to_api_keys_table',1),(195,'2024_07_13_091852_clear_unused_allocation_notes',2),(196,'2024_07_14_000001_create_roles_table',2),(197,'2024_07_14_000002_create_role_scopes_table',2),(198,'2024_07_14_000003_add_system_root_to_users_table',2),(199,'2024_07_14_000004_add_visibility_to_servers_table',2),(200,'2024_07_14_000005_add_user_creation_scopes',2),(201,'2024_07_14_000006_add_hash_to_activity_logs',2),(202,'2024_07_14_000007_create_system_settings_table',2),(203,'2024_07_14_000008_add_suspended_to_users_table',2),(204,'2026_02_19_000001_create_server_reputations_table',2),(205,'2026_02_19_000002_create_server_secrets_table',2),(206,'2026_02_19_000003_create_security_intelligence_tables',2),(207,'2026_02_19_000004_create_chat_tables',2),(208,'2026_02_20_000001_create_ide_sessions_table',2),(209,'2026_02_20_000002_add_avatar_and_template_to_users_table',2),(210,'2026_02_20_000002_create_adaptive_and_ecosystem_tables',2),(211,'2026_02_25_000010_add_tester_role',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mount_node`
--

DROP TABLE IF EXISTS `mount_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mount_node` (
  `node_id` int(10) unsigned NOT NULL,
  `mount_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `mount_node_node_id_mount_id_unique` (`node_id`,`mount_id`),
  KEY `mount_node_mount_id_foreign` (`mount_id`),
  CONSTRAINT `mount_node_mount_id_foreign` FOREIGN KEY (`mount_id`) REFERENCES `mounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mount_node_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mount_node`
--

LOCK TABLES `mount_node` WRITE;
/*!40000 ALTER TABLE `mount_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `mount_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mount_server`
--

DROP TABLE IF EXISTS `mount_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mount_server` (
  `server_id` int(10) unsigned NOT NULL,
  `mount_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `mount_server_server_id_mount_id_unique` (`server_id`,`mount_id`),
  KEY `mount_server_mount_id_foreign` (`mount_id`),
  CONSTRAINT `mount_server_mount_id_foreign` FOREIGN KEY (`mount_id`) REFERENCES `mounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mount_server_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mount_server`
--

LOCK TABLES `mount_server` WRITE;
/*!40000 ALTER TABLE `mount_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `mount_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mounts`
--

DROP TABLE IF EXISTS `mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `target` varchar(191) NOT NULL,
  `read_only` tinyint(3) unsigned NOT NULL,
  `user_mountable` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_id_unique` (`id`),
  UNIQUE KEY `mounts_uuid_unique` (`uuid`),
  UNIQUE KEY `mounts_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mounts`
--

LOCK TABLES `mounts` WRITE;
/*!40000 ALTER TABLE `mounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nests`
--

DROP TABLE IF EXISTS `nests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `author` char(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nests`
--

LOCK TABLES `nests` WRITE;
/*!40000 ALTER TABLE `nests` DISABLE KEYS */;
INSERT INTO `nests` VALUES (1,'7661faaa-4351-494e-b4ea-65e5580e9d3f','support@pterodactyl.io','Minecraft','Minecraft - the classic game from Mojang. With support for Vanilla MC, Spigot, and many others!','2026-02-28 07:22:23','2026-02-28 07:22:23'),(2,'34acd6e5-d827-4aad-b4a0-2cc68c074a08','support@pterodactyl.io','Source Engine','Includes support for most Source Dedicated Server games.','2026-02-28 07:22:23','2026-02-28 07:22:23'),(3,'c89ec1a0-c524-4eac-842a-55ee67ad56bd','support@pterodactyl.io','Voice Servers','Voice servers such as Mumble and Teamspeak 3.','2026-02-28 07:22:23','2026-02-28 07:22:23'),(4,'96f3e0c2-e167-42c7-9ee2-817b74de15a5','support@pterodactyl.io','Rust','Rust - A game where you must fight to survive.','2026-02-28 07:22:23','2026-02-28 07:22:23');
/*!40000 ALTER TABLE `nests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_health_scores`
--

DROP TABLE IF EXISTS `node_health_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `node_health_scores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(10) unsigned NOT NULL,
  `health_score` int(10) unsigned NOT NULL DEFAULT 100,
  `reliability_rating` int(10) unsigned NOT NULL DEFAULT 100,
  `crash_frequency` int(10) unsigned NOT NULL DEFAULT 0,
  `placement_score` int(10) unsigned NOT NULL DEFAULT 100,
  `migration_recommendation` text DEFAULT NULL,
  `last_calculated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_health_scores_node_id_unique` (`node_id`),
  CONSTRAINT `node_health_scores_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_health_scores`
--

LOCK TABLES `node_health_scores` WRITE;
/*!40000 ALTER TABLE `node_health_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_health_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `public` smallint(5) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `fqdn` varchar(191) NOT NULL,
  `scheme` varchar(191) NOT NULL DEFAULT 'https',
  `behind_proxy` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `memory` int(10) unsigned NOT NULL,
  `memory_overallocate` int(11) NOT NULL DEFAULT 0,
  `disk` int(10) unsigned NOT NULL,
  `disk_overallocate` int(11) NOT NULL DEFAULT 0,
  `upload_size` int(10) unsigned NOT NULL DEFAULT 100,
  `daemon_token_id` char(16) NOT NULL,
  `daemon_token` text NOT NULL,
  `daemonListen` smallint(5) unsigned NOT NULL DEFAULT 8080,
  `daemonSFTP` smallint(5) unsigned NOT NULL DEFAULT 2022,
  `daemonBase` varchar(191) NOT NULL DEFAULT '/home/daemon-files',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodes_uuid_unique` (`uuid`),
  UNIQUE KEY `nodes_daemon_token_id_unique` (`daemon_token_id`),
  KEY `nodes_location_id_foreign` (`location_id`),
  CONSTRAINT `nodes_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,'ea6a0ca0-8123-450a-9da2-61ef7b2a2f6b',1,'Dancokkk','yyy',1,'node.premium.gantengdann.my.id','https',0,0,77777,77777,777777,777777,100,'9Lp1zUb2wOw6HsEE','eyJpdiI6ImlLNlNrZC9ZOTRDL20zOHI0Zy9keVE9PSIsInZhbHVlIjoielpmcEdRNFdrMlp6MHRNaTBzazdvaTU0aCtoYk5LbVlNcHdVVTZZOTRnaHpUaFlVdXJsczJwRDRoeElIZWRQQWJsdERMd0twWWxNcDFEcDFNNXppRU5ELzlxaHJRZDhNRTVQamJEY0l1Szg9IiwibWFjIjoiMWRhNzM4YmZmYWU3NmIxNzZhYzg5MmVhMTM4MzBjZDljOGQxNjY5MjVmMGVjNjhjZDU5MWJiY2MwZDFlZWE4NSIsInRhZyI6IiJ9',8080,2022,'/var/lib/pterodactyl/volumes','2026-02-28 09:27:45','2026-02-28 09:27:45');
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recovery_tokens`
--

DROP TABLE IF EXISTS `recovery_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recovery_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recovery_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `recovery_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recovery_tokens`
--

LOCK TABLES `recovery_tokens` WRITE;
/*!40000 ALTER TABLE `recovery_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `recovery_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reputation_indicators`
--

DROP TABLE IF EXISTS `reputation_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reputation_indicators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `indicator_type` varchar(40) NOT NULL,
  `indicator_value` varchar(191) NOT NULL,
  `source` varchar(120) NOT NULL DEFAULT 'local',
  `confidence` int(10) unsigned NOT NULL DEFAULT 50,
  `risk_level` varchar(20) NOT NULL DEFAULT 'medium',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reputation_indicators_unique` (`indicator_type`,`indicator_value`,`source`),
  KEY `reputation_indicators_indicator_type_risk_level_index` (`indicator_type`,`risk_level`),
  KEY `reputation_indicators_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reputation_indicators`
--

LOCK TABLES `reputation_indicators` WRITE;
/*!40000 ALTER TABLE `reputation_indicators` DISABLE KEYS */;
/*!40000 ALTER TABLE `reputation_indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_snapshots`
--

DROP TABLE IF EXISTS `risk_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_snapshots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(191) NOT NULL,
  `risk_score` int(10) unsigned NOT NULL DEFAULT 0,
  `risk_mode` varchar(20) NOT NULL DEFAULT 'normal',
  `geo_country` varchar(10) DEFAULT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `risk_snapshots_identifier_unique` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_snapshots`
--

LOCK TABLES `risk_snapshots` WRITE;
/*!40000 ALTER TABLE `risk_snapshots` DISABLE KEYS */;
INSERT INTO `risk_snapshots` VALUES (1,'176.65.148.161',0,'normal','UNK','2026-02-28 07:30:43','2026-02-28 07:30:43','2026-02-28 07:30:43'),(2,'103.134.220.49',0,'normal','UNK','2026-02-28 07:39:55','2026-02-28 07:39:55','2026-02-28 07:39:55'),(3,'52.220.157.15',0,'normal','UNK','2026-02-28 08:07:13','2026-02-28 08:01:06','2026-02-28 08:07:13'),(4,'104.28.163.34',0,'normal','UNK','2026-02-28 10:10:38','2026-02-28 08:49:35','2026-02-28 10:10:38');
/*!40000 ALTER TABLE `risk_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_scopes`
--

DROP TABLE IF EXISTS `role_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_scopes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `scope` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_scopes_role_id_foreign` (`role_id`),
  CONSTRAINT `role_scopes_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_scopes`
--

LOCK TABLES `role_scopes` WRITE;
/*!40000 ALTER TABLE `role_scopes` DISABLE KEYS */;
INSERT INTO `role_scopes` VALUES (1,2,'user.create','2026-02-28 07:22:23','2026-02-28 07:22:23'),(2,2,'user.read','2026-02-28 07:22:23','2026-02-28 07:22:23'),(3,2,'user.update','2026-02-28 07:22:23','2026-02-28 07:22:23'),(4,4,'user.read','2026-02-28 07:22:23','2026-02-28 07:22:23'),(5,4,'user.create','2026-02-28 07:22:23','2026-02-28 07:22:23');
/*!40000 ALTER TABLE `role_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `is_system_role` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Root','System Root',1,'2026-02-28 07:22:23','2026-02-28 07:22:23'),(2,'Admin','Administrator',1,'2026-02-28 07:22:23','2026-02-28 07:22:23'),(3,'User','Standard User',1,'2026-02-28 07:22:23','2026-02-28 07:22:23'),(4,'Tester','Security tester role with fast account creation access.',1,'2026-02-28 07:22:23','2026-02-28 07:22:23');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `cron_day_of_week` varchar(191) NOT NULL,
  `cron_month` varchar(191) NOT NULL,
  `cron_day_of_month` varchar(191) NOT NULL,
  `cron_hour` varchar(191) NOT NULL,
  `cron_minute` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_processing` tinyint(1) NOT NULL,
  `only_when_online` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `last_run_at` timestamp NULL DEFAULT NULL,
  `next_run_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedules_server_id_foreign` (`server_id`),
  CONSTRAINT `schedules_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_vault_versions`
--

DROP TABLE IF EXISTS `secret_vault_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `secret_vault_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `secret_key` varchar(191) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `encrypted_value` text NOT NULL,
  `rotates_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `access_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_accessed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `svv_server_key_version_unique` (`server_id`,`secret_key`,`version`),
  KEY `secret_vault_versions_server_id_secret_key_index` (`server_id`,`secret_key`),
  KEY `secret_vault_versions_created_by_foreign` (`created_by`),
  CONSTRAINT `secret_vault_versions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `secret_vault_versions_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_vault_versions`
--

LOCK TABLES `secret_vault_versions` WRITE;
/*!40000 ALTER TABLE `secret_vault_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret_vault_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_events`
--

DROP TABLE IF EXISTS `security_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `actor_user_id` int(10) unsigned DEFAULT NULL,
  `server_id` int(10) unsigned DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `event_type` varchar(120) NOT NULL,
  `risk_level` varchar(20) NOT NULL DEFAULT 'info',
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `security_events_event_type_created_at_index` (`event_type`,`created_at`),
  KEY `security_events_ip_created_at_index` (`ip`,`created_at`),
  KEY `security_events_actor_user_id_foreign` (`actor_user_id`),
  KEY `security_events_server_id_foreign` (`server_id`),
  CONSTRAINT `security_events_actor_user_id_foreign` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `security_events_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_events`
--

LOCK TABLES `security_events` WRITE;
/*!40000 ALTER TABLE `security_events` DISABLE KEYS */;
INSERT INTO `security_events` VALUES (1,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":150,\"to\":155,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 07:25:03'),(2,NULL,NULL,'176.65.148.161','security:server_error_guard.triggered','high','{\"path\":\"\\/__rsc\",\"method\":\"HEAD\",\"error_class\":\"FatalError\",\"count_per_minute\":8,\"threshold_per_minute\":8,\"block_minutes\":15}','2026-02-28 07:30:43'),(3,1,NULL,'103.134.220.49','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 07:39:55'),(4,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":155,\"to\":160,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 07:40:03'),(5,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":160,\"to\":165,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 07:55:02'),(6,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":165,\"to\":170,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:00:03'),(7,1,NULL,'52.220.157.15','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 08:01:06'),(8,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":170,\"to\":175,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:05:03'),(9,1,NULL,'52.220.157.15','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 08:07:13'),(10,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":175,\"to\":180,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:10:02'),(11,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":180,\"to\":185,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:15:02'),(12,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":185,\"to\":190,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:25:02'),(13,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":190,\"to\":195,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:30:03'),(14,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":195,\"to\":200,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:40:03'),(15,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":200,\"to\":205,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:45:03'),(16,NULL,NULL,'104.28.163.34','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 08:49:35'),(17,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":205,\"to\":210,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:50:03'),(18,NULL,NULL,'104.28.163.34','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 08:51:38'),(19,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":210,\"to\":215,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 08:55:02'),(20,NULL,NULL,'104.28.163.34','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 08:58:45'),(21,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":215,\"to\":220,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 09:00:03'),(22,NULL,NULL,'104.28.163.34','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 09:03:12'),(23,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":220,\"to\":225,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 09:05:02'),(24,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":225,\"to\":230,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 09:10:02'),(25,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":230,\"to\":235,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 09:15:03'),(26,1,NULL,'104.28.163.34','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; Android 10; K) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/145.0.0.0 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 09:21:04'),(27,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":235,\"to\":240,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 09:25:03'),(28,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":240,\"to\":245,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 10:00:03'),(29,3,NULL,'104.28.163.34','auth:login.success','info','{\"user_agent\":\"Mozilla\\/5.0 (Linux; U; Android 15; en-US; TECNO CM5 Build\\/AP3A.240905.015.A2) AppleWebKit\\/537.36 (KHTML, like Gecko) Version\\/4.0 Chrome\\/123.0.6312.80 UCBrowser\\/15.1.0.1386 Mobile Safari\\/537.36\",\"geo_country\":\"UNK\"}','2026-02-28 10:09:51'),(30,NULL,NULL,'104.28.163.34','security:hardening.blocked_request','high','{\"path\":\"\\/api\\/client\\/account\\/chat\\/messages\",\"method\":\"POST\",\"reason\":\"chat_messages_invalid_media_url\"}','2026-02-28 10:10:38'),(31,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":245,\"to\":250,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 10:15:03'),(32,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":250,\"to\":255,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 10:20:03'),(33,NULL,NULL,NULL,'security:adaptive.ddos_threshold_tuned','low','{\"from\":255,\"to\":260,\"bursts_30m\":0,\"direction\":\"increase\",\"cooldown_minutes\":30}','2026-02-28 10:25:02');
/*!40000 ALTER TABLE `security_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_health_scores`
--

DROP TABLE IF EXISTS `server_health_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_health_scores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `stability_index` int(10) unsigned NOT NULL DEFAULT 100,
  `crash_penalty` int(10) unsigned NOT NULL DEFAULT 0,
  `restart_penalty` int(10) unsigned NOT NULL DEFAULT 0,
  `snapshot_penalty` int(10) unsigned NOT NULL DEFAULT 0,
  `last_reason` varchar(255) DEFAULT NULL,
  `last_calculated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_health_scores_server_id_unique` (`server_id`),
  CONSTRAINT `server_health_scores_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_health_scores`
--

LOCK TABLES `server_health_scores` WRITE;
/*!40000 ALTER TABLE `server_health_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_health_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_reputations`
--

DROP TABLE IF EXISTS `server_reputations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_reputations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `stability_score` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `uptime_score` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `abuse_score` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `trust_score` tinyint(3) unsigned NOT NULL DEFAULT 50,
  `last_calculated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_reputations_server_id_unique` (`server_id`),
  KEY `server_reputations_trust_score_index` (`trust_score`),
  CONSTRAINT `server_reputations_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_reputations`
--

LOCK TABLES `server_reputations` WRITE;
/*!40000 ALTER TABLE `server_reputations` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_reputations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_secrets`
--

DROP TABLE IF EXISTS `server_secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_secrets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `secret_key` varchar(191) NOT NULL,
  `encrypted_value` longtext NOT NULL,
  `last_accessed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_secrets_server_id_secret_key_unique` (`server_id`,`secret_key`),
  KEY `server_secrets_server_id_updated_at_index` (`server_id`,`updated_at`),
  CONSTRAINT `server_secrets_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_secrets`
--

LOCK TABLES `server_secrets` WRITE;
/*!40000 ALTER TABLE `server_secrets` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_secrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_transfers`
--

DROP TABLE IF EXISTS `server_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned NOT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `old_node` int(10) unsigned NOT NULL,
  `new_node` int(10) unsigned NOT NULL,
  `old_allocation` int(10) unsigned NOT NULL,
  `new_allocation` int(10) unsigned NOT NULL,
  `old_additional_allocations` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `new_additional_allocations` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_transfers_server_id_foreign` (`server_id`),
  CONSTRAINT `server_transfers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_transfers`
--

LOCK TABLES `server_transfers` WRITE;
/*!40000 ALTER TABLE `server_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_variables`
--

DROP TABLE IF EXISTS `server_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` int(10) unsigned DEFAULT NULL,
  `variable_id` int(10) unsigned NOT NULL,
  `variable_value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_variables_server_id_foreign` (`server_id`),
  KEY `server_variables_variable_id_foreign` (`variable_id`),
  CONSTRAINT `server_variables_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `server_variables_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `egg_variables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_variables`
--

LOCK TABLES `server_variables` WRITE;
/*!40000 ALTER TABLE `server_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(191) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `uuidShort` char(8) NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `visibility` enum('private','public') NOT NULL DEFAULT 'private',
  `description` text NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `skip_scripts` tinyint(1) NOT NULL DEFAULT 0,
  `owner_id` int(10) unsigned NOT NULL,
  `memory` int(10) unsigned NOT NULL,
  `swap` int(11) NOT NULL,
  `disk` int(10) unsigned NOT NULL,
  `io` int(10) unsigned NOT NULL,
  `cpu` int(10) unsigned NOT NULL,
  `threads` varchar(191) DEFAULT NULL,
  `oom_disabled` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `allocation_id` int(10) unsigned NOT NULL,
  `nest_id` int(10) unsigned NOT NULL,
  `egg_id` int(10) unsigned NOT NULL,
  `startup` text NOT NULL,
  `image` varchar(191) NOT NULL,
  `allocation_limit` int(10) unsigned DEFAULT NULL,
  `database_limit` int(10) unsigned DEFAULT 0,
  `backup_limit` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `installed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servers_uuid_unique` (`uuid`),
  UNIQUE KEY `servers_uuidshort_unique` (`uuidShort`),
  UNIQUE KEY `servers_allocation_id_unique` (`allocation_id`),
  UNIQUE KEY `servers_external_id_unique` (`external_id`),
  KEY `servers_node_id_foreign` (`node_id`),
  KEY `servers_owner_id_foreign` (`owner_id`),
  KEY `servers_nest_id_foreign` (`nest_id`),
  KEY `servers_egg_id_foreign` (`egg_id`),
  CONSTRAINT `servers_allocation_id_foreign` FOREIGN KEY (`allocation_id`) REFERENCES `allocations` (`id`),
  CONSTRAINT `servers_egg_id_foreign` FOREIGN KEY (`egg_id`) REFERENCES `eggs` (`id`),
  CONSTRAINT `servers_nest_id_foreign` FOREIGN KEY (`nest_id`) REFERENCES `nests` (`id`),
  CONSTRAINT `servers_node_id_foreign` FOREIGN KEY (`node_id`) REFERENCES `nodes` (`id`),
  CONSTRAINT `servers_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'app:telemetry:uuid','5b8f17c6-db7a-4491-a5fa-7260e27d8db2');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subusers`
--

DROP TABLE IF EXISTS `subusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subusers_user_id_foreign` (`user_id`),
  KEY `subusers_server_id_foreign` (`server_id`),
  CONSTRAINT `subusers_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subusers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subusers`
--

LOCK TABLES `subusers` WRITE;
/*!40000 ALTER TABLE `subusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'ide_connect_enabled','true','2026-02-28 07:22:23','2026-02-28 07:22:23'),(2,'ide_block_during_emergency','true','2026-02-28 07:22:23','2026-02-28 07:22:23'),(3,'ide_session_ttl_minutes','10','2026-02-28 07:22:23','2026-02-28 07:22:23'),(4,'ide_connect_url_template','https://ide.premium.gantengdann.my.id','2026-02-28 07:22:23','2026-02-28 07:22:23'),(5,'adaptive_alpha','0.2','2026-02-28 07:22:23','2026-02-28 07:22:23'),(6,'adaptive_z_threshold','2.5','2026-02-28 07:22:23','2026-02-28 07:22:23'),(7,'reputation_network_enabled','false','2026-02-28 07:22:23','2026-02-28 07:22:23'),(8,'reputation_network_allow_pull','true','2026-02-28 07:22:23','2026-02-28 07:22:23'),(9,'reputation_network_allow_push','true','2026-02-28 07:22:23','2026-02-28 07:22:23'),(10,'ddos_burst_threshold_10s','260','2026-02-28 10:25:02','2026-02-28 10:25:02');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` int(10) unsigned NOT NULL,
  `sequence_id` int(10) unsigned NOT NULL,
  `action` varchar(191) NOT NULL,
  `payload` text NOT NULL,
  `time_offset` int(10) unsigned NOT NULL,
  `is_queued` tinyint(1) NOT NULL,
  `continue_on_failure` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_schedule_id_sequence_id_index` (`schedule_id`,`sequence_id`),
  CONSTRAINT `tasks_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_log`
--

DROP TABLE IF EXISTS `tasks_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `run_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `run_status` int(10) unsigned NOT NULL,
  `response` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_log`
--

LOCK TABLES `tasks_log` WRITE;
/*!40000 ALTER TABLE `tasks_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `top_offenders`
--

DROP TABLE IF EXISTS `top_offenders`;
/*!50001 DROP VIEW IF EXISTS `top_offenders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `top_offenders` AS SELECT
 1 AS `username`,
  1 AS `email`,
  1 AS `violation_count`,
  1 AS `disk_violations`,
  1 AS `flood_violations`,
  1 AS `illegal_files`,
  1 AS `illegal_processes`,
  1 AS `last_violation`,
  1 AS `total_severity` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_blacklist`
--

DROP TABLE IF EXISTS `user_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `blacklisted_by` varchar(100) DEFAULT NULL,
  `blacklisted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_violations` int(11) DEFAULT 0,
  `last_violation` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `unique_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_blacklist`
--

LOCK TABLES `user_blacklist` WRITE;
/*!40000 ALTER TABLE `user_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_ssh_keys`
--

DROP TABLE IF EXISTS `user_ssh_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_ssh_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `fingerprint` varchar(191) NOT NULL,
  `public_key` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_ssh_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `user_ssh_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_ssh_keys`
--

LOCK TABLES `user_ssh_keys` WRITE;
/*!40000 ALTER TABLE `user_ssh_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_ssh_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_violations`
--

DROP TABLE IF EXISTS `user_violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_violations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `server_uuid` varchar(36) DEFAULT NULL,
  `server_name` varchar(255) DEFAULT NULL,
  `violation_type` enum('disk_over','file_flood','illegal_file','illegal_process','cpu_abuse','ram_abuse') NOT NULL,
  `details` text DEFAULT NULL,
  `file_name` varchar(512) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `disk_usage_gb` decimal(10,2) DEFAULT NULL,
  `file_count` int(11) DEFAULT NULL,
  `action_taken` varchar(100) DEFAULT NULL,
  `severity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_server` (`server_uuid`),
  KEY `idx_type` (`violation_type`),
  KEY `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_violations`
--

LOCK TABLES `user_violations` WRITE;
/*!40000 ALTER TABLE `user_violations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_violations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` varchar(191) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `name_first` varchar(191) DEFAULT NULL,
  `name_last` varchar(191) DEFAULT NULL,
  `password` text NOT NULL,
  `remember_token` varchar(191) DEFAULT NULL,
  `language` char(5) NOT NULL DEFAULT 'en',
  `root_admin` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `is_system_root` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned DEFAULT NULL,
  `use_totp` tinyint(3) unsigned NOT NULL,
  `totp_secret` text DEFAULT NULL,
  `totp_authenticated_at` timestamp NULL DEFAULT NULL,
  `gravatar` tinyint(1) NOT NULL DEFAULT 1,
  `avatar_path` varchar(191) DEFAULT NULL,
  `dashboard_template` varchar(32) NOT NULL DEFAULT 'midnight',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uuid_unique` (`uuid`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_external_id_index` (`external_id`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'f05875ac-539b-475e-8796-b7a1077a31ec','kontoll','kontolll@gmail.com','kontol','kintol','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1OcKnHDhwmSZxUya2LnG6lQRQwCKsczoGDlmoGYrZZ0t4m3Kjyt9v49edJr6','en',1,0,0,NULL,0,NULL,NULL,1,NULL,'midnight','2026-02-28 07:31:01','2026-02-28 07:31:01'),(3,NULL,'81d1144f-5552-466d-ba9f-d8e9e6e86912','testbacot','test-kitvweaj@tester.local','Security','Tester','$2y$10$.SOoKPGmhOimrz.JRNDMBuUbMFq4eprKpWo1TN8Wi0liXl/1tR5CC','6c1p9VZSR20htgLblUmQanbCAYZVvuSsLyYl3CssiHX9QpCOho9alc7ltXc8','en',0,0,0,3,0,NULL,NULL,1,NULL,'midnight','2026-02-28 10:08:35','2026-02-28 10:09:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_subscriptions`
--

DROP TABLE IF EXISTS `webhook_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `event_pattern` varchar(140) NOT NULL DEFAULT '*',
  `secret` varchar(191) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) unsigned DEFAULT NULL,
  `delivery_success_count` int(10) unsigned NOT NULL DEFAULT 0,
  `delivery_failed_count` int(10) unsigned NOT NULL DEFAULT 0,
  `last_delivery_at` timestamp NULL DEFAULT NULL,
  `last_delivery_status` varchar(32) DEFAULT NULL,
  `last_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhook_subscriptions_enabled_event_pattern_index` (`enabled`,`event_pattern`),
  KEY `webhook_subscriptions_created_by_foreign` (`created_by`),
  CONSTRAINT `webhook_subscriptions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_subscriptions`
--

LOCK TABLES `webhook_subscriptions` WRITE;
/*!40000 ALTER TABLE `webhook_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `top_offenders`
--

/*!50001 DROP VIEW IF EXISTS `top_offenders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_offenders` AS select `u`.`username` AS `username`,`u`.`email` AS `email`,count(`v`.`id`) AS `violation_count`,sum(case when `v`.`violation_type` = 'disk_over' then 1 else 0 end) AS `disk_violations`,sum(case when `v`.`violation_type` = 'file_flood' then 1 else 0 end) AS `flood_violations`,sum(case when `v`.`violation_type` = 'illegal_file' then 1 else 0 end) AS `illegal_files`,sum(case when `v`.`violation_type` = 'illegal_process' then 1 else 0 end) AS `illegal_processes`,max(`v`.`created_at`) AS `last_violation`,sum(`v`.`severity`) AS `total_severity` from (`users` `u` left join `user_violations` `v` on(`u`.`id` = `v`.`user_id`)) group by `u`.`id` order by sum(`v`.`severity`) desc */;
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

-- Dump completed on 2026-02-28 11:01:30
