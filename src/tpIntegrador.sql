-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tpintegrador
-- ------------------------------------------------------
-- Server version	8.0.30

-- creamos la base de datos
create database tpintegrador;

-- usamos la base de datos
use tpintegrador;



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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `apodo_comentarista` varchar(45) DEFAULT NULL,
  `id_contenido` int NOT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_Comentario_Contenido1_idx` (`id_contenido`),
  CONSTRAINT `fk_Comentario_Contenido1` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `id_contenido` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  `extension` varchar(45) DEFAULT NULL,
  `tipo_contenido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descarga`
--

DROP TABLE IF EXISTS `descarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descarga` (
  `id_descarga` int NOT NULL AUTO_INCREMENT,
  `velocidad_transferencia` int DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `id_contenido_documento` int DEFAULT NULL,
  `id_contenido_musica` int DEFAULT NULL,
  PRIMARY KEY (`id_descarga`),
  KEY `fk_Descarga_Documento1_idx` (`id_contenido_documento`),
  KEY `fk_Descarga_Usuario1_idx` (`id_usuario`),
  KEY `fk_Descarga_Musica1_idx` (`id_contenido_musica`),
  CONSTRAINT `fk_Descarga_Documento1` FOREIGN KEY (`id_contenido_documento`) REFERENCES `documento` (`id_contenido`),
  CONSTRAINT `fk_Descarga_Musica1` FOREIGN KEY (`id_contenido_musica`) REFERENCES `musica` (`id_contenido`),
  CONSTRAINT `fk_Descarga_Usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descarga`
--

LOCK TABLES `descarga` WRITE;
/*!40000 ALTER TABLE `descarga` DISABLE KEYS */;
/*!40000 ALTER TABLE `descarga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documento` (
  `id_contenido` int NOT NULL,
  PRIMARY KEY (`id_contenido`),
  CONSTRAINT `fk_Video_Contenido100` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `id_contenido` int NOT NULL,
  PRIMARY KEY (`id_contenido`),
  CONSTRAINT `fk_Video_Contenido10` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replica`
--

