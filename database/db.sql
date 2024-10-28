/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7@localhost
 Source Server Type    : MySQL
 Source Server Version : 50734 (5.7.34)
 Source Host           : localhost:3306
 Source Schema         : denat

 Target Server Type    : MySQL
 Target Server Version : 50734 (5.7.34)
 File Encoding         : 65001

 Date: 28/10/2024 10:53:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assessment_items
-- ----------------------------
DROP TABLE IF EXISTS `assessment_items`;
CREATE TABLE `assessment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) DEFAULT NULL,
  `variable_id` int(11) DEFAULT NULL,
  `variable_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_variable_id` int(11) DEFAULT NULL,
  `item_item_id` int(11) DEFAULT NULL,
  `item_kategori` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `item_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `item_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `item_no_urut` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of assessment_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for assessments
-- ----------------------------
DROP TABLE IF EXISTS `assessments`;
CREATE TABLE `assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `score_yes` int(11) DEFAULT NULL,
  `score_no` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `score_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Diduga / Normal',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of assessments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rumus` varchar(255) DEFAULT NULL,
  `footer_diduga` varchar(2000) DEFAULT NULL,
  `footer_normal` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (1, 'Kehilangan Penglihatan (Tuna Netra)', '{{1}}+{{2}}>=9||{{2}}>=1', 'Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 1', 'Tidak ada jawaban \"Ya\" pada A atau B');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (2, 'Kurang Mampu Mendengar (Tuna Rungu)', '{{1}}+{{2}}>=9||{{2}}>=1', 'Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 1', 'Tidak ada jawaban \"Ya\" pada A atau B');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (3, 'Retaldasi Mental (Tuna Grahita)', '{{1}}+{{2}}>=7||{{2}}>=1', 'Jika jawaban \"Ya\" pada A + B >= 7 atau jawaban \"Ya\" pada B >= 1', 'Tidak ada jawaban \"Ya\" pada A atau B');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (4, 'Cacat Tubuh (Tuna Daksa)', '{{1}}+{{2}}>=4||{{2}}>=2', 'Jika jawaban \"Ya\" pada A + B >= 4 atau jawaban \"Ya\" pada B >= 2', 'Tidak ada jawaban \"Ya\" pada A atau B');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (5, 'Gangguan Emosional dan Perilaku (Tuna Laras)', '{{1}}>=9', 'Jika jawaban \"Ya\" pada A >= 9', 'Tidak ada jawaban \"Ya\"');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (6, 'Autis', '{{1}}+{{2}}>=9||{{2}}>=4', 'Jika jawaban \"Ya\" pada A + B >= 9 atau jawaban \"Ya\" pada B >= 4', 'Tidak ada jawaban \"Ya\" pada A atau B');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (7, 'ADHD', '{{1}}+{{2}}>=10||{{2}}>=2', 'Jika jawaban \"Ya\" pada A + B >= 10 atau jawaban \"Ya\" pada B >= 2', 'Tidak ada jawaban \"Ya\" pada A atau B');
INSERT INTO `categories` (`id`, `name`, `rumus`, `footer_diduga`, `footer_normal`) VALUES (8, 'Cerdas Istimewa', '{{1}}>=14', 'Jika jawaban \"Ya\" pada A >= 14', 'Tidak ada jawaban \"Ya\"');
COMMIT;

