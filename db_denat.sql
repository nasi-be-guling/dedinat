/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_denat
-- ------------------------------------------------------
-- Server version	10.5.26-MariaDB-0+deb11u2

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
/*!40101 SET character_set_client = utf8 */;
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment_items`
--

LOCK TABLES `assessment_items` WRITE;
/*!40000 ALTER TABLE `assessment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rumus` varchar(255) DEFAULT NULL,
  `footer_diduga` varchar(2000) DEFAULT NULL,
  `footer_normal` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kehilangan Penglihatan (Tuna Netra)','{{1}}+{{2}}>=9||{{2}}>=1','Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 1','Tidak ada jawaban \"Ya\" pada A atau B'),(2,'Kurang Mampu Mendengar (Tuna Rungu)','{{1}}+{{2}}>=9||{{2}}>=1','Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 1','Tidak ada jawaban \"Ya\" pada A atau B'),(3,'Retaldasi Mental (Tuna Grahita)','{{1}}+{{2}}>=7||{{2}}>=1','Jika jawaban \"Ya\" pada A + B >= 7 atau jawaban \"Ya\" pada B >= 1','Tidak ada jawaban \"Ya\" pada A atau B'),(4,'Cacat Tubuh (Tuna Daksa)','{{1}}+{{2}}>=4||{{2}}>=2','Jika jawaban \"Ya\" pada A + B >= 4 atau jawaban \"Ya\" pada B >= 2','Tidak ada jawaban \"Ya\" pada A atau B'),(5,'Gangguan Emosional dan Perilaku (Tuna Laras)','{{1}}>=9','Jika jawaban \"Ya\" pada A >= 9','Tidak ada jawaban \"Ya\"'),(6,'Autis','{{1}}+{{2}}>=9||{{2}}>=4','Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 4','Tidak ada jawaban \"Ya\" pada A atau B'),(7,'ADHD','{{1}}+{{2}}>=10||{{2}}>=2','Jika jawaban \"Ya\" pada A + B >= 10 atau jawaban \"Ya\" pada B >= 2','Tidak ada jawaban \"Ya\" pada A atau B'),(8,'Cerdas Istimewa','{{1}}>=14','Jika jawaban \"Ya\" pada A >= 14','Tidak ada jawaban \"Ya\"');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `childs`
--

DROP TABLE IF EXISTS `childs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `childs`
--