DROP TABLE IF EXISTS `replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replica` (
  `id_replica` int NOT NULL AUTO_INCREMENT,
  `detalle` varchar(45) DEFAULT NULL,
  `apodo_comentarista` varchar(45) DEFAULT NULL,
  `id_comentario` int NOT NULL,
  PRIMARY KEY (`id_replica`),
  KEY `fk_Replica_Comentario_idx` (`id_comentario`),
  CONSTRAINT `fk_Replica_Comentario` FOREIGN KEY (`id_comentario`) REFERENCES `comentario` (`id_comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replica`
--

LOCK TABLES `replica` WRITE;
/*!40000 ALTER TABLE `replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replica_has_replica`
--

DROP TABLE IF EXISTS `replica_has_replica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replica_has_replica` (
  `id_replica_anterior` int NOT NULL,
  `id_replica_nueva` int NOT NULL,
  PRIMARY KEY (`id_replica_anterior`,`id_replica_nueva`),
  KEY `fk_Replica_has_Replica_Replica2_idx` (`id_replica_nueva`),
  KEY `fk_Replica_has_Replica_Replica1_idx` (`id_replica_anterior`),
  CONSTRAINT `fk_Replica_has_Replica_Replica1` FOREIGN KEY (`id_replica_anterior`) REFERENCES `replica` (`id_replica`),
  CONSTRAINT `fk_Replica_has_Replica_Replica2` FOREIGN KEY (`id_replica_nueva`) REFERENCES `replica` (`id_replica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replica_has_replica`
--

LOCK TABLES `replica_has_replica` WRITE;
/*!40000 ALTER TABLE `replica_has_replica` DISABLE KEYS */;
/*!40000 ALTER TABLE `replica_has_replica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reproduccion`
--

DROP TABLE IF EXISTS `reproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reproduccion` (
  `id_reproduccion` int NOT NULL AUTO_INCREMENT,
  `fecha_reproduccion` date DEFAULT NULL,
  `hora_inicio` varchar(45) DEFAULT NULL,
  `hora_fin` varchar(45) DEFAULT NULL,
  `SO_utilizado` varchar(45) DEFAULT NULL,
  `id_contenido` int NOT NULL,
  PRIMARY KEY (`id_reproduccion`),
  KEY `fk_Reproduccion_Video1_idx` (`id_contenido`),
  CONSTRAINT `fk_Reproduccion_Video1` FOREIGN KEY (`id_contenido`) REFERENCES `video` (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reproduccion`
--

LOCK TABLES `reproduccion` WRITE;
/*!40000 ALTER TABLE `reproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_encuesta`
--

DROP TABLE IF EXISTS `respuesta_encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuesta_encuesta` (
  `id_respuesta` int NOT NULL AUTO_INCREMENT,
  `id_encuesta` int DEFAULT NULL,
  `puntaje_global` int DEFAULT NULL,
  `resumen_positivo_plataforma` varchar(45) DEFAULT NULL,
  `resumen_negativo_plataforma` varchar(45) DEFAULT NULL,
  `resumen_positivo_descarga` varchar(45) DEFAULT NULL,
  `resumen_negativo_descarga` varchar(45) DEFAULT NULL,
  `id_descarga` int NOT NULL,
  PRIMARY KEY (`id_respuesta`),
  KEY `fk_respuesta_encuesta_Descarga1_idx` (`id_descarga`),
  CONSTRAINT `fk_respuesta_encuesta_Descarga1` FOREIGN KEY (`id_descarga`) REFERENCES `descarga` (`id_descarga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_encuesta`
--

LOCK TABLES `respuesta_encuesta` WRITE;
/*!40000 ALTER TABLE `respuesta_encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seclasifica`
--

DROP TABLE IF EXISTS `seclasifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seclasifica` (
  `Contenido_id_contenido` int NOT NULL,
  `Categoria_id_categoria` int NOT NULL,
  PRIMARY KEY (`Contenido_id_contenido`,`Categoria_id_categoria`),
  KEY `fk_Contenido_has_Categoria_Categoria1_idx` (`Categoria_id_categoria`),
  KEY `fk_Contenido_has_Categoria_Contenido1_idx` (`Contenido_id_contenido`),
  CONSTRAINT `fk_Contenido_has_Categoria_Categoria1` FOREIGN KEY (`Categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_Contenido_has_Categoria_Contenido1` FOREIGN KEY (`Contenido_id_contenido`) REFERENCES `contenido` (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seclasifica`
--

LOCK TABLES `seclasifica` WRITE;
/*!40000 ALTER TABLE `seclasifica` DISABLE KEYS */;
/*!40000 ALTER TABLE `seclasifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `id_contenido` int NOT NULL,
  PRIMARY KEY (`id_contenido`),
  CONSTRAINT `fk_Video_Contenido1` FOREIGN KEY (`id_contenido`) REFERENCES `contenido` (`id_contenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 15:29:08

INSERT INTO categoria 
VALUES (1,'musica'),
(2,'deporte'),
(3,'investigacion'),
(4,'economia'),
(5, 'salud');  

INSERT INTO usuario 
VALUES (1,'nahuel','carron','1988-02-17','nahucapo88'),
(2,'julieta','romero','1995-03-15','nahucapoporsiempre'),
(3,'bruno','lima','1995-04-13','nahuelmejor'),
(4,'hernan','pavon','1995-05-14','nahuGG'),
(5,'denise','deutsch','1995-06-12','diosNahuSupremo'),
(6,'tomas','sesaro','1995-07-01','nahuSuperSayayin');

INSERT INTO contenido 
VALUES (1,'Animales Salvajes','2022-02-17','.avi','video'),
(2,'Feliz Cumpleaños','2022-05-10','.mp3','musica'),
(3,'Curso MySQL','2022-10-02','.mp4','video'),
(4,'Ejercicio 1 MySQL','2022-06-05','.docx','documento'),
(5,'Yellow','2022-02-17','.mp3','musica'),
(6,'5 Seconds of Summer','2022-09-29','.mp3','musica'),
(7,'Manual de instrucciones','2020-07-01','.pdf','documento'),
(8,'Partido Argentina vs Inglaterra','1986-06-22','.avi','video'),
(9,'IT','2019-03-27','.avi','video'),
(10,'Sweet Child O´ Mine','2010-08-15','.mp3','musica'),
(11,'Apunte Modelizacion','2022-08-28','.pdf','documento'),
(12,'Listado goles Messi','2022-01-01','.pdf','documento'),
(13,'Recital Coldplay','2022-10-25','.avi','video'),
(14,'Entrevista Messi','2022-08-03','.mp4','video'),
(15,'Sky Full Of Stars','2022-10-28','.mp3','musica'),
(16,'Viaje en Brasil','2014-04-23','.mp4','video'),
(17,'Ejercicios Matematica','2022-06-09','.docx','documento'),
(18,'Mirenla','2012-10-01','.mp3','musica'),
(19,'Insisto','2008-02-01','.wav','musica'),
(20,'Guia preguntas','2022-05-11','.docx','documento'),
(21,'Manual','2021-12-09','.docx','documento'),
(22,'Cancion el mundial','2022-10-10','.wav','musica'); 

INSERT INTO video 
VALUES (1),(3),(8),(9),(13),(14),(16)
;

INSERT INTO documento 
VALUES (4),(7),(11),(12),(17),(20),(21);

INSERT INTO musica 
VALUES (2),(5),(6),(10),(15),(18),(19),(22)
;  
 
 
 INSERT INTO comentario 
VALUES (1,'Aguante Messi','soy fan numero 1','juana talarga',14),
(2,'raroo','muy extraño todo, no se entiende nada','elver matias gonte',21),
(3,'Temazo','Que buena cancion, me encanto!!!!','marcia ana alegre',15),
(4,'Quiero ir','necesito mis vacaciones ahiiii','felicitas me ',16),
(5,'Vieja','muy vieja la cancion, no me gusto','armando castillos',18), 
(6,'Buen video, pero viejo','me encanto el video pero es viejo','Osvaldo Lopez',16), 
(7,'Messi Love','aguante messi locoooo','Nachito01',14), 
(8,'Lindo','lindos paisajesss <3','AnitaLaura',16),
(9,'F','no me salio ningun ejercicio :(','Pedro__',17),
(10,'Me sirvio','buen manual, me ayudo mucho','Esther123',21),
(11,'Tradicional','es la cancion tradicional del feliz cumple','__juan__',2),
(12,'Maso','alguno pudo resolver el 3.1?','pepeeee',4),
(13,'Buenisimo','me encanto','Ana2222',6),
(14,'Peliculon','alta peli para ver en halloween','Lore678',9),
(15,'Buena guía','muy buena guia','fran_q',20),
(16,'TEMON','vieja, pero no puedo parar de escucharla','Andrea',18),
(17,'partidazoooo','tremendo partidoo!!! inolvidable','Pepe123456',8),
(18,'dificil','son re dificiles los ejercicios','anaLaura',4),
(19,'temazo','aguante Cirooo','Andrea',18),
(20,'perfecto','feliz cumple tradicional, bueno!!','Andrea',2),
(21,'messi messi','vamos messiiii','Nachito01',14), 
(22,'no me gusto','me dan miedo los payasos!!!!','Lolooo',9);



INSERT INTO descarga 
VALUES (1,23,1,17,null),
(2,33,1,null,15),
(3,21,2,null,5),
(4,40,3,11,null),
(5,32,1,null,2); 




 INSERT INTO replica 
VALUES (1,'cual no te salio???','juana talarga',9),
(2,'maaaal como olvidarlo','elver matias gonte',17),
(3,'jajajaja','marcia ana alegre',14),
(4,'ya tu sabes','felicitas me',4),
(5,'TrEmEnDooo','armando castillos',3); 


INSERT INTO replica_has_replica 
VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5); 

 INSERT INTO reproduccion 
VALUES (1,'2022-02-17','22:30:00','22:32:00','mac',16),
(2,'2022-02-17','12:33:00','12:40:21','linux',9),
(3,'2022-02-17','04:00:00','04:50:12','windows',9),
(4,'2022-03-19','16:12:42','17:01:23','windows',3),
(5,'2022-04-01','21:30:56','22:12:01','windows',1),
(6,'2022-05-03','12:33:00','12:40:21','linux',14);

 INSERT INTO respuesta_encuesta 
VALUES (1,2,9,'lindos colores','letra chica','muy rapida ','no muestra info ',1),
(2,2,6,'linda letra','colores feos','muestra bien la info','muy lenta',2),
(3,2,7,'buen contenido','se desaparece un boton','re veloz ','no avisa cuando termina ',3),
(4,2,10,'me gustan las animaciones','dificil volver al home','buena velocidad','no tengo nada negativo ',4),
(5,2,8,'muy bien pensada','imputs muy chicos','se descargo al toke ','no avisa cuando arranca',5);


INSERT INTO seclasifica 
VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5); 

select * from categoria; -- cargada
select * from usuario; -- cargada
select * from contenido;  -- cargada
select * from video; -- cargada
select * from documento; -- cargada
select * from musica; -- cargada
select * from comentario; -- cargada
select * from descarga; -- cargada
select * from replica; -- cargada
select * from replica_has_replica; -- cargada
select * from reproduccion; -- cargada
select * from respuesta_encuesta; -- cargada
select * from seclasifica; -- cargada




