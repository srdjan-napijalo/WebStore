CREATE DATABASE  IF NOT EXISTS `web_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `web_store`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: web_store
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beverage`
--

DROP TABLE IF EXISTS `beverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `beverage` (
  `beverage_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `volume` int(11) NOT NULL,
  `alcohol` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`beverage_id`),
  CONSTRAINT `product_fk` FOREIGN KEY (`beverage_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverage`
--

LOCK TABLES `beverage` WRITE;
/*!40000 ALTER TABLE `beverage` DISABLE KEYS */;
INSERT INTO `beverage` VALUES (7,'Non-alcoholic',750,0),(8,'Non-alcoholic',500,0),(9,'Alcoholic',500,5),(10,'Alcoholic',750,11),(11,'Alcoholic',750,34),(12,'Non-Alcoholic',750,0),(15,'Non-Alcoholic',500,0),(16,'Non-Alcoholic',200,0),(70,'Non-Alcoholic',200,0);
/*!40000 ALTER TABLE `beverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `purchases` int(11) NOT NULL DEFAULT '0',
  `account_balance` decimal(6,2) DEFAULT '100.00',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'Second','Test Subject','test2@mail.com','testpw',3,50.00),(3,'First','Last','firstLast@mail.com','lastPassword',2,100.00),(4,'Noob','Newbie','new_customer@mail.com','noob123',3,25.00),(5,'Srdjan','Napijalo','srdjan@gmail.com','srki1234',0,100.00),(6,'Mihailo','Napijalo','srdjan2323132@gmail.com','srki1234',0,100.00),(7,'UNKNOWN','VISITOR','unregistered@customers.com','123456789',1000,1000.00);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `food` (
  `food_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`food_id`),
  CONSTRAINT `food_fk` FOREIGN KEY (`food_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,75,''),(2,100,''),(3,100,''),(4,100,''),(5,100,''),(6,100,''),(13,125,'Snack'),(14,160,'Vegetables'),(71,1200,'Meat');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `bar_code` int(11) NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `image` varchar(45) DEFAULT NULL,
  `description` tinytext,
  `orign` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Diet peanuts',6.00,634346727,5,15,'images/peanuts.jpg',NULL,NULL),(2,'Potato chips',5.00,64672711,5,22,'images/chips.jpg',NULL,NULL),(3,'Popcorn',4.00,64699197,5,21,'images/popcorn.jpg',NULL,NULL),(4,'Chestnut',6.00,91323569,5,17,'images/chestnut.jpg',NULL,NULL),(5,'Almonds',8.00,11641727,5,17,'images/almonds.jpg',NULL,NULL),(6,'Walnuts',7.00,61346885,5,21,'images/walnuts.jpg',NULL,NULL),(7,'Juice',5.00,997346727,5,22,'images/juice.jpg',NULL,NULL),(8,'Lemonade',7.00,53112711,5,21,'images/lemonade.jpg',NULL,NULL),(9,'Beer',5.00,64777197,5,21,'images/beer.jpg',NULL,NULL),(10,'Wine',6.00,91323569,5,21,'images/wine.jpg',NULL,NULL),(11,'Brandy',12.00,15566927,5,21,'images/brandy.jpg',NULL,NULL),(12,'Water',2.00,11346454,5,21,'images/water.jpg',NULL,NULL),(13,'Peanuts',6.00,634346727,5,21,'images/peanuts.jpg',NULL,NULL),(14,'Pickles',6.54,126618567,5,20,'images/pickles.jpg',NULL,NULL),(15,'Ice tea',6.43,123123131,5,20,'images/tea.jpg',NULL,NULL),(16,'Ice coffee',4.68,553444131,5,20,'images/coffee.jpg',NULL,NULL),(70,'Chocolate coffee',9.99,13332325,5,20,'images/chococoffee.jpg','This product is sweet!!!','Serbia'),(71,'Ham',14.99,14551234,5,20,'images/ham.jpg','Traditional recepie!!!','Serbia');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchase` (
  `customer_fk` int(11) NOT NULL,
  `product_fk` int(11) NOT NULL,
  `time_of_purchase` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_fk`,`product_fk`,`time_of_purchase`),
  KEY `product_purchase_idx` (`product_fk`),
  CONSTRAINT `customer_purchase` FOREIGN KEY (`customer_fk`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `product_purchase` FOREIGN KEY (`product_fk`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (4,1,'2019-09-05 01:59:20'),(4,1,'2019-09-05 02:01:08'),(4,1,'2019-09-05 02:01:09'),(4,1,'2019-09-05 02:02:54'),(4,1,'2019-09-05 02:05:52'),(4,1,'2019-09-05 02:10:18'),(2,4,'2019-09-05 02:13:00'),(2,4,'2019-09-05 02:13:10'),(4,4,'2019-09-05 02:15:42'),(4,4,'2019-09-05 02:15:44'),(4,4,'2019-09-05 02:25:16'),(4,5,'2019-09-05 02:13:47'),(4,5,'2019-09-05 02:14:35'),(4,5,'2019-09-05 02:15:00'),(4,5,'2019-09-05 02:26:30');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `purchase_view`
--

DROP TABLE IF EXISTS `purchase_view`;
/*!50001 DROP VIEW IF EXISTS `purchase_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `purchase_view` AS SELECT 
 1 AS `Full Name`,
 1 AS `Purchases`,
 1 AS `Product name`,
 1 AS `Products left`,
 1 AS `Time of purchase`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `seen`
--

DROP TABLE IF EXISTS `seen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seen` (
  `product_fk` int(11) NOT NULL,
  `customer_fk` int(11) NOT NULL,
  `first_time_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_time_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `times_seen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_fk`,`customer_fk`),
  KEY `fk_customer_seen_idx` (`customer_fk`),
  CONSTRAINT `customer_seen` FOREIGN KEY (`customer_fk`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `product_seen` FOREIGN KEY (`product_fk`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seen`
--

LOCK TABLES `seen` WRITE;
/*!40000 ALTER TABLE `seen` DISABLE KEYS */;
INSERT INTO `seen` VALUES (1,7,'2019-09-10 13:51:58','2019-09-16 19:52:52',4),(2,2,'2019-09-10 08:32:15','2019-09-10 08:32:39',2),(2,7,'2019-09-10 13:51:57','2019-09-16 00:31:10',4),(3,5,'2019-09-10 13:28:24','2019-09-10 13:28:24',1),(3,7,'2019-09-10 14:10:48','2019-09-10 14:10:48',1),(4,7,'2019-09-16 00:30:54','2019-09-16 00:30:54',1),(5,5,'2019-09-10 12:45:12','2019-09-16 19:53:54',16),(5,7,'2019-09-10 13:51:54','2019-09-17 12:58:42',5),(6,7,'2019-09-10 14:06:40','2019-09-17 12:58:57',6),(8,7,'2019-09-16 19:52:34','2019-09-17 12:58:58',6),(11,7,'2019-09-10 14:06:47','2019-09-10 14:25:07',2),(12,7,'2019-09-10 14:06:45','2019-09-10 14:06:45',1),(14,7,'2019-09-17 12:58:30','2019-09-17 12:58:54',2),(70,7,'2019-09-16 00:31:08','2019-09-17 12:58:48',4);
/*!40000 ALTER TABLE `seen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `purchase_view`
--

/*!50001 DROP VIEW IF EXISTS `purchase_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `purchase_view` AS select concat(`customer`.`first_name`,' ',`customer`.`last_name`) AS `Full Name`,`customer`.`purchases` AS `Purchases`,`product`.`product_name` AS `Product name`,`product`.`quantity` AS `Products left`,`purchase`.`time_of_purchase` AS `Time of purchase` from ((`customer` join `product`) join `purchase`) where ((`customer`.`customer_id` = `purchase`.`customer_fk`) and (`product`.`product_id` = `purchase`.`product_fk`)) */;
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

-- Dump completed on 2019-09-18  1:59:05
