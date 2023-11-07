CREATE DATABASE  IF NOT EXISTS `carpool` /*!40100 DEFAULT CHARACTER SET utf8mb4 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carpool`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carpool
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `ID` int NOT NULL,
  `CITY` varchar(99) DEFAULT NULL,
  `LAT` varchar(45) DEFAULT NULL,
  `LON` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Lilongwe','-13.952321026254044','33.77794044151983'),(2,'Balaka','-14.988857706250329','34.95673107918491'),(3,'Blantyre','-15.787000291412348','35.01618325489538'),(4,'Chikhwawa','-16.043173121686745','34.80152366767134'),(5,'Chitipa','-9.70136127556361','33.266150618603895'),(6,'Dedza','-14.384825610333131','34.33571807788222'),(7,'Dowa','-13.65497707504155','33.936729894057486'),(8,'Karonga','-9.949648113765361','33.91848986284123'),(9,'Kasungu','-13.034910538663008','33.480448579417995'),(10,'Machinga','-15.176342737334416','35.29902344482822'),(11,'Mangochi','-14.48143566928261','35.26521645476606'),(12,'Mchinji','-13.796538217630301','32.88911811518543'),(13,'MonkeyBay','-14.084406236608505','34.91115192960581'),(14,'Mulanje','-16.02491655289958','35.503495668094025'),(15,'Mwanza','-15.59022889479725','34.51074772160152'),(16,'Mzimba','-11.89740682984199','33.59327350947885'),(17,'Mzuzu','-11.428021643909313','33.99584802771785'),(18,'Neno','-15.559373370004119','34.50433574403843'),(19,'NkahataBay','-11.608153439368568','34.29522629632346'),(20,'Nkhotakota','-12.923620622332416','34.27826175992192'),(21,'Nsanje','-16.91757080567081','35.26002978455596'),(22,'Ntcheu','-14.816040922443168','34.63847620403807'),(23,'Ntchisi','-13.36323421276725','33.910250688357664'),(24,'Phalombe','-15.762399319402682','35.6515461901779'),(25,'Rumphi','-11.018963022049435','33.85430572710966'),(26,'Salima','-13.782388781661247','34.45918448213884'),(27,'Thyolo','-16.068519333557457','35.14742354151403'),(28,'Zomba','-15.400735521453887','35.31247067382176');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distances`
--

DROP TABLE IF EXISTS `distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distances` (
  `ID` int NOT NULL,
  `CITY` varchar(99) DEFAULT NULL,
  `Lilongwe` int DEFAULT NULL,
  `Balaka` int DEFAULT NULL,
  `Blantyre` int DEFAULT NULL,
  `Chikhwawa` int DEFAULT NULL,
  `Chitipa` int DEFAULT NULL,
  `Dedza` int DEFAULT NULL,
  `Dowa` int DEFAULT NULL,
  `Karonga` int DEFAULT NULL,
  `Kasungu` int DEFAULT NULL,
  `Machinga` int DEFAULT NULL,
  `Mangochi` int DEFAULT NULL,
  `Mchinji` int DEFAULT NULL,
  `MonkeyBay` int DEFAULT NULL,
  `Mulanje` int DEFAULT NULL,
  `Mwanza` int DEFAULT NULL,
  `Mzimba` int DEFAULT NULL,
  `Mzuzu` int DEFAULT NULL,
  `Neno` int DEFAULT NULL,
  `NkahataBay` int DEFAULT NULL,
  `Nkhotakota` int DEFAULT NULL,
  `Nsanje` int DEFAULT NULL,
  `Ntcheu` int DEFAULT NULL,
  `Ntchisi` int DEFAULT NULL,
  `Phalombe` int DEFAULT NULL,
  `Rumphi` int DEFAULT NULL,
  `Salima` int DEFAULT NULL,
  `Thyolo` int DEFAULT NULL,
  `Zomba` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distances`
--

LOCK TABLES `distances` WRITE;
/*!40000 ALTER TABLE `distances` DISABLE KEYS */;
INSERT INTO `distances` VALUES (1,'Lilongwe',0,201,311,359,691,84,53,590,127,250,245,109,206,378,300,278,367,315,413,200,488,158,90,360,432,103,358,286),(2,'Balaka',201,0,127,175,889,118,254,788,328,49,97,310,160,194,116,476,565,125,465,267,304,43,291,155,630,158,176,85),(3,'Blantyre',311,127,0,54,1000,229,365,899,439,100,191,421,253,66,104,587,676,95,576,378,183,154,402,96,741,269,47,64),(5,'Chitipa',691,889,1000,1047,0,772,669,101,564,938,843,699,804,1066,986,425,327,930,374,562,1176,847,648,970,276,673,1046,974),(6,'Dedza',84,118,229,276,772,0,137,671,211,167,159,193,120,295,218,359,448,230,494,235,405,75,174,270,513,126,275,203),(7,'Dowa',53,254,365,412,669,137,0,568,107,33,237,158,198,431,354,256,345,330,391,142,541,211,53,375,410,67,411,339),(8,'Karonga',590,788,899,946,101,671,568,0,463,837,742,598,703,968,828,324,226,830,273,461,1015,746,547,870,176,572,885,815),(9,'Kasungu',127,328,439,489,564,211,107,463,0,377,344,138,305,505,428,151,240,445,286,127,615,284,85,490,305,173,485,413),(10,'Machinga',250,49,100,154,938,167,33,837,377,0,91,359,153,161,165,525,614,175,514,316,282,92,340,105,728,207,141,36),(11,'Mangochi',245,97,191,254,843,159,237,742,344,91,0,408,63,251,214,574,516,220,479,281,373,141,290,195,584,172,231,127),(12,'Mchinji',109,310,421,468,699,193,158,598,138,359,408,0,312,487,410,286,375,415,421,304,597,267,194,460,440,207,467,395),(13,'MonkeyBay',206,160,253,307,804,120,198,703,305,153,63,312,0,314,276,455,477,255,440,242,436,155,251,255,545,133,294,189),(14,'Mulanje',378,194,66,120,1066,295,431,968,505,161,251,487,314,0,170,653,742,175,642,444,249,220,468,45,807,335,47,125),(15,'Mwanza',300,116,104,151,986,218,354,828,428,165,214,410,276,170,0,576,665,6,565,367,279,143,391,195,730,258,150,168),(16,'Mzimba',278,476,587,634,425,359,256,324,151,525,574,286,455,653,576,0,117,590,154,353,763,434,535,635,170,464,633,561),(17,'Mzuzu',367,565,676,723,327,448,345,226,240,614,516,375,477,742,665,117,0,610,47,235,852,523,324,655,68,346,722,650),(18,'Neno',315,125,95,85,930,230,330,830,445,175,220,415,255,175,6,590,610,0,570,375,285,150,375,200,675,270,150,140),(19,'NkahataBay',413,465,576,623,374,494,391,273,286,514,479,421,440,642,565,154,47,570,0,198,752,470,370,610,115,309,622,550),(20,'Nkhotakota',200,267,378,452,562,235,142,461,127,316,281,304,242,444,367,353,235,375,198,0,554,272,89,420,303,111,424,352),(21,'Nsanje',488,304,183,135,1176,405,541,1015,615,282,373,597,436,249,279,763,852,285,752,554,0,330,578,270,917,445,146,247),(22,'Ntcheu',158,43,154,201,847,75,211,746,284,92,141,267,155,220,143,434,523,150,470,272,330,0,248,195,588,163,200,128),(23,'Ntchisi',90,291,402,449,648,174,53,547,85,340,290,194,251,468,391,535,324,375,370,89,578,248,0,415,389,120,448,376),(24,'Phalombe',360,155,96,140,970,270,375,870,490,105,195,460,255,45,195,635,655,200,610,420,270,195,415,0,720,310,85,77),(25,'Rumphi',432,630,741,788,276,513,410,176,305,728,584,440,545,807,730,170,68,675,115,303,917,588,389,720,0,414,787,715),(26,'Salima',103,158,269,316,673,126,67,572,173,207,172,207,133,335,258,464,346,270,309,111,445,163,120,310,414,0,315,243),(27,'Thyolo',358,176,47,101,1046,275,411,885,485,141,231,467,294,47,150,633,722,150,622,424,146,200,448,85,787,315,0,105),(28,'Zomba',286,85,64,118,974,203,339,815,413,36,127,395,189,125,168,561,650,140,550,352,247,128,376,77,715,243,105,0);
/*!40000 ALTER TABLE `distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamification`
--

DROP TABLE IF EXISTS `gamification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamification` (
  `ID` int NOT NULL,
  `NAME` varchar(99) DEFAULT NULL,
  `POINTS` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamification`
--

LOCK TABLES `gamification` WRITE;
/*!40000 ALTER TABLE `gamification` DISABLE KEYS */;
INSERT INTO `gamification` VALUES (1,'Benjamin Franklin',15),(2,'Natasha Little',20),(3,'Phil Mickelson',10),(4,'George Foreman',10),(5,'Richard von Weizsäcker',10);
/*!40000 ALTER TABLE `gamification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `ID` int NOT NULL,
  `CITY` varchar(99) DEFAULT NULL,
  `Lilongwe` varchar(200) DEFAULT NULL,
  `Balaka` varchar(200) DEFAULT NULL,
  `Blantyre` varchar(200) DEFAULT NULL,
  `Chikhwawa` varchar(200) DEFAULT NULL,
  `Chitipa` varchar(200) DEFAULT NULL,
  `Dedza` varchar(200) DEFAULT NULL,
  `Dowa` varchar(200) DEFAULT NULL,
  `Karonga` varchar(200) DEFAULT NULL,
  `Kasungu` varchar(200) DEFAULT NULL,
  `Machinga` varchar(200) DEFAULT NULL,
  `Mangochi` varchar(200) DEFAULT NULL,
  `Mchinji` varchar(200) DEFAULT NULL,
  `MonkeyBay` varchar(200) DEFAULT NULL,
  `Mulanje` varchar(200) DEFAULT NULL,
  `Mwanza` varchar(200) DEFAULT NULL,
  `Mzimba` varchar(200) DEFAULT NULL,
  `Mzuzu` varchar(200) DEFAULT NULL,
  `Neno` varchar(200) DEFAULT NULL,
  `NkahataBay` varchar(200) DEFAULT NULL,
  `Nkhotakota` varchar(200) DEFAULT NULL,
  `Nsanje` varchar(200) DEFAULT NULL,
  `Ntcheu` varchar(200) DEFAULT NULL,
  `Ntchisi` varchar(200) DEFAULT NULL,
  `Phalombe` varchar(200) DEFAULT NULL,
  `Rumphi` varchar(200) DEFAULT NULL,
  `Salima` varchar(200) DEFAULT NULL,
  `Thyolo` varchar(200) DEFAULT NULL,
  `Zomba` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'Lilongwe','','Dedza, Ntcheu','Dedza, Ntcheu, Balaka','Dedza, Ntcheu, Balaka, Blantyre','Kasungu, Mzuzu, Karonga','','','','','','','','','','','','','','','','','','','','','','',''),(2,'Balaka','Ntcheu, Dedza','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(3,'Blantyre','Balaka, Ntcheu, Dedza','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(4,'Chikhwawa','Blantyre, Balaka, Ntcheu, Dedza','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(5,'Chitipa','Karonga, Mzuzu, Kasungu','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(6,'Dedza','','Ntcheu','','','','','','','','','','','','','','','','','','','','','','','','','',''),(7,'Dowa','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(8,'Karonga','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(9,'Kasungu','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(10,'Machinga','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(11,'Mangochi','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(12,'Mchinji','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(13,'MonkeyBay','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(14,'Mulanje','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(15,'Mwanza','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(16,'Mzimba','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(17,'Mzuzu','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(18,'Neno','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(19,'NkahataBay','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(20,'Nkhotakota','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(21,'Nsanje','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(22,'Ntcheu','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(23,'Ntchisi','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(24,'Phalombe','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(25,'Rumphi','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(26,'Salima','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(27,'Thyolo','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(28,'Zomba','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `ID` int NOT NULL,
  `DRIVER` varchar(99) DEFAULT NULL,
  `PHONE` varchar(99) DEFAULT NULL,
  `MAIL` varchar(99) DEFAULT NULL,
  `DEPARTURE` varchar(99) DEFAULT NULL,
  `DESTINATION` varchar(99) DEFAULT NULL,
  `DATE` datetime DEFAULT NULL,
  `START` datetime DEFAULT NULL,
  `ARRIVAL` datetime DEFAULT NULL,
  `SEATS` int DEFAULT '1',
  `REQUEST` tinyint DEFAULT '0',
  `FEMALE` tinyint DEFAULT '0',
  `FEMALE_GUESTS` tinyint DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,'Benjamin Franklin','+265 88 347 6744','mail@mail.com','Lilongwe','Blantyre','2023-11-28 00:00:00','2023-10-24 10:00:00','2023-10-24 18:00:00',3,1,0,0),(2,'George Foreman','+265 88 3333 4444','mail@mail.com','Dedza','Balaka','2023-11-29 00:00:00','2023-10-26 09:47:00','2023-10-26 13:00:00',1,0,0,0),(3,'Natasha Little','+265 88 3333 5555','mail@mail.com','Lilongwe','Blantyre','2023-11-30 00:00:00','2023-10-30 10:21:00','2023-10-30 14:00:00',1,0,1,1),(4,'Richard von Weizsäcker','+265 88 445 445 33','mail@mail.com','Dedza','Mzimba','2023-12-07 00:00:00','2023-11-07 08:51:00','2023-11-07 15:00:00',1,0,0,0),(5,'Phil Mickelson','+265 88 333 333 22','mail@mail.com','Lilongwe','Salima','2023-12-15 00:00:00','2023-11-15 09:00:00','2023-11-15 11:00:00',3,0,0,0),(6,'Natasha Little','+265 88 3333 5555','mail@mail.com','Lilongwe','Mangochi','2023-12-24 00:00:00','2023-10-24 11:30:00','2023-10-24 17:30:00',2,0,1,0);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06 10:35:07
