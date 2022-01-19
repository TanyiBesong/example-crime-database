-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crime
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `county` (
  `county_id` int NOT NULL,
  `county_name` varchar(20) DEFAULT NULL,
  `population` int DEFAULT NULL,
  PRIMARY KEY (`county_id`),
  KEY `county_name_idx` (`county_name`),
  CONSTRAINT `county_name` FOREIGN KEY (`county_name`) REFERENCES `crime` (`crm_county`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `county`
--

LOCK TABLES `county` WRITE;
/*!40000 ALTER TABLE `county` DISABLE KEYS */;
INSERT INTO `county` VALUES (1,'winona county',50000),(2,'wabasha county',21627),(3,'houston county',18600),(4,'olmsted county',158293),(5,'dakota county',429021),(6,'hennepin county',1266000);
/*!40000 ALTER TABLE `county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `court`
--

DROP TABLE IF EXISTS `court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `court` (
  `crt_id` int NOT NULL,
  `crt_location` varchar(20) DEFAULT NULL,
  `crt_date` date DEFAULT NULL,
  `crt_time` time DEFAULT NULL,
  `verdict` enum('guilty','not guilty','mistrial') DEFAULT NULL,
  PRIMARY KEY (`crt_id`),
  KEY `crt_location_idx` (`crt_location`),
  CONSTRAINT `crt_id` FOREIGN KEY (`crt_id`) REFERENCES `crime` (`crm_id`),
  CONSTRAINT `crt_location` FOREIGN KEY (`crt_location`) REFERENCES `crime` (`crm_county`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `court`
--

LOCK TABLES `court` WRITE;
/*!40000 ALTER TABLE `court` DISABLE KEYS */;
INSERT INTO `court` VALUES (1,'winona county','2021-10-15','12:31:21','guilty'),(2,'hennepin county','2021-08-05','18:46:34','guilty'),(3,'winona county','2021-10-15','13:25:59','guilty'),(4,'winona county','2021-09-17','16:17:45','not guilty'),(5,'wabasha county','2021-11-05','20:20:38','guilty'),(6,'wabasha county','2021-05-25','12:32:17','guilty'),(7,'houston county','2021-01-23','12:44:18','guilty'),(8,'winona county','2021-02-07','22:55:03','guilty'),(9,'winona county','2021-07-02','15:50:33','not guilty'),(10,'winona county','2021-12-12','12:12:12','guilty'),(11,'olmsted county','2021-06-11','15:27:11','guilty'),(12,'olmsted county','2021-09-14','04:22:41','guilty'),(13,'winona county','2021-10-13','17:34:22','guilty'),(14,'winona county','2021-10-13','23:46:10','not guilty'),(15,'houston county','2021-03-23','08:01:54','guilty'),(16,'dakota county','2021-05-10','13:37:33','guilty');
/*!40000 ALTER TABLE `court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime`
--

DROP TABLE IF EXISTS `crime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crime` (
  `crm_id` int NOT NULL,
  `crm_county` varchar(45) DEFAULT NULL,
  `crm_type` varchar(45) DEFAULT NULL,
  `crm_desc` varchar(100) DEFAULT NULL,
  `crm_location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_id`),
  KEY `crm_county_idx` (`crm_county`),
  CONSTRAINT `crm_county` FOREIGN KEY (`crm_county`) REFERENCES `county` (`county_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime`
--

LOCK TABLES `crime` WRITE;
/*!40000 ALTER TABLE `crime` DISABLE KEYS */;
INSERT INTO `crime` VALUES (1,'winona county','ARSON','male set a store on fire','winona minnesota'),(2,'hennepin county','ARMED ROBBERY','Woman robbed money from store with illegal firearm','great bank (minneapolis, MN)'),(3,'winona county','Child Abuse','Father was abusing his children','Winona Minnesota'),(4,'winona county','Theft','Teenage female caught stealing multiple earings','Target (Winona, MN)'),(5,'wabasha county','DUI','Teenage male was drinking and driving ','Wabasha Minnesota '),(6,'wabasha county','Stalking','Elderly man caught multiple times following children home from school','Wabasha Minnesota '),(7,'houston county','Vandalism','Teen found spraypainting the side of a building','Houston Minnesota '),(8,'winona county','Rape','Young man sexually assulted a peer','Winona Minnesota '),(9,'winona county','Drug Trfficking','Young man was caught selling illegal narcotics','Winona Minnesota '),(10,'winona county','Child Abandonment','Mother left her 5 year old child alone for 3 days','Winona Minnesota '),(11,'olmsted county','Murder: First-degree','Man murdered another man','Olmsted Minnesota '),(12,'olmsted county','Arson','Man set his neighbors house on fire during dispute','Olmsted Minnesota '),(13,'winona county','Cyberbullyig','teen girl was cyberbulling peers on social media','Winona Minnesota '),(14,'winona county','Aggravated Assult','Man got into a brawl after he left the bar','Winona Minnesota '),(15,'houston county','Kidnapping','Man kidnapped young girl','Houston Minnesota '),(16,'dakota county','Public intoxication','Woman was drinking liquor and was very drunk at a public park','Apple Valley Minnesota ');
/*!40000 ALTER TABLE `crime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers_license`
--

DROP TABLE IF EXISTS `drivers_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers_license` (
  `license_id` int NOT NULL,
  `age` int DEFAULT NULL,
  `height` varchar(45) DEFAULT NULL,
  `eye_clr` varchar(45) DEFAULT NULL,
  `hair_clr` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `plate_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`license_id`),
  CONSTRAINT `license_id` FOREIGN KEY (`license_id`) REFERENCES `person` (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers_license`
--

LOCK TABLES `drivers_license` WRITE;
/*!40000 ALTER TABLE `drivers_license` DISABLE KEYS */;
INSERT INTO `drivers_license` VALUES (19283746,24,'6 6','brown','black','Male','682 FJE'),(36827527,51,'6 2','blue','blonde','Male','187 KFC'),(123456789,24,'5 10','Green','Blonde','Male','364 HGZ'),(561782634,16,'5 11','green','black','Male','302 TNK'),(567123098,13,'4 10','blue','blonde','Female',NULL),(576978132,28,'6 4','brown','brown','Male','817 FXJ'),(612873982,17,'5 9','blue','brown','Male','458 HML'),(657483921,27,'6 4','brown','black','Male','201 RTE'),(672864398,17,'5 6','blue','green','Female','678 ZHG'),(672981326,37,'5 3','blue','blonde','Female','329 WSX'),(692483065,68,'5 9','blue','grey','Male','734 OLD'),(781236349,43,'5 9','blue','blonde','Male','821 XZC'),(786519824,39,'5 4','blue','blonde','Female','435 DDZ'),(913765274,55,'6 7','dark brown','black','Male','391 VRT'),(987654321,32,'5 4','blue','Blonde','Female','765 CDR'),(998877654,46,'6 4','brown','dark brown','Male','744 YUZ');
/*!40000 ALTER TABLE `drivers_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `ssn` int NOT NULL,
  `license_id` int NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `crm_id` int NOT NULL,
  PRIMARY KEY (`ssn`,`license_id`,`crm_id`),
  KEY `crm_id_idx` (`crm_id`),
  KEY `licqense_id_idx` (`license_id`),
  CONSTRAINT `crm_id` FOREIGN KEY (`crm_id`) REFERENCES `crime` (`crm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (19467296,913765274,'Michael','Myers',12),(91242786,781236349,'Damon','Demons',11),(91273658,36827527,'Jimmy','John',15),(98654123,567123098,'Tina','Teeny',13),(123456789,612873982,'Mike','Noss',7),(231520746,576978132,'Jack','Black',14),(428281378,561782634,'Moose','Robbins',5),(436478105,987654321,'sarah','stinger',2),(482216329,123456789,'John','Doe',1),(572904811,692483065,'Roddrick','Heugel',6),(657208968,672864398,'Vicki','Mooze',4),(677140786,998877654,'Derek','Mauer',3),(792351845,786519824,'Michele','Moody',10),(809765132,672981326,'Rubie','Smith',16),(892354793,657483921,'Jose','Rouse',9),(987654321,19283746,'Gupta','Ramirez',8);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-01 15:41:30
