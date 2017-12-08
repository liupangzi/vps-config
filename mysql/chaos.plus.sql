-- MySQL dump 10.13  Distrib 5.7.19-17, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: zhangdachui_chaos_plus
-- ------------------------------------------------------
-- Server version	5.7.19-17-log

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Current Database: `zhangdachui_chaos_plus`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zhangdachui_chaos_plus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `zhangdachui_chaos_plus`;

--
-- Table structure for table `t_commentmeta`
--

DROP TABLE IF EXISTS `t_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_commentmeta`
--

LOCK TABLES `t_commentmeta` WRITE;
/*!40000 ALTER TABLE `t_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comments`
--

DROP TABLE IF EXISTS `t_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comments`
--

LOCK TABLES `t_comments` WRITE;
/*!40000 ALTER TABLE `t_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cpd_counter`
--

DROP TABLE IF EXISTS `t_cpd_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_cpd_counter` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` int(10) unsigned NOT NULL,
  `client` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date` date NOT NULL,
  `page` mediumint(9) NOT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `referer` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_page` (`page`),
  KEY `idx_dateip` (`date`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cpd_counter`
--

LOCK TABLES `t_cpd_counter` WRITE;
/*!40000 ALTER TABLE `t_cpd_counter` DISABLE KEYS */;
INSERT INTO `t_cpd_counter` VALUES (1,883891247,'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0','2017-12-07',2,'hk',''),(2,1006730215,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','2017-12-07',0,'cn',''),(3,3060086170,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','2017-12-07',0,'cn',''),(4,658545130,'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Mobile Safari/537.36','2017-12-07',0,'cn',''),(5,1784402673,'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Mobile Safari/537.36','2017-12-07',0,'cn',''),(6,3740560924,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','2017-12-07',0,'cn',''),(7,1883395069,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','2017-12-07',0,'cn',''),(8,3086009492,'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36','2017-12-07',0,'cn',''),(9,1883401058,'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','2017-12-07',0,'cn',''),(10,3723446817,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-12-07',0,'cn',''),(11,1007519786,'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30','2017-12-08',0,'cn',''),(12,2084702388,'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30','2017-12-08',0,'cn',''),(13,1883390959,'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Mobile Safari/537.36','2017-12-08',0,'cn',''),(14,2073964873,'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Mobile Safari/537.36','2017-12-08',0,'cn',''),(15,2095132209,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','2017-12-08',0,'cn',''),(16,3708619884,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','2017-12-08',0,'cn',''),(17,2079677652,'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','2017-12-08',0,'cn',''),(18,2073101656,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-12-08',0,'cn',''),(19,1781336254,'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30','2017-12-08',0,'cn',''),(20,606210822,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-12-08',0,'cn',''),(21,1021045830,'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30','2017-12-08',0,'cn',''),(22,2073101505,'Mozilla#/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(23,1895835498,'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30','2017-12-08',0,'cn',''),(24,1953575402,'Mozilla#/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(25,1020824594,'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30','2017-12-08',0,'cn',''),(26,1781334501,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-12-08',0,'cn',''),(27,3708726422,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(28,2079678374,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(29,2876653670,'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(30,1851230396,'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1','2017-12-08',0,'cn',''),(31,1784402810,'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1','2017-12-08',0,'cn',''),(32,1784402804,'Wget/1.17.1 (linux-gnu)','2017-12-08',0,'cn',''),(33,1784402307,'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1','2017-12-08',0,'cn',''),(34,604354852,'Wget/1.17.1 (linux-gnu)','2017-12-08',0,'cn',''),(35,1912038260,'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1','2017-12-08',0,'cn',''),(36,2071236612,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(37,1872925973,'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','2017-12-08',0,'cn',''),(38,1928419231,'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','2017-12-08',0,'cn',''),(39,3069521323,'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','2017-12-08',0,'cn',''),(40,3060670103,'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1','2017-12-08',0,'cn',''),(41,1026832341,'Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1','2017-12-08',0,'cn',''),(42,2566928853,'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','2017-12-08',0,'cn',''),(43,1904240911,'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0','2017-12-08',0,'cn',''),(44,3701678440,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','2017-12-08',0,'cn',''),(45,2075329683,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','2017-12-08',0,'cn','');
/*!40000 ALTER TABLE `t_cpd_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_links`
--

DROP TABLE IF EXISTS `t_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_links`
--

LOCK TABLES `t_links` WRITE;
/*!40000 ALTER TABLE `t_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_options`
--

DROP TABLE IF EXISTS `t_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_options`
--

LOCK TABLES `t_options` WRITE;
/*!40000 ALTER TABLE `t_options` DISABLE KEYS */;
INSERT INTO `t_options` VALUES (1,'siteurl','https://zhangdachui.chaos.plus','yes'),(2,'home','https://zhangdachui.chaos.plus','yes'),(3,'blogname','人间动物园','yes'),(4,'blogdescription','','yes'),(5,'users_can_register','0','yes'),(6,'admin_email','thesedays@126.com','yes'),(7,'start_of_week','1','yes'),(8,'use_balanceTags','0','yes'),(9,'use_smilies','1','yes'),(10,'require_name_email','1','yes'),(11,'comments_notify','','yes'),(12,'posts_per_rss','10','yes'),(13,'rss_use_excerpt','0','yes'),(14,'mailserver_url','mail.example.com','yes'),(15,'mailserver_login','login@example.com','yes'),(16,'mailserver_pass','password','yes'),(17,'mailserver_port','110','yes'),(18,'default_category','2','yes'),(19,'default_comment_status','open','yes'),(20,'default_ping_status','open','yes'),(21,'default_pingback_flag','1','yes'),(22,'posts_per_page','10','yes'),(23,'date_format','Y年n月j日','yes'),(24,'time_format','H:i','yes'),(25,'links_updated_date_format','Y年n月j日ag:i','yes'),(26,'comment_moderation','','yes'),(27,'moderation_notify','','yes'),(28,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),(29,'rewrite_rules','a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),(30,'hack_file','0','yes'),(31,'blog_charset','UTF-8','yes'),(32,'moderation_keys','','no'),(33,'active_plugins','a:7:{i:0;s:19:\"akismet/akismet.php\";i:1;s:25:\"count-per-day/counter.php\";i:2;s:15:\"kirki/kirki.php\";i:3;s:37:\"uix-page-builder/uix-page-builder.php\";i:4;s:33:\"uix-shortcodes/uix-shortcodes.php\";i:5;s:31:\"uix-slideshow/uix-slideshow.php\";i:6;s:27:\"wp-optimize/wp-optimize.php\";}','yes'),(34,'category_base','','yes'),(35,'ping_sites','http://rpc.pingomatic.com/','yes'),(36,'comment_max_links','2','yes'),(37,'gmt_offset','','yes'),(38,'default_email_category','1','yes'),(39,'recently_edited','','no'),(40,'template','shadower','yes'),(41,'stylesheet','shadower','yes'),(42,'comment_whitelist','','yes'),(43,'blacklist_keys','','no'),(44,'comment_registration','','yes'),(45,'html_type','text/html','yes'),(46,'use_trackback','0','yes'),(47,'default_role','subscriber','yes'),(48,'db_version','38590','yes'),(49,'uploads_use_yearmonth_folders','1','yes'),(50,'upload_path','','yes'),(51,'blog_public','1','yes'),(52,'default_link_category','0','yes'),(53,'show_on_front','posts','yes'),(54,'tag_base','','yes'),(55,'show_avatars','1','yes'),(56,'avatar_rating','G','yes'),(57,'upload_url_path','','yes'),(58,'thumbnail_size_w','150','yes'),(59,'thumbnail_size_h','150','yes'),(60,'thumbnail_crop','','yes'),(61,'medium_size_w','300','yes'),(62,'medium_size_h','300','yes'),(63,'avatar_default','identicon','yes'),(64,'large_size_w','1024','yes'),(65,'large_size_h','1024','yes'),(66,'image_default_link_type','','yes'),(67,'image_default_size','','yes'),(68,'image_default_align','','yes'),(69,'close_comments_for_old_posts','','yes'),(70,'close_comments_days_old','14','yes'),(71,'thread_comments','1','yes'),(72,'thread_comments_depth','10','yes'),(73,'page_comments','1','yes'),(74,'comments_per_page','50','yes'),(75,'default_comments_page','newest','yes'),(76,'comment_order','desc','yes'),(77,'sticky_posts','a:0:{}','yes'),(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:6:\"分类\";s:5:\"count\";i:1;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(79,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),(81,'uninstall_plugins','a:1:{s:11:\"counter.php\";s:23:\"count_per_day_uninstall\";}','no'),(82,'timezone_string','Asia/Hong_Kong','yes'),(83,'page_for_posts','0','yes'),(84,'page_on_front','0','yes'),(85,'default_post_format','aside','yes'),(86,'link_manager_enabled','0','yes'),(87,'finished_splitting_shared_terms','1','yes'),(88,'site_icon','0','yes'),(89,'medium_large_size_w','768','yes'),(90,'medium_large_size_h','0','yes'),(91,'initial_db_version','38590','yes'),(92,'t_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),(93,'fresh_site','0','yes'),(94,'WPLANG','zh_CN','yes'),(95,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(96,'widget_recent-posts','a:2:{i:2;a:3:{s:5:\"title\";s:12:\"近期文章\";s:6:\"number\";i:10;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}','yes'),(97,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),(98,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),(99,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),(100,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:20:\"homepage-advertising\";a:0:{}s:13:\"array_version\";i:3;}','yes'),(101,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(102,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(103,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(104,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(105,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(106,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(107,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(108,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(109,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(110,'cron','a:4:{i:1512761172;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1512804386;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1512805090;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),(111,'theme_mods_twentyseventeen','a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1512632398;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}','yes'),(124,'_site_transient_timeout_browser_315117425c117d80648b71a24b9b1815','1513236387','no'),(125,'_site_transient_browser_315117425c117d80648b71a24b9b1815','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"62.0.3202.94\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(139,'can_compress_scripts','1','no'),(152,'new_admin_email','thesedays@126.com','yes'),(162,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/zh_CN/wordpress-4.9.1.zip\";s:6:\"locale\";s:5:\"zh_CN\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/zh_CN/wordpress-4.9.1.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.1\";s:7:\"version\";s:5:\"4.9.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.1\";s:7:\"version\";s:5:\"4.9.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1512725527;s:15:\"version_checked\";s:5:\"4.9.1\";s:12:\"translations\";a:0:{}}','no'),(165,'wp-optimize-schedule','false','yes'),(166,'wp-optimize-last-optimized','Never','yes'),(167,'wp-optimize-schedule-type','wpo_weekly','yes'),(168,'wp-optimize-retention-enabled','false','yes'),(169,'wp-optimize-retention-period','2','yes'),(170,'wp-optimize-enable-admin-menu','false','yes'),(171,'wp-optimize-total-cleaned','0','yes'),(172,'wp-optimize-auto','a:6:{s:9:\"revisions\";s:4:\"true\";s:10:\"unapproved\";s:5:\"false\";s:8:\"optimize\";s:5:\"false\";s:9:\"transient\";s:5:\"false\";s:6:\"drafts\";s:4:\"true\";s:5:\"spams\";s:4:\"true\";}','yes'),(173,'wp-optimize-settings','a:6:{s:14:\"user-revisions\";s:4:\"true\";s:15:\"user-unapproved\";s:4:\"true\";s:13:\"user-optimize\";s:5:\"false\";s:11:\"user-drafts\";s:4:\"true\";s:10:\"user-spams\";s:4:\"true\";s:13:\"last_saved_in\";s:5:\"2.1.1\";}','yes'),(174,'recently_activated','a:0:{}','yes'),(177,'wp-optimize-enable-auto-backup','false','yes'),(181,'category_children','a:0:{}','yes'),(184,'current_theme','Shadower','yes'),(185,'theme_mods_modernize','a:5:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"header_textcolor\";s:5:\"blank\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1512633338;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}','yes'),(186,'theme_switched','','yes'),(196,'widget_akismet_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(197,'count_per_day','a:31:{s:7:\"version\";s:5:\"3.5.7\";s:10:\"onlinetime\";i:300;s:4:\"user\";i:0;s:10:\"user_level\";i:0;s:9:\"autocount\";i:1;s:4:\"bots\";s:143:\"bot\nspider\nsearch\ncrawler\nask.com\nvalidator\nsnoopy\nsuchen.de\nsuchbaer.de\nshelob\nsemager\nxenu\nsuch_de\nia_archiver\nMicrosoft URL Control\nnetluchs\";s:15:\"dashboard_posts\";i:20;s:20:\"dashboard_last_posts\";i:20;s:19:\"dashboard_last_days\";i:7;s:13:\"show_in_lists\";i:1;s:10:\"chart_days\";i:60;s:12:\"chart_height\";i:200;s:9:\"countries\";i:20;s:17:\"exclude_countries\";s:0:\"\";s:9:\"startdate\";s:0:\"\";s:10:\"startcount\";s:0:\"\";s:10:\"startreads\";s:0:\"\";s:5:\"anoip\";i:0;s:12:\"massbotlimit\";i:25;s:7:\"clients\";s:42:\"Firefox, Edge, MSIE, Chrome, Safari, Opera\";s:4:\"ajax\";i:0;s:5:\"debug\";i:0;s:8:\"referers\";i:1;s:12:\"referers_cut\";i:0;s:8:\"fieldlen\";i:150;s:8:\"localref\";i:1;s:18:\"dashboard_referers\";i:20;s:18:\"referers_last_days\";i:7;s:12:\"no_front_css\";i:0;s:9:\"whocansee\";s:13:\"publish_posts\";s:11:\"backup_part\";i:10000;}','yes'),(198,'widget_countperday_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(199,'widget_countperday_popular_posts_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(200,'wordpress_api_key','be182fa90de7','yes'),(201,'akismet_strictness','0','yes'),(202,'akismet_spam_count','0','yes'),(203,'akismet_show_user_comments_approved','1','yes'),(204,'count_per_day_online','a:0:{}','yes'),(208,'theme_mods_shadower','a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:19:\"custom_social_weibo\";s:24:\"https://weibo.com/dagudu\";}','yes'),(209,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1512725585;s:7:\"checked\";a:1:{s:8:\"shadower\";s:5:\"2.7.9\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','no'),(210,'widget_social_icons','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),(232,'_site_transient_timeout_browser_4c7d8017ddd90851512545902e2ef80a','1513257709','no'),(233,'_site_transient_browser_4c7d8017ddd90851512545902e2ef80a','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"62.0.3202.89\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),(239,'_transient_timeout_oembed_d581875ca50096acd2b9e0ab2d0f0b51','1512739652','no'),(240,'_transient_oembed_d581875ca50096acd2b9e0ab2d0f0b51','O:8:\"stdClass\":7:{s:7:\"version\";s:3:\"1.0\";s:4:\"type\";s:4:\"rich\";s:13:\"provider_name\";s:5:\"Imgur\";s:12:\"provider_url\";s:17:\"https://imgur.com\";s:5:\"width\";i:600;s:6:\"height\";i:1000;s:4:\"html\";s:211:\"<blockquote class=\"imgur-embed-pub\" lang=\"en\" data-id=\"jXIGzOP\"><a href=\"https://imgur.com/jXIGzOP\">View post on imgur.com</a></blockquote><script async src=\"//s.imgur.com/min/embed.js\" charset=\"utf-8\"></script>\";}','no'),(252,'_site_transient_timeout_theme_roots','1512727327','no'),(253,'_site_transient_theme_roots','a:1:{s:8:\"shadower\";s:7:\"/themes\";}','no'),(254,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1512725585;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:7:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.1\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.1.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:7:\"default\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";s:7:\"default\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:25:\"count-per-day/counter.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/count-per-day\";s:4:\"slug\";s:13:\"count-per-day\";s:6:\"plugin\";s:25:\"count-per-day/counter.php\";s:11:\"new_version\";s:5:\"3.5.7\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/count-per-day/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/count-per-day.3.5.7.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:65:\"https://ps.w.org/count-per-day/assets/icon-128x128.png?rev=987085\";s:2:\"2x\";s:65:\"https://ps.w.org/count-per-day/assets/icon-256x256.png?rev=987085\";s:7:\"default\";s:65:\"https://ps.w.org/count-per-day/assets/icon-256x256.png?rev=987085\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:67:\"https://ps.w.org/count-per-day/assets/banner-772x250.png?rev=517175\";s:7:\"default\";s:67:\"https://ps.w.org/count-per-day/assets/banner-772x250.png?rev=517175\";}s:11:\"banners_rtl\";a:0:{}}s:15:\"kirki/kirki.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:19:\"w.org/plugins/kirki\";s:4:\"slug\";s:5:\"kirki\";s:6:\"plugin\";s:15:\"kirki/kirki.php\";s:11:\"new_version\";s:6:\"3.0.19\";s:3:\"url\";s:36:\"https://wordpress.org/plugins/kirki/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/kirki.3.0.19.zip\";s:5:\"icons\";a:4:{s:2:\"1x\";s:58:\"https://ps.w.org/kirki/assets/icon-128x128.png?rev=1330852\";s:2:\"2x\";s:58:\"https://ps.w.org/kirki/assets/icon-256x256.png?rev=1330852\";s:3:\"svg\";s:50:\"https://ps.w.org/kirki/assets/icon.svg?rev=1330186\";s:7:\"default\";s:50:\"https://ps.w.org/kirki/assets/icon.svg?rev=1330186\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:61:\"https://ps.w.org/kirki/assets/banner-1544x500.png?rev=1330852\";s:2:\"1x\";s:60:\"https://ps.w.org/kirki/assets/banner-772x250.png?rev=1330852\";s:7:\"default\";s:61:\"https://ps.w.org/kirki/assets/banner-1544x500.png?rev=1330852\";}s:11:\"banners_rtl\";a:0:{}}s:37:\"uix-page-builder/uix-page-builder.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:30:\"w.org/plugins/uix-page-builder\";s:4:\"slug\";s:16:\"uix-page-builder\";s:6:\"plugin\";s:37:\"uix-page-builder/uix-page-builder.php\";s:11:\"new_version\";s:5:\"1.4.9\";s:3:\"url\";s:47:\"https://wordpress.org/plugins/uix-page-builder/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/uix-page-builder.1.4.9.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:69:\"https://ps.w.org/uix-page-builder/assets/icon-128x128.png?rev=1575409\";s:2:\"2x\";s:69:\"https://ps.w.org/uix-page-builder/assets/icon-256x256.png?rev=1575410\";s:7:\"default\";s:69:\"https://ps.w.org/uix-page-builder/assets/icon-256x256.png?rev=1575410\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:71:\"https://ps.w.org/uix-page-builder/assets/banner-772x250.jpg?rev=1584391\";s:7:\"default\";s:71:\"https://ps.w.org/uix-page-builder/assets/banner-772x250.jpg?rev=1584391\";}s:11:\"banners_rtl\";a:0:{}}s:33:\"uix-shortcodes/uix-shortcodes.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/uix-shortcodes\";s:4:\"slug\";s:14:\"uix-shortcodes\";s:6:\"plugin\";s:33:\"uix-shortcodes/uix-shortcodes.php\";s:11:\"new_version\";s:5:\"1.5.8\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/uix-shortcodes/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/uix-shortcodes.1.5.8.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:67:\"https://ps.w.org/uix-shortcodes/assets/icon-128x128.png?rev=1481221\";s:2:\"2x\";s:67:\"https://ps.w.org/uix-shortcodes/assets/icon-256x256.png?rev=1481222\";s:7:\"default\";s:67:\"https://ps.w.org/uix-shortcodes/assets/icon-256x256.png?rev=1481222\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:69:\"https://ps.w.org/uix-shortcodes/assets/banner-772x250.jpg?rev=1562864\";s:7:\"default\";s:69:\"https://ps.w.org/uix-shortcodes/assets/banner-772x250.jpg?rev=1562864\";}s:11:\"banners_rtl\";a:0:{}}s:31:\"uix-slideshow/uix-slideshow.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/uix-slideshow\";s:4:\"slug\";s:13:\"uix-slideshow\";s:6:\"plugin\";s:31:\"uix-slideshow/uix-slideshow.php\";s:11:\"new_version\";s:5:\"1.2.7\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/uix-slideshow/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/uix-slideshow.1.2.7.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:66:\"https://ps.w.org/uix-slideshow/assets/icon-128x128.png?rev=1494894\";s:2:\"2x\";s:66:\"https://ps.w.org/uix-slideshow/assets/icon-256x256.png?rev=1494895\";s:7:\"default\";s:66:\"https://ps.w.org/uix-slideshow/assets/icon-256x256.png?rev=1494895\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:68:\"https://ps.w.org/uix-slideshow/assets/banner-772x250.jpg?rev=1562876\";s:7:\"default\";s:68:\"https://ps.w.org/uix-slideshow/assets/banner-772x250.jpg?rev=1562876\";}s:11:\"banners_rtl\";a:0:{}}s:27:\"wp-optimize/wp-optimize.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/wp-optimize\";s:4:\"slug\";s:11:\"wp-optimize\";s:6:\"plugin\";s:27:\"wp-optimize/wp-optimize.php\";s:11:\"new_version\";s:5:\"2.1.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/wp-optimize/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/wp-optimize.2.1.1.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:64:\"https://ps.w.org/wp-optimize/assets/icon-128x128.png?rev=1552899\";s:2:\"2x\";s:64:\"https://ps.w.org/wp-optimize/assets/icon-256x256.png?rev=1552899\";s:7:\"default\";s:64:\"https://ps.w.org/wp-optimize/assets/icon-256x256.png?rev=1552899\";}s:7:\"banners\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/wp-optimize/assets/banner-1544x500.png?rev=1552899\";s:2:\"1x\";s:66:\"https://ps.w.org/wp-optimize/assets/banner-772x250.png?rev=1552899\";s:7:\"default\";s:67:\"https://ps.w.org/wp-optimize/assets/banner-1544x500.png?rev=1552899\";}s:11:\"banners_rtl\";a:0:{}}}}','no'),(255,'_transient_is_multi_author','0','yes');
/*!40000 ALTER TABLE `t_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_postmeta`
--

DROP TABLE IF EXISTS `t_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_postmeta`
--

LOCK TABLES `t_postmeta` WRITE;
/*!40000 ALTER TABLE `t_postmeta` DISABLE KEYS */;
INSERT INTO `t_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,4,'_edit_last','1'),(3,4,'_edit_lock','1512632487:1'),(12,2,'_edit_lock','1512634231:1'),(16,2,'_edit_last','1'),(17,2,'uix-page-builder-layoutdata','[{\"tempname\":\"Untitled-5a28f66e41497\"},{\"wp_page_template\":\"default\"},]'),(18,2,'uix-page-builder-status','disable'),(37,27,'_edit_last','1'),(38,27,'_edit_lock','1512653809:1');
/*!40000 ALTER TABLE `t_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_posts`
--

DROP TABLE IF EXISTS `t_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_posts`
--

LOCK TABLES `t_posts` WRITE;
/*!40000 ALTER TABLE `t_posts` DISABLE KEYS */;
INSERT INTO `t_posts` VALUES (2,1,'2017-12-07 15:26:12','2017-12-07 07:26:12','<h4 style=\"text-align: left;\">请在文章中留言或放上链接，靴靴。</h4>','锤粉投稿','','publish','closed','open','','contribute','','','2017-12-07 16:12:51','2017-12-07 08:12:51','',0,'https://zhangdachui.chaos.plus/?page_id=2',0,'page','',0),(4,1,'2017-12-07 15:40:58','2017-12-07 07:40:58','我今天去朋友家，发生了一个状况，家里的猫把塑料袋吃了，应该是塑料包装，一种很高级糕点，据说是英国皇室糕点，高级手信（看朋友朋友圈得知，非常高级，很贵，猫看见以后，感觉这个东西很高级，应该很好吃，就过去吃了，猫地位很高，在朋友家里，说一不二的，一般不说，主要是不会说，主要从作风体现，就是说一不二，想干嘛干嘛，有什么想法，立刻实施，不给适应时间，敢想敢干，比较强势，不在乎朋友家里怎么想，也不在乎朋友朋友怎么看，跟自己没关系，实在自己家，想干嘛干嘛，猫看见这个糕点以后，第一个感觉是这个糕点，很高级，是好东西，第二就是决定自己吃掉，并且立刻实施了，好东西要自己吃，走过去开吃，没有停顿，想到哪就做到哪，社会主义新阶段速度，吃之前观察了一下，应该是以前没有吃过的糕点，包装什么的，没有经验，但是马上低头开吃了，思路是反正就是个糕点，怎么吃都无所谓，关键是我吃了这个事情发生，很重要，不是别人吃，是我吃了，这很重要，第一口咬下去，感觉不妙，外面好像有个外包装还是什么，似乎好像不能吃进去，要拆了的，但吃的比较猛，一大口咬下去，马上到嗓子眼了，这时候要是吐出来，不可能的，台型不能塌，家里有个外人，就是我，在外人面前吐出来，说明自己错了，吃相难看，绝对不可能吐出来的，这样一思考以后，艰难自己吞下去了，脸色很难看，咽下去后回头看了看，朋友脸色很惊恐，因为他是知道这个糕点有外包装的，但是不能说，一是猫吃的急了点，来不及提醒，二是也不能提醒，猫家里地位很高，乱说话会折了猫面儿，等客人走以后，受苦的是自己，我不知道啥情况，实际上我知道一些，这个糕点有外包装，但我也不能说什么做什么，我是客人，不好对人家家里事情指手画脚，猫回头看我，我眼神一转，假装看电视，缩了，猫一看大家都装傻，非常生气，想发作，思考了一下，又觉得自己没道理，首先糕点是自己上去吃的，谁都没有问，吃到塑料包装，也只能怪自己，要是平常可以发飙，现在有外人，还要演伟大，人设不能塌，个么好了，哪能办了，大家都装傻，看上去是都没注意，实际上都在观察，眼角对焦到猫身上，看他下一步怎么办，会不会丢人现眼，猫一看这情况，好了，不吃也要吃了，三口并做两口，把糕点连包装吃下去了，吃完一肚子火，不能发做，这时候回房，就输了，朋友朋友怎么想，家里以后怎么喳fit，想了一下来到沙发上，趴下了，开始看电视，假装没有连包装吃了一个糕点一样，实际上是自己刚刚连塑料包装吃下去一只糕点，港的要西了，这时候朋友也不好说什么，假装看电视，我也不好说什么，走也不好，突兀，只好坐着看电视，大家都在客厅坐着，看演员的诞生，演员确实诞生了，演正常最难，我们做到了','家里的猫把塑料袋吃了','','publish','open','open','','%e5%ae%b6%e9%87%8c%e7%9a%84%e7%8c%ab%e6%8a%8a%e5%a1%91%e6%96%99%e8%a2%8b%e5%90%83%e4%ba%86','','','2017-12-07 15:40:58','2017-12-07 07:40:58','',0,'https://zhangdachui.chaos.plus/?p=4',0,'post','',0),(27,1,'2017-12-07 21:38:45','2017-12-07 13:38:45','长话短说，阿姨抱拳，六点半我正在阳台远眺，大家都知道我住3000平米大平层。\r\n天气很好，通透，远处天际线飞机忙忙碌碌，金星闪烁，四环堵的一塌糊涂，两条线，一红一黄，由于led大灯流行，黄色列亮度很高，很白，这样看起来像是一红一白，\r\n\r\n要回老家了，抱歉！阿姨颔首，接下来的职责不能履行，万分抱歉，说完阿姨土下座了，我说，怎么讲，说说，\r\n回老家了，房子不让住了，阿姨说，找不到住的地方，\r\n原来是这样！我说，那也没有办法，没住的地方确实只好回老家了一刚，我说，回去好好建设家乡，记得一定要买房，没自己的房，家就像浮萍一样，说散就散\r\n老家有房子的呀，阿姨说，还是想呆在北京，儿子工作这下也完蛋了，孙子还想在北京上学，现在看也不行了，只好去别处看看，老家总归不能回的，先去南京看看吧，上南师大也是好的\r\n想多了！我说，南师大想上就上吗，哈刚把刚，阿姨突然站起来！走到阳台上远眺，阿姨说，你看，这城市璀璨，远处是北方，多少高楼大厦，一颗一颗窗户，忽明忽暗，城市的眼睛啊，现在逐渐都闭上了，你看四环，川流不息，像动脉，我从老家来，想要添砖加瓦，现在要回去\r\n回去也不错，我说，走到哪里都需要，为人民服务，，为人民币服务，呵呵，劳动永远最光荣，劳动人永远最光荣，\r\n广阔天地大有作为！我说\r\n再见！阿姨抱拳，走了，桌上留下门禁，钥匙，各种卡，我走到阳台，远处灯火辉煌，社会主义进入新阶段，红色横幅不断，无数的住宅楼窗户忽明忽暗，又怎样，不是你亮就是我亮，不是东方压倒西风，就是西风压倒东方，你方唱罢我登场，能见度很好，看见国贸，三里屯盈通，四环川流不息，这时想起的歌曲是美空川の流れのように，崔健，荣光或是什么，流弹打中胸膛，最后，刹那，又在想，什么是永远，我宁愿你冷酷到底，羽泉，打开窗，地暖热的要死，右手从秋裤上方伸进去，握住几把，几把冰凉。想起微博上看见人们吵吵，人民，什么的，后来又说，同胞，什么的，突然想起来，现在什么样算是同胞，我们的同胞又是什么人，有没有同胞，昨天半夜刷微博突然看见某狗逼落马的消息，先是高兴，后来又萎了，突然想起来，阳痿十几年，都忘了吃药这件事，右手从秋裤裆部开口伸进去，永远是冰凉冰凉的一团，分不清哪是龟头哪是卵泡，冰凉一片。2008年初，长桥，电视塔下，藏书羊肉还没开店，大家都知道火车站要拆了，盖高铁站，伟大的工程要建三百年，却不知道一场大雪就要来','伟大的工程要建三百年','','publish','open','open','','%e4%bc%9f%e5%a4%a7%e7%9a%84%e5%b7%a5%e7%a8%8b%e8%a6%81%e5%bb%ba%e4%b8%89%e7%99%be%e5%b9%b4','','','2017-12-07 21:38:45','2017-12-07 13:38:45','',0,'https://zhangdachui.chaos.plus/?p=27',0,'post','',0);
/*!40000 ALTER TABLE `t_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_term_relationships`
--

DROP TABLE IF EXISTS `t_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_term_relationships`
--

LOCK TABLES `t_term_relationships` WRITE;
/*!40000 ALTER TABLE `t_term_relationships` DISABLE KEYS */;
INSERT INTO `t_term_relationships` VALUES (4,2,0),(4,3,0),(4,4,0),(27,2,0),(27,3,0),(27,8,0);
/*!40000 ALTER TABLE `t_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_term_taxonomy`
--

DROP TABLE IF EXISTS `t_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_term_taxonomy`
--

LOCK TABLES `t_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `t_term_taxonomy` DISABLE KEYS */;
INSERT INTO `t_term_taxonomy` VALUES (1,1,'category','',0,0),(2,2,'category','',0,2),(3,3,'post_format','',0,2),(4,4,'post_tag','',0,1),(5,5,'post_tag','',0,0),(6,6,'post_tag','',0,0),(7,7,'post_tag','',0,0),(8,8,'post_tag','',0,1);
/*!40000 ALTER TABLE `t_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_termmeta`
--

DROP TABLE IF EXISTS `t_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_termmeta`
--

LOCK TABLES `t_termmeta` WRITE;
/*!40000 ALTER TABLE `t_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_terms`
--

DROP TABLE IF EXISTS `t_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_terms`
--

LOCK TABLES `t_terms` WRITE;
/*!40000 ALTER TABLE `t_terms` DISABLE KEYS */;
INSERT INTO `t_terms` VALUES (1,'未分类','uncategorized',0),(2,'严肃文学','%e4%b8%a5%e8%82%83%e6%96%87%e5%ad%a6',0),(3,'post-format-aside','post-format-aside',0),(4,'一个毛','%e4%b8%80%e4%b8%aa%e6%af%9b',0),(5,'老张','%e8%80%81%e5%bc%a0',0),(6,'特师心得','%e7%89%b9%e5%b8%88%e5%bf%83%e5%be%97',0),(7,'李大根','%e6%9d%8e%e5%a4%a7%e6%a0%b9',0),(8,'3000平米大平层','3000%e5%b9%b3%e7%b1%b3%e5%a4%a7%e5%b9%b3%e5%b1%82',0);
/*!40000 ALTER TABLE `t_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usermeta`
--

DROP TABLE IF EXISTS `t_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usermeta`
--

LOCK TABLES `t_usermeta` WRITE;
/*!40000 ALTER TABLE `t_usermeta` DISABLE KEYS */;
INSERT INTO `t_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'syntax_highlighting','true'),(7,1,'comment_shortcuts','false'),(8,1,'admin_color','fresh'),(9,1,'use_ssl','0'),(10,1,'show_admin_bar_front','true'),(11,1,'locale',''),(12,1,'t_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(13,1,'t_user_level','10'),(14,1,'dismissed_wp_pointers',''),(15,1,'show_welcome_panel','0'),(16,1,'session_tokens','a:2:{s:64:\"33cd6f89fbe0439f92f3e29fccf626eb7f0cceb533be9c00f43e7155d9ce29a9\";a:4:{s:10:\"expiration\";i:1513841186;s:2:\"ip\";s:14:\"123.127.48.193\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36\";s:5:\"login\";i:1512631586;}s:64:\"69e7ed6babc1f36abf50e3f19c576c624cf2180b8eea290a5f3d80b58b0214c6\";a:4:{s:10:\"expiration\";i:1513862509;s:2:\"ip\";s:15:\"183.240.196.148\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36\";s:5:\"login\";i:1512652909;}}'),(17,1,'t_dashboard_quick_press_last_post_id','18'),(18,1,'community-events-location','a:1:{s:2:\"ip\";s:12:\"123.127.48.0\";}'),(19,1,'t_user-settings','editor=tinymce&libraryContent=upload'),(20,1,'t_user-settings-time','1512637345'),(21,1,'closedpostboxes_dashboard','a:0:{}'),(22,1,'metaboxhidden_dashboard','a:1:{i:0;s:17:\"dashboard_primary\";}'),(23,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:19:\"dashboard_right_now\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:18:\"dashboard_activity\";s:7:\"column4\";s:18:\"cpdDashboardWidget\";}'),(24,1,'closedpostboxes_page','a:0:{}'),(25,1,'metaboxhidden_page','a:5:{i:0;s:10:\"postcustom\";i:1;s:16:\"commentstatusdiv\";i:2;s:11:\"commentsdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}');
/*!40000 ALTER TABLE `t_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
INSERT INTO `t_users` VALUES (1,'admin','$P$BRbe6ZinDoS8jvhkJnp/OHG4wTULUO.','admin','thesedays@126.com','','2017-12-07 07:26:12','',0,'admin');
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-08  9:34:46
