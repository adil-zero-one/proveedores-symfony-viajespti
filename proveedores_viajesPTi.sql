-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: proveedores_viajesPTi
-- ------------------------------------------------------
-- Server version	8.4.3

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

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20260402152618','2026-04-02 15:27:09',57),('DoctrineMigrations\\Version20260402175507','2026-04-02 17:57:23',33),('DoctrineMigrations\\Version20260403151101','2026-04-03 16:11:32',107),('DoctrineMigrations\\Version20260403161811','2026-04-03 16:24:40',51);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(24) NOT NULL,
  `tipo_proveedor` enum('hotel','crucero','estacion de esqui','parque tematico') DEFAULT NULL,
  `activo` tinyint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_864FA8F1E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Adil Chainakh','probaInsert_DbManual@viajes.pti','101010101','hotel',1,'2026-04-03 18:29:58','2026-04-03 18:29:58'),(7,'Monte Lucas','montenegro.lucas@huerta.es','+34 976-800335','crucero',0,'2026-04-03 16:31:45','2026-04-06 11:00:13'),(15,'Rolón de De Jesús','olivia.casas@hotmail.es','974-560479','hotel',1,'2026-04-03 16:31:57','2026-04-05 23:32:04'),(16,'Delao y Carrera','gespinoza@yahoo.com','+34 979 32 5923','parque tematico',0,'2026-04-03 16:31:57','2026-04-05 23:32:44'),(18,'Global Lebrón','imelgar@oliva.net','+34 996-524468','hotel',0,'2026-04-03 16:31:57','2026-04-03 16:31:57'),(19,'Empresa Granados','ulloa.nerea@yahoo.com','+34 918192557','crucero',1,'2026-04-03 16:31:57','2026-04-03 16:31:57'),(22,'Global Llamas e Hijos','cristian23@gmail.com','+34 992497971','estacion de esqui',0,'2026-04-04 22:18:46','2026-04-05 23:25:38'),(23,'Grupo Gómez','valenzuela.mariapilar@hotmail.com','+34 951 531972','hotel',1,'2026-04-04 22:18:46','2026-04-04 22:18:46'),(26,'Brito de Casanova','adriana.bautista@hispavista.com','997-82-3011','parque tematico',0,'2026-04-04 22:18:46','2026-04-04 22:18:46'),(27,'Balderas-Cabrera','terrazas.oscar@gmail.com','+34 923802913','hotel',1,'2026-04-04 22:18:46','2026-04-04 22:18:46'),(29,'Martí-Farías','carlota.villegas@espino.es','994-15-4797','crucero',1,'2026-04-04 22:18:46','2026-04-04 22:18:46'),(30,'Viajes Fajardo','andres88@gmail.com','+34 980 811433','estacion de esqui',0,'2026-04-04 22:18:46','2026-04-04 22:18:46'),(35,'Garrido y Mascareñas SA','fcollado@bautista.com','+34 999-170563','parque tematico',1,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(36,'Monroy-Terrazas S. de H.','ksamaniego@reina.com','+34 920-719292','crucero',0,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(39,'Centro Pastor-Otero','unai.nieto@latinmail.com','+34 970-22-5716','parque tematico',1,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(40,'Aguado de Cornejo','mendez.marina@gallardo.org','972 66 9119','estacion de esqui',1,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(41,'Gálvez y Guillen','david98@rojo.org','928-427889','parque tematico',0,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(42,'Díaz y Leiva e Hija','yaiza22@latinmail.com','+34 935 863759','hotel',1,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(43,'Asociación Bautista SA','rcalvo@gmail.com','910-175930','parque tematico',1,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(44,'Lucero-Rincón','kgalindo@hotmail.com','+34 993-649343','parque tematico',0,'2026-04-06 10:47:33','2026-04-06 10:47:33'),(45,'Santana de Gómez S. de H.','esteve.aleix@hotmail.es','+34 969-999877','parque tematico',0,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(46,'Asociación Villalobos-Anaya','oliver.ballesteros@gmail.com','906-183574','hotel',0,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(47,'Olivárez-Solorzano SA','carlota.chacon@hotmail.es','994767118','estacion de esqui',1,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(48,'Corporación Arteaga-Gaona','iesquibel@gmail.com','+34 941 48 8801','hotel',0,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(49,'Sáez y Matos e Hijo','villa.gerard@miramontes.com','+34 926 116948','parque tematico',0,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(50,'Air Madrid','raquel.tamez@terra.com','907-21-7947','parque tematico',0,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(51,'Parra-Mendoza','jarteaga@gmail.com','991 72 8179','parque tematico',1,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(53,'Limón y De la Cruz','joel21@hotmail.es','+34 971-104822','hotel',0,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(54,'Delatorre y Ríos','almaraz.salma@gmail.com','+34 950 28 4521','crucero',1,'2026-04-06 10:55:34','2026-04-06 10:55:34'),(55,'Casanova-Salvador','nicolas51@zarate.es','+34 949 89 8648','estacion de esqui',0,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(56,'Padilla, Briones y Hernándes y Asoc.','fatima11@yahoo.es','+34 922 197702','parque tematico',0,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(57,'Pagan de Ocasio','villareal.mariadolores@sedillo.es','928-37-2399','crucero',1,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(58,'Asociación Abad e Hijo','ivan67@barreto.net','968-149555','crucero',0,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(59,'Figueroa y Anguiano','lcastano@hispavista.com','931 371007','estacion de esqui',0,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(60,'Bustos-Chapa','giglesias@plaza.org','+34 954 127697','hotel',1,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(61,'Arredondo y Crespo','alexia.gonzales@pina.com.es','+34 998 47 8757','crucero',1,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(62,'Viajes Armijo-Jurado','adam.caballero@live.com','935 96 1718','parque tematico',1,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(63,'Merino y Peralta','josefa84@ramos.es','+34 928 042521','hotel',0,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(64,'Empresa Gómez','manuela.delagarza@ocasio.com','+34 992-81-9394','estacion de esqui',0,'2026-04-06 10:57:13','2026-04-06 10:57:13'),(65,'Rangel-Ponce','aleix91@terra.com','995-08-5665','crucero',1,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(66,'Corporación Blasco e Hijos','candela.cortes@dominquez.es','929-589605','crucero',0,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(67,'Global Ulibarri y Asoc.','loera.leo@yahoo.com','+34 995 94 9858','crucero',0,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(68,'Peres, Suárez y Enríquez y Asoc.','claudia17@cortez.com','+34 982-90-4283','hotel',1,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(69,'Castillo y Pastor','marti.juana@peralta.com','949463866','estacion de esqui',1,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(70,'Bautista-Burgos','kocampo@live.com','994-59-2569','hotel',0,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(72,'Giménez-Arredondo','javier24@grijalva.com','+34 913 135645','hotel',1,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(73,'Enríquez y Griego','joseantonio63@blanco.org','+34 954 25 6491','parque tematico',1,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(74,'Empresa Alanis y Flia.','diana.barrios@gmail.com','955-40-3205','estacion de esqui',0,'2026-04-06 10:58:13','2026-04-06 10:58:13'),(75,'Véliz de Sola','portillo.beatriz@hispavista.com','946-80-7693','hotel',1,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(76,'Empresa Córdova-Estrada','anaisabel.garica@hispavista.com','997150161','parque tematico',0,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(77,'Asociación Ayala-Rincón','hernandez.cristina@calvo.com','901-781463','hotel',0,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(78,'Moya, Contreras y Razo e Hija','montes.oliver@gonzalez.com','+34 908-735618','parque tematico',0,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(79,'Global De la Fuente-Páez','zmontero@feliciano.com','+34 981 63 4735','hotel',1,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(80,'Gonzáles de Malave SRL','aolivera@barrera.com','973 122914','parque tematico',0,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(81,'Ramos-Pastor','vmagana@adorno.com','939 21 6882','crucero',0,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(82,'Viajes Gaytán','eechevarria@juan.com','+34 969-672407','hotel',1,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(83,'Delarosa y Avilés y Flia.','rbarrientos@guevara.es','998 47 8742','estacion de esqui',0,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(84,'Colunga de Méndez','celia.arroyo@yahoo.es','+34 963476016','crucero',1,'2026-04-06 10:59:38','2026-04-06 10:59:38'),(85,'Corporación De Jesús-Sedillo','josemanuel.andreu@bermejo.com','+34 910-16-6212','estacion de esqui',0,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(87,'Escamilla de Castañeda','hugo.madrid@live.com','+34 904-06-3205','crucero',0,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(88,'Varela y Rodrigo','aleix.sierra@lozano.net','+34 930-883820','parque tematico',1,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(89,'Espinal, Alfaro y Altamirano e Hija','zvillalobos@terra.com','+34 991633916','crucero',0,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(90,'Soto de Benito','abril.nevarez@jiminez.es','955-523538','parque tematico',0,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(91,'Garibay, Ávila y Nieves y Asoc.','haro.silvia@latinmail.com','+34 951-21-0103','estacion de esqui',1,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(92,'Viajes Benavides-Tamayo','salgado.blanca@gimeno.es','982069617','parque tematico',0,'2026-04-06 10:59:59','2026-04-06 10:59:59'),(93,'Salcido, Olivera y Almanza e Hijo','paula86@roldan.es','+34 996-67-3032','hotel',0,'2026-04-06 10:59:59','2026-04-06 10:59:59');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-06 15:35:42