LOCK TABLES `childs` WRITE;
/*!40000 ALTER TABLE `childs` DISABLE KEYS */;
INSERT INTO `childs` VALUES (1,'Test data Anak Sinabus','Testing Alamat Anak Sinabus 1',16,'Disabilitas Intelektual','2024-05-10 09:06:01','2024-06-06 01:56:50','2024-06-06 01:56:50'),(2,'Test data Anak Sinabus','Alamat Anak Sinabus 1',16,'Disabilitas Intelektual','2024-06-06 02:00:22','2024-06-06 02:00:22',NULL);
/*!40000 ALTER TABLE `childs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `method_id` varchar(20) DEFAULT NULL COMMENT 'separator ;',
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_num` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,1,1,'Observasi;Wawancara',NULL,'Sering menabrak orang atau benda?',1,NULL),(2,1,1,'Observasi;Wawancara',NULL,'Sering meletakkan barang di tempat yang salah?',2,NULL),(3,1,1,'Observasi;Wawancara',NULL,'Sering tersandung ketika berjalan?',3,NULL),(4,1,1,'Observasi;Wawancara',NULL,'Sering mengucek-ngucek mata berlebihan? (Bukan kelilipan)',4,NULL),(5,1,1,'Observasi;Wawancara',NULL,'Sering mengedipkan mata?',5,NULL),(6,1,1,'Observasi;Wawancara',NULL,'Sering meniru gerak?',6,NULL),(7,1,1,'Observasi;Wawancara',NULL,'Sulit mengenal gambar jika warna kurang kontras?',7,NULL),(8,1,1,'Observasi;Wawancara',NULL,'Sulit melihat bila kurang cahaya?',8,NULL),(9,1,1,'Observasi;Wawancara',NULL,'Suka meraba-raba benda yang dipegang?',9,NULL),(10,1,1,'Observasi;Wawancara',NULL,'Suka membau sesuatu?',10,NULL),(11,1,1,'Observasi;Wawancara',NULL,'Suka mengarahkan pandangan pada sumber bunyi?',11,NULL),(12,1,1,'Observasi;Wawancara',NULL,'Suka memicingkan mata atau mengerutkan dahi ketika silau?',12,NULL),(13,1,1,'Observasi;Wawancara',NULL,'Mata tidak melihat lurus kedepan saat memandang sesuatu?',13,NULL),(14,1,1,'Observasi;Wawancara',NULL,'Membaca atau menulis dengan jarak dekat?',14,NULL),(15,1,1,'Observasi;Wawancara',NULL,'Sulit menulis garis lurus?',15,NULL),(16,1,1,'Observasi;Wawancara',NULL,'Memegang benda dekat ke muka saat melihat?',16,NULL),(17,2,1,'Observasi',NULL,'Warna bola mata keruh / kering/ bersisik ?',1,NULL),(18,2,1,'Observasi',NULL,'Kedua mata tampak menjorok kedepan ?',2,NULL),(19,2,1,'Observasi',NULL,'Bola mata bergoyang goyang (nistagmus)',3,NULL),(20,2,1,'Observasi',NULL,'Bola mata terlihat mengecil ?',4,NULL),(21,2,1,'Observasi',NULL,'Bagian bola mata berkabut / berwarna putih',5,NULL),(22,1,2,'Observasi',NULL,'Bayi tidak terkejut dengan suara keras yang muncul tiba-tiba',1,NULL),(23,1,2,'Observasi',NULL,'Tidak mengenali suara orang tua pada usia tiga bulan',2,NULL),(24,1,2,'Observasi',NULL,'Tidak menolehkan wajah/ melihat ke arah datangnya suara pada usia enam bulan',3,NULL),(25,1,2,'Wawancara',NULL,'Bayi tidak mampu menirukan suara atau mengucapkan kata pada usia satu tahun',4,NULL),(26,1,2,'Observasi',NULL,'Mengarahkan telinga kepada pembicara ?',5,NULL),(27,1,2,'Observasi',NULL,'Ucapan kata tidak jelas dan sulit dipahami',6,NULL),(28,1,2,'Observasi',NULL,'Tidak memahami perintah (bicara sangat keras) dalam jarak 1 m',7,NULL),(29,1,2,'Observasi',NULL,'Tidak ada reaksi terhadap bunyi di dekatnya lebih 1 meter',8,NULL),(30,1,2,'Observasi',NULL,'Kurang atau tidak tanggap bila diajak bicara',9,NULL),(31,1,2,'Observasi',NULL,'Terlambat dalam perkembangan bahasa',10,NULL),(32,1,2,'Observasi',NULL,'Banyak perhatian terhadap getaran',11,NULL),(33,1,2,'Observasi',NULL,'Menatap bibir dan muka pembicara',12,NULL),(34,1,2,'Observasi',NULL,'Suara membaca dan bicara keras',13,NULL),(35,1,2,'Observasi',NULL,'Membantu telinga denga tangan',14,NULL),(36,1,2,'Observasi',NULL,'Respon pada bunyi-bunyian tapi tidak pada suara',15,NULL),(37,2,2,'Wawancara',NULL,'Berteriak , memekik untuk mengekspresikan kegembiraan, keinginan , kemarahan dan kebutuhan',1,NULL),(38,2,2,'Wawancara',NULL,'Sering keras kepala',2,NULL),(39,2,2,'Observasi;Wawancara',NULL,'Dominan dalam pemakaian isyarat',3,NULL),(40,2,2,'Observasi',NULL,'Sedikit tertawa dalam permainan',4,NULL),(41,2,2,'Observasi',NULL,'Tertarik pada benda terlebih dahulu daripada orang lain',5,NULL),(42,1,3,'Observasi;Wawancara',NULL,'Terlambat bicara, duduk, merangkak atau berguling.',1,NULL),(43,1,3,'Observasi;Wawancara',NULL,'Sulit mengingat',2,NULL),(44,1,3,'Observasi;Wawancara',NULL,'Lambat menguasai kemampuan mendasar, seperti makan sendiri, berpakaian ataupun buang air di toilet.',3,NULL),(45,1,3,'Observasi;Wawancara',NULL,'Tidak dapat menghubungkan antara tindakan dengan konsekuensi dari tindakan',4,NULL),(46,1,3,'Observasi;Wawancara',NULL,'Sulit berpikir logis maupun memecahkan persoalan ringan',5,NULL),(47,1,3,'Observasi;Wawancara',NULL,'Memiliki kesulitan memahami aturan social',6,NULL),(48,1,3,'Observasi;Wawancara',NULL,'Memiliki kesulitan dalam mengendalikan sikap atau gerakannya',7,NULL),(49,1,3,'Observasi;Wawancara',NULL,'Selalu bergantung pada orang lain',8,NULL),(50,2,3,'Observasi',NULL,'Jari kaki masuk ke dalam dan tangan pendek tebal',1,NULL),(51,2,3,'Observasi',NULL,'Alis tumbuh mengikuti garis ke atas keluar (Epicantus)',2,NULL),(52,2,3,'Observasi',NULL,'Mulut membuka dan berair liur',3,NULL),(53,2,3,'Observasi',NULL,'Wajah datar dengan telinga rendah',4,NULL),(54,2,3,'Observasi',NULL,'Suara datar, bibir tebal',5,NULL),(55,2,3,'Observasi',NULL,'Postur tubuh pendek dan kepala kecil',6,NULL),(56,2,3,'Observasi',NULL,'Mata sipit , miring dan juling',7,NULL),(57,2,3,'Observasi',NULL,'Kepala bagian belakang pipih, rambut jarang dan tipis',8,NULL),(58,2,3,'Observasi',NULL,'Rambut tegak kaku kasar',9,NULL),(59,1,4,'Observasi;Wawancara',NULL,'Kejang saat marah atau dalam keadaan tenang tanpa ada kenaikan suhu tubuh normal 36.5<sup>o</sup>C – 37<sup>o</sup>C',1,NULL),(60,1,4,'Observasi;Wawancara',NULL,'Terdapat anggota tubuh yang tremor/ bergerak-gerak terus menerus tidak terkendali',2,NULL),(61,1,4,'Observasi;Wawancara',NULL,'Gangguan koordinasi gerak',3,NULL),(62,1,4,'Observasi;Wawancara',NULL,'Bila jalan gontai (sempoyongan)',4,NULL),(63,1,4,'Observasi;Wawancara',NULL,'Mudah tersinggung, marah,rendah diri, pemalu , menyendiri, kurang dapat bergaul, frustasi',5,NULL),(64,1,4,'Observasi;Wawancara',NULL,'Hiperaktif ( tidak mau diam, gelisah)',6,NULL),(65,1,4,'Observasi;Wawancara',NULL,'Hipoaktif ( pendiam, gerakan lamban,kurang respon)',7,NULL),(66,2,4,'Observasi',NULL,'Anggota gerak tubuh kaku/lemah/lumpuh',1,NULL),(67,2,4,'Observasi',NULL,'Terdapat bagian anggota gerak yang berbeda dari biasa (lebih kecil/besar/panjang/pendek)',2,NULL),(68,2,4,'Observasi',NULL,'Gangguan pendengaran',3,NULL),(69,2,4,'Observasi;Wawancara',NULL,'Gangguan penglihatan',4,NULL),(70,2,4,'Observasi;Wawancara',NULL,'Gangguan bicara',5,NULL),(71,2,4,'Observasi;Wawancara',NULL,'Kehilangan/ketidaksempuran sebagian anggota tubuh',6,NULL),(72,1,5,'Observasi;Wawancara',NULL,'Sering berkelahi',1,NULL),(73,1,5,'Observasi;Wawancara',NULL,'Sering membangkang / melawan',2,NULL),(74,1,5,'Observasi;Wawancara',NULL,'Sering bicara cabul',3,NULL),(75,1,5,'Observasi;Wawancara',NULL,'Sering mencuri',4,NULL),(76,1,5,'Observasi;Wawancara',NULL,'Sering melakukan tindakan agresif, merusak, mengganggu',5,NULL),(77,1,5,'Observasi;Wawancara',NULL,'Sering bertindak melanggar norma sosial/norma susila/hukum',6,NULL),(78,1,5,'Observasi;Wawancara',NULL,'Sering berbohong',7,NULL),(79,1,5,'Observasi;Wawancara',NULL,'Mudah terpancing emosinya',8,NULL),(80,1,5,'Observasi;Wawancara',NULL,'Kemampuan perhatian pendek',9,NULL),(81,1,5,'Observasi;Wawancara',NULL,'Tindak kekejaman fisik pada manusia maupun binatang',10,NULL),(82,1,5,'Observasi;Wawancara',NULL,'Mudah bosan dan pasif',11,NULL),(83,1,5,'Observasi;Wawancara',NULL,'Kurang mampu bersosialisasi dengan teman sebaya',12,NULL),(84,1,5,'Observasi;Wawancara',NULL,'Kecemasan berlebihan, menarik/menutup diri',13,NULL),(85,1,5,'Observasi;Wawancara',NULL,'Marah dengan emosi yang meledak-ledak',14,NULL),(86,1,5,'Observasi;Wawancara',NULL,'Berteriak kepada orang yang lebih tua (khususnya orangtua sendiri)',15,NULL),(87,1,5,'Observasi;Wawancara',NULL,'Suka melempar sesuatu, seperti mainan di rumah dan di sekolah?',16,NULL),(88,1,6,'Observasi;Wawancara',NULL,'Usia 2 - 3 bulan bayi tidak sering melakukan kontak mata',1,NULL),(89,1,6,'Observasi;Wawancara',NULL,'Usia 3 bulan bayi tidak tersenyum ketika diajak bercanda',2,NULL),(90,1,6,'Observasi;Wawancara',NULL,'Usia 6 bulan bayi tidak tertawa atau membuat ekspresi gembira lainnya',3,NULL),(91,1,6,'Observasi;Wawancara',NULL,'Usia 1 tahun bayi tidak merespons atau menoleh ketika namanya dipanggil',4,NULL),(92,1,6,'Observasi;Wawancara',NULL,'Usia 16 bulan bayi tidak berkata-kata',5,NULL),(93,1,6,'Observasi;Wawancara',NULL,'Usia 24 bulan, bayi tidak bisa mengucapkan dua kata yang memiliki arti',6,NULL),(94,1,6,'Observasi;Wawancara',NULL,'Tak dapat bermain dengan teman sebaya',7,NULL),(95,1,6,'Observasi;Wawancara',NULL,'Tak ada empati',8,NULL),(96,1,6,'Observasi;Wawancara',NULL,'Kurang mampu mengadakan hubungan sosial dan emosional',9,NULL),(97,1,6,'Observasi;Wawancara',NULL,'Sering menggunakan bahasa yang aneh dan diulang-ulang.',10,NULL),(98,1,6,'Observasi;Wawancara',NULL,'Cara bermain yang kurang variatif, kurang imajinatif, dan kurang dapat meniru.',11,NULL),(99,1,6,'Observasi;Wawancara',NULL,'Mempertahankan satu minat / lebih dengan cara yang sangat khas dan berlebihan.',12,NULL),(100,1,6,'Observasi;Wawancara',NULL,'Terpaku pada suatu kegiatan yang rutinitas yang tak ada gunanya.',13,NULL),(101,1,6,'Observasi;Wawancara',NULL,'Ada gerakan aneh yang khas dan diulang-ulang (ngepakan – tangan, memukulmukul kepala)',14,NULL),(102,1,6,'Observasi;Wawancara',NULL,'Sering kali sangat terpukau pada bagian-bagian benda.',15,NULL),(103,1,6,'Observasi;Wawancara',NULL,'Tidak suka dipeluk',16,NULL),(104,1,6,'Observasi;Wawancara',NULL,'Suka berjalan dengan “jinjit\"/ menggoyang-goyangkan tubuh',17,NULL),(105,1,6,'Observasi;Wawancara',NULL,'Jarang sekali memulai komunikasi',18,NULL),(106,2,6,'Observasi',NULL,'Ekspresi muka kurang hidup/datar',1,NULL),(107,2,6,'Observasi',NULL,'Memiliki bahasa atau gerakan tubuh yang cenderung kaku',2,NULL),(108,2,6,'Wawancara',NULL,'Sulit tidur',3,NULL),(109,2,6,'Observasi',NULL,'Memiliki wajah yang lebih lebar, termasuk mata yang lebih lebar',4,NULL),(110,2,6,'Observasi',NULL,'Bagian tengah wajahnya lebih pendek, termasuk pipi dan hidung',5,NULL),(111,2,6,'Observasi',NULL,'Ukuran mulut dan philtrum ( lekukan antara hidung dan bibir) lebih lebar',6,NULL),(112,1,7,'Perintah',NULL,'Untuk usia 4 tahun, tidak bisa melompat dengan satu kaki.',1,NULL),(113,1,7,'Observasi',NULL,'Selalu bergerak seperti menggoyangkan lutut terus-menerus, tidak bisa duduk tanpa menggeliat, atau kaki yang selalu bergerak, disertai gerakan naik-turun',2,NULL),(114,1,7,'Observasi',NULL,'Sering berlari atau memanjat berlebihan dalam situasi yang tidak sesuai',3,NULL),(115,1,7,'Observasi',NULL,'Kesulitan bermain dengan tenang',4,NULL),(116,1,7,'Observasi',NULL,'Tidak bisa fokus lebih dari beberapa menit.',5,NULL),(117,1,7,'Observasi',NULL,'Sering bicara berlebihan',6,NULL),(118,1,7,'Observasi',NULL,'Lebih berisik dibanding teman bermainnya.',7,NULL),(119,1,7,'Observasi',NULL,'Tidak takut pada situasi yang bisa membahayakan anak.',8,NULL),(120,1,7,'Observasi;Wawancara',NULL,'Sangat mudah frustasi dan kesulitan mengatur emosi/ temperamen',9,NULL),(121,1,7,'Wawancara',NULL,'Suka menyela atau memaksakan diri terhadap orang lain',10,NULL),(122,1,7,'Observasi',NULL,'Membuat kesalahan pada hal kecil (ceroboh)',11,NULL),(123,1,7,'Observasi',NULL,'Sulit mempertahankan perhatian',12,NULL),(124,1,7,'Observasi',NULL,'Perilakunya seperti tidak mendengarkan saat diajak bicara langsung',13,NULL),(125,1,7,'Perintah',NULL,'Gagal menyelesaikan pekerjaan',14,NULL),(126,1,7,'Observasi;Wawancara',NULL,'Sulit mengatur tugas dan kegiatan',15,NULL),(127,1,7,'Observasi;Wawancara',NULL,'Enggan terlibat dalam tugas yang memerlukan ketekunan',16,NULL),(128,1,7,'Observasi',NULL,'Perhatian mudah teralih oleh rangsangan dari luar',17,NULL),(129,2,7,'Observasi',NULL,'Berlari dan bergerak sangat cepat',1,NULL),(130,2,7,'Observasi',NULL,'Pengeluaran air liur dari mulut yang tidak terkontrol',2,NULL),(131,2,7,'Observasi',NULL,'Postur tubuhnya terlihat tidak simetris',3,NULL),(132,1,8,'Observasi',NULL,'Membaca pada usia kurang dari 6 tahun,',1,NULL),(133,1,8,'Observasi;Wawancara',NULL,'Membaca lebih cepat dan lebih banyak,',2,NULL),(134,1,8,'Observasi;Wawancara',NULL,'Memiliki perbendaharaan kata yang luas,',3,NULL),(135,1,8,'Observasi;Wawancara',NULL,'Mempunyai rasa ingin tahu yang kuat',4,NULL),(136,1,8,'Observasi;Wawancara',NULL,'Mempunyai pengamatan yang tajam',5,NULL),(137,1,8,'Observasi;Wawancara',NULL,'Mempunyai inisitif dan dapat bekerja sendiri,',6,NULL),(138,1,8,'Observasi;Wawancara',NULL,'Mempunyai Kemampuan Verbal yang Baik',7,NULL),(139,1,8,'Observasi',NULL,'Cepat belajar mengenali wajah dan suara pada orang yang berbeda.',8,NULL),(140,1,8,'Observasi',NULL,'Waktu tidur sedikit tetapi tidak rewel karena lelah.',9,NULL),(141,1,8,'Observasi',NULL,'Senang mencoba hal-hal baru',10,NULL),(142,1,8,'Observasi;Wawancara',NULL,'Mempunyai daya ingat yang kuat',11,NULL),(143,1,8,'Observasi;Wawancara',NULL,'Banyak bertanya',12,NULL),(144,1,8,'Observasi;Wawancara',NULL,'Memiliki kemampuan belajar yang cepat',13,NULL),(145,1,8,'Observasi',NULL,'Memperlihatkan konsentrasi yang sungguh-sungguh',14,NULL),(146,1,8,'Observasi;Wawancara',NULL,'Senang Menjadi Pemimpin',15,NULL),(147,1,8,'Perintah',NULL,'Perhatian terhadap detil',16,NULL),(148,1,8,'Observasi',NULL,'Stabil secara emosi (mampu mengendalikan diri)',17,NULL),(149,1,8,'Wawancara',NULL,'Dapat memahami instruksi dengan mudah.)',18,NULL),(150,1,8,'Observasi;Wawancara',NULL,'Kreatif dan daya imajinasi tinggi',19,NULL),(151,1,8,'Observasi;Wawancara',NULL,'Memiliki kemampuan berpikir cepat dan tepat.',20,NULL),(152,1,8,'Observasi;Wawancara',NULL,'Jeli dan Memiliki Minat Kuat',21,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,NULL,'/home','Home','ti-smart-home',1,0,NULL,NULL,NULL),(2,NULL,'/master','Data Master','ti-lifebuoy',2,0,NULL,NULL,NULL),(3,2,'/master/user','Data Pengguna','ti-users',1,0,NULL,NULL,NULL),(4,2,'/master/child','Data Anak','ti-user-heart',2,0,NULL,NULL,NULL),(5,NULL,'assessment','ASESMEN',NULL,3,1,NULL,NULL,NULL),(6,NULL,'/assessment','Asesmen','ti-address-book',4,0,NULL,NULL,NULL),(7,2,'/master/variable','Variable','ti-file-analytics',3,0,NULL,NULL,NULL),(8,2,'/master/item','Item','ti-file-certificate',4,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `methods` (
  `id` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methods`
--

LOCK TABLES `methods` WRITE;
/*!40000 ALTER TABLE `methods` DISABLE KEYS */;
INSERT INTO `methods` VALUES ('o','Observasi'),('p','Perintah'),('w','Wawancara');
/*!40000 ALTER TABLE `methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_03_02_110211_create_permission_tables',1),(6,'2023_03_18_014247_create_menus_table',1),(7,'2023_03_18_014308_create_role_has_menus_table',1),(8,'2023_03_22_220900_create_akta_pendirians_table',1),(9,'2023_03_22_220914_create_izin_produksis_table',1),(10,'2023_03_22_221246_create_nama_perizinans_table',1),(11,'2023_03_22_221256_create_perizinan_dasars_table',1),(12,'2023_03_22_221330_create_sertifikat_tanahs_table',1),(13,'2023_03_23_010729_create_perjanjian_kerjasamas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',3),(3,'App\\Models\\User',5),(3,'App\\Models\\User',6),(3,'App\\Models\\User',7);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_has_menus_role_id_menu_id_unique` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_childs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_childs`
--

LOCK TABLES `user_has_childs` WRITE;
/*!40000 ALTER TABLE `user_has_childs` DISABLE KEYS */;
INSERT INTO `user_has_childs` VALUES (1,5,1),(2,5,2);
/*!40000 ALTER TABLE `user_has_childs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'superadmin','superadmin@email.com','$2y$10$FPpW3pFi3ZKBurbmDIo/4eMYWB1q7RCllEMLHW8ohr1PVuIWP4FB6','Super Admin',NULL,'2023-04-04 12:38:40',1,'ViagcDJt5kdcVQzbO15jasogecTlWQU9Wq2dTOaaQQhaHSPPns07Yc4gkeyy','2023-04-04 12:38:40','2023-04-04 12:38:40',NULL),(2,'admin','admin@email.com','$2y$10$nfLyU15SvvLmJmm5BUH2FeDOb6IKq2X/FJNO7/j74jjnM4feOQtGW','Admin',NULL,'2023-04-04 12:38:40',1,'VCGgLE7kNIoXSeoFyg9KaON7mf6y5YwWkLwZEbFGy73uMN58wYskMTXyLWeM','2023-04-04 12:38:40','2023-04-04 12:38:40',NULL),(3,'user1','user@email.com','$2y$10$0oaWuS8MwZ6OLU.swu0cJe4/PC61knHvsWSPF..Ivp3q49OZeUyh6','User',NULL,'2023-04-04 12:38:40',1,'S0FviODpQAkgFGoOIhiTma1oYyAgI7RNkwwVKv0E5RDu8WsGDWFY5fJi1rJY','2023-04-04 12:38:40','2024-04-28 18:06:11',NULL),(5,'pandudud@gmail.com','pandudud@gmail.com','$2y$10$CKuMxbEiB/5Ldvju4Xg5l.KotF6wqfCQy.zRykzCxlYqSHrBbFhr2','Pandu Yudhantara','https://lh3.googleusercontent.com/a/ACg8ocI_-wrY960b9VkXx0FwMvmTho0Sfk2gxOEtVmaP0-5UukaEBt7pSg=s96-c',NULL,1,NULL,'2024-04-29 12:55:59','2024-05-10 02:20:56',NULL),(7,'panduyudhantara@gmail.com','panduyudhantara@gmail.com','$2y$10$kYm/fhxFKApAZt72ty1SPuvK/Peor0kocJv1x.Se.8I3CBmQsEvGK','Pandu Yudhantara','https://lh3.googleusercontent.com/a/ACg8ocKCn20v2e3V71ze2XvQWyuFn6NaxrDFul0vRj5hEvg18nxGQg=s96-c',NULL,1,NULL,'2024-05-16 03:48:19','2024-05-16 03:48:19',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES (1,'Bagaimana Perilaku yang Terjadi pada Anak Saudara?',1),(2,'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?',2);
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

-- Dump completed on 2025-05-20  8:40:10
