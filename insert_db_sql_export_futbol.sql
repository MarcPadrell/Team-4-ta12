CREATE DATABASE  IF NOT EXISTS `futbol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futbol`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.84    Database: futbol
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `camp`
--

DROP TABLE IF EXISTS `camp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp` (
  `ubicacio` varchar(20) NOT NULL,
  `capacitat` int NOT NULL DEFAULT '20000',
  PRIMARY KEY (`ubicacio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp`
--

LOCK TABLES `camp` WRITE;
/*!40000 ALTER TABLE `camp` DISABLE KEYS */;
INSERT INTO `camp` VALUES ('Bernabeu',80000),('Camp nou',15000),('Pijuan',60000),('San mames',70000);
/*!40000 ALTER TABLE `camp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrenador`
--

DROP TABLE IF EXISTS `entrenador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenador` (
  `alies` varchar(20) NOT NULL,
  `edat` int NOT NULL,
  `experiencia_anys` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`alies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenador`
--

LOCK TABLES `entrenador` WRITE;
/*!40000 ALTER TABLE `entrenador` DISABLE KEYS */;
INSERT INTO `entrenador` VALUES ('Ancelotti',70,30),('Emeri',46,23),('Guardiola',60,20),('Mourinho',65,30),('Xavi',40,6);
/*!40000 ALTER TABLE `entrenador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip`
--

DROP TABLE IF EXISTS `equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equip` (
  `nom_club` varchar(20) NOT NULL,
  `antiguitat` int NOT NULL,
  `ubicacio` varchar(20) DEFAULT NULL,
  `nom_lliga` varchar(20) DEFAULT NULL,
  `alies` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nom_club`),
  KEY `ubicacio` (`ubicacio`),
  KEY `nom_lliga` (`nom_lliga`),
  KEY `alies` (`alies`),
  CONSTRAINT `equip_ibfk_1` FOREIGN KEY (`ubicacio`) REFERENCES `camp` (`ubicacio`),
  CONSTRAINT `equip_ibfk_2` FOREIGN KEY (`nom_lliga`) REFERENCES `lliga` (`nom_lliga`),
  CONSTRAINT `equip_ibfk_3` FOREIGN KEY (`alies`) REFERENCES `entrenador` (`alies`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip`
--

LOCK TABLES `equip` WRITE;
/*!40000 ALTER TABLE `equip` DISABLE KEYS */;
INSERT INTO `equip` VALUES ('Athletic',80,'San mames','Premier','Emeri'),('FCB',130,'Pijuan','123','Xavi'),('Madrid',5,'Bernabeu','123','Ancelotti'),('Sevilla',48,'Pijuan','Santander','Mourinho');
/*!40000 ALTER TABLE `equip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `dorsal` int NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `posicio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dorsal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Ter Stegen','Porter'),(3,'Pique','Defensa'),(4,'Militao','Defensa'),(5,'Marc','Davanter'),(7,'Neymar','Davanter'),(10,'Messi','Davanter'),(11,'Pedri','Migcampista');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugar`
--

DROP TABLE IF EXISTS `jugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugar` (
  `dorsal` int NOT NULL,
  `jornada` int NOT NULL,
  `nom_club` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dorsal`,`jornada`),
  KEY `jornada` (`jornada`),
  KEY `nom_club` (`nom_club`),
  CONSTRAINT `jugar_ibfk_1` FOREIGN KEY (`dorsal`) REFERENCES `jugador` (`dorsal`),
  CONSTRAINT `jugar_ibfk_2` FOREIGN KEY (`jornada`) REFERENCES `partit` (`jornada`),
  CONSTRAINT `jugar_ibfk_3` FOREIGN KEY (`nom_club`) REFERENCES `equip` (`nom_club`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugar`
--

LOCK TABLES `jugar` WRITE;
/*!40000 ALTER TABLE `jugar` DISABLE KEYS */;
INSERT INTO `jugar` VALUES (3,1,'Athletic'),(3,4,'Athletic'),(3,5,'Athletic'),(1,1,'FCB'),(4,1,'FCB'),(10,4,'FCB'),(10,5,'FCB'),(11,4,'FCB'),(11,5,'FCB'),(7,2,'Madrid'),(5,3,'Sevilla');
/*!40000 ALTER TABLE `jugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lliga`
--

DROP TABLE IF EXISTS `lliga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lliga` (
  `nom_lliga` varchar(20) NOT NULL,
  `divisio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nom_lliga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lliga`
--

LOCK TABLES `lliga` WRITE;
/*!40000 ALTER TABLE `lliga` DISABLE KEYS */;
INSERT INTO `lliga` VALUES ('123','Segona'),('Premier','Primera'),('Santander','Primera');
/*!40000 ALTER TABLE `lliga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partit`
--

DROP TABLE IF EXISTS `partit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partit` (
  `jornada` int NOT NULL AUTO_INCREMENT,
  `resultat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`jornada`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partit`
--

LOCK TABLES `partit` WRITE;
/*!40000 ALTER TABLE `partit` DISABLE KEYS */;
INSERT INTO `partit` VALUES (1,'Victoria'),(2,'Empat'),(3,'Derrota'),(4,'Victoria'),(5,'Victoria'),(6,'Empat');
/*!40000 ALTER TABLE `partit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'futbol'
--

--
-- Dumping routines for database 'futbol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 12:41:17
