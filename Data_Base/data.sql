-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: petstore
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_item_id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `variant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FK3fx72yo9k5xauka8mlto7a8bf` (`variant_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FK3fx72yo9k5xauka8mlto7a8bf` FOREIGN KEY (`variant_id`) REFERENCES `product_variant` (`variant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Loyal companions for every home','Dogs','c650d7c6-0aa2-4477-99b6-9d9ff73b62f9_K9-RT-02.jpg'),(3,'Cute, calm, and lovable pets','Cats','1431f400-a225-4f8c-88f0-a0a401344bda_EST-17.jpg'),(4,'Exotic pets with unique charm','Reptiles','7fa8c05d-2379-4e6d-94d6-c8639fef4063_RP-LI-02.jpg'),(26,'Peaceful beauty for your aquarium','Fish','0cb953cb-4ed0-4ff0-809b-e56a226734ec_EST-2.jpg'),(27,'Colorful pets full of joy','Birds','d0de4a99-8393-4532-856f-b0a4eb24cc01_AV-CB-01.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `variant_id` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,899,2,'EST-2',1),(2,249,6,'EST-20',1),(3,899,2,'EST-1',1),(4,249,4,'EST-21',2),(5,999,1,'EST-5',2),(6,999,2,'EST-4',2),(7,899,3,'EST-1',3),(8,999,2,'EST-5',3),(9,249,20,'EST-20',4),(13,249,265,'EST-20',8),(17,249,1,'EST-20',12),(18,7000,1,'EST-7',13),(19,6500,2,'EST-15',14),(20,7000,2,'EST-14',14);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expiry_date` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'12, Anna Nagar West','4111111111111111','VISA','Chennai','India','2026-04-28 10:15:00.905311','12/28','demo','9876543210','600040','Tamil Nadu','SHIPPED',5090,1),(2,'12, Anna Nagar West','4111111111111111','VISA','Chennai','India','2026-04-28 10:29:36.909647','12/28','demo','9876543210','600040','Tamil Nadu','ORDERED',3993,1),(3,'sample','34324324324','vdw','dsfd','ffw','2026-05-01 23:43:53.097930','34/34','sample','343432','34433','sdf','Delivered',4695,2),(4,'sample','234235','visa','erode','Ind','2026-05-12 10:53:41.374773','12/2026','Demo','234234234','35435','TN','Delivered',4980,1),(8,'sample','234235','visa','erode','Ind','2026-05-12 14:58:54.932894','12/2026','Demo','234234234','35435','TN','CANCELLED',65985,1),(12,'sample','234235','visa','erode','Ind','2026-05-12 15:13:19.746504','12/2026','Demo','234234234','35435','TN','DELIVERED',249,1),(13,'sample','3243423423423423','Visa','erode','Ind','2026-05-21 09:10:11.810987','12/2028','user','5464546565','35454','TN','Processing',7000,1),(14,'sample','2342343242342342','Visa','erode','Ind','2026-05-21 09:51:05.211330','12/2029','user','5464565653','35454','TN','Processing',27000,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('AV-CB-01','','41757a7b-1d39-4878-bd68-12998edd89ec_AV-CB-01.jpg','Amazon Parrot',27),('AV-SB-02','','663b0c55-fc77-485d-a4b3-5444a1c93633_AV-SB-02.jpg','Finch',27),('FI-FW-01','','9b3bacc0-25ec-4301-9b16-6c6acc0204e9_FI-FW-01.jpg','Koi',26),('FI-FW-02','','9f5c2bc1-522c-4585-8ef4-daa86fbe1a1f_FI-FW-02.jpg','Goldfish',26),('FI-SW-01','','1704ac28-3e7f-4066-ad6e-197f33d00afb_FI-SW-01.jpg','Angelfish',26),('FI-SW-02','','66dca21d-6c25-47a8-a2dd-a3d631bd1dce_FI-SW-02.jpg','Tiger Shark',26),('FL-DLH-02','','448b3f4d-81da-48fb-b978-f7df7190eace_FL-DLH-02.jpg','Persian',3),('FL-DSH-01','','af612dfc-bf93-46a6-8551-a99281dded1f_FL-DSH-01.jpg','Manx',3),('K9-BD-01','','4a282b41-9f1b-4338-9805-6f7598831f83_K9-BD-01.jpg','Bulldog',2),('K9-CW-01','','bef45eef-2c29-41ea-9a01-99fb1b994697_K9-CW-01.jpg','Chihuahua',2),('K9-DL-01','','db5ea7b4-9834-4f26-8a18-4e6f4792b800_K9-DL-01.jpg','Dalmation',2),('K9-PO-02','','f2c99d13-6be9-4607-bd30-4d6ecb0fa3b5_K9-PO-02.jpg','Poodle',2),('K9-RT-01','','0a813c1f-2ce4-436f-a1f4-387802dc368b_K9-RT-01.jpg','Golden Retriever',2),('K9-RT-02','','a89e8156-e832-404a-bce9-a4d30dbb8674_K9-RT-02.jpg','Labrador Retriever',2),('RP-LI-02','','9834cae7-97fe-44f8-92f0-e6a72dcf3b15_RP-LI-02.jpg','Iguana',4),('RP-SN-01','','8aa6fffb-e58e-4ef7-8aec-3d17474119a7_RP-SN-01.jpg','Rattlesnake',4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variant` (
  `variant_id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `stock_quantity` int NOT NULL,
  `product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `FKgrbbs9t374m9gg43l6tq1xwdj` (`product_id`),
  CONSTRAINT `FKgrbbs9t374m9gg43l6tq1xwdj` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variant`
--

LOCK TABLES `product_variant` WRITE;
/*!40000 ALTER TABLE `product_variant` DISABLE KEYS */;
INSERT INTO `product_variant` VALUES ('EST-1','Graceful and eye-catching, the Angelfish is admired for its elegant fins and stunning aquatic beauty','f0a72bc2-252b-41db-845e-bbf5a96b7c95_EST-1.jpg','Large Angelfish',899,70,'FI-SW-01'),('EST-10','Famous for striking spotted coat, this energetic and intelligent breed makes a loyal and playful companion','5a276a27-af4d-4971-a268-9eae9e2c40ce_EST-10.jpg','Spotted Adult Female Dalmation',7500,200,'K9-DL-01'),('EST-11','Powerful captivating, the rattlesnake is known for its distinctive rattle, unique patterns, and remarkable survival instincts','dffa0140-f1ec-49a4-b2fe-e457baa9afac_ESt-11.jpg','Venomless Rattlesnake',14000,50,'RP-SN-01'),('EST-12','A striking reptile with a bold presence, admired for its natural beauty and fascinating characteristics','c24c18d8-814f-4d6f-9787-e4ef2e46100d_EST-12.jpg','Rattleless Rattlesnake',11000,40,'RP-SN-01'),('EST-13','Exotic, calm, and fascinating, the iguana is a unique reptile admired for its striking appearance and peaceful nature','f4c03458-2bd2-4031-b0d6-41ec7384e7d0_EST-13.jpg','Green Adult Iguana',7000,258,'RP-LI-02'),('EST-14','Majestic, fluffy, and incredibly friendly, this gentle giant is loved for its playful nature and striking appearance','a185eef0-8d25-4ecd-a5a8-a58a0bd4b5cd_EST-14.jpg','Tailless Manx',7000,78,'FL-DSH-01'),('EST-15','A perfect blend of elegance and affection, the Manx is an intelligent and loyal companion for every home','fa9e64b1-3c75-4944-802b-545215c6d86c_EST-15.jpg','With tail Manx',6500,98,'FL-DSH-01'),('EST-16','Graceful and affectionate, the Persian cat is adored for its luxurious coat, calm personality, and charming looks','770b252f-ed41-4713-8a9a-807cd4a95fc7_EST-16.jpg','Adult Female Persian',7000,200,'FL-DLH-02'),('EST-17','Soft, elegant, and irresistibly cuddly, this royal feline brings comfort, beauty, and companionship to any family','0dc2cc92-19b7-41fb-b16b-8e11fa913b72_EST-17.jpg','Adult Male Persian',6500,160,'FL-DLH-02'),('EST-18','Intelligent, vibrant, and full of personality, the Amazon Parrot is a lively companion known for its playful charm and colorful beauty','e87013c8-d63a-4d2a-90ff-237800abcd4d_EST-18.jpg','Adult Male Amazon Parrot',2499,30,'AV-CB-01'),('EST-19','Small, cheerful, and beautifully colored, the Flinch brings energy, sweetness, and melody to every bird lover\'s home','4a794e03-5b10-49ff-b373-d261420d5d3b_EST-19.jpg','Adult Male Finch',1999,50,'AV-SB-02'),('EST-2','A perfect blend of elegance and color, the Angelfish adds sophistication to any aquarium setup','b8aac344-e1a3-4df9-87f9-a0d62cdfc390_EST-2.jpg','Small Angelfish',699,100,'FI-SW-01'),('EST-20','Bright, playful, and easy to love, the Golde fish is a timeless favorite for aquariums of all sizes','968dcb21-d2a9-47d6-b56e-7b41a934f66e_EST-20.jpeg','Adult Male Goldfish',1199,200,'FI-FW-02'),('EST-21','With its shimmering colors and gentle swimming style, the Gold Fish brings charm and tranquility to every home','8a950067-77a4-44a2-9547-1de0c3b455db_EST-21.jpg','Adult Female Goldfish',1099,200,'FI-FW-02'),('EST-22','Friendly, intelligent, and full of energy, this loyal companion is perfect for families and active lifestyle','9986ce70-a6bc-47fd-b58e-88ad08e85a36_EST-22.jpg','Adult Male Labrador Retriever',12000,100,'K9-RT-02'),('EST-23','Known for its loving nature and playful personality, the Labrador Retriever brings joy and companionship everywhere it goes','39d033ec-6b04-4c4f-9019-880f0e661352_EST-23.jpg','Adult Female Labrador Retriever',11000,150,'K9-RT-02'),('EST-24','A gentle and affectionate breed with a strong build, cheerful spirit, and unmatched loyalty','e4e9e296-5112-4933-aa3a-7e13435c427b_EST-24.jpg','Adult Male Labrador Retriever',13000,150,'K9-RT-02'),('EST-25','Smart, social, and easy to love, this energetic companion is a favorite among pet lovers worldwide','571138b6-0b96-48f1-a0b0-d3e1f9eaf80b_EST-25.jpg','Adult Female Labrador Retriever',12000,150,'K9-RT-02'),('EST-26','Small in size but full of personality, this energetic and affectionate companion is perfect for loving homes','d79cf9c4-729c-4ec1-a1d6-b26661258920_EST-26.jpg','Adult Male Chihuahua',11000,200,'K9-CW-01'),('EST-27','A tiny bundle of charm and confidence, known for its loyalty, playful spirit, and adorable appearance','73625a1d-7289-4d4d-8a34-d52c88ec547f_EST-27.jpg','Adult Female Chihuahua',10000,200,'K9-CW-01'),('EST-28','A perfect family companion with beautiful golden coat and known for its playfulness and endless loyalty','45ad4e29-2210-473e-ba33-d40f8862448d_EST-28.jpg','Adult Female Golden Retriever',14000,100,'K9-RT-01'),('EST-3','Bold, powerful, and unforgettable, the Tiger Shark is admired for its striking patterns and commanding ocean presence','d0dd1abf-fa37-4c78-aa1b-d3881ece9864_EST-3.jpg','Toothless Tiger Shark',1999,20,'FI-SW-02'),('EST-4','Elegant and colorful, the Koi fish symbolizes beauty, harmony, and prosperity in every aquarium or pond','5c001160-c3c1-464f-8b47-5c1ed0de67ee_EST-4.jpg','Spotted Koi',999,400,'FI-FW-01'),('EST-5','Known for its vibrant patterns and graceful movement, the Koi adds a peaceful and luxurious touch to any water space','9586ed1d-f3bf-48be-9ad9-36b0e52443b3_EST-5.jpeg','Spotless Koi',899,0,'FI-FW-01'),('EST-6','A powerful yet gentle companion with a lovable personality, iconic wrinkled face and loyal nature','b71984e8-6d45-42ee-8b7b-2be71bab6711_EST-6.jpg','Male Adult Bulldog',8000,300,'K9-BD-01'),('EST-7','Bold in looks, gentle at heart. A loyal and affectionate breed that brings charm and companionship to every home','3560e4b1-a5e7-4d78-bb83-bb7bf47a506b_EST-7.jpg','Female Puppy Bulldog',7000,299,'K9-BD-01'),('EST-8','With its soft curls and playful spirit, the Poodle puppy is a loving companion that brightens every moment of life','24948029-3063-4fec-8a95-9c560105429a_EST-8.jpg','Male Puppy Poodle',8000,250,'K9-PO-02'),('EST-9','Elegant, active, and full of charm, the Dalmatian is a perfect blend of beauty, loyalty, and endless energy','07928188-8403-4c51-a783-7958978b1466_EST-9.jpg','Spotless Male Puppy Dalmation',8000,200,'K9-DL-01');
/*!40000 ALTER TABLE `product_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ph_no` bigint NOT NULL,
  `pincode` int NOT NULL,
  `role` enum('ROLE_ADMIN','ROLE_USER') NOT NULL,
  `state` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sample','erode','Ind','user@gmail.com','$2a$12$uR11/aO29FoC/h508E.x1.ELTaCFVEEoW5dhXSHXN5U67Oxfsa6Cy',546456565,35454,'ROLE_USER','TN','user'),(2,'sample','erode','Ind','admin@gmail.com','$2a$12$EsDcoHZS4urTNdlH2su2dexR7mwKB6ni/KihKdCZna3vkfQ26G7NW',546456565,35454,'ROLE_ADMIN','TN','admin'),(3,'sample','erode','Ind','sample@gmail.com','$2a$12$q6j8nYzyZefui4IbEf0pVebHMpOKwcLQ9Fw6hXGOR/ngtN8aq54Z6',546456565,35454,'ROLE_USER','TN','sample');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-21 11:09:46