-- ----------------------------
-- Table structure for childs
-- ----------------------------
DROP TABLE IF EXISTS `childs`;
CREATE TABLE `childs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `alamat` text CHARACTER SET utf8,
  `umur` int(12) DEFAULT NULL,
  `jenis_kebutuhan` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of childs
-- ----------------------------
BEGIN;
INSERT INTO `childs` (`id`, `nama`, `alamat`, `umur`, `jenis_kebutuhan`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'Test data Anak Sinabus', 'Testing Alamat Anak Sinabus 1', 16, 'Disabilitas Intelektual', '2024-05-10 09:06:01', '2024-06-06 01:56:50', '2024-06-06 01:56:50');
INSERT INTO `childs` (`id`, `nama`, `alamat`, `umur`, `jenis_kebutuhan`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'Test data Anak Sinabus', 'Alamat Anak Sinabus 1', 16, 'Disabilitas Intelektual', '2024-06-06 02:00:22', '2024-06-06 02:00:22', NULL);
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `method_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'separator ;',
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `order_num` int(11) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of items
-- ----------------------------
BEGIN;
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (1, 1, 1, 'Observasi;Wawancara', NULL, 'Sering menabrak orang atau benda?', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (2, 1, 1, 'Observasi;Wawancara', NULL, 'Sering meletakkan barang di tempat yang salah?', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (3, 1, 1, 'Observasi;Wawancara', NULL, 'Sering tersandung ketika berjalan?', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (4, 1, 1, 'Observasi;Wawancara', NULL, 'Sering mengucek-ngucek mata berlebihan? (Bukan kelilipan)', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (5, 1, 1, 'Observasi;Wawancara', NULL, 'Sering mengedipkan mata?', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (6, 1, 1, 'Observasi;Wawancara', NULL, 'Sering meniru gerak?', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (7, 1, 1, 'Observasi;Wawancara', NULL, 'Sulit mengenal gambar jika warna kurang kontras?', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (8, 1, 1, 'Observasi;Wawancara', NULL, 'Sulit melihat bila kurang cahaya?', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (9, 1, 1, 'Observasi;Wawancara', NULL, 'Suka meraba-raba benda yang dipegang?', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (10, 1, 1, 'Observasi;Wawancara', NULL, 'Suka membau sesuatu?', 10, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (11, 1, 1, 'Observasi;Wawancara', NULL, 'Suka mengarahkan pandangan pada sumber bunyi?', 11, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (12, 1, 1, 'Observasi;Wawancara', NULL, 'Suka memicingkan mata atau mengerutkan dahi ketika silau?', 12, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (13, 1, 1, 'Observasi;Wawancara', NULL, 'Mata tidak melihat lurus kedepan saat memandang sesuatu?', 13, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (14, 1, 1, 'Observasi;Wawancara', NULL, 'Membaca atau menulis dengan jarak dekat?', 14, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (15, 1, 1, 'Observasi;Wawancara', NULL, 'Sulit menulis garis lurus?', 15, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (16, 1, 1, 'Observasi;Wawancara', NULL, 'Memegang benda dekat ke muka saat melihat?', 16, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (17, 2, 1, 'Observasi', NULL, 'Warna bola mata keruh / kering/ bersisik ?', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (18, 2, 1, 'Observasi', NULL, 'Kedua mata tampak menjorok kedepan ?', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (19, 2, 1, 'Observasi', NULL, 'Bola mata bergoyang goyang (nistagmus)', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (20, 2, 1, 'Observasi', NULL, 'Bola mata terlihat mengecil ?', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (21, 2, 1, 'Observasi', NULL, 'Bagian bola mata berkabut / berwarna putih', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (22, 1, 2, 'Observasi', NULL, 'Bayi tidak terkejut dengan suara keras yang muncul tiba-tiba', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (23, 1, 2, 'Observasi', NULL, 'Tidak mengenali suara orang tua pada usia tiga bulan', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (24, 1, 2, 'Observasi', NULL, 'Tidak menolehkan wajah/ melihat ke arah datangnya suara pada usia enam bulan', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (25, 1, 2, 'Wawancara', NULL, 'Bayi tidak mampu menirukan suara atau mengucapkan kata pada usia satu tahun', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (26, 1, 2, 'Observasi', NULL, 'Mengarahkan telinga kepada pembicara ?', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (27, 1, 2, 'Observasi', NULL, 'Ucapan kata tidak jelas dan sulit dipahami', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (28, 1, 2, 'Observasi', NULL, 'Tidak memahami perintah (bicara sangat keras) dalam jarak 1 m', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (29, 1, 2, 'Observasi', NULL, 'Tidak ada reaksi terhadap bunyi di dekatnya lebih 1 meter', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (30, 1, 2, 'Observasi', NULL, 'Kurang atau tidak tanggap bila diajak bicara', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (31, 1, 2, 'Observasi', NULL, 'Terlambat dalam perkembangan bahasa', 10, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (32, 1, 2, 'Observasi', NULL, 'Banyak perhatian terhadap getaran', 11, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (33, 1, 2, 'Observasi', NULL, 'Menatap bibir dan muka pembicara', 12, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (34, 1, 2, 'Observasi', NULL, 'Suara membaca dan bicara keras', 13, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (35, 1, 2, 'Observasi', NULL, 'Membantu telinga denga tangan', 14, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (36, 1, 2, 'Observasi', NULL, 'Respon pada bunyi-bunyian tapi tidak pada suara', 15, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (37, 2, 2, 'Wawancara', NULL, 'Berteriak , memekik untuk mengekspresikan kegembiraan, keinginan , kemarahan dan kebutuhan', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (38, 2, 2, 'Wawancara', NULL, 'Sering keras kepala', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (39, 2, 2, 'Observasi;Wawancara', NULL, 'Dominan dalam pemakaian isyarat', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (40, 2, 2, 'Observasi', NULL, 'Sedikit tertawa dalam permainan', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (41, 2, 2, 'Observasi', NULL, 'Tertarik pada benda terlebih dahulu daripada orang lain', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (42, 1, 3, 'Observasi;Wawancara', NULL, 'Terlambat bicara, duduk, merangkak atau berguling.', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (43, 1, 3, 'Observasi;Wawancara', NULL, 'Sulit mengingat', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (44, 1, 3, 'Observasi;Wawancara', NULL, 'Lambat menguasai kemampuan mendasar, seperti makan sendiri, berpakaian ataupun buang air di toilet.', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (45, 1, 3, 'Observasi;Wawancara', NULL, 'Tidak dapat menghubungkan antara tindakan dengan konsekuensi dari tindakan', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (46, 1, 3, 'Observasi;Wawancara', NULL, 'Sulit berpikir logis maupun memecahkan persoalan ringan', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (47, 1, 3, 'Observasi;Wawancara', NULL, 'Memiliki kesulitan memahami aturan social', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (48, 1, 3, 'Observasi;Wawancara', NULL, 'Memiliki kesulitan dalam mengendalikan sikap atau gerakannya', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (49, 1, 3, 'Observasi;Wawancara', NULL, 'Selalu bergantung pada orang lain', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (50, 2, 3, 'Observasi', NULL, 'Jari kaki masuk ke dalam dan tangan pendek tebal', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (51, 2, 3, 'Observasi', NULL, 'Alis tumbuh mengikuti garis ke atas keluar (Epicantus)', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (52, 2, 3, 'Observasi', NULL, 'Mulut membuka dan berair liur', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (53, 2, 3, 'Observasi', NULL, 'Wajah datar dengan telinga rendah', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (54, 2, 3, 'Observasi', NULL, 'Suara datar, bibir tebal', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (55, 2, 3, 'Observasi', NULL, 'Postur tubuh pendek dan kepala kecil', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (56, 2, 3, 'Observasi', NULL, 'Mata sipit , miring dan juling', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (57, 2, 3, 'Observasi', NULL, 'Kepala bagian belakang pipih, rambut jarang dan tipis', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (58, 2, 3, 'Observasi', NULL, 'Rambut tegak kaku kasar', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (59, 1, 4, 'Observasi;Wawancara', NULL, 'Kejang saat marah atau dalam keadaan tenang tanpa ada kenaikan suhu tubuh normal 36.5<sup>o</sup>C – 37<sup>o</sup>C', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (60, 1, 4, 'Observasi;Wawancara', NULL, 'Terdapat anggota tubuh yang tremor/ bergerak-gerak terus menerus tidak terkendali', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (61, 1, 4, 'Observasi;Wawancara', NULL, 'Gangguan koordinasi gerak', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (62, 1, 4, 'Observasi;Wawancara', NULL, 'Bila jalan gontai (sempoyongan)', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (63, 1, 4, 'Observasi;Wawancara', NULL, 'Mudah tersinggung, marah,rendah diri, pemalu , menyendiri, kurang dapat bergaul, frustasi', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (64, 1, 4, 'Observasi;Wawancara', NULL, 'Hiperaktif ( tidak mau diam, gelisah)', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (65, 1, 4, 'Observasi;Wawancara', NULL, 'Hipoaktif ( pendiam, gerakan lamban,kurang respon)', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (66, 2, 4, 'Observasi', NULL, 'Anggota gerak tubuh kaku/lemah/lumpuh', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (67, 2, 4, 'Observasi', NULL, 'Terdapat bagian anggota gerak yang berbeda dari biasa (lebih kecil/besar/panjang/pendek)', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (68, 2, 4, 'Observasi', NULL, 'Gangguan pendengaran', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (69, 2, 4, 'Observasi;Wawancara', NULL, 'Gangguan penglihatan', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (70, 2, 4, 'Observasi;Wawancara', NULL, 'Gangguan bicara', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (71, 2, 4, 'Observasi;Wawancara', NULL, 'Kehilangan/ketidaksempuran sebagian anggota tubuh', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (72, 1, 5, 'Observasi;Wawancara', NULL, 'Sering berkelahi', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (73, 1, 5, 'Observasi;Wawancara', NULL, 'Sering membangkang / melawan', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (74, 1, 5, 'Observasi;Wawancara', NULL, 'Sering bicara cabul', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (75, 1, 5, 'Observasi;Wawancara', NULL, 'Sering mencuri', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (76, 1, 5, 'Observasi;Wawancara', NULL, 'Sering melakukan tindakan agresif, merusak, mengganggu', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (77, 1, 5, 'Observasi;Wawancara', NULL, 'Sering bertindak melanggar norma sosial/norma susila/hukum', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (78, 1, 5, 'Observasi;Wawancara', NULL, 'Sering berbohong', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (79, 1, 5, 'Observasi;Wawancara', NULL, 'Mudah terpancing emosinya', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (80, 1, 5, 'Observasi;Wawancara', NULL, 'Kemampuan perhatian pendek', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (81, 1, 5, 'Observasi;Wawancara', NULL, 'Tindak kekejaman fisik pada manusia maupun binatang', 10, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (82, 1, 5, 'Observasi;Wawancara', NULL, 'Mudah bosan dan pasif', 11, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (83, 1, 5, 'Observasi;Wawancara', NULL, 'Kurang mampu bersosialisasi dengan teman sebaya', 12, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (84, 1, 5, 'Observasi;Wawancara', NULL, 'Kecemasan berlebihan, menarik/menutup diri', 13, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (85, 1, 5, 'Observasi;Wawancara', NULL, 'Marah dengan emosi yang meledak-ledak', 14, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (86, 1, 5, 'Observasi;Wawancara', NULL, 'Berteriak kepada orang yang lebih tua (khususnya orangtua sendiri)', 15, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (87, 1, 5, 'Observasi;Wawancara', NULL, 'Suka melempar sesuatu, seperti mainan di rumah dan di sekolah?', 16, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (88, 1, 6, 'Observasi;Wawancara', NULL, 'Usia 2 - 3 bulan bayi tidak sering melakukan kontak mata', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (89, 1, 6, 'Observasi;Wawancara', NULL, 'Usia 3 bulan bayi tidak tersenyum ketika diajak bercanda', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (90, 1, 6, 'Observasi;Wawancara', NULL, 'Usia 6 bulan bayi tidak tertawa atau membuat ekspresi gembira lainnya', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (91, 1, 6, 'Observasi;Wawancara', NULL, 'Usia 1 tahun bayi tidak merespons atau menoleh ketika namanya dipanggil', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (92, 1, 6, 'Observasi;Wawancara', NULL, 'Usia 16 bulan bayi tidak berkata-kata', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (93, 1, 6, 'Observasi;Wawancara', NULL, 'Usia 24 bulan, bayi tidak bisa mengucapkan dua kata yang memiliki arti', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (94, 1, 6, 'Observasi;Wawancara', NULL, 'Tak dapat bermain dengan teman sebaya', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (95, 1, 6, 'Observasi;Wawancara', NULL, 'Tak ada empati', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (96, 1, 6, 'Observasi;Wawancara', NULL, 'Kurang mampu mengadakan hubungan sosial dan emosional', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (97, 1, 6, 'Observasi;Wawancara', NULL, 'Sering menggunakan bahasa yang aneh dan diulang-ulang.', 10, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (98, 1, 6, 'Observasi;Wawancara', NULL, 'Cara bermain yang kurang variatif, kurang imajinatif, dan kurang dapat meniru.', 11, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (99, 1, 6, 'Observasi;Wawancara', NULL, 'Mempertahankan satu minat / lebih dengan cara yang sangat khas dan berlebihan.', 12, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (100, 1, 6, 'Observasi;Wawancara', NULL, 'Terpaku pada suatu kegiatan yang rutinitas yang tak ada gunanya.', 13, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (101, 1, 6, 'Observasi;Wawancara', NULL, 'Ada gerakan aneh yang khas dan diulang-ulang (ngepakan – tangan, memukulmukul kepala)', 14, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (102, 1, 6, 'Observasi;Wawancara', NULL, 'Sering kali sangat terpukau pada bagian-bagian benda.', 15, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (103, 1, 6, 'Observasi;Wawancara', NULL, 'Tidak suka dipeluk', 16, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (104, 1, 6, 'Observasi;Wawancara', NULL, 'Suka berjalan dengan “jinjit\"/ menggoyang-goyangkan tubuh', 17, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (105, 1, 6, 'Observasi;Wawancara', NULL, 'Jarang sekali memulai komunikasi', 18, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (106, 2, 6, 'Observasi', NULL, 'Ekspresi muka kurang hidup/datar', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (107, 2, 6, 'Observasi', NULL, 'Memiliki bahasa atau gerakan tubuh yang cenderung kaku', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (108, 2, 6, 'Wawancara', NULL, 'Sulit tidur', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (109, 2, 6, 'Observasi', NULL, 'Memiliki wajah yang lebih lebar, termasuk mata yang lebih lebar', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (110, 2, 6, 'Observasi', NULL, 'Bagian tengah wajahnya lebih pendek, termasuk pipi dan hidung', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (111, 2, 6, 'Observasi', NULL, 'Ukuran mulut dan philtrum ( lekukan antara hidung dan bibir) lebih lebar', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (112, 1, 7, 'Perintah', NULL, 'Untuk usia 4 tahun, tidak bisa melompat dengan satu kaki.', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (113, 1, 7, 'Observasi', NULL, 'Selalu bergerak seperti menggoyangkan lutut terus-menerus, tidak bisa duduk tanpa menggeliat, atau kaki yang selalu bergerak, disertai gerakan naik-turun', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (114, 1, 7, 'Observasi', NULL, 'Sering berlari atau memanjat berlebihan dalam situasi yang tidak sesuai', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (115, 1, 7, 'Observasi', NULL, 'Kesulitan bermain dengan tenang', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (116, 1, 7, 'Observasi', NULL, 'Tidak bisa fokus lebih dari beberapa menit.', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (117, 1, 7, 'Observasi', NULL, 'Sering bicara berlebihan', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (118, 1, 7, 'Observasi', NULL, 'Lebih berisik dibanding teman bermainnya.', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (119, 1, 7, 'Observasi', NULL, 'Tidak takut pada situasi yang bisa membahayakan anak.', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (120, 1, 7, 'Observasi;Wawancara', NULL, 'Sangat mudah frustasi dan kesulitan mengatur emosi/ temperamen', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (121, 1, 7, 'Wawancara', NULL, 'Suka menyela atau memaksakan diri terhadap orang lain', 10, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (122, 1, 7, 'Observasi', NULL, 'Membuat kesalahan pada hal kecil (ceroboh)', 11, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (123, 1, 7, 'Observasi', NULL, 'Sulit mempertahankan perhatian', 12, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (124, 1, 7, 'Observasi', NULL, 'Perilakunya seperti tidak mendengarkan saat diajak bicara langsung', 13, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (125, 1, 7, 'Perintah', NULL, 'Gagal menyelesaikan pekerjaan', 14, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (126, 1, 7, 'Observasi;Wawancara', NULL, 'Sulit mengatur tugas dan kegiatan', 15, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (127, 1, 7, 'Observasi;Wawancara', NULL, 'Enggan terlibat dalam tugas yang memerlukan ketekunan', 16, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (128, 1, 7, 'Observasi', NULL, 'Perhatian mudah teralih oleh rangsangan dari luar', 17, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (129, 2, 7, 'Observasi', NULL, 'Berlari dan bergerak sangat cepat', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (130, 2, 7, 'Observasi', NULL, 'Pengeluaran air liur dari mulut yang tidak terkontrol', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (131, 2, 7, 'Observasi', NULL, 'Postur tubuhnya terlihat tidak simetris', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (132, 1, 8, 'Observasi', NULL, 'Membaca pada usia kurang dari 6 tahun,', 1, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (133, 1, 8, 'Observasi;Wawancara', NULL, 'Membaca lebih cepat dan lebih banyak,', 2, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (134, 1, 8, 'Observasi;Wawancara', NULL, 'Memiliki perbendaharaan kata yang luas,', 3, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (135, 1, 8, 'Observasi;Wawancara', NULL, 'Mempunyai rasa ingin tahu yang kuat', 4, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (136, 1, 8, 'Observasi;Wawancara', NULL, 'Mempunyai pengamatan yang tajam', 5, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (137, 1, 8, 'Observasi;Wawancara', NULL, 'Mempunyai inisitif dan dapat bekerja sendiri,', 6, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (138, 1, 8, 'Observasi;Wawancara', NULL, 'Mempunyai Kemampuan Verbal yang Baik', 7, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (139, 1, 8, 'Observasi', NULL, 'Cepat belajar mengenali wajah dan suara pada orang yang berbeda.', 8, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (140, 1, 8, 'Observasi', NULL, 'Waktu tidur sedikit tetapi tidak rewel karena lelah.', 9, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (141, 1, 8, 'Observasi', NULL, 'Senang mencoba hal-hal baru', 10, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (142, 1, 8, 'Observasi;Wawancara', NULL, 'Mempunyai daya ingat yang kuat', 11, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (143, 1, 8, 'Observasi;Wawancara', NULL, 'Banyak bertanya', 12, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (144, 1, 8, 'Observasi;Wawancara', NULL, 'Memiliki kemampuan belajar yang cepat', 13, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (145, 1, 8, 'Observasi', NULL, 'Memperlihatkan konsentrasi yang sungguh-sungguh', 14, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (146, 1, 8, 'Observasi;Wawancara', NULL, 'Senang Menjadi Pemimpin', 15, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (147, 1, 8, 'Perintah', NULL, 'Perhatian terhadap detil', 16, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (148, 1, 8, 'Observasi', NULL, 'Stabil secara emosi (mampu mengendalikan diri)', 17, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (149, 1, 8, 'Wawancara', NULL, 'Dapat memahami instruksi dengan mudah.)', 18, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (150, 1, 8, 'Observasi;Wawancara', NULL, 'Kreatif dan daya imajinasi tinggi', 19, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (151, 1, 8, 'Observasi;Wawancara', NULL, 'Memiliki kemampuan berpikir cepat dan tepat.', 20, NULL);
INSERT INTO `items` (`id`, `variable_id`, `category_id`, `method_id`, `item_id`, `name`, `order_num`, `deleted_at`) VALUES (152, 1, 8, 'Observasi;Wawancara', NULL, 'Jeli dan Memiliki Minat Kuat', 21, NULL);
COMMIT;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `is_heading` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
BEGIN;
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, NULL, '/home', 'Home', 'ti-smart-home', 1, 0, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, NULL, '/master', 'Data Master', 'ti-lifebuoy', 2, 0, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 2, '/master/user', 'Data Pengguna', 'ti-users', 1, 0, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, 2, '/master/child', 'Data Anak', 'ti-user-heart', 2, 0, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, NULL, 'assessment', 'ASESMEN', NULL, 3, 1, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, NULL, '/assessment', 'Asesmen', 'ti-address-book', 4, 0, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 2, '/master/variable', 'Variable', 'ti-file-analytics', 3, 0, NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `menu_id`, `link`, `name`, `icon`, `no_urut`, `is_heading`, `created_at`, `updated_at`, `deleted_at`) VALUES (8, 2, '/master/item', 'Item', 'ti-file-certificate', 4, 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for methods
-- ----------------------------
DROP TABLE IF EXISTS `methods`;
CREATE TABLE `methods` (
  `id` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of methods
-- ----------------------------
BEGIN;
INSERT INTO `methods` (`id`, `name`) VALUES ('o', 'Observasi');
INSERT INTO `methods` (`id`, `name`) VALUES ('p', 'Perintah');
INSERT INTO `methods` (`id`, `name`) VALUES ('w', 'Wawancara');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2023_03_02_110211_create_permission_tables', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2023_03_18_014247_create_menus_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2023_03_18_014308_create_role_has_menus_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2023_03_22_220900_create_akta_pendirians_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2023_03_22_220914_create_izin_produksis_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2023_03_22_221246_create_nama_perizinans_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2023_03_22_221256_create_perizinan_dasars_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2023_03_22_221330_create_sertifikat_tanahs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2023_03_23_010729_create_perjanjian_kerjasamas_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES (2, 'App\\Models\\User', 1);
INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES (3, 'App\\Models\\User', 1);
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (2, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (2, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (3, 'App\\Models\\User', 3);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (3, 'App\\Models\\User', 5);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (3, 'App\\Models\\User', 6);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (3, 'App\\Models\\User', 7);
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1, '*.update', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (2, '*.delete', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (3, 'user.reset-password', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (4, 'user.create', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (5, 'user.read', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (6, 'user.update', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (7, 'user.delete', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (8, 'child.delete', 'web', NULL, NULL);
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (9, 'assessment.delete', 'web', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for quotes
-- ----------------------------
DROP TABLE IF EXISTS `quotes`;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quotes
-- ----------------------------
BEGIN;
INSERT INTO `quotes` (`id`, `text`) VALUES (1, 'Kebutuhan khususmu adalah peta yang membimbing kami menuju keajaiban');
INSERT INTO `quotes` (`id`, `text`) VALUES (2, 'Kesempurnaan tidak ada, tetapi cinta yang tulus adalah keajaiban');
INSERT INTO `quotes` (`id`, `text`) VALUES (3, 'Dalam pelukanmu, ada kekuatan yang tak terbatas untuk menembus segala rintangan');
INSERT INTO `quotes` (`id`, `text`) VALUES (4, 'Anakmu bukanlah tantangan untuk diatasi, melainkan hadiah yang tak ternilai');
INSERT INTO `quotes` (`id`, `text`) VALUES (5, 'Dalam setiap senyum anakmu, terukir keajaiban yang mengharukan');
INSERT INTO `quotes` (`id`, `text`) VALUES (6, 'Anakmu adalah bukti bahwa cinta sejati tak mengenal batasan');
INSERT INTO `quotes` (`id`, `text`) VALUES (7, 'Denganmu sebagai pendampingnya, anakmu akan menemukan dunia yang penuh kasih dan pengertian');
INSERT INTO `quotes` (`id`, `text`) VALUES (8, 'Ketulusanmu adalah bintang yang memandu langkahku dalam kegelapan');
INSERT INTO `quotes` (`id`, `text`) VALUES (9, 'Ketika kamu merasa lelah, ingatlah bahwa cinta adalah pendorong utamamu');
INSERT INTO `quotes` (`id`, `text`) VALUES (10, 'Keistimewaan mereka mengajarkan kita arti sejati dari kehidupan');
INSERT INTO `quotes` (`id`, `text`) VALUES (11, 'Kita adalah garda terdepan dalam mewujudkan mimpi mereka');
INSERT INTO `quotes` (`id`, `text`) VALUES (12, 'Kesempurnaan terletak pada cinta tak terbatas dari orang tua untuk anaknya');
INSERT INTO `quotes` (`id`, `text`) VALUES (13, 'Kelembutan hati mereka memperkaya jiwa kita');
INSERT INTO `quotes` (`id`, `text`) VALUES (14, 'Keberanian mereka mengajarkan kita untuk tidak pernah menyerah');
INSERT INTO `quotes` (`id`, `text`) VALUES (15, 'Kesabaran adalah kuncinya, cinta adalah jawabannya');
INSERT INTO `quotes` (`id`, `text`) VALUES (16, 'Anak kita adalah pahlawan sejati dalam cerita kehidupan kita');
INSERT INTO `quotes` (`id`, `text`) VALUES (17, 'Kekuatan kita teruji dalam perjuangan kita sebagai orang tua');
COMMIT;

-- ----------------------------
-- Table structure for role_has_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_has_menus`;
CREATE TABLE `role_has_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_has_menus_role_id_menu_id_unique` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_menus
-- ----------------------------
BEGIN;
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (2, 1, 2, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (3, 1, 3, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (4, 1, 4, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (5, 1, 5, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (6, 1, 6, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (7, 1, 7, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (8, 1, 88, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (9, 1, 9, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (10, 1, 10, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (11, 1, 11, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (12, 1, 12, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (13, 2, 1, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (14, 2, 2, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (15, 2, 4, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (16, 2, 5, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (17, 2, 6, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (18, 2, 7, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (19, 2, 8, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (20, 2, 9, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (21, 2, 10, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (22, 2, 11, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (23, 2, 12, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (24, 3, 1, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (25, 3, 5, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (26, 3, 6, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (33, 3, 2, NULL, NULL);
INSERT INTO `role_has_menus` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES (34, 3, 4, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (2, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (3, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (4, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (5, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (6, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (7, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (8, 2);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (8, 3);
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (9, 3);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1, 'superadmin', 'web', NULL, NULL);
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (2, 'admin', 'web', NULL, NULL);
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (3, 'user', 'web', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_has_childs
-- ----------------------------
DROP TABLE IF EXISTS `user_has_childs`;
CREATE TABLE `user_has_childs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_has_childs
-- ----------------------------
BEGIN;
INSERT INTO `user_has_childs` (`id`, `user_id`, `child_id`) VALUES (1, 5, 1);
INSERT INTO `user_has_childs` (`id`, `user_id`, `child_id`) VALUES (2, 5, 2);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_username_unique` (`username`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `avatar_url`, `email_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, 'superadmin', 'superadmin@email.com', '$2y$10$FPpW3pFi3ZKBurbmDIo/4eMYWB1q7RCllEMLHW8ohr1PVuIWP4FB6', 'Super Admin', NULL, '2023-04-04 19:38:40', 1, 'ViagcDJt5kdcVQzbO15jasogecTlWQU9Wq2dTOaaQQhaHSPPns07Yc4gkeyy', '2023-04-04 19:38:40', '2023-04-04 19:38:40', NULL);
INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `avatar_url`, `email_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, 'admin', 'admin@email.com', '$2y$10$nfLyU15SvvLmJmm5BUH2FeDOb6IKq2X/FJNO7/j74jjnM4feOQtGW', 'Admin', NULL, '2023-04-04 19:38:40', 1, 'VCGgLE7kNIoXSeoFyg9KaON7mf6y5YwWkLwZEbFGy73uMN58wYskMTXyLWeM', '2023-04-04 19:38:40', '2023-04-04 19:38:40', NULL);
INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `avatar_url`, `email_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, 'user1', 'user@email.com', '$2y$10$0oaWuS8MwZ6OLU.swu0cJe4/PC61knHvsWSPF..Ivp3q49OZeUyh6', 'User', NULL, '2023-04-04 19:38:40', 1, 'S0FviODpQAkgFGoOIhiTma1oYyAgI7RNkwwVKv0E5RDu8WsGDWFY5fJi1rJY', '2023-04-04 19:38:40', '2024-04-29 01:06:11', NULL);
INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `avatar_url`, `email_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, 'pandudud@gmail.com', 'pandudud@gmail.com', '$2y$10$CKuMxbEiB/5Ldvju4Xg5l.KotF6wqfCQy.zRykzCxlYqSHrBbFhr2', 'Pandu Yudhantara', 'https://lh3.googleusercontent.com/a/ACg8ocI_-wrY960b9VkXx0FwMvmTho0Sfk2gxOEtVmaP0-5UukaEBt7pSg=s96-c', NULL, 1, NULL, '2024-04-29 19:55:59', '2024-05-10 09:20:56', NULL);
INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `avatar_url`, `email_verified_at`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES (7, 'panduyudhantara@gmail.com', 'panduyudhantara@gmail.com', '$2y$10$kYm/fhxFKApAZt72ty1SPuvK/Peor0kocJv1x.Se.8I3CBmQsEvGK', 'Pandu Yudhantara', 'https://lh3.googleusercontent.com/a/ACg8ocKCn20v2e3V71ze2XvQWyuFn6NaxrDFul0vRj5hEvg18nxGQg=s96-c', NULL, 1, NULL, '2024-05-16 10:48:19', '2024-05-16 10:48:19', NULL);
COMMIT;

-- ----------------------------
-- Table structure for variables
-- ----------------------------
DROP TABLE IF EXISTS `variables`;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of variables
-- ----------------------------
BEGIN;
INSERT INTO `variables` (`id`, `name`, `order_num`) VALUES (1, 'Bagaimana Perilaku yang Terjadi pada Anak Saudara?', 1);
INSERT INTO `variables` (`id`, `name`, `order_num`) VALUES (2, 'Bagaimana Penampilan Fisik yang Terjadi pada Anak Saudara?', 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
