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
VALUES (1,'animales salvajes','2022-02-17','.avi','video'),
(2,'gatos velgas','2022-05-10','.mp3','audio'),
(3,'perritos avandonados','2022-10-02','.avi','video'),
(4,'hogar de animales peligrosos','2022-06-05','.avi','video'),
(5,'como enseniarle cosas a tus mascotas','2022-02-17','.pdf','documento'); 

INSERT INTO video 
VALUES (1),
(2),
(3),
(4),
(5);

INSERT INTO documento 
VALUES (1),
(2),
(3),
(4),
(5);

INSERT INTO musica 
VALUES (1),
(2),
(3),
(4),
(5);  
 
 
 INSERT INTO comentario 
VALUES (1,'tremendooo','me encanto todo soy fan','juana talarga',1),
(2,'raroo','muy extraño todo','elver matias gonte',2),
(3,'nunca mas','no vuelvo a ver esto','marcia ana alegre',3),
(4,'saddd','espero que adopten mas','felicitas me ',3),
(5,'quieroooo','yo tengo un tigre de vengala','armando castillos',4); 


 INSERT INTO descarga 
VALUES (1,23,1,2,null),
(2,33,1,null,2),
(3,21,2,null,1),
(4,40,3,4,null),
(5,32,1,null,5); 




 INSERT INTO replica 
VALUES (1,'me encanto','juana talarga',1),
(2,'muy raro todo','elver matias gonte',2),
(3,'jajajaja','marcia ana alegre',3),
(4,'ya tu sabes','felicitas me',3),
(5,'TrEmEnDooo','armando castillos',4); 


INSERT INTO replica_has_replica 
VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5); 

 INSERT INTO reproduccion 
VALUES (1,'2022-02-17','22:30:00','22:32:00','mac',1),
(2,'2022-02-17','12:33:00','12:40:21','linux',2),
(3,'2022-02-17','04:00:00','04:50:12','windous',5),
(4,'2022-02-17','16:12:42','17:01:23','windous',1),
(5,'2022-02-17','21:30:56','22:12:01','windous',1);

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




