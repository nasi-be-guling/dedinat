/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_dedinat
-- ------------------------------------------------------
-- Server version	10.5.29-MariaDB-ubu2004

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
-- Table structure for table `assessment_items`
--

DROP TABLE IF EXISTS `assessment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) DEFAULT NULL,
  `variable_id` int(11) DEFAULT NULL,
  `variable_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_variable_id` int(11) DEFAULT NULL,
  `item_item_id` int(11) DEFAULT NULL,
  `item_kategori` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_no_urut` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `subs` varchar(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_items`
--

LOCK TABLES `assessment_items` WRITE;
/*!40000 ALTER TABLE `assessment_items` DISABLE KEYS */;
INSERT INTO `assessment_items` VALUES (1,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',42,1,NULL,NULL,'Terlambat bicara, duduk, merangkak atau berguling.','0_0',NULL,1,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(2,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',43,1,NULL,NULL,'Sulit mengingat','0_1',NULL,0,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(3,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',44,1,NULL,NULL,'Lambat menguasai kemampuan mendasar, seperti makan sendiri, berpakaian ataupun buang air di toilet.','0_2',NULL,0,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(4,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',45,1,NULL,NULL,'Tidak dapat menghubungkan antara tindakan dengan konsekuensi dari tindakan','0_3',NULL,1,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(5,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',46,1,NULL,NULL,'Sulit berpikir logis maupun memecahkan persoalan ringan','0_4',NULL,0,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(6,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',47,1,NULL,NULL,'Memiliki kesulitan memahami aturan social','0_5',NULL,1,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(7,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',48,1,NULL,NULL,'Memiliki kesulitan dalam mengendalikan sikap atau gerakannya','0_6',NULL,0,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(8,1,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',49,1,NULL,NULL,'Selalu bergantung pada orang lain','0_7',NULL,0,'A','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(9,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',50,2,NULL,NULL,'Jari kaki masuk ke dalam dan tangan pendek tebal','1_0',NULL,1,'B','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(10,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',51,2,NULL,NULL,'Alis tumbuh mengikuti garis ke atas keluar (Epicantus)','1_1',NULL,0,'B','2025-06-06 23:21:44','2025-06-06 23:21:44',NULL),(11,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',52,2,NULL,NULL,'Mulut membuka dan berair liur','1_2',NULL,0,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(12,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',53,2,NULL,NULL,'Wajah datar dengan telinga rendah','1_3',NULL,1,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(13,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',54,2,NULL,NULL,'Suara datar, bibir tebal','1_4',NULL,0,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(14,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',55,2,NULL,NULL,'Postur tubuh pendek dan kepala kecil','1_5',NULL,0,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(15,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',56,2,NULL,NULL,'Mata sipit , miring dan juling','1_6',NULL,1,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(16,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',57,2,NULL,NULL,'Kepala bagian belakang pipih, rambut jarang dan tipis','1_7',NULL,0,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(17,1,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',58,2,NULL,NULL,'Rambut tegak kaku kasar','1_8',NULL,1,'B','2025-06-06 23:21:45','2025-06-06 23:21:45',NULL),(18,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',1,1,NULL,NULL,'Sering menabrak orang atau benda?','0_0',NULL,1,'A','2025-08-15 15:32:07','2025-08-15 15:32:07',NULL),(19,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',2,1,NULL,NULL,'Sering meletakkan barang di tempat yang salah?','0_1',NULL,1,'A','2025-08-15 15:32:07','2025-08-15 15:32:07',NULL),(20,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',3,1,NULL,NULL,'Sering tersandung ketika berjalan?','0_2',NULL,1,'A','2025-08-15 15:32:07','2025-08-15 15:32:07',NULL),(21,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',4,1,NULL,NULL,'Sering mengucek-ngucek mata berlebihan? (Bukan kelilipan)','0_3',NULL,1,'A','2025-08-15 15:32:07','2025-08-15 15:32:07',NULL),(22,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',5,1,NULL,NULL,'Sering mengedipkan mata?','0_4',NULL,1,'A','2025-08-15 15:32:07','2025-08-15 15:32:07',NULL),(23,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',6,1,NULL,NULL,'Sering meniru gerak?','0_5',NULL,1,'A','2025-08-15 15:32:07','2025-08-15 15:32:07',NULL),(24,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',7,1,NULL,NULL,'Sulit mengenal gambar jika warna kurang kontras?','0_6',NULL,1,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(25,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',8,1,NULL,NULL,'Sulit melihat bila kurang cahaya?','0_7',NULL,1,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(26,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',9,1,NULL,NULL,'Suka meraba-raba benda yang dipegang?','0_8',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(27,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',10,1,NULL,NULL,'Suka membau sesuatu?','0_9',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(28,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',11,1,NULL,NULL,'Suka mengarahkan pandangan pada sumber bunyi?','0_10',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(29,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',12,1,NULL,NULL,'Suka memicingkan mata atau mengerutkan dahi ketika silau?','0_11',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(30,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',13,1,NULL,NULL,'Mata tidak melihat lurus kedepan saat memandang sesuatu?','0_12',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(31,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',14,1,NULL,NULL,'Membaca atau menulis dengan jarak dekat?','0_13',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(32,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',15,1,NULL,NULL,'Sulit menulis garis lurus?','0_14',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(33,2,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',16,1,NULL,NULL,'Memegang benda dekat ke muka saat melihat?','0_15',NULL,0,'A','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(34,2,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',17,2,NULL,NULL,'Warna bola mata keruh / kering/ bersisik ?','1_0',NULL,1,'B','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(35,2,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',18,2,NULL,NULL,'Kedua mata tampak menjorok kedepan ?','1_1',NULL,0,'B','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(36,2,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',19,2,NULL,NULL,'Bola mata bergoyang goyang (nistagmus)','1_2',NULL,0,'B','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(37,2,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',20,2,NULL,NULL,'Bola mata terlihat mengecil ?','1_3',NULL,0,'B','2025-08-15 15:32:08','2025-08-15 15:32:08',NULL),(38,2,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',21,2,NULL,NULL,'Bagian bola mata berkabut / berwarna putih','1_4',NULL,0,'B','2025-08-15 15:32:09','2025-08-15 15:32:09',NULL),(39,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',42,1,NULL,NULL,'Terlambat bicara, duduk, merangkak atau berguling.','0_0',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(40,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',43,1,NULL,NULL,'Sulit mengingat','0_1',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(41,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',44,1,NULL,NULL,'Lambat menguasai kemampuan mendasar, seperti makan sendiri, berpakaian ataupun buang air di toilet.','0_2',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(42,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',45,1,NULL,NULL,'Tidak dapat menghubungkan antara tindakan dengan konsekuensi dari tindakan','0_3',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(43,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',46,1,NULL,NULL,'Sulit berpikir logis maupun memecahkan persoalan ringan','0_4',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(44,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',47,1,NULL,NULL,'Memiliki kesulitan memahami aturan social','0_5',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(45,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',48,1,NULL,NULL,'Memiliki kesulitan dalam mengendalikan sikap atau gerakannya','0_6',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(46,3,1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',49,1,NULL,NULL,'Selalu bergantung pada orang lain','0_7',NULL,1,'A','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(47,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',50,2,NULL,NULL,'Jari kaki masuk ke dalam dan tangan pendek tebal','1_0',NULL,0,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(48,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',51,2,NULL,NULL,'Alis tumbuh mengikuti garis ke atas keluar (Epicantus)','1_1',NULL,0,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(49,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',52,2,NULL,NULL,'Mulut membuka dan berair liur','1_2',NULL,0,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(50,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',53,2,NULL,NULL,'Wajah datar dengan telinga rendah','1_3',NULL,0,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(51,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',54,2,NULL,NULL,'Suara datar, bibir tebal','1_4',NULL,1,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(52,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',55,2,NULL,NULL,'Postur tubuh pendek dan kepala kecil','1_5',NULL,1,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(53,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',56,2,NULL,NULL,'Mata sipit , miring dan juling','1_6',NULL,1,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(54,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',57,2,NULL,NULL,'Kepala bagian belakang pipih, rambut jarang dan tipis','1_7',NULL,0,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL),(55,3,2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',58,2,NULL,NULL,'Rambut tegak kaku kasar','1_8',NULL,0,'B','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL);
/*!40000 ALTER TABLE `assessment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `score_yes` int(11) DEFAULT NULL,
  `score_no` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `score_text` varchar(255) DEFAULT NULL COMMENT 'Diduga / Normal',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,8,5,3,7,10,7,'Diduga','2025-06-06 23:21:44','2025-06-08 22:20:59',NULL),(2,9,6,1,9,12,9,'Diduga','2025-08-15 15:32:07','2025-08-15 15:32:11',NULL),(3,11,7,3,11,6,11,'Diduga','2025-09-17 16:45:55','2025-09-17 16:45:55',NULL);
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rumus` varchar(255) DEFAULT NULL,
  `footer_diduga` varchar(2000) DEFAULT NULL,
  `footer_normal` varchar(2000) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kehilangan Penglihatan (Tuna Netra)','{{A}}+{{B}}>=9||{{B}}>=1','Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 1','Tidak ada jawaban \"Ya\" pada A atau B',NULL,NULL,NULL),(2,'Kurang Mampu Mendengar (Tuna Rungu)','{{A}}+{{B}}>=9||{{B}}>=1','Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 1','Tidak ada jawaban \"Ya\" pada A atau B',NULL,NULL,NULL),(3,'Retaldasi Mental (Tuna Grahita)','{{A}}+{{B}}>=7||{{B}}>=1','Jika jawaban \"Ya\" pada A + B >= 7 atau jawaban \"Ya\" pada B >= 1','Tidak ada jawaban \"Ya\" pada A atau B',NULL,NULL,NULL),(4,'Cacat Tubuh (Tuna Daksa)','{{A}}+{{B}}>=4||{{B}}>=2','Jika jawaban \"Ya\" pada A + B >= 4 atau jawaban \"Ya\" pada B >= 2','Tidak ada jawaban \"Ya\" pada A atau B',NULL,NULL,NULL),(5,'Gangguan Emosional dan Perilaku (Tuna Laras)','{{B}}>=9','Jika jawaban \"Ya\" pada A >= 9','Tidak ada jawaban \"Ya\"',NULL,NULL,'2025-06-01 21:04:09'),(6,'Autis','{{A}}+{{B}}>=9||{{B}}>=4','Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 4','Tidak ada jawaban \"Ya\" pada A atau B',NULL,NULL,NULL),(7,'ADHD','{{A}}+{{B}}>=10||{{B}}>=2','Jika jawaban \"Ya\" pada A + B >= 10 atau jawaban \"Ya\" pada B >= 2','Tidak ada jawaban \"Ya\" pada A atau B',NULL,NULL,NULL),(8,'Cerdas Istimewa','{{A}}>=14','Jika jawaban \"Ya\" pada A >= 14','Tidak ada jawaban \"Ya\"',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `childs`
--

DROP TABLE IF EXISTS `childs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `childs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `umur` int(12) DEFAULT NULL,
  `jenis_kebutuhan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `childs`
