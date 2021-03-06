CREATE DATABASE  IF NOT EXISTS `u684253104_impcg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `u684253104_impcg`;
-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: u684253104_impcg
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ItemFechamento`
--

DROP TABLE IF EXISTS `ItemFechamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItemFechamento` (
  `idItemFechamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idFechamento` bigint(20) DEFAULT NULL,
  `idTramite` bigint(20) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`idItemFechamento`),
  UNIQUE KEY `idItemFechamento_UNIQUE` (`idItemFechamento`),
  KEY `FKinkchjs0va7mlg8hjciw5jmxg` (`idFechamento`),
  KEY `FKfff2sgnu04r92ymoed36jk8ut` (`idTramite`),
  CONSTRAINT `FKfff2sgnu04r92ymoed36jk8ut` FOREIGN KEY (`idTramite`) REFERENCES `tramite` (`idTramite`),
  CONSTRAINT `FKinkchjs0va7mlg8hjciw5jmxg` FOREIGN KEY (`idFechamento`) REFERENCES `fechamento` (`idFechamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemFechamento`
--

LOCK TABLES `ItemFechamento` WRITE;
/*!40000 ALTER TABLE `ItemFechamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemFechamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacao`
--

DROP TABLE IF EXISTS `aplicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplicacao` (
  `idAplicacao` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCaixa` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`idAplicacao`),
  UNIQUE KEY `idAplicacao_UNIQUE` (`idAplicacao`),
  KEY `FKlnmaij18kkhajo2asxi07dvvm` (`idCaixa`),
  CONSTRAINT `FKlnmaij18kkhajo2asxi07dvvm` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacao`
--

LOCK TABLES `aplicacao` WRITE;
/*!40000 ALTER TABLE `aplicacao` DISABLE KEYS */;
INSERT INTO `aplicacao` VALUES (1,1,'Aplicação para viabilidade de nova aquisiçao de produtos para venda','2018-02-03',800.00),(2,1,'Aplicação feito pela Luana para futuro pagamento do primerio cheque de (833,33) do celular dela.','2018-03-14',450.00),(3,7,'Aplicação de 2000,00 para compra de Iphone 8 Plus 64Gb','2018-04-05',2000.00);
/*!40000 ALTER TABLE `aplicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baixa`
--

DROP TABLE IF EXISTS `baixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baixa` (
  `idBaixa` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) DEFAULT NULL,
  `valorTotal` decimal(19,2) NOT NULL,
  `dataCriacao` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idBaixa`),
  UNIQUE KEY `idBaixa_UNIQUE` (`idBaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baixa`
--

LOCK TABLES `baixa` WRITE;
/*!40000 ALTER TABLE `baixa` DISABLE KEYS */;
INSERT INTO `baixa` VALUES (1,'Lançamento de despesas - Compra de Produtos (23/09/2017)',3100.70,'2017-09-27','BAIXATOTALMENTE'),(2,'Lançamento de Despesas - Compra de Produtos (12/10/2017)',5516.61,'2017-10-13','BAIXATOTALMENTE'),(3,'Lançamento de Despesas - Compra de Produtos (20/10/2017)',2400.00,'2017-10-20','BAIXATOTALMENTE'),(4,'Lançamento de Despesas - Compra de Produtos (22/10/2017)',283.05,'2017-10-22','BAIXATOTALMENTE'),(5,'Lançamento de despesas - Compra de Produtos (02/11/2017)',3807.97,'2017-11-02','BAIXATOTALMENTE'),(6,'Compra de sacolas (Central Embalagens)',32.70,'2017-10-13','BAIXATOTALMENTE'),(7,'500 Cartões de Visita (Printi)',25.64,'2017-10-27','BAIXATOTALMENTE'),(8,'Lançamento de despesas - Compra de Produtos (06/11/2017)',2872.00,'2017-11-06','BAIXATOTALMENTE'),(9,'Lançamento de despesas - Compra de Produtos (11/11/2017)',9977.81,'2017-11-13','BAIXATOTALMENTE'),(10,'Compra de sacolas (Central Embalagens)',44.65,'2017-11-13','BAIXATOTALMENTE'),(11,'Lançamento de Despesas - Compra de Produtos (25/11/2017)',2170.08,'2017-11-27','BAIXATOTALMENTE'),(12,'Lançamento de Despesas - Compra de Produtos (03/12/2017)',83.01,'2017-12-03','BAIXATOTALMENTE'),(13,'Lançamento de Despesas - Compra de Produtos (11/12/2017)',5830.98,'2017-12-11','BAIXATOTALMENTE'),(14,'Troca dos 2(Dois) Pneus dianteiros + Balanceamento',340.00,'2017-12-12','BAIXATOTALMENTE'),(15,'Compra de sacolas (Central Embalagens)',50.00,'2017-12-14','BAIXATOTALMENTE'),(16,'Lançamento de Despesas - Compra de Produtos (16/12/2017)',6019.63,'2017-12-18','BAIXATOTALMENTE'),(17,'Lançamento de Despesas - Compra de Produtos (19/12/2017)',3312.96,'2017-12-19','BAIXATOTALMENTE'),(18,'Lançamento de Despesas - Compra de Produtos (21/12/2017)',3347.96,'2017-12-21','BAIXATOTALMENTE'),(19,'Compras na China',364.78,'2018-01-08','BAIXATOTALMENTE'),(20,'Mensalidade Stim Social',29.96,'2018-01-08','BAIXATOTALMENTE'),(21,'Lançamento de Despesas - Compra de Produtos (09/01/2018)',4789.49,'2018-01-10','BAIXATOTALMENTE'),(22,'Lançamento de Despesas - Compra de Produtos (20/01/2018)',4241.73,'2018-01-22','BAIXATOTALMENTE'),(23,'Lançamento de Despesas - Compra de Produtos (02/02/2018)',5075.00,'2018-02-06','BAIXATOTALMENTE'),(24,'Lançamento de Despesas - Compra de Produtos (03/02/2018)',4132.12,'2018-02-06','BAIXATOTALMENTE'),(25,'Lançamento de Despesas - Compra de Produtos (05/02/2018)',1268.00,'2018-02-06','BAIXATOTALMENTE'),(26,'Lançamento de Despesas - Compra de Produtos (03/02/2018)',167.50,'2018-02-06','BAIXATOTALMENTE'),(27,'Lançamento de Despesas - Compra de Produtos (17/02/2018)',5388.65,'2018-02-19','BAIXATOTALMENTE'),(28,'Lançamento de Despesas - Compra de Produtos (19/02/2018)',517.44,'2018-02-19','BAIXATOTALMENTE'),(29,'Lançamento de Despesas - Compra de Produtos (28/02/2018)',5413.40,'2018-02-28','BAIXATOTALMENTE'),(30,'Lançamento de Despesas - Compra de Produtos (03/03/2018)',4230.57,'2018-03-05','BAIXAPARCIALMENTE'),(31,'Lançamento de Despesas - Compra de Produtos (03/03/2018)',143.96,'2018-03-05','BAIXATOTALMENTE'),(32,'Despesas com envio de Produtos',54.20,'2018-03-05','BAIXATOTALMENTE'),(33,'Compra de sacolas (Central Embalagens)',24.50,'2018-03-06','BAIXATOTALMENTE'),(34,'Despesa com Envio de produto com problema (Bracelet Axxis)',40.00,'2018-03-13','BAIXATOTALMENTE'),(35,'Lançamento de Despesas - Compra de Produtos (12/03/2018)',4743.00,'2018-03-13','BAIXAPARCIALMENTE'),(36,'Lançamento de Despesas - Compra de Produtos (17/03/2018)',5486.54,'2018-03-19','BAIXAPARCIALMENTE'),(37,'Lançamento de Despesas - Compra de Produtos (19/03/2018)',133.77,'2018-03-19','BAIXATOTALMENTE'),(38,'Lançamento de Despesas - Compra de Produtos (20/03/2018)',53.44,'2018-03-20','BAIXATOTALMENTE'),(39,'Compra de sacolas (Central Embalagens)',40.00,'2018-03-23','BAIXATOTALMENTE'),(40,'Lançamento de Despesas - Compra de Produtos (31/03/2018)',1706.53,'2018-04-02','BAIXATOTALMENTE'),(41,'Lançamento de Despesas - Compra de Produtos (05/04/2018)',3318.34,'2018-04-06','BAIXATOTALMENTE'),(42,'Lançamento de Despesas - Compra de Produtos (09/04/2018)',3391.20,'2018-04-09','BAIXAPARCIALMENTE');
/*!40000 ALTER TABLE `baixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `idCaixa` bigint(20) NOT NULL AUTO_INCREMENT,
  `idConta` bigint(20) NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`idCaixa`),
  UNIQUE KEY `idCaixa_UNIQUE` (`idCaixa`),
  KEY `FKem1qeomf7cfi9cmt3ofh1ne04` (`idConta`),
  CONSTRAINT `FKem1qeomf7cfi9cmt3ofh1ne04` FOREIGN KEY (`idConta`) REFERENCES `conta` (`idConta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,6,0.00),(2,7,170.26),(3,4,0.00),(4,8,0.00),(5,1,0.00),(6,9,0.00),(7,2,2862.58),(8,3,335.00),(9,10,0.00);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogoInternacional`
--

DROP TABLE IF EXISTS `catalogoInternacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogoInternacional` (
  `idCatalogoInternacional` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProduto` bigint(20) NOT NULL,
  `idFornecedor` bigint(20) NOT NULL,
  `idItemEntrada` bigint(20) DEFAULT NULL,
  `valorEmDolar` decimal(19,2) NOT NULL,
  `valorEmReal` decimal(19,2) NOT NULL,
  `cotacao` decimal(19,2) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`idCatalogoInternacional`),
  UNIQUE KEY `idCatalogoInternacional_UNIQUE` (`idCatalogoInternacional`),
  KEY `FKbkk2fjqfm3tr4bv7ala0jcq9n` (`idFornecedor`),
  KEY `FKxmtseedf86cau3qthkv58uji` (`idItemEntrada`),
  KEY `FKcg9wpjqhw2l2dpkb5bj0y1jh3` (`idProduto`),
  CONSTRAINT `FKbkk2fjqfm3tr4bv7ala0jcq9n` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `FKcg9wpjqhw2l2dpkb5bj0y1jh3` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKxmtseedf86cau3qthkv58uji` FOREIGN KEY (`idItemEntrada`) REFERENCES `itemEntrada` (`idItemEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoInternacional`
--

LOCK TABLES `catalogoInternacional` WRITE;
/*!40000 ALTER TABLE `catalogoInternacional` DISABLE KEYS */;
INSERT INTO `catalogoInternacional` VALUES (1,6,1,NULL,21.00,68.88,3.28,'2017-09-07'),(4,29,1,NULL,100.00,330.00,3.30,'2017-09-23'),(5,24,1,NULL,18.50,61.05,3.30,'2017-09-23'),(6,7,6,NULL,85.00,280.50,3.30,'2017-09-23'),(7,30,5,NULL,185.00,610.50,3.30,'2017-09-23'),(8,6,4,NULL,24.66,81.13,3.29,'2017-09-23'),(9,31,2,NULL,7.60,25.00,3.29,'2017-09-23'),(10,32,2,NULL,10.64,35.01,3.29,'2017-09-23'),(11,33,2,NULL,10.64,35.01,3.29,'2017-09-23'),(12,34,2,NULL,28.88,95.02,3.29,'2017-09-23'),(13,13,3,NULL,24.39,80.00,3.28,'2017-09-23'),(15,7,1,NULL,80.00,262.40,3.28,'2017-09-07'),(16,11,1,NULL,41.00,134.48,3.28,'2017-09-07'),(17,12,2,NULL,23.48,77.01,3.28,'2017-09-07'),(18,13,3,NULL,24.39,80.00,3.28,'2017-09-07'),(19,14,1,NULL,680.00,2230.40,3.28,'2017-09-07'),(20,6,4,30,24.60,80.93,3.29,'2017-10-12'),(21,7,1,31,88.00,292.16,3.32,'2017-10-12'),(22,11,1,32,45.00,149.40,3.32,'2017-10-12'),(23,35,5,33,7.00,23.24,3.32,'2017-10-12'),(24,36,1,34,107.00,355.24,3.32,'2017-10-12'),(25,37,1,35,36.00,119.52,3.32,'2017-10-12'),(26,38,1,36,42.00,139.44,3.32,'2017-10-12'),(27,39,1,37,10.95,36.35,3.32,'2017-10-12'),(28,40,1,38,3.99,13.25,3.32,'2017-10-12'),(29,41,7,39,30.00,99.00,3.30,'2017-10-12'),(30,42,2,40,36.36,119.99,3.30,'2017-10-12'),(31,43,2,41,22.73,75.01,3.30,'2017-10-12'),(32,44,7,42,969.70,3200.01,3.30,'2017-10-12'),(33,45,7,43,712.12,2350.00,3.30,'2017-10-20'),(34,46,5,44,10.00,33.30,3.33,'2017-10-22'),(35,47,5,45,10.00,33.30,3.33,'2017-10-22'),(36,48,5,46,55.00,183.15,3.33,'2017-10-22'),(37,6,4,47,24.30,79.70,3.28,'2017-11-02'),(38,6,5,48,30.00,102.00,3.40,'2017-11-02'),(39,19,5,49,19.20,65.28,3.40,'2017-11-02'),(40,51,5,50,19.20,65.28,3.40,'2017-11-02'),(41,52,5,51,19.20,65.28,3.40,'2017-11-02'),(42,49,5,52,7.50,25.50,3.40,'2017-11-02'),(43,50,5,53,6.50,22.10,3.40,'2017-11-02'),(44,54,3,54,4.44,15.01,3.38,'2017-11-02'),(45,53,5,55,4.00,13.60,3.40,'2017-11-02'),(46,9,2,56,20.71,70.00,3.38,'2017-11-02'),(47,55,2,57,20.71,70.00,3.38,'2017-11-02'),(48,56,2,58,16.57,56.01,3.38,'2017-11-02'),(49,57,2,59,11.24,37.99,3.38,'2017-11-02'),(50,58,2,60,3.85,13.01,3.38,'2017-11-02'),(51,22,2,61,6.81,23.02,3.38,'2017-11-02'),(52,59,2,62,20.12,68.01,3.38,'2017-11-02'),(53,28,7,63,754.44,2550.01,3.38,'2017-11-02'),(54,37,1,64,36.00,122.40,3.40,'2017-11-02'),(55,60,1,65,19.38,65.89,3.40,'2017-11-02'),(56,61,8,66,4.44,15.01,3.38,'2017-11-02'),(57,62,7,67,835.00,2822.30,3.38,'2017-11-06'),(58,6,4,68,24.26,82.00,3.38,'2017-11-11'),(59,53,3,69,2.96,10.00,3.38,'2017-11-11'),(60,64,2,70,25.15,85.01,3.38,'2017-11-11'),(61,9,4,71,19.82,66.99,3.38,'2017-11-11'),(62,57,2,72,11.24,37.99,3.38,'2017-11-11'),(63,58,2,73,3.85,13.01,3.38,'2017-11-11'),(64,65,2,74,3.85,13.01,3.38,'2017-11-11'),(65,14,7,75,655.00,2227.00,3.40,'2017-11-11'),(66,63,7,76,1800.00,6120.00,3.40,'2017-11-11'),(67,67,7,77,190.00,646.00,3.40,'2017-11-11'),(68,61,8,78,4.44,15.01,3.38,'2017-11-11'),(69,68,1,79,19.90,67.66,3.40,'2017-11-11'),(70,60,1,80,21.50,73.10,3.40,'2017-11-11'),(71,13,3,81,23.67,80.00,3.38,'2017-11-11'),(72,69,2,82,54.73,184.99,3.38,'2017-11-25'),(73,43,2,83,23.67,80.00,3.38,'2017-11-25'),(74,71,2,84,5.33,18.02,3.38,'2017-11-25'),(75,72,2,85,4.44,15.01,3.38,'2017-11-25'),(76,73,2,86,8.88,30.01,3.38,'2017-11-25'),(77,74,2,87,9.47,32.01,3.38,'2017-11-25'),(78,59,2,88,20.12,68.01,3.38,'2017-11-25'),(79,55,2,89,21.90,74.02,3.38,'2017-11-25'),(80,58,2,90,3.85,13.01,3.38,'2017-11-25'),(81,70,2,91,101.48,343.00,3.38,'2017-11-25'),(82,75,7,92,250.00,850.00,3.40,'2017-11-25'),(83,7,5,93,85.00,289.00,3.40,'2017-11-25'),(84,43,2,94,24.56,83.01,3.38,'2017-12-03'),(85,75,7,95,234.70,797.98,3.40,'2017-12-11'),(86,76,7,96,1470.00,4998.00,3.40,'2017-12-11'),(87,77,9,97,12.56,41.45,3.30,'2017-12-01'),(88,78,9,98,12.56,41.45,3.30,'2017-12-01'),(89,79,9,99,19.79,65.31,3.30,'2017-12-01'),(90,80,9,100,21.31,70.32,3.30,'2017-12-01'),(91,81,10,101,38.00,133.00,3.50,'2017-12-05'),(92,43,11,102,26.00,89.44,3.44,'2017-12-16'),(93,9,11,103,15.94,54.83,3.44,'2017-12-16'),(94,82,11,104,23.00,79.12,3.44,'2017-12-16'),(95,83,11,105,128.00,440.32,3.44,'2017-12-16'),(96,22,11,106,7.16,24.63,3.44,'2017-12-16'),(97,58,11,107,3.88,13.35,3.44,'2017-12-16'),(98,71,11,108,5.00,17.20,3.44,'2017-12-16'),(99,74,11,109,10.44,35.91,3.44,'2017-12-16'),(100,84,11,110,8.96,30.82,3.44,'2017-12-16'),(101,85,11,111,52.00,178.88,3.44,'2017-12-16'),(102,6,4,112,27.09,91.29,3.37,'2017-12-16'),(103,7,4,113,82.64,278.50,3.37,'2017-12-16'),(104,51,5,114,18.00,62.64,3.48,'2017-12-16'),(105,86,5,115,10.00,34.80,3.48,'2017-12-16'),(106,87,5,116,45.00,156.60,3.48,'2017-12-16'),(107,59,5,117,22.00,76.56,3.48,'2017-12-16'),(108,24,1,118,22.50,78.30,3.48,'2017-12-16'),(109,88,1,119,25.40,88.39,3.48,'2017-12-16'),(110,89,7,120,300.00,1044.00,3.48,'2017-12-16'),(111,14,7,121,650.00,2262.00,3.48,'2017-12-16'),(112,90,3,122,8.72,30.00,3.44,'2017-12-16'),(113,44,7,123,952.00,3312.96,3.48,'2017-12-19'),(114,44,7,124,952.00,3312.96,3.48,'2017-12-21'),(115,9,2,125,17.65,60.01,3.40,'2018-01-09'),(116,22,2,126,7.35,24.99,3.40,'2018-01-09'),(117,58,2,127,4.71,16.01,3.40,'2018-01-09'),(118,71,2,128,5.29,17.99,3.40,'2018-01-09'),(119,42,2,129,39.71,135.01,3.40,'2018-01-09'),(120,91,2,130,30.88,104.99,3.40,'2018-01-09'),(121,92,2,131,12.06,41.00,3.40,'2018-01-09'),(122,32,11,132,10.29,34.99,3.40,'2018-01-09'),(123,74,11,133,10.29,34.99,3.40,'2018-01-09'),(124,6,5,134,30.00,102.00,3.40,'2018-01-09'),(125,7,5,135,85.00,289.00,3.40,'2018-01-09'),(126,44,7,136,970.00,3298.00,3.40,'2018-01-09'),(127,60,3,137,26.47,90.00,3.40,'2018-01-09'),(128,93,1,138,26.00,88.40,3.40,'2018-01-09'),(129,65,11,139,3.88,13.00,3.35,'2018-01-20'),(130,94,11,140,62.00,207.70,3.35,'2018-01-20'),(131,43,11,141,23.00,77.05,3.35,'2018-01-20'),(132,95,11,142,40.00,134.00,3.35,'2018-01-20'),(133,96,11,143,33.00,110.55,3.35,'2018-01-20'),(134,97,11,144,63.00,211.05,3.35,'2018-01-20'),(135,98,2,145,37.91,127.00,3.35,'2018-01-20'),(136,99,2,146,25.37,84.99,3.35,'2018-01-20'),(137,13,3,147,23.88,80.00,3.35,'2018-01-20'),(138,100,3,148,25.37,84.99,3.35,'2018-01-20'),(139,6,4,149,27.46,91.99,3.35,'2018-01-20'),(140,24,1,150,18.20,61.88,3.40,'2018-01-20'),(141,60,1,151,21.50,73.10,3.40,'2018-01-20'),(142,11,7,152,41.67,140.01,3.36,'2018-01-20'),(143,30,7,153,174.11,585.01,3.36,'2018-01-20'),(144,101,7,154,455.00,1528.80,3.36,'2018-01-20'),(147,76,7,157,1250.00,4200.00,3.36,'2018-02-06'),(148,102,7,158,250.00,840.00,3.36,'2018-02-06'),(149,11,7,159,41.92,140.01,3.34,'2018-02-06'),(150,14,7,160,645.00,2154.30,3.34,'2018-02-06'),(151,60,1,161,21.50,72.03,3.35,'2018-02-06'),(152,103,1,162,22.00,73.70,3.35,'2018-02-06'),(153,6,1,163,30.00,100.50,3.35,'2018-02-06'),(154,65,11,164,3.88,12.96,3.34,'2018-02-06'),(155,12,2,165,25.45,85.00,3.34,'2018-02-06'),(156,42,2,166,35.93,120.01,3.34,'2018-02-06'),(157,104,5,167,220.00,737.00,3.35,'2018-02-06'),(158,105,1,168,69.00,231.15,3.35,'2018-02-06'),(159,30,7,169,179.34,599.00,3.34,'2018-02-05'),(160,106,5,170,50.00,167.50,3.35,'2018-02-03'),(161,107,2,171,52.24,175.00,3.35,'2018-02-17'),(162,108,2,172,112.24,376.00,3.35,'2018-02-17'),(163,109,2,173,49.55,165.99,3.35,'2018-02-17'),(164,57,2,174,10.45,35.00,3.35,'2018-02-17'),(165,43,2,175,24.48,82.01,3.35,'2018-02-17'),(166,106,5,176,50.00,170.00,3.40,'2018-02-17'),(167,24,1,177,22.50,76.50,3.40,'2018-02-17'),(168,103,1,178,22.00,74.80,3.40,'2018-02-17'),(169,10,1,179,18.00,61.20,3.40,'2018-02-17'),(170,110,1,180,24.18,82.21,3.40,'2018-02-17'),(171,111,5,181,18.00,61.20,3.40,'2018-02-17'),(172,112,5,182,12.00,40.80,3.40,'2018-02-17'),(173,113,5,183,20.00,68.00,3.40,'2018-02-17'),(174,6,6,184,30.00,102.00,3.40,'2018-02-17'),(175,9,11,185,15.82,53.00,3.35,'2018-02-17'),(176,30,7,186,175.00,588.00,3.36,'2018-02-17'),(177,11,7,187,41.00,137.76,3.36,'2018-02-17'),(178,14,7,188,640.00,2150.40,3.36,'2018-02-17'),(179,7,7,189,77.00,258.72,3.36,'2018-02-19'),(180,114,7,190,1620.00,5378.40,3.32,'2018-02-28'),(181,115,11,191,3.40,191.01,56.18,'2018-03-03'),(182,9,11,192,15.58,52.97,3.40,'2018-03-03'),(183,116,11,193,17.06,58.00,3.40,'2018-03-03'),(184,74,11,194,9.41,31.99,3.40,'2018-03-03'),(185,117,2,195,41.77,142.02,3.40,'2018-03-03'),(186,118,2,196,51.77,176.02,3.40,'2018-03-03'),(187,119,2,197,64.71,220.01,3.40,'2018-03-03'),(188,98,7,198,39.58,132.99,3.36,'2018-03-03'),(189,11,7,199,40.00,134.40,3.36,'2018-03-03'),(190,120,4,200,26.48,90.03,3.40,'2018-03-03'),(191,113,5,201,20.00,68.00,3.40,'2018-03-03'),(192,121,5,202,20.00,68.00,3.40,'2018-03-03'),(193,123,5,203,12.99,44.17,3.40,'2018-03-03'),(194,122,5,204,0.50,1.70,3.40,'2018-03-03'),(195,60,1,205,21.50,73.10,3.40,'2018-03-03'),(196,14,7,206,640.00,2150.40,3.36,'2018-03-03'),(197,124,8,207,7.35,24.99,3.40,'2018-03-03'),(198,125,8,208,13.82,46.99,3.40,'2018-03-03'),(199,126,7,209,485.00,1649.00,3.40,'2018-03-12'),(200,127,7,210,444.71,1512.00,3.40,'2018-03-12'),(201,6,5,211,30.00,102.00,3.40,'2018-03-17'),(202,128,5,212,73.00,248.20,3.40,'2018-03-17'),(203,87,11,213,39.00,133.77,3.43,'2018-03-17'),(204,57,11,214,10.20,34.99,3.43,'2018-03-17'),(205,65,11,215,3.80,13.03,3.43,'2018-03-17'),(206,118,2,216,52.35,177.99,3.40,'2018-03-17'),(207,129,2,217,9.41,31.99,3.40,'2018-03-17'),(208,130,6,218,22.00,74.80,3.40,'2018-03-17'),(209,76,7,219,1150.00,3910.00,3.40,'2018-03-17'),(210,131,3,220,23.53,80.00,3.40,'2018-03-17'),(211,87,11,221,39.00,133.77,3.43,'2018-03-19'),(212,132,6,NULL,249.00,846.60,3.40,'2018-03-17'),(213,133,6,NULL,75.00,255.00,3.40,'2018-03-17'),(214,134,6,NULL,415.00,1411.00,3.40,'2018-03-17'),(215,135,6,NULL,375.00,1275.00,3.40,'2018-03-17'),(216,136,6,NULL,13.00,44.20,3.40,'2018-03-17'),(217,138,6,NULL,38.00,129.20,3.40,'2018-03-17'),(218,137,6,NULL,40.00,136.00,3.40,'2018-03-17'),(219,139,6,NULL,270.00,918.00,3.40,'2018-03-17'),(220,9,11,222,15.58,53.44,3.43,'2018-03-20'),(221,141,2,223,27.59,96.01,3.48,'2018-03-31'),(222,142,2,224,7.18,24.99,3.48,'2018-03-31'),(223,119,2,225,62.36,217.01,3.48,'2018-03-31'),(224,143,2,226,59.19,205.98,3.48,'2018-03-31'),(225,57,2,227,10.34,35.98,3.48,'2018-03-31'),(226,144,11,228,9.19,31.98,3.48,'2018-03-31'),(227,74,11,229,9.20,32.02,3.48,'2018-03-31'),(228,32,11,230,9.20,32.02,3.48,'2018-03-31'),(229,56,11,231,14.36,49.97,3.48,'2018-03-31'),(230,145,11,232,4.31,15.00,3.48,'2018-03-31'),(231,146,6,233,53.00,184.44,3.48,'2018-03-31'),(232,6,1,234,24.00,83.52,3.48,'2018-03-31'),(233,147,5,235,30.00,104.40,3.48,'2018-03-31'),(234,148,4,236,36.28,126.25,3.48,'2018-03-31'),(235,73,8,237,8.05,28.01,3.48,'2018-03-31'),(236,125,8,238,13.51,47.01,3.48,'2018-03-31'),(237,44,7,239,910.00,3130.40,3.44,'2018-04-05'),(238,150,7,240,20.05,68.97,3.44,'2018-04-05'),(239,149,7,241,20.05,68.97,3.44,'2018-04-05'),(240,14,7,242,633.00,2179.80,3.44,'2018-04-09'),(241,152,7,243,400.00,1376.66,3.44,'2018-04-09');
/*!40000 ALTER TABLE `catalogoInternacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogoPreco`
--

DROP TABLE IF EXISTS `catalogoPreco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogoPreco` (
  `idCatalogoPreco` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProduto` bigint(20) NOT NULL,
  `valorAVista` decimal(19,2) NOT NULL,
  `valorAPrazo` decimal(19,2) NOT NULL,
  PRIMARY KEY (`idCatalogoPreco`),
  UNIQUE KEY `idCatalogoPreco_UNIQUE` (`idCatalogoPreco`),
  KEY `FK36gogm7h6eimma8h0e63n2naq` (`idProduto`),
  CONSTRAINT `FK36gogm7h6eimma8h0e63n2naq` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoPreco`
--

LOCK TABLES `catalogoPreco` WRITE;
/*!40000 ALTER TABLE `catalogoPreco` DISABLE KEYS */;
INSERT INTO `catalogoPreco` VALUES (1,6,150.00,160.00),(2,7,450.00,470.00),(3,8,550.00,600.00),(4,11,250.00,260.00),(5,10,120.00,130.00),(6,15,1950.00,2050.00),(7,16,2100.00,2200.00),(8,14,2850.00,3000.00),(9,17,1950.00,2050.00),(10,18,3400.00,3600.00),(11,19,120.00,130.00),(12,20,60.00,70.00),(13,21,100.00,110.00),(14,9,120.00,130.00),(15,12,150.00,160.00),(16,23,150.00,160.00),(17,24,130.00,140.00),(18,25,60.00,70.00),(19,22,65.00,75.00),(20,26,3800.00,4000.00),(21,27,3300.00,3500.00),(22,28,3200.00,3400.00),(23,29,315.00,350.00),(24,30,750.00,800.00),(25,31,70.00,80.00),(26,32,65.00,75.00),(27,33,65.00,75.00),(28,34,175.00,200.00),(29,13,150.00,160.00);
/*!40000 ALTER TABLE `catalogoPreco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta` (
  `idConta` bigint(20) NOT NULL AUTO_INCREMENT,
  `idFuncionario` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `agencia` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idConta`),
  UNIQUE KEY `idConta_UNIQUE` (`idConta`),
  KEY `FKjn2lh04ft0ybno4rg6hvujmna` (`idFuncionario`),
  CONSTRAINT `FKjn2lh04ft0ybno4rg6hvujmna` FOREIGN KEY (`idFuncionario`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOITAU','8600','25946-2'),(2,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOSANTANDER','2140','01043259-1'),(3,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCODOBRASIL','5783-5','9582-6'),(4,3,'Conta Digital (Disponível)','CONTAWEB','PAGSEGURO','',''),(5,3,'Conta Digital','CONTAWEB','MERCADOPAGO','',''),(6,3,'Conta ImportCG','CONTAMANUAL','IMPORTCG','',''),(7,4,'Conta ImportCG','CONTAMANUAL','IMPORTCG','',''),(8,3,'Conta Digital (A Receber)','CONTAWEB','PAGSEGURO','',''),(9,3,'Conta Pessoal (Poupança)','CONTABANCARIA','BANCOITAU','8600','25946-2'),(10,4,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOBRADESCO','5247-7','51398-9');
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa` (
  `idDespesa` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `valorTotal` decimal(19,2) NOT NULL,
  `dataDespesa` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `baixaGerada` bit(1) NOT NULL,
  PRIMARY KEY (`idDespesa`),
  UNIQUE KEY `idDespesa_UNIQUE` (`idDespesa`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (2,'Lançamento de despesas - Compra de Produtos (23/09/2017)',3100.70,'2017-09-23','BAIXATOTALMENTE',''),(3,'Lançamento de Despesas - Compra de Produtos (12/10/2017)',5516.61,'2017-10-12','BAIXATOTALMENTE',''),(4,'Lançamento de Despesas - Compra de Produtos (20/10/2017)',2400.00,'2017-10-20','BAIXATOTALMENTE',''),(5,'Lançamento de Despesas - Compra de Produtos (22/10/2017)',283.05,'2017-10-22','BAIXATOTALMENTE',''),(6,'Lançamento de despesas - Compra de Produtos (02/11/2017)',3807.97,'2017-11-02','BAIXATOTALMENTE',''),(7,'Compra de sacolas (Central Embalagens)',32.70,'2017-10-13','BAIXATOTALMENTE',''),(8,'500 Cartões de Visita (Printi)',25.64,'2017-10-27','BAIXATOTALMENTE',''),(10,'Lançamento de despesas - Compra de Produtos (06/11/2017)',2872.30,'2017-11-06','BAIXATOTALMENTE',''),(11,'Lançamento de Despesas - Compra de Produtos (11/11/2017)',9977.81,'2017-11-11','BAIXATOTALMENTE',''),(12,'Compra de sacolas (Central Embalagens)',44.65,'2017-11-13','BAIXATOTALMENTE',''),(13,'Lançamento de Despesas - Compra de Produtos (25/11/2017)',2170.08,'2017-11-25','BAIXATOTALMENTE',''),(14,'Lançamento de Despesas - Compra de Produtos (03/12/2017)',83.01,'2017-12-03','BAIXATOTALMENTE',''),(15,'Lançamento de Despesas - Compra de Produtos (11/12/2017)',5830.98,'2017-12-11','BAIXATOTALMENTE',''),(16,'Troca dos 2(Dois) Pneus dianteiros + Balanceamento',340.00,'2017-12-12','BAIXATOTALMENTE',''),(17,'Compra de sacolas (Central Embalagens)',50.00,'2017-12-14','BAIXATOTALMENTE',''),(18,'Lançamento de Despesas - Compra de Produtos (16/12/2017)',6019.63,'2017-12-16','BAIXATOTALMENTE',''),(19,'Lançamento de Despesas - Compra de Produtos (19/12/2017)',3312.96,'2017-12-19','BAIXATOTALMENTE',''),(20,'Lançamento de Despesas - Compra de Produtos (21/12/2017)',3347.96,'2017-12-21','BAIXATOTALMENTE',''),(21,'Compras na China',364.78,'2018-01-08','BAIXATOTALMENTE',''),(22,'Mensalidade Stim Social',29.96,'2018-01-08','BAIXATOTALMENTE',''),(23,'Lançamento de Despesas - Compra de Produtos (09/01/2018)',4789.49,'2018-01-09','BAIXATOTALMENTE',''),(24,'Lançamento de Despesas - Compra de Produtos (20/01/2018)',4241.73,'2018-01-20','BAIXATOTALMENTE',''),(25,'Lançamento de Despesas - Compra de Produtos (02/02/2018)',5075.00,'2018-02-02','BAIXATOTALMENTE',''),(26,'Lançamento de Despesas - Compra de Produtos (03/02/2018)',4132.12,'2018-02-03','BAIXATOTALMENTE',''),(27,'Lançamento de Despesas - Compra de Produtos (05/02/2018)',1268.00,'2018-02-05','BAIXATOTALMENTE',''),(28,'Lançamento de Despesas - Compra de Produtos (03/02/2018)',167.50,'2018-02-03','BAIXATOTALMENTE',''),(29,'Lançamento de Despesas - Compra de Produtos (17/02/2018)',5388.65,'2018-02-17','BAIXATOTALMENTE',''),(30,'Lançamento de Despesas - Compra de Produtos (19/02/2018)',517.44,'2018-02-19','BAIXATOTALMENTE',''),(31,'Lançamento de Despesas - Compra de Produtos (28/02/2018)',5413.40,'2018-02-28','BAIXATOTALMENTE',''),(32,'Lançamento de Despesas - Compra de Produtos (03/03/2018)',4230.57,'2018-03-03','BAIXAPARCIALMENTE',''),(33,'Lançamento de Despesas - Compra de Produtos (03/03/2018)',143.96,'2018-03-03','BAIXATOTALMENTE',''),(34,'Despesas com envio de Produtos',54.20,'2018-03-05','BAIXATOTALMENTE',''),(35,'Compra de sacolas (Central Embalagens)',24.50,'2018-03-05','BAIXATOTALMENTE',''),(36,'Despesa com Envio de produto com problema (Bracelet Axxis)',40.00,'2018-03-13','BAIXATOTALMENTE',''),(37,'Lançamento de Despesas - Compra de Produtos (12/03/2018)',4743.00,'2018-03-12','BAIXAPARCIALMENTE',''),(38,'Lançamento de Despesas - Compra de Produtos (17/03/2018)',5486.54,'2018-03-17','BAIXAPARCIALMENTE',''),(39,'Lançamento de Despesas - Compra de Produtos (19/03/2018)',133.77,'2018-03-19','BAIXATOTALMENTE',''),(40,'Lançamento de Despesas - Compra de Produtos (20/03/2018)',53.44,'2018-03-20','BAIXATOTALMENTE',''),(41,'Compra de sacolas (Central Embalagens)',0.00,'2018-03-23','BAIXATOTALMENTE',''),(42,'Lançamento de Despesas - Compra de Produtos (31/03/2018)',1706.53,'2018-03-31','BAIXATOTALMENTE',''),(43,'Lançamento de Despesas - Compra de Produtos (05/04/2018)',3318.34,'2018-04-05','BAIXATOTALMENTE',''),(44,'Lançamento de Despesas - Compra de Produtos (09/04/2018)',3591.46,'2018-04-09','NAOBAIXADO','');
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `idEntrada` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataCompra` date NOT NULL,
  `valorTotal` decimal(19,2) DEFAULT NULL,
  `quantidadeTotal` int(11) DEFAULT NULL,
  `origem` varchar(45) NOT NULL,
  `despesaLancada` bit(1) NOT NULL,
  PRIMARY KEY (`idEntrada`),
  UNIQUE KEY `idEntrada_UNIQUE` (`idEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (6,'2017-09-07',3446.85,9,'PEDROJUANCABALLERO',''),(8,'2017-09-23',2804.73,13,'PEDROJUANCABALLERO',''),(9,'2017-10-12',5285.11,19,'PEDROJUANCABALLERO',''),(10,'2017-10-20',2350.00,1,'PEDROJUANCABALLERO',''),(11,'2017-10-22',283.05,4,'PEDROJUANCABALLERO',''),(12,'2017-11-02',3617.95,20,'PEDROJUANCABALLERO',''),(13,'2017-11-06',2822.30,1,'PEDROJUANCABALLERO',''),(14,'2017-11-11',9657.81,18,'PEDROJUANCABALLERO',''),(15,'2017-11-25',1997.08,12,'PEDROJUANCABALLERO',''),(16,'2017-12-03',83.01,1,'PEDROJUANCABALLERO',''),(17,'2017-12-11',5795.98,2,'PEDROJUANCABALLERO',''),(18,'2017-12-01',231.78,4,'INTERNET',''),(19,'2017-12-05',133.00,1,'INTERNET',''),(20,'2017-12-16',5616.63,26,'PEDROJUANCABALLERO',''),(21,'2017-12-19',3312.96,1,'PEDROJUANCABALLERO',''),(22,'2017-12-21',3312.96,1,'PEDROJUANCABALLERO',''),(23,'2018-01-09',4454.40,18,'PEDROJUANCABALLERO',''),(24,'2018-01-20',3844.13,19,'PEDROJUANCABALLERO',''),(26,'2018-02-02',5040.00,2,'PEDROJUANCABALLERO',''),(27,'2018-02-03',3840.12,12,'PEDROJUANCABALLERO',''),(28,'2018-02-05',1198.00,2,'PEDROJUANCABALLERO',''),(29,'2018-02-03',167.50,1,'PEDROJUANCABALLERO',''),(30,'2018-02-17',5099.65,24,'PEDROJUANCABALLERO',''),(31,'2018-02-19',517.44,2,'PEDROJUANCABALLERO',''),(32,'2018-02-28',5378.40,1,'PEDROJUANCABALLERO',''),(33,'2018-03-03',3920.57,25,'PEDROJUANCABALLERO',''),(34,'2018-03-03',143.96,4,'PEDROJUANCABALLERO',''),(35,'2018-03-12',4673.00,3,'PEDROJUANCABALLERO',''),(36,'2018-03-17',5160.54,16,'PEDROJUANCABALLERO',''),(37,'2018-03-19',133.77,1,'PEDROJUANCABALLERO',''),(38,'2018-03-20',53.44,1,'PEDROJUANCABALLERO',''),(39,'2018-03-31',1418.53,19,'PEDROJUANCABALLERO',''),(40,'2018-04-05',3268.34,3,'PEDROJUANCABALLERO',''),(41,'2018-04-09',3556.46,2,'PEDROJUANCABALLERO','');
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatisticaVenda`
--

DROP TABLE IF EXISTS `estatisticaVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatisticaVenda` (
  `idConsumoCliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `idItemVenda` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idFuncionario` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idConsumoCliente`),
  UNIQUE KEY `idConsumoCliente_UNIQUE` (`idConsumoCliente`),
  KEY `FKoix8lrsaed5kyaivh86j8d6aw` (`idCliente`),
  KEY `FKoja1ghf1k9q4vup32qc7ppt12` (`idFuncionario`),
  KEY `FKaq646c0uj1qx9gavtst1fuu0k` (`idItemVenda`),
  KEY `FKgx48nimw5pn7ke3x5r1k8v4i8` (`idProduto`),
  CONSTRAINT `FKaq646c0uj1qx9gavtst1fuu0k` FOREIGN KEY (`idItemVenda`) REFERENCES `itemVenda` (`idItemVenda`),
  CONSTRAINT `FKgx48nimw5pn7ke3x5r1k8v4i8` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKoix8lrsaed5kyaivh86j8d6aw` FOREIGN KEY (`idCliente`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `FKoja1ghf1k9q4vup32qc7ppt12` FOREIGN KEY (`idFuncionario`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatisticaVenda`
--

LOCK TABLES `estatisticaVenda` WRITE;
/*!40000 ALTER TABLE `estatisticaVenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatisticaVenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `idEstoque` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProduto` bigint(20) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE KEY `idEstoque_UNIQUE` (`idEstoque`),
  KEY `FKgumrkw95wo8v0tvdwjmor525w` (`idProduto`),
  CONSTRAINT `FKgumrkw95wo8v0tvdwjmor525w` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (26,6,0),(27,7,0),(28,11,0),(29,12,0),(30,13,0),(31,14,1),(32,29,0),(33,24,0),(34,30,0),(35,31,0),(36,32,0),(37,33,0),(38,34,0),(39,35,0),(40,36,0),(41,37,0),(42,38,0),(43,39,0),(44,40,0),(45,41,0),(46,42,0),(47,43,0),(48,44,0),(49,45,0),(50,46,0),(51,47,0),(52,48,0),(53,19,0),(54,51,0),(55,52,0),(56,49,0),(57,50,0),(58,54,0),(59,53,0),(60,9,1),(61,55,0),(62,56,1),(63,57,0),(64,58,0),(65,22,1),(66,59,0),(67,28,0),(68,60,0),(69,61,0),(70,62,0),(71,64,0),(72,65,1),(73,63,0),(74,67,0),(75,68,0),(76,69,0),(77,71,0),(78,72,0),(79,73,1),(80,74,0),(81,70,0),(82,75,0),(83,76,0),(84,77,1),(85,78,0),(86,79,0),(87,80,1),(88,81,1),(89,82,0),(90,83,0),(91,84,0),(92,85,0),(93,86,0),(94,87,0),(95,88,0),(96,89,0),(97,90,0),(98,91,0),(99,92,0),(100,93,0),(101,94,0),(102,95,0),(103,96,0),(104,97,0),(105,98,1),(106,99,0),(107,100,0),(108,101,0),(109,102,0),(110,103,0),(111,104,0),(112,105,0),(113,106,0),(114,107,0),(115,108,0),(116,109,0),(117,10,0),(118,110,0),(119,111,0),(120,112,0),(121,113,0),(122,114,0),(123,115,0),(124,116,0),(125,117,0),(126,118,0),(127,119,0),(128,120,0),(129,121,1),(130,123,1),(131,122,3),(132,124,0),(133,125,0),(134,126,0),(135,127,0),(136,128,0),(137,129,0),(138,130,0),(139,131,0),(153,140,0),(154,141,0),(155,142,0),(156,143,0),(157,144,0),(158,145,1),(159,146,0),(160,147,0),(161,148,0),(162,150,0),(163,149,0),(164,152,0);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(4000) DEFAULT NULL,
  `data` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `classe` varchar(200) NOT NULL,
  PRIMARY KEY (`idEvento`),
  UNIQUE KEY `idEvento_UNIQUE` (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechamento`
--

DROP TABLE IF EXISTS `fechamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechamento` (
  `idFechamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `valorRecebido` decimal(19,2) NOT NULL,
  `valorEntradas` decimal(19,2) NOT NULL,
  `valorDespesasBaixadas` decimal(19,2) NOT NULL,
  `valorDespesasABaixar` decimal(19,2) NOT NULL,
  `saldo` decimal(19,2) NOT NULL,
  `mes` decimal(19,2) NOT NULL,
  `ano` int(11) NOT NULL,
  `data` date NOT NULL,
  `finalizado` bit(1) NOT NULL,
  PRIMARY KEY (`idFechamento`),
  UNIQUE KEY `idFechamento_UNIQUE` (`idFechamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechamento`
--

LOCK TABLES `fechamento` WRITE;
/*!40000 ALTER TABLE `fechamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `dataCriacao` date DEFAULT NULL,
  `dataAlteracao` date DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `idFornecedor_UNIQUE` (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Shopping China','Avenida Internacional s/n,  Pedro Juan Caballero 79900-000, Paraguai','(67) 33343-3333','shoppingchina@shoppingchina.com.py','http://www.shoppingchina.com.py/','@shoppingchinaimportados','2017-09-12','2017-09-22'),(2,'Km Perfumaria','Av. Dr. Frância, Pedro Juan Caballero 79900-000, Paraguai','','',NULL,'','2017-09-14','2017-09-22'),(3,'Camelodromo','Paraguai','','',NULL,'','2017-09-14',NULL),(4,'Popai','Unidade 1: Mariscal López c/ Naciones Unidas, Pedro Juan Caballero Paraguai\r\nUnidade 2: Dr. Francia  c/ Ytororo, Pedro Juan Caballero Paraguai\r\n','(67) 98421-0348','','http://www.popaisa.com','','2017-09-19','2017-09-22'),(5,'Shopping Planet Outlet','Av. Internacional 7777, Pedro Juan Caballero 79900-000, Paraguai','(67) 33433-9513','','http://shoppingplanetoutlet.centralpark75.co/','@planetoutletpy','2017-09-19','2017-09-22'),(6,'Studio Center','Av. Dr. Frância 1660, Pedro Juan Caballero 79900-000, Paraguai','(67) 33437-7000','atendimento@studiocenter.com.py','http://www.studiocenter.com.py/','@studiocenterpy','2017-09-22','2017-09-22'),(7,'Axus Importados','Av. Dr. Francia c/ Iturbe, Pedro Juan Caballero Paraguai','(67) 33432-0023','axus2009@hotmail.com','','','2017-09-22','2018-01-23'),(8,'Musclestore','...','(67) 99662-8898','','','@musclestorepy','2017-11-03','2018-02-14'),(9,'AliExpress','Internet (China)','','','','','2017-12-11',NULL),(10,'GearBest','Internet (China)','','','','','2017-12-11',NULL),(11,'Casa Sandra Perfumaria','...','','','','','2017-12-18','2018-03-05');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemBaixa`
--

DROP TABLE IF EXISTS `itemBaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemBaixa` (
  `idItemBaixa` bigint(20) NOT NULL AUTO_INCREMENT,
  `idBaixa` bigint(20) NOT NULL,
  `idItemDespesa` bigint(20) NOT NULL,
  `idCaixa` bigint(20) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) NOT NULL,
  `acrescimo` decimal(19,2) DEFAULT NULL,
  `data` date NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `baixado` bit(1) NOT NULL,
  `cheque` bit(1) NOT NULL,
  PRIMARY KEY (`idItemBaixa`),
  UNIQUE KEY `idItemBaixa_UNIQUE` (`idItemBaixa`),
  KEY `FKr2f43md20jss1j4r3m2dmvaas` (`idBaixa`),
  KEY `FK2llrqykmcs3dy6paxfb6q2701` (`idCaixa`),
  KEY `FK9djmbja444w8w9qagfoci68c3` (`idItemDespesa`),
  CONSTRAINT `FK2llrqykmcs3dy6paxfb6q2701` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`),
  CONSTRAINT `FK9djmbja444w8w9qagfoci68c3` FOREIGN KEY (`idItemDespesa`) REFERENCES `itemDespesa` (`idItemDespesa`),
  CONSTRAINT `FKr2f43md20jss1j4r3m2dmvaas` FOREIGN KEY (`idBaixa`) REFERENCES `baixa` (`idBaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemBaixa`
--

LOCK TABLES `itemBaixa` WRITE;
/*!40000 ALTER TABLE `itemBaixa` DISABLE KEYS */;
INSERT INTO `itemBaixa` VALUES (1,1,1,1,'Produtos para venda comprados em dinheiro',2014.73,0.00,'2017-09-27','BAIXAPARCIAL','','\0'),(2,1,1,1,'Produtos para venda comprados no cartão de credito',790.00,0.00,'2017-11-01','BAIXAINTEGRAL','','\0'),(3,1,2,1,'Abastecimento realizado no Paraguai',142.00,0.00,'2017-09-27','BAIXAINTEGRAL','','\0'),(4,1,3,1,'Abastecimento realizado em Campo Grande com cartão de crédito Santander fechamento 10/10',153.97,0.00,'2017-10-10','BAIXAINTEGRAL','','\0'),(5,2,4,1,'Produtos para venda comprados em dinheiro',5126.46,0.00,'2017-10-13','BAIXAPARCIAL','','\0'),(6,2,4,1,'Produtos para venda comprados no cartão de credito',158.65,0.00,'2017-11-01','BAIXAPARCIAL','','\0'),(7,2,5,1,'Abastecimento realizado em Campo Grande',100.00,0.00,'2017-10-13','BAIXAINTEGRAL','','\0'),(8,2,6,1,'Abastecimento realizado no Paraguai',100.00,0.00,'2017-10-13','BAIXAINTEGRAL','','\0'),(9,2,7,1,'Almoço Self Service MR. Grill (Thiago e Luana)',31.50,0.00,'2017-10-13','BAIXAINTEGRAL','','\0'),(10,3,8,5,'Produtos para venda comprados em dinheiro',2350.00,0.00,'2017-10-22','BAIXAINTEGRAL','','\0'),(11,3,9,5,'Frete pago para amiga da Luana',50.00,0.00,'2017-10-22','BAIXAINTEGRAL','','\0'),(12,4,10,1,'Produtos para venda comprados em dinheiro',283.05,0.00,'2017-10-22','BAIXAINTEGRAL','','\0'),(13,5,11,1,'Produtos para venda comprados em dinheiro',3617.95,0.00,'2017-11-04','BAIXAINTEGRAL','','\0'),(14,5,12,7,'Abastecimento realizado em Campo Grande',158.02,0.00,'2017-12-04','BAIXAINTEGRAL','','\0'),(15,5,13,1,'Almoço Self Service MR. Grill (Thiago e Luana)',32.00,0.00,'2017-11-04','BAIXAINTEGRAL','','\0'),(16,6,14,1,'Sacolas - Compra relizada via cartão de credito com vencimento para Novembro',32.70,0.00,'2017-11-06','BAIXAINTEGRAL','','\0'),(17,7,15,7,'500 Cartões de Visita (Printi) - Compra realizada via cartão de crédito com vencimento para a mês de Dezembro',25.64,0.00,'2017-12-04','BAIXAINTEGRAL','','\0'),(18,8,17,1,'Compra Iphone 8 64GB (Cheque para dia 08/11/2017)',1000.00,0.00,'2017-11-08','BAIXAINTEGRAL','',''),(19,8,17,7,'Compra Iphone 8 64GB (Cheque para dia 08/12/2017)',1822.00,0.00,'2017-12-12','BAIXAINTEGRAL','',''),(20,8,18,1,'Frete Iphone 8 64GB',50.00,0.00,'2017-11-06','BAIXAINTEGRAL','','\0'),(21,9,19,1,'Transferência TED para conta da AXUS Informática referente ao parcelamento do Iphone 7 32GB (Entrada 1000,00 + Cheque 1227,00)',1000.00,0.00,'2017-11-14','BAIXAPARCIAL','','\0'),(22,9,19,7,'Cheque para AXUS Informática referente ao parcelamento do Iphone 7 32GB (Entrada 1000,00 + Cheque 1227,00)',1227.00,0.00,'2017-11-21','BAIXAPARCIAL','',''),(23,9,19,7,'Compra Iphone X 264GB (Cheque para dia 20/11/2017)',3060.00,0.00,'2017-11-21','BAIXAPARCIAL','',''),(24,9,19,7,'Compra Iphone X 264GB (Cheque para dia 15/12/2017)',3060.00,0.00,'2017-12-18','BAIXAPARCIAL','',''),(25,9,19,1,'Produtos para venda',1310.81,0.00,'2017-11-13','BAIXAPARCIAL','','\0'),(26,9,20,1,'Abastecimento realizado em Campo Grande',120.00,0.00,'2017-11-13','BAIXAINTEGRAL','','\0'),(27,9,21,1,'Abastecimento realizado no Paraguai',120.00,0.00,'2017-11-13','BAIXAINTEGRAL','','\0'),(28,9,22,1,'Almoço (Luana, Thiago, Ighor e Lorena) Mr. Grill',80.00,0.00,'2017-11-13','BAIXAINTEGRAL','','\0'),(29,10,23,7,'Compra de 3 pacotes de sacolas com 10 unidades cada. (Pequeno, Medio e Grande)',44.65,0.00,'2017-12-04','BAIXAINTEGRAL','','\0'),(30,11,24,1,'Produtos para venda',1997.08,0.00,'2017-11-27','BAIXAINTEGRAL','','\0'),(31,11,25,1,'Abastecimento realizado em Campo Grande',130.00,0.00,'2017-11-27','BAIXAINTEGRAL','','\0'),(32,11,26,1,'Almoço (Luana e Thiago) Mr. Grill',43.00,0.00,'2017-11-27','BAIXAINTEGRAL','','\0'),(33,12,27,7,'Produtos para venda',83.01,0.00,'2017-12-04','BAIXAINTEGRAL','','\0'),(34,13,28,7,'Transferencia da Entrada (AG: 0173 C/C: 044631-9 CNPJ: 05.959.963/0001-30 Madrigal Comercio de Bebidas LTDA)',999.98,0.00,'2017-12-11','BAIXAPARCIAL','','\0'),(35,13,28,7,'1º Cheque para AXUS referente ao parcelamento do Iphone X 64 GB e J7 Prime (Entrada 1000,00 + 2 Cheque 2398,00)',2398.00,0.00,'2018-01-15','BAIXAPARCIAL','',''),(36,13,28,7,'2º Cheque para AXUS referente ao parcelamento do Iphone X 64 GB e J7 Prime (Entrada 1000,00 + 2 Cheque 2398,00)',2398.00,0.00,'2018-02-15','BAIXAPARCIAL','',''),(37,13,29,7,'Frete (Van)',35.00,0.00,'2017-12-11','BAIXAINTEGRAL','','\0'),(38,14,30,7,'Pagamento a vista em dinheiro',320.00,0.00,'2017-12-12','BAIXAINTEGRAL','','\0'),(39,14,31,7,'Pagamento a vista em dinheiro',20.00,0.00,'2017-12-12','BAIXAINTEGRAL','','\0'),(40,15,32,1,'Sacolas',50.00,0.00,'2017-12-14','BAIXAINTEGRAL','','\0'),(41,16,33,1,'Produtos para venda',5616.63,0.00,'2017-12-18','BAIXAINTEGRAL','','\0'),(42,16,34,1,'Abastecimento realizado em Campo Grande',120.00,0.00,'2017-12-18','BAIXAINTEGRAL','','\0'),(43,16,35,1,'Abastecimento realizado no Paraguai',95.00,0.00,'2017-12-18','BAIXAINTEGRAL','','\0'),(44,16,36,1,'Almoço (Luana, Thiago e Lorena) Mr. Grill',56.00,0.00,'2017-12-18','BAIXAINTEGRAL','','\0'),(45,16,37,1,'Pneu 195/55 15 (Estepe)',105.00,0.00,'2017-12-18','BAIXAINTEGRAL','','\0'),(46,16,38,7,'Café da Manha (Studio Center)',27.00,0.00,'2017-12-21','BAIXAINTEGRAL','','\0'),(47,17,39,7,'Produtos para venda',3312.96,0.00,'2017-12-19','BAIXAINTEGRAL','','\0'),(48,18,40,7,'Cheque para AXUS Importados referente ao Iphone 8 Plus 64GB',3312.96,0.00,'2018-01-12','BAIXAINTEGRAL','',''),(49,18,41,7,'Frete (Van)',35.00,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(50,19,42,7,'Compra na China (GearBest)',133.00,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(51,19,43,7,'Compra na China (AliExpress)',231.78,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(52,20,44,7,'Mensalidade',29.96,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(53,21,45,7,'Produtos para venda',2156.40,0.00,'2018-01-10','BAIXAPARCIAL','','\0'),(54,21,45,7,'1º Cheque para AXUS Informática referente ao parcelamento do Iphone 8 Plus 64GB (Entrada 1000,00 + 2 Cheques 1149,00)',1149.00,0.00,'2018-02-15','BAIXAPARCIAL','',''),(55,21,45,7,'2º Cheque para AXUS Informática referente ao parcelamento do Iphone 8 Plus 64GB (Entrada 1000,00 + 2 Cheques 1149,00)',1149.00,0.00,'2018-03-13','BAIXAPARCIAL','',''),(56,21,46,7,'Pagamento no Cartão de Crédito Mastercard Itaú',154.09,0.00,'2018-02-06','BAIXAINTEGRAL','','\0'),(57,21,47,7,'Abastecimento em dinheiro',111.00,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(58,21,48,7,'Almoço Mr. Grill',50.00,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(59,21,49,7,'Café da Manhã',20.00,0.00,'2018-01-10','BAIXAINTEGRAL','','\0'),(60,22,50,7,'Produtos para venda',2631.13,0.00,'2018-01-22','BAIXAPARCIAL','','\0'),(61,22,50,7,'Cheque para AXUS Informática referente ao produto GO Pro Hero 6 Black (Entrada 900,00 + Cheque 628,00)',628.00,0.00,'2018-02-21','BAIXAPARCIAL','',''),(62,22,50,7,'Cheque para AXUS Informática referente ao produto HTV 5 (Cheque 585,00)',585.00,0.00,'2018-02-06','BAIXAPARCIAL','',''),(63,22,51,7,'Abastecimento realizado em Campo Grande com cartão de credito Itaú',150.00,0.00,'2018-02-06','BAIXAINTEGRAL','','\0'),(64,22,52,7,'Abastecimento realizado no Paraguai em dinheiro',110.00,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(65,22,53,7,'1º Pédagio Campo Grande Sul (IDA)',7.80,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(66,22,54,7,'2º Pédagio Rio Brilhante Sul (IDA)',7.00,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(67,22,55,7,'1º Pédagio Rio Brilhante Norte (VOLTA)',7.00,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(68,22,56,7,'2º Pédagio Campo Grande Norte (VOLTA)',7.80,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(69,22,57,7,'Almoço (Luana e Thiago) Mr. Grill',38.00,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(70,22,58,7,'Limpadores de Para-Brisa (2 dianteiros e 1 Traseiro)',70.00,0.00,'2018-01-22','BAIXAINTEGRAL','','\0'),(71,23,59,7,'Cheque para AXUS Importados referente ao produto Iphone X 64GB (Cheque 4200,00)',4200.00,0.00,'2018-02-16','BAIXAPARCIAL','',''),(72,23,59,7,'1º Cheque para AXUS Importados referente ao produto Tablet Samsung Galaxy Tab A6 (Cheque 1/2 420,00)',420.00,0.00,'2018-02-16','BAIXAPARCIAL','',''),(73,23,59,7,'2º Cheque para AXUS Importados referente ao produto Tablet Samsung Galaxy Tab A6 (Cheque 2/2 420,00)',420.00,0.00,'2018-03-16','BAIXAPARCIAL','',''),(74,23,60,7,'Frete (Van)',35.00,0.00,'2018-02-06','BAIXAINTEGRAL','','\0'),(75,24,61,7,'1° Cheque para AXUS Importados referente ao produto Iphone 7 32GB (Cheque 1/2 1000,00)',1000.00,0.00,'2018-02-28','BAIXAINTEGRAL','',''),(76,24,61,7,'2º Cheque para AXUS Importados referente ao produto Iphone 7 32GB (Cheque 2/2 1000,00)',1000.00,0.00,'2018-03-26','BAIXAPARCIAL','',''),(77,24,61,1,'Produtos para venda',1840.12,0.00,'2018-02-06','BAIXAPARCIAL','','\0'),(78,24,62,7,'Pagamento no Cartão de Crédito Mastercard Itaú',150.00,0.00,'2018-03-12','BAIXAINTEGRAL','','\0'),(79,24,63,1,'Pagamento a vista em dinheiro',90.00,0.00,'2018-02-03','BAIXAINTEGRAL','','\0'),(80,24,64,1,'Almoço (Luana e Thiago)',52.00,0.00,'2018-02-03','BAIXAINTEGRAL','','\0'),(81,25,65,5,'Produtos para venda',1198.00,0.00,'2018-02-06','BAIXAINTEGRAL','','\0'),(82,25,66,7,'Frete (Van)',70.00,0.00,'2018-02-06','BAIXAINTEGRAL','','\0'),(83,26,67,7,'Produtos para venda',167.50,0.00,'2018-02-06','BAIXAINTEGRAL','','\0'),(84,27,68,7,'Cheque para AXUS Importados referente aos produtos (Iphone 7 32GB, HTV Box 5 e dois Chromecast 2)',3013.92,0.00,'2018-02-21','BAIXAINTEGRAL','',''),(85,27,68,1,'Produtos para venda',2085.73,0.00,'2018-02-19','BAIXAPARCIAL','','\0'),(86,27,69,1,'Almoço (Luana e Thiago)',47.00,0.00,'2018-02-19','BAIXAINTEGRAL','','\0'),(87,27,70,1,'Café da Manhã',16.00,0.00,'2018-02-19','BAIXAINTEGRAL','','\0'),(88,27,71,1,'Abastecimento realizado em Campo Grande em dinheiro',130.00,0.00,'2018-02-19','BAIXAINTEGRAL','','\0'),(89,27,72,1,'Abastecimento realizado no Paraguai',96.00,0.00,'2018-02-19','BAIXAINTEGRAL','','\0'),(90,28,73,7,'Produtos para venda',517.44,0.00,'2018-02-19','BAIXAINTEGRAL','','\0'),(91,29,74,7,'Cheque para AXUS Importados referente ao produto Notebook Razer i7 (5378,40)',5378.40,0.00,'2018-03-10','BAIXAINTEGRAL','',''),(92,29,75,2,'Frete (Van)',35.00,0.00,'2018-02-28','BAIXAINTEGRAL','','\0'),(93,30,76,7,'1° Cheque para AXUS Importados referente ao produto Iphone 7 32GB, Chromecast 2 e Perfume Body Kouros 100 ml (Cheque 1/2 1208,90)',1208.90,0.00,'2018-03-13','BAIXAPARCIAL','',''),(94,30,76,7,'2° Cheque para AXUS Importados referente ao produto Iphone 7 32GB, Chromecast 2 e Perfume Body Kouros 100 ml (Cheque 2/2 1208,90)',1208.90,0.00,'2018-04-10','BAIXAPARCIAL','\0',''),(95,30,76,5,'Produtos para venda',1502.77,0.00,'2018-03-05','BAIXAPARCIAL','','\0'),(96,30,77,5,'Abastecimento realizado em Campo Grande em dinheiro',150.00,0.00,'2018-03-05','BAIXAINTEGRAL','','\0'),(97,30,78,5,'Abastecimento realizado no Paraguai',102.00,0.00,'2018-03-05','BAIXAINTEGRAL','','\0'),(98,30,79,5,'Café da Manhã',18.00,0.00,'2018-03-05','BAIXAINTEGRAL','','\0'),(99,30,80,5,'Almoço (Luana e Thiago)',40.00,0.00,'2018-03-05','BAIXAINTEGRAL','','\0'),(100,31,81,7,'Produtos para venda',143.96,0.00,'2018-03-05','BAIXAINTEGRAL','','\0'),(101,32,82,8,'Despesas com envio de produtos',46.20,0.00,'2018-03-13','BAIXAINTEGRAL','','\0'),(102,32,83,8,'Despesas com envio de produtos (Papelaria)',8.00,0.00,'2018-03-13','BAIXAINTEGRAL','','\0'),(103,33,84,2,'Sacolas',24.50,0.00,'2018-03-06','BAIXAINTEGRAL','','\0'),(104,34,85,2,'Despesas com envio de produtos',40.00,0.00,'2018-03-13','BAIXAINTEGRAL','','\0'),(105,35,86,7,'Cheque para AXUS Importados referente ao produto Notebook Acer I5 (Cheque 1649,00)',1649.00,0.00,'2018-04-04','BAIXAPARCIAL','',''),(106,35,86,7,'Cheque para AXUS Importados referente ao produto Apple Watch 42mm Serie 3 Prata (Cheque 1512,00)',1512.00,0.00,'2018-04-13','BAIXAPARCIAL','\0',''),(107,35,86,7,'Cheque para AXUS Importados referente ao produto Apple Watch 42mm Serie 3 Preto (Cheque 1512,00)',1512.00,0.00,'2018-05-13','BAIXAPARCIAL','\0',''),(108,35,87,2,'Frete (Van)',70.00,0.00,'2018-03-13','BAIXAINTEGRAL','','\0'),(109,36,88,7,'Cheque para AXUS Importados referente aos produtos (Iphone X 64GB)',1410.00,0.00,'2018-04-17','BAIXAPARCIAL','\0',''),(110,36,88,7,'Produtos para venda',3750.54,0.00,'2018-03-19','BAIXAPARCIAL','','\0'),(111,36,89,7,'Abastecimento realizado em Campo Grande em dinheiro',80.00,0.00,'2018-03-19','BAIXAINTEGRAL','','\0'),(112,36,90,7,'Abastecimento realizado no Paraguai',152.00,0.00,'2018-03-19','BAIXAINTEGRAL','','\0'),(113,36,91,7,'Almoço (Luana, Thiago e Lorena) Mr. Grill',66.00,0.00,'2018-03-19','BAIXAINTEGRAL','','\0'),(114,36,92,7,'Café da Manhã',28.00,0.00,'2018-03-19','BAIXAINTEGRAL','','\0'),(115,37,93,7,'Produtos para venda',133.77,0.00,'2018-03-19','BAIXAINTEGRAL','','\0'),(116,38,94,7,'Produtos para venda',53.44,0.00,'2018-03-20','BAIXAINTEGRAL','','\0'),(117,39,95,2,'Sacolas',40.00,0.00,'2018-03-23','BAIXAINTEGRAL','','\0'),(118,40,96,1,'Produtos para venda',1418.53,0.00,'2018-03-31','BAIXAINTEGRAL','','\0'),(119,40,97,1,'Abastecimento realizado em Campo Grande em dinheiro',80.00,0.00,'2018-03-31','BAIXAINTEGRAL','','\0'),(120,40,98,1,'Abastecimento realizado em Ponta Porã em dinheiro',20.00,0.00,'2018-03-31','BAIXAINTEGRAL','','\0'),(121,40,99,1,'Abastecimento realizado no Paraguai em dinheiro',147.00,0.00,'2018-03-31','BAIXAINTEGRAL','','\0'),(122,40,100,1,'Almoço (Luana e Thiago)',41.00,0.00,'2018-03-31','BAIXAINTEGRAL','','\0'),(123,41,101,7,'Produtos para venda',3268.34,0.00,'2018-04-09','BAIXAINTEGRAL','','\0'),(124,41,102,1,'Frete (Van)',50.00,0.00,'2018-04-06','BAIXAINTEGRAL','','\0'),(125,42,103,7,'Produtos para venda',2179.80,0.00,'2018-04-09','BAIXAPARCIAL','','\0'),(126,42,104,2,'Frete (Van)',35.00,0.00,'2018-04-10','BAIXAINTEGRAL','\0','\0'),(127,42,103,2,'Produtos para venda',1176.40,0.00,'2018-04-09','BAIXAPARCIAL','','\0');
/*!40000 ALTER TABLE `itemBaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemDespesa`
--

DROP TABLE IF EXISTS `itemDespesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemDespesa` (
  `idItemDespesa` bigint(20) NOT NULL AUTO_INCREMENT,
  `idDespesa` bigint(20) NOT NULL,
  `idEntrada` bigint(20) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`idItemDespesa`),
  UNIQUE KEY `idItemDespesa_UNIQUE` (`idItemDespesa`),
  KEY `FKrdr2v8kaimdegi71g1gwe4kq` (`idDespesa`),
  KEY `FKi5g91vg4lf0rnsnou9ot12gcb` (`idEntrada`),
  CONSTRAINT `FKi5g91vg4lf0rnsnou9ot12gcb` FOREIGN KEY (`idEntrada`) REFERENCES `entrada` (`idEntrada`),
  CONSTRAINT `FKrdr2v8kaimdegi71g1gwe4kq` FOREIGN KEY (`idDespesa`) REFERENCES `despesa` (`idDespesa`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemDespesa`
--

LOCK TABLES `itemDespesa` WRITE;
/*!40000 ALTER TABLE `itemDespesa` DISABLE KEYS */;
INSERT INTO `itemDespesa` VALUES (1,2,8,'Produtos para venda','COMPRAPRODUTO',2804.73),(2,2,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',142.00),(3,2,NULL,'Abastecimento realizado em Campo Grande com cartão de crédito Santander fechamento 10/10','COMBUSTIVEL',153.97),(4,3,9,'Produtos para venda','COMPRAPRODUTO',5285.11),(5,3,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',100.00),(6,3,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',100.00),(7,3,NULL,'Almoço Self Service MR. Grill (Thiago e Luana)','ALIMENTACAO',31.50),(8,4,10,'Produtos para venda comprados em dinheiro','COMPRAPRODUTO',2350.00),(9,4,NULL,'Frete pago para amiga da Luana','FRETE',50.00),(10,5,11,'Produtos para venda comprados em dinheiro','COMPRAPRODUTO',283.05),(11,6,12,'Produtos para venda','COMPRAPRODUTO',3617.95),(12,6,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',158.02),(13,6,NULL,'Almoço (Luana e Thiago) Mr. Grill','ALIMENTACAO',32.00),(14,7,NULL,'Sacolas','ALMOXARIFADO',32.70),(15,8,NULL,'500 Cartões de Visita (Printi)','ALMOXARIFADO',25.64),(17,10,13,'Produtos para venda','COMPRAPRODUTO',2822.30),(18,10,NULL,'Frete Iphone 8 64GB','FRETE',50.00),(19,11,14,'Produtos para venda','COMPRAPRODUTO',9657.81),(20,11,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',120.00),(21,11,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',120.00),(22,11,NULL,'Almoço (Luana, Thiago, Ighor e Lorena) Mr. Grill','ALIMENTACAO',80.00),(23,12,NULL,'3x10 (3 tamanhos de sacolas)','ALMOXARIFADO',44.65),(24,13,15,'Produtos para venda','COMPRAPRODUTO',1997.08),(25,13,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',130.00),(26,13,NULL,'Almoço (Luana e Thiago) Mr. Grill','ALIMENTACAO',43.00),(27,14,16,'Produtos para venda','COMPRAPRODUTO',83.01),(28,15,17,'Produtos para venda','COMPRAPRODUTO',5795.98),(29,15,NULL,'Frete (Van)','FRETE',35.00),(30,16,NULL,'2(Pneus) 195/55 15','MANUTENCAOCARRO',320.00),(31,16,NULL,'Balanceamento das 2(Duas) rodas','MANUTENCAOCARRO',20.00),(32,17,NULL,'Sacolas','ALMOXARIFADO',50.00),(33,18,20,'Produtos para venda','COMPRAPRODUTO',5616.63),(34,18,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',120.00),(35,18,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',95.00),(36,18,NULL,'Almoço (Luana, Thiago e Lorena) Mr. Grill','ALIMENTACAO',56.00),(37,18,NULL,'Pneu 195/55 15 (Estepe)','MANUTENCAOCARRO',105.00),(38,18,NULL,'Café da Manha (Studio Center)','ALIMENTACAO',27.00),(39,19,21,'Produtos para venda','COMPRAPRODUTO',3312.96),(40,20,22,'Produtos para venda','COMPRAPRODUTO',3312.96),(41,20,NULL,'Frete (Van)','FRETE',35.00),(42,21,19,'Relogio','COMPRAPRODUTO',133.00),(43,21,18,'Relogios','COMPRAPRODUTO',231.78),(44,22,NULL,'Mensalidade','REDESOCIAL',29.96),(45,23,23,'Produtos para venda','COMPRAPRODUTO',4454.40),(46,23,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',154.09),(47,23,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',111.00),(48,23,NULL,'Almoço Mr. Grill','ALIMENTACAO',50.00),(49,23,NULL,'Café da Manhã','ALIMENTACAO',20.00),(50,24,24,'Produtos para venda','COMPRAPRODUTO',3844.13),(51,24,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',150.00),(52,24,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',110.00),(53,24,NULL,'1º Pédagio Campo Grande Sul (IDA) ','OUTROS',7.80),(54,24,NULL,'2º Pédagio Rio Brilhante Sul (IDA) ','OUTROS',7.00),(55,24,NULL,'1º Pédagio Rio Brilhante Norte (VOLTA) ','OUTROS',7.00),(56,24,NULL,'2º Pédagio Campo Grande Norte (VOLTA) ','OUTROS',7.80),(57,24,NULL,'Almoço (Luana e Thiago) Mr. Grill','ALIMENTACAO',38.00),(58,24,NULL,'Limpadores de Para-Brisa (2 dianteiros e 1 Traseiro)','MANUTENCAOCARRO',70.00),(59,25,26,'Produtos para venda','COMPRAPRODUTO',5040.00),(60,25,NULL,'Frete (Van)','FRETE',35.00),(61,26,27,'Produtos para venda','COMPRAPRODUTO',3840.12),(62,26,NULL,'Abastecimento realizado em Campo Grande com cartão de credito Itaú','COMBUSTIVEL',150.00),(63,26,NULL,'Abastecimento realizado no Paraguai em dinheiro','COMBUSTIVEL',90.00),(64,26,NULL,'Almoço (Luana e Thiago)','ALIMENTACAO',52.00),(65,27,28,'Produtos para venda','COMPRAPRODUTO',1198.00),(66,27,NULL,'Frete (Van)','FRETE',70.00),(67,28,29,'Produtos para venda','COMPRAPRODUTO',167.50),(68,29,30,'Produtos para venda','COMPRAPRODUTO',5099.65),(69,29,NULL,'Almoço (Luana e Thiago)','ALIMENTACAO',47.00),(70,29,NULL,'Café da Manhã','ALIMENTACAO',16.00),(71,29,NULL,'Abastecimento realizado em Campo Grande em dinheiro','COMBUSTIVEL',130.00),(72,29,NULL,'Abastecimento realizado no Paraguai em dinheiro','COMBUSTIVEL',96.00),(73,30,31,'Produtos para venda','COMPRAPRODUTO',517.44),(74,31,32,'Produtos para venda','COMPRAPRODUTO',5378.40),(75,31,NULL,'Frete (Van)','FRETE',35.00),(76,32,33,'Produtos para venda','COMPRAPRODUTO',3920.57),(77,32,NULL,'Abastecimento realizado em Campo Grande em dinheiro','COMBUSTIVEL',150.00),(78,32,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',102.00),(79,32,NULL,'Café da Manhã','ALIMENTACAO',18.00),(80,32,NULL,'Almoço (Luana e Thiago)','ALIMENTACAO',40.00),(81,33,34,'Produtos para venda','COMPRAPRODUTO',143.96),(82,34,NULL,'Envio pelos correios (PL619729375BR)','FRETE',46.20),(83,34,NULL,'Papelaria (Papel Bolha e Caixa)','OUTROS',8.00),(84,35,NULL,'Sacolas','ALMOXARIFADO',24.50),(85,36,NULL,'Despesas com envio de produtos','FRETE',40.00),(86,37,35,'Produtos para venda','COMPRAPRODUTO',4673.00),(87,37,NULL,'Frete (Van)','FRETE',70.00),(88,38,36,'Produtos para venda','COMPRAPRODUTO',5160.54),(89,38,NULL,'Abastecimento realizado em Campo Grande em dinheiro','COMBUSTIVEL',80.00),(90,38,NULL,'Abastecimento realizado no Paraguai em dinheiro','COMBUSTIVEL',152.00),(91,38,NULL,'Almoço (Luana, Thiago e Lorena) Mr. Grill','ALIMENTACAO',66.00),(92,38,NULL,'Café da Manhã','ALIMENTACAO',28.00),(93,39,37,'Produtos para venda','COMPRAPRODUTO',133.77),(94,40,38,'Produtos para venda','COMPRAPRODUTO',53.44),(95,41,NULL,'Sacolas','ALMOXARIFADO',40.00),(96,42,39,'Produtos para venda','COMPRAPRODUTO',1418.53),(97,42,NULL,'Abastecimento realizado em Campo Grande em dinheiro','COMBUSTIVEL',80.00),(98,42,NULL,'Abastecimento realizado em Ponta Porã em dinheiro','COMBUSTIVEL',20.00),(99,42,NULL,'Abastecimento realizado no Paraguai em dinheiro','COMBUSTIVEL',147.00),(100,42,NULL,'Almoço (Luana e Thiago)','ALIMENTACAO',41.00),(101,43,40,'Produtos para venda','COMPRAPRODUTO',3268.34),(102,43,NULL,'Frete (Van)','FRETE',50.00),(103,44,41,'Produtos para venda','COMPRAPRODUTO',3556.46),(104,44,NULL,'Frete (Van)','FRETE',35.00);
/*!40000 ALTER TABLE `itemDespesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemEntrada`
--

DROP TABLE IF EXISTS `itemEntrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemEntrada` (
  `idItemEntrada` bigint(20) NOT NULL AUTO_INCREMENT,
  `idEntrada` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `idFornecedor` bigint(20) NOT NULL,
  `valorEmDolar` decimal(19,2) DEFAULT NULL,
  `valorEmReal` decimal(19,2) DEFAULT NULL,
  `cotacao` decimal(19,2) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idItemEntrada`),
  UNIQUE KEY `idItemEntrada_UNIQUE` (`idItemEntrada`),
  KEY `FKx2pq54u6nqee1ct3guex6bnr` (`idEntrada`),
  KEY `FKle7ytd45iqwof5gwxm47d3284` (`idFornecedor`),
  KEY `FKjyakb0b8tpnhe763ijq096ssh` (`idProduto`),
  CONSTRAINT `FKjyakb0b8tpnhe763ijq096ssh` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKle7ytd45iqwof5gwxm47d3284` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `FKx2pq54u6nqee1ct3guex6bnr` FOREIGN KEY (`idEntrada`) REFERENCES `entrada` (`idEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemEntrada`
--

LOCK TABLES `itemEntrada` WRITE;
/*!40000 ALTER TABLE `itemEntrada` DISABLE KEYS */;
INSERT INTO `itemEntrada` VALUES (12,6,6,1,21.00,68.88,3.28,2),(13,6,7,1,80.00,262.40,3.28,3),(14,6,11,1,41.00,134.48,3.28,1),(15,6,12,2,23.48,77.01,3.28,1),(16,6,13,3,24.39,80.00,3.28,1),(17,6,14,1,680.00,2230.40,3.28,1),(20,8,29,1,100.00,330.00,3.30,1),(21,8,24,1,18.50,61.05,3.30,1),(22,8,7,6,85.00,280.50,3.30,3),(23,8,30,5,185.00,610.50,3.30,2),(24,8,6,4,24.66,81.13,3.29,1),(25,8,31,2,7.60,25.00,3.29,1),(26,8,32,2,10.64,35.01,3.29,1),(27,8,33,2,10.64,35.01,3.29,1),(28,8,34,2,28.88,95.02,3.29,1),(29,8,13,3,24.32,80.01,3.29,1),(30,9,6,4,24.60,80.93,3.29,2),(31,9,7,5,88.00,292.16,3.32,1),(32,9,11,1,45.00,149.40,3.32,1),(33,9,35,5,7.00,23.24,3.32,1),(34,9,36,1,107.00,355.24,3.32,2),(35,9,37,1,36.00,119.52,3.32,1),(36,9,38,1,42.00,139.44,3.32,1),(37,9,39,1,10.95,36.35,3.32,5),(38,9,40,1,3.99,13.25,3.32,1),(39,9,41,7,30.00,99.00,3.30,1),(40,9,42,2,36.36,119.99,3.30,1),(41,9,43,2,22.73,75.01,3.30,1),(42,9,44,7,969.70,3200.01,3.30,1),(43,10,45,7,712.12,2350.00,3.30,1),(44,11,46,5,10.00,33.30,3.33,1),(45,11,47,5,10.00,33.30,3.33,2),(46,11,48,5,55.00,183.15,3.33,1),(47,12,6,4,24.30,79.70,3.28,2),(48,12,6,5,30.00,102.00,3.40,1),(49,12,19,5,19.20,65.28,3.40,1),(50,12,51,5,19.20,65.28,3.40,1),(51,12,52,5,19.20,65.28,3.40,1),(52,12,49,5,8.70,29.58,3.40,1),(53,12,50,5,7.70,26.18,3.40,1),(54,12,54,3,4.44,15.01,3.38,1),(55,12,53,5,4.00,13.60,3.40,1),(56,12,9,2,16.27,54.99,3.38,1),(57,12,55,2,20.71,70.00,3.38,1),(58,12,56,2,16.57,56.01,3.38,1),(59,12,57,2,11.24,37.99,3.38,1),(60,12,58,2,3.85,13.01,3.38,1),(61,12,22,2,6.81,23.02,3.38,1),(62,12,59,2,20.12,68.01,3.38,1),(63,12,28,7,754.44,2550.01,3.38,1),(64,12,37,1,36.00,122.40,3.40,1),(65,12,60,1,19.38,65.89,3.40,1),(66,12,61,8,4.44,15.01,3.38,1),(67,13,62,7,835.00,2822.30,3.38,1),(68,14,6,4,24.26,82.00,3.38,1),(69,14,53,3,2.96,10.00,3.38,1),(70,14,64,2,25.15,85.01,3.38,1),(71,14,9,4,19.82,66.99,3.38,1),(72,14,57,2,11.24,37.99,3.38,1),(73,14,58,2,3.85,13.01,3.38,3),(74,14,65,2,3.85,13.01,3.38,1),(75,14,14,7,655.00,2227.00,3.40,1),(76,14,63,7,1800.00,6120.00,3.40,1),(77,14,67,7,190.00,646.00,3.40,1),(78,14,61,8,4.44,15.01,3.38,2),(79,14,68,1,19.90,67.66,3.40,1),(80,14,60,1,21.50,73.10,3.40,1),(81,14,13,3,23.67,80.00,3.38,2),(82,15,69,2,54.73,184.99,3.38,1),(83,15,43,2,23.67,80.00,3.38,1),(84,15,71,2,5.33,18.02,3.38,1),(85,15,72,2,4.44,15.01,3.38,1),(86,15,73,2,8.88,30.01,3.38,1),(87,15,74,2,9.47,32.01,3.38,1),(88,15,59,2,20.12,68.01,3.38,1),(89,15,55,2,21.90,74.02,3.38,1),(90,15,58,2,3.85,13.01,3.38,1),(91,15,70,2,101.48,343.00,3.38,1),(92,15,75,7,250.00,850.00,3.40,1),(93,15,7,5,85.00,289.00,3.40,1),(94,16,43,2,24.56,83.01,3.38,1),(95,17,75,7,234.70,797.98,3.40,1),(96,17,76,7,1470.00,4998.00,3.40,1),(97,18,77,9,12.56,43.96,3.50,1),(98,18,78,9,12.56,43.96,3.50,1),(99,18,79,9,19.79,69.27,3.50,1),(100,18,80,9,21.31,74.59,3.50,1),(101,19,81,10,38.00,133.00,3.50,1),(102,20,43,11,26.00,89.44,3.44,1),(103,20,9,11,15.94,54.83,3.44,1),(104,20,82,11,23.00,79.12,3.44,1),(105,20,83,11,128.00,440.32,3.44,1),(106,20,22,11,7.16,24.63,3.44,1),(107,20,58,11,3.88,13.35,3.44,2),(108,20,71,11,5.00,17.20,3.44,1),(109,20,74,11,10.44,35.91,3.44,2),(110,20,84,11,8.96,30.82,3.44,1),(111,20,85,11,52.00,178.88,3.44,1),(112,20,6,4,27.09,91.29,3.37,2),(113,20,7,4,82.64,278.50,3.37,2),(114,20,51,5,18.00,62.64,3.48,1),(115,20,86,5,10.00,34.80,3.48,1),(116,20,87,5,45.00,156.60,3.48,1),(117,20,59,5,22.00,76.56,3.48,1),(118,20,24,1,22.50,78.30,3.48,1),(119,20,88,1,25.40,88.39,3.48,1),(120,20,89,7,300.00,1044.00,3.48,1),(121,20,14,7,650.00,2262.00,3.48,1),(122,20,90,3,8.72,30.00,3.44,2),(123,21,44,7,952.00,3312.96,3.48,1),(124,22,44,7,952.00,3312.96,3.48,1),(125,23,9,2,17.65,60.01,3.40,2),(126,23,22,2,7.35,24.99,3.40,2),(127,23,58,2,4.71,16.01,3.40,3),(128,23,71,2,5.29,17.99,3.40,1),(129,23,42,2,39.71,135.01,3.40,1),(130,23,91,2,30.88,104.99,3.40,1),(131,23,92,2,12.06,41.00,3.40,1),(132,23,32,11,10.29,34.99,3.40,1),(133,23,74,11,10.29,34.99,3.40,1),(134,23,6,5,30.00,102.00,3.40,1),(135,23,7,5,85.00,289.00,3.40,1),(136,23,44,7,970.00,3298.00,3.40,1),(137,23,60,3,26.47,90.00,3.40,1),(138,23,93,1,26.00,88.40,3.40,1),(139,24,65,11,3.88,13.00,3.35,2),(140,24,94,11,62.00,207.70,3.35,1),(141,24,43,11,23.00,77.05,3.35,1),(142,24,95,11,40.00,134.00,3.35,1),(143,24,96,11,33.00,110.55,3.35,1),(144,24,97,11,63.00,211.05,3.35,1),(145,24,98,2,37.91,127.00,3.35,1),(146,24,99,2,25.37,84.99,3.35,1),(147,24,13,3,23.88,80.00,3.35,2),(148,24,100,3,25.37,84.99,3.35,1),(149,24,6,4,27.46,91.99,3.35,1),(150,24,24,1,18.20,61.88,3.40,1),(151,24,60,1,21.50,73.10,3.40,1),(152,24,11,7,41.67,140.01,3.36,2),(153,24,30,7,174.11,585.01,3.36,1),(154,24,101,7,455.00,1528.80,3.36,1),(157,26,76,7,1250.00,4200.00,3.36,1),(158,26,102,7,250.00,840.00,3.36,1),(159,27,11,7,41.92,140.01,3.34,1),(160,27,14,7,645.00,2154.30,3.34,1),(161,27,60,1,21.50,72.03,3.35,1),(162,27,103,1,22.00,73.70,3.35,1),(163,27,6,1,30.00,100.50,3.35,2),(164,27,65,11,3.88,12.96,3.34,2),(165,27,12,2,25.45,85.00,3.34,1),(166,27,42,2,35.93,120.01,3.34,1),(167,27,104,6,220.00,737.00,3.35,1),(168,27,105,1,69.00,231.15,3.35,1),(169,28,30,7,179.34,599.00,3.34,2),(170,29,106,5,50.00,167.50,3.35,1),(171,30,107,2,52.24,175.00,3.35,1),(172,30,108,2,112.24,376.00,3.35,1),(173,30,109,2,49.55,165.99,3.35,1),(174,30,57,2,10.45,35.01,3.35,2),(175,30,43,2,24.48,82.01,3.35,1),(176,30,106,5,50.00,170.00,3.40,2),(177,30,24,1,22.50,76.50,3.40,1),(178,30,103,1,22.00,74.80,3.40,1),(179,30,10,1,18.00,61.20,3.40,1),(180,30,110,1,24.18,82.21,3.40,1),(181,30,111,5,18.00,61.20,3.40,1),(182,30,112,5,12.00,40.80,3.40,1),(183,30,113,5,20.00,68.00,3.40,1),(184,30,6,6,30.00,102.00,3.40,3),(185,30,9,11,15.82,53.00,3.35,2),(186,30,30,7,175.00,588.00,3.36,1),(187,30,11,7,41.00,137.76,3.36,2),(188,30,14,7,640.00,2150.40,3.36,1),(189,31,7,7,77.00,258.72,3.36,2),(190,32,114,7,1620.00,5378.40,3.32,1),(191,33,115,11,56.18,191.01,3.40,1),(192,33,9,11,15.58,52.97,3.40,2),(193,33,116,11,17.06,58.00,3.40,2),(194,33,74,11,9.41,31.99,3.40,2),(195,33,117,2,41.77,142.02,3.40,1),(196,33,118,2,51.77,176.02,3.40,1),(197,33,119,2,64.71,220.01,3.40,1),(198,33,98,7,39.58,132.99,3.36,1),(199,33,11,7,40.00,134.40,3.36,1),(200,33,120,4,26.48,90.03,3.40,1),(201,33,113,5,20.00,68.00,3.40,2),(202,33,121,5,20.00,68.00,3.40,2),(203,33,123,5,12.99,44.17,3.40,1),(204,33,122,5,0.50,1.70,3.40,5),(205,33,60,1,21.50,73.10,3.40,1),(206,33,14,7,640.00,2150.40,3.36,1),(207,34,124,8,7.35,24.99,3.40,2),(208,34,125,8,13.82,46.99,3.40,2),(209,35,126,7,485.00,1649.00,3.40,1),(210,35,127,7,444.71,1512.00,3.40,2),(211,36,6,5,30.00,102.00,3.40,2),(212,36,128,5,73.00,248.20,3.40,1),(213,36,87,11,39.00,133.77,3.43,2),(214,36,57,11,10.20,34.99,3.43,4),(215,36,65,11,3.80,13.03,3.43,2),(216,36,118,2,52.35,177.99,3.40,1),(217,36,129,2,9.41,31.99,3.40,1),(218,36,130,6,22.00,74.80,3.40,1),(219,36,76,7,1150.00,3910.00,3.40,1),(220,36,131,3,23.53,80.00,3.40,1),(221,37,87,11,39.00,133.77,3.43,1),(222,38,9,11,15.58,53.44,3.43,1),(223,39,141,2,27.59,96.01,3.48,1),(224,39,142,2,7.18,24.99,3.48,1),(225,39,119,2,62.36,217.01,3.48,1),(226,39,143,2,59.19,205.98,3.48,1),(227,39,57,2,10.34,35.98,3.48,3),(228,39,144,11,9.19,31.98,3.48,2),(229,39,74,11,9.20,32.02,3.48,1),(230,39,32,11,9.20,32.02,3.48,1),(231,39,56,11,14.36,49.97,3.48,1),(232,39,145,11,4.31,15.00,3.48,1),(233,39,146,6,53.00,184.44,3.48,1),(234,39,6,1,24.00,83.52,3.48,1),(235,39,147,5,30.00,104.40,3.48,1),(236,39,148,4,36.28,126.25,3.48,1),(237,39,73,8,8.05,28.01,3.48,1),(238,39,125,8,13.51,47.01,3.48,1),(239,40,44,7,910.00,3130.40,3.44,1),(240,40,150,7,20.05,68.97,3.44,1),(241,40,149,7,20.05,68.97,3.44,1),(242,41,14,7,633.00,2179.80,3.44,1),(243,41,152,7,400.00,1376.66,3.44,1);
/*!40000 ALTER TABLE `itemEntrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemOrcamento`
--

DROP TABLE IF EXISTS `itemOrcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemOrcamento` (
  `idItemOrcamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idOrcamento` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `idCatalogoInternacional` bigint(20) DEFAULT NULL,
  `valor` decimal(19,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valorVenda` decimal(19,2) NOT NULL,
  PRIMARY KEY (`idItemOrcamento`),
  UNIQUE KEY `idItemOrcamento_UNIQUE` (`idItemOrcamento`),
  KEY `FKkclxdu4d4knl36hyyl9g8vg3e` (`idOrcamento`),
  KEY `FK83edv833l91vcffhnsp4rsp4r` (`idProduto`),
  KEY `FKrbfw3tacjquhpaljog6nxc7mr` (`idCatalogoInternacional`),
  CONSTRAINT `FK83edv833l91vcffhnsp4rsp4r` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKkclxdu4d4knl36hyyl9g8vg3e` FOREIGN KEY (`idOrcamento`) REFERENCES `orcamento` (`idOrcamento`),
  CONSTRAINT `FKrbfw3tacjquhpaljog6nxc7mr` FOREIGN KEY (`idCatalogoInternacional`) REFERENCES `catalogoInternacional` (`idCatalogoInternacional`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemOrcamento`
--

LOCK TABLES `itemOrcamento` WRITE;
/*!40000 ALTER TABLE `itemOrcamento` DISABLE KEYS */;
INSERT INTO `itemOrcamento` VALUES (19,9,107,NULL,175.00,1,280.00),(20,9,108,NULL,376.00,1,580.00),(21,9,109,NULL,165.99,1,320.00),(22,9,57,NULL,35.01,2,70.00),(23,9,43,NULL,82.01,1,150.00),(24,9,106,NULL,170.00,2,300.00),(25,9,24,NULL,76.50,1,150.00),(26,9,103,NULL,74.80,1,150.00),(27,9,10,NULL,61.20,1,120.00),(28,9,110,NULL,82.21,1,150.00),(29,9,111,NULL,61.20,1,120.00),(30,9,112,NULL,40.80,1,120.00),(31,9,113,NULL,68.00,1,150.00),(32,9,6,NULL,102.00,3,130.00),(33,9,9,NULL,53.00,2,120.00),(34,9,30,NULL,588.00,1,750.00),(35,9,11,NULL,137.76,2,200.00),(36,9,14,NULL,2150.40,1,2468.63),(37,10,57,164,35.00,3,70.00),(39,10,6,174,102.00,2,140.00),(40,10,65,154,12.96,2,30.00),(41,10,87,106,156.60,1,250.00),(42,10,128,NULL,250.00,1,350.00);
/*!40000 ALTER TABLE `itemOrcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemVenda`
--

DROP TABLE IF EXISTS `itemVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemVenda` (
  `idItemVenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idVenda` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `idItemEntrada` bigint(20) NOT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItemVenda`),
  UNIQUE KEY `idItemVenda_UNIQUE` (`idItemVenda`),
  KEY `FKq99iiopsfwkm3rskreq6cg7qh` (`idItemEntrada`),
  KEY `FK5eyxa71d0qvmircij2jqhtajl` (`idProduto`),
  KEY `FKq0wpxloynk627fqxtuykjxuur` (`idVenda`),
  CONSTRAINT `FK5eyxa71d0qvmircij2jqhtajl` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKq0wpxloynk627fqxtuykjxuur` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`),
  CONSTRAINT `FKq99iiopsfwkm3rskreq6cg7qh` FOREIGN KEY (`idItemEntrada`) REFERENCES `itemEntrada` (`idItemEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemVenda`
--

LOCK TABLES `itemVenda` WRITE;
/*!40000 ALTER TABLE `itemVenda` DISABLE KEYS */;
INSERT INTO `itemVenda` VALUES (40,25,6,12,160.00,1),(41,26,6,12,160.00,1),(42,27,7,22,450.00,2),(43,29,7,13,450.00,1),(44,30,12,15,140.00,1),(45,31,13,16,160.00,1),(46,32,14,17,3200.00,1),(47,33,11,14,200.00,1),(48,34,30,23,750.00,2),(49,35,29,20,410.00,1),(50,36,7,22,400.00,1),(51,37,24,21,130.00,1),(52,38,34,28,175.00,1),(53,39,13,29,150.00,1),(54,40,7,13,410.00,1),(55,41,32,26,65.00,1),(56,41,6,24,85.00,1),(57,42,44,42,4050.00,1),(58,43,41,39,150.00,1),(59,44,39,37,55.00,5),(60,45,6,30,80.00,1),(61,46,42,40,190.00,1),(62,47,43,41,150.00,1),(63,48,6,30,160.00,1),(64,49,45,43,3150.00,1),(65,50,28,63,3000.00,1),(66,50,54,54,0.00,1),(67,50,53,55,0.00,1),(68,51,6,48,150.00,1),(69,52,58,60,30.00,1),(70,53,48,46,250.00,1),(71,53,61,66,30.00,1),(72,54,62,67,3400.00,1),(73,55,37,35,175.00,1),(74,55,38,36,175.00,1),(75,56,36,34,500.00,2),(76,56,56,58,100.00,1),(77,57,9,56,120.00,1),(78,58,6,47,160.00,1),(79,59,37,64,180.00,1),(80,60,57,59,70.00,1),(81,61,67,77,1120.00,1),(82,62,60,80,140.00,1),(83,63,14,75,2850.00,1),(84,64,63,76,6849.99,1),(85,65,64,70,160.00,1),(86,66,13,81,150.00,2),(87,67,6,68,120.00,1),(88,68,31,25,70.00,1),(89,69,52,51,100.00,1),(90,70,7,13,470.00,1),(91,71,59,62,130.00,1),(92,71,47,45,65.00,1),(93,72,47,45,0.00,1),(94,63,53,69,0.00,1),(95,73,58,73,30.00,2),(96,74,60,65,150.00,1),(97,75,19,49,100.00,1),(98,76,55,57,120.00,1),(99,77,55,89,110.00,1),(100,77,73,86,60.00,1),(101,78,59,88,130.00,1),(102,78,58,90,30.00,1),(103,79,50,53,70.00,1),(104,80,68,79,120.00,1),(105,81,72,85,50.00,1),(107,81,9,71,120.00,1),(108,82,43,83,150.00,1),(109,83,22,61,50.00,1),(110,84,75,92,1200.00,1),(111,85,6,47,125.00,1),(112,86,51,50,120.00,1),(113,87,74,87,60.00,1),(114,88,61,78,35.00,1),(115,89,71,84,35.00,1),(116,89,58,73,25.00,1),(117,90,70,91,450.00,1),(118,91,43,94,150.00,1),(119,92,7,31,410.00,1),(120,93,7,93,390.00,1),(121,94,69,82,320.00,1),(122,95,76,96,5600.00,1),(123,96,75,95,1250.00,1),(124,97,11,32,200.00,1),(126,99,40,38,30.00,1),(127,100,14,121,2400.00,1),(128,101,83,105,600.00,1),(129,102,89,120,1400.00,1),(130,103,88,119,150.00,1),(131,104,49,52,70.00,1),(132,105,24,118,130.00,1),(133,106,87,116,280.00,1),(134,107,90,122,65.00,2),(135,108,58,107,30.00,1),(136,109,57,72,65.00,1),(137,110,6,112,120.00,2),(138,111,44,123,4073.91,1),(139,112,58,107,30.00,1),(140,112,71,108,40.00,1),(141,113,44,124,3850.00,1),(142,114,82,104,150.00,1),(143,115,9,103,120.00,1),(144,116,74,109,65.00,1),(145,117,74,109,38.00,1),(146,118,22,106,50.00,1),(147,119,84,110,0.00,1),(148,120,46,44,0.00,1),(149,121,33,27,0.00,1),(150,122,7,113,0.00,1),(151,123,85,111,0.00,1),(152,124,60,137,150.00,1),(153,125,42,129,210.00,1),(154,126,93,138,190.00,1),(155,127,44,136,3900.00,1),(156,128,7,135,400.00,1),(159,131,91,130,180.00,1),(160,131,92,131,75.00,1),(161,131,22,126,50.00,1),(162,131,43,102,150.00,1),(163,132,6,134,150.00,1),(164,133,101,154,1800.00,1),(165,134,65,139,30.00,2),(166,135,95,142,230.00,1),(167,136,11,152,210.00,1),(168,137,96,143,250.00,1),(169,138,30,153,810.00,1),(170,139,24,150,130.00,1),(171,140,94,140,350.00,1),(172,141,98,145,200.00,1),(173,142,6,149,130.00,1),(174,143,58,127,30.00,1),(175,144,9,125,120.00,1),(176,145,61,78,30.00,1),(177,145,78,98,150.00,1),(178,146,86,115,95.00,1),(179,148,11,152,210.00,1),(180,149,100,148,150.00,1),(181,150,76,157,4700.00,1),(182,151,14,160,2600.00,1),(183,152,60,161,120.00,1),(184,154,11,159,210.00,1),(185,155,60,151,150.00,1),(186,155,65,74,30.00,1),(187,156,42,166,190.00,1),(188,153,30,169,750.00,2),(189,157,6,163,130.00,1),(190,158,105,168,255.00,1),(191,159,104,167,1200.00,1),(192,160,99,146,0.00,1),(193,161,59,117,0.00,1),(194,162,13,147,150.00,1),(195,163,9,125,60.00,1),(196,164,13,147,100.00,1),(197,165,97,144,350.00,1),(198,166,51,114,90.00,1),(199,167,102,158,0.00,1),(200,168,106,170,270.00,1),(201,169,103,162,160.00,1),(202,169,12,165,160.00,1),(203,170,6,163,150.00,1),(204,171,43,141,130.00,1),(205,172,14,188,2600.00,1),(206,173,106,176,300.00,1),(207,174,9,185,120.00,1),(208,175,6,184,130.00,1),(209,176,30,186,750.00,1),(210,177,109,173,320.00,1),(211,178,107,171,280.00,1),(212,179,110,180,150.00,1),(213,180,57,174,70.00,1),(214,181,7,113,450.00,1),(215,181,7,189,450.00,2),(216,182,10,179,130.00,1),(217,183,11,187,230.00,1),(218,184,108,172,580.00,1),(219,185,24,177,150.00,1),(220,186,57,174,70.00,1),(221,187,113,183,150.00,1),(222,188,11,187,200.00,1),(223,189,58,127,30.00,1),(224,189,71,128,35.00,1),(225,190,112,182,120.00,1),(226,191,114,190,5900.00,1),(227,192,111,181,120.00,1),(228,194,9,185,130.00,1),(229,195,124,207,50.00,1),(230,196,113,201,0.00,1),(231,197,125,208,0.00,1),(232,198,118,196,220.00,1),(233,198,116,193,80.00,2),(234,198,117,195,220.00,1),(235,198,9,192,100.00,1),(236,198,119,197,270.00,1),(237,198,74,194,50.00,2),(238,199,125,208,85.00,1),(239,200,14,206,2800.00,1),(240,201,115,191,320.00,1),(241,203,120,200,130.00,1),(242,202,9,192,120.00,1),(243,202,74,133,65.00,1),(244,204,65,164,30.00,1),(245,205,58,127,0.00,1),(246,206,65,164,0.00,1),(247,207,126,209,1935.00,1),(248,208,127,210,2250.00,1),(249,209,127,210,2000.00,1),(250,210,6,184,150.00,1),(251,211,6,184,0.00,1),(252,212,106,176,0.00,1),(253,213,76,219,4500.00,1),(254,214,57,214,70.00,1),(255,215,57,214,70.00,1),(256,216,65,215,30.00,1),(257,217,131,220,140.00,1),(258,218,87,221,250.00,1),(259,219,129,217,0.00,1),(260,219,32,132,0.00,1),(261,220,130,218,85.00,1),(262,221,128,212,350.00,1),(263,222,60,205,150.00,1),(264,223,87,213,280.00,1),(265,224,87,213,280.00,1),(266,225,118,216,290.00,1),(267,225,57,214,75.00,1),(268,226,57,214,70.00,1),(269,227,6,211,150.00,2),(270,228,43,175,0.00,1),(271,229,79,99,150.00,1),(272,230,121,202,0.00,1),(273,231,103,178,120.00,1),(274,233,144,228,60.00,2),(277,236,57,227,70.00,1),(278,237,57,227,70.00,1),(279,238,57,227,70.00,1),(280,239,142,224,50.00,1),(281,240,141,223,190.00,1),(282,241,119,225,350.00,1),(286,242,148,236,200.00,1),(287,242,147,235,150.00,1),(288,243,11,199,190.00,1),(289,243,125,238,85.00,1),(290,244,143,226,340.00,1),(291,245,6,234,150.00,1),(292,245,124,207,50.00,1),(293,246,146,233,280.00,1),(294,247,74,229,0.00,1),(295,248,32,230,0.00,1),(296,249,113,201,100.00,1),(297,249,122,204,0.00,1),(298,250,44,239,3650.00,1),(299,251,150,240,100.00,1),(300,251,149,241,100.00,1),(301,252,152,243,1700.00,1);
/*!40000 ALTER TABLE `itemVenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `idOrcamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCliente` bigint(20) DEFAULT NULL,
  `idFuncionario` bigint(20) NOT NULL,
  `data` date NOT NULL,
  `valorTotal` decimal(19,2) DEFAULT NULL,
  `lucroTotal` decimal(19,2) DEFAULT NULL,
  `quantidadeTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOrcamento`),
  UNIQUE KEY `idOrcamento_UNIQUE` (`idOrcamento`),
  KEY `FKpixerpmnsdgm9524nucf7axo1` (`idCliente`),
  KEY `FKh6jbqscspwp3d3qaa2n681o1t` (`idFuncionario`),
  CONSTRAINT `FKh6jbqscspwp3d3qaa2n681o1t` FOREIGN KEY (`idFuncionario`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `FKpixerpmnsdgm9524nucf7axo1` FOREIGN KEY (`idCliente`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (9,74,3,'2018-02-19',5099.65,2178.98,24),(10,74,3,'2018-03-15',741.52,408.48,9);
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `idPagamento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idVenda` bigint(20) NOT NULL,
  `forma` varchar(255) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `pago` bit(1) NOT NULL,
  `parcela` int(11) DEFAULT NULL,
  `valorParcela` decimal(19,2) DEFAULT NULL,
  `saldo` decimal(19,2) DEFAULT NULL,
  `taxa` decimal(19,2) DEFAULT NULL,
  `dataRecebimento` date DEFAULT NULL,
  `dataCompensacao` date DEFAULT NULL,
  `idCaixa` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  UNIQUE KEY `idPagamento_UNIQUE` (`idPagamento`),
  KEY `FKisk5alom9yolr7brwq967ejd7` (`idCaixa`),
  KEY `FK2jyyepu1tqd46buhn0pcs78q3` (`idVenda`),
  CONSTRAINT `FK2jyyepu1tqd46buhn0pcs78q3` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`),
  CONSTRAINT `FKisk5alom9yolr7brwq967ejd7` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (7,25,'DINHEIRO','2017-10-10',80.00,'',NULL,NULL,80.00,NULL,NULL,NULL,NULL),(15,26,'CREDITO','2017-09-09',160.00,'',3,56.56,151.06,8.94,'2017-09-10',NULL,NULL),(16,27,'DINHEIRO','2017-09-07',300.00,'',0,0.00,300.00,0.00,NULL,NULL,NULL),(17,27,'DINHEIRO','2017-10-07',200.00,'',0,0.00,200.00,0.00,NULL,NULL,NULL),(18,27,'DINHEIRO','2017-11-07',200.00,'',0,0.00,200.00,0.00,NULL,NULL,NULL),(19,29,'DINHEIRO','2017-09-07',150.00,'',0,0.00,150.00,0.00,NULL,NULL,NULL),(20,29,'DINHEIRO','2017-10-11',300.00,'',0,0.00,300.00,0.00,NULL,NULL,NULL),(22,30,'DINHEIRO','2017-09-19',70.00,'',0,0.00,70.00,0.00,NULL,NULL,NULL),(23,30,'DINHEIRO','2017-10-19',70.00,'',0,0.00,70.00,0.00,NULL,NULL,NULL),(26,32,'DINHEIRO','2017-09-07',1600.00,'',0,0.00,1600.00,0.00,NULL,NULL,NULL),(27,32,'DINHEIRO','2017-10-08',1600.00,'',0,0.00,1600.00,0.00,NULL,NULL,NULL),(28,33,'DINHEIRO','2017-09-25',200.00,'',0,0.00,200.00,0.00,NULL,NULL,NULL),(29,34,'DINHEIRO','2017-09-25',1500.00,'',0,0.00,1500.00,0.00,NULL,NULL,NULL),(30,35,'DINHEIRO','2017-09-23',410.00,'',0,0.00,410.00,0.00,NULL,NULL,NULL),(31,36,'DINHEIRO','2017-09-26',100.00,'',0,0.00,100.00,0.00,NULL,NULL,NULL),(32,36,'DINHEIRO','2017-10-26',50.00,'',0,0.00,50.00,0.00,NULL,NULL,NULL),(33,36,'DINHEIRO','2017-10-28',50.00,'',0,0.00,50.00,0.00,NULL,NULL,NULL),(34,37,'DINHEIRO','2017-10-09',130.00,'',0,0.00,130.00,0.00,NULL,NULL,NULL),(35,38,'DINHEIRO','2017-09-28',175.00,'',0,0.00,175.00,0.00,NULL,NULL,NULL),(36,39,'DINHEIRO','2017-11-06',150.00,'',0,0.00,150.00,0.00,NULL,NULL,NULL),(37,40,'DINHEIRO','2017-09-25',410.00,'',0,0.00,410.00,0.00,NULL,NULL,NULL),(38,31,'DINHEIRO','2017-09-28',100.00,'',0,0.00,100.00,0.00,NULL,NULL,NULL),(39,31,'DINHEIRO','2017-10-28',60.00,'',0,0.00,60.00,0.00,NULL,NULL,NULL),(40,41,'DINHEIRO','2017-10-04',75.00,'',0,0.00,75.00,0.00,NULL,NULL,NULL),(41,41,'DINHEIRO','2017-11-20',75.00,'',0,0.00,75.00,0.00,NULL,NULL,NULL),(42,27,'DINHEIRO','2017-12-11',200.00,'',0,0.00,200.00,0.00,NULL,NULL,NULL),(43,25,'DINHEIRO','2017-11-10',80.00,'',0,0.00,80.00,0.00,NULL,NULL,NULL),(44,42,'DINHEIRO','2017-10-12',950.00,'',0,0.00,950.00,0.00,NULL,NULL,NULL),(45,42,'DINHEIRO','2017-11-07',1000.00,'',0,0.00,1000.00,0.00,NULL,NULL,NULL),(46,43,'DINHEIRO','2017-10-14',150.00,'',0,0.00,150.00,0.00,NULL,NULL,NULL),(47,44,'DINHEIRO','2017-10-16',275.00,'',0,0.00,275.00,0.00,NULL,NULL,NULL),(48,45,'DINHEIRO','2017-11-24',80.00,'',0,0.00,80.00,0.00,NULL,NULL,NULL),(50,46,'DINHEIRO','2017-11-07',100.00,'',0,0.00,100.00,0.00,NULL,NULL,NULL),(51,46,'DINHEIRO','2017-12-05',90.00,'',0,0.00,90.00,0.00,NULL,NULL,NULL),(52,47,'DINHEIRO','2017-10-21',50.00,'',0,0.00,50.00,0.00,NULL,NULL,NULL),(53,47,'DINHEIRO','2017-11-05',100.00,'',0,0.00,100.00,0.00,NULL,NULL,NULL),(54,48,'DINHEIRO','2017-10-21',80.00,'',0,0.00,80.00,0.00,NULL,NULL,NULL),(55,48,'DINHEIRO','2017-11-05',80.00,'',0,0.00,80.00,0.00,NULL,NULL,NULL),(56,49,'DINHEIRO','2017-10-20',1600.00,'',0,0.00,1600.00,0.00,NULL,NULL,NULL),(57,49,'CREDITO','2017-10-20',1550.00,'',2,809.96,1463.35,86.65,'2017-10-21',NULL,NULL),(58,50,'DINHEIRO','2017-11-02',3000.00,'',0,0.00,3000.00,0.00,NULL,NULL,NULL),(59,51,'CREDITO','2017-11-03',150.00,'',1,150.00,142.51,7.49,'2017-11-04',NULL,NULL),(60,52,'DINHEIRO','2017-11-06',30.00,'',0,0.00,30.00,0.00,NULL,NULL,NULL),(61,53,'DINHEIRO','2017-11-06',280.00,'',0,0.00,280.00,0.00,NULL,NULL,NULL),(62,54,'DINHEIRO','2017-11-07',1000.00,'',0,0.00,1000.00,0.00,NULL,NULL,NULL),(63,54,'DINHEIRO','2017-12-01',1200.00,'',0,0.00,1200.00,0.00,NULL,NULL,NULL),(64,54,'DINHEIRO','2017-12-04',1000.00,'',0,0.00,1000.00,-200.00,NULL,NULL,NULL),(65,55,'DINHEIRO','2017-11-07',350.00,'',0,0.00,350.00,0.00,NULL,NULL,NULL),(66,56,'DINHEIRO','2017-11-07',500.00,'',0,0.00,500.00,0.00,NULL,NULL,NULL),(67,56,'DINHEIRO','2017-12-15',400.00,'',0,0.00,400.00,-200.00,NULL,NULL,NULL),(68,57,'DINHEIRO','2017-12-10',120.00,'',0,0.00,120.00,0.00,NULL,NULL,NULL),(69,42,'DINHEIRO','2017-11-28',2100.00,'',0,0.00,2100.00,-50.00,NULL,NULL,NULL),(70,58,'DINHEIRO','2017-12-20',53.00,'',0,0.00,53.00,0.00,NULL,NULL,NULL),(71,58,'DINHEIRO','2018-02-11',53.00,'',0,0.00,53.00,0.00,NULL,NULL,1),(72,58,'DINHEIRO','2018-02-11',54.00,'',0,0.00,54.00,0.00,NULL,NULL,1),(73,59,'DINHEIRO','2017-11-08',90.00,'',0,0.00,90.00,0.00,NULL,NULL,NULL),(74,59,'DINHEIRO','2017-12-05',90.00,'',0,0.00,90.00,0.00,NULL,NULL,NULL),(75,60,'DINHEIRO','2017-11-10',70.00,'',0,0.00,70.00,0.00,NULL,NULL,NULL),(76,61,'DINHEIRO','2017-11-13',112.00,'',0,0.00,112.00,0.00,NULL,NULL,NULL),(77,61,'DINHEIRO','2017-12-15',120.00,'',0,0.00,120.00,8.00,NULL,NULL,NULL),(78,61,'DINHEIRO','2018-01-09',120.00,'',0,0.00,120.00,8.00,NULL,NULL,NULL),(79,61,'DINHEIRO','2018-02-08',120.00,'',0,0.00,120.00,8.00,NULL,NULL,2),(80,61,'DINHEIRO','2018-03-12',120.00,'',0,0.00,120.00,8.00,NULL,NULL,2),(81,61,'DINHEIRO','2018-04-10',120.00,'\0',0,0.00,120.00,8.00,NULL,NULL,NULL),(82,61,'DINHEIRO','2018-05-10',120.00,'\0',0,0.00,120.00,8.00,NULL,NULL,NULL),(83,61,'DINHEIRO','2018-06-09',120.00,'\0',0,0.00,120.00,8.00,NULL,NULL,NULL),(84,61,'DINHEIRO','2018-07-10',120.00,'\0',0,0.00,120.00,8.00,NULL,NULL,NULL),(85,61,'DINHEIRO','2018-08-10',48.00,'\0',0,0.00,48.00,-64.00,NULL,NULL,NULL),(86,62,'DINHEIRO','2017-11-13',140.00,'',0,0.00,140.00,0.00,NULL,NULL,NULL),(87,63,'CREDITO','2017-11-13',1450.00,'',10,169.90,1368.94,81.06,'2017-11-14',NULL,NULL),(88,64,'CHEQUE','2017-11-11',2283.33,'',0,0.00,2283.33,0.00,NULL,'2017-11-12',7),(89,64,'CHEQUE','2017-12-11',2283.33,'',0,0.00,2283.33,0.00,NULL,'2017-12-12',7),(90,64,'CHEQUE','2018-01-11',2283.33,'',0,0.00,2283.33,0.00,NULL,'2018-01-15',7),(91,65,'CREDITO','2017-11-12',160.00,'',2,83.61,151.06,8.94,'2017-12-12',NULL,NULL),(92,66,'DINHEIRO','2017-11-29',150.00,'',0,0.00,150.00,-150.00,NULL,NULL,NULL),(93,63,'CREDITO','2017-11-15',1400.00,'',10,164.04,1321.74,78.26,'2017-11-16',NULL,NULL),(94,67,'DINHEIRO','2017-11-18',120.00,'',0,0.00,120.00,120.00,NULL,NULL,NULL),(95,68,'DINHEIRO','2017-12-19',70.00,'',0,0.00,70.00,5.00,NULL,NULL,NULL),(96,69,'DINHEIRO','2017-11-22',100.00,'',0,0.00,100.00,-30.00,NULL,NULL,NULL),(97,70,'DINHEIRO','2017-12-01',160.00,'',0,0.00,160.00,-310.00,NULL,NULL,NULL),(98,71,'DINHEIRO','2017-12-10',195.00,'',0,0.00,195.00,195.00,NULL,NULL,NULL),(99,72,'DINHEIRO','2017-11-02',0.00,'',0,0.00,0.00,0.00,NULL,NULL,NULL),(100,73,'DINHEIRO','2017-11-21',60.00,'',0,0.00,60.00,60.00,NULL,NULL,NULL),(101,74,'DINHEIRO','2017-11-24',75.00,'',0,0.00,75.00,75.00,NULL,NULL,NULL),(102,74,'DINHEIRO','2018-01-02',75.00,'',0,0.00,75.00,75.00,NULL,NULL,NULL),(103,36,'DINHEIRO','2017-11-24',50.00,'',0,0.00,50.00,50.00,NULL,NULL,NULL),(104,75,'DINHEIRO','2017-11-26',100.00,'',0,0.00,100.00,100.00,NULL,NULL,NULL),(105,76,'DINHEIRO','2017-11-26',120.00,'',0,0.00,120.00,120.00,NULL,NULL,NULL),(106,77,'DINHEIRO','2017-11-27',170.00,'',0,0.00,170.00,170.00,NULL,NULL,NULL),(107,78,'DINHEIRO','2017-12-10',110.00,'',0,0.00,110.00,110.00,NULL,NULL,NULL),(108,78,'DINHEIRO','2018-01-12',50.00,'',0,0.00,50.00,50.00,NULL,NULL,1),(109,79,'DINHEIRO','2017-12-14',70.00,'',0,0.00,70.00,70.00,NULL,NULL,NULL),(110,80,'DINHEIRO','2018-01-08',120.00,'',0,0.00,120.00,120.00,NULL,NULL,NULL),(111,81,'DINHEIRO','2017-12-01',170.00,'',0,0.00,170.00,170.00,NULL,NULL,NULL),(112,82,'CREDITO','2017-11-27',150.00,'',1,150.00,142.51,7.49,'2017-12-27',NULL,NULL),(113,66,'DINHEIRO','2017-12-07',150.00,'',0,0.00,150.00,150.00,NULL,NULL,NULL),(114,83,'DINHEIRO','2017-11-29',50.00,'',0,0.00,50.00,50.00,NULL,NULL,NULL),(115,84,'DINHEIRO','2017-12-28',1200.00,'',0,0.00,1200.00,1200.00,NULL,NULL,NULL),(116,85,'DINHEIRO','2017-11-30',125.00,'',0,0.00,125.00,125.00,NULL,NULL,NULL),(117,86,'DINHEIRO','2017-11-30',120.00,'',0,0.00,120.00,120.00,NULL,NULL,NULL),(118,87,'DINHEIRO','2017-12-10',60.00,'',0,0.00,60.00,60.00,NULL,NULL,NULL),(119,88,'DINHEIRO','2017-12-11',35.00,'',0,0.00,35.00,35.00,NULL,NULL,NULL),(120,70,'DINHEIRO','2017-12-20',160.00,'',0,0.00,160.00,-150.00,NULL,NULL,NULL),(121,89,'DINHEIRO','2017-12-02',60.00,'',0,0.00,60.00,60.00,NULL,NULL,NULL),(122,90,'DINHEIRO','2017-12-02',450.00,'',0,0.00,450.00,450.00,NULL,NULL,NULL),(123,54,'DINHEIRO','2017-12-05',200.00,'',0,0.00,200.00,200.00,NULL,NULL,NULL),(124,91,'DINHEIRO','2017-12-04',150.00,'',0,0.00,150.00,150.00,NULL,NULL,NULL),(125,92,'DINHEIRO','2017-12-05',410.00,'',0,0.00,410.00,410.00,NULL,NULL,NULL),(126,93,'DINHEIRO','2017-12-09',390.00,'',0,0.00,390.00,390.00,NULL,NULL,NULL),(127,94,'CREDITO','2017-12-09',320.00,'',2,167.22,302.11,17.89,'2017-12-10',NULL,NULL),(128,95,'DINHEIRO','2018-02-09',2500.00,'',0,0.00,2500.00,700.00,NULL,NULL,7),(129,95,'DINHEIRO','2018-02-28',2100.00,'',0,0.00,2100.00,-700.00,NULL,NULL,7),(130,96,'DINHEIRO','2017-12-11',400.00,'',0,0.00,400.00,400.00,NULL,NULL,NULL),(131,96,'DINHEIRO','2018-01-09',170.00,'',0,0.00,170.00,-680.00,NULL,NULL,NULL),(132,97,'DINHEIRO','2017-12-12',200.00,'',0,0.00,200.00,200.00,NULL,NULL,NULL),(134,99,'DINHEIRO','2017-12-15',30.00,'',0,0.00,30.00,30.00,NULL,NULL,NULL),(135,56,'DINHEIRO','2018-01-08',200.00,'',0,0.00,200.00,200.00,NULL,NULL,NULL),(136,100,'DINHEIRO','2017-12-18',2400.00,'',0,0.00,2400.00,2400.00,NULL,NULL,NULL),(137,101,'DINHEIRO','2017-12-18',300.00,'',0,0.00,300.00,300.00,NULL,NULL,NULL),(138,101,'DINHEIRO','2018-01-10',300.00,'',0,0.00,300.00,300.00,NULL,NULL,NULL),(139,102,'DINHEIRO','2017-12-18',350.00,'',0,0.00,350.00,350.00,NULL,NULL,NULL),(140,102,'DINHEIRO','2017-12-28',1050.00,'',0,0.00,1050.00,1050.00,NULL,NULL,NULL),(141,103,'DINHEIRO','2017-12-17',150.00,'',0,0.00,150.00,150.00,NULL,NULL,NULL),(142,104,'DINHEIRO','2017-12-15',70.00,'',0,0.00,70.00,70.00,NULL,NULL,NULL),(143,105,'DINHEIRO','2017-12-19',130.00,'',0,0.00,130.00,130.00,NULL,NULL,NULL),(144,106,'DINHEIRO','2018-01-08',140.00,'',0,0.00,140.00,40.00,NULL,NULL,NULL),(145,106,'DINHEIRO','2018-02-15',140.00,'',0,0.00,140.00,-10.00,NULL,NULL,1),(146,107,'DINHEIRO','2018-01-09',130.00,'',0,0.00,130.00,130.00,NULL,NULL,NULL),(147,108,'DINHEIRO','2017-12-18',30.00,'',0,0.00,30.00,30.00,NULL,NULL,NULL),(148,109,'DINHEIRO','2018-01-10',65.00,'',0,0.00,65.00,65.00,NULL,NULL,NULL),(149,110,'DINHEIRO','2017-12-18',240.00,'',0,0.00,240.00,240.00,NULL,NULL,NULL),(150,111,'DINHEIRO','2017-12-20',1100.00,'',0,0.00,1100.00,100.00,NULL,NULL,NULL),(152,112,'DINHEIRO','2017-12-19',70.00,'',0,0.00,70.00,70.00,NULL,NULL,NULL),(154,111,'CREDITO','2017-12-20',1550.00,'',3,547.88,1463.35,86.65,'2017-12-21',NULL,NULL),(155,111,'CREDITO','2017-12-20',1600.00,'',5,349.28,1510.56,89.44,'2017-12-21',NULL,NULL),(156,70,'DINHEIRO','2018-01-10',150.00,'',0,0.00,150.00,40.00,NULL,NULL,NULL),(157,113,'DINHEIRO','2017-12-21',1925.00,'',0,0.00,1925.00,-75.00,NULL,NULL,NULL),(158,113,'DINHEIRO','2018-01-23',1925.00,'',0,0.00,1925.00,75.00,NULL,NULL,5),(159,114,'DINHEIRO','2018-01-13',80.00,'',0,0.00,80.00,-70.00,NULL,NULL,7),(160,115,'DINHEIRO','2018-03-12',120.00,'',0,0.00,120.00,120.00,NULL,NULL,2),(161,116,'DINHEIRO','2018-01-13',40.00,'',0,0.00,40.00,-25.00,NULL,NULL,7),(162,117,'DINHEIRO','2018-01-08',38.00,'',0,0.00,38.00,38.00,NULL,NULL,NULL),(163,118,'DINHEIRO','2017-12-27',50.00,'',0,0.00,50.00,50.00,NULL,NULL,NULL),(164,119,'DINHEIRO','2017-12-27',0.00,'',0,0.00,0.00,0.00,NULL,NULL,NULL),(165,120,'DINHEIRO','2017-12-27',0.00,'',0,0.00,0.00,0.00,NULL,NULL,NULL),(166,121,'DINHEIRO','2017-12-27',0.00,'',0,0.00,0.00,0.00,NULL,NULL,NULL),(167,122,'DINHEIRO','2017-12-27',0.00,'',0,0.00,0.00,0.00,NULL,NULL,NULL),(168,123,'DINHEIRO','2017-12-27',0.00,'',0,0.00,0.00,0.00,NULL,NULL,NULL),(169,96,'DINHEIRO','2018-02-26',100.00,'',0,0.00,100.00,-70.00,NULL,NULL,1),(170,96,'DINHEIRO','2018-04-02',170.00,'',0,0.00,170.00,170.00,NULL,NULL,8),(171,96,'DINHEIRO','2018-04-10',170.00,'\0',0,0.00,170.00,170.00,NULL,NULL,NULL),(172,96,'DINHEIRO','2018-05-10',170.00,'\0',0,0.00,170.00,170.00,NULL,NULL,NULL),(173,124,'DINHEIRO','2018-01-10',80.00,'',0,0.00,80.00,80.00,NULL,NULL,NULL),(174,124,'DINHEIRO','2018-02-19',70.00,'',0,0.00,70.00,70.00,NULL,NULL,2),(175,125,'DINHEIRO','2018-01-13',100.00,'',0,0.00,100.00,-5.00,NULL,NULL,7),(176,125,'DINHEIRO','2018-02-15',110.00,'',0,0.00,110.00,5.00,NULL,NULL,2),(177,126,'DINHEIRO','2018-03-01',190.00,'',0,0.00,190.00,95.00,NULL,NULL,2),(179,127,'DINHEIRO','2018-01-10',1000.00,'',0,0.00,1000.00,1000.00,NULL,NULL,NULL),(180,128,'DINHEIRO','2018-01-10',400.00,'',0,0.00,400.00,400.00,NULL,NULL,NULL),(185,131,'DINHEIRO','2018-02-12',151.66,'',0,0.00,151.66,-3.34,NULL,NULL,1),(186,131,'DINHEIRO','2018-03-12',151.66,'',0,0.00,151.66,1.66,NULL,NULL,2),(187,131,'DINHEIRO','2018-04-07',151.68,'',0,0.00,151.68,1.68,NULL,NULL,2),(188,132,'DINHEIRO','2018-02-16',150.00,'',0,0.00,150.00,75.00,NULL,NULL,2),(190,114,'DINHEIRO','2018-02-08',70.00,'',0,0.00,70.00,70.00,NULL,NULL,2),(191,116,'DINHEIRO','2018-01-13',25.00,'',0,0.00,25.00,25.00,NULL,NULL,1),(192,133,'DINHEIRO','2018-01-22',900.00,'',0,0.00,900.00,900.00,NULL,NULL,7),(193,133,'DINHEIRO','2018-02-19',900.00,'',0,0.00,900.00,900.00,NULL,NULL,7),(194,134,'DINHEIRO','2018-01-22',60.00,'',0,0.00,60.00,60.00,NULL,NULL,2),(195,135,'DINHEIRO','2018-02-09',130.00,'',0,0.00,130.00,-100.00,NULL,NULL,2),(196,136,'DINHEIRO','2018-02-09',105.00,'',0,0.00,105.00,105.00,NULL,NULL,7),(197,136,'DINHEIRO','2018-03-08',105.00,'',0,0.00,105.00,105.00,NULL,NULL,1),(198,137,'DINHEIRO','2018-01-22',250.00,'',0,0.00,250.00,250.00,NULL,NULL,1),(199,138,'DINHEIRO','2018-02-09',270.00,'',0,0.00,270.00,270.00,NULL,NULL,1),(200,138,'DINHEIRO','2018-03-06',270.00,'',0,0.00,270.00,270.00,NULL,NULL,8),(201,138,'DINHEIRO','2018-04-10',270.00,'\0',0,0.00,270.00,270.00,NULL,NULL,1),(202,139,'DINHEIRO','2018-02-05',65.00,'',0,0.00,65.00,65.00,NULL,NULL,1),(203,139,'DINHEIRO','2018-03-05',65.00,'',0,0.00,65.00,65.00,NULL,NULL,2),(204,140,'DINHEIRO','2018-02-09',180.00,'',0,0.00,180.00,5.00,NULL,NULL,1),(205,140,'DINHEIRO','2018-03-13',170.00,'',0,0.00,170.00,-5.00,NULL,NULL,1),(206,141,'DINHEIRO','2018-02-06',50.00,'',0,0.00,50.00,-50.00,NULL,NULL,5),(207,141,'DINHEIRO','2018-03-10',50.00,'',0,0.00,50.00,-50.00,NULL,NULL,1),(208,142,'DINHEIRO','2018-01-23',130.00,'',0,0.00,130.00,130.00,NULL,NULL,1),(209,143,'DINHEIRO','2018-01-22',30.00,'',0,0.00,30.00,30.00,NULL,NULL,1),(210,144,'DINHEIRO','2018-02-12',60.00,'',0,0.00,60.00,60.00,NULL,NULL,1),(211,144,'DINHEIRO','2018-03-12',60.00,'',0,0.00,60.00,60.00,NULL,NULL,2),(212,145,'DINHEIRO','2018-02-12',180.00,'',0,0.00,180.00,180.00,NULL,NULL,1),(213,146,'CREDITO','2018-01-24',95.00,'',2,49.65,89.69,5.31,'2018-02-23',NULL,NULL),(214,148,'DINHEIRO','2018-02-01',210.00,'',0,0.00,210.00,210.00,NULL,NULL,7),(215,127,'CREDITO','2018-02-01',1900.00,'',10,222.63,1793.79,106.21,'2018-02-02',NULL,NULL),(216,127,'DINHEIRO','2018-02-28',1000.00,'',0,0.00,1000.00,1000.00,NULL,NULL,7),(217,149,'DINHEIRO','2018-02-01',150.00,'',0,0.00,150.00,150.00,NULL,NULL,2),(218,150,'DINHEIRO','2018-02-03',4700.00,'',0,0.00,4700.00,4700.00,NULL,NULL,5),(219,151,'DINHEIRO','2018-02-06',800.00,'',0,0.00,800.00,800.00,NULL,NULL,7),(220,151,'DINHEIRO','2018-03-06',600.00,'',0,0.00,600.00,600.00,NULL,NULL,7),(221,151,'DINHEIRO','2018-04-06',600.00,'',0,0.00,600.00,600.00,NULL,NULL,7),(222,151,'DINHEIRO','2018-05-10',600.00,'\0',0,0.00,600.00,600.00,NULL,NULL,7),(223,154,'DINHEIRO','2018-02-06',210.00,'',0,0.00,210.00,210.00,NULL,NULL,2),(224,155,'DINHEIRO','2018-02-13',100.00,'',0,0.00,100.00,10.00,NULL,NULL,1),(225,155,'DINHEIRO','2018-03-16',80.00,'',0,0.00,80.00,-10.00,NULL,NULL,5),(226,156,'DINHEIRO','2018-03-06',95.00,'',0,0.00,95.00,95.00,NULL,NULL,8),(227,156,'DINHEIRO','2018-04-06',95.00,'',0,0.00,95.00,95.00,NULL,NULL,8),(228,141,'DINHEIRO','2018-04-05',50.00,'',0,0.00,50.00,50.00,NULL,NULL,1),(229,141,'DINHEIRO','2018-05-10',50.00,'\0',0,0.00,50.00,50.00,NULL,NULL,5),(230,152,'DINHEIRO','2018-02-06',120.00,'',0,0.00,120.00,120.00,NULL,NULL,7),(231,153,'DINHEIRO','2018-02-07',1500.00,'',0,0.00,1500.00,1500.00,NULL,NULL,5),(232,157,'DINHEIRO','2018-02-04',130.00,'',0,0.00,130.00,130.00,NULL,NULL,1),(233,158,'DINHEIRO','2018-02-06',255.00,'',0,0.00,255.00,255.00,NULL,NULL,7),(234,159,'DINHEIRO','2018-03-06',400.00,'',0,0.00,400.00,400.00,NULL,NULL,8),(235,159,'DINHEIRO','2018-04-04',400.00,'',0,0.00,400.00,400.00,NULL,NULL,8),(236,159,'DINHEIRO','2018-05-10',400.00,'\0',0,0.00,400.00,400.00,NULL,NULL,7),(237,160,'DINHEIRO','2018-01-20',0.00,'',0,0.00,0.00,0.00,NULL,NULL,7),(238,161,'DINHEIRO','2018-01-20',0.00,'',0,0.00,0.00,0.00,NULL,NULL,7),(239,162,'DINHEIRO','2018-02-08',150.00,'',0,0.00,150.00,150.00,NULL,NULL,2),(240,163,'DINHEIRO','2018-03-15',60.00,'',0,0.00,60.00,-60.00,NULL,NULL,2),(241,164,'DINHEIRO','2018-03-05',100.00,'',0,0.00,100.00,-50.00,NULL,NULL,1),(242,165,'DINHEIRO','2018-02-10',175.00,'',0,0.00,175.00,175.00,NULL,NULL,1),(243,165,'DINHEIRO','2018-03-15',175.00,'',0,0.00,175.00,175.00,NULL,NULL,2),(244,166,'DINHEIRO','2018-02-06',90.00,'',0,0.00,90.00,90.00,NULL,NULL,2),(245,167,'DINHEIRO','2018-02-06',0.00,'',0,0.00,0.00,0.00,NULL,NULL,2),(246,168,'DINHEIRO','2018-02-07',270.00,'',0,0.00,270.00,270.00,NULL,NULL,5),(247,169,'DINHEIRO','2018-02-07',200.00,'',0,0.00,200.00,200.00,NULL,NULL,1),(248,169,'CREDITO','2018-02-07',120.00,'',2,62.71,113.29,6.71,'2018-02-08',NULL,NULL),(249,95,'DINHEIRO','2018-02-07',1000.00,'',0,0.00,1000.00,1000.00,NULL,NULL,7),(250,170,'CREDITO','2018-02-08',150.00,'',4,40.35,141.61,8.39,'2018-02-09',NULL,NULL),(251,135,'DINHEIRO','2018-03-09',100.00,'',0,0.00,100.00,100.00,NULL,NULL,2),(252,171,'DINHEIRO','2018-03-09',65.00,'',0,0.00,65.00,65.00,NULL,NULL,1),(253,171,'DINHEIRO','2018-03-20',65.00,'',0,0.00,65.00,65.00,NULL,NULL,1),(254,172,'DINHEIRO','2018-02-18',250.00,'',0,0.00,250.00,250.00,NULL,NULL,8),(255,172,'CREDITO','2018-02-18',2350.00,'',7,377.05,2218.63,131.37,'2018-02-19',NULL,NULL),(256,173,'DINHEIRO','2018-02-19',150.00,'',0,0.00,150.00,150.00,NULL,NULL,2),(257,173,'DINHEIRO','2018-03-12',150.00,'',0,0.00,150.00,150.00,NULL,NULL,2),(258,174,'DINHEIRO','2018-04-07',48.32,'',0,0.00,48.32,-11.68,NULL,NULL,2),(259,174,'DINHEIRO','2018-05-10',71.68,'\0',0,0.00,71.68,11.68,NULL,NULL,2),(260,175,'DINHEIRO','2018-02-19',130.00,'',0,0.00,130.00,130.00,NULL,NULL,2),(261,176,'DINHEIRO','2018-02-19',750.00,'',0,0.00,750.00,750.00,NULL,NULL,7),(262,177,'DINHEIRO','2018-03-10',150.00,'',0,0.00,150.00,-10.00,NULL,NULL,1),(263,177,'DINHEIRO','2018-04-10',170.00,'\0',0,0.00,170.00,10.00,NULL,NULL,2),(264,178,'DINHEIRO','2018-03-10',140.00,'',0,0.00,140.00,140.00,NULL,NULL,1),(265,178,'DINHEIRO','2018-04-10',140.00,'\0',0,0.00,140.00,140.00,NULL,NULL,1),(266,179,'DINHEIRO','2018-03-09',75.00,'',0,0.00,75.00,-75.00,NULL,NULL,1),(267,180,'DINHEIRO','2018-03-13',35.00,'',0,0.00,35.00,-35.00,NULL,NULL,1),(268,181,'DINHEIRO','2018-03-24',450.00,'',0,0.00,450.00,112.50,NULL,NULL,1),(269,181,'DINHEIRO','2018-04-04',200.00,'',0,0.00,200.00,-250.00,NULL,NULL,1),(270,181,'DINHEIRO','2018-05-10',450.00,'\0',0,0.00,450.00,112.50,NULL,NULL,1),(272,182,'DINHEIRO','2018-04-02',130.00,'',0,0.00,130.00,70.00,NULL,NULL,8),(273,183,'DINHEIRO','2018-03-12',115.00,'',0,0.00,115.00,115.00,NULL,NULL,2),(274,183,'DINHEIRO','2018-04-07',115.00,'',0,0.00,115.00,115.00,NULL,NULL,2),(275,184,'DINHEIRO','2018-02-20',150.00,'',0,0.00,150.00,150.00,NULL,NULL,1),(276,184,'DINHEIRO','2018-03-05',215.00,'',0,0.00,215.00,215.00,NULL,NULL,1),(277,184,'DINHEIRO','2018-04-07',215.00,'',0,0.00,215.00,215.00,NULL,NULL,2),(278,185,'DINHEIRO','2018-03-04',150.00,'',0,0.00,150.00,20.00,NULL,NULL,1),(279,186,'DINHEIRO','2018-03-12',70.00,'',0,0.00,70.00,70.00,NULL,NULL,2),(280,187,'CREDITO','2018-02-22',150.00,'',3,53.03,141.61,8.39,'2018-02-23',NULL,NULL),(281,188,'DINHEIRO','2018-02-24',200.00,'',0,0.00,200.00,200.00,NULL,NULL,1),(282,189,'DINHEIRO','2018-03-10',65.00,'',0,0.00,65.00,65.00,NULL,NULL,1),(283,190,'DINHEIRO','2018-03-23',120.00,'',0,0.00,120.00,120.00,NULL,NULL,1),(284,191,'DINHEIRO','2018-02-23',2400.00,'',0,0.00,2400.00,2400.00,NULL,NULL,5),(285,191,'DINHEIRO','2018-02-28',3500.00,'',0,0.00,3500.00,3500.00,NULL,NULL,5),(286,192,'DINHEIRO','2018-04-07',120.00,'',0,0.00,120.00,60.00,NULL,NULL,2),(288,194,'DINHEIRO','2018-03-13',50.00,'',0,0.00,50.00,-15.00,NULL,NULL,1),(289,194,'DINHEIRO','2018-04-10',80.00,'\0',0,0.00,80.00,15.00,NULL,NULL,2),(290,195,'DINHEIRO','2018-03-04',50.00,'',0,0.00,50.00,50.00,NULL,NULL,1),(291,196,'DINHEIRO','2018-03-05',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(292,197,'DINHEIRO','2018-03-05',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(293,198,'CREDITO','2018-03-01',1163.78,'',1,1163.78,1105.31,58.47,'2018-03-14',NULL,NULL),(294,199,'DINHEIRO','2018-03-05',85.00,'',0,0.00,85.00,85.00,NULL,NULL,1),(295,200,'DINHEIRO','2018-03-05',600.00,'',0,0.00,600.00,600.00,NULL,NULL,1),(296,200,'DINHEIRO','2018-03-06',240.00,'',0,0.00,240.00,-760.00,NULL,NULL,8),(297,200,'DINHEIRO','2018-04-02',1000.00,'',0,0.00,1000.00,1000.00,NULL,NULL,8),(298,200,'DINHEIRO','2018-04-06',240.00,'',0,0.00,240.00,240.00,NULL,NULL,8),(299,200,'DINHEIRO','2018-05-10',240.00,'\0',0,0.00,240.00,240.00,NULL,NULL,1),(300,200,'DINHEIRO','2018-06-10',240.00,'\0',0,0.00,240.00,240.00,NULL,NULL,1),(301,200,'DINHEIRO','2018-07-10',240.00,'\0',0,0.00,240.00,240.00,NULL,NULL,1),(302,201,'DINHEIRO','2018-03-09',100.00,'',0,0.00,100.00,100.00,NULL,NULL,2),(303,201,'DINHEIRO','2018-04-10',110.00,'\0',0,0.00,110.00,110.00,NULL,NULL,2),(304,201,'DINHEIRO','2018-05-10',110.00,'\0',0,0.00,110.00,110.00,NULL,NULL,2),(305,96,'DINHEIRO','2018-03-07',70.00,'',0,0.00,70.00,70.00,NULL,NULL,2),(306,179,'DINHEIRO','2018-04-10',75.00,'\0',0,0.00,75.00,75.00,NULL,NULL,1),(307,203,'DINHEIRO','2018-03-10',130.00,'',0,0.00,130.00,130.00,NULL,NULL,1),(308,202,'DINHEIRO','2018-04-10',185.00,'\0',0,0.00,185.00,185.00,NULL,NULL,2),(309,204,'DINHEIRO','2018-03-12',30.00,'',0,0.00,30.00,30.00,NULL,NULL,2),(310,205,'DINHEIRO','2018-03-08',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(311,206,'DINHEIRO','2018-03-13',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(312,207,'DINHEIRO','2018-03-14',1935.00,'',0,0.00,1935.00,1935.00,NULL,NULL,8),(313,208,'DINHEIRO','2018-03-14',950.00,'',0,0.00,950.00,-4.00,NULL,NULL,6),(314,208,'DINHEIRO','2018-04-07',260.00,'',0,0.00,260.00,260.00,NULL,NULL,2),(315,208,'DINHEIRO','2018-05-10',350.00,'\0',0,0.00,350.00,350.00,NULL,NULL,2),(316,208,'DINHEIRO','2018-06-10',350.00,'\0',0,0.00,350.00,350.00,NULL,NULL,2),(317,208,'DINHEIRO','2018-07-10',350.00,'\0',0,0.00,350.00,350.00,NULL,NULL,2),(318,209,'DINHEIRO','2018-03-21',500.00,'',0,0.00,500.00,-500.00,NULL,NULL,1),(319,209,'DINHEIRO','2018-04-10',1000.00,'\0',0,0.00,1000.00,1000.00,NULL,NULL,2),(320,210,'DINHEIRO','2018-04-03',150.00,'',0,0.00,150.00,150.00,NULL,NULL,1),(321,211,'DINHEIRO','2018-02-19',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(322,212,'DINHEIRO','2018-02-19',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(323,180,'DINHEIRO','2018-04-10',35.00,'\0',0,0.00,35.00,35.00,NULL,NULL,1),(325,213,'DINHEIRO','2018-03-19',3100.00,'',0,0.00,3100.00,3100.00,NULL,NULL,7),(326,213,'CHEQUE','2018-04-23',1400.00,'\0',0,0.00,1400.00,1400.00,NULL,'2018-04-23',7),(327,214,'DINHEIRO','2018-04-10',35.00,'\0',0,0.00,35.00,35.00,NULL,NULL,1),(328,214,'DINHEIRO','2018-05-10',35.00,'\0',0,0.00,35.00,35.00,NULL,NULL,1),(329,215,'DINHEIRO','2018-04-10',35.00,'\0',0,0.00,35.00,35.00,NULL,NULL,1),(330,215,'DINHEIRO','2018-04-10',35.00,'\0',0,0.00,35.00,35.00,NULL,NULL,1),(331,216,'DINHEIRO','2018-04-10',30.00,'\0',0,0.00,30.00,30.00,NULL,NULL,1),(332,217,'DINHEIRO','2018-04-10',70.00,'\0',0,0.00,70.00,70.00,NULL,NULL,1),(333,217,'DINHEIRO','2018-05-10',70.00,'\0',0,0.00,70.00,70.00,NULL,NULL,1),(334,219,'DINHEIRO','2018-03-19',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(335,218,'CREDITO','2018-03-19',250.00,'',3,88.37,236.02,13.98,'2018-03-20',NULL,NULL),(336,220,'DINHEIRO','2018-03-19',85.00,'',0,0.00,85.00,85.00,NULL,NULL,8),(337,221,'DINHEIRO','2018-03-19',350.00,'',0,0.00,350.00,350.00,NULL,NULL,1),(338,222,'DINHEIRO','2018-04-07',150.00,'',0,0.00,150.00,150.00,NULL,NULL,2),(339,223,'DINHEIRO','2018-04-07',140.00,'',0,0.00,140.00,140.00,NULL,NULL,2),(340,223,'DINHEIRO','2018-05-10',140.00,'\0',0,0.00,140.00,140.00,NULL,NULL,2),(341,224,'DINHEIRO','2018-04-10',140.00,'\0',0,0.00,140.00,140.00,NULL,NULL,2),(342,224,'DINHEIRO','2018-05-10',140.00,'\0',0,0.00,140.00,140.00,NULL,NULL,2),(343,225,'DINHEIRO','2018-04-07',121.66,'',0,0.00,121.66,-60.84,NULL,NULL,2),(344,225,'DINHEIRO','2018-05-10',121.66,'\0',0,0.00,121.66,-60.84,NULL,NULL,2),(345,226,'DINHEIRO','2018-04-10',70.00,'\0',0,0.00,70.00,70.00,NULL,NULL,2),(346,209,'DINHEIRO','2018-04-02',500.00,'',0,0.00,500.00,500.00,NULL,NULL,8),(347,227,'DINHEIRO','2018-03-22',145.00,'',0,0.00,145.00,145.00,NULL,NULL,1),(348,227,'DINHEIRO','2018-04-03',155.00,'',0,0.00,155.00,155.00,NULL,NULL,1),(349,228,'DINHEIRO','2018-03-26',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(350,229,'DINHEIRO','2018-04-20',150.00,'\0',0,0.00,150.00,150.00,NULL,NULL,1),(351,230,'DINHEIRO','2018-03-26',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(352,231,'DINHEIRO','2018-03-26',60.00,'',0,0.00,60.00,60.00,NULL,NULL,2),(353,231,'DINHEIRO','2018-04-03',60.00,'',0,0.00,60.00,60.00,NULL,NULL,8),(354,233,'DINHEIRO','2018-04-02',120.00,'',0,0.00,120.00,120.00,NULL,NULL,1),(355,236,'DINHEIRO','2018-04-10',70.00,'\0',0,0.00,70.00,70.00,NULL,NULL,1),(356,237,'DINHEIRO','2018-04-10',70.00,'\0',0,0.00,70.00,70.00,NULL,NULL,1),(357,238,'DINHEIRO','2018-04-10',70.00,'\0',0,0.00,70.00,70.00,NULL,NULL,1),(358,239,'DINHEIRO','2018-04-10',50.00,'\0',0,0.00,50.00,50.00,NULL,NULL,1),(359,240,'DINHEIRO','2018-04-10',190.00,'\0',0,0.00,190.00,190.00,NULL,NULL,1),(360,241,'DINHEIRO','2018-04-10',350.00,'\0',0,0.00,350.00,350.00,NULL,NULL,1),(361,242,'DINHEIRO','2018-04-01',350.00,'',0,0.00,350.00,350.00,NULL,NULL,1),(362,243,'DINHEIRO','2018-04-07',100.00,'',0,0.00,100.00,-80.00,NULL,NULL,2),(363,243,'DINHEIRO','2018-05-10',175.00,'\0',0,0.00,175.00,80.00,NULL,NULL,2),(364,244,'DINHEIRO','2018-04-03',50.00,'',0,0.00,50.00,50.00,NULL,NULL,1),(365,244,'DINHEIRO','2018-05-10',290.00,'\0',0,0.00,290.00,290.00,NULL,NULL,1),(366,245,'DINHEIRO','2018-05-10',200.00,'\0',0,0.00,200.00,200.00,NULL,NULL,1),(367,246,'DINHEIRO','2018-05-10',280.00,'\0',0,0.00,280.00,280.00,NULL,NULL,1),(368,247,'DINHEIRO','2018-04-03',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(369,248,'DINHEIRO','2018-04-03',0.00,'',0,0.00,0.00,0.00,NULL,NULL,1),(370,181,'DINHEIRO','2018-04-13',250.00,'\0',0,0.00,250.00,250.00,NULL,NULL,1),(371,249,'DINHEIRO','2018-04-06',100.00,'',0,0.00,100.00,100.00,NULL,NULL,2),(372,250,'DINHEIRO','2018-04-06',500.00,'',0,0.00,500.00,500.00,NULL,NULL,1),(373,250,'CREDITO','2018-04-06',3150.00,'',5,687.65,2973.91,176.09,'2018-04-07',NULL,NULL),(374,251,'DINHEIRO','2018-05-10',200.00,'\0',0,0.00,200.00,200.00,NULL,NULL,2),(375,225,'DINHEIRO','2018-06-10',121.68,'\0',0,0.00,121.68,0.02,NULL,NULL,2),(376,252,'DINHEIRO','2018-04-09',400.00,'',0,0.00,400.00,400.00,NULL,NULL,2),(377,252,'DINHEIRO','2018-05-10',260.00,'\0',0,0.00,260.00,260.00,NULL,NULL,2),(378,252,'DINHEIRO','2018-06-10',260.00,'\0',0,0.00,260.00,260.00,NULL,NULL,2),(379,252,'DINHEIRO','2018-07-10',260.00,'\0',0,0.00,260.00,260.00,NULL,NULL,2),(380,252,'DINHEIRO','2018-08-10',260.00,'\0',0,0.00,260.00,260.00,NULL,NULL,2),(381,252,'DINHEIRO','2018-09-10',260.00,'\0',0,0.00,260.00,260.00,NULL,NULL,2);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `idPessoa` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `dataNascimento` datetime DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `dataCriacao` date DEFAULT NULL,
  `dataAlteracao` date DEFAULT NULL,
  `enderecoResidencial` varchar(255) DEFAULT NULL,
  `enderecoComercial` varchar(255) DEFAULT NULL,
  `linkImgFacebook` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `idPessoa_UNIQUE` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (3,'Thiago Araujo Berbet','SOCIO','006.288.131-04','1983-08-19 00:00:00','(67) 99106-0530','thiagoaraujoberbet@gmail.com','FUNCIONARIO','2017-09-02',NULL,NULL,NULL,NULL),(4,'Luana Alves Teixeira','SOCIO','030.853.991-51','1989-01-25 00:00:00','(67) 99307-8871','luanaalves144@hotmail.com','FUNCIONARIO','2017-09-02',NULL,NULL,NULL,'https://graph.facebook.com/100006117338969/picture?type=large'),(6,'Thays Brites',NULL,NULL,'1996-07-21 00:00:00','','thaysbrites@hotmail.com','CLIENTE','2017-09-04','2017-11-06',NULL,NULL,'https://graph.facebook.com/100002513681656/picture?type=large'),(7,'Juliana Fonseca',NULL,NULL,'1989-04-11 00:00:00','(67) 99228-8607','julyranan@hotmail.com','CLIENTE','2017-09-14','2017-11-07',NULL,NULL,'https://graph.facebook.com/1566221482/picture?type=large'),(8,'Juliane Fuzinato',NULL,NULL,'1900-11-07 00:00:00','(67) 99287-8875','','CLIENTE','2017-09-20','2018-04-08','Rua Leandro da Silva Salina, 789 - Mário Covas','','https://graph.facebook.com/100002438169536/picture?type=large'),(9,'Lays Ortiz',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL,'https://graph.facebook.com/100000743739141/picture?type=large'),(10,'Diogo Ortiz',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL,NULL),(11,'Cida',NULL,NULL,NULL,'(67) 99912-8142','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL,NULL),(12,'Bete',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-10-04',NULL,NULL,NULL),(13,'Franciele',NULL,NULL,'1990-05-17 00:00:00','(67) 99185-4818','','CLIENTE','2017-09-20','2017-11-07',NULL,NULL,'https://graph.facebook.com/100002885302861/picture?type=large'),(14,'Thainara',NULL,NULL,NULL,'','','CLIENTE','2017-09-24',NULL,NULL,NULL,NULL),(15,'Matheus',NULL,NULL,NULL,'(67) 99100-9715','','CLIENTE','2017-10-02',NULL,NULL,NULL,NULL),(16,'Helio Makoto',NULL,NULL,'1988-05-22 00:00:00','(67) 99865-4475','helio.kanno@gmail.com','CLIENTE','2017-10-02','2017-11-07',NULL,NULL,NULL),(17,'Lorena Alves',NULL,NULL,'2005-01-21 00:00:00','(67) 99325-2324','flamengo_loris2012@hotmail.com','CLIENTE','2017-10-02','2017-11-06',NULL,NULL,'https://graph.facebook.com/100004213451205/picture?type=large'),(18,'Patrão da Izabel',NULL,NULL,NULL,'','','CLIENTE','2017-10-02',NULL,NULL,NULL,NULL),(19,'Carinna Fuzitani',NULL,NULL,'1990-02-10 00:00:00','(67) 99283-7125','','CLIENTE','2017-10-02','2018-04-07','','','https://graph.facebook.com/100001701195013/picture?type=large'),(20,'Soely',NULL,NULL,NULL,'','','CLIENTE','2017-10-02','2017-11-06',NULL,NULL,NULL),(21,'Flip4 Julio Barone 607',NULL,NULL,NULL,'','','CLIENTE','2017-10-02',NULL,NULL,NULL,NULL),(22,'Fernando Araujo Berbet',NULL,NULL,'1989-12-24 00:00:00','(67) 99214-2290','fernandoberbet@gmail.com','CLIENTE','2017-10-04','2017-12-14','Rua Brigadeiro Thiago, 2212 - Bairro Universitário - Campo Grande/MS','','https://graph.facebook.com/100002253830686/picture?type=large'),(23,'Camila Fuzitani',NULL,NULL,NULL,'(97) 99144-1948','','CLIENTE','2017-10-07','2017-11-04',NULL,NULL,'https://graph.facebook.com/100001764683595/picture?type=large'),(24,'Jean Rossi',NULL,NULL,'1989-08-14 00:00:00','(67) 99201-8252','','CLIENTE','2017-10-12','2018-04-08','Rua do Cabo, 1156 - Coophavila 2','','https://graph.facebook.com/100013324693105/picture?type=large'),(25,'Rose',NULL,NULL,NULL,'','','CLIENTE','2017-10-15',NULL,NULL,NULL,NULL),(26,'Diogo Mishima',NULL,NULL,NULL,'(67) 98121-2244','','CLIENTE','2017-10-16','2018-04-03','','TCE/MS - Av. Des. José Nunes da Cunha, s/n',NULL),(27,'Thiago',NULL,NULL,NULL,'(67) 99123-7830','','CLIENTE','2017-10-18','2017-11-07',NULL,NULL,NULL),(28,'Michelle Bop',NULL,NULL,NULL,'','','CLIENTE','2017-10-22','2017-11-07',NULL,NULL,NULL),(29,'Fran',NULL,NULL,NULL,'','','CLIENTE','2017-10-22',NULL,NULL,NULL,NULL),(30,'Sandra Berbert',NULL,NULL,'1962-11-29 00:00:00','(67) 99238-1036','sandra.berbert@hotmail.com','CLIENTE','2017-11-06','2017-11-07',NULL,NULL,'https://graph.facebook.com/100000291315742/picture?type=large'),(31,'Kelly',NULL,NULL,NULL,'','','CLIENTE','2017-11-06',NULL,NULL,NULL,NULL),(32,'Jeanny Nakazato',NULL,NULL,NULL,'','','CLIENTE','2017-11-06','2017-11-07',NULL,NULL,'https://graph.facebook.com/100001558246710/picture?type=large'),(33,'Izabel Alves',NULL,NULL,'1984-01-13 00:00:00','(67) 98475-7342','','FUNCIONARIO','2017-11-06',NULL,NULL,NULL,NULL),(34,'Micheli Scariot (Decoradora)',NULL,NULL,NULL,'(67) 99211-3633','','CLIENTE','2017-11-07','2018-04-08','','Rua Antonio Maria Coelho, 2240','https://graph.facebook.com/100001264255464/picture?type=large'),(35,'Wellinton (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2017-11-07','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(36,'Cezar Duarte',NULL,NULL,'1988-02-28 00:00:00','(67) 99261-7085','cezarcabelera@hotmail.com','CLIENTE','2017-11-07',NULL,NULL,NULL,'https://graph.facebook.com/100000001316482/picture?type=large'),(37,'Cecília',NULL,NULL,NULL,'(67) 99903-8533','','CLIENTE','2017-11-08','2017-11-08',NULL,NULL,NULL),(38,'Thaynara Recaldes',NULL,NULL,NULL,'(67) 99103-6357','','CLIENTE','2017-11-13',NULL,NULL,NULL,NULL),(39,'Laís Aquino',NULL,NULL,'2002-01-12 00:00:00','(67) 99268-3642','','CLIENTE','2017-11-13','2018-04-03','','','https://graph.facebook.com/100004073615978/picture?type=large'),(40,'Ivan Rossi',NULL,NULL,NULL,'','','CLIENTE','2017-11-13',NULL,NULL,NULL,'https://graph.facebook.com/735391545/picture?type=large'),(41,'Rafael',NULL,NULL,NULL,'','','CLIENTE','2017-11-13',NULL,NULL,NULL,NULL),(42,'Rafael (Jbl GO)',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL,NULL),(43,'Suelem',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL,NULL),(44,'Welligton Leonardo',NULL,NULL,NULL,'','','CLIENTE','2017-11-20','2018-04-08','','',NULL),(45,'Camila',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL,NULL),(46,'Doação/Presente/Sorteio',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL,NULL),(47,'Beatriz (Estacionamento)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL,NULL),(48,'Marcos (Bone Preto)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL,NULL),(49,'Thiago Moraes',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL,NULL),(50,'Maria Helena Souza',NULL,NULL,NULL,'(31) 99332-8385','','CLIENTE','2017-11-27',NULL,NULL,NULL,NULL),(51,'Michele Tenório (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27','2018-04-07','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386','https://graph.facebook.com/100002341861984/picture?type=large'),(52,'Karine (El Kadri)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL,NULL),(53,'Soila Yussef',NULL,NULL,'1979-06-23 00:00:00','(67) 99244-6386','','CLIENTE','2017-11-27','2018-04-08','','','https://graph.facebook.com/100011672513509/picture?type=large'),(54,'Larissa',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL,NULL),(55,'Felipe',NULL,NULL,NULL,'','','CLIENTE','2017-11-30',NULL,NULL,NULL,NULL),(56,'Marcio',NULL,NULL,NULL,'','','CLIENTE','2017-12-01','2017-12-01',NULL,NULL,NULL),(58,'Daniele (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2017-12-01','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(59,'Eduardo',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL,NULL),(60,'Daphyni',NULL,NULL,NULL,'(67) 98112-6072','','CLIENTE','2017-12-01',NULL,NULL,NULL,NULL),(61,'Cristiane',NULL,NULL,NULL,'','','CLIENTE','2017-12-02',NULL,NULL,NULL,NULL),(62,'Pedro Moura Fé Elias',NULL,NULL,'1987-07-19 00:00:00','(67) 99988-6232','pedromourafeelias@yahoo.com.br','CLIENTE','2017-12-04','2018-04-08','','','https://graph.facebook.com/100000662991174/picture?type=large'),(63,'Mirian',NULL,NULL,NULL,'','','CLIENTE','2017-12-04',NULL,NULL,NULL,NULL),(64,'Tatiane Sanguina',NULL,NULL,NULL,'','','CLIENTE','2017-12-04',NULL,NULL,NULL,'https://graph.facebook.com/100000043723326/picture?type=large'),(65,'Gabriel (Cunhado Weverton)',NULL,NULL,NULL,'','','CLIENTE','2017-12-09',NULL,NULL,NULL,NULL),(66,'Bianca',NULL,NULL,NULL,'','','CLIENTE','2017-12-11',NULL,NULL,NULL,NULL),(67,'Matheus Vilela Fernandes',NULL,NULL,NULL,'(67) 98149-8777','','CLIENTE','2017-12-15',NULL,'','',NULL),(68,'Claudia Suchy Galvão',NULL,NULL,'1900-08-15 00:00:00','','','CLIENTE','2017-12-18','2018-04-03','','','https://graph.facebook.com/100001818494883/picture?type=large'),(69,'Angelica',NULL,NULL,NULL,'(67) 99207-6479','','CLIENTE','2017-12-18',NULL,'Rua Brigadeiro Thiago, 603 - Betaville - Campo Grande/MS','',NULL),(70,'José (Ernesto Borges)',NULL,NULL,NULL,'','','CLIENTE','2017-12-18',NULL,'','',NULL),(71,'Francyelle C. Gattes Rosse',NULL,NULL,'1988-12-13 00:00:00','(67) 99271-8118','','CLIENTE','2017-12-18','2018-04-07','','','https://graph.facebook.com/100001908626374/picture?type=large'),(72,'Diogo (STI)',NULL,NULL,NULL,'(67) 99349-8391','','CLIENTE','2017-12-18',NULL,'','',NULL),(73,'Maria',NULL,NULL,NULL,'(67) 99918-2337','','CLIENTE','2017-12-19','2017-12-19','','',NULL),(74,'Cliente',NULL,NULL,NULL,'','','CLIENTE','2017-12-20',NULL,'','',NULL),(75,'José Maycon Barboza Claro',NULL,NULL,'1989-04-23 00:00:00','(67) 99270-6200','','CLIENTE','2017-12-21','2018-04-03','','','https://graph.facebook.com/100001307966928/picture?type=large'),(76,'Camila Xavier',NULL,NULL,'1990-04-20 00:00:00','','','CLIENTE','2018-01-08','2018-04-07','','','https://graph.facebook.com/100000312171426/picture?type=large'),(77,'Leidy',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'','',NULL),(78,'Edna',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'','',NULL),(79,'Suelen Benites',NULL,NULL,'1989-03-05 00:00:00','','','CLIENTE','2018-01-10','2018-04-03','','','https://graph.facebook.com/100000518010356/picture?type=large'),(80,'Valentim Helio de Oliveira',NULL,NULL,'1900-08-07 00:00:00','(67) 99632-9520','','CLIENTE','2018-01-10','2018-04-03','','','https://graph.facebook.com/100001884965763/picture?type=large'),(81,'Larissa (Shopping)',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'','',NULL),(82,'Mara (Nega)',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'','',NULL),(83,'Gabriel Oliveira',NULL,NULL,NULL,'(67) 99893-5535','','CLIENTE','2018-01-23',NULL,'','',NULL),(84,'Thiago (Negão)',NULL,NULL,'1981-10-09 00:00:00','(67) 98167-7000','','CLIENTE','2018-01-23','2018-04-08','','','https://graph.facebook.com/100000632669191/picture?type=large'),(85,'Lilian Ibanhes',NULL,NULL,'1990-08-27 00:00:00','(67) 99125-8722','','CLIENTE','2018-01-23','2018-04-03','Mena Barreto, 255 - Universitário','Odontoclinic - Rua Lidia Bais, 38','https://graph.facebook.com/100004236526293/picture?type=large'),(86,'Paulo Amorim',NULL,NULL,NULL,'(67) 99134-6289','','CLIENTE','2018-01-23',NULL,'','',NULL),(87,'Ellen Berbert',NULL,NULL,'1900-03-05 00:00:00','(67) 99186-6336','','CLIENTE','2018-01-23','2018-04-07','','','https://graph.facebook.com/1841255810/picture?type=large'),(88,'Romildo (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-01-23','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(89,'Luiz Felipe',NULL,NULL,NULL,'','','CLIENTE','2018-01-23',NULL,'','',NULL),(90,'Michel Georges',NULL,NULL,NULL,'(67) 98177-9337','','CLIENTE','2018-02-01',NULL,'','Rua Pernambuco, 979',NULL),(91,'Glauce Pulquerio Nogueira',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(92,'Vanessa Velasques',NULL,NULL,'1900-03-15 00:00:00','(67) 99222-0541','','CLIENTE','2018-02-06','2018-04-08','','Vera Cruz Propaganda','https://graph.facebook.com/100001631031624/picture?type=large'),(93,'Fernando (Cliente Instagram)',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(94,'Juliana (Igreja)',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(95,'Michelle Oliveira',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(96,'Thiago Peres',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(97,'Thiago Silva',NULL,NULL,NULL,'(67) 98188-9495','','CLIENTE','2018-02-06',NULL,'','',NULL),(98,'Agnaldo Duarte',NULL,NULL,'1977-01-19 00:00:00','(67) 99236-5118','agnaldoduarte@msn.com','CLIENTE','2018-02-06','2018-04-03','','AZ Informática - 25 de Dezembro, 2071','https://graph.facebook.com/100001781775648/picture?type=large'),(99,'Vilmar (Diretor)',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(100,'Ana Maria (Sogra)',NULL,NULL,'1975-01-13 00:00:00','(67) 99243-0648','','CLIENTE','2018-02-06','2018-04-03','','','https://graph.facebook.com/100009696488766/picture?type=large'),(101,'Betânia',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(102,'Vivien',NULL,NULL,NULL,'','','CLIENTE','2018-02-06',NULL,'','',NULL),(104,'Vitória',NULL,NULL,NULL,'(67) 99219-6910','','CLIENTE','2018-02-07',NULL,'Residencial Parque Itacolomi - Av. Mato Grosso - 790002-232','',NULL),(105,'Marla',NULL,NULL,NULL,'(67) 99155-1306','','CLIENTE','2018-02-08',NULL,'','WTW - Rua Rachid Neder, 760',NULL),(106,'Matheus Gregório Sanches',NULL,NULL,'1994-11-15 00:00:00','','','CLIENTE','2018-02-19','2018-04-08','','SF - Sistema de Fôrmas para Concreto - Av. Gury Marques, 3790','https://graph.facebook.com/100007951095547/picture?type=large'),(107,'Camila Diogo',NULL,NULL,NULL,'','','CLIENTE','2018-02-19',NULL,'','','https://graph.facebook.com/100001357836401/picture?type=large'),(108,'Paulo Ricardo',NULL,NULL,NULL,'(67) 99976-7718','paulo.adm@outlook.com','CLIENTE','2018-02-19',NULL,'','','https://graph.facebook.com/1742028766/picture?type=large'),(109,'Thais Melo',NULL,NULL,'1994-04-06 00:00:00','','','CLIENTE','2018-02-19','2018-04-08','','','https://graph.facebook.com/100011680206983/picture?type=large'),(110,'Rafaela (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-02-19','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(111,'Francielli Mesquita',NULL,NULL,NULL,'(67) 99109-1096','','CLIENTE','2018-02-20','2018-04-07','','Edificio Dolor de Andrade - Av. Afonso Pena, 2386','https://graph.facebook.com/1643618509/picture?type=large'),(112,'Thais Araujo',NULL,NULL,'1994-12-28 00:00:00','(67) 99255-5522','','CLIENTE','2018-02-20','2018-04-03','','','https://graph.facebook.com/100002245984423/picture?type=large'),(113,'Neia (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-02-20','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(114,'Suzana',NULL,NULL,NULL,'(67) 99174-8329','','CLIENTE','2018-02-22',NULL,'','',NULL),(115,'Martinha Freitas',NULL,NULL,'1900-12-04 00:00:00','(67) 98219-1479','','CLIENTE','2018-02-28','2018-04-08','','','https://graph.facebook.com/100000261863311/picture?type=large'),(116,'Aline Cerialli',NULL,NULL,'1988-04-23 00:00:00','(67) 99347-0020','','CLIENTE','2018-02-28','2018-04-03','','Laércio Arruda Guilhem & Advogados Associados','https://graph.facebook.com/100000071924319/picture?type=large'),(117,'José Augusto',NULL,NULL,NULL,'','','CLIENTE','2018-02-28','2018-03-02','','',NULL),(118,'Amanda Leão (Vidalar Home Care)',NULL,NULL,'1990-07-02 00:00:00','(67) 99287-0940','','CLIENTE','2018-02-28','2018-04-03','Condomínio Castelo de Luxemburgo BL 14 AP. 105 - Av. Senador Antônio Mendes Canale','Vidalar Home Care - Rua Manoel Inácio de Souza, 386','https://graph.facebook.com/100004153833166/picture?type=large'),(119,'Laiane de Oliveira Araujo',NULL,NULL,NULL,'','laiane_k@yahoo.com.br','CLIENTE','2018-03-05','2018-03-05','Rua Odilon Barbosa, 1489 Bairro Aparecida - SAO FRANCISCO/MG Cep: 39300-000','','https://graph.facebook.com/100006160778001/picture?type=large'),(120,'Taynara Oliveira',NULL,NULL,NULL,'','','CLIENTE','2018-03-06',NULL,'','',NULL),(121,'Diego do Cavaco',NULL,NULL,NULL,'','','CLIENTE','2018-03-06',NULL,'','',NULL),(122,'Cristiane (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-03-06','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(123,'Camila Klein',NULL,NULL,NULL,'(67) 99166-5870','','CLIENTE','2018-03-13','2018-04-07','','Cassems - R. Antônio Maria Coelho, 6065 - Vivenda do Bosque','https://graph.facebook.com/100000596895873/picture?type=large'),(124,'Adelino',NULL,NULL,'1900-12-23 00:00:00','(67) 98402-8457','adelino@megawebprodutora.com.br','CLIENTE','2018-03-19','2018-04-03','','Rua Alexandre Fleming 499 – Apto 201 - Bandeirantes','https://graph.facebook.com/617274081/picture?type=large'),(125,'Adriano Gomes',NULL,NULL,NULL,'(67) 99237-8578','','CLIENTE','2018-03-19','2018-04-03','','AZ Informática - 25 de Dezembro, 2071','https://graph.facebook.com/100000437498937/picture?type=large'),(126,'Fred Ribeiro',NULL,NULL,'1994-03-15 00:00:00','(67) 99114-3284','','CLIENTE','2018-03-19','2018-04-08','','','https://graph.facebook.com/100003188028621/picture?type=large'),(127,'Tatiana (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-03-20','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(128,'Renata (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-03-20','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(129,'Nathy (Esteticista)',NULL,NULL,NULL,'','','CLIENTE','2018-03-20',NULL,'','',NULL),(130,'Izabel (Vidalar Home Care)',NULL,NULL,NULL,'','','CLIENTE','2018-03-20','2018-04-03','','Vidalar Home Care - Rua Manoel Inácio de Souza, 386',NULL),(131,'Debora Mundi',NULL,NULL,'1900-05-05 00:00:00','(67) 99248-3606','','CLIENTE','2018-03-20','2018-04-03','','','https://graph.facebook.com/1627874613/picture?type=large'),(132,'Glaucia Gama',NULL,NULL,NULL,'','','CLIENTE','2018-03-26',NULL,'','AZ Informática - 25 de Dezembro, 2017',NULL),(133,'Douglas Landin (Barbeiro) ',NULL,NULL,'1993-07-27 00:00:00','','','CLIENTE','2018-04-03','2018-04-03','','Designer Barber Academy - Rua Dom Aquino, 1810 - Centro','https://graph.facebook.com/100003019431276/picture?type=large'),(134,'Bárbara Peviane ',NULL,NULL,'1985-03-13 00:00:00','','','CLIENTE','2018-04-03','2018-04-03','','','https://graph.facebook.com/628863940/picture?type=large'),(135,'Thiago Michelini',NULL,NULL,NULL,'(67) 99822-2279','','CLIENTE','2018-04-05',NULL,'','',NULL),(138,'Eduarda Meins Graeff',NULL,NULL,NULL,'','','CLIENTE','2018-04-06',NULL,'','','https://graph.facebook.com/100000325299673/picture?type=large');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(4000) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `prefixo` varchar(40) DEFAULT NULL,
  `dataCriacao` date DEFAULT NULL,
  `dataAlteracao` date DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `idProduto_UNIQUE` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (6,'Caixa de Som','Criado para os apaixonados por música e praticidade, a JBL GO transmite música via Bluetooth a partir de dispositivos móveis. É alimentado por uma bateria recarregável com até 5 horas de reprodução, e viva-voz com cancelamento de ruído, permitindo que você atenda chamadas sem desligar sua caixa de som.','ELETRONICOS','JBL','GO','jblGo','2017-08-22','2018-02-16'),(7,'Caixa de Som','O JBL Flip 4 é a última geração da premiada série Flip, uma caixa de som portátil com Bluetooth que oferece um som estéreo surpreendentemente poderoso. Esta caixa de som compacta é alimentada por uma bateria de íons de lítio recarregável de 3.000 mAh, que oferece 12 horas contínuas de áudio de alta qualidade. ','ELETRONICOS','JBL','FLIP4','jblFlip4','2017-08-22','2018-02-16'),(8,'Caixa de Som','A Caixa Bluetooth à prova d´agua Charge 3 agora vem com carregador portátil e deixa o som ainda mais potente. Escute suas músicas sem fios, por muito mais tempo e ainda leve sua festa para todo o lugar. Graças ao seu design à prova d´água, tecido durável e carcaça resistente, ela pode até cair na piscina. ','ELETRONICOS','JBL','CHARGE3','jblCharge3','2017-08-22','2018-02-16'),(9,'Perfume Masculino','O Perfume Ferrari Masculino possui aroma cítrico amadeirado, ideal para homens misteriosos e sensuais. Em sua fragrância, notas que combinam bergamota, maçã, ameixa, canela, jasmim, rosa, cedro e baunilha.','COSMETICOS','Ferrari','Black 125 ml (Eau de Toilette)',NULL,'2017-08-22','2018-01-22'),(10,'Fone de Ouvido Wireless','Possui entrada auxiliar onde você pode ouvir musicas de celulares que não tem a tecnologia bluetooth. O fone de ouvido é carregado através da porta USB do seu computador ou carregador de 5v (não incluído). É possível receber e fazer chamadas pelo fone, se','ELETRONICOS','Ewtto','ET-A4260B',NULL,'2017-08-22',NULL),(11,'Chromecast','O Chromecast é um dispositivo de streaming de mídia que é conectado à porta HDMI da sua TV. Use o dispositivo móvel e a TV que você já possui para transmitir seus programas de TV, filmes, músicas, esportes e jogos favoritos e muito mais. O Chromecast func','ELETRONICOS','Google','2','chromecast2','2017-08-22','2018-03-19'),(12,'Perfume Feminino','Tommy Girl é um bouquet de puro frescor, um mix de flores que associa a refrescância da camélia com a luminosidade da flor de maçã, e acordes brilhantes da flor do cassis. Uma fragrância energizante com toques cítricos da tangerina, de madeiras frescas e ','COSMETICOS','Tommy','Girl 100 ml',NULL,'2017-08-22','2018-01-22'),(13,'Tapete','Tapete','CASA','Tapete','Tapete 3x2',NULL,'2017-08-22','2017-09-24'),(14,'Smartphone','Ele já vem com o novo iOS 10, o sistema operacional móvel mais avançado do mundo que deixa seu aparelho ainda mais pessoal, de uma forma poderosa. A interface é bonita e fácil de usar. Sugestões inteligentes aparecem quando você mais precisa e as tecnolog','CELULARES','Iphone','7 32GB',NULL,'2017-08-22',NULL),(15,'Smartphone','...','CELULARES','Iphone','6 32GB',NULL,'2017-08-22',NULL),(16,'Smartphone','...','CELULARES','Iphone','6s 32GB',NULL,'2017-08-22',NULL),(17,'Tablet','...','ELETRONICOS','Ipad','32GB Wi-Fi',NULL,'2017-08-22','2017-09-22'),(18,'Smartphone','...','CELULARES','Iphone','7 Plus 32GB',NULL,'2017-08-22',NULL),(19,'Relógio Masculino','..','JOIASERELOGIOS','Curren','G3-18375 D-1761',NULL,'2017-08-22','2017-12-11'),(20,'Carregador Portátil','Capacidade: 5600 mAh\r\nEntrada: DC 5V/1A\r\nSaida: DC 5V/2.1A\r\nInterface: 1 Micro USB entrada e 2 USB saída\r\nInclui: Carregador portátil, cabo USB, manual\r\nAdaptável para quase todos os smartfones, tablet, PC, GPS ou outros produtos digitais.','ELETRONICOS','Ecopower','EP-C813 5600mAh','cEpC813','2017-08-22','2018-02-19'),(21,'Carregador Portátil','...','ELETRONICOS','Ecopower','EP-C883 9000mAh','cEpC883','2017-08-22','2018-02-19'),(22,'Máscara Hidratante','A Máscara Ultra Hidratante Desmaia Cabelo da Forever Liss possui ação instantânea Anti Volume e Frizz, super eficaz que age suavizando os fios, deixando os super sedosos, macios e com brilho. A Máscara Desmaia Cabelo Forever Liss possui que recupera os fi','COSMETICOS','Desmaia Cabelo','350g',NULL,'2017-08-22','2017-11-03'),(23,'Perfume Feminino','Calvin Klein inicia uma nova era na perfumaria! CKIN2U foi especialmente elaborado para uma geração que se define pela troca de experiências por meio de uma rede de comunicação virtual. A qualquer hora, em qualquer lugar e com qualquer pessoa... Jovens an','COSMETICOS','Calvin Klein','CKin2u 100 ml',NULL,'2017-08-22','2018-01-22'),(24,'Garrafa Térmica','...','CASA','Travel & Leisure','5,8L',NULL,'2017-08-22','2017-09-22'),(25,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Temptation 200ml',NULL,'2017-08-22',NULL),(26,'Smartphone','...','CELULARES','Iphone','7 Plus 128GB',NULL,'2017-08-22',NULL),(27,'Smartphone','...','CELULARES','Iphone','7 Red 128GB',NULL,'2017-08-22',NULL),(28,'Smartphone','...','CELULARES','Iphone','7 128 GB',NULL,'2017-08-22',NULL),(29,'HD SSD','...','INFORMATICA','Sandisk','240GB',NULL,'2017-08-22',NULL),(30,'IPTV','...','ELETRONICOS','HTV','5',NULL,'2017-08-22',NULL),(31,'Creme Capilar','Leave-in com 10 benefícios reais em um só produto, para todos os tipos de cabelo. O Revlon Professional Uniq One cuida, trata, protege, controla, dentre outras ações. \r\nVencedor do Prêmio Especial Inovação da revista Nova/Cosmopolitan, ele é realmente uma','COSMETICOS','Revlon','Uniq One',NULL,'2017-08-22','2017-11-09'),(32,'Creme Hidratante','...','COSMETICOS','Victoria’s Secret','Pure Seduction 236ml',NULL,'2017-08-22',NULL),(33,'Creme Hidratante ','...','COSMETICOS','Victoria’s Secret','Coconut Passion 236ml',NULL,'2017-08-22',NULL),(34,'Perfume Feminino ','...','COSMETICOS','Calvin Klein','CKin2u 150 ml',NULL,'2017-08-22','2018-01-22'),(35,'Carregador Portatil','...','ELETRONICOS','EcoPower','EP-C808 5200mAh',NULL,'2017-08-22',NULL),(36,'Tablet','...','ELETRONICOS','Samsung','Galaxy Tab3 Lite 8GB (SM-T113)',NULL,'2017-08-22','2017-10-22'),(37,'Cinta Abdominal','Confira a Cinta Abdominal Ativadora em Neoprene Sweet Sweat!\r\nTenha um auxílio na melhora de sua postura e maximize os resultados do Sweet Sweat com essa Cinta Abdominal Ativadora!\r\nSeu ajuste em velcro proporciona conforto e seu material com neoprene aux','ESPORTEFITNESS','Sweet Sweat','Waist Trimmer','cintaAbdSweet','2017-08-22','2018-03-19'),(38,'Gel','...','ESPORTEFITNESS','Sweet Sweat','Workout Enhancer',NULL,'2017-08-22',NULL),(39,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Amber Romance 200ml',NULL,'2017-08-22',NULL),(40,'Carregador Portátil','...','ELETRONICOS','MOX','P250 3000mAh',NULL,'2017-08-22',NULL),(41,'Fone de Ouvido','...','ELETRONICOS','Iphone','Com Fio',NULL,'2017-08-22',NULL),(42,'Perfume Feminino','...','COSMETICOS','Bvlgari','65 ml (Eau de Toilette)',NULL,'2017-08-22','2018-01-22'),(43,'Perfume Unissex','...','COSMETICOS','Calvin Klein','CK One 100 ml (Eau de Toilette)',NULL,'2017-08-22','2018-01-22'),(44,'Smartphone','...','CELULARES','Iphone','8 Plus 64GB',NULL,'2017-08-22',NULL),(45,'Tablet','...','ELETRONICOS','Ipad','Pro 64GB',NULL,'2017-08-22','2017-10-22'),(46,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Secret Escape 236ml',NULL,'2017-08-22',NULL),(47,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Snch a Flirt 236ml',NULL,'2017-08-22',NULL),(48,'Pulseira Inteligente','...','ESPORTEFITNESS','Sky','FitBand 1 Black/White',NULL,'2017-08-22',NULL),(49,'Relógio Feminino','...','JOIASERELOGIOS','Xiaoxia','JYSB-25',NULL,'2017-08-22','2017-12-11'),(50,'Relógio Feminino','...','JOIASERELOGIOS','G3-7S-18727','D-5532',NULL,'2017-08-22','2017-12-11'),(51,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1762',NULL,'2017-08-22','2017-12-11'),(52,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1763',NULL,'2017-08-22','2017-12-11'),(53,'Película','Película de Vidro Universal para Iphone 7','ACESSORIOS','Sem Marca','Universal Iphone',NULL,'2017-11-03',NULL),(54,'Capinha','Capinha para Iphone 7 da cor Rosa','ACESSORIOS','Sem Marca','Iphone 7','cpIp7','2017-11-03','2018-02-19'),(55,'Perfume Masculino','...','COSMETICOS','Animale','100 ml (Eau de Toilette)',NULL,'2017-11-03','2018-01-22'),(56,'Kit','...','COSMETICOS','Aussie','3 Peças 865ml',NULL,'2017-11-03',NULL),(57,'Kit','...','COSMETICOS','Aussie','3 Peças 400ml',NULL,'2017-11-03',NULL),(58,'Máscara Hidratante','...','COSMETICOS','Silicon Mix','Bambu 225g',NULL,'2017-11-03','2017-11-03'),(59,'Perfume Feminino','...','COSMETICOS','Marina De Bourbon','Rouge Royal 50 ml (Eau de Parfum)',NULL,'2017-11-03','2018-01-22'),(60,'Garrafa Térmica','...','CASA','Travel & Leisure','7,7L',NULL,'2017-11-03','2017-11-03'),(61,'Creatina','Creatine Powder 120 g - Universal Nutrition é um suplemento feito exclusivamente de Creatina Monohidratada. Porção com 3g de Creatina.','ESPORTEFITNESS','Universal','120g','creatinaUniversal120','2017-11-03','2018-03-19'),(62,'Smartphone','...','CELULARES','Iphone','8 64GB',NULL,'2017-11-06',NULL),(63,'Smartphone','...','CELULARES','Iphone','X 256GB',NULL,'2017-11-09','2017-11-09'),(64,'Perfume Masculino','...','COSMETICOS','JOOP! NightFlight','125 ml',NULL,'2017-11-13','2018-01-22'),(65,'Máscara Hidratante','...','COSMETICOS','Silicon Mix','225g',NULL,'2017-11-13',NULL),(67,'Smartphone','..','CELULARES','Samsung Galaxy','J5 16GB LTE',NULL,'2017-11-13',NULL),(68,'Termogênico','...','ESPORTEFITNESS','LIPO 6 Black','60 Cápsulas',NULL,'2017-11-13',NULL),(69,'Perfume Masculino','...','COSMETICOS','Carolina Herrera','212 MEN NYC 100 ml (Eau de Toilette)',NULL,'2017-11-27','2017-11-27'),(70,'Perfume Masculino','...','COSMETICOS','Chanel','Bleu 100 ml (Eau de Parfum)',NULL,'2017-11-27',NULL),(71,'Shampoo','...','COSMETICOS','Silicon Mix','Bambu 473 ml',NULL,'2017-11-27',NULL),(72,'Shampoo','...','COSMETICOS','Aussie','Moist 400 ml',NULL,'2017-11-27',NULL),(73,'Máscara Hidratante','...','COSMETICOS','Revlon','Uniq One',NULL,'2017-11-27','2017-11-27'),(74,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Love Spell 236 ml',NULL,'2017-11-27',NULL),(75,'Smartphone','...','CELULARES','Samsung Galaxy','J7 Prime',NULL,'2017-11-27',NULL),(76,'Smartphone','...','CELULARES','Iphone','X 64 GB',NULL,'2017-12-11',NULL),(77,'Relógio Masculino','...','JOIASERELOGIOS','Cagarny','F. Preto P.Marron Claro',NULL,'2017-12-11',NULL),(78,'Relógio Masculino','...','JOIASERELOGIOS','Cagarny','F. Azul P.Marron Escuro',NULL,'2017-12-11',NULL),(79,'Relógio Masculino','...','JOIASERELOGIOS','Naviforce','Black Yellow',NULL,'2017-12-11',NULL),(80,'Relógio Masculino','...','JOIASERELOGIOS','Naviforce','Gold Black',NULL,'2017-12-11',NULL),(81,'SmartBand','...','ESPORTEFITNESS','GPS Sports','S908 Black',NULL,'2017-12-11',NULL),(82,'Perfume Feminino','...','COSMETICOS','Britney Spears','Hidden Fantasy 100 ml (Eau de Parfum Spray/Vaporisateur)',NULL,'2017-12-18','2017-12-18'),(83,'Perfume Feminino','...','COSMETICOS','Chanel','Coco Mademoiselle 100 ml (Eau de Parfum/Vaporisateur Spray)',NULL,'2017-12-18','2017-12-18'),(84,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Passion Stuck 236 ml',NULL,'2017-12-18',NULL),(85,'Perfume Feminino','...','COSMETICOS','Ralph Lauren','Romance 100 ml (Eau de Parfum)',NULL,'2017-12-18','2018-01-22'),(86,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18382B D-1850',NULL,'2017-12-18','2017-12-18'),(87,'Perfume Feminino','...','COSMETICOS','Calvin Klein','Euphoria 100 ml (Eau de Parfum Spray/Vaporisateur)',NULL,'2017-12-18',NULL),(88,'Garrafa Térmica','...','CASA','Travel & Leisure','9,5L',NULL,'2017-12-18',NULL),(89,'Video Game','...','GAMES','Sony','Playstation 4 Slim 500GB (Sem Jogo)','ps4Slim500','2017-12-18','2018-03-19'),(90,'Tapete','...','CASA','Tapete','Passarela',NULL,'2017-12-18','2017-12-18'),(91,'Shampoo','...','COSMETICOS','Joico','Moisture Recovery 1L',NULL,'2018-01-10',NULL),(92,'Base','...','COSMETICOS','Dermacol','Make-up Cover ','dbase','2018-01-10','2018-02-19'),(93,'Caixa de Som','...','ELETRONICOS','Ecopower','EP-2133','ep2133','2018-01-10','2018-02-19'),(94,'Perfume Feminino','...','COSMETICOS','Carolina Herrera','212 Sexy 100 ml (Eau de Parfum)',NULL,'2018-01-22','2018-01-22'),(95,'Perfume Masculino','...','COSMETICOS','Ralph Lauren','Polo Black 75 ml (Eau de Toilette)',NULL,'2018-01-22','2018-01-22'),(96,'Perfume Masculino','...','COSMETICOS','Mont Blanc','Legend 100 ml (Eau de Toilette)',NULL,'2018-01-22','2018-01-22'),(97,'Perfume Feminino','...','COSMETICOS','Carolina Herrera','CH 100 ml (Eau de Toilette)',NULL,'2018-01-22','2018-01-22'),(98,'Perfume Masculino','...','COSMETICOS','Yves Saint Laurent','Body Kouros 100 ml (Eau de Toilette)',NULL,'2018-01-22',NULL),(99,'Perfume Feminino','...','COSMETICOS','Cacharel','Amor Amor 30 ml (Eau de Toilette)',NULL,'2018-01-22',NULL),(100,'Mala de Viagem','...','CASA','...','Média',NULL,'2018-01-22',NULL),(101,'Câmera de Ação','...','ELETRONICOS','GO Pro','Hero 6 Black','gphero6','2018-01-22','2018-02-19'),(102,'Tablet','...','ELETRONICOS','Samsung Galaxy','Tab A6 10,1 16GB WI-FI',NULL,'2018-02-06',NULL),(103,'Garrafa Térmica','...','CASA','Airpot','2,5L',NULL,'2018-02-06',NULL),(104,'Relógio Fitness','...','ESPORTEFITNESS','TomTom','Runner 3 Music GPS',NULL,'2018-02-06',NULL),(105,'Glutamina','...','ESPORTEFITNESS','ON','1KG',NULL,'2018-02-06',NULL),(106,'Relógio Fitness','...','ESPORTEFITNESS','Axxis','B323B Smart Bracelet',NULL,'2018-02-06',NULL),(107,'Perfume Feminino','...','COSMETICOS','Kenzo','Jungle Elephant 100 ml (Eau de Parfum)',NULL,'2018-02-14','2018-02-14'),(108,'Perfume Feminino','...','COSMETICOS','Chanel','Coco Noir 100 ml (Eau de Parfum)',NULL,'2018-02-15',NULL),(109,'Perfume Feminino','...','COSMETICOS','Paco Rabanne','Black XS 80 ml (Eau de Toilette)','perfFemPRBlackXs','2018-02-16','2018-02-19'),(110,'Tequila','...','BEBIDAS','Jose Cuervo','1800 (750 ml) Silver','jc1800','2018-02-19','2018-03-05'),(111,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1764','rm1764','2018-02-19',NULL),(112,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18382B D-1857','rm1857','2018-02-19',NULL),(113,'Relógio Masculino','...','JOIASERELOGIOS','Curren','XIAOXIA JYSB-60 (8225)','rmJysb60','2018-02-19','2018-03-05'),(114,'Notebook','NB Razer Gaming Blade RZ09-0195\r\nI7-7700HQ 2.8Ghz/16GB/256GB SSD\r\n2/14.0 FHD/VGA GTX 1060 6 GB/W10','INFORMATICA','Razer','NB Razer Gaming Blade RZ09-0195 I7-7700HQ 2.8GHZ','notrazeri7','2018-02-28','2018-03-13'),(115,'Perfume Feminino','...\r\n','COSMETICOS','Issey Miyake','L\'Eau D\'Issey 100 ml (Eau de Toillete)','isseymiyakefem','2018-03-05',NULL),(116,'Perfume Masculino','...','COSMETICOS','Jacques Bogart','Silver Scent 100 ml (Eau de Toilette)','perfMascSilverScent','2018-03-05',NULL),(117,'Perfume Masculino','...','COSMETICOS','Carolina Herrera','212 VIP MEN 50 ml ','perfMasc212Vip','2018-03-05',NULL),(118,'Perfume Feminino','...','COSMETICOS','Paco Rabanne','Olympea Intense 50 ml (Eau de Parfum)','perfFemPROlympeaInt','2018-03-05',NULL),(119,'Perfume Feminino','...','COSMETICOS','Lancome','La Vie Est Belle 50 ml (Eau de Parfum)','perfFemLaVieEstBelle50','2018-03-05',NULL),(120,'Whisky','...','BEBIDAS','Johnnie walker','Black Label 1L','wJwBl','2018-03-05','2018-03-05'),(121,'Relógio Masculino','...','JOIASERELOGIOS','Curren','XIAOXIA JYSB-63 (8208)','rmJysb63','2018-03-05','2018-03-05'),(122,'Caixa de Relógio','...','ACESSORIOS','--','--','cr','2018-03-05',NULL),(123,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1757','rm1757','2018-03-05',NULL),(124,'Creatina','...','ESPORTEFITNESS','Universal','200g','creatinaUniversal200','2018-03-05','2018-03-19'),(125,'Termogênico','...','ESPORTEFITNESS','USPLabs','OxyElite Pro 90 caps.','termOxy','2018-03-05',NULL),(126,'Notebook','ACER A315-51-51SL I5-7200U 2.5GHZ/6GB/1TB/15.6\"','INFORMATICA','Acer','ACER A315-51-51SL I5-7200U 2.5GHZ','notaceri5_2.5GHZ_6GB_1TB_15','2018-03-13','2018-03-13'),(127,'Apple Watch','...','ELETRONICOS','Apple','42mm Serie 3','appleW42S3','2018-03-13',NULL),(128,'Fone de Ouvido Bluetooth','...','ELETRONICOS','JBL','E45BT','jblE45BT','2018-03-16',NULL),(129,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Pure Seduction 250 ml','chVsPS250','2018-03-19',NULL),(130,'Carregador de Pilhas','...','ELETRONICOS','Sony','BCG-34 HH4GN 2500mAh','cpsonyBCG34','2018-03-19','2018-03-19'),(131,'Mochila','...','ACESSORIOS','--','Escolar (Rodinha)','mEscolarRodinha','2018-03-19',NULL),(132,'Fone de Ouvido Bluetooth','...','ELETRONICOS','Beats','Solo 3','foneBTBeatsSolo3','2018-03-19',NULL),(133,'HD Externo','...','INFORMATICA','Seagate','2.5\" 2TB','hdExtSeagate2T','2018-03-19','2018-04-02'),(134,'Video Game','...','GAMES','Sony','Playstation 4 Pro 1Tera (Sem Jogo)','ps4Pro1TB','2018-03-19','2018-03-19'),(135,'Video Game','...','GAMES','Nintendo','Switch Neon 32GB','nintendoSwitchNeon32GB','2018-03-19','2018-03-19'),(136,'Boneco','...','BRINQUEDOS','Funko ','POP (Vários Personagens)','bonecoFunkoPop','2018-03-19',NULL),(137,'Moleton Masculino','...','VESTUARIO','GAP','Várias Cores','moletonMascGAP','2018-03-19',NULL),(138,'Moleton Feminino','...','VESTUARIO','GAP','Várias Cores','moletonFemGAP','2018-03-19',NULL),(139,'Ar Condicionado Split','...','ELETRODOMESTICOS','Mitsuo','12.000Btus Quente e Frio - 220v/60hz','arSpliMitsuo12mil220v','2018-03-19',NULL),(140,'Produto Teste','...','ELETRONICOS','Teste','Teste','produtoTeste','2018-03-23',NULL),(141,'Perfume Feminino','...','COSMETICOS','Animale','100 ml (Eau De Parfum)','perfFemAnimale100','2018-04-02',NULL),(142,'Máscara Hidratante','...','COSMETICOS','Forever Liss','Banho de Perola 250g','mascHidrBanPerola250','2018-04-02','2018-04-02'),(143,'Perfume Masculino','...','COSMETICOS','Paco Rabanne','One Million 100 ml','perfMascOneMi100','2018-04-02',NULL),(144,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Amber Romance 236 ml','cremeHidrAmberRom236','2018-04-02',NULL),(145,'Condicionador','...','COSMETICOS','Aussie','3 Minute Moist 236 ml','condAussieMost3minute236','2018-04-02',NULL),(146,'HD Externo','...','INFORMATICA','Seagate','Expansion Negro 2.5\" 1TB','hdExtSeagate1T','2018-04-02',NULL),(147,'Perfume Infantil Unissex','...','COSMETICOS','Bvlgari','Petits Et Mamans 100 ml (Eau De Toillete)','perfInfBvlgPetitsEtMamans100','2018-04-02',NULL),(148,'Perfume Infantil Unissex','...','COSMETICOS','Burberry','Baby Touch 100 ml','perfInfBurberryBabyTouch100','2018-04-02',NULL),(149,'Carregador Iphone','...','ACESSORIOS','Apple','5W USB Power Adapter (USA)','carregIphone','2018-04-06','2018-04-06'),(150,'Cabo Iphone','...','ACESSORIOS','Iphone','Lightning to USB Cable (1m)','caboIphone','2018-04-06',NULL),(151,'Video Game','Simples. Instantâneo. Completo. Leve mais diversão e entretenimento para toda a família com o Xbox One. Além de um console de jogos de última geração, o Xbox One permite que você tenha acesso aos seus filmes, jogos e músicas favoritas sem precisar mudar as entradas na sua Tv. Você pode gerenciar todas essas funções apenas com o comando da sua voz. \r\nCom disco rígido de 500GB você terá espaço suficiente para gravar seus jogos, fotos, demos e ainda contar com um padrão de qualidade impressionante em Hd com a unidade de disco Blu-Ray. Uma infinidade de opções de entretenimento e lazer para todos os gostos e idades. ','GAMES','Microsoft','XBox One 500GB','vgXboOne500Gb','2018-04-07','2018-04-07'),(152,'Video Game','....','GAMES','Sony','Playstation 4 Slim 1Tera (3 Jogos)','vgPlay4Slim1Tb3Jogos','2018-04-09',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoImagem`
--

DROP TABLE IF EXISTS `produtoImagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtoImagem` (
  `idProdutoImagem` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProduto` bigint(20) DEFAULT NULL,
  `imagem` longblob,
  PRIMARY KEY (`idProdutoImagem`),
  UNIQUE KEY `idProdutoImagem_UNIQUE` (`idProdutoImagem`),
  KEY `FK11r1o42nfu2rp3nal5m6ud6sj` (`idProduto`),
  CONSTRAINT `FK11r1o42nfu2rp3nal5m6ud6sj` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoImagem`
--

LOCK TABLES `produtoImagem` WRITE;
/*!40000 ALTER TABLE `produtoImagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtoImagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retirada`
--

DROP TABLE IF EXISTS `retirada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retirada` (
  `idRetirada` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCaixa` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`idRetirada`),
  UNIQUE KEY `idRetirada_UNIQUE` (`idRetirada`),
  KEY `FK1ae050xs5eoqkdlmwc62rk3xo` (`idCaixa`),
  CONSTRAINT `FK1ae050xs5eoqkdlmwc62rk3xo` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retirada`
--

LOCK TABLES `retirada` WRITE;
/*!40000 ALTER TABLE `retirada` DISABLE KEYS */;
INSERT INTO `retirada` VALUES (1,5,'Compras (Mercado)','2018-02-12',61.68),(2,1,'Lanche(30), Açai(20),Janta(49),Lavagem do Carro(50)','2018-02-19',149.00),(3,5,'Pagamento 2° parcela Fotos do Casamento (Johnny)','2018-02-23',550.00),(4,1,'Gasolina para trazer o Civic de Tres Lagoas','2018-02-26',150.00),(5,7,'Pagamento 1º Cheque (Iphone 8 PLUS) da Luana','2018-02-28',608.00),(6,7,'190,00 (2 Red Label e 1 Black Label) Pagos por Thiago Araujo Berbet','2018-03-05',190.00),(7,7,'Pagamento Final dos Convites de Casamento para os Padrinhos','2018-03-06',665.00),(8,7,'Pagamento à Luana (Valor Emprestado a ImportCG)','2018-03-07',547.00),(9,6,'Pagamento do Consorcio Itau','2018-03-12',763.98),(10,8,'Pagamento Semestral das Aulas de Dança (300,00 tirados dos 800,00 Aplicados, restando agora 500,00)','2018-03-09',300.00),(11,7,'2 Whisky\'s para o Casamento','2018-03-17',97.24),(12,7,'Pagamento Parcela de Março do Carro','2018-03-23',1056.00),(13,7,'Pagamento 3° parcela Fotos do Casamento (Johnny)','2018-03-28',550.00),(14,7,'3º Parcela do IPVA do CIVIC','2018-03-28',407.46),(15,7,'2 Whisky\'s para o Casamento','2018-03-31',97.24),(16,7,'Parte do pagamento (Cabine de Fotos e Sol Maior)','2018-04-04',152.50),(17,7,'Referente ao 2º cheque de 833,33  (Entrada 1649,00 + 3x 833,33) do Iphone da Luana','2018-04-06',450.00);
/*!40000 ALTER TABLE `retirada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeline`
--

DROP TABLE IF EXISTS `timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeline` (
  `idTimeline` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `tipoMsg` varchar(20) NOT NULL,
  `icone` varchar(200) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(4000) NOT NULL,
  `dataHora` datetime NOT NULL,
  PRIMARY KEY (`idTimeline`),
  UNIQUE KEY `idTimeline_UNIQUE` (`idTimeline`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeline`
--

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;
INSERT INTO `timeline` VALUES (1,'CADASTROPRODUTO','SIMPLES','fa fa-tv bg-yellow','Novo Produto!','Video Game | Sony | Playstation 4 Slim 1Tera (3 Jogos) foi adicionado ao catálogo de produtos.','2018-04-09 13:09:58'),(2,'COMPRA','DUPLA','fa fa-cart-plus bg-green','Novos Produtos!','Compra realizada dia 09/04/2018 em Pedro Juan Caballero, somando a quantidade de 2 item(s) e o valor total de R$ 3556.46.','2018-04-09 13:57:45');
/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite`
--

DROP TABLE IF EXISTS `tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramite` (
  `idTramite` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCaixa` bigint(20) NOT NULL,
  `operacao` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idTramite`),
  UNIQUE KEY `idTramite_UNIQUE` (`idTramite`),
  KEY `FKwenqm1061y3eq8n296w73njr` (`idCaixa`),
  CONSTRAINT `FKwenqm1061y3eq8n296w73njr` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite`
--

LOCK TABLES `tramite` WRITE;
/*!40000 ALTER TABLE `tramite` DISABLE KEYS */;
INSERT INTO `tramite` VALUES (7,3,'CREDITO','2017-09-19',130.28,NULL),(8,4,'DEBITO','2017-09-19',130.28,NULL),(9,1,'CREDITO','2017-09-19',130.28,NULL),(10,3,'DEBITO','2017-09-19',130.28,NULL),(11,1,'CREDITO','2017-09-27',300.00,NULL),(12,2,'DEBITO','2017-09-27',300.00,NULL),(13,3,'CREDITO','2017-10-01',122.74,NULL),(14,4,'DEBITO','2017-10-01',122.74,NULL),(15,1,'CREDITO','2017-10-02',2285.00,NULL),(16,2,'DEBITO','2017-10-02',2285.00,NULL),(17,1,'CREDITO','2017-10-02',120.00,NULL),(18,1,'CREDITO','2017-10-03',122.74,NULL),(19,3,'DEBITO','2017-10-03',122.74,NULL),(20,1,'CREDITO','2017-10-03',200.00,NULL),(22,1,'CREDITO','2017-10-07',275.00,''),(23,2,'DEBITO','2017-10-07',275.00,''),(24,1,'CREDITO','2017-10-07',175.00,'100,00 Flip4 (Tati); 55,00 Carregador Portátil 5600mAh (Camila); 20,00 Dois Desodorante Dove (Luana);'),(25,2,'DEBITO','2017-10-09',1500.00,'Devolução para o Paulinho'),(26,1,'CREDITO','2017-10-09',100.00,'Tramite entre contas'),(27,2,'DEBITO','2017-10-09',100.00,'Tramite entre contas'),(28,2,'CREDITO','2017-10-10',110.00,'Pagamento Daniele'),(29,1,'CREDITO','2017-10-10',130.00,''),(30,2,'DEBITO','2017-10-10',130.00,''),(31,2,'CREDITO','2017-10-11',90.00,'Creme e Perfume (Camila)'),(32,1,'CREDITO','2017-10-12',1590.00,''),(33,2,'DEBITO','2017-10-12',1590.00,''),(34,1,'CREDITO','2017-10-14',150.00,''),(35,2,'DEBITO','2017-10-14',150.00,''),(36,1,'CREDITO','2017-10-16',275.00,''),(37,2,'DEBITO','2017-10-16',275.00,''),(38,1,'CREDITO','2017-10-17',160.00,'60,00 Isabel; 70,00 Perfume Tommy; 10,00 Relogio da Jeniffer; 20,00 Creme pago de Ponta Porã'),(39,2,'CREDITO','2017-10-18',60.00,'Segunda e ultima parcela do Relogio Curren (Jaime)'),(40,5,'CREDITO','2017-10-19',2400.00,'Deposito para compra do IPAD Pro 64GB'),(41,1,'CREDITO','2017-10-22',190.00,''),(42,2,'DEBITO','2017-10-22',190.00,''),(43,1,'CREDITO','2017-10-22',1463.35,''),(44,3,'DEBITO','2017-10-22',1463.35,''),(45,1,'DEBITO','2017-10-22',2400.00,'Retirada do dinheiro colocado para compra do IPAD Pro 64GB'),(46,2,'CREDITO','2017-10-26',60.00,'60,00 Relogio da Dri'),(47,1,'CREDITO','2017-10-28',110.00,''),(48,2,'DEBITO','2017-10-28',110.00,''),(49,2,'CREDITO','2017-10-28',100.00,'Pagamento Tati (JBL FLIP4)'),(50,1,'CREDITO','2017-11-01',150.00,''),(51,2,'DEBITO','2017-11-01',150.00,''),(52,1,'CREDITO','2017-11-01',2550.00,'Entrada para compra de Iphone 7 128GB'),(53,1,'CREDITO','2017-11-02',40.00,'40,00 (Juliana) Parte final da compras dos cremes Revlon'),(54,1,'CREDITO','2017-11-02',3000.00,''),(55,2,'DEBITO','2017-11-02',3000.00,''),(56,1,'DEBITO','2017-11-02',2550.00,'Devolução para o Thiago (2550,00) emprestados para compra do Iphone7 128GB'),(57,1,'CREDITO','2017-11-05',180.00,''),(58,2,'DEBITO','2017-11-05',180.00,''),(59,1,'CREDITO','2017-11-06',200.00,'Ultima parcela Agnaldo'),(60,2,'CREDITO','2017-11-06',130.00,'Pagamento Adriana (Relógio)'),(61,1,'CREDITO','2017-11-06',280.00,'Pagamento Jeanny (Creatina e Pulseira Inteligente Sky)'),(62,2,'DEBITO','2017-11-06',280.00,'Pagamento Jeanny (Creatina e Pulseira Inteligente Sky)'),(63,1,'CREDITO','2017-11-07',230.00,'1º Parcela Marção (Receptor)'),(64,1,'CREDITO','2017-11-07',100.00,''),(65,2,'DEBITO','2017-11-07',100.00,''),(66,2,'CREDITO','2017-11-07',65.00,'Pagamento Marlon (Relogio Curren)'),(67,1,'CREDITO','2017-11-07',142.51,''),(68,3,'DEBITO','2017-11-07',142.51,''),(69,1,'CREDITO','2017-11-07',375.00,''),(70,2,'DEBITO','2017-11-07',375.00,''),(71,1,'CREDITO','2017-11-07',1000.00,''),(72,2,'DEBITO','2017-11-07',1000.00,''),(73,2,'CREDITO','2017-11-08',90.00,'Pagamento final Camila (Creme e Perfume)'),(74,1,'DEBITO','2017-11-08',217.78,'Retirado para pagamento da parcela de novembro da casa de Floripa'),(75,1,'CREDITO','2017-11-08',200.00,''),(76,2,'DEBITO','2017-11-08',200.00,''),(77,5,'CREDITO','2017-11-09',2030.00,''),(78,2,'DEBITO','2017-11-09',2030.00,''),(79,2,'CREDITO','2017-11-10',80.00,'Pagamento final Patricia (Relogio Feminino Q&Q)'),(80,1,'CREDITO','2017-11-10',100.00,'Pagamento final Eric (Relogio Masculino Naviforce Khaki)'),(81,1,'CREDITO','2017-11-10',260.00,'Pagamento final Thays Araujo (2 Relogios Femininos)'),(82,2,'CREDITO','2017-11-10',120.00,'Pagamento final Ana Maria (Perfume Ferrari Black 125ml)'),(83,2,'CREDITO','2017-11-10',50.00,'Pagamento Ighor (Relógio Masculino Naviforce Gold)'),(84,1,'CREDITO','2017-11-11',400.00,''),(85,2,'DEBITO','2017-11-11',400.00,''),(86,1,'CREDITO','2017-11-13',112.00,''),(87,2,'DEBITO','2017-11-13',112.00,''),(88,3,'CREDITO','2017-11-14',1368.94,''),(89,4,'DEBITO','2017-11-14',1368.94,''),(90,6,'CREDITO','2017-11-14',2030.00,''),(91,5,'DEBITO','2017-11-14',2030.00,''),(92,7,'CREDITO','2017-11-14',2697.33,''),(93,1,'DEBITO','2017-11-14',2697.33,''),(94,7,'CREDITO','2017-11-14',1368.94,''),(95,3,'DEBITO','2017-11-14',1368.94,''),(96,2,'CREDITO','2017-11-14',170.00,'Pagamento final Tati (JBL Flip4)'),(97,2,'CREDITO','2017-11-14',50.00,'Pagamento Bete (Creme Victoria\'s Secret)'),(98,7,'CREDITO','2017-11-16',220.00,''),(99,2,'DEBITO','2017-11-16',220.00,''),(100,7,'CREDITO','2017-11-16',1321.74,''),(101,3,'DEBITO','2017-11-16',1321.74,''),(102,7,'DEBITO','2017-11-21',1000.00,''),(103,7,'CREDITO','2017-11-22',120.00,''),(104,1,'DEBITO','2017-11-22',120.00,''),(105,2,'CREDITO','2017-11-21',100.00,'Pagamento final Aline Cerialli (Carregador Portátil)'),(106,1,'CREDITO','2017-11-22',260.00,''),(107,2,'DEBITO','2017-11-22',260.00,''),(108,1,'CREDITO','2017-11-24',205.00,''),(109,2,'DEBITO','2017-11-24',205.00,''),(110,1,'CREDITO','2017-11-24',2000.00,''),(111,6,'DEBITO','2017-11-24',2000.00,''),(112,7,'CREDITO','2017-11-27',390.00,''),(113,2,'DEBITO','2017-11-27',390.00,''),(114,7,'CREDITO','2017-11-27',294.92,''),(115,1,'DEBITO','2017-11-27',294.92,''),(116,6,'CREDITO','2017-11-29',2100.00,''),(117,2,'DEBITO','2017-11-29',2100.00,''),(118,7,'CREDITO','2017-11-30',200.00,''),(119,2,'DEBITO','2017-11-30',200.00,''),(120,7,'CREDITO','2017-11-30',125.00,''),(121,2,'DEBITO','2017-11-30',125.00,''),(122,7,'CREDITO','2017-12-02',1120.00,''),(123,2,'DEBITO','2017-12-02',1120.00,''),(124,7,'DEBITO','2017-12-02',681.00,'Devolução ao Paulinho da part final'),(125,7,'CREDITO','2017-12-02',60.00,''),(126,2,'DEBITO','2017-12-02',60.00,''),(127,7,'CREDITO','2017-12-04',450.00,''),(128,1,'DEBITO','2017-12-04',450.00,''),(129,7,'CREDITO','2017-12-04',530.00,''),(130,2,'DEBITO','2017-12-04',530.00,''),(131,6,'CREDITO','2017-12-04',1150.00,''),(132,7,'DEBITO','2017-12-04',1150.00,''),(133,1,'CREDITO','2017-12-04',150.00,''),(134,2,'DEBITO','2017-12-04',150.00,''),(135,6,'CREDITO','2017-12-04',1000.00,''),(136,2,'DEBITO','2017-12-04',1000.00,''),(137,7,'CREDITO','2017-12-06',90.00,''),(138,2,'DEBITO','2017-12-06',90.00,''),(139,2,'DEBITO','2017-12-07',75.00,''),(140,7,'CREDITO','2017-12-08',150.00,''),(141,1,'DEBITO','2017-12-08',150.00,''),(142,7,'CREDITO','2017-12-08',850.00,''),(143,2,'DEBITO','2017-12-08',850.00,''),(144,7,'DEBITO','2017-12-08',287.19,'Despesas'),(145,1,'CREDITO','2017-12-09',390.00,''),(146,2,'DEBITO','2017-12-09',390.00,''),(147,1,'CREDITO','2017-12-10',100.00,'Pagamento final Ighor (Relogio Naviforce)'),(148,1,'CREDITO','2017-12-10',150.00,''),(149,2,'DEBITO','2017-12-10',150.00,''),(150,7,'CREDITO','2017-12-11',302.11,''),(151,3,'DEBITO','2017-12-11',302.11,''),(152,7,'CREDITO','2017-12-11',640.00,''),(153,1,'DEBITO','2017-12-11',640.00,''),(154,1,'CREDITO','2017-12-11',375.00,''),(155,2,'DEBITO','2017-12-11',375.00,''),(156,7,'CREDITO','2017-12-12',375.00,''),(157,1,'DEBITO','2017-12-12',375.00,''),(158,7,'CREDITO','2017-12-13',151.06,''),(159,3,'DEBITO','2017-12-13',151.06,''),(160,2,'CREDITO','2017-12-13',120.00,'Pagamento final Thays Araujo (Chromecast 2)'),(161,1,'CREDITO','2017-12-13',720.00,''),(162,2,'DEBITO','2017-12-13',720.00,''),(163,2,'CREDITO','2017-12-14',50.00,'Pagamento final Bete (Creme Victorias Secret + 2 Desodorantes)'),(164,1,'CREDITO','2017-12-14',3000.00,'Saque para compra de produtos'),(165,6,'DEBITO','2017-12-14',3000.00,'Saque para compra de produtos'),(166,1,'DEBITO','2017-12-14',20.00,''),(167,6,'CREDITO','2017-12-15',280.00,''),(168,1,'DEBITO','2017-12-15',280.00,''),(169,1,'CREDITO','2017-12-15',20.00,''),(170,1,'DEBITO','2017-12-15',40.00,''),(171,1,'CREDITO','2017-12-15',650.00,''),(172,1,'CREDITO','2017-12-16',2825.94,''),(173,7,'DEBITO','2017-12-16',2825.94,''),(174,1,'CREDITO','2017-12-16',150.00,''),(175,2,'DEBITO','2017-12-16',150.00,''),(176,1,'CREDITO','2017-12-16',520.00,''),(177,2,'DEBITO','2017-12-16',520.00,''),(178,1,'CREDITO','2017-12-16',90.00,''),(179,6,'DEBITO','2017-12-16',90.00,''),(180,1,'CREDITO','2017-12-16',1262.00,'Compra Iphone 7 32 GB (Cláudia)'),(181,5,'CREDITO','2017-12-18',2400.00,''),(182,2,'DEBITO','2017-12-18',2400.00,''),(183,5,'DEBITO','2017-12-18',1262.00,'Devolução a Luana (Iphone 7 32 GB da Cláudia)'),(184,1,'CREDITO','2017-12-18',1138.00,''),(185,5,'DEBITO','2017-12-18',1138.00,''),(186,7,'CREDITO','2017-12-18',3993.31,''),(187,1,'DEBITO','2017-12-18',3993.31,''),(188,7,'CREDITO','2017-12-18',300.00,''),(189,1,'DEBITO','2017-12-18',300.00,''),(190,7,'CREDITO','2017-12-18',350.00,''),(191,2,'DEBITO','2017-12-18',350.00,''),(192,1,'CREDITO','2017-12-15',70.00,''),(193,2,'DEBITO','2017-12-15',70.00,''),(194,7,'CREDITO','2017-12-19',1470.00,''),(195,6,'DEBITO','2017-12-19',1470.00,''),(196,7,'CREDITO','2017-12-19',460.00,''),(197,1,'DEBITO','2017-12-19',460.00,''),(198,1,'CREDITO','2017-12-19',100.00,''),(199,2,'DEBITO','2017-12-19',100.00,''),(200,7,'CREDITO','2017-12-20',100.00,''),(201,1,'DEBITO','2017-12-20',100.00,''),(202,7,'CREDITO','2017-12-20',1100.00,''),(203,2,'DEBITO','2017-12-20',1100.00,''),(204,7,'DEBITO','2017-12-20',200.35,''),(205,7,'CREDITO','2017-12-21',27.00,''),(206,7,'CREDITO','2017-12-21',2973.91,''),(207,3,'DEBITO','2017-12-21',2973.91,''),(208,2,'DEBITO','2017-12-21',70.00,''),(209,6,'CREDITO','2017-12-21',4173.91,''),(210,7,'DEBITO','2017-12-21',4173.91,''),(211,7,'CREDITO','2017-12-21',160.00,''),(212,2,'DEBITO','2017-12-21',160.00,''),(213,7,'CREDITO','2018-01-08',142.51,''),(214,3,'DEBITO','2018-01-08',142.51,''),(215,7,'CREDITO','2018-01-08',130.00,''),(216,1,'DEBITO','2018-01-08',130.00,''),(217,7,'CREDITO','2018-01-08',4711.00,''),(218,2,'DEBITO','2018-01-08',4711.00,''),(219,7,'CREDITO','2018-01-08',4173.91,''),(220,6,'DEBITO','2018-01-08',4173.91,''),(221,2,'CREDITO','2018-01-08',430.00,''),(222,7,'DEBITO','2018-01-08',430.00,''),(223,7,'DEBITO','2017-12-27',2000.00,'Retirada de Ferias (Florianopolis)'),(224,2,'DEBITO','2018-01-10',65.00,''),(225,7,'CREDITO','2018-01-10',170.00,''),(226,2,'DEBITO','2018-01-10',170.00,''),(227,7,'CREDITO','2018-01-10',80.00,''),(228,2,'DEBITO','2018-01-10',80.00,''),(229,7,'CREDITO','2018-01-10',400.00,''),(230,1,'DEBITO','2018-01-10',400.00,''),(231,7,'CREDITO','2018-01-10',1680.00,''),(232,2,'DEBITO','2018-01-10',1680.00,''),(233,7,'CREDITO','2018-01-12',440.00,''),(234,1,'DEBITO','2018-01-12',440.00,''),(235,7,'CREDITO','2018-01-12',150.00,''),(236,2,'DEBITO','2018-01-12',150.00,''),(237,7,'DEBITO','2018-01-19',1469.14,''),(238,1,'CREDITO','2018-01-26',60.00,''),(239,2,'DEBITO','2018-01-26',60.00,''),(240,1,'CREDITO','2018-01-26',30.00,'Pagamento Cida (Tapete)'),(241,2,'CREDITO','2018-01-26',90.00,'Pagamento final Thays Araujo (Chromecast 2)'),(242,5,'DEBITO','2018-01-25',550.00,'Retirado para pagamento da 1ª parcela das Fotos (Johnny)'),(243,5,'CREDITO','2018-01-30',500.00,''),(244,1,'DEBITO','2018-01-30',500.00,''),(245,5,'CREDITO','2018-01-30',90.00,''),(246,2,'DEBITO','2018-01-30',90.00,''),(247,5,'CREDITO','2018-01-30',21.27,''),(248,7,'DEBITO','2018-01-30',21.27,''),(249,5,'DEBITO','2018-01-30',886.27,''),(250,5,'CREDITO','2018-02-06',1793.79,''),(251,3,'DEBITO','2018-02-06',1793.79,''),(252,1,'CREDITO','2018-02-03',150.00,''),(253,2,'DEBITO','2018-02-03',150.00,''),(254,1,'CREDITO','2018-02-03',175.00,''),(255,7,'DEBITO','2018-02-03',175.00,''),(256,7,'CREDITO','2018-02-06',307.88,''),(257,1,'DEBITO','2018-02-06',307.88,''),(258,2,'CREDITO','2018-02-06',210.00,''),(259,7,'DEBITO','2018-02-06',210.00,''),(260,1,'CREDITO','2018-02-07',250.00,''),(261,2,'DEBITO','2018-02-07',250.00,''),(262,1,'CREDITO','2018-02-09',270.00,''),(263,2,'DEBITO','2018-02-09',270.00,''),(264,5,'CREDITO','2018-02-09',770.00,''),(265,1,'DEBITO','2018-02-09',770.00,''),(266,5,'CREDITO','2018-02-09',254.90,''),(267,3,'DEBITO','2018-02-09',254.90,''),(268,8,'CREDITO','2018-02-09',270.00,''),(269,1,'DEBITO','2018-02-09',270.00,''),(270,1,'CREDITO','2018-02-10',250.00,''),(271,2,'DEBITO','2018-02-10',250.00,''),(272,5,'CREDITO','2018-02-14',1108.66,''),(273,1,'DEBITO','2018-02-14',1108.66,''),(274,7,'CREDITO','2018-02-14',4000.00,''),(275,5,'DEBITO','2018-02-14',4000.00,''),(276,7,'CREDITO','2018-02-15',1000.00,''),(277,5,'DEBITO','2018-02-15',1000.00,''),(278,1,'CREDITO','2018-02-17',110.00,''),(279,2,'DEBITO','2018-02-17',110.00,''),(280,1,'CREDITO','2018-02-16',2500.00,''),(281,5,'DEBITO','2018-02-16',2500.00,''),(282,7,'CREDITO','2018-02-19',2218.63,''),(283,3,'DEBITO','2018-02-19',2218.63,''),(284,1,'CREDITO','2018-02-20',270.00,''),(285,2,'DEBITO','2018-02-20',270.00,''),(286,7,'CREDITO','2018-02-21',420.00,''),(287,1,'DEBITO','2018-02-21',420.00,''),(288,7,'CREDITO','2018-02-27',1079.02,''),(289,5,'DEBITO','2018-02-27',1079.02,''),(290,7,'CREDITO','2018-02-28',1000.00,''),(291,5,'DEBITO','2018-02-28',1000.00,''),(292,5,'CREDITO','2018-03-03',190.00,''),(293,2,'DEBITO','2018-03-03',190.00,''),(294,2,'CREDITO','2018-03-04',100.00,'Despesas com Frete de Produtos e Sacolas'),(295,1,'DEBITO','2018-03-04',100.00,'Despesas com Frete de Produtos e Sacolas'),(296,7,'CREDITO','2018-03-07',1005.00,''),(297,8,'DEBITO','2018-03-07',1005.00,''),(298,5,'CREDITO','2018-03-07',1100.00,''),(299,1,'DEBITO','2018-03-07',1100.00,''),(300,7,'CREDITO','2018-03-08',4377.23,''),(301,5,'DEBITO','2018-03-08',4377.23,''),(302,1,'CREDITO','2018-03-08',70.00,''),(303,2,'DEBITO','2018-03-08',70.00,''),(304,6,'CREDITO','2018-03-12',590.00,''),(305,1,'DEBITO','2018-03-12',590.00,''),(306,1,'CREDITO','2018-03-13',706.66,''),(307,2,'DEBITO','2018-03-13',706.66,''),(308,6,'CREDITO','2018-03-14',911.66,''),(309,1,'DEBITO','2018-03-14',911.66,''),(310,7,'CREDITO','2018-03-14',1687.68,''),(311,6,'DEBITO','2018-03-14',1687.68,''),(312,7,'CREDITO','2018-03-14',1105.31,''),(313,3,'DEBITO','2018-03-14',1105.31,''),(314,7,'CREDITO','2018-03-15',1635.00,''),(315,8,'DEBITO','2018-03-15',1635.00,''),(316,1,'CREDITO','2018-03-16',235.00,''),(317,2,'DEBITO','2018-03-16',235.00,''),(318,1,'CREDITO','2018-03-16',200.00,''),(319,2,'DEBITO','2018-03-16',200.00,''),(320,7,'CREDITO','2018-03-16',885.00,''),(321,1,'DEBITO','2018-03-16',885.00,''),(322,5,'CREDITO','2018-03-20',236.02,''),(323,3,'DEBITO','2018-03-20',236.02,''),(324,1,'CREDITO','2018-03-21',85.00,''),(325,8,'DEBITO','2018-03-21',85.00,''),(326,5,'CREDITO','2018-03-21',1000.00,''),(327,1,'DEBITO','2018-03-21',1000.00,''),(328,7,'CREDITO','2018-03-21',1286.02,''),(329,5,'DEBITO','2018-03-21',1286.02,''),(330,1,'CREDITO','2018-03-26',60.00,''),(331,2,'DEBITO','2018-03-26',60.00,''),(332,1,'CREDITO','2018-03-30',1000.00,''),(333,7,'DEBITO','2018-03-30',1000.00,''),(334,7,'CREDITO','2018-04-04',1860.00,''),(335,8,'DEBITO','2018-04-04',1860.00,''),(336,7,'CREDITO','2018-04-05',400.00,''),(337,8,'DEBITO','2018-04-05',400.00,''),(338,1,'CREDITO','2018-04-07',575.00,''),(339,2,'DEBITO','2018-04-07',575.00,''),(340,7,'CREDITO','2018-04-09',2973.91,''),(341,3,'DEBITO','2018-04-09',2973.91,''),(342,7,'CREDITO','2018-04-09',2100.00,''),(343,1,'DEBITO','2018-04-09',2100.00,'');
/*!40000 ALTER TABLE `tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `caminhoImagem` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `UK_pm3f4m4fqv89oeeeac4tbe2f4` (`login`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Thiago Araujo Berbet','thiago','123456','ADMIN','https://graph.facebook.com/100001106088226/picture?type=large'),(2,'Luana Alves Teixeira','luana','123456','ADMIN','https://graph.facebook.com/100006117338969/picture?type=large');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `idVenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCliente` bigint(20) NOT NULL,
  `idFuncionario` bigint(20) NOT NULL,
  `dataVenda` date NOT NULL,
  `valorTotal` decimal(19,2) DEFAULT NULL,
  `quantidadeTotal` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  UNIQUE KEY `idVenda_UNIQUE` (`idVenda`),
  KEY `FK6eyxfbxmeg9tn95pob30peuev` (`idCliente`),
  KEY `FK2l1gbv70y170sammw1guliyj8` (`idFuncionario`),
  CONSTRAINT `FK2l1gbv70y170sammw1guliyj8` FOREIGN KEY (`idFuncionario`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `FK6eyxfbxmeg9tn95pob30peuev` FOREIGN KEY (`idCliente`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (25,7,4,'2017-09-08',160.00,1,'VENDACONCLUIDA'),(26,8,4,'2017-09-09',160.00,1,'VENDACONCLUIDA'),(27,9,4,'2017-09-07',900.00,2,'VENDACONCLUIDA'),(29,10,4,'2017-09-07',450.00,1,'VENDACONCLUIDA'),(30,11,4,'2017-09-07',140.00,1,'VENDACONCLUIDA'),(31,12,4,'2017-09-07',160.00,1,'VENDACONCLUIDA'),(32,13,4,'2017-09-07',3200.00,1,'VENDACONCLUIDA'),(33,14,4,'2017-09-23',200.00,1,'VENDACONCLUIDA'),(34,15,4,'2017-09-23',1500.00,2,'VENDACONCLUIDA'),(35,16,3,'2017-09-23',410.00,1,'VENDACONCLUIDA'),(36,17,4,'2017-09-26',400.00,1,'VENDACONCLUIDA'),(37,18,4,'2017-09-23',130.00,1,'VENDACONCLUIDA'),(38,19,4,'2017-09-28',175.00,1,'VENDACONCLUIDA'),(39,20,4,'2017-09-23',150.00,1,'VENDACONCLUIDA'),(40,21,4,'2017-09-23',410.00,1,'VENDACONCLUIDA'),(41,22,4,'2017-10-04',150.00,2,'VENDACONCLUIDA'),(42,24,4,'2017-10-12',4050.00,1,'VENDACONCLUIDA'),(43,25,4,'2017-10-14',150.00,1,'VENDACONCLUIDA'),(44,26,4,'2017-10-16',275.00,5,'VENDACONCLUIDA'),(45,27,4,'2017-10-18',80.00,1,'VENDACONCLUIDA'),(46,28,4,'2017-10-21',190.00,1,'VENDACONCLUIDA'),(47,29,4,'2017-10-21',150.00,1,'VENDACONCLUIDA'),(48,17,4,'2017-10-21',160.00,1,'VENDACONCLUIDA'),(49,26,3,'2017-10-20',3150.00,1,'VENDACONCLUIDA'),(50,23,4,'2017-11-02',3000.00,3,'VENDACONCLUIDA'),(51,30,3,'2017-11-03',150.00,1,'VENDACONCLUIDA'),(52,31,4,'2017-11-06',30.00,1,'VENDACONCLUIDA'),(53,32,4,'2017-11-06',280.00,2,'VENDACONCLUIDA'),(54,13,4,'2017-11-07',3400.00,1,'VENDACONCLUIDA'),(55,34,4,'2017-11-07',350.00,2,'VENDACONCLUIDA'),(56,33,4,'2017-11-07',1100.00,3,'VENDACONCLUIDA'),(57,35,4,'2017-11-07',120.00,1,'VENDACONCLUIDA'),(58,36,4,'2017-11-07',160.00,1,'VENDACONCLUIDA'),(59,37,4,'2017-11-08',180.00,1,'VENDACONCLUIDA'),(60,7,4,'2017-11-10',70.00,1,'VENDACONCLUIDA'),(61,39,4,'2017-11-13',1120.00,1,'PAGAMENTOPARCIAL'),(62,38,3,'2017-11-13',140.00,1,'VENDACONCLUIDA'),(63,7,4,'2017-11-13',2850.00,2,'VENDACONCLUIDA'),(64,40,4,'2017-11-13',6849.99,1,'VENDACONCLUIDA'),(65,41,4,'2017-11-13',160.00,1,'VENDACONCLUIDA'),(66,20,4,'2017-11-13',300.00,2,'VENDACONCLUIDA'),(67,42,3,'2017-11-18',120.00,1,'VENDACONCLUIDA'),(68,43,4,'2017-11-19',70.00,1,'VENDACONCLUIDA'),(69,44,4,'2017-11-19',100.00,1,'VENDACONCLUIDA'),(70,7,4,'2017-11-12',470.00,1,'VENDACONCLUIDA'),(71,45,4,'2017-11-19',195.00,2,'VENDACONCLUIDA'),(72,46,4,'2017-11-02',0.00,1,'VENDACONCLUIDA'),(73,33,4,'2017-11-11',60.00,2,'VENDACONCLUIDA'),(74,47,4,'2017-11-24',150.00,1,'VENDACONCLUIDA'),(75,48,4,'2017-11-26',100.00,1,'VENDACONCLUIDA'),(76,49,4,'2017-11-26',120.00,1,'VENDACONCLUIDA'),(77,50,4,'2017-11-27',170.00,2,'VENDACONCLUIDA'),(78,51,4,'2017-11-27',160.00,2,'VENDACONCLUIDA'),(79,52,4,'2017-11-27',70.00,1,'VENDACONCLUIDA'),(80,35,4,'2017-11-27',120.00,1,'VENDACONCLUIDA'),(81,53,4,'2017-11-27',170.00,2,'VENDACONCLUIDA'),(82,54,4,'2017-11-27',150.00,1,'VENDACONCLUIDA'),(83,55,4,'2017-11-29',50.00,1,'VENDACONCLUIDA'),(84,24,4,'2017-11-27',1200.00,1,'VENDACONCLUIDA'),(85,111,4,'2017-11-30',125.00,1,'VENDACONCLUIDA'),(86,56,4,'2017-11-30',120.00,1,'VENDACONCLUIDA'),(87,58,4,'2017-11-30',60.00,1,'VENDACONCLUIDA'),(88,59,4,'2017-11-30',35.00,1,'VENDACONCLUIDA'),(89,61,4,'2017-12-02',60.00,2,'VENDACONCLUIDA'),(90,62,3,'2017-11-25',450.00,1,'VENDACONCLUIDA'),(91,63,4,'2017-12-04',150.00,1,'VENDACONCLUIDA'),(92,64,4,'2017-12-04',410.00,1,'VENDACONCLUIDA'),(93,65,4,'2017-12-09',390.00,1,'VENDACONCLUIDA'),(94,49,4,'2017-12-09',320.00,1,'VENDACONCLUIDA'),(95,24,4,'2017-12-11',5600.00,1,'VENDACONCLUIDA'),(96,66,4,'2017-12-11',1250.00,1,'PAGAMENTOPARCIAL'),(97,9,4,'2017-12-12',200.00,1,'VENDACONCLUIDA'),(99,67,4,'2017-12-15',30.00,1,'VENDACONCLUIDA'),(100,68,4,'2017-12-18',2400.00,1,'VENDACONCLUIDA'),(101,62,3,'2017-12-18',600.00,1,'VENDACONCLUIDA'),(102,24,4,'2017-12-18',1400.00,1,'VENDACONCLUIDA'),(103,69,3,'2017-12-18',150.00,1,'VENDACONCLUIDA'),(104,17,4,'2017-12-15',70.00,1,'VENDACONCLUIDA'),(105,70,3,'2017-12-18',130.00,1,'VENDACONCLUIDA'),(106,71,3,'2017-12-18',280.00,1,'VENDACONCLUIDA'),(107,20,4,'2017-12-18',130.00,2,'VENDACONCLUIDA'),(108,68,4,'2017-12-18',30.00,1,'VENDACONCLUIDA'),(109,22,4,'2017-12-18',65.00,1,'VENDACONCLUIDA'),(110,72,3,'2017-12-18',240.00,2,'VENDACONCLUIDA'),(111,73,4,'2017-12-19',4073.91,1,'VENDACONCLUIDA'),(112,74,4,'2017-12-19',70.00,2,'VENDACONCLUIDA'),(113,75,4,'2017-12-21',3850.00,1,'VENDACONCLUIDA'),(114,76,4,'2017-12-24',150.00,1,'VENDACONCLUIDA'),(115,52,4,'2017-12-27',120.00,1,'VENDACONCLUIDA'),(116,77,4,'2017-12-24',65.00,1,'VENDACONCLUIDA'),(117,33,4,'2017-12-24',38.00,1,'VENDACONCLUIDA'),(118,78,4,'2017-12-27',50.00,1,'VENDACONCLUIDA'),(119,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(120,46,3,'2018-01-08',0.00,1,'VENDACONCLUIDA'),(121,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(122,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(123,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(124,47,4,'2018-01-10',150.00,1,'VENDACONCLUIDA'),(125,79,4,'2018-01-10',210.00,1,'VENDACONCLUIDA'),(126,20,4,'2018-01-10',190.00,1,'VENDACONCLUIDA'),(127,17,4,'2018-01-10',3900.00,1,'VENDACONCLUIDA'),(128,80,3,'2018-01-10',400.00,1,'VENDACONCLUIDA'),(131,51,33,'2018-01-10',455.00,4,'VENDACONCLUIDA'),(132,47,4,'2018-01-11',150.00,1,'VENDACONCLUIDA'),(133,40,4,'2018-01-22',1800.00,1,'VENDACONCLUIDA'),(134,81,4,'2018-01-22',60.00,2,'VENDACONCLUIDA'),(135,82,33,'2018-01-22',230.00,1,'VENDACONCLUIDA'),(136,6,4,'2018-01-22',210.00,1,'VENDACONCLUIDA'),(137,83,4,'2018-01-22',250.00,1,'VENDACONCLUIDA'),(138,80,3,'2018-01-22',810.00,1,'PAGAMENTOPARCIAL'),(139,84,3,'2018-01-23',130.00,1,'VENDACONCLUIDA'),(140,85,3,'2018-01-21',350.00,1,'VENDACONCLUIDA'),(141,22,3,'2018-01-21',200.00,1,'PAGAMENTOPARCIAL'),(142,86,3,'2018-01-23',130.00,1,'VENDACONCLUIDA'),(143,87,3,'2018-01-22',30.00,1,'VENDACONCLUIDA'),(144,88,4,'2018-01-23',120.00,1,'VENDACONCLUIDA'),(145,89,4,'2018-01-23',180.00,2,'VENDACONCLUIDA'),(146,31,4,'2018-01-24',95.00,1,'VENDACONCLUIDA'),(148,90,4,'2018-02-01',210.00,1,'VENDACONCLUIDA'),(149,74,4,'2018-02-01',150.00,1,'VENDACONCLUIDA'),(150,83,4,'2018-02-03',4700.00,1,'VENDACONCLUIDA'),(151,91,4,'2018-02-06',2600.00,1,'PAGAMENTOPARCIAL'),(152,92,4,'2018-02-06',120.00,1,'VENDACONCLUIDA'),(153,40,4,'2018-02-06',1500.00,2,'VENDACONCLUIDA'),(154,93,4,'2018-02-06',210.00,1,'VENDACONCLUIDA'),(155,94,4,'2018-02-06',180.00,2,'VENDACONCLUIDA'),(156,95,4,'2018-02-06',190.00,1,'VENDACONCLUIDA'),(157,96,4,'2018-02-04',130.00,1,'VENDACONCLUIDA'),(158,97,3,'2018-02-06',255.00,1,'VENDACONCLUIDA'),(159,98,3,'2018-02-06',1200.00,1,'PAGAMENTOPARCIAL'),(160,46,3,'2018-01-20',0.00,1,'VENDACONCLUIDA'),(161,46,3,'2018-01-20',0.00,1,'VENDACONCLUIDA'),(162,20,4,'2018-02-06',150.00,1,'VENDACONCLUIDA'),(163,99,4,'2018-02-06',60.00,1,'VENDACONCLUIDA'),(164,100,4,'2018-02-06',100.00,1,'VENDACONCLUIDA'),(165,101,4,'2018-02-06',350.00,1,'VENDACONCLUIDA'),(166,102,4,'2018-02-06',90.00,1,'VENDACONCLUIDA'),(167,34,4,'2018-02-06',0.00,1,'VENDACONCLUIDA'),(168,104,4,'2018-02-06',270.00,1,'VENDACONCLUIDA'),(169,38,4,'2018-02-07',320.00,2,'VENDACONCLUIDA'),(170,105,4,'2018-02-08',150.00,1,'VENDACONCLUIDA'),(171,85,3,'2018-02-10',130.00,1,'VENDACONCLUIDA'),(172,106,4,'2018-02-19',2600.00,0,'VENDACONCLUIDA'),(173,64,4,'2018-02-19',300.00,1,'VENDACONCLUIDA'),(174,51,4,'2018-02-19',120.00,1,'PAGAMENTOPARCIAL'),(175,107,4,'2018-02-19',130.00,1,'VENDACONCLUIDA'),(176,40,4,'2018-02-19',750.00,1,'VENDACONCLUIDA'),(177,79,4,'2018-02-19',320.00,1,'PAGAMENTOPARCIAL'),(178,85,3,'2018-02-19',280.00,1,'PAGAMENTOPARCIAL'),(179,85,3,'2018-02-19',150.00,1,'PAGAMENTOPARCIAL'),(180,85,3,'2018-02-19',70.00,1,'PAGAMENTOPARCIAL'),(181,108,3,'2018-02-19',1350.00,3,'PAGAMENTOPARCIAL'),(182,109,4,'2018-02-19',130.00,1,'VENDACONCLUIDA'),(183,110,4,'2018-02-19',230.00,1,'VENDACONCLUIDA'),(184,111,4,'2018-02-20',580.00,1,'VENDACONCLUIDA'),(185,112,3,'2018-02-20',150.00,1,'VENDACONCLUIDA'),(186,113,4,'2018-02-20',70.00,1,'VENDACONCLUIDA'),(187,114,4,'2018-02-22',150.00,1,'VENDACONCLUIDA'),(188,115,4,'2018-02-24',200.00,1,'VENDACONCLUIDA'),(189,7,4,'2018-02-25',65.00,2,'VENDACONCLUIDA'),(190,116,4,'2018-02-17',120.00,1,'VENDACONCLUIDA'),(191,117,4,'2018-02-28',5900.00,1,'VENDACONCLUIDA'),(192,118,33,'2018-02-28',120.00,1,'VENDACONCLUIDA'),(194,76,4,'2018-02-28',130.00,1,'PAGAMENTOPARCIAL'),(195,36,3,'2018-03-04',50.00,1,'VENDACONCLUIDA'),(196,46,3,'2018-03-05',0.00,1,'VENDACONCLUIDA'),(197,46,3,'2018-03-05',0.00,1,'VENDACONCLUIDA'),(198,119,4,'2018-03-05',1070.00,8,'VENDACONCLUIDA'),(199,120,4,'2018-03-05',85.00,1,'VENDACONCLUIDA'),(200,121,4,'2018-03-04',2800.00,1,'PAGAMENTOPARCIAL'),(201,122,33,'2018-03-06',320.00,1,'PAGAMENTOPARCIAL'),(202,51,4,'2018-03-06',185.00,2,'AGUARDANDOPAGAMENTO'),(203,85,3,'2018-03-10',130.00,1,'VENDACONCLUIDA'),(204,81,4,'2018-03-12',30.00,1,'VENDACONCLUIDA'),(205,46,3,'2018-03-08',0.00,1,'VENDACONCLUIDA'),(206,46,3,'2018-03-13',0.00,1,'VENDACONCLUIDA'),(207,123,3,'2018-03-13',1935.00,1,'VENDACONCLUIDA'),(208,111,4,'2018-03-13',2250.00,1,'PAGAMENTOPARCIAL'),(209,75,4,'2018-03-13',2000.00,1,'PAGAMENTOPARCIAL'),(210,112,4,'2018-03-13',150.00,1,'VENDACONCLUIDA'),(211,46,3,'2018-02-19',0.00,1,'VENDACONCLUIDA'),(212,46,3,'2018-02-19',0.00,1,'VENDACONCLUIDA'),(213,124,4,'2018-03-19',4500.00,1,'PAGAMENTOPARCIAL'),(214,85,3,'2018-03-19',70.00,1,'AGUARDANDOPAGAMENTO'),(215,85,3,'2018-03-19',70.00,1,'AGUARDANDOPAGAMENTO'),(216,85,3,'2018-03-19',30.00,1,'AGUARDANDOPAGAMENTO'),(217,85,3,'2018-03-19',140.00,1,'AGUARDANDOPAGAMENTO'),(218,125,3,'2018-03-19',250.00,1,'VENDACONCLUIDA'),(219,46,3,'2018-03-19',0.00,2,'VENDACONCLUIDA'),(220,16,3,'2018-03-19',85.00,1,'VENDACONCLUIDA'),(221,126,3,'2018-03-19',350.00,1,'VENDACONCLUIDA'),(222,127,4,'2018-03-20',150.00,1,'VENDACONCLUIDA'),(223,128,4,'2018-03-20',280.00,1,'PAGAMENTOPARCIAL'),(224,129,4,'2018-03-20',280.00,1,'AGUARDANDOPAGAMENTO'),(225,130,4,'2018-03-20',365.00,2,'PAGAMENTOPARCIAL'),(226,131,4,'2018-03-20',70.00,1,'AGUARDANDOPAGAMENTO'),(227,8,4,'2018-03-22',300.00,2,'VENDACONCLUIDA'),(228,46,3,'2018-03-26',0.00,1,'VENDACONCLUIDA'),(229,132,3,'2018-03-26',150.00,1,'AGUARDANDOPAGAMENTO'),(230,46,3,'2018-03-26',0.00,1,'VENDACONCLUIDA'),(231,74,4,'2018-03-26',120.00,1,'VENDACONCLUIDA'),(233,26,4,'2018-04-02',120.00,2,'VENDACONCLUIDA'),(236,85,3,'2018-04-02',70.00,1,'AGUARDANDOPAGAMENTO'),(237,85,3,'2018-04-02',70.00,1,'AGUARDANDOPAGAMENTO'),(238,85,3,'2018-04-02',70.00,1,'AGUARDANDOPAGAMENTO'),(239,85,3,'2018-04-02',50.00,1,'AGUARDANDOPAGAMENTO'),(240,85,3,'2018-04-02',190.00,1,'AGUARDANDOPAGAMENTO'),(241,85,3,'2018-04-02',350.00,1,'AGUARDANDOPAGAMENTO'),(242,32,4,'2018-04-01',350.00,2,'VENDACONCLUIDA'),(243,120,4,'2018-04-01',275.00,2,'PAGAMENTOPARCIAL'),(244,133,4,'2018-04-03',340.00,1,'PAGAMENTOPARCIAL'),(245,112,4,'2018-04-03',200.00,2,'AGUARDANDOPAGAMENTO'),(246,134,4,'2018-04-03',280.00,1,'AGUARDANDOPAGAMENTO'),(247,46,3,'2018-04-03',0.00,1,'VENDACONCLUIDA'),(248,46,3,'2018-04-03',0.00,1,'VENDACONCLUIDA'),(249,135,3,'2018-04-05',100.00,2,'VENDACONCLUIDA'),(250,138,4,'2018-04-06',3650.00,1,'VENDACONCLUIDA'),(251,51,4,'2018-04-07',200.00,2,'AGUARDANDOPAGAMENTO'),(252,51,4,'2018-04-09',1700.00,1,'PAGAMENTOPARCIAL');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-10 13:19:38
