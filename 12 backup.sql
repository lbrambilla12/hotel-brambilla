-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `alertas_habitacion`
--

DROP TABLE IF EXISTS `alertas_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas_habitacion` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `id_habitacion` int NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `fecha_alerta` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_empleado` int DEFAULT NULL,
  `id_reserva` int DEFAULT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `id_habitacion` (`id_habitacion`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `alertas_habitacion_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`),
  CONSTRAINT `alertas_habitacion_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `alertas_habitacion_ibfk_3` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas_habitacion`
--

LOCK TABLES `alertas_habitacion` WRITE;
/*!40000 ALTER TABLE `alertas_habitacion` DISABLE KEYS */;
INSERT INTO `alertas_habitacion` VALUES (1,13,'Habitación pasada a mantenimiento','2025-06-09 22:45:18',NULL,NULL),(2,25,'Habitación pasada a mantenimiento','2025-06-09 22:45:18',NULL,NULL),(3,3,'Habitación pasada a mantenimiento','2025-06-09 22:45:18',NULL,NULL);
/*!40000 ALTER TABLE `alertas_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(50) NOT NULL,
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `nombre_area` (`nombre_area`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (4,'Administración'),(5,'Gastronomía'),(7,'Lavandería'),(3,'Limpieza'),(2,'Mantenimiento'),(1,'Recepción'),(6,'Spa y Bienestar'),(8,'Transporte');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_estado_habitacion`
--

DROP TABLE IF EXISTS `auditoria_estado_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_estado_habitacion` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_habitacion` int NOT NULL,
  `estado_anterior` enum('disponible','ocupada','mantenimiento') DEFAULT NULL,
  `estado_nuevo` enum('disponible','ocupada','mantenimiento') NOT NULL,
  `fecha_cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_empleado` int DEFAULT NULL,
  `id_reserva` int DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`),
  KEY `id_habitacion` (`id_habitacion`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `auditoria_estado_habitacion_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`),
  CONSTRAINT `auditoria_estado_habitacion_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `auditoria_estado_habitacion_ibfk_3` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `auditoria_estado_habitacion_chk_1` CHECK (((`estado_anterior` is null) or (`estado_anterior` <> `estado_nuevo`)))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_estado_habitacion`
--

LOCK TABLES `auditoria_estado_habitacion` WRITE;
/*!40000 ALTER TABLE `auditoria_estado_habitacion` DISABLE KEYS */;
INSERT INTO `auditoria_estado_habitacion` VALUES (1,13,'disponible','ocupada','2025-06-09 22:45:18',23,1),(2,13,'ocupada','mantenimiento','2025-06-09 22:45:18',23,1),(3,13,'mantenimiento','disponible','2025-06-09 22:45:18',23,1),(4,25,'disponible','ocupada','2025-06-09 22:45:18',18,2),(5,25,'ocupada','mantenimiento','2025-06-09 22:45:18',18,2),(6,3,'disponible','ocupada','2025-06-09 22:45:18',6,3),(7,3,'ocupada','mantenimiento','2025-06-09 22:45:18',6,3),(8,7,'disponible','ocupada','2025-06-09 22:45:18',9,4),(9,38,'disponible','ocupada','2025-06-09 22:45:18',12,5);
/*!40000 ALTER TABLE `auditoria_estado_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_precio_habitacion`
--

DROP TABLE IF EXISTS `auditoria_precio_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_precio_habitacion` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_tipo` int NOT NULL,
  `precio_anterior` decimal(10,2) NOT NULL,
  `precio_nuevo` decimal(10,2) NOT NULL,
  `fecha_cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_empleado` int DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `auditoria_precio_habitacion_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_habitacion` (`id_tipo`),
  CONSTRAINT `auditoria_precio_habitacion_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `auditoria_precio_habitacion_chk_1` CHECK ((`precio_anterior` <> `precio_nuevo`))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_precio_habitacion`
--

LOCK TABLES `auditoria_precio_habitacion` WRITE;
/*!40000 ALTER TABLE `auditoria_precio_habitacion` DISABLE KEYS */;
INSERT INTO `auditoria_precio_habitacion` VALUES (1,3,90000.00,95000.00,'2025-06-09 22:45:18',NULL,'Actualización manual del precio del tipo de habitación'),(2,3,95000.00,195000.00,'2025-06-09 22:45:18',NULL,'Actualización manual del precio del tipo de habitación'),(3,2,60000.00,75000.00,'2025-06-09 22:45:18',NULL,'Actualización manual del precio del tipo de habitación');
/*!40000 ALTER TABLE `auditoria_precio_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_precio_servicio`
--

DROP TABLE IF EXISTS `auditoria_precio_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_precio_servicio` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `id_servicio` int NOT NULL,
  `precio_anterior` decimal(10,2) NOT NULL,
  `precio_nuevo` decimal(10,2) NOT NULL,
  `fecha_cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_empleado` int DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`),
  KEY `id_servicio` (`id_servicio`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `auditoria_precio_servicio_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  CONSTRAINT `auditoria_precio_servicio_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `auditoria_precio_servicio_chk_1` CHECK ((`precio_anterior` <> `precio_nuevo`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_precio_servicio`
--

LOCK TABLES `auditoria_precio_servicio` WRITE;
/*!40000 ALTER TABLE `auditoria_precio_servicio` DISABLE KEYS */;
INSERT INTO `auditoria_precio_servicio` VALUES (1,1,8000.00,19000.00,'2025-06-09 22:45:18',NULL,'Actualización manual del precio del servicio'),(2,4,6000.00,29000.00,'2025-06-09 22:45:18',NULL,'Actualización manual del precio del servicio');
/*!40000 ALTER TABLE `auditoria_precio_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `id_provincia` int NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  UNIQUE KEY `nombre` (`nombre`,`id_provincia`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (116,'Aguilares',23),(62,'Aimogasta',11),(121,'Almagro',24),(108,'Añatuya',21),(8,'Andalgalá',2),(74,'Apóstoles',13),(1,'Bahía Blanca',1),(122,'Balvanera',24),(82,'Bariloche',15),(123,'Barracas',24),(9,'Belén',2),(124,'Belgrano',24),(32,'Bella Vista',6),(125,'Caballito',24),(85,'Cafayate',16),(99,'Caleta Olivia',19),(56,'Campo Alegre',10),(14,'Charata',3),(63,'Chilecito',11),(90,'Chimbas',17),(83,'Cipolletti',15),(126,'Ciudad Autónoma de Buenos Aires',24),(44,'Clorinda',8),(26,'Colonia Santa Ana',5),(20,'Comodoro Rivadavia',4),(117,'Concepción',23),(38,'Concordia',7),(127,'Constitución',24),(27,'Córdoba',5),(33,'Corrientes',6),(79,'Cutral Có',14),(100,'El Calafate',19),(34,'El Paraíso',6),(68,'El Trébol',12),(75,'Eldorado',13),(103,'Esperanza',20),(64,'Estación Central',11),(128,'Flores',24),(45,'Formosa',8),(57,'General Pico',10),(69,'Godoy Cruz',12),(35,'Goya',6),(39,'Gualeguaychú',7),(94,'Jáchal',17),(2,'Junín',1),(109,'La Banda',21),(58,'La Esperanza',10),(3,'La Plata',1),(95,'La Punta',18),(65,'La Rioja',11),(50,'Laguna Blanca',9),(51,'Libertador General San Martín',9),(76,'Los Álamos',13),(40,'Los Aromos',7),(4,'Luján',1),(70,'Luján de Cuyo',12),(5,'Mar del Plata',1),(71,'Mendoza',12),(96,'Merlo',18),(86,'Metán',16),(52,'Monte Grande',9),(15,'Monte Verde',3),(80,'Neuquén',14),(16,'Nueva Esperanza',3),(134,'Nuevo Horizonte',24),(77,'Oberá',13),(87,'Orán',16),(136,'Otros',25),(129,'Palermo',24),(53,'Palpalá',9),(41,'Paraná',7),(36,'Paso de los Libres',6),(66,'Paso Grande',11),(6,'Pergamino',1),(101,'Pico Truncado',19),(46,'Pirané',8),(81,'Plottier',14),(91,'Pocito',17),(78,'Posadas',13),(17,'Presidencia Roque Sáenz Peña',3),(21,'Puerto Esperanza',4),(22,'Puerto Madryn',4),(42,'Puerto Norte',7),(59,'Puesto Viejo',10),(104,'Rafaela',20),(23,'Rawson',4),(92,'Rawson',17),(130,'Recoleta',24),(18,'Resistencia',3),(131,'Retiro',24),(67,'Rincón',11),(28,'Río Cuarto',5),(102,'Río Gallegos',19),(112,'Río Grande',22),(105,'Rosario',20),(88,'Salta',16),(10,'San Fernando del Valle de Catamarca',2),(47,'San Javier',8),(54,'San José',9),(93,'San Juan',17),(97,'San Luis',18),(11,'San Miguel',2),(118,'San Miguel de Tucumán',23),(24,'San Nicolás',4),(72,'San Rafael',12),(55,'San Salvador de Jujuy',9),(37,'Santa Clara',6),(106,'Santa Fe',20),(12,'Santa María',2),(60,'Santa Rosa',10),(48,'Santa Rosa del Sur',8),(110,'Santiago del Estero',21),(119,'Tafí Viejo',23),(7,'Tandil',1),(89,'Tartagal',16),(111,'Termas de Río Hondo',21),(61,'Toay',10),(113,'Tolhuin',22),(114,'Tolhuin Norte',22),(25,'Trelew',4),(115,'Ushuaia',22),(49,'Valle Azul',8),(107,'Venado Tuerto',20),(43,'Victoria',7),(84,'Viedma',15),(19,'Villa Ángela',3),(13,'Villa Argentina',2),(29,'Villa Carlos Paz',5),(135,'Villa del Sol',24),(73,'Villa del Sur',12),(30,'Villa Hermosa',5),(132,'Villa Lugano',24),(31,'Villa María',5),(98,'Villa Mercedes',18),(133,'Villa Urquiza',24),(120,'Yerba Buena',23);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` int NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_puesto` int NOT NULL,
  `id_ciudad` int NOT NULL,
  `id_nacionalidad` int NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `dni` (`dni`),
  KEY `id_puesto` (`id_puesto`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Aura','Pardo',37378571,'Calle de Herminio Lasa 824 Puerta 7 ','+549 23 6794 7658','apardo@hotelaurora.com',1,64,2,'1997-07-01','2025-06-09 22:45:18'),(2,'Ambrosio','Heras',41839754,'Paseo de Alberto Raya 4','+549 32 7755 1406','aheras@hotelaurora.com',1,42,2,'1978-02-26','2025-06-09 22:45:18'),(3,'Íñigo','Carpio',23952514,'Cañada de Araceli Llano 87','+549 30 2771 7267','ícarpio@hotelaurora.com',1,64,4,'1999-07-31','2025-06-09 22:45:18'),(4,'Yago','Coca',42400099,'Pasadizo Margarita Cerezo 5 Piso 5 ','+549 68 6728 6000','ycoca@hotelaurora.com',1,52,2,'2004-01-26','2025-06-09 22:45:18'),(5,'Juanito','Acedo',37147038,'Camino de Cruz Tovar 97 Piso 5 ','+549 34 7528 6378','jacedo@hotelaurora.com',2,7,2,'2001-02-01','2025-06-09 22:45:18'),(6,'Carmina','Pi',99810891,'Glorieta de José Haro 763 Apt. 57 ','+549 385 459 9346','cpi@hotelaurora.com',3,136,7,'2001-12-01','2025-06-09 22:45:18'),(7,'Rolando','Cornejo',15926120,'Vial Ani Mármol 8 Apt. 87 ','+549 24 5279 3925','rcornejo@hotelaurora.com',3,85,5,'1995-09-11','2025-06-09 22:45:18'),(8,'Lorenza','Cobos',35017609,'Avenida Adora Landa 79 Puerta 1 ','+549 65 6663 6139','lcobos@hotelaurora.com',4,28,1,'2001-01-08','2025-06-09 22:45:18'),(9,'Reyes','Pinto',34347084,'Paseo de Andrés Felipe Bayona 44 Puerta 1 ','+549 34 5173 1727','rpinto@hotelaurora.com',5,99,1,'2002-10-25','2025-06-09 22:45:18'),(10,'Clímaco','Cabrera',99970535,'Cañada Vera Andres 6 Apt. 45 ','+549 925 651 4228','ccabrera@hotelaurora.com',5,136,7,'2001-10-23','2025-06-09 22:45:18'),(11,'Tomás','Coello',99696503,'Camino de Isabel Escolano 22','+549 438 738 6143','tcoello@hotelaurora.com',5,136,7,'2005-10-20','2025-06-09 22:45:18'),(12,'Sabina','Piñeiro',25377871,'Camino de Eric Guerra 84','+549 95 7691 6344','spiñeiro@hotelaurora.com',5,130,3,'1999-10-11','2025-06-09 22:45:18'),(13,'Griselda','Agustí',29107837,'Paseo de Fausto Benavent 55 Puerta 6 ','+549 95 7211 3851','gagustí@hotelaurora.com',5,50,2,'1999-09-09','2025-06-09 22:45:18'),(14,'Yago','Matas',25196351,'Cuesta de Custodio Gálvez 69','+549 46 4443 8043','ymatas@hotelaurora.com',5,1,5,'2005-03-18','2025-06-09 22:45:18'),(15,'Manolo','Marquez',29823878,'Callejón de Adán Avilés 474','+549 66 4501 9375','mmarquez@hotelaurora.com',6,120,3,'2005-10-05','2025-06-09 22:45:18'),(16,'Nidia','Ortuño',37107362,'Callejón Irene Cerro 1','+549 20 5649 9445','nortuño@hotelaurora.com',7,44,6,'2000-09-08','2025-06-09 22:45:18'),(17,'Modesta','Saez',37575276,'Vial de Cipriano Marquez 36','+549 49 4680 4262','msaez@hotelaurora.com',8,61,1,'1984-02-05','2025-06-09 22:45:18'),(18,'Eligio','Paz',99498216,'Callejón Xiomara Tirado 25 Piso 1 ','+549 725 970 2193','epaz@hotelaurora.com',9,136,7,'1997-10-29','2025-06-09 22:45:18'),(19,'Marisela','Gonzalez',39103689,'Avenida de Morena Prat 5 Puerta 1 ','+549 99 7291 9099','mgonzalez@hotelaurora.com',10,50,5,'2003-03-03','2025-06-09 22:45:18'),(20,'Rafa','Juárez',44952693,'Via de Imelda Guillen 90 Piso 9 ','+549 23 7965 4585','rjuárez@hotelaurora.com',11,2,6,'1985-07-01','2025-06-09 22:45:18'),(21,'Flora','Barroso',16685049,'Ronda de Demetrio Chaves 1 Piso 7 ','+549 81 5082 2988','fbarroso@hotelaurora.com',11,119,5,'1997-05-29','2025-06-09 22:45:18'),(22,'Cleto','Guitart',40341985,'Pasaje de Raimundo Rius 226','+549 66 9270 7991','cguitart@hotelaurora.com',12,82,6,'2003-10-04','2025-06-09 22:45:18'),(23,'Encarnación','Raya',30101835,'Acceso Isaac Salcedo 63 Apt. 58 ','+549 43 5050 5543','eraya@hotelaurora.com',12,122,2,'2006-05-27','2025-06-09 22:45:18'),(24,'Plinio','Barrera',24213961,'Glorieta de Donato Sanz 4 Puerta 9 ','+549 66 2269 5681','pbarrera@hotelaurora.com',13,62,6,'1995-10-18','2025-06-09 22:45:18'),(25,'Aureliano','Múgica',19643063,'Camino Hernán Bayona 439','+549 29 4788 7275','amúgica@hotelaurora.com',14,21,5,'1999-05-25','2025-06-09 22:45:18'),(26,'Nando','Coloma',28676765,'Vial de Eladio Iglesia 11','+549 52 9890 8633','ncoloma@hotelaurora.com',15,107,1,'1997-09-03','2025-06-09 22:45:18'),(27,'Albino','Palma',40830059,'Plaza de Félix Lara 3','+549 84 1320 7232','apalma@hotelaurora.com',16,100,4,'2002-08-05','2025-06-09 22:45:18'),(28,'Begoña','Carballo',43636961,'Pasaje de Mayte Paredes 891','+549 63 9818 9947','bcarballo@hotelaurora.com',17,100,3,'2004-01-02','2025-06-09 22:45:18'),(29,'Ismael','Aroca',24158189,'Plaza de Benjamín Tejero 26 Piso 7 ','+549 65 8956 1475','iaroca@hotelaurora.com',18,57,4,'1996-09-06','2025-06-09 22:45:18'),(30,'Trini','Berrocal',43202690,'Avenida Edmundo Llopis 698 Piso 9 ','+549 69 3091 9751','tberrocal@hotelaurora.com',19,43,4,'1990-07-02','2025-06-09 22:45:18');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `id_habitacion` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `id_tipo` int NOT NULL,
  `estado` enum('disponible','ocupada','mantenimiento') NOT NULL DEFAULT 'disponible',
  PRIMARY KEY (`id_habitacion`),
  UNIQUE KEY `numero` (`numero`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `habitacion_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_habitacion` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,101,1,'disponible'),(2,102,1,'disponible'),(3,103,1,'mantenimiento'),(4,104,1,'disponible'),(5,105,1,'disponible'),(6,106,1,'disponible'),(7,107,1,'ocupada'),(8,108,1,'disponible'),(9,109,1,'disponible'),(10,110,1,'disponible'),(11,201,1,'disponible'),(12,202,1,'disponible'),(13,203,1,'disponible'),(14,204,1,'disponible'),(15,205,1,'disponible'),(16,206,1,'disponible'),(17,207,1,'disponible'),(18,208,1,'disponible'),(19,209,1,'disponible'),(20,210,1,'disponible'),(21,301,2,'disponible'),(22,302,2,'disponible'),(23,303,2,'disponible'),(24,304,2,'disponible'),(25,305,2,'mantenimiento'),(26,306,2,'disponible'),(27,307,2,'disponible'),(28,308,2,'disponible'),(29,309,2,'disponible'),(30,310,2,'disponible'),(31,401,2,'disponible'),(32,402,2,'disponible'),(33,403,3,'disponible'),(34,404,3,'disponible'),(35,405,3,'disponible'),(36,406,3,'disponible'),(37,407,3,'disponible'),(38,408,3,'ocupada'),(39,409,3,'disponible'),(40,410,3,'disponible');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huesped`
--

DROP TABLE IF EXISTS `huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huesped` (
  `id_huesped` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` int NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_nacionalidad` int NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_ciudad` int NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id_huesped`),
  UNIQUE KEY `dni` (`dni`),
  KEY `id_nacionalidad` (`id_nacionalidad`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `huesped_ibfk_1` FOREIGN KEY (`id_nacionalidad`) REFERENCES `nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `huesped_ibfk_2` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huesped`
--

LOCK TABLES `huesped` WRITE;
/*!40000 ALTER TABLE `huesped` DISABLE KEYS */;
INSERT INTO `huesped` VALUES (1,'Wilfredo','Vega',17816809,'+549 92 8022 3223','wvega888@mail.com',6,'Via Reyna Garrido 47 Piso 5 ',7,'2025-03-11 00:00:00','1980-04-17'),(2,'Sabas','Ricart',27720614,'+549 51 4467 8449','sricart335@mail.com',1,'Ronda de Matías Jara 82',67,'2023-07-30 00:00:00','1955-08-23'),(3,'Paz','Blázquez',40233262,'+549 63 5133 2341','pblázquez482@mail.com',4,'Via de Marcela Peralta 18',72,'2024-09-05 00:00:00','1987-08-26'),(4,'Chita','Murcia',99565621,'+549 153 458 4673','cmurcia666@mail.com',7,'Acceso de Samanta Rocha 5',136,'2024-09-16 00:00:00','1970-09-11'),(5,'Pastor','Calleja',40307866,'+549 13 5051 4266','pcalleja860@mail.com',6,'Cuesta Jacobo Campoy 68',11,'2023-09-05 00:00:00','2001-04-30'),(6,'León','Gonzalo',99159784,'+549 344 229 8758','lgonzalo686@mail.com',7,'Callejón Ambrosio Escribano 64 Piso 0 ',136,'2023-10-26 00:00:00','1959-03-08'),(7,'Clarisa','Pérez',38470149,'+549 42 7043 3749','cpérez621@mail.com',2,'Plaza Ciriaco Garrido 86',120,'2024-02-27 00:00:00','1960-02-23'),(8,'Rafael','Mesa',41098364,'+549 30 6096 2771','rmesa593@mail.com',6,'Calle Fabricio Criado 501 Piso 6 ',30,'2024-06-19 00:00:00','1990-09-29'),(9,'Vasco','Ribas',99327110,'+549 689 793 7149','vribas407@mail.com',7,'Pasadizo Danilo Ochoa 51 Puerta 9 ',136,'2024-06-19 00:00:00','1985-04-17'),(10,'Guadalupe','Mendez',34867507,'+549 98 4978 2669','gmendez714@mail.com',2,'C. Elena Ballesteros 4',20,'2024-01-28 00:00:00','1963-10-23'),(11,'María Fernanda','Cervantes',41716951,'+549 82 1672 6688','mcervantes546@mail.com',6,'Alameda de Dimas Aguilera 36 Apt. 68 ',31,'2024-12-05 00:00:00','1965-02-03'),(12,'Angelita','Pablo',31977226,'+549 92 6590 1207','apablo870@mail.com',3,'Calle de Tristán Alfonso 61',18,'2024-08-28 00:00:00','1978-08-24'),(13,'Consuela','Quiroga',29546631,'+549 56 8532 3506','cquiroga446@mail.com',4,'Via de Sandalio Almansa 82 Puerta 5 ',28,'2023-08-15 00:00:00','1979-02-25'),(14,'Rafaela','Camacho',35666589,'+549 78 8921 8616','rcamacho447@mail.com',5,'Camino de Salvador Zamora 7',70,'2025-04-14 00:00:00','1970-07-19'),(15,'Marcia','Nicolás',25814747,'+549 41 2419 5569','mnicolás903@mail.com',5,'Rambla de Carmelo Vicens 9',69,'2024-07-08 00:00:00','1962-08-18'),(16,'Vicenta','Olmedo',26287597,'+549 13 9098 6325','volmedo187@mail.com',4,'Urbanización Cristian Coll 33 Puerta 2 ',98,'2025-01-18 00:00:00','2001-02-03'),(17,'Gabriela','Benet',26419876,'+549 45 5526 1166','gbenet530@mail.com',3,'Pasaje de Marisela Sanchez 695',67,'2023-10-03 00:00:00','1979-05-12'),(18,'Borja','Somoza',39161696,'+549 62 9004 4937','bsomoza708@mail.com',1,'Callejón de Domitila Barbero 28 Piso 7 ',62,'2024-05-24 00:00:00','1951-12-29'),(19,'Baudelio','Peinado',30038242,'+549 12 2524 5820','bpeinado227@mail.com',6,'Avenida Encarnacion Vendrell 97 Puerta 0 ',126,'2024-05-22 00:00:00','2004-07-17'),(20,'Concha','Fabra',37278801,'+549 84 7046 8753','cfabra567@mail.com',2,'Pasadizo de Eutropio Barrio 61 Puerta 1 ',79,'2024-07-03 00:00:00','1993-05-27'),(21,'Francisco Jose','Ariza',26804802,'+549 99 8434 5438','fariza314@mail.com',4,'Pasaje de Azucena Yáñez 625',85,'2025-05-20 00:00:00','1968-09-07'),(22,'Roldán','Rebollo',25588032,'+549 25 9779 4033','rrebollo197@mail.com',1,'Alameda Blas Murcia 9 Puerta 6 ',50,'2024-01-14 00:00:00','1966-08-01'),(23,'Lourdes','Conesa',39313038,'+549 85 9595 5636','lconesa103@mail.com',4,'Camino Gracia Cid 74 Apt. 91 ',71,'2024-02-03 00:00:00','1987-06-21'),(24,'Renato','Moya',27109159,'+549 32 5952 1231','rmoya726@mail.com',3,'Ronda Apolonia Paredes 6',59,'2024-02-02 00:00:00','1961-09-13'),(25,'Iker','Noguera',16829589,'+549 80 5786 3068','inoguera654@mail.com',3,'Urbanización Emigdio Cortina 5 Apt. 88 ',12,'2025-03-17 00:00:00','1999-09-13'),(26,'Sol','Zurita',44283615,'+549 11 5658 8690','szurita491@mail.com',4,'Vial de Edelmira Peñas 32',27,'2025-03-14 00:00:00','1996-07-31'),(27,'María Manuela','Daza',23471768,'+549 71 2869 2070','mdaza411@mail.com',2,'Ronda Pánfilo Gámez 59 Puerta 7 ',14,'2023-12-06 00:00:00','1985-10-09'),(28,'Jorge','Mendoza',20091113,'+549 29 5978 2395','jmendoza255@mail.com',5,'Acceso Irene Saez 74 Puerta 8 ',14,'2024-04-28 00:00:00','1960-06-17'),(29,'Olga','Flores',41027956,'+549 76 7232 8381','oflores931@mail.com',4,'Calle de Felipa Terrón 28',58,'2024-12-11 00:00:00','2006-12-30'),(30,'Ascensión','Casanovas',25246860,'+549 82 1986 2625','acasanovas971@mail.com',5,'Rambla Leandro Sancho 226 Apt. 75 ',110,'2025-05-30 00:00:00','1951-04-01'),(31,'Severino','Baeza',23880050,'+549 94 2330 3573','sbaeza246@mail.com',6,'Urbanización de Rolando Bilbao 13 Piso 1 ',55,'2025-03-20 00:00:00','1998-01-26'),(32,'Florentina','Naranjo',15089782,'+549 62 8381 8699','fnaranjo299@mail.com',1,'Calle Luciano Sureda 87',41,'2024-09-27 00:00:00','1949-10-16'),(33,'Vicenta','Bernad',99302099,'+549 823 389 8438','vbernad73@mail.com',7,'Glorieta de Petrona Conde 798',136,'2023-09-02 00:00:00','2002-04-02'),(34,'Luis','Gámez',29265296,'+549 24 9922 4683','lgámez664@mail.com',3,'Calle Jorge Rivas 271 Piso 9 ',51,'2024-07-28 00:00:00','1950-07-21'),(35,'Evelia','Villalba',17396116,'+549 17 3718 6039','evillalba610@mail.com',3,'Cañada Timoteo Abellán 753',37,'2023-10-31 00:00:00','1994-08-24'),(36,'Guiomar','Boada',29735544,'+549 25 8679 5982','gboada717@mail.com',5,'Pasadizo Candelas Vera 780 Piso 0 ',74,'2024-10-13 00:00:00','1975-10-05'),(37,'Raúl','Izaguirre',33118774,'+549 73 8172 2317','rizaguirre613@mail.com',3,'Avenida de Onofre Hernando 6',129,'2023-09-19 00:00:00','1952-06-13'),(38,'Pastor','Nevado',99453014,'+549 852 430 5102','pnevado27@mail.com',7,'Cuesta de Evangelina Esparza 81',136,'2023-07-06 00:00:00','1969-05-27'),(39,'Heriberto','Arranz',40661100,'+549 96 5415 1659','harranz782@mail.com',6,'Alameda Martín Villalba 88',6,'2023-12-21 00:00:00','1951-12-05'),(40,'Marisa','Feijoo',36861030,'+549 66 5557 3973','mfeijoo600@mail.com',4,'Calle de Rosenda Mármol 61 Piso 6 ',133,'2025-01-05 00:00:00','1979-05-11'),(41,'Teresa','Pomares',30770931,'+549 54 7690 6460','tpomares329@mail.com',4,'Cuesta Jesusa Valencia 58 Apt. 61 ',24,'2024-05-07 00:00:00','1990-06-07'),(42,'Pacífica','Escribano',28812517,'+549 98 9117 5722','pescribano679@mail.com',2,'Via de Cebrián Mosquera 84 Puerta 6 ',85,'2023-10-15 00:00:00','1996-05-16'),(43,'Vicente','Ortega',30261425,'+549 21 6153 5135','vortega332@mail.com',5,'Acceso Encarnacion Royo 20 Puerta 6 ',10,'2024-03-16 00:00:00','1984-05-07'),(44,'Nicolasa','Cuesta',42679963,'+549 10 9889 8569','ncuesta424@mail.com',4,'Pasaje Andrés Cases 4',132,'2025-02-01 00:00:00','1993-05-03'),(45,'Quique','Paredes',35892125,'+549 73 8242 1845','qparedes209@mail.com',5,'Vial Iris Sandoval 85 Apt. 92 ',93,'2024-07-23 00:00:00','1974-05-28'),(46,'Rómulo','Miralles',29700736,'+549 99 8941 2989','rmiralles30@mail.com',2,'Via Amancio Estrada 78 Puerta 1 ',74,'2023-12-28 00:00:00','2002-03-03'),(47,'Juan Bautista','Salmerón',38816359,'+549 30 6091 1224','jsalmerón566@mail.com',5,'Cuesta de Heraclio Casado 81',62,'2023-10-20 00:00:00','1997-12-23'),(48,'Victor','Bonilla',30483621,'+549 25 3522 9165','vbonilla956@mail.com',2,'Avenida de Carmelita Manrique 32 Piso 8 ',30,'2023-11-29 00:00:00','1957-09-10'),(49,'Herberto','Chamorro',28941542,'+549 71 8736 4993','hchamorro468@mail.com',5,'Plaza de Poncio Peinado 38',70,'2024-09-25 00:00:00','1955-04-20'),(50,'Blas','Mendoza',35111774,'+549 75 3236 2143','bmendoza283@mail.com',4,'Pasadizo de Segismundo Recio 612 Puerta 1 ',49,'2024-05-22 00:00:00','1981-02-18'),(51,'Irma','Villar',41431410,'+549 74 5377 1042','ivillar290@mail.com',4,'Paseo Felicidad Espada 96 Apt. 18 ',88,'2023-10-04 00:00:00','1970-02-17'),(52,'Fidel','Cáceres',44033327,'+549 29 8316 9824','fcáceres496@mail.com',5,'Acceso Aurelia Luz 5 Apt. 84 ',126,'2023-09-13 00:00:00','1991-12-20'),(53,'Marcio','Bueno',30278829,'+549 51 4090 4912','mbueno586@mail.com',5,'Rambla Genoveva Nebot 200',97,'2023-07-13 00:00:00','1993-01-31'),(54,'María Manuela','Landa',25676225,'+549 70 7246 7325','mlanda680@mail.com',4,'Plaza de Anastasia Manjón 47',12,'2025-02-22 00:00:00','2004-05-16'),(55,'Isidora','Ramis',31620471,'+549 14 3068 9229','iramis989@mail.com',6,'Avenida de Jennifer Barreda 77 Piso 7 ',39,'2023-11-13 00:00:00','1972-08-01'),(56,'Elvira','Cobo',18345769,'+549 77 8486 1251','ecobo740@mail.com',1,'Acceso de Sabas Castrillo 98 Apt. 53 ',113,'2024-06-04 00:00:00','1957-10-09'),(57,'Juanito','Sancho',17510819,'+549 70 5342 6546','jsancho639@mail.com',6,'Via Aureliano Manrique 79',40,'2023-12-17 00:00:00','1960-04-20'),(58,'Odalys','Morán',43580500,'+549 52 9742 7226','omorán978@mail.com',6,'Rambla Andrea Villa 57 Piso 0 ',21,'2023-08-16 00:00:00','1976-03-12'),(59,'Anselma','Sebastián',44272316,'+549 79 1588 2121','asebastián241@mail.com',6,'Camino Patricio Atienza 5',125,'2024-06-26 00:00:00','1990-02-04'),(60,'Sofía','Sosa',40057321,'+549 21 8110 2612','ssosa779@mail.com',3,'Via Tomás Cañete 75 Piso 0 ',59,'2024-04-14 00:00:00','1952-11-30'),(61,'Clotilde','Ferreras',20582275,'+549 98 5906 1474','cferreras48@mail.com',1,'Avenida de Rolando Varela 58 Puerta 9 ',114,'2023-09-08 00:00:00','1958-03-10'),(62,'Cleto','Prada',27028033,'+549 57 8056 3385','cprada251@mail.com',1,'Paseo de Pío Cobos 99 Piso 8 ',76,'2023-07-09 00:00:00','1952-07-08'),(63,'Antonio','Cerro',20703704,'+549 32 2293 7267','acerro635@mail.com',5,'Pasadizo de Yago Company 682 Puerta 5 ',47,'2023-10-12 00:00:00','1976-03-04'),(64,'Encarnita','Martínez',22790951,'+549 69 5161 8529','emartínez262@mail.com',4,'Camino de Marcelino Taboada 6 Piso 1 ',37,'2024-04-26 00:00:00','1989-02-25'),(65,'Mario','Amor',37736848,'+549 79 3588 2210','mamor453@mail.com',4,'Camino de Crescencia Goñi 8 Apt. 89 ',74,'2025-01-29 00:00:00','2006-09-04'),(66,'Ricardo','Coloma',36439225,'+549 64 5097 8484','rcoloma866@mail.com',5,'Camino Juanita Canet 80',77,'2024-02-06 00:00:00','1977-12-06'),(67,'Evaristo','Rey',18578689,'+549 40 7248 6881','erey589@mail.com',4,'Pasadizo de Matilde Soto 3',124,'2024-07-14 00:00:00','1963-07-18'),(68,'Chelo','Morcillo',15736170,'+549 94 7484 5497','cmorcillo9@mail.com',6,'Alameda de Fulgencio Segura 658 Puerta 4 ',76,'2024-09-23 00:00:00','1982-05-20'),(69,'Gregorio','Hoz',35347625,'+549 73 5689 4770','ghoz622@mail.com',6,'Urbanización de Manuel Malo 67 Piso 5 ',13,'2024-08-16 00:00:00','2003-07-24'),(70,'Lorena','Llanos',35833650,'+549 42 3240 2591','lllanos926@mail.com',2,'Camino Inmaculada Pino 35 Piso 0 ',49,'2024-01-17 00:00:00','1998-01-12'),(71,'Cayetano','Olivares',41461376,'+549 66 1546 6977','colivares750@mail.com',1,'Cuesta de Iker Franch 548 Apt. 19 ',80,'2025-01-03 00:00:00','1989-05-14'),(72,'Jose','Herrera',40081295,'+549 63 3877 4289','jherrera136@mail.com',3,'Urbanización Baldomero Cabrera 85',84,'2023-08-25 00:00:00','1995-10-16'),(73,'María Manuela','Cervantes',24144500,'+549 31 5210 8894','mcervantes991@mail.com',3,'Ronda Fortunata Tamarit 53',129,'2024-02-12 00:00:00','1968-11-09'),(74,'Flavia','Barranco',41985566,'+549 24 8673 2233','fbarranco145@mail.com',6,'Paseo Mamen Arcos 36',87,'2025-06-02 00:00:00','1951-11-28'),(75,'Piedad','Puerta',43378475,'+549 81 6992 2479','ppuerta810@mail.com',2,'Cañada Sarita Arcos 5 Puerta 9 ',102,'2023-08-30 00:00:00','1972-03-26'),(76,'Lucas','Santos',30260086,'+549 57 5295 7242','lsantos843@mail.com',3,'Pasadizo Adelina Llamas 61 Apt. 74 ',32,'2024-12-17 00:00:00','1962-02-08'),(77,'Alberto','Navas',37643757,'+549 39 8724 1410','anavas635@mail.com',3,'Rambla Emiliana Ramirez 68 Apt. 61 ',28,'2023-10-29 00:00:00','1959-01-01'),(78,'Albina','Morales',35470961,'+549 38 2035 8606','amorales932@mail.com',5,'Callejón Rodolfo Gutiérrez 64',84,'2024-01-28 00:00:00','1989-01-26'),(79,'Loreto','Alberdi',18914994,'+549 27 1742 1609','lalberdi312@mail.com',6,'Urbanización de Bernabé Carrasco 34 Piso 8 ',105,'2025-05-24 00:00:00','1997-04-24'),(80,'María Luisa','Mercader',22878581,'+549 78 3222 7367','mmercader465@mail.com',1,'Acceso de Encarnacion Giner 82',25,'2023-10-04 00:00:00','1980-05-24'),(81,'Mariana','Pereira',34707871,'+549 29 7797 2622','mpereira854@mail.com',6,'Paseo de Nidia Gil 29 Puerta 7 ',108,'2024-07-22 00:00:00','1997-04-29'),(82,'Porfirio','Bermejo',16097776,'+549 98 7070 4559','pbermejo455@mail.com',4,'Paseo Vanesa Vega 99',72,'2023-10-02 00:00:00','1960-08-18'),(83,'Nacio','Viña',18333787,'+549 97 7018 9920','nviña924@mail.com',2,'Glorieta Liliana Torrijos 9 Piso 0 ',93,'2024-05-25 00:00:00','1958-05-31'),(84,'Armida','Ribes',28359349,'+549 45 4109 3001','aribes972@mail.com',3,'Paseo Óscar Mendez 7 Piso 0 ',16,'2025-01-07 00:00:00','1964-04-05'),(85,'Cristina','Beltran',37238828,'+549 37 1349 1828','cbeltran806@mail.com',4,'Acceso de Juanita Bartolomé 801',24,'2023-07-02 00:00:00','1968-12-20'),(86,'Sebastian','Escolano',17302174,'+549 80 4394 4538','sescolano833@mail.com',2,'Acceso de Tatiana Piñeiro 76',53,'2023-08-09 00:00:00','1995-11-23'),(87,'Gisela','Cañas',41462493,'+549 86 1046 5542','gcañas880@mail.com',3,'Rambla Brígida Pozo 123 Apt. 47 ',38,'2024-11-12 00:00:00','1998-05-15'),(88,'Candelas','Rodrigo',41793677,'+549 32 2801 1422','crodrigo135@mail.com',2,'Urbanización Édgar Oliva 44 Puerta 1 ',65,'2023-07-03 00:00:00','2004-07-08'),(89,'Gertrudis','Rius',99828358,'+549 907 343 6304','grius17@mail.com',7,'Glorieta Bonifacio Cabrero 107',136,'2023-12-15 00:00:00','1999-10-30'),(90,'Arsenio','Quesada',39887928,'+549 63 9619 2862','aquesada764@mail.com',1,'Paseo Isaac Barbero 58 Apt. 95 ',33,'2024-08-29 00:00:00','1990-02-14'),(91,'María Teresa','Montes',32221408,'+549 85 2786 8405','mmontes516@mail.com',4,'Vial de Gertrudis Vázquez 56',93,'2024-01-07 00:00:00','1953-08-01'),(92,'Cecilia','Díez',39402225,'+549 94 9543 5941','cdíez470@mail.com',5,'Calle de Omar Piquer 756 Apt. 46 ',12,'2023-10-28 00:00:00','2000-10-09'),(93,'Brígida','Sáenz',31071965,'+549 61 7984 2768','bsáenz503@mail.com',1,'Cañada Rosa Cobos 90',16,'2024-04-23 00:00:00','1977-10-11'),(94,'Cecilia','Cañete',17710878,'+549 51 3430 2076','ccañete130@mail.com',4,'Callejón Herminio Murillo 8 Piso 1 ',19,'2024-07-28 00:00:00','1998-09-28'),(95,'Paula','Farré',27781030,'+549 86 9692 5831','pfarré465@mail.com',6,'C. de Ignacia Ariza 4',84,'2025-02-21 00:00:00','2001-04-08'),(96,'Diana','Gaya',41611888,'+549 99 2874 4522','dgaya441@mail.com',4,'Alameda Marcio Alcántara 23 Puerta 7 ',26,'2025-05-18 00:00:00','1965-12-10'),(97,'Josefa','Fuente',26372657,'+549 68 7532 7815','jfuente748@mail.com',2,'Paseo Modesto Luna 97 Puerta 5 ',106,'2024-02-02 00:00:00','1967-03-27'),(98,'Plácido','Vilalta',37317316,'+549 42 7132 3500','pvilalta704@mail.com',4,'Via de Nieves Soria 63 Piso 6 ',81,'2023-07-13 00:00:00','1987-09-18'),(99,'Rosario','Giralt',42909633,'+549 20 2527 8075','rgiralt99@mail.com',1,'Callejón Carolina Rios 42',24,'2024-02-19 00:00:00','1965-02-01'),(100,'Reynaldo','Hoyos',33668704,'+549 17 6400 3002','rhoyos421@mail.com',3,'Callejón de María Carmen Torres 37 Puerta 5 ',34,'2023-10-17 00:00:00','1958-12-16');
/*!40000 ALTER TABLE `huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_pago`
--

DROP TABLE IF EXISTS `log_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pago` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_pago` int NOT NULL,
  `id_reserva` int NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `id_tipo_pago` int NOT NULL,
  `registrado_en` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`),
  KEY `id_pago` (`id_pago`),
  KEY `id_reserva` (`id_reserva`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  CONSTRAINT `log_pago_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`),
  CONSTRAINT `log_pago_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `log_pago_ibfk_3` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`),
  CONSTRAINT `log_pago_chk_1` CHECK ((`monto` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_pago`
--

LOCK TABLES `log_pago` WRITE;
/*!40000 ALTER TABLE `log_pago` DISABLE KEYS */;
INSERT INTO `log_pago` VALUES (1,1,1,'2025-06-09 22:45:18',140000.00,1,'2025-06-09 22:45:18'),(2,2,2,'2025-06-09 22:45:18',215000.00,2,'2025-06-09 22:45:18'),(3,3,3,'2025-06-09 22:45:18',120000.00,1,'2025-06-09 22:45:18'),(4,4,4,'2025-06-09 22:45:18',100000.00,2,'2025-06-09 22:45:18'),(5,5,5,'2025-06-09 22:45:18',138000.00,1,'2025-06-09 22:45:18'),(6,6,6,'2025-06-09 22:45:18',375000.00,1,'2025-06-09 22:45:18'),(7,7,7,'2025-06-09 22:45:18',166000.00,2,'2025-06-09 22:45:18'),(8,8,8,'2025-06-09 22:45:18',180000.00,1,'2025-06-09 22:45:18'),(9,9,9,'2025-06-09 22:45:18',178000.00,2,'2025-06-09 22:45:18'),(10,10,10,'2025-06-09 22:45:18',120000.00,1,'2025-06-09 22:45:18'),(11,11,11,'2025-06-09 22:45:18',200000.00,2,'2025-06-09 22:45:18'),(12,12,12,'2025-06-09 22:45:18',175000.00,1,'2025-06-09 22:45:18'),(13,13,13,'2025-06-09 22:45:18',160000.00,2,'2025-06-09 22:45:18'),(14,14,14,'2025-06-09 22:45:18',288000.00,1,'2025-06-09 22:45:18'),(15,15,15,'2025-06-09 22:45:18',240000.00,2,'2025-06-09 22:45:18');
/*!40000 ALTER TABLE `log_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nacionalidad` (
  `id_nacionalidad` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`),
  UNIQUE KEY `pais` (`pais`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Chile'),(6,'Europa'),(7,'Otros'),(5,'Paraguay'),(4,'Uruguay');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_reserva` int NOT NULL,
  `id_empleado` int NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `monto_total` decimal(10,2) NOT NULL,
  `id_tipo_pago` int NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `id_reserva` (`id_reserva`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_tipo_pago` (`id_tipo_pago`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`),
  CONSTRAINT `pago_chk_1` CHECK ((`monto_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,1,'2025-06-09 22:45:18',140000.00,1),(2,2,1,'2025-06-09 22:45:18',215000.00,2),(3,3,2,'2025-06-09 22:45:18',120000.00,1),(4,4,2,'2025-06-09 22:45:18',100000.00,2),(5,5,1,'2025-06-09 22:45:18',138000.00,1),(6,6,3,'2025-06-09 22:45:18',375000.00,1),(7,7,1,'2025-06-09 22:45:18',166000.00,2),(8,8,2,'2025-06-09 22:45:18',180000.00,1),(9,9,1,'2025-06-09 22:45:18',178000.00,2),(10,10,3,'2025-06-09 22:45:18',120000.00,1),(11,11,4,'2025-06-09 22:45:18',200000.00,2),(12,12,1,'2025-06-09 22:45:18',175000.00,1),(13,13,1,'2025-06-09 22:45:18',160000.00,2),(14,14,4,'2025-06-09 22:45:18',288000.00,1),(15,15,1,'2025-06-09 22:45:18',240000.00,2);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Buenos Aires'),(2,'Catamarca'),(3,'Chaco'),(4,'Chubut'),(24,'Ciudad Autónoma de Buenos Aires'),(5,'Córdoba'),(6,'Corrientes'),(7,'Entre Ríos'),(8,'Formosa'),(9,'Jujuy'),(10,'La Pampa'),(11,'La Rioja'),(12,'Mendoza'),(13,'Misiones'),(14,'Neuquén'),(25,'Otros'),(15,'Río Negro'),(16,'Salta'),(17,'San Juan'),(18,'San Luis'),(19,'Santa Cruz'),(20,'Santa Fe'),(21,'Santiago del Estero'),(22,'Tierra del Fuego'),(23,'Tucumán');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `nombre_puesto` varchar(50) NOT NULL,
  `id_area` int NOT NULL,
  PRIMARY KEY (`id_puesto`),
  UNIQUE KEY `nombre_puesto` (`nombre_puesto`),
  KEY `id_area` (`id_area`),
  CONSTRAINT `puesto_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'Recepcionista',1),(2,'Supervisor de Recepción',1),(3,'Técnico de Mantenimiento',2),(4,'Encargado de Mantenimiento',2),(5,'Personal de Limpieza',3),(6,'Supervisor de Limpieza',3),(7,'Administrador General',4),(8,'Asistente Administrativo',4),(9,'Contador',4),(10,'Chef Principal',5),(11,'Ayudante de Cocina',5),(12,'Mozo/Salonero',5),(13,'Masajista',6),(14,'Recepcionista de Spa',6),(15,'Técnico en Bienestar',6),(16,'Encargado de Lavandería',7),(17,'Operario de Lavandería',7),(18,'Chofer',8),(19,'Coordinador de Transporte',8);
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_huesped` int NOT NULL,
  `id_habitacion` int NOT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cantidad_personas` int NOT NULL,
  `estado` enum('confirmada','cancelada','finalizada') NOT NULL DEFAULT 'confirmada',
  `total_pago` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_reserva`),
  KEY `id_huesped` (`id_huesped`),
  KEY `id_habitacion` (`id_habitacion`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_huesped`) REFERENCES `huesped` (`id_huesped`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id_habitacion`),
  CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `reserva_chk_1` CHECK ((`cantidad_personas` > 0)),
  CONSTRAINT `reserva_chk_2` CHECK ((`total_pago` >= 0)),
  CONSTRAINT `reserva_chk_3` CHECK ((`fecha_fin` > `fecha_inicio`))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,90,13,23,'2025-06-02','2025-06-05',2,'confirmada',140000.00),(2,70,11,3,'2025-06-10','2025-06-15',1,'confirmada',215000.00),(3,2,27,10,'2025-06-05','2025-06-07',2,'confirmada',120000.00),(4,79,8,27,'2025-06-01','2025-06-03',1,'cancelada',100000.00),(5,96,18,16,'2025-06-03','2025-06-06',3,'confirmada',138000.00),(6,55,36,4,'2025-06-04','2025-06-08',2,'confirmada',375000.00),(7,43,20,11,'2025-06-06','2025-06-10',2,'confirmada',166000.00),(8,16,33,6,'2025-06-02','2025-06-04',1,'confirmada',180000.00),(9,84,9,17,'2025-06-05','2025-06-09',2,'confirmada',178000.00),(10,18,5,14,'2025-06-04','2025-06-07',1,'confirmada',120000.00),(11,23,31,12,'2025-06-08','2025-06-11',3,'confirmada',200000.00),(12,5,6,21,'2025-06-01','2025-06-05',1,'confirmada',175000.00),(13,63,7,15,'2025-06-02','2025-06-06',2,'confirmada',160000.00),(14,38,35,7,'2025-06-05','2025-06-08',2,'confirmada',288000.00),(15,14,24,8,'2025-06-03','2025-06-07',1,'confirmada',240000.00);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_servicio`
--

DROP TABLE IF EXISTS `reserva_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_servicio` (
  `id_reserva` int NOT NULL,
  `id_servicio` int NOT NULL,
  `bonificado` tinyint(1) NOT NULL DEFAULT '0',
  `precio_aplicado` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_reserva`,`id_servicio`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `reserva_servicio_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`),
  CONSTRAINT `reserva_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`),
  CONSTRAINT `reserva_servicio_chk_1` CHECK ((`precio_aplicado` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_servicio`
--

LOCK TABLES `reserva_servicio` WRITE;
/*!40000 ALTER TABLE `reserva_servicio` DISABLE KEYS */;
INSERT INTO `reserva_servicio` VALUES (1,1,1,0.00),(1,2,0,20000.00),(2,3,0,15000.00),(3,1,1,0.00),(4,2,0,20000.00),(4,4,1,0.00),(5,5,0,18000.00),(6,1,1,0.00),(6,3,0,15000.00),(7,4,0,6000.00),(8,2,1,0.00),(9,1,1,0.00),(9,5,0,18000.00),(10,1,1,0.00),(11,2,0,20000.00),(12,3,0,15000.00),(13,1,1,0.00),(14,5,0,18000.00),(15,4,1,0.00);
/*!40000 ALTER TABLE `reserva_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `bonificable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_servicio`),
  UNIQUE KEY `nombre_servicio` (`nombre_servicio`),
  CONSTRAINT `servicio_chk_1` CHECK ((`precio` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Desayuno','Servicio de desayuno continental con opciones calientes y frías.',19000.00,1),(2,'Spa','Acceso a spa con sauna, masajes y piscina climatizada.',20000.00,0),(3,'Buffet','Almuerzo o cena buffet libre con variedad de platos internacionales.',15000.00,1),(4,'Lavandería','Servicio de lavado, secado y planchado de prendas personales.',29000.00,0),(5,'Traslados al aeropuerto','Servicio de transporte privado desde/hacia el aeropuerto.',18000.00,0);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_habitacion`
--

DROP TABLE IF EXISTS `tipo_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_habitacion` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(50) NOT NULL,
  `precio_base` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  UNIQUE KEY `nombre_tipo` (`nombre_tipo`),
  CONSTRAINT `tipo_habitacion_chk_1` CHECK ((`precio_base` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_habitacion`
--

LOCK TABLES `tipo_habitacion` WRITE;
/*!40000 ALTER TABLE `tipo_habitacion` DISABLE KEYS */;
INSERT INTO `tipo_habitacion` VALUES (1,'Estándar',40000.00),(2,'Deluxe',75000.00),(3,'Suite',195000.00);
/*!40000 ALTER TABLE `tipo_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_pago`),
  UNIQUE KEY `nombre_tipo` (`nombre_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'Efectivo'),(2,'Tarjeta');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_detalle_pagos`
--

DROP TABLE IF EXISTS `vw_detalle_pagos`;
/*!50001 DROP VIEW IF EXISTS `vw_detalle_pagos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_detalle_pagos` AS SELECT 
 1 AS `id_pago`,
 1 AS `id_reserva`,
 1 AS `tipo_pago`,
 1 AS `monto_total`,
 1 AS `fecha_pago`,
 1 AS `empleado`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_empleados_con_puesto`
--

DROP TABLE IF EXISTS `vw_empleados_con_puesto`;
/*!50001 DROP VIEW IF EXISTS `vw_empleados_con_puesto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_empleados_con_puesto` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `nombre_puesto`,
 1 AS `nombre_area`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estado_habitaciones`
--

DROP TABLE IF EXISTS `vw_estado_habitaciones`;
/*!50001 DROP VIEW IF EXISTS `vw_estado_habitaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estado_habitaciones` AS SELECT 
 1 AS `numero`,
 1 AS `nombre_tipo`,
 1 AS `estado`,
 1 AS `estado_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_historial_cambios_precios`
--

DROP TABLE IF EXISTS `vw_historial_cambios_precios`;
/*!50001 DROP VIEW IF EXISTS `vw_historial_cambios_precios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_historial_cambios_precios` AS SELECT 
 1 AS `id_auditoria`,
 1 AS `tipo`,
 1 AS `nombre`,
 1 AS `precio_anterior`,
 1 AS `precio_nuevo`,
 1 AS `fecha_cambio`,
 1 AS `empleado`,
 1 AS `apellido`,
 1 AS `motivo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_huespedes_por_ciudad`
--

DROP TABLE IF EXISTS `vw_huespedes_por_ciudad`;
/*!50001 DROP VIEW IF EXISTS `vw_huespedes_por_ciudad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_huespedes_por_ciudad` AS SELECT 
 1 AS `ciudad`,
 1 AS `provincia`,
 1 AS `total_huespedes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ocupacion_actual`
--

DROP TABLE IF EXISTS `vw_ocupacion_actual`;
/*!50001 DROP VIEW IF EXISTS `vw_ocupacion_actual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ocupacion_actual` AS SELECT 
 1 AS `numero_habitacion`,
 1 AS `tipo`,
 1 AS `id_reserva`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`,
 1 AS `estado`,
 1 AS `cantidad_personas`,
 1 AS `total_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reservas_por_mes`
--

DROP TABLE IF EXISTS `vw_reservas_por_mes`;
/*!50001 DROP VIEW IF EXISTS `vw_reservas_por_mes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reservas_por_mes` AS SELECT 
 1 AS `mes`,
 1 AS `total_reservas`,
 1 AS `ingresos_estimados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_servicios_por_reserva`
--

DROP TABLE IF EXISTS `vw_servicios_por_reserva`;
/*!50001 DROP VIEW IF EXISTS `vw_servicios_por_reserva`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_servicios_por_reserva` AS SELECT 
 1 AS `id_reserva`,
 1 AS `nombre_servicio`,
 1 AS `precio_aplicado`,
 1 AS `bonificado`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_detalle_pagos`
--

/*!50001 DROP VIEW IF EXISTS `vw_detalle_pagos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_detalle_pagos` AS select `pa`.`id_pago` AS `id_pago`,`pa`.`id_reserva` AS `id_reserva`,`tp`.`nombre_tipo` AS `tipo_pago`,`pa`.`monto_total` AS `monto_total`,`pa`.`fecha_pago` AS `fecha_pago`,`e`.`nombre` AS `empleado`,`e`.`apellido` AS `apellido` from ((`pago` `pa` join `tipo_pago` `tp` on((`pa`.`id_tipo_pago` = `tp`.`id_tipo_pago`))) join `empleado` `e` on((`pa`.`id_empleado` = `e`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_empleados_con_puesto`
--

/*!50001 DROP VIEW IF EXISTS `vw_empleados_con_puesto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_empleados_con_puesto` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,`p`.`nombre_puesto` AS `nombre_puesto`,`a`.`nombre_area` AS `nombre_area`,`e`.`email` AS `email` from ((`empleado` `e` join `puesto` `p` on((`e`.`id_puesto` = `p`.`id_puesto`))) join `area` `a` on((`p`.`id_area` = `a`.`id_area`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estado_habitaciones`
--

/*!50001 DROP VIEW IF EXISTS `vw_estado_habitaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estado_habitaciones` AS select `h`.`numero` AS `numero`,`th`.`nombre_tipo` AS `nombre_tipo`,`h`.`estado` AS `estado`,(case when (`h`.`estado` = 'disponible') then 'Disponible' when (`h`.`estado` = 'ocupada') then 'Ocupada' when (`h`.`estado` = 'mantenimiento') then 'En mantenimiento' end) AS `estado_descripcion` from (`habitacion` `h` join `tipo_habitacion` `th` on((`h`.`id_tipo` = `th`.`id_tipo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_historial_cambios_precios`
--

/*!50001 DROP VIEW IF EXISTS `vw_historial_cambios_precios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_historial_cambios_precios` AS select `aps`.`id_auditoria` AS `id_auditoria`,'servicio' AS `tipo`,`s`.`nombre_servicio` AS `nombre`,`aps`.`precio_anterior` AS `precio_anterior`,`aps`.`precio_nuevo` AS `precio_nuevo`,`aps`.`fecha_cambio` AS `fecha_cambio`,`e`.`nombre` AS `empleado`,`e`.`apellido` AS `apellido`,`aps`.`motivo` AS `motivo` from ((`auditoria_precio_servicio` `aps` left join `servicio` `s` on((`aps`.`id_servicio` = `s`.`id_servicio`))) left join `empleado` `e` on((`aps`.`id_empleado` = `e`.`id_empleado`))) union all select `aph`.`id_auditoria` AS `id_auditoria`,'habitacion' AS `tipo`,`th`.`nombre_tipo` AS `nombre`,`aph`.`precio_anterior` AS `precio_anterior`,`aph`.`precio_nuevo` AS `precio_nuevo`,`aph`.`fecha_cambio` AS `fecha_cambio`,`e`.`nombre` AS `empleado`,`e`.`apellido` AS `apellido`,`aph`.`motivo` AS `motivo` from ((`auditoria_precio_habitacion` `aph` left join `tipo_habitacion` `th` on((`aph`.`id_tipo` = `th`.`id_tipo`))) left join `empleado` `e` on((`aph`.`id_empleado` = `e`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_huespedes_por_ciudad`
--

/*!50001 DROP VIEW IF EXISTS `vw_huespedes_por_ciudad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_huespedes_por_ciudad` AS select `c`.`nombre` AS `ciudad`,`p`.`nombre` AS `provincia`,count(0) AS `total_huespedes` from ((`huesped` `h` join `ciudad` `c` on((`h`.`id_ciudad` = `c`.`id_ciudad`))) join `provincia` `p` on((`c`.`id_provincia` = `p`.`id_provincia`))) group by `c`.`nombre`,`p`.`nombre` order by `total_huespedes` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ocupacion_actual`
--

/*!50001 DROP VIEW IF EXISTS `vw_ocupacion_actual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ocupacion_actual` AS select `h`.`numero` AS `numero_habitacion`,`th`.`nombre_tipo` AS `tipo`,`r`.`id_reserva` AS `id_reserva`,`r`.`fecha_inicio` AS `fecha_inicio`,`r`.`fecha_fin` AS `fecha_fin`,`r`.`estado` AS `estado`,`r`.`cantidad_personas` AS `cantidad_personas`,`r`.`total_pago` AS `total_pago` from ((`habitacion` `h` join `tipo_habitacion` `th` on((`h`.`id_tipo` = `th`.`id_tipo`))) left join `reserva` `r` on(((`r`.`id_habitacion` = `h`.`id_habitacion`) and (`r`.`estado` = 'confirmada') and (curdate() between `r`.`fecha_inicio` and `r`.`fecha_fin`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reservas_por_mes`
--

/*!50001 DROP VIEW IF EXISTS `vw_reservas_por_mes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reservas_por_mes` AS select date_format(`reserva`.`fecha_inicio`,'%Y-%m') AS `mes`,count(0) AS `total_reservas`,sum(`reserva`.`total_pago`) AS `ingresos_estimados` from `reserva` where (`reserva`.`estado` = 'confirmada') group by `mes` order by `mes` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_servicios_por_reserva`
--

/*!50001 DROP VIEW IF EXISTS `vw_servicios_por_reserva`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_servicios_por_reserva` AS select `rs`.`id_reserva` AS `id_reserva`,`s`.`nombre_servicio` AS `nombre_servicio`,`rs`.`precio_aplicado` AS `precio_aplicado`,`rs`.`bonificado` AS `bonificado` from (`reserva_servicio` `rs` join `servicio` `s` on((`rs`.`id_servicio` = `s`.`id_servicio`))) */;
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

-- Dump completed on 2025-06-09 22:46:36