--

LOCK TABLES `childs` WRITE;
/*!40000 ALTER TABLE `childs` DISABLE KEYS */;
INSERT INTO `childs` VALUES (1,'Test data Anak Sinabus','Testing Alamat Anak Sinabus 1',16,'Disabilitas Intelektual','2024-05-10 09:06:01','2024-06-06 01:56:50','2024-06-06 01:56:50'),(2,'Test data Anak Sinabus','Alamat Anak Sinabus 1',16,'Disabilitas Intelektual','2024-06-06 02:00:22','2025-09-17 16:43:52','2025-09-17 16:43:52'),(3,'test','adasda',4,'aaaa','2025-05-31 16:27:24','2025-09-17 16:43:54','2025-09-17 16:43:54'),(4,'Kentaki','Texas',12,'Nakal','2025-06-06 20:27:20','2025-09-17 16:43:55','2025-09-17 16:43:55'),(5,'Ara','Japan',2,'Maniak','2025-06-06 22:46:26','2025-09-17 16:43:56','2025-09-17 16:43:56'),(6,'Viki Anjar Rizki Pratama','Jl. Pucang',3,'Tuna Grahita','2025-08-13 18:04:21','2025-09-17 16:44:41','2025-09-17 16:44:41'),(7,'Viki Anjar Rizki Pratama','Pucang Jajar 56',36,'Tuna Grahita','2025-09-17 16:45:34','2025-09-17 16:45:34',NULL);
/*!40000 ALTER TABLE `childs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_method`
--

DROP TABLE IF EXISTS `item_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_method` (
  `item_id` int(10) unsigned NOT NULL,
  `method_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`method_id`),
  KEY `item_method_method_id_foreign` (`method_id`),
  CONSTRAINT `item_method_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_method_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_method`
--

LOCK TABLES `item_method` WRITE;
/*!40000 ALTER TABLE `item_method` DISABLE KEYS */;
INSERT INTO `item_method` VALUES (1,1),(1,3),(2,1),(2,3),(3,1),(3,3),(4,1),(4,3),(5,1),(5,3),(6,1),(6,3),(7,1),(7,3),(8,1),(8,3),(9,1),(9,3),(10,1),(10,3),(11,1),(11,3),(12,1),(12,3),(13,1),(13,3),(14,1),(14,3),(15,1),(15,3),(16,1),(16,3),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,3),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,3),(38,3),(39,1),(39,3),(40,1),(41,1),(42,1),(42,3),(43,1),(43,3),(44,1),(44,3),(45,1),(45,3),(46,1),(46,3),(47,1),(47,3),(48,1),(48,3),(49,1),(49,3),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(59,3),(60,1),(60,3),(61,1),(61,3),(62,1),(62,3),(63,1),(63,3),(64,1),(64,3),(65,1),(65,3),(66,1),(67,1),(68,1),(69,1),(69,3),(70,1),(70,3),(71,1),(71,3),(72,1),(72,3),(73,1),(73,3),(74,1),(74,3),(75,1),(75,3),(76,1),(76,3),(77,1),(77,3),(78,1),(78,3),(79,1),(79,3),(80,1),(80,3),(81,1),(81,3),(82,1),(82,3),(83,1),(83,3),(84,1),(84,3),(85,1),(85,3),(86,1),(86,3),(87,1),(87,3),(88,1),(88,3),(89,1),(89,3),(90,1),(90,3),(91,1),(91,3),(92,1),(92,3),(93,1),(93,3),(94,1),(94,3),(95,1),(95,3),(96,1),(96,3),(97,1),(97,3),(98,1),(98,3),(99,1),(99,3),(100,1),(100,3),(101,1),(101,3),(102,1),(102,3),(103,1),(103,3),(104,1),(104,3),(105,1),(105,3),(106,1),(107,1),(108,3),(109,1),(110,1),(111,1),(112,2),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(120,3),(121,3),(122,1),(123,1),(124,1),(125,2),(126,1),(126,3),(127,1),(127,3),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(133,3),(134,1),(134,3),(135,1),(135,3),(136,1),(136,3),(137,1),(137,3),(138,1),(138,3),(139,1),(140,1),(141,1),(142,1),(142,3),(143,1),(143,3),(144,1),(144,3),(145,1),(146,1),(146,3),(147,2),(148,1),(149,3),(150,1),(150,3),(151,1),(151,3),(152,1),(152,3),(153,1);
/*!40000 ALTER TABLE `item_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_num` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,1,NULL,'Sering menabrak orang atau benda?',1,NULL,NULL,NULL),(2,1,1,NULL,'Sering meletakkan barang di tempat yang salah?',2,NULL,NULL,NULL),(3,1,1,NULL,'Sering tersandung ketika berjalan?',3,NULL,NULL,NULL),(4,1,1,NULL,'Sering mengucek-ngucek mata berlebihan? (Bukan kelilipan)',4,NULL,NULL,NULL),(5,1,1,NULL,'Sering mengedipkan mata?',5,NULL,NULL,NULL),(6,1,1,NULL,'Sering meniru gerak?',6,NULL,NULL,NULL),(7,1,1,NULL,'Sulit mengenal gambar jika warna kurang kontras?',7,NULL,NULL,NULL),(8,1,1,NULL,'Sulit melihat bila kurang cahaya?',8,NULL,NULL,NULL),(9,1,1,NULL,'Suka meraba-raba benda yang dipegang?',9,NULL,NULL,NULL),(10,1,1,NULL,'Suka membau sesuatu?',10,NULL,NULL,NULL),(11,1,1,NULL,'Suka mengarahkan pandangan pada sumber bunyi?',11,NULL,NULL,NULL),(12,1,1,NULL,'Suka memicingkan mata atau mengerutkan dahi ketika silau?',12,NULL,NULL,NULL),(13,1,1,NULL,'Mata tidak melihat lurus kedepan saat memandang sesuatu?',13,NULL,NULL,NULL),(14,1,1,NULL,'Membaca atau menulis dengan jarak dekat?',14,NULL,NULL,NULL),(15,1,1,NULL,'Sulit menulis garis lurus?',15,NULL,NULL,NULL),(16,1,1,NULL,'Memegang benda dekat ke muka saat melihat?',16,NULL,NULL,NULL),(17,2,1,NULL,'Warna bola mata keruh / kering/ bersisik ?',1,NULL,NULL,NULL),(18,2,1,NULL,'Kedua mata tampak menjorok kedepan ?',2,NULL,NULL,NULL),(19,2,1,NULL,'Bola mata bergoyang goyang (nistagmus)',3,NULL,NULL,NULL),(20,2,1,NULL,'Bola mata terlihat mengecil ?',4,NULL,NULL,NULL),(21,2,1,NULL,'Bagian bola mata berkabut / berwarna putih',5,NULL,NULL,NULL),(22,1,2,NULL,'Bayi tidak terkejut dengan suara keras yang muncul tiba-tiba',1,NULL,NULL,NULL),(23,1,2,NULL,'Tidak mengenali suara orang tua pada usia tiga bulan',2,NULL,NULL,NULL),(24,1,2,NULL,'Tidak menolehkan wajah/ melihat ke arah datangnya suara pada usia enam bulan',3,NULL,NULL,NULL),(25,1,2,NULL,'Bayi tidak mampu menirukan suara atau mengucapkan kata pada usia satu tahun',4,NULL,NULL,NULL),(26,1,2,NULL,'Mengarahkan telinga kepada pembicara ?',5,NULL,NULL,NULL),(27,1,2,NULL,'Ucapan kata tidak jelas dan sulit dipahami',6,NULL,NULL,NULL),(28,1,2,NULL,'Tidak memahami perintah (bicara sangat keras) dalam jarak 1 m',7,NULL,NULL,NULL),(29,1,2,NULL,'Tidak ada reaksi terhadap bunyi di dekatnya lebih 1 meter',8,NULL,NULL,NULL),(30,1,2,NULL,'Kurang atau tidak tanggap bila diajak bicara',9,NULL,NULL,NULL),(31,1,2,NULL,'Terlambat dalam perkembangan bahasa',10,NULL,NULL,NULL),(32,1,2,NULL,'Banyak perhatian terhadap getaran',11,NULL,NULL,NULL),(33,1,2,NULL,'Menatap bibir dan muka pembicara',12,NULL,NULL,NULL),(34,1,2,NULL,'Suara membaca dan bicara keras',13,NULL,NULL,NULL),(35,1,2,NULL,'Membantu telinga denga tangan',14,NULL,NULL,NULL),(36,1,2,NULL,'Respon pada bunyi-bunyian tapi tidak pada suara',15,NULL,NULL,NULL),(37,2,2,NULL,'Berteriak , memekik untuk mengekspresikan kegembiraan, keinginan , kemarahan dan kebutuhan',1,NULL,NULL,NULL),(38,2,2,NULL,'Sering keras kepala',2,NULL,NULL,NULL),(39,2,2,NULL,'Dominan dalam pemakaian isyarat',3,NULL,NULL,NULL),(40,2,2,NULL,'Sedikit tertawa dalam permainan',4,NULL,NULL,NULL),(41,2,2,NULL,'Tertarik pada benda terlebih dahulu daripada orang lain',5,NULL,NULL,NULL),(42,1,3,NULL,'Terlambat bicara, duduk, merangkak atau berguling.',1,NULL,NULL,NULL),(43,1,3,NULL,'Sulit mengingat',2,NULL,NULL,NULL),(44,1,3,NULL,'Lambat menguasai kemampuan mendasar, seperti makan sendiri, berpakaian ataupun buang air di toilet.',3,NULL,NULL,NULL),(45,1,3,NULL,'Tidak dapat menghubungkan antara tindakan dengan konsekuensi dari tindakan',4,NULL,NULL,NULL),(46,1,3,NULL,'Sulit berpikir logis maupun memecahkan persoalan ringan',5,NULL,NULL,NULL),(47,1,3,NULL,'Memiliki kesulitan memahami aturan social',6,NULL,NULL,NULL),(48,1,3,NULL,'Memiliki kesulitan dalam mengendalikan sikap atau gerakannya',7,NULL,NULL,NULL),(49,1,3,NULL,'Selalu bergantung pada orang lain',8,NULL,NULL,NULL),(50,2,3,NULL,'Jari kaki masuk ke dalam dan tangan pendek tebal',1,NULL,NULL,NULL),(51,2,3,NULL,'Alis tumbuh mengikuti garis ke atas keluar (Epicantus)',2,NULL,NULL,NULL),(52,2,3,NULL,'Mulut membuka dan berair liur',3,NULL,NULL,NULL),(53,2,3,NULL,'Wajah datar dengan telinga rendah',4,NULL,NULL,NULL),(54,2,3,NULL,'Suara datar, bibir tebal',5,NULL,NULL,NULL),(55,2,3,NULL,'Postur tubuh pendek dan kepala kecil',6,NULL,NULL,NULL),(56,2,3,NULL,'Mata sipit , miring dan juling',7,NULL,NULL,NULL),(57,2,3,NULL,'Kepala bagian belakang pipih, rambut jarang dan tipis',8,NULL,NULL,NULL),(58,2,3,NULL,'Rambut tegak kaku kasar',9,NULL,NULL,NULL),(59,1,4,NULL,'Kejang saat marah atau dalam keadaan tenang tanpa ada kenaikan suhu tubuh normal 36.5<sup>o</sup>C – 37<sup>o</sup>C',1,NULL,NULL,NULL),(60,1,4,NULL,'Terdapat anggota tubuh yang tremor/ bergerak-gerak terus menerus tidak terkendali',2,NULL,NULL,NULL),(61,1,4,NULL,'Gangguan koordinasi gerak',3,NULL,NULL,NULL),(62,1,4,NULL,'Bila jalan gontai (sempoyongan)',4,NULL,NULL,NULL),(63,1,4,NULL,'Mudah tersinggung, marah,rendah diri, pemalu , menyendiri, kurang dapat bergaul, frustasi',5,NULL,NULL,NULL),(64,1,4,NULL,'Hiperaktif ( tidak mau diam, gelisah)',6,NULL,NULL,NULL),(65,1,4,NULL,'Hipoaktif ( pendiam, gerakan lamban,kurang respon)',7,NULL,NULL,NULL),(66,2,4,NULL,'Anggota gerak tubuh kaku/lemah/lumpuh',1,NULL,NULL,NULL),(67,2,4,NULL,'Terdapat bagian anggota gerak yang berbeda dari biasa (lebih kecil/besar/panjang/pendek)',2,NULL,NULL,NULL),(68,2,4,NULL,'Gangguan pendengaran',3,NULL,NULL,NULL),(69,2,4,NULL,'Gangguan penglihatan',4,NULL,NULL,NULL),(70,2,4,NULL,'Gangguan bicara',5,NULL,NULL,NULL),(71,2,4,NULL,'Kehilangan/ketidaksempuran sebagian anggota tubuh',6,NULL,NULL,NULL),(72,1,5,NULL,'Sering berkelahi',1,NULL,NULL,NULL),(73,1,5,NULL,'Sering membangkang / melawan',2,NULL,NULL,NULL),(74,1,5,NULL,'Sering bicara cabul',3,NULL,NULL,NULL),(75,1,5,NULL,'Sering mencuri',4,NULL,NULL,NULL),(76,1,5,NULL,'Sering melakukan tindakan agresif, merusak, mengganggu',5,NULL,NULL,NULL),(77,1,5,NULL,'Sering bertindak melanggar norma sosial/norma susila/hukum',6,NULL,NULL,NULL),(78,1,5,NULL,'Sering berbohong',7,NULL,NULL,NULL),(79,1,5,NULL,'Mudah terpancing emosinya',8,NULL,NULL,NULL),(80,1,5,NULL,'Kemampuan perhatian pendek',9,NULL,NULL,NULL),(81,1,5,NULL,'Tindak kekejaman fisik pada manusia maupun binatang',10,NULL,NULL,NULL),(82,1,5,NULL,'Mudah bosan dan pasif',11,NULL,NULL,NULL),(83,1,5,NULL,'Kurang mampu bersosialisasi dengan teman sebaya',12,NULL,NULL,NULL),(84,1,5,NULL,'Kecemasan berlebihan, menarik/menutup diri',13,NULL,NULL,NULL),(85,1,5,NULL,'Marah dengan emosi yang meledak-ledak',14,NULL,NULL,NULL),(86,1,5,NULL,'Berteriak kepada orang yang lebih tua (khususnya orangtua sendiri)',15,NULL,NULL,NULL),(87,1,5,NULL,'Suka melempar sesuatu, seperti mainan di rumah dan di sekolah?',16,NULL,NULL,NULL),(88,1,6,NULL,'Usia 2 - 3 bulan bayi tidak sering melakukan kontak mata',1,NULL,NULL,NULL),(89,1,6,NULL,'Usia 3 bulan bayi tidak tersenyum ketika diajak bercanda',2,NULL,NULL,NULL),(90,1,6,NULL,'Usia 6 bulan bayi tidak tertawa atau membuat ekspresi gembira lainnya',3,NULL,NULL,NULL),(91,1,6,NULL,'Usia 1 tahun bayi tidak merespons atau menoleh ketika namanya dipanggil',4,NULL,NULL,NULL),(92,1,6,NULL,'Usia 16 bulan bayi tidak berkata-kata',5,NULL,NULL,NULL),(93,1,6,NULL,'Usia 24 bulan, bayi tidak bisa mengucapkan dua kata yang memiliki arti',6,NULL,NULL,NULL),(94,1,6,NULL,'Tak dapat bermain dengan teman sebaya',7,NULL,NULL,NULL),(95,1,6,NULL,'Tak ada empati',8,NULL,NULL,NULL),(96,1,6,NULL,'Kurang mampu mengadakan hubungan sosial dan emosional',9,NULL,NULL,NULL),(97,1,6,NULL,'Sering menggunakan bahasa yang aneh dan diulang-ulang.',10,NULL,NULL,NULL),(98,1,6,NULL,'Cara bermain yang kurang variatif, kurang imajinatif, dan kurang dapat meniru.',11,NULL,NULL,NULL),(99,1,6,NULL,'Mempertahankan satu minat / lebih dengan cara yang sangat khas dan berlebihan.',12,NULL,NULL,NULL),(100,1,6,NULL,'Terpaku pada suatu kegiatan yang rutinitas yang tak ada gunanya.',13,NULL,NULL,NULL),(101,1,6,NULL,'Ada gerakan aneh yang khas dan diulang-ulang (ngepakan – tangan, memukulmukul kepala)',14,NULL,NULL,NULL),(102,1,6,NULL,'Sering kali sangat terpukau pada bagian-bagian benda.',15,NULL,NULL,NULL),(103,1,6,NULL,'Tidak suka dipeluk',16,NULL,NULL,NULL),(104,1,6,NULL,'Suka berjalan dengan “jinjit\"/ menggoyang-goyangkan tubuh',17,NULL,NULL,NULL),(105,1,6,NULL,'Jarang sekali memulai komunikasi',18,NULL,NULL,NULL),(106,2,6,NULL,'Ekspresi muka kurang hidup/datar',1,NULL,NULL,NULL),(107,2,6,NULL,'Memiliki bahasa atau gerakan tubuh yang cenderung kaku',2,NULL,NULL,NULL),(108,2,6,NULL,'Sulit tidur',3,NULL,NULL,NULL),(109,2,6,NULL,'Memiliki wajah yang lebih lebar, termasuk mata yang lebih lebar',4,NULL,NULL,NULL),(110,2,6,NULL,'Bagian tengah wajahnya lebih pendek, termasuk pipi dan hidung',5,NULL,NULL,NULL),(111,2,6,NULL,'Ukuran mulut dan philtrum ( lekukan antara hidung dan bibir) lebih lebar',6,NULL,NULL,NULL),(112,1,7,NULL,'Untuk usia 4 tahun, tidak bisa melompat dengan satu kaki.',1,NULL,NULL,NULL),(113,1,7,NULL,'Selalu bergerak seperti menggoyangkan lutut terus-menerus, tidak bisa duduk tanpa menggeliat, atau kaki yang selalu bergerak, disertai gerakan naik-turun',2,NULL,NULL,NULL),(114,1,7,NULL,'Sering berlari atau memanjat berlebihan dalam situasi yang tidak sesuai',3,NULL,NULL,NULL),(115,1,7,NULL,'Kesulitan bermain dengan tenang',4,NULL,NULL,NULL),(116,1,7,NULL,'Tidak bisa fokus lebih dari beberapa menit.',5,NULL,NULL,NULL),(117,1,7,NULL,'Sering bicara berlebihan',6,NULL,NULL,NULL),(118,1,7,NULL,'Lebih berisik dibanding teman bermainnya.',7,NULL,NULL,NULL),(119,1,7,NULL,'Tidak takut pada situasi yang bisa membahayakan anak.',8,NULL,NULL,NULL),(120,1,7,NULL,'Sangat mudah frustasi dan kesulitan mengatur emosi/ temperamen',9,NULL,NULL,NULL),(121,1,7,NULL,'Suka menyela atau memaksakan diri terhadap orang lain',10,NULL,NULL,NULL),(122,1,7,NULL,'Membuat kesalahan pada hal kecil (ceroboh)',11,NULL,NULL,NULL),(123,1,7,NULL,'Sulit mempertahankan perhatian',12,NULL,NULL,NULL),(124,1,7,NULL,'Perilakunya seperti tidak mendengarkan saat diajak bicara langsung',13,NULL,NULL,NULL),(125,1,7,NULL,'Gagal menyelesaikan pekerjaan',14,NULL,NULL,NULL),(126,1,7,NULL,'Sulit mengatur tugas dan kegiatan',15,NULL,NULL,NULL),(127,1,7,NULL,'Enggan terlibat dalam tugas yang memerlukan ketekunan',16,NULL,NULL,NULL),(128,1,7,NULL,'Perhatian mudah teralih oleh rangsangan dari luar',17,NULL,NULL,NULL),(129,2,7,NULL,'Berlari dan bergerak sangat cepat',1,NULL,NULL,NULL),(130,2,7,NULL,'Pengeluaran air liur dari mulut yang tidak terkontrol',2,NULL,NULL,NULL),(131,2,7,NULL,'Postur tubuhnya terlihat tidak simetris',3,NULL,NULL,NULL),(132,1,8,NULL,'Membaca pada usia kurang dari 6 tahun,',1,NULL,NULL,NULL),(133,1,8,NULL,'Membaca lebih cepat dan lebih banyak,',2,NULL,NULL,NULL),(134,1,8,NULL,'Memiliki perbendaharaan kata yang luas,',3,NULL,NULL,NULL),(135,1,8,NULL,'Mempunyai rasa ingin tahu yang kuat',4,NULL,NULL,NULL),(136,1,8,NULL,'Mempunyai pengamatan yang tajam',5,NULL,NULL,NULL),(137,1,8,NULL,'Mempunyai inisitif dan dapat bekerja sendiri,',6,NULL,NULL,NULL),(138,1,8,NULL,'Mempunyai Kemampuan Verbal yang Baik',7,NULL,NULL,NULL),(139,1,8,NULL,'Cepat belajar mengenali wajah dan suara pada orang yang berbeda.',8,NULL,NULL,NULL),(140,1,8,NULL,'Waktu tidur sedikit tetapi tidak rewel karena lelah.',9,NULL,NULL,NULL),(141,1,8,NULL,'Senang mencoba hal-hal baru',10,NULL,NULL,NULL),(142,1,8,NULL,'Mempunyai daya ingat yang kuat',11,NULL,NULL,NULL),(143,1,8,NULL,'Banyak bertanya',12,NULL,NULL,NULL),(144,1,8,NULL,'Memiliki kemampuan belajar yang cepat',13,NULL,NULL,NULL),(145,1,8,NULL,'Memperlihatkan konsentrasi yang sungguh-sungguh',14,NULL,NULL,NULL),(146,1,8,NULL,'Senang Menjadi Pemimpin',15,NULL,NULL,NULL),(147,1,8,NULL,'Perhatian terhadap detil',16,NULL,NULL,NULL),(148,1,8,NULL,'Stabil secara emosi (mampu mengendalikan diri)',17,NULL,NULL,NULL),(149,1,8,NULL,'Dapat memahami instruksi dengan mudah.)',18,NULL,NULL,NULL),(150,1,8,NULL,'Kreatif dan daya imajinasi tinggi',19,NULL,NULL,NULL),(151,1,8,NULL,'Memiliki kemampuan berpikir cepat dan tepat.',20,NULL,NULL,NULL),(152,1,8,NULL,'Jeli dan Memiliki Minat Kuat',21,NULL,NULL,NULL),(153,1,1,NULL,'test',34,'2025-06-08','2025-06-08','2025-06-08');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `is_heading` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,NULL,'/home','Home','ti-smart-home',1,0,NULL,NULL,NULL),(2,NULL,'/master','Data Master','ti-lifebuoy',2,0,NULL,NULL,NULL),(3,2,'/master/user','Data Pengguna','ti-users',1,0,NULL,NULL,NULL),(4,2,'/master/child','Data Anak','ti-user-heart',2,0,NULL,NULL,NULL),(5,NULL,'assessment','ASESMEN',NULL,3,1,NULL,NULL,NULL),(6,NULL,'/assessment','Asesmen','ti-address-book',4,0,NULL,NULL,NULL),(7,2,'/master/variable','Variable','ti-file-analytics',3,0,NULL,NULL,NULL),(8,2,'/master/item','Item','ti-file-certificate',4,0,NULL,NULL,NULL),(9,2,'/master/category','Kategori','ti-layers',5,0,'2025-05-31 12:08:29','2025-05-31 12:08:29',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methods`
--

LOCK TABLES `methods` WRITE;
/*!40000 ALTER TABLE `methods` DISABLE KEYS */;
INSERT INTO `methods` VALUES (1,'Observasi',NULL,NULL,NULL),(2,'Perintah',NULL,NULL,NULL),(3,'Wawancara',NULL,NULL,NULL);
/*!40000 ALTER TABLE `methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_03_02_110211_create_permission_tables',1),(6,'2023_03_18_014247_create_menus_table',1),(7,'2023_03_18_014308_create_role_has_menus_table',1),(8,'2023_03_22_220900_create_akta_pendirians_table',1),(9,'2023_03_22_220914_create_izin_produksis_table',1),(10,'2023_03_22_221246_create_nama_perizinans_table',1),(11,'2023_03_22_221256_create_perizinan_dasars_table',1),(12,'2023_03_22_221330_create_sertifikat_tanahs_table',1),(13,'2023_03_23_010729_create_perjanjian_kerjasamas_table',1),(14,'2025_05_21_142359_add_no_urut_to_variables_table',2),(15,'2025_05_21_142412_add_no_urut_to_variable_table',2),(16,'2025_06_01_130322_add_deleted_at_to_categories_table',3),(17,'2025_06_01_205924_add_timestamps_to_categories_table',4),(18,'2025_06_06_210400_add_subs_to_variables_table',5),(19,'2025_06_06_210513_add_subs_to_variables_table',5),(20,'2025_06_06_220937_add_timestamps_and_softdeletes_to_variables_table',6),(21,'2025_06_06_222602_add_subs_to_assessment_items_table',7),(22,'2025_06_07_211945_add_timestamps_to_methods_table',8),(23,'2025_06_08_185417_create_item_method_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(3,'App\\Models\\User',1);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',3),(3,'App\\Models\\User',5),(3,'App\\Models\\User',6),(3,'App\\Models\\User',7),(3,'App\\Models\\User',8),(3,'App\\Models\\User',9),(3,'App\\Models\\User',11);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'*.update','web',NULL,NULL),(2,'*.delete','web',NULL,NULL),(3,'user.reset-password','web',NULL,NULL),(4,'user.create','web',NULL,NULL),(5,'user.read','web',NULL,NULL),(6,'user.update','web',NULL,NULL),(7,'user.delete','web',NULL,NULL),(8,'child.delete','web',NULL,NULL),(9,'assessment.delete','web',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Kebutuhan khususmu adalah peta yang membimbing kami menuju keajaiban'),(2,'Kesempurnaan tidak ada, tetapi cinta yang tulus adalah keajaiban'),(3,'Dalam pelukanmu, ada kekuatan yang tak terbatas untuk menembus segala rintangan'),(4,'Anakmu bukanlah tantangan untuk diatasi, melainkan hadiah yang tak ternilai'),(5,'Dalam setiap senyum anakmu, terukir keajaiban yang mengharukan'),(6,'Anakmu adalah bukti bahwa cinta sejati tak mengenal batasan'),(7,'Denganmu sebagai pendampingnya, anakmu akan menemukan dunia yang penuh kasih dan pengertian'),(8,'Ketulusanmu adalah bintang yang memandu langkahku dalam kegelapan'),(9,'Ketika kamu merasa lelah, ingatlah bahwa cinta adalah pendorong utamamu'),(10,'Keistimewaan mereka mengajarkan kita arti sejati dari kehidupan'),(11,'Kita adalah garda terdepan dalam mewujudkan mimpi mereka'),(12,'Kesempurnaan terletak pada cinta tak terbatas dari orang tua untuk anaknya'),(13,'Kelembutan hati mereka memperkaya jiwa kita'),(14,'Keberanian mereka mengajarkan kita untuk tidak pernah menyerah'),(15,'Kesabaran adalah kuncinya, cinta adalah jawabannya'),(16,'Anak kita adalah pahlawan sejati dalam cerita kehidupan kita'),(17,'Kekuatan kita teruji dalam perjuangan kita sebagai orang tua');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_menus`
--

DROP TABLE IF EXISTS `role_has_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_has_menus_role_id_menu_id_unique` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_menus`
--

LOCK TABLES `role_has_menus` WRITE;
/*!40000 ALTER TABLE `role_has_menus` DISABLE KEYS */;
INSERT INTO `role_has_menus` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,1,4,NULL,NULL),(5,1,5,NULL,NULL),(6,1,6,NULL,NULL),(7,1,7,NULL,NULL),(8,1,88,NULL,NULL),(9,1,9,NULL,NULL),(10,1,10,NULL,NULL),(11,1,11,NULL,NULL),(12,1,12,NULL,NULL),(13,2,1,NULL,NULL),(14,2,2,NULL,NULL),(15,2,4,NULL,NULL),(16,2,5,NULL,NULL),(17,2,6,NULL,NULL),(18,2,7,NULL,NULL),(19,2,8,NULL,NULL),(20,2,9,NULL,NULL),(21,2,10,NULL,NULL),(22,2,11,NULL,NULL),(23,2,12,NULL,NULL),(24,3,1,NULL,NULL),(25,3,5,NULL,NULL),(26,3,6,NULL,NULL),(33,3,2,NULL,NULL),(34,3,4,NULL,NULL);
/*!40000 ALTER TABLE `role_has_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(8,3),(9,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','web',NULL,NULL),(2,'admin','web',NULL,NULL),(3,'user','web',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_childs`
--

DROP TABLE IF EXISTS `user_has_childs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_childs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_childs`
--

LOCK TABLES `user_has_childs` WRITE;
/*!40000 ALTER TABLE `user_has_childs` DISABLE KEYS */;
INSERT INTO `user_has_childs` VALUES (1,5,1),(2,5,2),(3,8,4),(4,8,5),(5,9,6),(6,11,7);
/*!40000 ALTER TABLE `user_has_childs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_username_unique` (`username`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'super_admin','superadmin@email.com','$2a$12$iBSeUnna0kYLgm2AJZrmHOfZvFGj1pAAdM5A4DY583JZVnhzzGWcO','Super Admin',NULL,'2023-04-04 12:38:40',1,'ViagcDJt5kdcVQzbO15jasogecTlWQU9Wq2dTOaaQQhaHSPPns07Yc4gkeyy','2023-04-04 12:38:40','2025-05-31 12:13:02',NULL),(2,'admin_admin','admin@email.com','$2a$12$CY02wnfgdZTHWKtDr/yRIut6xfDvYrjGs4jYIgHRSsFUiyMH8yIkG','Admin',NULL,'2023-04-04 12:38:40',1,'VCGgLE7kNIoXSeoFyg9KaON7mf6y5YwWkLwZEbFGy73uMN58wYskMTXyLWeM','2023-04-04 12:38:40','2023-04-04 12:38:40',NULL),(3,'user1','user@email.com','$2y$10$0oaWuS8MwZ6OLU.swu0cJe4/PC61knHvsWSPF..Ivp3q49OZeUyh6','User',NULL,'2023-04-04 12:38:40',1,'S0FviODpQAkgFGoOIhiTma1oYyAgI7RNkwwVKv0E5RDu8WsGDWFY5fJi1rJY','2023-04-04 12:38:40','2025-09-17 16:44:24','2025-09-17 16:44:24'),(5,'pandudud@gmail.com','pandudud@gmail.com','$2y$10$CKuMxbEiB/5Ldvju4Xg5l.KotF6wqfCQy.zRykzCxlYqSHrBbFhr2','Pandu Yudhantara','https://lh3.googleusercontent.com/a/ACg8ocI_-wrY960b9VkXx0FwMvmTho0Sfk2gxOEtVmaP0-5UukaEBt7pSg=s96-c',NULL,1,NULL,'2024-04-29 12:55:59','2025-09-17 16:44:27','2025-09-17 16:44:27'),(7,'panduyudhantara@gmail.com','panduyudhantara@gmail.com','$2y$10$kYm/fhxFKApAZt72ty1SPuvK/Peor0kocJv1x.Se.8I3CBmQsEvGK','Pandu Yudhantara','https://lh3.googleusercontent.com/a/ACg8ocKCn20v2e3V71ze2XvQWyuFn6NaxrDFul0vRj5hEvg18nxGQg=s96-c',NULL,1,NULL,'2024-05-16 03:48:19','2025-09-17 16:44:30','2025-09-17 16:44:30'),(8,'bigpoe7@cloudest.my.id','bigpoe7@cloudest.my.id','$2y$10$TWZim2isWuifaw0lJ9AOUORI6YF0omFY9rd/xewDTQiDoeyrlmjmi','Bigpoe7 Bigpoe7','https://lh3.googleusercontent.com/a/ACg8ocJV2HlnwpfzlOQ496g0y8ndYfEUyfkIUq2OzJDmyoLK7a5fRA=s96-c',NULL,1,NULL,'2025-06-06 20:26:08','2025-09-17 16:44:32','2025-09-17 16:44:32'),(9,'nasi.be.guling@gmail.com','nasi.be.guling@gmail.com','$2y$10$zIHFrL5QI5aeChNiEpxwz.hPKsD3zKutb2D5soqztbSJUa5WCYKb.','Putu Widiarsa','https://lh3.googleusercontent.com/a/ACg8ocJgRb-fCvxnNY38Xx86LSfvwn_-T_bPKmKCHLwiHOj16Ks7MJM=s96-c',NULL,1,NULL,'2025-08-13 18:02:52','2025-09-17 16:44:37','2025-09-17 16:44:37'),(11,'ptwdks@gmail.com','ptwdks@gmail.com','$2y$10$WdDeyr6J7JRhKLhWg.hwAe9udKmS.4CgqrLbJtEHPVPPER3yYzMIC','Widiarsa Kurniawan','https://lh3.googleusercontent.com/a/ACg8ocLiRdCWPd3MjRT0jRYeAjwVtQL1d_G0_hVhtN4aXPq9pYwRIrw=s96-c',NULL,1,NULL,'2025-09-17 16:45:17','2025-09-17 16:45:17',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subs` varchar(4) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES (1,'A','Bagaimana Perilaku yang Terjadi pada Anak Saudara?',1,NULL,'2025-06-06 22:17:40',NULL),(2,'B','Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',2,NULL,'2025-06-06 22:18:29',NULL);
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-17  9:46:41
