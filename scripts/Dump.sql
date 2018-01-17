CREATE DATABASE  IF NOT EXISTS `importcg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `importcg`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: importcg
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
  `tipo` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  `idFechamento` bigint(20) DEFAULT NULL,
  `idTramite` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idItemFechamento`)
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
-- Table structure for table `baixa`
--

DROP TABLE IF EXISTS `baixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baixa` (
  `idBaixa` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) DEFAULT NULL,
  `valorTotal` decimal(9,2) NOT NULL DEFAULT '0.00',
  `dataCriacao` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idBaixa`),
  UNIQUE KEY `idBaixa_UNIQUE` (`idBaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baixa`
--

LOCK TABLES `baixa` WRITE;
/*!40000 ALTER TABLE `baixa` DISABLE KEYS */;
INSERT INTO `baixa` VALUES (1,'LanÃ§amento de despesas - Compra de Produtos (23/09/2017)',3100.70,'2017-09-27','BAIXATOTALMENTE'),(2,'LanÃ§amento de Despesas - Compra de Produtos (12/10/2017)',5516.61,'2017-10-13','BAIXATOTALMENTE'),(3,'LanÃ§amento de Despesas - Compra de Produtos (20/10/2017)',2400.00,'2017-10-20','BAIXATOTALMENTE'),(4,'LanÃ§amento de Despesas - Compra de Produtos (22/10/2017)',283.05,'2017-10-22','BAIXATOTALMENTE'),(5,'LanÃ§amento de despesas - Compra de Produtos (02/11/2017)',3807.97,'2017-11-02','BAIXATOTALMENTE'),(6,'Compra de sacolas (Central Embalagens)',32.70,'2017-10-13','BAIXATOTALMENTE'),(7,'500 CartÃµes de Visita (Printi)',25.64,'2017-10-27','BAIXATOTALMENTE'),(8,'LanÃ§amento de despesas - Compra de Produtos (06/11/2017)',2872.00,'2017-11-06','BAIXATOTALMENTE'),(9,'LanÃ§amento de despesas - Compra de Produtos (11/11/2017)',9977.81,'2017-11-13','BAIXATOTALMENTE'),(10,'Compra de sacolas (Central Embalagens)',44.65,'2017-11-13','BAIXATOTALMENTE'),(11,'LanÃ§amento de Despesas - Compra de Produtos (25/11/2017)',2170.08,'2017-11-27','BAIXATOTALMENTE'),(12,'LanÃ§amento de Despesas - Compra de Produtos (03/12/2017)',83.01,'2017-12-03','BAIXATOTALMENTE'),(13,'LanÃ§amento de Despesas - Compra de Produtos (11/12/2017)',5830.98,'2017-12-11','BAIXAPARCIALMENTE'),(14,'Troca dos 2(Dois) Pneus dianteiros + Balanceamento',340.00,'2017-12-12','BAIXATOTALMENTE'),(15,'Compra de sacolas (Central Embalagens)',50.00,'2017-12-14','BAIXATOTALMENTE'),(16,'LanÃ§amento de Despesas - Compra de Produtos (16/12/2017)',6019.63,'2017-12-18','BAIXATOTALMENTE'),(17,'LanÃ§amento de Despesas - Compra de Produtos (19/12/2017)',3312.96,'2017-12-19','BAIXATOTALMENTE'),(18,'LanÃ§amento de Despesas - Compra de Produtos (21/12/2017)',3347.96,'2017-12-21','BAIXATOTALMENTE'),(19,'Compras na China',364.78,'2018-01-08','BAIXATOTALMENTE'),(20,'Mensalidade Stim Social',29.96,'2018-01-08','BAIXATOTALMENTE'),(21,'LanÃ§amento de Despesas - Compra de Produtos (09/01/2018)',4789.49,'2018-01-10','BAIXAPARCIALMENTE');
/*!40000 ALTER TABLE `baixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `idCaixa` int(11) NOT NULL AUTO_INCREMENT,
  `idConta` int(11) NOT NULL,
  `valor` decimal(9,2) DEFAULT '0.00',
  PRIMARY KEY (`idCaixa`),
  UNIQUE KEY `idContaValor_UNIQUE` (`idCaixa`),
  KEY `FKem1qeomf7cfi9cmt3ofh1ne04` (`idConta`),
  CONSTRAINT `FKem1qeomf7cfi9cmt3ofh1ne04` FOREIGN KEY (`idConta`) REFERENCES `conta` (`idConta`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,6,0.00),(2,7,0.00),(3,4,0.00),(4,8,0.00),(5,1,0.00),(6,9,0.00),(7,2,3469.14);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogoInternacional`
--

DROP TABLE IF EXISTS `catalogoInternacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogoInternacional` (
  `idCatalogoInternacional` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `data` date NOT NULL,
  `cotacao` decimal(9,2) NOT NULL,
  `valorEmDolar` decimal(9,2) NOT NULL,
  `valorEmReal` decimal(9,2) NOT NULL,
  `idItemEntrada` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCatalogoInternacional`),
  UNIQUE KEY `idCatalogoInternacional_UNIQUE` (`idCatalogoInternacional`),
  KEY `FKbkk2fjqfm3tr4bv7ala0jcq9n` (`idFornecedor`),
  KEY `FKcg9wpjqhw2l2dpkb5bj0y1jh3` (`idProduto`),
  KEY `FKxmtseedf86cau3qthkv58uji` (`idItemEntrada`),
  CONSTRAINT `FKbkk2fjqfm3tr4bv7ala0jcq9n` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `FKcg9wpjqhw2l2dpkb5bj0y1jh3` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKxmtseedf86cau3qthkv58uji` FOREIGN KEY (`idItemEntrada`) REFERENCES `itemEntrada` (`idItemEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoInternacional`
--

LOCK TABLES `catalogoInternacional` WRITE;
/*!40000 ALTER TABLE `catalogoInternacional` DISABLE KEYS */;
INSERT INTO `catalogoInternacional` VALUES (1,6,1,'2017-09-07',3.28,21.00,68.88,NULL),(4,29,1,'2017-09-23',3.30,100.00,330.00,NULL),(5,24,1,'2017-09-23',3.30,18.50,61.05,NULL),(6,7,6,'2017-09-23',3.30,85.00,280.50,NULL),(7,30,5,'2017-09-23',3.30,185.00,610.50,NULL),(8,6,4,'2017-09-23',3.29,24.66,81.13,NULL),(9,31,2,'2017-09-23',3.29,7.60,25.00,NULL),(10,32,2,'2017-09-23',3.29,10.64,35.01,NULL),(11,33,2,'2017-09-23',3.29,10.64,35.01,NULL),(12,34,2,'2017-09-23',3.29,28.88,95.02,NULL),(13,13,3,'2017-09-23',3.28,24.39,80.00,NULL),(15,7,1,'2017-09-07',3.28,80.00,262.40,NULL),(16,11,1,'2017-09-07',3.28,41.00,134.48,NULL),(17,12,2,'2017-09-07',3.28,23.48,77.01,NULL),(18,13,3,'2017-09-07',3.28,24.39,80.00,NULL),(19,14,1,'2017-09-07',3.28,680.00,2230.40,NULL),(20,6,4,'2017-10-12',3.29,24.60,80.93,30),(21,7,1,'2017-10-12',3.32,88.00,292.16,31),(22,11,1,'2017-10-12',3.32,45.00,149.40,32),(23,35,5,'2017-10-12',3.32,7.00,23.24,33),(24,36,1,'2017-10-12',3.32,107.00,355.24,34),(25,37,1,'2017-10-12',3.32,36.00,119.52,35),(26,38,1,'2017-10-12',3.32,42.00,139.44,36),(27,39,1,'2017-10-12',3.32,10.95,36.35,37),(28,40,1,'2017-10-12',3.32,3.99,13.25,38),(29,41,7,'2017-10-12',3.30,30.00,99.00,39),(30,42,2,'2017-10-12',3.30,36.36,119.99,40),(31,43,2,'2017-10-12',3.30,22.73,75.01,41),(32,44,7,'2017-10-12',3.30,969.70,3200.01,42),(33,45,7,'2017-10-20',3.30,712.12,2350.00,43),(34,46,5,'2017-10-22',3.33,10.00,33.30,44),(35,47,5,'2017-10-22',3.33,10.00,33.30,45),(36,48,5,'2017-10-22',3.33,55.00,183.15,46),(37,6,4,'2017-11-02',3.28,24.30,79.70,47),(38,6,5,'2017-11-02',3.40,30.00,102.00,48),(39,19,5,'2017-11-02',3.40,19.20,65.28,49),(40,51,5,'2017-11-02',3.40,19.20,65.28,50),(41,52,5,'2017-11-02',3.40,19.20,65.28,51),(42,49,5,'2017-11-02',3.40,7.50,25.50,52),(43,50,5,'2017-11-02',3.40,6.50,22.10,53),(44,54,3,'2017-11-02',3.38,4.44,15.01,54),(45,53,5,'2017-11-02',3.40,4.00,13.60,55),(46,9,2,'2017-11-02',3.38,20.71,70.00,56),(47,55,2,'2017-11-02',3.38,20.71,70.00,57),(48,56,2,'2017-11-02',3.38,16.57,56.01,58),(49,57,2,'2017-11-02',3.38,11.24,37.99,59),(50,58,2,'2017-11-02',3.38,3.85,13.01,60),(51,22,2,'2017-11-02',3.38,6.81,23.02,61),(52,59,2,'2017-11-02',3.38,20.12,68.01,62),(53,28,7,'2017-11-02',3.38,754.44,2550.01,63),(54,37,1,'2017-11-02',3.40,36.00,122.40,64),(55,60,1,'2017-11-02',3.40,19.38,65.89,65),(56,61,8,'2017-11-02',3.38,4.44,15.01,66),(57,62,7,'2017-11-06',3.38,835.00,2822.30,67),(58,6,4,'2017-11-11',3.38,24.26,82.00,68),(59,53,3,'2017-11-11',3.38,2.96,10.00,69),(60,64,2,'2017-11-11',3.38,25.15,85.01,70),(61,9,4,'2017-11-11',3.38,19.82,66.99,71),(62,57,2,'2017-11-11',3.38,11.24,37.99,72),(63,58,2,'2017-11-11',3.38,3.85,13.01,73),(64,65,2,'2017-11-11',3.38,3.85,13.01,74),(65,14,7,'2017-11-11',3.40,655.00,2227.00,75),(66,63,7,'2017-11-11',3.40,1800.00,6120.00,76),(67,67,7,'2017-11-11',3.40,190.00,646.00,77),(68,61,8,'2017-11-11',3.38,4.44,15.01,78),(69,68,1,'2017-11-11',3.40,19.90,67.66,79),(70,60,1,'2017-11-11',3.40,21.50,73.10,80),(71,13,3,'2017-11-11',3.38,23.67,80.00,81),(72,69,2,'2017-11-25',3.38,54.73,184.99,82),(73,43,2,'2017-11-25',3.38,23.67,80.00,83),(74,71,2,'2017-11-25',3.38,5.33,18.02,84),(75,72,2,'2017-11-25',3.38,4.44,15.01,85),(76,73,2,'2017-11-25',3.38,8.88,30.01,86),(77,74,2,'2017-11-25',3.38,9.47,32.01,87),(78,59,2,'2017-11-25',3.38,20.12,68.01,88),(79,55,2,'2017-11-25',3.38,21.90,74.02,89),(80,58,2,'2017-11-25',3.38,3.85,13.01,90),(81,70,2,'2017-11-25',3.38,101.48,343.00,91),(82,75,7,'2017-11-25',3.40,250.00,850.00,92),(83,7,5,'2017-11-25',3.40,85.00,289.00,93),(84,43,2,'2017-12-03',3.38,24.56,83.01,94),(85,75,7,'2017-12-11',3.40,234.70,797.98,95),(86,76,7,'2017-12-11',3.40,1470.00,4998.00,96),(87,77,9,'2017-12-01',3.30,12.56,41.45,97),(88,78,9,'2017-12-01',3.30,12.56,41.45,98),(89,79,9,'2017-12-01',3.30,19.79,65.31,99),(90,80,9,'2017-12-01',3.30,21.31,70.32,100),(91,81,10,'2017-12-05',3.50,38.00,133.00,101),(92,43,11,'2017-12-16',3.44,26.00,89.44,102),(93,9,11,'2017-12-16',3.44,15.94,54.83,103),(94,82,11,'2017-12-16',3.44,23.00,79.12,104),(95,83,11,'2017-12-16',3.44,128.00,440.32,105),(96,22,11,'2017-12-16',3.44,7.16,24.63,106),(97,58,11,'2017-12-16',3.44,3.88,13.35,107),(98,71,11,'2017-12-16',3.44,5.00,17.20,108),(99,74,11,'2017-12-16',3.44,10.44,35.91,109),(100,84,11,'2017-12-16',3.44,8.96,30.82,110),(101,85,11,'2017-12-16',3.44,52.00,178.88,111),(102,6,4,'2017-12-16',3.37,27.09,91.29,112),(103,7,4,'2017-12-16',3.37,82.64,278.50,113),(104,51,5,'2017-12-16',3.48,18.00,62.64,114),(105,86,5,'2017-12-16',3.48,10.00,34.80,115),(106,87,5,'2017-12-16',3.48,45.00,156.60,116),(107,59,5,'2017-12-16',3.48,22.00,76.56,117),(108,24,1,'2017-12-16',3.48,22.50,78.30,118),(109,88,1,'2017-12-16',3.48,25.40,88.39,119),(110,89,7,'2017-12-16',3.48,300.00,1044.00,120),(111,14,7,'2017-12-16',3.48,650.00,2262.00,121),(112,90,3,'2017-12-16',3.44,8.72,30.00,122),(113,44,7,'2017-12-19',3.48,952.00,3312.96,123),(114,44,7,'2017-12-21',3.48,952.00,3312.96,124),(115,9,2,'2018-01-09',3.40,17.65,60.01,125),(116,22,2,'2018-01-09',3.40,7.35,24.99,126),(117,58,2,'2018-01-09',3.40,4.71,16.01,127),(118,71,2,'2018-01-09',3.40,5.29,17.99,128),(119,42,2,'2018-01-09',3.40,39.71,135.01,129),(120,91,2,'2018-01-09',3.40,30.88,104.99,130),(121,92,2,'2018-01-09',3.40,12.06,41.00,131),(122,32,11,'2018-01-09',3.40,10.29,34.99,132),(123,74,11,'2018-01-09',3.40,10.29,34.99,133),(124,6,5,'2018-01-09',3.40,30.00,102.00,134),(125,7,5,'2018-01-09',3.40,85.00,289.00,135),(126,44,7,'2018-01-09',3.40,970.00,3298.00,136),(127,60,3,'2018-01-09',3.40,26.47,90.00,137),(128,93,1,'2018-01-09',3.40,26.00,88.40,138);
/*!40000 ALTER TABLE `catalogoInternacional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogoPreco`
--

DROP TABLE IF EXISTS `catalogoPreco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogoPreco` (
  `idCatalogoPreco` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` varchar(45) NOT NULL,
  `valorAVista` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valorAPrazo` decimal(9,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idCatalogoPreco`),
  UNIQUE KEY `idCatalogoPreco_UNIQUE` (`idCatalogoPreco`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoPreco`
--

LOCK TABLES `catalogoPreco` WRITE;
/*!40000 ALTER TABLE `catalogoPreco` DISABLE KEYS */;
INSERT INTO `catalogoPreco` VALUES (1,'6',150.00,160.00),(2,'7',450.00,470.00),(3,'8',550.00,600.00),(4,'11',250.00,260.00),(5,'10',120.00,130.00),(6,'15',1950.00,2050.00),(7,'16',2100.00,2200.00),(8,'14',2850.00,3000.00),(9,'17',1950.00,2050.00),(10,'18',3400.00,3600.00),(11,'19',120.00,130.00),(12,'20',60.00,70.00),(13,'21',100.00,110.00),(14,'9',120.00,130.00),(15,'12',150.00,160.00),(16,'23',150.00,160.00),(17,'24',130.00,140.00),(18,'25',60.00,70.00),(19,'22',65.00,75.00),(20,'26',3800.00,4000.00),(21,'27',3300.00,3500.00),(22,'28',3200.00,3400.00),(23,'29',315.00,350.00),(24,'30',750.00,800.00),(25,'31',70.00,80.00),(26,'32',65.00,75.00),(27,'33',65.00,75.00),(28,'34',175.00,200.00),(29,'13',150.00,160.00);
/*!40000 ALTER TABLE `catalogoPreco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta` (
  `idConta` int(11) NOT NULL AUTO_INCREMENT,
  `idFuncionario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `instituicao` varchar(45) DEFAULT NULL,
  `agencia` varchar(20) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idConta`),
  UNIQUE KEY `idConta_UNIQUE` (`idConta`),
  KEY `FKjn2lh04ft0ybno4rg6hvujmna` (`idFuncionario`),
  CONSTRAINT `FKjn2lh04ft0ybno4rg6hvujmna` FOREIGN KEY (`idFuncionario`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` VALUES (1,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOITAU','8600','25946-2'),(2,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOSANTANDER','2140','01043259-1'),(3,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCODOBRASIL','5783-5','9582-6'),(4,3,'Conta Digital (DisponÃ­vel)','CONTAWEB','PAGSEGURO','',''),(5,3,'Conta Digital','CONTAWEB','MERCADOPAGO','',''),(6,3,'Conta ImportCG','CONTAMANUAL','IMPORTCG','',''),(7,4,'Conta ImportCG','CONTAMANUAL','IMPORTCG','',''),(8,3,'Conta Digital (A Receber)','CONTAWEB','PAGSEGURO','',''),(9,3,'Conta Pessoal (PoupanÃ§a)','CONTABANCARIA','BANCOITAU','8600','25946-2');
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa` (
  `idDespesa` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `valorTotal` decimal(9,2) NOT NULL DEFAULT '0.00',
  `dataDespesa` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `baixaGerada` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idDespesa`),
  UNIQUE KEY `idDespesa_UNIQUE` (`idDespesa`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (2,'LanÃ§amento de despesas - Compra de Produtos (23/09/2017)',3100.70,'2017-09-23','BAIXATOTALMENTE',1),(3,'LanÃ§amento de Despesas - Compra de Produtos (12/10/2017)',5516.61,'2017-10-12','BAIXATOTALMENTE',1),(4,'LanÃ§amento de Despesas - Compra de Produtos (20/10/2017)',2400.00,'2017-10-20','BAIXATOTALMENTE',1),(5,'LanÃ§amento de Despesas - Compra de Produtos (22/10/2017)',283.05,'2017-10-22','BAIXATOTALMENTE',1),(6,'LanÃ§amento de despesas - Compra de Produtos (02/11/2017)',3807.97,'2017-11-02','BAIXATOTALMENTE',1),(7,'Compra de sacolas (Central Embalagens)',32.70,'2017-10-13','BAIXATOTALMENTE',1),(8,'500 CartÃµes de Visita (Printi)',25.64,'2017-10-27','BAIXATOTALMENTE',1),(10,'LanÃ§amento de despesas - Compra de Produtos (06/11/2017)',2872.30,'2017-11-06','BAIXATOTALMENTE',1),(11,'LanÃ§amento de Despesas - Compra de Produtos (11/11/2017)',9977.81,'2017-11-11','BAIXATOTALMENTE',1),(12,'Compra de sacolas (Central Embalagens)',44.65,'2017-11-13','BAIXATOTALMENTE',1),(13,'LanÃ§amento de Despesas - Compra de Produtos (25/11/2017)',2170.08,'2017-11-25','BAIXATOTALMENTE',1),(14,'LanÃ§amento de Despesas - Compra de Produtos (03/12/2017)',83.01,'2017-12-03','BAIXATOTALMENTE',1),(15,'LanÃ§amento de Despesas - Compra de Produtos (11/12/2017)',5830.98,'2017-12-11','BAIXAPARCIALMENTE',1),(16,'Troca dos 2(Dois) Pneus dianteiros + Balanceamento',340.00,'2017-12-12','BAIXATOTALMENTE',1),(17,'Compra de sacolas (Central Embalagens)',50.00,'2017-12-14','BAIXATOTALMENTE',1),(18,'LanÃ§amento de Despesas - Compra de Produtos (16/12/2017)',6019.63,'2017-12-16','BAIXATOTALMENTE',1),(19,'LanÃ§amento de Despesas - Compra de Produtos (19/12/2017)',3312.96,'2017-12-19','BAIXATOTALMENTE',1),(20,'LanÃ§amento de Despesas - Compra de Produtos (21/12/2017)',3347.96,'2017-12-21','NAOBAIXADO',1),(21,'Compras na China',364.78,'2018-01-08','NAOBAIXADO',1),(22,'Mensalidade Stim Social',29.96,'2018-01-08','NAOBAIXADO',1),(23,'LanÃ§amento de Despesas - Compra de Produtos (09/01/2018)',4789.49,'2018-01-09','NAOBAIXADO',1);
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `idEntrada` int(11) NOT NULL AUTO_INCREMENT,
  `dataCompra` date NOT NULL,
  `valorTotal` decimal(9,2) DEFAULT NULL,
  `quantidadeTotal` int(11) DEFAULT NULL,
  `despesaLancada` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEntrada`),
  UNIQUE KEY `idEntrada_UNIQUE` (`idEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (6,'2017-09-07',3446.85,9,1),(8,'2017-09-23',2804.73,13,1),(9,'2017-10-12',5285.11,19,1),(10,'2017-10-20',2350.00,1,1),(11,'2017-10-22',283.05,4,1),(12,'2017-11-02',3617.95,20,1),(13,'2017-11-06',2822.30,1,1),(14,'2017-11-11',9657.81,18,1),(15,'2017-11-25',1997.08,12,1),(16,'2017-12-03',83.01,1,1),(17,'2017-12-11',5795.98,2,1),(18,'2017-12-01',231.78,4,1),(19,'2017-12-05',133.00,1,1),(20,'2017-12-16',5616.63,26,1),(21,'2017-12-19',3312.96,1,1),(22,'2017-12-21',3312.96,1,1),(23,'2018-01-09',4454.40,18,1);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatisticaVenda`
--

DROP TABLE IF EXISTS `estatisticaVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatisticaVenda` (
  `idConsumoCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idItemVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  `data` date NOT NULL,
  `valor` decimal(9,2) NOT NULL DEFAULT '0.00',
  `quantidade` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idConsumoCliente`),
  UNIQUE KEY `idConsumoCliente_UNIQUE` (`idConsumoCliente`),
  KEY `FKaq646c0uj1qx9gavtst1fuu0k` (`idItemVenda`),
  KEY `FKgx48nimw5pn7ke3x5r1k8v4i8` (`idProduto`),
  KEY `FKoix8lrsaed5kyaivh86j8d6aw` (`idCliente`),
  KEY `FKoja1ghf1k9q4vup32qc7ppt12` (`idFuncionario`),
  CONSTRAINT `FKaq646c0uj1qx9gavtst1fuu0k` FOREIGN KEY (`idItemVenda`) REFERENCES `itemVenda` (`idItemVenda`),
  CONSTRAINT `FKgx48nimw5pn7ke3x5r1k8v4i8` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKhwlrfwqvwdiaw1maq0h38k0n7` FOREIGN KEY (`idCliente`) REFERENCES `pessoa` (`idPessoa`),
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
  `idEstoque` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idEstoque`),
  UNIQUE KEY `id_UNIQUE` (`idEstoque`),
  KEY `fk_produto_idx` (`idProduto`),
  CONSTRAINT `FKgumrkw95wo8v0tvdwjmor525w` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (26,6,0),(27,7,1),(28,11,0),(29,12,0),(30,13,0),(31,14,0),(32,29,0),(33,24,0),(34,30,0),(35,31,0),(36,32,1),(37,33,-1),(38,34,0),(39,35,1),(40,36,0),(41,37,0),(42,38,0),(43,39,0),(44,40,0),(45,41,0),(46,42,0),(47,43,0),(48,44,0),(49,45,0),(50,46,0),(51,47,0),(52,48,0),(53,19,0),(54,51,1),(55,52,0),(56,49,0),(57,50,0),(58,54,0),(59,53,0),(60,9,1),(61,55,0),(62,56,0),(63,57,0),(64,58,1),(65,22,1),(66,59,1),(67,28,0),(68,60,0),(69,61,1),(70,62,0),(71,64,0),(72,65,1),(73,63,0),(74,67,0),(75,68,0),(76,69,0),(77,71,1),(78,72,0),(79,73,0),(80,74,1),(81,70,0),(82,75,0),(83,76,0),(84,77,1),(85,78,1),(86,79,1),(87,80,1),(88,81,1),(89,82,0),(90,83,0),(91,84,0),(92,85,0),(93,86,1),(94,87,0),(95,88,0),(96,89,0),(97,90,0),(98,91,0),(99,92,0),(100,93,0);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechamento`
--

DROP TABLE IF EXISTS `fechamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechamento` (
  `idFechamento` int(11) NOT NULL AUTO_INCREMENT,
  `valorRecebido` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valorEntradas` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valorDespesasBaixadas` decimal(9,2) NOT NULL DEFAULT '0.00',
  `valorDespesasABaixar` decimal(9,2) NOT NULL DEFAULT '0.00',
  `saldo` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '	',
  `mes` varchar(20) NOT NULL,
  `ano` int(4) NOT NULL,
  `data` date NOT NULL,
  `finalizado` int(1) NOT NULL DEFAULT '0',
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
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `site` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `instagram` varchar(45) DEFAULT NULL,
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
INSERT INTO `fornecedor` VALUES (1,'Shopping China','Avenida Internacional s/n,  Pedro Juan Caballero 79900-000, Paraguai','shoppingchina@shoppingchina.com.py','http://www.shoppingchina.com.py/','(67) 33343-3333','@shoppingchinaimportados','2017-09-12','2017-09-22'),(2,'Km Perfumaria','Av. Dr. FrÃ¢ncia, Pedro Juan Caballero 79900-000, Paraguai','',NULL,'','','2017-09-14','2017-09-22'),(3,'Camelodromo','Paraguai','',NULL,'','','2017-09-14',NULL),(4,'Popai','Unidade 1: Mariscal LÃ³pez c/ Naciones Unidas, Pedro Juan Caballero Paraguai\r\nUnidade 2: Dr. Francia  c/ Ytororo, Pedro Juan Caballero Paraguai\r\n','','http://www.popaisa.com','(67) 98421-0348','','2017-09-19','2017-09-22'),(5,'Shopping Planet Outlet','Av. Internacional 7777, Pedro Juan Caballero 79900-000, Paraguai','','http://shoppingplanetoutlet.centralpark75.co/','(67) 33433-9513','@planetoutletpy','2017-09-19','2017-09-22'),(6,'Studio Center','Av. Dr. FrÃ¢ncia 1660, Pedro Juan Caballero 79900-000, Paraguai','atendimento@studiocenter.com.py','http://www.studiocenter.com.py/','(67) 33437-7000','@studiocenterpy','2017-09-22','2017-09-22'),(7,'Axus InformÃ¡tica','Av. Dr. Francia c/ Iturbe, Pedro Juan Caballero Paraguai','axus2009@hotmail.com','','(67) 33432-0023','','2017-09-22','2017-09-22'),(8,'Loja de Suplementos','...','','','','','2017-11-03',NULL),(9,'AliExpress','Internet (China)','','','','','2017-12-11',NULL),(10,'GearBest','Internet (China)','','','','','2017-12-11',NULL),(11,'Perfumaria Chines','...','','','','','2017-12-18',NULL);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemBaixa`
--

DROP TABLE IF EXISTS `itemBaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemBaixa` (
  `idItemBaixa` int(11) NOT NULL AUTO_INCREMENT,
  `idBaixa` int(11) NOT NULL,
  `idItemDespesa` int(11) NOT NULL,
  `idCaixa` int(11) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `valor` decimal(9,2) NOT NULL DEFAULT '0.00',
  `acrescimo` decimal(9,2) DEFAULT '0.00',
  `data` date NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `baixado` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idItemBaixa`),
  UNIQUE KEY `idItemBaixa_UNIQUE` (`idItemBaixa`),
  KEY `FKr2f43md20jss1j4r3m2dmvaas` (`idBaixa`),
  KEY `FK2llrqykmcs3dy6paxfb6q2701` (`idCaixa`),
  KEY `FK9djmbja444w8w9qagfoci68c3` (`idItemDespesa`),
  CONSTRAINT `FK2llrqykmcs3dy6paxfb6q2701` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`),
  CONSTRAINT `FK9djmbja444w8w9qagfoci68c3` FOREIGN KEY (`idItemDespesa`) REFERENCES `itemDespesa` (`idItemDespesa`),
  CONSTRAINT `FKr2f43md20jss1j4r3m2dmvaas` FOREIGN KEY (`idBaixa`) REFERENCES `baixa` (`idBaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemBaixa`
--

LOCK TABLES `itemBaixa` WRITE;
/*!40000 ALTER TABLE `itemBaixa` DISABLE KEYS */;
INSERT INTO `itemBaixa` VALUES (1,1,1,1,'Produtos para venda comprados em dinheiro',2014.73,0.00,'2017-09-27','BAIXAPARCIAL',1),(2,1,1,1,'Produtos para venda comprados no cartÃ£o de credito',790.00,0.00,'2017-11-01','BAIXAINTEGRAL',1),(3,1,2,1,'Abastecimento realizado no Paraguai',142.00,0.00,'2017-09-27','BAIXAINTEGRAL',1),(4,1,3,1,'Abastecimento realizado em Campo Grande com cartÃ£o de crÃ©dito Santander fechamento 10/10',153.97,0.00,'2017-10-10','BAIXAINTEGRAL',1),(5,2,4,1,'Produtos para venda comprados em dinheiro',5126.46,0.00,'2017-10-13','BAIXAPARCIAL',1),(6,2,4,1,'Produtos para venda comprados no cartÃ£o de credito',158.65,0.00,'2017-11-01','BAIXAPARCIAL',1),(7,2,5,1,'Abastecimento realizado em Campo Grande',100.00,0.00,'2017-10-13','BAIXAINTEGRAL',1),(8,2,6,1,'Abastecimento realizado no Paraguai',100.00,0.00,'2017-10-13','BAIXAINTEGRAL',1),(9,2,7,1,'AlmoÃ§o Self Service MR. Grill (Thiago e Luana)',31.50,0.00,'2017-10-13','BAIXAINTEGRAL',1),(10,3,8,5,'Produtos para venda comprados em dinheiro',2350.00,0.00,'2017-10-22','BAIXAINTEGRAL',1),(11,3,9,5,'Frete pago para amiga da Luana',50.00,0.00,'2017-10-22','BAIXAINTEGRAL',1),(12,4,10,1,'Produtos para venda comprados em dinheiro',283.05,0.00,'2017-10-22','BAIXAINTEGRAL',1),(13,5,11,1,'Produtos para venda comprados em dinheiro',3617.95,0.00,'2017-11-04','BAIXAINTEGRAL',1),(14,5,12,7,'Abastecimento realizado em Campo Grande',158.02,0.00,'2017-12-04','BAIXAINTEGRAL',1),(15,5,13,1,'AlmoÃ§o Self Service MR. Grill (Thiago e Luana)',32.00,0.00,'2017-11-04','BAIXAINTEGRAL',1),(16,6,14,1,'Sacolas - Compra relizada via cartÃ£o de credito com vencimento para Novembro',32.70,0.00,'2017-11-06','BAIXAINTEGRAL',1),(17,7,15,7,'500 CartÃµes de Visita (Printi) - Compra realizada via cartÃ£o de crÃ©dito com vencimento para a mÃªs de Dezembro',25.64,0.00,'2017-12-04','BAIXAINTEGRAL',1),(18,8,17,1,'Compra Iphone 8 64GB (Cheque para dia 08/11/2017)',1000.00,0.00,'2017-11-08','BAIXAINTEGRAL',1),(19,8,17,7,'Compra Iphone 8 64GB (Cheque para dia 08/12/2017)',1822.00,0.00,'2017-12-12','BAIXAINTEGRAL',1),(20,8,18,1,'Frete Iphone 8 64GB',50.00,0.00,'2017-11-06','BAIXAINTEGRAL',1),(21,9,19,1,'TransferÃªncia TED para conta da AXUS InformÃ¡tica referente ao parcelamento do Iphone 7 32GB (Entrada 1000,00 + Cheque 1227,00)',1000.00,0.00,'2017-11-14','BAIXAPARCIAL',1),(22,9,19,7,'Cheque para AXUS InformÃ¡tica referente ao parcelamento do Iphone 7 32GB (Entrada 1000,00 + Cheque 1227,00)',1227.00,0.00,'2017-11-21','BAIXAPARCIAL',1),(23,9,19,7,'Compra Iphone X 264GB (Cheque para dia 20/11/2017)',3060.00,0.00,'2017-11-21','BAIXAPARCIAL',1),(24,9,19,7,'Compra Iphone X 264GB (Cheque para dia 15/12/2017)',3060.00,0.00,'2017-12-18','BAIXAPARCIAL',1),(25,9,19,1,'Produtos para venda',1310.81,0.00,'2017-11-13','BAIXAPARCIAL',1),(26,9,20,1,'Abastecimento realizado em Campo Grande',120.00,0.00,'2017-11-13','BAIXAINTEGRAL',1),(27,9,21,1,'Abastecimento realizado no Paraguai',120.00,0.00,'2017-11-13','BAIXAINTEGRAL',1),(28,9,22,1,'AlmoÃ§o (Luana, Thiago, Ighor e Lorena) Mr. Grill',80.00,0.00,'2017-11-13','BAIXAINTEGRAL',1),(29,10,23,7,'Compra de 3 pacotes de sacolas com 10 unidades cada. (Pequeno, Medio e Grande)',44.65,0.00,'2017-12-04','BAIXAINTEGRAL',1),(30,11,24,1,'Produtos para venda',1997.08,0.00,'2017-11-27','BAIXAINTEGRAL',1),(31,11,25,1,'Abastecimento realizado em Campo Grande',130.00,0.00,'2017-11-27','BAIXAINTEGRAL',1),(32,11,26,1,'AlmoÃ§o (Luana e Thiago) Mr. Grill',43.00,0.00,'2017-11-27','BAIXAINTEGRAL',1),(33,12,27,7,'Produtos para venda',83.01,0.00,'2017-12-04','BAIXAINTEGRAL',1),(34,13,28,7,'Transferencia da Entrada (AG: 0173 C/C: 044631-9 CNPJ: 05.959.963/0001-30 Madrigal Comercio de Bebidas LTDA)',999.98,0.00,'2017-12-11','BAIXAPARCIAL',1),(35,13,28,7,'1Âº Cheque para AXUS referente ao parcelamento do Iphone X 64 GB e J7 Prime (Entrada 1000,00 + 2 Cheque 2398,00)',2398.00,0.00,'2018-01-15','BAIXAPARCIAL',1),(36,13,28,7,'2Âº Cheque para AXUS referente ao parcelamento do Iphone X 64 GB e J7 Prime (Entrada 1000,00 + 2 Cheque 2398,00)',2398.00,0.00,'2018-02-12','BAIXAPARCIAL',0),(37,13,29,7,'Frete (Van)',35.00,0.00,'2017-12-11','BAIXAINTEGRAL',1),(38,14,30,7,'Pagamento a vista em dinheiro',320.00,0.00,'2017-12-12','BAIXAINTEGRAL',1),(39,14,31,7,'Pagamento a vista em dinheiro',20.00,0.00,'2017-12-12','BAIXAINTEGRAL',1),(40,15,32,1,'Sacolas',50.00,0.00,'2017-12-14','BAIXAINTEGRAL',1),(41,16,33,1,'Produtos para venda',5616.63,0.00,'2017-12-18','BAIXAINTEGRAL',1),(42,16,34,1,'Abastecimento realizado em Campo Grande',120.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(43,16,35,1,'Abastecimento realizado no Paraguai',95.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(44,16,36,1,'AlmoÃ§o (Luana, Thiago e Lorena) Mr. Grill',56.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(45,16,37,1,'Pneu 195/55 15 (Estepe)',105.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(46,16,38,7,'CafÃ© da Manha (Studio Center)',27.00,0.00,'2017-12-21','BAIXAINTEGRAL',1),(47,17,39,7,'Produtos para venda',3312.96,0.00,'2017-12-19','BAIXAINTEGRAL',1),(48,18,40,7,'Cheque para AXUS Importados referente ao Iphone 8 Plus 64GB',3312.96,0.00,'2018-01-12','BAIXAINTEGRAL',1),(49,18,41,7,'Frete (Van)',35.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(50,19,42,7,'Compra na China (GearBest)',133.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(51,19,43,7,'Compra na China (AliExpress)',231.78,0.00,'2018-01-10','BAIXAINTEGRAL',1),(52,20,44,7,'Mensalidade',29.96,0.00,'2018-01-10','BAIXAINTEGRAL',1),(53,21,45,7,'Produtos para venda',2156.40,0.00,'2018-01-10','BAIXAPARCIAL',1),(54,21,45,7,'1Âº Cheque para AXUS InformÃ¡tica referente ao parcelamento do Iphone 8 Plus 64GB (Entrada 1000,00 + 2 Cheques 1149,00)',1149.00,0.00,'2018-02-10','BAIXAPARCIAL',0),(55,21,45,7,'2Âº Cheque para AXUS InformÃ¡tica referente ao parcelamento do Iphone 8 Plus 64GB (Entrada 1000,00 + 2 Cheques 1149,00)',1149.00,0.00,'2018-03-10','BAIXAPARCIAL',0),(56,21,46,7,'Pagamento no CartÃ£o de CrÃ©dito Mastercard ItaÃº',154.09,0.00,'2018-02-10','BAIXAINTEGRAL',0),(57,21,47,7,'Abastecimento em dinheiro',111.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(58,21,48,7,'AlmoÃ§o Mr. Grill',50.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(59,21,49,7,'CafÃ© da ManhÃ£',20.00,0.00,'2018-01-10','BAIXAINTEGRAL',1);
/*!40000 ALTER TABLE `itemBaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemDespesa`
--

DROP TABLE IF EXISTS `itemDespesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemDespesa` (
  `idItemDespesa` int(11) NOT NULL AUTO_INCREMENT,
  `idDespesa` int(11) NOT NULL,
  `idEntrada` int(11) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  `valor` decimal(9,2) NOT NULL DEFAULT '0.00',
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idItemDespesa`),
  UNIQUE KEY `idItemDespesa_UNIQUE` (`idItemDespesa`),
  KEY `FKrdr2v8kaimdegi71g1gwe4kq` (`idDespesa`),
  KEY `FKi5g91vg4lf0rnsnou9ot12gcb` (`idEntrada`),
  CONSTRAINT `FKi5g91vg4lf0rnsnou9ot12gcb` FOREIGN KEY (`idEntrada`) REFERENCES `entrada` (`idEntrada`),
  CONSTRAINT `FKrdr2v8kaimdegi71g1gwe4kq` FOREIGN KEY (`idDespesa`) REFERENCES `despesa` (`idDespesa`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemDespesa`
--

LOCK TABLES `itemDespesa` WRITE;
/*!40000 ALTER TABLE `itemDespesa` DISABLE KEYS */;
INSERT INTO `itemDespesa` VALUES (1,2,8,'Produtos para venda','COMPRAPRODUTO',2804.73,'NAOBAIXADO'),(2,2,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',142.00,'NAOBAIXADO'),(3,2,NULL,'Abastecimento realizado em Campo Grande com cartÃ£o de crÃ©dito Santander fechamento 10/10','COMBUSTIVEL',153.97,'NAOBAIXADO'),(4,3,9,'Produtos para venda','COMPRAPRODUTO',5285.11,NULL),(5,3,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',100.00,NULL),(6,3,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',100.00,NULL),(7,3,NULL,'AlmoÃ§o Self Service MR. Grill (Thiago e Luana)','ALIMENTACAO',31.50,NULL),(8,4,10,'Produtos para venda comprados em dinheiro','COMPRAPRODUTO',2350.00,NULL),(9,4,NULL,'Frete pago para amiga da Luana','FRETE',50.00,NULL),(10,5,11,'Produtos para venda comprados em dinheiro','COMPRAPRODUTO',283.05,NULL),(11,6,12,'Produtos para venda','COMPRAPRODUTO',3617.95,NULL),(12,6,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',158.02,NULL),(13,6,NULL,'AlmoÃ§o (Luana e Thiago) Mr. Grill','ALIMENTACAO',32.00,NULL),(14,7,NULL,'Sacolas','ALMOXARIFADO',32.70,NULL),(15,8,NULL,'500 CartÃµes de Visita (Printi)','ALMOXARIFADO',25.64,NULL),(17,10,13,'Produtos para venda','COMPRAPRODUTO',2822.30,NULL),(18,10,NULL,'Frete Iphone 8 64GB','FRETE',50.00,NULL),(19,11,14,'Produtos para venda','COMPRAPRODUTO',9657.81,NULL),(20,11,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',120.00,NULL),(21,11,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',120.00,NULL),(22,11,NULL,'AlmoÃ§o (Luana, Thiago, Ighor e Lorena) Mr. Grill','ALIMENTACAO',80.00,NULL),(23,12,NULL,'3x10 (3 tamanhos de sacolas)','ALMOXARIFADO',44.65,NULL),(24,13,15,'Produtos para venda','COMPRAPRODUTO',1997.08,NULL),(25,13,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',130.00,NULL),(26,13,NULL,'AlmoÃ§o (Luana e Thiago) Mr. Grill','ALIMENTACAO',43.00,NULL),(27,14,16,'Produtos para venda','COMPRAPRODUTO',83.01,NULL),(28,15,17,'Produtos para venda','COMPRAPRODUTO',5795.98,NULL),(29,15,NULL,'Frete (Van)','FRETE',35.00,NULL),(30,16,NULL,'2(Pneus) 195/55 15','MANUTENCAOCARRO',320.00,NULL),(31,16,NULL,'Balanceamento das 2(Duas) rodas','MANUTENCAOCARRO',20.00,NULL),(32,17,NULL,'Sacolas','ALMOXARIFADO',50.00,NULL),(33,18,20,'Produtos para venda','COMPRAPRODUTO',5616.63,NULL),(34,18,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',120.00,NULL),(35,18,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',95.00,NULL),(36,18,NULL,'AlmoÃ§o (Luana, Thiago e Lorena) Mr. Grill','ALIMENTACAO',56.00,NULL),(37,18,NULL,'Pneu 195/55 15 (Estepe)','MANUTENCAOCARRO',105.00,NULL),(38,18,NULL,'CafÃ© da Manha (Studio Center)','ALIMENTACAO',27.00,NULL),(39,19,21,'Produtos para venda','COMPRAPRODUTO',3312.96,NULL),(40,20,22,'Produtos para venda','COMPRAPRODUTO',3312.96,NULL),(41,20,NULL,'Frete (Van)','FRETE',35.00,NULL),(42,21,19,'Relogio','COMPRAPRODUTO',133.00,NULL),(43,21,18,'Relogios','COMPRAPRODUTO',231.78,NULL),(44,22,NULL,'Mensalidade','REDESOCIAL',29.96,NULL),(45,23,23,'Produtos para venda','COMPRAPRODUTO',4454.40,NULL),(46,23,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',154.09,NULL),(47,23,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',111.00,NULL),(48,23,NULL,'AlmoÃ§o Mr. Grill','ALIMENTACAO',50.00,NULL),(49,23,NULL,'CafÃ© da ManhÃ£','ALIMENTACAO',20.00,NULL);
/*!40000 ALTER TABLE `itemDespesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemEntrada`
--

DROP TABLE IF EXISTS `itemEntrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemEntrada` (
  `idItemEntrada` int(11) NOT NULL AUTO_INCREMENT,
  `idEntrada` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  `valorEmDolar` decimal(9,2) DEFAULT NULL,
  `valorEmReal` decimal(9,2) DEFAULT NULL,
  `cotacao` decimal(9,2) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idItemEntrada`),
  UNIQUE KEY `idItemEntrada_UNIQUE` (`idItemEntrada`),
  KEY `fk_itemEntrada_entrada_idx` (`idEntrada`),
  KEY `fk_itemEntrada_produto_idx` (`idProduto`),
  KEY `fk_itemEntrada_fornecedor_idx` (`idFornecedor`),
  CONSTRAINT `FKjyakb0b8tpnhe763ijq096ssh` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKle7ytd45iqwof5gwxm47d3284` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `FKx2pq54u6nqee1ct3guex6bnr` FOREIGN KEY (`idEntrada`) REFERENCES `entrada` (`idEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemEntrada`
--

LOCK TABLES `itemEntrada` WRITE;
/*!40000 ALTER TABLE `itemEntrada` DISABLE KEYS */;
INSERT INTO `itemEntrada` VALUES (12,6,6,1,21.00,68.88,3.28,2),(13,6,7,1,80.00,262.40,3.28,3),(14,6,11,1,41.00,134.48,3.28,1),(15,6,12,2,23.48,77.01,3.28,1),(16,6,13,3,24.39,80.00,3.28,1),(17,6,14,1,680.00,2230.40,3.28,1),(20,8,29,1,100.00,330.00,3.30,1),(21,8,24,1,18.50,61.05,3.30,1),(22,8,7,6,85.00,280.50,3.30,3),(23,8,30,5,185.00,610.50,3.30,2),(24,8,6,4,24.66,81.13,3.29,1),(25,8,31,2,7.60,25.00,3.29,1),(26,8,32,2,10.64,35.01,3.29,1),(27,8,33,2,10.64,35.01,3.29,1),(28,8,34,2,28.88,95.02,3.29,1),(29,8,13,3,24.32,80.01,3.29,1),(30,9,6,4,24.60,80.93,3.29,2),(31,9,7,5,88.00,292.16,3.32,1),(32,9,11,1,45.00,149.40,3.32,1),(33,9,35,5,7.00,23.24,3.32,1),(34,9,36,1,107.00,355.24,3.32,2),(35,9,37,1,36.00,119.52,3.32,1),(36,9,38,1,42.00,139.44,3.32,1),(37,9,39,1,10.95,36.35,3.32,5),(38,9,40,1,3.99,13.25,3.32,1),(39,9,41,7,30.00,99.00,3.30,1),(40,9,42,2,36.36,119.99,3.30,1),(41,9,43,2,22.73,75.01,3.30,1),(42,9,44,7,969.70,3200.01,3.30,1),(43,10,45,7,712.12,2350.00,3.30,1),(44,11,46,5,10.00,33.30,3.33,1),(45,11,47,5,10.00,33.30,3.33,2),(46,11,48,5,55.00,183.15,3.33,1),(47,12,6,4,24.30,79.70,3.28,2),(48,12,6,5,30.00,102.00,3.40,1),(49,12,19,5,19.20,65.28,3.40,1),(50,12,51,5,19.20,65.28,3.40,1),(51,12,52,5,19.20,65.28,3.40,1),(52,12,49,5,8.70,29.58,3.40,1),(53,12,50,5,7.70,26.18,3.40,1),(54,12,54,3,4.44,15.01,3.38,1),(55,12,53,5,4.00,13.60,3.40,1),(56,12,9,2,16.27,54.99,3.38,1),(57,12,55,2,20.71,70.00,3.38,1),(58,12,56,2,16.57,56.01,3.38,1),(59,12,57,2,11.24,37.99,3.38,1),(60,12,58,2,3.85,13.01,3.38,1),(61,12,22,2,6.81,23.02,3.38,1),(62,12,59,2,20.12,68.01,3.38,1),(63,12,28,7,754.44,2550.01,3.38,1),(64,12,37,1,36.00,122.40,3.40,1),(65,12,60,1,19.38,65.89,3.40,1),(66,12,61,8,4.44,15.01,3.38,1),(67,13,62,7,835.00,2822.30,3.38,1),(68,14,6,4,24.26,82.00,3.38,1),(69,14,53,3,2.96,10.00,3.38,1),(70,14,64,2,25.15,85.01,3.38,1),(71,14,9,4,19.82,66.99,3.38,1),(72,14,57,2,11.24,37.99,3.38,1),(73,14,58,2,3.85,13.01,3.38,3),(74,14,65,2,3.85,13.01,3.38,1),(75,14,14,7,655.00,2227.00,3.40,1),(76,14,63,7,1800.00,6120.00,3.40,1),(77,14,67,7,190.00,646.00,3.40,1),(78,14,61,8,4.44,15.01,3.38,2),(79,14,68,1,19.90,67.66,3.40,1),(80,14,60,1,21.50,73.10,3.40,1),(81,14,13,3,23.67,80.00,3.38,2),(82,15,69,2,54.73,184.99,3.38,1),(83,15,43,2,23.67,80.00,3.38,1),(84,15,71,2,5.33,18.02,3.38,1),(85,15,72,2,4.44,15.01,3.38,1),(86,15,73,2,8.88,30.01,3.38,1),(87,15,74,2,9.47,32.01,3.38,1),(88,15,59,2,20.12,68.01,3.38,1),(89,15,55,2,21.90,74.02,3.38,1),(90,15,58,2,3.85,13.01,3.38,1),(91,15,70,2,101.48,343.00,3.38,1),(92,15,75,7,250.00,850.00,3.40,1),(93,15,7,5,85.00,289.00,3.40,1),(94,16,43,2,24.56,83.01,3.38,1),(95,17,75,7,234.70,797.98,3.40,1),(96,17,76,7,1470.00,4998.00,3.40,1),(97,18,77,9,12.56,43.96,3.50,1),(98,18,78,9,12.56,43.96,3.50,1),(99,18,79,9,19.79,69.27,3.50,1),(100,18,80,9,21.31,74.59,3.50,1),(101,19,81,10,38.00,133.00,3.50,1),(102,20,43,11,26.00,89.44,3.44,1),(103,20,9,11,15.94,54.83,3.44,1),(104,20,82,11,23.00,79.12,3.44,1),(105,20,83,11,128.00,440.32,3.44,1),(106,20,22,11,7.16,24.63,3.44,1),(107,20,58,11,3.88,13.35,3.44,2),(108,20,71,11,5.00,17.20,3.44,1),(109,20,74,11,10.44,35.91,3.44,2),(110,20,84,11,8.96,30.82,3.44,1),(111,20,85,11,52.00,178.88,3.44,1),(112,20,6,4,27.09,91.29,3.37,2),(113,20,7,4,82.64,278.50,3.37,2),(114,20,51,5,18.00,62.64,3.48,1),(115,20,86,5,10.00,34.80,3.48,1),(116,20,87,5,45.00,156.60,3.48,1),(117,20,59,5,22.00,76.56,3.48,1),(118,20,24,1,22.50,78.30,3.48,1),(119,20,88,1,25.40,88.39,3.48,1),(120,20,89,7,300.00,1044.00,3.48,1),(121,20,14,7,650.00,2262.00,3.48,1),(122,20,90,3,8.72,30.00,3.44,2),(123,21,44,7,952.00,3312.96,3.48,1),(124,22,44,7,952.00,3312.96,3.48,1),(125,23,9,2,17.65,60.01,3.40,2),(126,23,22,2,7.35,24.99,3.40,2),(127,23,58,2,4.71,16.01,3.40,3),(128,23,71,2,5.29,17.99,3.40,1),(129,23,42,2,39.71,135.01,3.40,1),(130,23,91,2,30.88,104.99,3.40,1),(131,23,92,2,12.06,41.00,3.40,1),(132,23,32,11,10.29,34.99,3.40,1),(133,23,74,11,10.29,34.99,3.40,1),(134,23,6,5,30.00,102.00,3.40,1),(135,23,7,5,85.00,289.00,3.40,1),(136,23,44,7,970.00,3298.00,3.40,1),(137,23,60,3,26.47,90.00,3.40,1),(138,23,93,1,26.00,88.40,3.40,1);
/*!40000 ALTER TABLE `itemEntrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemVenda`
--

DROP TABLE IF EXISTS `itemVenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemVenda` (
  `idItemVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idItemEntrada` int(11) NOT NULL,
  `valor` decimal(9,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idItemVenda`),
  UNIQUE KEY `idItemVenda_UNIQUE` (`idItemVenda`),
  KEY `FKq99iiopsfwkm3rskreq6cg7qh` (`idItemEntrada`),
  KEY `FK5eyxa71d0qvmircij2jqhtajl` (`idProduto`),
  KEY `FKq0wpxloynk627fqxtuykjxuur` (`idVenda`),
  CONSTRAINT `FK5eyxa71d0qvmircij2jqhtajl` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `FKq0wpxloynk627fqxtuykjxuur` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`),
  CONSTRAINT `FKq99iiopsfwkm3rskreq6cg7qh` FOREIGN KEY (`idItemEntrada`) REFERENCES `itemEntrada` (`idItemEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemVenda`
--

LOCK TABLES `itemVenda` WRITE;
/*!40000 ALTER TABLE `itemVenda` DISABLE KEYS */;
INSERT INTO `itemVenda` VALUES (40,25,6,12,160.00,1),(41,26,6,12,160.00,1),(42,27,7,22,450.00,2),(43,29,7,13,450.00,1),(44,30,12,15,140.00,1),(45,31,13,16,160.00,1),(46,32,14,17,3200.00,1),(47,33,11,14,200.00,1),(48,34,30,23,750.00,2),(49,35,29,20,410.00,1),(50,36,7,22,400.00,1),(51,37,24,21,130.00,1),(52,38,34,28,175.00,1),(53,39,13,29,150.00,1),(54,40,7,13,410.00,1),(55,41,32,26,65.00,1),(56,41,6,24,85.00,1),(57,42,44,42,4050.00,1),(58,43,41,39,150.00,1),(59,44,39,37,55.00,5),(60,45,6,30,80.00,1),(61,46,42,40,190.00,1),(62,47,43,41,150.00,1),(63,48,6,30,160.00,1),(64,49,45,43,3150.00,1),(65,50,28,63,3000.00,1),(66,50,54,54,0.00,1),(67,50,53,55,0.00,1),(68,51,6,48,150.00,1),(69,52,58,60,30.00,1),(70,53,48,46,250.00,1),(71,53,61,66,30.00,1),(72,54,62,67,3400.00,1),(73,55,37,35,175.00,1),(74,55,38,36,175.00,1),(75,56,36,34,500.00,2),(76,56,56,58,100.00,1),(77,57,9,56,120.00,1),(78,58,6,47,160.00,1),(79,59,37,64,180.00,1),(80,60,57,59,70.00,1),(81,61,67,77,1120.00,1),(82,62,60,80,140.00,1),(83,63,14,75,2850.00,1),(84,64,63,76,6849.99,1),(85,65,64,70,160.00,1),(86,66,13,81,150.00,2),(87,67,6,68,120.00,1),(88,68,31,25,70.00,1),(89,69,52,51,100.00,1),(90,70,7,13,470.00,1),(91,71,59,62,130.00,1),(92,71,47,45,65.00,1),(93,72,47,45,0.00,1),(94,63,53,69,0.00,1),(95,73,58,73,30.00,2),(96,74,60,65,150.00,1),(97,75,19,49,100.00,1),(98,76,55,57,120.00,1),(99,77,55,89,110.00,1),(100,77,73,86,60.00,1),(101,78,59,88,130.00,1),(102,78,58,90,30.00,1),(103,79,50,53,70.00,1),(104,80,68,79,120.00,1),(105,81,72,85,50.00,1),(107,81,9,71,120.00,1),(108,82,43,83,150.00,1),(109,83,22,61,50.00,1),(110,84,75,92,1200.00,1),(111,85,6,47,125.00,1),(112,86,51,50,120.00,1),(113,87,74,87,60.00,1),(114,88,61,78,35.00,1),(115,89,71,84,35.00,1),(116,89,58,73,25.00,1),(117,90,70,91,450.00,1),(118,91,43,94,150.00,1),(119,92,7,31,410.00,1),(120,93,7,93,390.00,1),(121,94,69,82,320.00,1),(122,95,76,96,5600.00,1),(123,96,75,95,1250.00,1),(124,97,11,32,200.00,1),(126,99,40,38,30.00,1),(127,100,14,121,2400.00,1),(128,101,83,105,600.00,1),(129,102,89,120,1400.00,1),(130,103,88,119,150.00,1),(131,104,49,52,70.00,1),(132,105,24,118,130.00,1),(133,106,87,116,280.00,1),(134,107,90,122,65.00,2),(135,108,58,107,30.00,1),(136,109,57,72,65.00,1),(137,110,6,112,120.00,2),(138,111,44,123,4073.91,1),(139,112,58,107,30.00,1),(140,112,71,108,40.00,1),(141,113,44,124,3850.00,1),(142,114,82,104,150.00,1),(143,115,9,103,120.00,1),(144,116,74,109,65.00,1),(145,117,74,109,38.00,1),(146,118,22,106,50.00,1),(147,119,84,110,0.00,1),(148,120,46,44,0.00,1),(149,121,33,27,0.00,1),(150,122,7,113,0.00,1),(151,123,85,111,0.00,1),(152,124,60,137,150.00,1),(153,125,42,129,210.00,1),(154,126,93,138,190.00,1),(155,127,44,136,3850.00,1),(156,128,7,135,400.00,1),(157,129,58,127,30.00,2),(158,130,9,125,120.00,1),(159,131,91,130,180.00,1),(160,131,92,131,75.00,1),(161,131,22,126,50.00,1),(162,131,43,102,150.00,1),(163,132,6,134,150.00,1);
/*!40000 ALTER TABLE `itemVenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `idPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `idVenda` int(11) NOT NULL,
  `forma` varchar(20) NOT NULL,
  `data` date DEFAULT NULL,
  `valor` decimal(9,2) DEFAULT NULL,
  `pago` int(1) NOT NULL,
  `parcela` int(11) DEFAULT '0',
  `valorParcela` decimal(9,2) DEFAULT '0.00',
  `saldo` decimal(9,2) DEFAULT '0.00',
  `taxa` decimal(9,2) DEFAULT '0.00',
  `dataRecebimento` date DEFAULT NULL,
  `dataCompensacao` date DEFAULT NULL,
  `idCaixa` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPagamento`),
  UNIQUE KEY `idPagamento_UNIQUE` (`idPagamento`),
  KEY `fk_pagamento_venda_idx` (`idVenda`),
  KEY `FKisk5alom9yolr7brwq967ejd7` (`idCaixa`),
  CONSTRAINT `FK2jyyepu1tqd46buhn0pcs78q3` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`),
  CONSTRAINT `FKisk5alom9yolr7brwq967ejd7` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (7,25,'DINHEIRO','2017-10-10',80.00,1,NULL,NULL,80.00,NULL,NULL,NULL,NULL),(15,26,'CREDITO','2017-09-09',160.00,1,3,56.56,151.06,8.94,'2017-09-10',NULL,NULL),(16,27,'DINHEIRO','2017-09-07',300.00,1,0,0.00,300.00,0.00,NULL,NULL,NULL),(17,27,'DINHEIRO','2017-10-07',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(18,27,'DINHEIRO','2017-11-07',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(19,29,'DINHEIRO','2017-09-07',150.00,1,0,0.00,150.00,0.00,NULL,NULL,NULL),(20,29,'DINHEIRO','2017-10-11',300.00,1,0,0.00,300.00,0.00,NULL,NULL,NULL),(22,30,'DINHEIRO','2017-09-19',70.00,1,0,0.00,70.00,0.00,NULL,NULL,NULL),(23,30,'DINHEIRO','2017-10-19',70.00,1,0,0.00,70.00,0.00,NULL,NULL,NULL),(26,32,'DINHEIRO','2017-09-07',1600.00,1,0,0.00,1600.00,0.00,NULL,NULL,NULL),(27,32,'DINHEIRO','2017-10-08',1600.00,1,0,0.00,1600.00,0.00,NULL,NULL,NULL),(28,33,'DINHEIRO','2017-09-25',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(29,34,'DINHEIRO','2017-09-25',1500.00,1,0,0.00,1500.00,0.00,NULL,NULL,NULL),(30,35,'DINHEIRO','2017-09-23',410.00,1,0,0.00,410.00,0.00,NULL,NULL,NULL),(31,36,'DINHEIRO','2017-09-26',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(32,36,'DINHEIRO','2017-10-26',50.00,1,0,0.00,50.00,0.00,NULL,NULL,NULL),(33,36,'DINHEIRO','2017-10-28',50.00,1,0,0.00,50.00,0.00,NULL,NULL,NULL),(34,37,'DINHEIRO','2017-10-09',130.00,1,0,0.00,130.00,0.00,NULL,NULL,NULL),(35,38,'DINHEIRO','2017-09-28',175.00,1,0,0.00,175.00,0.00,NULL,NULL,NULL),(36,39,'DINHEIRO','2017-11-06',150.00,1,0,0.00,150.00,0.00,NULL,NULL,NULL),(37,40,'DINHEIRO','2017-09-25',410.00,1,0,0.00,410.00,0.00,NULL,NULL,NULL),(38,31,'DINHEIRO','2017-09-28',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(39,31,'DINHEIRO','2017-10-28',60.00,1,0,0.00,60.00,0.00,NULL,NULL,NULL),(40,41,'DINHEIRO','2017-10-04',75.00,1,0,0.00,75.00,0.00,NULL,NULL,NULL),(41,41,'DINHEIRO','2017-11-20',75.00,1,0,0.00,75.00,0.00,NULL,NULL,NULL),(42,27,'DINHEIRO','2017-12-11',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(43,25,'DINHEIRO','2017-11-10',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(44,42,'DINHEIRO','2017-10-12',950.00,1,0,0.00,950.00,0.00,NULL,NULL,NULL),(45,42,'DINHEIRO','2017-11-07',1000.00,1,0,0.00,1000.00,0.00,NULL,NULL,NULL),(46,43,'DINHEIRO','2017-10-14',150.00,1,0,0.00,150.00,0.00,NULL,NULL,NULL),(47,44,'DINHEIRO','2017-10-16',275.00,1,0,0.00,275.00,0.00,NULL,NULL,NULL),(48,45,'DINHEIRO','2017-11-24',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(50,46,'DINHEIRO','2017-11-07',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(51,46,'DINHEIRO','2017-12-05',90.00,1,0,0.00,90.00,0.00,NULL,NULL,NULL),(52,47,'DINHEIRO','2017-10-21',50.00,1,0,0.00,50.00,0.00,NULL,NULL,NULL),(53,47,'DINHEIRO','2017-11-05',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(54,48,'DINHEIRO','2017-10-21',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(55,48,'DINHEIRO','2017-11-05',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(56,49,'DINHEIRO','2017-10-20',1600.00,1,0,0.00,1600.00,0.00,NULL,NULL,NULL),(57,49,'CREDITO','2017-10-20',1550.00,1,2,809.96,1463.35,86.65,'2017-10-21',NULL,NULL),(58,50,'DINHEIRO','2017-11-02',3000.00,1,0,0.00,3000.00,0.00,NULL,NULL,NULL),(59,51,'CREDITO','2017-11-03',150.00,1,1,150.00,142.51,7.49,'2017-11-04',NULL,NULL),(60,52,'DINHEIRO','2017-11-06',30.00,1,0,0.00,30.00,0.00,NULL,NULL,NULL),(61,53,'DINHEIRO','2017-11-06',280.00,1,0,0.00,280.00,0.00,NULL,NULL,NULL),(62,54,'DINHEIRO','2017-11-07',1000.00,1,0,0.00,1000.00,0.00,NULL,NULL,NULL),(63,54,'DINHEIRO','2017-12-01',1200.00,1,0,0.00,1200.00,0.00,NULL,NULL,NULL),(64,54,'DINHEIRO','2017-12-04',1000.00,1,0,0.00,1000.00,-200.00,NULL,NULL,NULL),(65,55,'DINHEIRO','2017-11-07',350.00,1,0,0.00,350.00,0.00,NULL,NULL,NULL),(66,56,'DINHEIRO','2017-11-07',500.00,1,0,0.00,500.00,0.00,NULL,NULL,NULL),(67,56,'DINHEIRO','2017-12-15',400.00,1,0,0.00,400.00,-200.00,NULL,NULL,NULL),(68,57,'DINHEIRO','2017-12-10',120.00,1,0,0.00,120.00,0.00,NULL,NULL,NULL),(69,42,'DINHEIRO','2017-11-28',2100.00,1,0,0.00,2100.00,-50.00,NULL,NULL,NULL),(70,58,'DINHEIRO','2017-12-20',53.00,1,0,0.00,53.00,0.00,NULL,NULL,NULL),(71,58,'DINHEIRO','2018-01-10',53.00,0,0,0.00,53.00,0.00,NULL,NULL,NULL),(72,58,'DINHEIRO','2018-02-10',54.00,0,0,0.00,54.00,0.00,NULL,NULL,NULL),(73,59,'DINHEIRO','2017-11-08',90.00,1,0,0.00,90.00,0.00,NULL,NULL,NULL),(74,59,'DINHEIRO','2017-12-05',90.00,1,0,0.00,90.00,0.00,NULL,NULL,NULL),(75,60,'DINHEIRO','2017-11-10',70.00,1,0,0.00,70.00,0.00,NULL,NULL,NULL),(76,61,'DINHEIRO','2017-11-13',112.00,1,0,0.00,112.00,0.00,NULL,NULL,NULL),(77,61,'DINHEIRO','2017-12-15',120.00,1,0,0.00,120.00,8.00,NULL,NULL,NULL),(78,61,'DINHEIRO','2018-01-09',120.00,1,0,0.00,120.00,8.00,NULL,NULL,NULL),(79,61,'DINHEIRO','2018-02-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(80,61,'DINHEIRO','2018-03-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(81,61,'DINHEIRO','2018-04-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(82,61,'DINHEIRO','2018-05-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(83,61,'DINHEIRO','2018-06-09',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(84,61,'DINHEIRO','2018-07-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(85,61,'DINHEIRO','2018-08-10',48.00,0,0,0.00,48.00,-64.00,NULL,NULL,NULL),(86,62,'DINHEIRO','2017-11-13',140.00,1,0,0.00,140.00,0.00,NULL,NULL,NULL),(87,63,'CREDITO','2017-11-13',1450.00,1,10,169.90,1368.94,81.06,'2017-11-14',NULL,NULL),(88,64,'CHEQUE','2017-11-11',2283.33,1,0,0.00,2283.33,0.00,NULL,'2017-11-12',7),(89,64,'CHEQUE','2017-12-11',2283.33,1,0,0.00,2283.33,0.00,NULL,'2017-12-12',7),(90,64,'CHEQUE','2018-01-11',2283.33,1,0,0.00,2283.33,0.00,NULL,'2018-01-15',7),(91,65,'CREDITO','2017-11-12',160.00,1,2,83.61,151.06,8.94,'2017-12-12',NULL,NULL),(92,66,'DINHEIRO','2017-11-29',150.00,1,0,0.00,150.00,-150.00,NULL,NULL,NULL),(93,63,'CREDITO','2017-11-15',1400.00,1,10,164.04,1321.74,78.26,'2017-11-16',NULL,NULL),(94,67,'DINHEIRO','2017-11-18',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(95,68,'DINHEIRO','2017-12-19',70.00,1,0,0.00,70.00,5.00,NULL,NULL,NULL),(96,69,'DINHEIRO','2017-11-22',100.00,1,0,0.00,100.00,-30.00,NULL,NULL,NULL),(97,70,'DINHEIRO','2017-12-01',160.00,1,0,0.00,160.00,-310.00,NULL,NULL,NULL),(98,71,'DINHEIRO','2017-12-10',195.00,1,0,0.00,195.00,195.00,NULL,NULL,NULL),(99,72,'DINHEIRO','2017-11-02',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(100,73,'DINHEIRO','2017-11-21',60.00,1,0,0.00,60.00,60.00,NULL,NULL,NULL),(101,74,'DINHEIRO','2017-11-24',75.00,1,0,0.00,75.00,75.00,NULL,NULL,NULL),(102,74,'DINHEIRO','2018-01-02',75.00,1,0,0.00,75.00,75.00,NULL,NULL,NULL),(103,36,'DINHEIRO','2017-11-24',50.00,1,0,0.00,50.00,50.00,NULL,NULL,NULL),(104,75,'DINHEIRO','2017-11-26',100.00,1,0,0.00,100.00,100.00,NULL,NULL,NULL),(105,76,'DINHEIRO','2017-11-26',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(106,77,'DINHEIRO','2017-11-27',170.00,1,0,0.00,170.00,170.00,NULL,NULL,NULL),(107,78,'DINHEIRO','2017-12-10',110.00,1,0,0.00,110.00,110.00,NULL,NULL,NULL),(108,78,'DINHEIRO','2018-01-12',50.00,0,0,0.00,50.00,50.00,NULL,NULL,NULL),(109,79,'DINHEIRO','2017-12-14',70.00,1,0,0.00,70.00,70.00,NULL,NULL,NULL),(110,80,'DINHEIRO','2018-01-08',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(111,81,'DINHEIRO','2017-12-01',170.00,1,0,0.00,170.00,170.00,NULL,NULL,NULL),(112,82,'CREDITO','2017-11-27',150.00,1,1,150.00,142.51,7.49,'2017-12-27',NULL,NULL),(113,66,'DINHEIRO','2017-12-07',150.00,1,0,0.00,150.00,150.00,NULL,NULL,NULL),(114,83,'DINHEIRO','2017-11-29',50.00,1,0,0.00,50.00,50.00,NULL,NULL,NULL),(115,84,'DINHEIRO','2017-12-28',1200.00,1,0,0.00,1200.00,1200.00,NULL,NULL,NULL),(116,85,'DINHEIRO','2017-11-30',125.00,1,0,0.00,125.00,125.00,NULL,NULL,NULL),(117,86,'DINHEIRO','2017-11-30',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(118,87,'DINHEIRO','2017-12-10',60.00,1,0,0.00,60.00,60.00,NULL,NULL,NULL),(119,88,'DINHEIRO','2017-12-11',35.00,1,0,0.00,35.00,35.00,NULL,NULL,NULL),(120,70,'DINHEIRO','2017-12-20',160.00,1,0,0.00,160.00,-150.00,NULL,NULL,NULL),(121,89,'DINHEIRO','2017-12-02',60.00,1,0,0.00,60.00,60.00,NULL,NULL,NULL),(122,90,'DINHEIRO','2017-12-02',450.00,1,0,0.00,450.00,450.00,NULL,NULL,NULL),(123,54,'DINHEIRO','2017-12-05',200.00,1,0,0.00,200.00,200.00,NULL,NULL,NULL),(124,91,'DINHEIRO','2017-12-04',150.00,1,0,0.00,150.00,150.00,NULL,NULL,NULL),(125,92,'DINHEIRO','2017-12-05',410.00,1,0,0.00,410.00,410.00,NULL,NULL,NULL),(126,93,'DINHEIRO','2017-12-09',390.00,1,0,0.00,390.00,390.00,NULL,NULL,NULL),(127,94,'CREDITO','2017-12-09',320.00,1,2,167.22,302.11,17.89,'2017-12-10',NULL,NULL),(128,95,'DINHEIRO','2018-01-27',2800.00,0,0,0.00,2800.00,500.00,NULL,NULL,NULL),(129,95,'DINHEIRO','2018-02-27',2800.00,0,0,0.00,2800.00,2800.00,NULL,NULL,NULL),(130,96,'DINHEIRO','2017-12-11',400.00,1,0,0.00,400.00,400.00,NULL,NULL,NULL),(131,96,'DINHEIRO','2018-01-09',170.00,1,0,0.00,170.00,-680.00,NULL,NULL,NULL),(132,97,'DINHEIRO','2017-12-12',200.00,1,0,0.00,200.00,200.00,NULL,NULL,NULL),(134,99,'DINHEIRO','2017-12-15',30.00,1,0,0.00,30.00,30.00,NULL,NULL,NULL),(135,56,'DINHEIRO','2018-01-08',200.00,1,0,0.00,200.00,200.00,NULL,NULL,NULL),(136,100,'DINHEIRO','2017-12-18',2400.00,1,0,0.00,2400.00,2400.00,NULL,NULL,NULL),(137,101,'DINHEIRO','2017-12-18',300.00,1,0,0.00,300.00,300.00,NULL,NULL,NULL),(138,101,'DINHEIRO','2018-01-10',300.00,1,0,0.00,300.00,300.00,NULL,NULL,NULL),(139,102,'DINHEIRO','2017-12-18',350.00,1,0,0.00,350.00,350.00,NULL,NULL,NULL),(140,102,'DINHEIRO','2017-12-28',1050.00,1,0,0.00,1050.00,1050.00,NULL,NULL,NULL),(141,103,'DINHEIRO','2017-12-17',150.00,1,0,0.00,150.00,150.00,NULL,NULL,NULL),(142,104,'DINHEIRO','2017-12-15',70.00,1,0,0.00,70.00,70.00,NULL,NULL,NULL),(143,105,'DINHEIRO','2017-12-19',130.00,1,0,0.00,130.00,130.00,NULL,NULL,NULL),(144,106,'DINHEIRO','2018-01-08',140.00,1,0,0.00,140.00,40.00,NULL,NULL,NULL),(145,106,'DINHEIRO','2018-02-08',140.00,0,0,0.00,140.00,-10.00,NULL,NULL,NULL),(146,107,'DINHEIRO','2018-01-09',130.00,1,0,0.00,130.00,130.00,NULL,NULL,NULL),(147,108,'DINHEIRO','2017-12-18',30.00,1,0,0.00,30.00,30.00,NULL,NULL,NULL),(148,109,'DINHEIRO','2018-01-10',65.00,1,0,0.00,65.00,65.00,NULL,NULL,NULL),(149,110,'DINHEIRO','2017-12-18',240.00,1,0,0.00,240.00,240.00,NULL,NULL,NULL),(150,111,'DINHEIRO','2017-12-20',1100.00,1,0,0.00,1100.00,100.00,NULL,NULL,NULL),(152,112,'DINHEIRO','2017-12-19',70.00,1,0,0.00,70.00,70.00,NULL,NULL,NULL),(154,111,'CREDITO','2017-12-20',1550.00,1,3,547.88,1463.35,86.65,'2017-12-21',NULL,NULL),(155,111,'CREDITO','2017-12-20',1600.00,1,5,349.28,1510.56,89.44,'2017-12-21',NULL,NULL),(156,70,'DINHEIRO','2018-01-10',150.00,1,0,0.00,150.00,40.00,NULL,NULL,NULL),(157,113,'DINHEIRO','2017-12-21',1925.00,1,0,0.00,1925.00,-75.00,NULL,NULL,NULL),(158,113,'DINHEIRO','2018-01-15',1925.00,0,0,0.00,1925.00,75.00,NULL,NULL,NULL),(159,114,'DINHEIRO','2018-01-13',80.00,1,0,0.00,80.00,-70.00,NULL,NULL,7),(160,115,'DINHEIRO','2018-01-10',120.00,0,0,0.00,120.00,120.00,NULL,NULL,NULL),(161,116,'DINHEIRO','2018-01-13',40.00,1,0,0.00,40.00,-25.00,NULL,NULL,7),(162,117,'DINHEIRO','2018-01-08',38.00,1,0,0.00,38.00,38.00,NULL,NULL,NULL),(163,118,'DINHEIRO','2017-12-27',50.00,1,0,0.00,50.00,50.00,NULL,NULL,NULL),(164,119,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(165,120,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(166,121,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(167,122,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(168,123,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(169,96,'DINHEIRO','2018-02-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(170,96,'DINHEIRO','2018-03-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(171,96,'DINHEIRO','2018-04-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(172,96,'DINHEIRO','2018-05-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(173,124,'DINHEIRO','2018-01-10',80.00,1,0,0.00,80.00,80.00,NULL,NULL,NULL),(174,124,'DINHEIRO','2018-02-10',70.00,0,0,0.00,70.00,70.00,NULL,NULL,NULL),(175,125,'DINHEIRO','2018-01-13',100.00,1,0,0.00,100.00,-5.00,NULL,NULL,7),(176,125,'DINHEIRO','2018-02-10',110.00,0,0,0.00,110.00,5.00,NULL,NULL,7),(177,126,'DINHEIRO','2018-02-10',95.00,0,0,0.00,95.00,95.00,NULL,NULL,NULL),(178,126,'DINHEIRO','2018-03-10',95.00,0,0,0.00,95.00,95.00,NULL,NULL,NULL),(179,127,'DINHEIRO','2018-01-10',1000.00,1,0,0.00,1000.00,1000.00,NULL,NULL,NULL),(180,128,'DINHEIRO','2018-01-10',400.00,1,0,0.00,400.00,400.00,NULL,NULL,NULL),(181,127,'DINHEIRO','2018-02-10',1850.00,0,0,0.00,1850.00,850.00,NULL,NULL,NULL),(182,127,'DINHEIRO','2018-02-28',1000.00,0,0,0.00,1000.00,-850.00,NULL,NULL,NULL),(183,129,'DINHEIRO','2018-01-15',60.00,0,0,0.00,60.00,60.00,NULL,NULL,NULL),(184,130,'DINHEIRO','2018-01-15',120.00,0,0,0.00,120.00,120.00,NULL,NULL,NULL),(185,131,'DINHEIRO','2018-02-10',155.00,0,0,0.00,155.00,155.00,NULL,NULL,NULL),(186,131,'DINHEIRO','2018-03-10',150.00,0,0,0.00,150.00,150.00,NULL,NULL,NULL),(187,131,'DINHEIRO','2018-04-10',150.00,0,0,0.00,150.00,150.00,NULL,NULL,NULL),(188,132,'DINHEIRO','2018-01-20',75.00,0,0,0.00,75.00,75.00,NULL,NULL,1),(189,132,'DINHEIRO','2018-02-20',75.00,0,0,0.00,75.00,75.00,NULL,NULL,NULL),(190,114,'DINHEIRO','2018-02-10',70.00,0,0,0.00,70.00,70.00,NULL,NULL,7),(191,116,'DINHEIRO','2018-02-10',25.00,0,0,0.00,25.00,25.00,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `idPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `tipo` varchar(15) NOT NULL,
  `dataCriacao` date DEFAULT NULL,
  `dataAlteracao` date DEFAULT NULL,
  `enderecoComercial` varchar(200) DEFAULT NULL,
  `enderecoResidencial` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `idPessoa_UNIQUE` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (3,'Thiago Araujo Berbet','SOCIO','006.288.131-04','1983-08-19','(67) 99106-0530','thiagoaraujoberbet@gmail.com','FUNCIONARIO','2017-09-02',NULL,NULL,NULL),(4,'Luana Alves Teixeira','SOCIO',NULL,'1989-01-25','(67) 99307-8871','luanaalves144@hotmail.com','FUNCIONARIO','2017-09-02',NULL,NULL,NULL),(6,'Thays Brites',NULL,NULL,'1996-07-21','','thaysbrites@hotmail.com','CLIENTE','2017-09-04','2017-11-06',NULL,NULL),(7,'Juliana Fonseca',NULL,NULL,'1989-04-11','(67) 99228-8607','julyranan@hotmail.com','CLIENTE','2017-09-14','2017-11-07',NULL,NULL),(8,'Juliane',NULL,NULL,NULL,'','','CLIENTE','2017-09-20',NULL,NULL,NULL),(9,'Lays Ortiz',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL),(10,'Diogo Ortiz',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL),(11,'Cida',NULL,NULL,NULL,'(67) 99912-8142','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL),(12,'Bete',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-10-04',NULL,NULL),(13,'Franciele',NULL,NULL,'1990-05-17','(67) 99185-4818','','CLIENTE','2017-09-20','2017-11-07',NULL,NULL),(14,'Thainara',NULL,NULL,NULL,'','','CLIENTE','2017-09-24',NULL,NULL,NULL),(15,'Matheus',NULL,NULL,NULL,'(67) 99100-9715','','CLIENTE','2017-10-02',NULL,NULL,NULL),(16,'Helio Makoto',NULL,NULL,'1988-05-22','(67) 99865-4475','helio.kanno@gmail.com','CLIENTE','2017-10-02','2017-11-07',NULL,NULL),(17,'Lorena Alves',NULL,NULL,'2005-01-21','(67) 99325-2324','flamengo_loris2012@hotmail.com','CLIENTE','2017-10-02','2017-11-06',NULL,NULL),(18,'PatrÃ£o da Izabel',NULL,NULL,NULL,'','','CLIENTE','2017-10-02',NULL,NULL,NULL),(19,'Carinna Fuzitani',NULL,NULL,NULL,'(67) 99283-7125','','CLIENTE','2017-10-02','2017-12-15','',''),(20,'Soely',NULL,NULL,NULL,'','','CLIENTE','2017-10-02','2017-11-06',NULL,NULL),(21,'Flip4 Julio Barone 607',NULL,NULL,NULL,'','','CLIENTE','2017-10-02',NULL,NULL,NULL),(22,'Fernando Araujo Berbet',NULL,NULL,'1989-12-24','(67) 99214-2290','fernandoberbet@gmail.com','CLIENTE','2017-10-04','2017-12-14','','Rua Brigadeiro Thiago, 2212 - Bairro UniversitÃ¡rio - Campo Grande/MS'),(23,'Camila Fuzitani',NULL,NULL,NULL,'(97) 99144-1948','','CLIENTE','2017-10-07','2017-11-04',NULL,NULL),(24,'Jean Rossi',NULL,NULL,'1989-08-14','(67) 99201-8252','','CLIENTE','2017-10-12','2017-11-07',NULL,NULL),(25,'Rose',NULL,NULL,NULL,'','','CLIENTE','2017-10-15',NULL,NULL,NULL),(26,'Diogo Mishima',NULL,NULL,NULL,'(67) 98121-2244','','CLIENTE','2017-10-16','2017-11-06',NULL,NULL),(27,'Thiago',NULL,NULL,NULL,'(67) 99123-7830','','CLIENTE','2017-10-18','2017-11-07',NULL,NULL),(28,'Michelle Bop',NULL,NULL,NULL,'','','CLIENTE','2017-10-22','2017-11-07',NULL,NULL),(29,'Fran',NULL,NULL,NULL,'','','CLIENTE','2017-10-22',NULL,NULL,NULL),(30,'Sandra Berbert',NULL,NULL,'1962-11-29','(67) 99238-1036','sandra.berbert@hotmail.com','CLIENTE','2017-11-06','2017-11-07',NULL,NULL),(31,'Kelly',NULL,NULL,NULL,'','','CLIENTE','2017-11-06',NULL,NULL,NULL),(32,'Jeanny Nakazato',NULL,NULL,NULL,'','','CLIENTE','2017-11-06','2017-11-07',NULL,NULL),(33,'Izabel Alves',NULL,NULL,'1984-01-13','(67) 98475-7342','','FUNCIONARIO','2017-11-06',NULL,NULL,NULL),(34,'Michelle Scariote',NULL,NULL,NULL,'(67) 99211-3633','','CLIENTE','2017-11-07','2017-11-07',NULL,NULL),(35,'Wellinton (Vida Lar)',NULL,NULL,NULL,'','','CLIENTE','2017-11-07','2017-11-27',NULL,NULL),(36,'Cezar Duarte',NULL,NULL,'1988-02-28','(67) 99261-7085','cezarcabelera@hotmail.com','CLIENTE','2017-11-07',NULL,NULL,NULL),(37,'CecÃ­lia',NULL,NULL,NULL,'(67) 99903-8533','','CLIENTE','2017-11-08','2017-11-08',NULL,NULL),(38,'Thaynara Recaldes',NULL,NULL,NULL,'(67) 99103-6357','','CLIENTE','2017-11-13',NULL,NULL,NULL),(39,'LaÃ­s Aquino',NULL,NULL,NULL,'(67) 99268-3642','','CLIENTE','2017-11-13',NULL,NULL,NULL),(40,'Ivan Rossi',NULL,NULL,NULL,'','','CLIENTE','2017-11-13',NULL,NULL,NULL),(41,'Rafael',NULL,NULL,NULL,'','','CLIENTE','2017-11-13',NULL,NULL,NULL),(42,'Rafael (Jbl GO)',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(43,'Suelem',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(44,'Welligton Leonando',NULL,NULL,NULL,'','','CLIENTE','2017-11-20','2017-11-27',NULL,NULL),(45,'Camila',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(46,'DoaÃ§Ã£o/Presente/Sorteio',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(47,'Beatriz (Estacionamento)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(48,'Marcos (Bone Preto)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(49,'Thiago Moraes',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(50,'Maria Helena Souza',NULL,NULL,NULL,'(31) 99332-8385','','CLIENTE','2017-11-27',NULL,NULL,NULL),(51,'Michele (Vida Lar)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(52,'Karine (El Kadri)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(53,'Soila',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(54,'Larissa',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(55,'Felipe',NULL,NULL,NULL,'','','CLIENTE','2017-11-30',NULL,NULL,NULL),(56,'Marcio',NULL,NULL,NULL,'','','CLIENTE','2017-12-01','2017-12-01',NULL,NULL),(57,'Franciele (PrÃ©dio Vivo)',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL),(58,'Daniele (Vida Lar)',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL),(59,'Eduardo',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL),(60,'Daphyni',NULL,NULL,NULL,'(67) 98112-6072','','CLIENTE','2017-12-01',NULL,NULL,NULL),(61,'Cristiane',NULL,NULL,NULL,'','','CLIENTE','2017-12-02',NULL,NULL,NULL),(62,'Pedro Moura FÃ© Elias',NULL,NULL,NULL,'(67) 99988-6232','pedromourafeelias@yahoo.com.br','CLIENTE','2017-12-04',NULL,NULL,NULL),(63,'Mirian',NULL,NULL,NULL,'','','CLIENTE','2017-12-04',NULL,NULL,NULL),(64,'Tatiane Sanguina',NULL,NULL,NULL,'','','CLIENTE','2017-12-04',NULL,NULL,NULL),(65,'Gabriel (Cunhado Weverton)',NULL,NULL,NULL,'','','CLIENTE','2017-12-09',NULL,NULL,NULL),(66,'Bianca',NULL,NULL,NULL,'','','CLIENTE','2017-12-11',NULL,NULL,NULL),(67,'Matheus Vilela Fernandes',NULL,NULL,NULL,'(67) 98149-8777','','CLIENTE','2017-12-15',NULL,'',''),(68,'ClÃ¡udia Suchy',NULL,NULL,NULL,'','','CLIENTE','2017-12-18','2017-12-18','',''),(69,'Angelica',NULL,NULL,NULL,'(67) 99207-6479','','CLIENTE','2017-12-18',NULL,'','Rua Brigadeiro Thiago, 603 - Betaville - Campo Grande/MS'),(70,'JosÃ© (Ernesto Borges)',NULL,NULL,NULL,'','','CLIENTE','2017-12-18',NULL,'',''),(71,'Francyelle Gattes',NULL,NULL,NULL,'(67) 99271-8118','','CLIENTE','2017-12-18',NULL,'',''),(72,'Diogo (STI)',NULL,NULL,NULL,'(67) 99349-8391','','CLIENTE','2017-12-18',NULL,'',''),(73,'Maria',NULL,NULL,NULL,'(67) 99918-2337','','CLIENTE','2017-12-19','2017-12-19','',''),(74,'Cliente',NULL,NULL,NULL,'','','CLIENTE','2017-12-20',NULL,'',''),(75,'Maycon Claro',NULL,NULL,NULL,'(67) 99270-6200','','CLIENTE','2017-12-21',NULL,'',''),(76,'Camila Xavier',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'',''),(77,'Leidy',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'',''),(78,'Edna',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'',''),(79,'Suelen Benites',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'',''),(80,'Valentim',NULL,NULL,NULL,'(67) 99632-9520','','CLIENTE','2018-01-10',NULL,'',''),(81,'Larissa (Shopping)',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'',''),(82,'Mara (Nega)',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'','');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(4000) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `dataCriacao` date DEFAULT NULL,
  `dataAlteracao` date DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `id_UNIQUE` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (6,'Caixa de Som','Criado para os apaixonados por mÃºsica e praticidade, a JBL GO transmite mÃºsica via Bluetooth a partir de dispositivos mÃ³veis. Ã‰ alimentado por uma bateria recarregÃ¡vel com atÃ© 5 horas de reproduÃ§Ã£o, e viva-voz com cancelamento de ruÃ­do, permitindo que vocÃª atenda chamadas sem desligar sua caixa de som.','ELETRONICOS','JBL','GO','2017-08-22','2017-09-18'),(7,'Caixa de Som','O JBL Flip 4 Ã© a Ãºltima geraÃ§Ã£o da premiada sÃ©rie Flip, uma caixa de som portÃ¡til com Bluetooth que oferece um som estÃ©reo surpreendentemente poderoso. Esta caixa de som compacta Ã© alimentada por uma bateria de Ã­ons de lÃ­tio recarregÃ¡vel de 3.000 mAh, que oferece 12 horas contÃ­nuas de Ã¡udio de alta qualidade. ','ELETRONICOS','JBL','FLIP4','2017-08-22','2017-08-22'),(8,'Caixa de Som','A Caixa Bluetooth Ã  prova dÂ´agua Charge 3 agora vem com carregador portÃ¡til e deixa o som ainda mais potente. Escute suas mÃºsicas sem fios, por muito mais tempo e ainda leve sua festa para todo o lugar. GraÃ§as ao seu design Ã  prova dÂ´Ã¡gua, tecido durÃ¡vel e carcaÃ§a resistente, ela pode atÃ© cair na piscina. ','ELETRONICOS','JBL','CHARGE3','2017-08-22','2017-08-22'),(9,'Perfume Masculino','O Perfume Ferrari Masculino possui aroma cÃ­trico amadeirado, ideal para homens misteriosos e sensuais. Em sua fragrÃ¢ncia, notas que combinam bergamota, maÃ§Ã£, ameixa, canela, jasmim, rosa, cedro e baunilha.','COSMETICOS','Ferrari','Black 125ml (Eau de Toilette)','2017-08-22','2017-11-27'),(10,'Fone de Ouvido Wireless','Possui entrada auxiliar onde vocÃª pode ouvir musicas de celulares que nÃ£o tem a tecnologia bluetooth. O fone de ouvido Ã© carregado atravÃ©s da porta USB do seu computador ou carregador de 5v (nÃ£o incluÃ­do). Ã‰ possÃ­vel receber e fazer chamadas pelo fone, sem tirar ele da orelha, possui microfone para que possa ouvir suas chamadas com nitidez.','ELETRONICOS','Ewtto','ET-A4260B','2017-08-22',NULL),(11,'Chromecast','O Chromecast Ã© um dispositivo de streaming de mÃ­dia que Ã© conectado Ã  porta HDMI da sua TV. Use o dispositivo mÃ³vel e a TV que vocÃª jÃ¡ possui para transmitir seus programas de TV, filmes, mÃºsicas, esportes e jogos favoritos e muito mais. O Chromecast funciona com iPhoneÂ®, iPadÂ®, smartphones e tablets Android, laptops MacÂ® e WindowsÂ® e Chromebooks.','ELETRONICOS','Google','2','2017-08-22',NULL),(12,'Perfume Feminino','Tommy Girl Ã© um bouquet de puro frescor, um mix de flores que associa a refrescÃ¢ncia da camÃ©lia com a luminosidade da flor de maÃ§Ã£, e acordes brilhantes da flor do cassis. Uma fragrÃ¢ncia energizante com toques cÃ­tricos da tangerina, de madeiras frescas e uma nuance de hortelÃ£ verde. Uma mistura envolvente de madressilva e pÃ©talas de violeta, que aliadas ao jasmim do deserto, o lÃ­rio, rosas frescas, pÃ©talas de magnÃ³lia, proporcionam uma inebriante sensaÃ§Ã£o, deixando para o fundo da composiÃ§Ã£o, uma combinaÃ§Ã£o de cedro, sÃ¢ndalo, e magnÃ³lias selvagens.','COSMETICOS','Tommy','Girl 100ml','2017-08-22','2017-09-14'),(13,'Tapete','Tapete','CASA','Tapete','Tapete 3x2','2017-08-22','2017-09-24'),(14,'Smartphone','Ele jÃ¡ vem com o novo iOS 10, o sistema operacional mÃ³vel mais avanÃ§ado do mundo que deixa seu aparelho ainda mais pessoal, de uma forma poderosa. A interface Ã© bonita e fÃ¡cil de usar. SugestÃµes inteligentes aparecem quando vocÃª mais precisa e as tecnologias avanÃ§adas protegem sua privacidade e seguranÃ§a. AlÃ©m disso, conta com a excelente cÃ¢mera iSight de 12MP, FaceTime de 7MP e grava vÃ­deos com tecnologia 4K. Seu Chip A10 Fusion com arquitetura de 64 bits e coprocessador de movimento M10 integrado Ã© o mais poderoso atÃ© hoje em um smartphone. Com ele, o iPhone 7 Ã© mais rÃ¡pido do que qualquer iPhone â€“ e mais eficiente. Isso porque a arquitetura totalmente nova aumenta o processamento quando vocÃª precisa e diminui quando nÃ£o precisa, oferecendo a maior duraÃ§Ã£o de bateria em um iPhone e o dobro da velocidade do iPhone 6.','ELETRONICOS','Iphone','7 32GB','2017-08-22',NULL),(15,'Smartphone','...','ELETRONICOS','Iphone','6 32GB','2017-08-22',NULL),(16,'Smartphone','...','ELETRONICOS','Iphone','6s 32GB','2017-08-22',NULL),(17,'Tablet','...','ELETRONICOS','Ipad','32GB Wi-Fi','2017-08-22','2017-09-22'),(18,'Smartphone','...','ELETRONICOS','Iphone','7 Plus 32GB','2017-08-22',NULL),(19,'RelÃ³gio Masculino','..','JOIASERELOGIOS','Curren','G3-18375 D-1761','2017-08-22','2017-12-11'),(20,'Carregador PortÃ¡til','Capacidade: 5600 mAh\r\nEntrada: DC 5V/1A\r\nSaida: DC 5V/2.1A\r\nInterface: 1 Micro USB entrada e 2 USB saÃ­da\r\nInclui: Carregador portÃ¡til, cabo USB, manual\r\nAdaptÃ¡vel para quase todos os smartfones, tablet, PC, GPS ou outros produtos digitais.','ELETRONICOS','Ecopower','EP-C813 5600mAh','2017-08-22','2017-11-09'),(21,'Carregador PortÃ¡til','...','ELETRONICOS','Ecopower','EP-C883 9000mAh','2017-08-22',NULL),(22,'MÃ¡scara Hidratante','A MÃ¡scara Ultra Hidratante Desmaia Cabelo da Forever Liss possui aÃ§Ã£o instantÃ¢nea Anti Volume e Frizz, super eficaz que age suavizando os fios, deixando os super sedosos, macios e com brilho. A MÃ¡scara Desmaia Cabelo Forever Liss possui que recupera os fios agredidos pela quÃ­mica realizando uma hidrataÃ§Ã£o profunda nos fios garantindo assim a reduÃ§Ã£o do volume e alinhamento capilar. Ã‰ um produto sem quÃ­mica que promove sensaÃ§Ã£o de cabelos lisos, pois alinha a fibra capilar.\r\n\r\nINDICAÃ‡ÃƒO:\r\nTodos os tipos de cabelo, cabelos volumosos, cabelos com frizz. Pode ser usado por gestantes e lactantes.\r\n\r\nCOMPOSIÃ‡ÃƒO:\r\nKeratina Brasileira (Origem Vegetal, Milho e Soja), D\'Pantenol, ColÃ¡geno e Sinergia de AminoÃ¡cidos. \r\n\r\nMODO DE USAR:\r\nAplique a MÃ¡scara Desmaia Cabelo Forever Liss com os cabelos Ãºmidos em toda Ã¡rea do fio. Pentear com um pente atÃ© que perceba uniformidade na aplicaÃ§Ã£o. Deixe em repouso por 5 minutos. EnxÃ¡gue normalmente e finalize como desejar.\r\n\r\nRESULTADOS:\r\n- Efeito ReduÃ§Ã£o de Volume;\r\n- Anti Frizz;\r\n- Cabelos Alinhados;\r\n- Maciez Extrema;\r\n- Brilho Intenso;\r\n- Sedosidade;\r\n- Alinhamento da Fibra Capilar;\r\n- SensaÃ§Ã£o de Leveza Instantaneamente nos Fios.','COSMETICOS','Desmaia Cabelo','350g','2017-08-22','2017-11-03'),(23,'Perfume Feminino','Calvin Klein inicia uma nova era na perfumaria! CKIN2U foi especialmente elaborado para uma geraÃ§Ã£o que se define pela troca de experiÃªncias por meio de uma rede de comunicaÃ§Ã£o virtual. A qualquer hora, em qualquer lugar e com qualquer pessoa... Jovens antenados, agitados e tecnosexuais!\r\nPela primeira vez, uma fragrÃ¢ncia especial de Calvin Klein nÃ£o Ã© apenas um fragmento. As notas especiais do perfume capturam a seduÃ§Ã£o espontÃ¢nea de uma geraÃ§Ã£o fascinada por tecnologia. Esta geraÃ§Ã£o que tem habilidade para conectar-se a qualquer hora, a qualquer momento, ao redor do mundo, com a possibilidade de aflorar emoÃ§Ãµes revolucionÃ¡rias.\r\nA mulher de CKIN2U Ã© uma jovem espontÃ¢nea e sedutora. CKIN2U her tem a saÃ­da picante da grapefruit e bergamota da SicÃ­lia, seguidas pela orquÃ­dea doce cactus branco e cedra vermelho. A base em Ã¢mbar neÃ³n com souffle de baunilha asseguram a seduÃ§Ã£o e a satisfaÃ§Ã£o imediata.','COSMETICOS','Calvin Klein','CKin2u 100ml','2017-08-22',NULL),(24,'Garrafa TÃ©rmica','...','CASA','Travel & Leisure','5,8L','2017-08-22','2017-09-22'),(25,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Temptation 200ml','2017-08-22',NULL),(26,'Smartphone','...','ELETRONICOS','Iphone','7 Plus 128GB','2017-08-22',NULL),(27,'Smartphone','...','ELETRONICOS','Iphone','7 Red 128GB','2017-08-22',NULL),(28,'Smartphone','...','ELETRONICOS','Iphone','7 128 GB','2017-08-22',NULL),(29,'HD SSD','...','INFORMATICA','Sandisk','240GB','2017-08-22',NULL),(30,'IPTV','...','ELETRONICOS','HTV','5','2017-08-22',NULL),(31,'Creme Capilar','Leave-in com 10 benefÃ­cios reais em um sÃ³ produto, para todos os tipos de cabelo. O Revlon Professional Uniq One cuida, trata, protege, controla, dentre outras aÃ§Ãµes. \r\nVencedor do PrÃªmio Especial InovaÃ§Ã£o da revista Nova/Cosmopolitan, ele Ã© realmente uma revoluÃ§Ã£o em matÃ©ria de cuidados para o cabelo.\r\nO Uniq One, da Revlon Professional, une 10 benefÃ­cios de tratamento e finalizaÃ§Ã£o em um sÃ³ produto:  \r\n1. Repara os fios ressecados e danificados: possui agentes hidratantes e de condicionamento que melhoram a textura e a maleabilidade dos fios.  \r\n 2. Controla o frizz: com o tempo estÃ¡ seco ou Ãºmido, protege das agressÃµes ambientais e evita que o cabelo arrepie.  \r\n 3. Protege do calor do secador e da chapinha: forma uma pelÃ­cula ao redor da fibra capilar, protegendo ela das altas temperaturas.  \r\n4. Suaviza e deixa um toque acetinado: possui agentes condicionantes poderosos, amaciando e controlando.    \r\n5. Protege do sol e mantÃ©m a cor: com filtros UVA e UVB, extremamente leves, protege sem deixar o cabelo pesado. Evita a oxidaÃ§Ã£o causada pelo sol que faz cor desbotar.  \r\n6. Facilita a escovaÃ§Ã£o e o uso da prancha: com o cabelo mais suave e macio, ele facilita o deslizar a prancha e escovar.  \r\n7. DesembaraÃ§a: deixa os fios soltos e desembaraÃ§ados.  \r\n8. MantÃ©m o penteado por mais tempo.  \r\n9. Previne as pontas duplas.  \r\n10. Controla o volume natural dos cabelos.\r\nConselho de AplicaÃ§Ã£o\r\nAplique no cabelo Ãºmido, como um spray, borrifando a 20cm de distÃ¢ncia; ou aplique no cabelo seco, borrifando na mÃ£o e espalhando, como um creme. Cabelo curto: 6-8 doses Cabelo mÃ©dio: 7-12 doses Cabelo longo: 10-15 doses.\r\nResultado:\r\nSeu cabelo vai ficar o mÃ¡ximo: macio, protegido, saudÃ¡vel, sem pontas duplas, sem frizz, com cor intensa, leve, brilhante e com um toque delicioso.\r\n','COSMETICOS','Revlon','Uniq One','2017-08-22','2017-11-09'),(32,'Creme Hidratante','...','COSMETICOS','Victoriaâ€™s Secret','Pure Seduction 236ml','2017-08-22',NULL),(33,'Creme Hidratante ','...','COSMETICOS','Victoriaâ€™s Secret','Coconut Passion 236ml','2017-08-22',NULL),(34,'Perfume Feminino ','...','COSMETICOS','Calvin Klein','CKin2u 150ml','2017-08-22',NULL),(35,'Carregador Portatil','...','ELETRONICOS','EcoPower','EP-C808 5200mAh','2017-08-22',NULL),(36,'Tablet','...','ELETRONICOS','Samsung','Galaxy Tab3 Lite 8GB (SM-T113)','2017-08-22','2017-10-22'),(37,'Cinta','Confira a Cinta Abdominal Ativadora em Neoprene Sweet Sweat!\r\nTenha um auxÃ­lio na melhora de sua postura e maximize os resultados do Sweet Sweat com essa Cinta Abdominal Ativadora!\r\nSeu ajuste em velcro proporciona conforto e seu material com neoprene auxilia na aceleraÃ§Ã£o da definiÃ§Ã£o abdominal. ConfortÃ¡vel, essa Cinta Sweet Sweat pode ser usada em baixo de qualquer roupa e mantÃ©m os mÃºsculos aquecidos. Quando utilizada em conjunto o gel termogÃªnico, ela pode auxiliar na eliminaÃ§Ã£o do excesso e Ã¡gua e gordura na regiÃ£o abdominal. A qualidade Sports Research pode ser notada em todos os detalhes dessa Cinta Abdominal Ativadora, que Ã© feita para homens e mulheres que buscam bons resultados. Aproveite a oportunidade e compra a sua! ','ESPORTEFITNESS','Sweet Sweat','Waist Trimmer','2017-08-22','2017-11-09'),(38,'Gel','...','ESPORTEFITNESS','Sweet Sweat','Workout Enhancer','2017-08-22',NULL),(39,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Amber Romance 200ml','2017-08-22',NULL),(40,'Carregador PortÃ¡til','...','ELETRONICOS','MOX','P250 3000mAh','2017-08-22',NULL),(41,'Fone de Ouvido','...','ELETRONICOS','Iphone','Com Fio','2017-08-22',NULL),(42,'Perfume Feminino','...','COSMETICOS','Bvlgari','65ml','2017-08-22',NULL),(43,'Perfume Feminino','...','COSMETICOS','Calvin Klein','One 100ml','2017-08-22',NULL),(44,'Smartphone','...','ELETRONICOS','Iphone','8 Plus 64GB','2017-08-22',NULL),(45,'Tablet','...','ELETRONICOS','Ipad','Pro 64GB','2017-08-22','2017-10-22'),(46,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Secret Escape 236ml','2017-08-22',NULL),(47,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Snch a Flirt 236ml','2017-08-22',NULL),(48,'Pulseira Inteligente','...','ESPORTEFITNESS','Sky','FitBand 1 Black/White','2017-08-22',NULL),(49,'RelÃ³gio Feminino','...','JOIASERELOGIOS','Xiaoxia','JYSB-25','2017-08-22','2017-12-11'),(50,'RelÃ³gio Feminino','...','JOIASERELOGIOS','G3-7S-18727','D-5532','2017-08-22','2017-12-11'),(51,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1762','2017-08-22','2017-12-11'),(52,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1763','2017-08-22','2017-12-11'),(53,'PelÃ­cula','PelÃ­cula de Vidro Universal para Iphone 7','ACESSORIOS','Sem Marca','Universal Iphone','2017-11-03',NULL),(54,'Capinha','Capinha para Iphone 7 da cor Rosa','ACESSORIOS','Sem Marca','Iphone 7','2017-11-03',NULL),(55,'Perfume Masculino','...','COSMETICOS','Animale','100ml (Eau de Toilette)','2017-11-03','2017-11-27'),(56,'Kit','...','COSMETICOS','Aussie','3 PeÃ§as 865ml','2017-11-03',NULL),(57,'Kit','...','COSMETICOS','Aussie','3 PeÃ§as 400ml','2017-11-03',NULL),(58,'MÃ¡scara Hidratante','...','COSMETICOS','Silicon Mix','Bambu 225g','2017-11-03','2017-11-03'),(59,'Perfume Feminino','...','COSMETICOS','Marina De Bourbon','Rouge Royal 50 ml','2017-11-03',NULL),(60,'Garrafa TÃ©rmica','...','CASA','Travel & Leisure','7,7L','2017-11-03','2017-11-03'),(61,'Creatina','Creatine Powder 120 g - Universal Nutrition Ã© um suplemento feito exclusivamente de Creatina Monohidratada. PorÃ§Ã£o com 3g de Creatina.','ESPORTEFITNESS','Universal','100g','2017-11-03','2017-11-09'),(62,'Smartphone','...','ELETRONICOS','Iphone','8 64GB','2017-11-06',NULL),(63,'Smartphone','...','ELETRONICOS','Iphone','X 256GB','2017-11-09','2017-11-09'),(64,'Perfume Masculino','...','COSMETICOS','JOOP! NightFlight','125ml','2017-11-13','2017-11-13'),(65,'MÃ¡scara Hidratante','...','COSMETICOS','Silicon Mix','225g','2017-11-13',NULL),(67,'Smartphone','..','ELETRONICOS','Samsung Galaxy','J5 16GB LTE','2017-11-13',NULL),(68,'TermogÃªnico','...','ESPORTEFITNESS','LIPO 6 Black','60 CÃ¡psulas','2017-11-13',NULL),(69,'Perfume Masculino','...','COSMETICOS','Carolina Herrera','212 MEN NYC 100 ml (Eau de Toilette)','2017-11-27','2017-11-27'),(70,'Perfume Masculino','...','COSMETICOS','Chanel','Bleu 100 ml (Eau de Parfum)','2017-11-27',NULL),(71,'Shampoo','...','COSMETICOS','Silicon Mix','Bambu 473 ml','2017-11-27',NULL),(72,'Shampoo','...','COSMETICOS','Aussie','Moist 400 ml','2017-11-27',NULL),(73,'MÃ¡scara Hidratante','...','COSMETICOS','Revlon','Uniq One','2017-11-27','2017-11-27'),(74,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Love Spell 236 ml','2017-11-27',NULL),(75,'Smartphone','...','ELETRONICOS','Samsung Galaxy','J7 Prime','2017-11-27',NULL),(76,'Smartphone','...','ELETRONICOS','Iphone','X 64 GB','2017-12-11',NULL),(77,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Cagarny','F. Preto P.Marron Claro','2017-12-11',NULL),(78,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Cagarny','F. Azul P.Marron Escuro','2017-12-11',NULL),(79,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Naviforce','Black Yellow','2017-12-11',NULL),(80,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Naviforce','Gold Black','2017-12-11',NULL),(81,'SmartBand','...','ESPORTEFITNESS','GPS Sports','S908 Black','2017-12-11',NULL),(82,'Perfume Feminino','...','COSMETICOS','Britney Spears','Hidden Fantasy 100 ml (Eau de Parfum Spray/Vaporisateur)','2017-12-18','2017-12-18'),(83,'Perfume Feminino','...','COSMETICOS','Chanel','Coco Mademoiselle 100 ml (Eau de Parfum/Vaporisateur Spray)','2017-12-18','2017-12-18'),(84,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Passion Stuck 236 ml','2017-12-18',NULL),(85,'Perfume Feminino','...','COSMETICOS','Ralph Lauren','Romance 100 ml','2017-12-18',NULL),(86,'RelÃ³gio Masculino','...','JOIASERELOGIOS','Curren','G3-18382B D-1850','2017-12-18','2017-12-18'),(87,'Perfume Feminino','...','COSMETICOS','Calvin Klein','Euphoria 100 ml (Eau de Parfum Spray/Vaporisateur)','2017-12-18',NULL),(88,'Garrafa TÃ©rmica','...','CASA','Travel & Leisure','9,5L','2017-12-18',NULL),(89,'Video Game','...','ELETRONICOS','Sony','Playstation 4 (Sem Jogo)','2017-12-18',NULL),(90,'Tapete','...','CASA','Tapete','Passarela','2017-12-18','2017-12-18'),(91,'Shampoo','...','COSMETICOS','Joico','Moisture Recovery 1L','2018-01-10',NULL),(92,'Base','...','COSMETICOS','Dermacol','Make-up Cover ','2018-01-10',NULL),(93,'Caixa de Som','...','ELETRONICOS','Ecopower','EP-2133','2018-01-10',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoImagem`
--

DROP TABLE IF EXISTS `produtoImagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtoImagem` (
  `idProdutoImagem` int(11) NOT NULL AUTO_INCREMENT,
  `idProduto` int(11) NOT NULL,
  `imagem` longblob NOT NULL,
  PRIMARY KEY (`idProdutoImagem`),
  UNIQUE KEY `idProdutoImagem_UNIQUE` (`idProdutoImagem`),
  KEY `FK11r1o42nfu2rp3nal5m6ud6sj` (`idProduto`),
  CONSTRAINT `FK11r1o42nfu2rp3nal5m6ud6sj` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoImagem`
--

LOCK TABLES `produtoImagem` WRITE;
/*!40000 ALTER TABLE `produtoImagem` DISABLE KEYS */;
INSERT INTO `produtoImagem` VALUES (1,6,'ÿ\Øÿ\à\0JFIF\0,,\0\0ÿ\Û\0C\0ÿ\Û\0CÿÀ\0°°\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0þþ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+\â?ÛŸþ\n%û$Á9¾\Íñcö«ø­¤øM¹ƒPÿ\0„O\Âv\Ø\Õþ!|BÔ´\ë>MÀ¾¶j:\Õ\ë3Ao-\Ûý“DÓ¦ºµ:Æ­¦\Ã<r¯\Û\Ûö\ÒøYÿ\0úý”>.þ\Õ\ß¦øká–ƒ\ç\é~†ö-W\Ç1\ÕgLð‚tC2\Í#\ê\Zþµsm\r\ÄÖ¶z„ºN«¯\Ëcqe¤]¨ÿ\0?\Û\Ëö\êøõÿ\0ý¤<oûJ~\Ð>%»\ÕüI\â{\É`ð\ç‡ò\âo\rü;ðt>…\ào\ÙË¶\rF‚RÁ»\êZ„—šµ\äl½˜\ÐõµûTÿ\0Á\ì_u-r\ïMý‹ÿ\0e/†þðí¦§n\Ö>,ý¡õ/ø\çW\ÖtÄ´–+\Ø.|\à=sÀÖšD\×\Æ+\Ë\Èüe¨4©ö[½>I]¥_›ôŸø=sþ\na\r\Ô/®~\Î?°¾£d¤yöúOþ?h·Rò!¼¼ý¢µ\è %r{€8#\å?\Ç]þ•ŸðOÿ\0ø<—öføÍ®\é\Þý»~\Ýþ\Ëzö¯ªMkañKÁR\êþ?ø3kjmmÆž<Q\Ã?¼7u{©4ö­w‡®øO·0\Þ\êúÎ›j—S\Åý–xOÅ¾ñ\ï†4x\Ä\Þñ§ƒ<W¤Xxƒ\Â\Þ-ðž³§x‹\Ã%\Ðu[h\ï4½o@×´{›\Í+X\Ò5+Ibº°Ô´ë»›;\Ëicž\Þi\"ucþõý]Á±ÿ\0ðZo~\Äÿ\0´w„¿c¯Ž6½½ý¿hZxsHƒ_º¹»Ó¾\n|Uñ\ÂYø\Å:·.\á\ß\ê²\Ú\è^/\Ó\ícþ\Í{‹\Í?_¸†\Ý\ì.\ï€úŸQH¬®ª\èÁ‘€ee!••†U•†AAr)h\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(øÿ\0ƒ\ÞhYøwö\Zý•´m`\Ã\áOk>9ü@\Ð\Ö(ö†»\áK?	ø#\ámûO“<K¥\Øø\Ã\â¬m\0\Û\r\ÃjJû\Þ\Ò\"Ÿ\ç\Ñ_\Ú\ÇüÑ \ßYþÙ¿²>½ý—|šN±û9kp.´ö\×NºÕ¬>\"jð\Ý\éP]¶m¤½\Ó\ì?³/.m\ã\Û40\êv²Ê¥&‰ñO@Q@9Y‘•Ñ™2²’¬¬§*\Ê\Ã2 ‚È¦\Ñ@\í—ÿ\0rý¦µŸ\Ûþ	ûþ\Ð~&—T»ñŒ~	\èšŽ5Mb+Xoµ\ï|2¿\Ôþxó\Ä\ÞMŒqZ\Ãg\âx\'[ñ™1F#\Ó5;DdWVô¶¿?\à€^ÿ\0„/þ\Õÿ\0ø\Ñü¿+\íŸ4\ïm\Æ3ÿ\0	\ïˆüC\ã¯3ô\Ûþ?7?Å¿=\ëö€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€?˜Oø:¿þ	\Í\âÛ‡þ	óeñc\áG‡µülýŒ¼C­üVÐ¼?¥$—z§‰þx‡L³Ó¾4xsG\Ó~\ÛmÞ±o§\è~ñõ’Am©\ëZ‚|?¹ðÇ‡ô\ëKÄ±\Æ\Ê\n¿\ß\Îx º‚kk˜b¸¶¸ŠH.-\ç&‚x&C°\Í£–)cfI#udtb¬\n’+üö?\àºÿ\0ðj÷Œ¬üY\âÿ\0\Ú\Ïþ	•\áWñ?‡|K¨\ê¾\'ø›û+\ÙH‰­øgT¿¸K»\íkà°”ˆõmö\ê\âò\î\ïÀ—S[]x}c?ð]_\ØI§\0tWK\â\ßx\ÃÀ:\Ýç†¼s\áox;\ÄZ|ö‡\âQ\ÐukIŠ²Ï§\êvö·Qü\Ê@-\rŒ©#š\æ¨\0¯¥?cÿ\0\Ù_\âŸ\í³ûKüý–þé¨xÿ\0\ã4¿\ni³½½\ÍÆ\á\í:y|ÿ\0x\Ë^‘\Ëq†|\áø5?ø’\ê(\Ý\ítM&útGdU=G\ìûþ\Öÿ\0·Ä\'\á_\ì­ð?Æ¿|E©\\Áî§¦i¯e\à¿\nX\Í$ñ¾»\ã\êdð¯„4vµ¸I5=sU³Š{¨\×L±zµÍ…\Çú‘ÿ\0Áÿ\0\àƒ¿¿\à’Ÿµ?x÷Y\Ñ>*þ\Ø_4k}?\Ç\ßt\Ë7ð€\ÏÜ¿¾=ý¼\Z¤š[\ÝG¾\"ñEü6W\Þ%º´¶iºF›´¹\0ý\ÅøðoÀ¿³¿ÁŸ…¾\éói_¾\rü?ðŸ\ÃOi\×7/{ug\áh–Z‹\r\Õ\ä€Iwt¶0ý¦\ê@\âs$¬9¯T¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0þ?\à÷ýC\Â:NŸûhš„¼o\ã_\Z\ê¿|C\âO\Å\á}\r|s¡øOøU£øsF¸ñj\Ù6ƒÇ‹õ™†& \Út—1\Û\Ïö6\Î6_\åkþoû8èŸµoüoö/ø7\â¿i\Þ4ð^£ñU<]\ãŸkk¤køo \ë?|EeªÙ¸1\ÜX\\i\Þ–+˜¥)#r²+!*z¿\àõÿ\0ŠZg‰¿mo\ÙW\áU…ú\\\Ý|-ýŸu\ÝcZ²F$\éÚŸ\Äo\Z˜’E\è²]h\Þ\Òn=LM<`\à\Ð_\\ø§þ\r\á¿\Çl\Ò\Û|5ýŸ~6øª\â\ãnR\ÖM[K\Ò|o“ü/7ü&F2¢N{õ;ð/Ã¿‡ÿ\0ôü-ð\ÓÀ\Þø{\á˜n\'»‹Ã¾ðÖ\áM;»§ó.®“I\Ðl¬,\æ\êO\Þ\\N óg“/+»\×cE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEþBÿ\0ðt¯\æñü\ïö¼´ûK\ÜXx&\Ã\à?ƒt\Õi‘\Û%—\ìõð·T\Ô\à„#U×µ}Y¤N¢v”žM~\Ðÿ\0Á?mµo‹¿·Ÿ\Çk˜\Ô\ÜxÀ¾\é2ó\Å\Æ×¼{\âmgaÿ\0¦qü7\Òñ\È	žŸ\åŸþ\n\éñ¶\Óö‹ÿ\0‚˜þÚ¿ô\é\Ò\ëLñÇ&•<r	c—Ið\Û\ÛøKKh¤4_\Ùú\r°Œ¯Àý\ÃÁ“?oü=û~\×?n\íš+o‰¼+\áý.b¤«/‡	—Í‘X¹bÔ¼e…hÛœ–\0ûY¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¬[°ðÖ…­x‹U”A¦h\ZN£­j3±\Â\Ãc¥\Ù\Í{w!\'€$oÂµ\ëókþ	ñ\Õÿ\0f¿ø&/\í«ñ–*\Ýø_\à‡ˆt\í9 Çš5_\\\éþ\ÒJ@ûK\Äö¿6FÑ“Ú€?\Ä\ïUÔ®uSR\Õ\ï[Ì¼\Õo\ï5+·9;\îo®$ºòz\î–W9÷¯õ\Èÿ\0ƒW~Yxþ—û+\êð¦\ÍG\âV»ñ\ß\Çz\É1É¸?ü-¦À–˜øcH‘dm§÷†5]ˆ¬\ß\äQ_\í‘ÿ\0mø-/\ìõÿ\0¹ýˆ>\Ü+¥\ç‡~økR\ÔVE(ÿ\0Úž3žÿ\0\Ç:©u f\Ô|It\Ä`\0O\0\n\0ý0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯š>>þ\×??fû&ˆ\Þ,_\í\æƒÏ±ð_‡\âMg\ÅÚˆh§š‹LI¡†\Â;‘o\"A}®^\é:Y˜\Å—ñ4ñoøöôÿ\0‚ÿ\0Â²»\Õþ|\r¼‚\ã\Ç0y–>+ñ\Â®m|+)gÒ´4%\ã¹\×\ã¥\Í\ì\Êmô§;bŽ\â\ìoü÷øƒ\Ä:çŠµ‹ÿ\0x“U¾\Öõ­R\á\îµ\rOR¹š\îò\î\áð\ZI®\'w–FÚª ³TgŠþ\Åð_è«˜q–\Äüwˆ\Å\ä\\=Š„1~S…Q§f\Øy(Î–&­JÐ©O,À×‹\æ¤\åJ®3Oß…<59\Ñ\ÄOü\ÐúP~\Ðl›\Ã,\Ë2\à/	0Ywñž_V®9\â,\ÂU+p·\ã)¹S¯‚\Ã\Ñ\ÂÖ£W>Í°µ†\"0\Ä\á²\Ü\ru\ì\ê\Ö\ÇW¥‰ÁRýwø©ÿ\0‰ø§®\\\\Zü$ð‡|	¥‹\ìÚ—ˆüY\â9|©¦ó$‘°Ð¬â»·0n²\Zv£-¤\Ë&\ÍV\åWÇš\ïüö¼×¾Ú’|gñ›ó34Z$Zf\ÖÁ‰;,\î¬l`¼µQœ)†\á\r\Ü\nøÊŠþ\ä\È|ð«†ðð\Ã\åœ	Ã‘E}c1Ë¨\ç\É8Ù©\Ï›,n%\Ê\ë™?j’m¸¨ÝŸ\äÿ\0ý(>|q‹«‹\Ï|\\\ãxûYM¼I\â¸g,„gu*tò\ÎžWT\Üd\á$\èI\Î6U\ì­÷•ÿ\0#ý´ô7OÒ­¾6^Ok¦YZiöò\êžøq¬\êr\Û\ÙA¼/¨k:¿ƒ\ïµmZöH\âSw©ê··º•ü\æK«Û»‹©dý\ßÀ_ðW\Ú3\Ã÷¶?ð›hþøƒ¥B\0¿ŠM1|1¬Þ€W\æƒS\Ñt\Û)Žu%JÀ6ß”´V™—ƒ^\æÔª\Ñ\Æxw\Â	V\çu*\à²,WŠ“©~y,nYGŒŒ\ÛmûHWŒÔŸ4d¥©ŽGô›úCðö\'Š\Ë|iñ*R\Âû%B†iÅ¹\Æ}—\Â4y}7•gØœ\Ë,©J**>Æ¦t¥\É(8hU?³\ßü³öø\ã=–¬\Ü^|(ñµ\ÒÂƒEñÍ›hW×²,\ÒIm¢x¶Ý¢³¹HR™5\Ë\r\Í3ºGmk3\Zý ‚r<‚\à‚:\ZþU™NT•> kõö#ÿ\0‚ø§\á6§£ü7øÓ©^xŸ\áeÌ¦\Î\Ï\ÄM=÷ˆ¼÷Št—÷³\êºr³ý«M5\å¬S4úl\Î-cÒ®ÿ\0‘<]ú\"G„\Åq…µ1x˜\á\áR¾\'„±µ^+\éAsKû?\ß\âjB)¸\åø\ÙU\ÄÖ³T1•«:xiÿ\0¤G\ÚC<\Û2\Ëø;\Ç\ê~xÚ”p˜²¼<0b*\ÉB\ëfWMýWF¤\ä”óœ®8|ñx¼³\r…|}/\éRŠ\Ë\Ñ5½#ÄšF›¯\è\Z•ž±¢\ëpj\Z^©§Î—6W\ÖWQ¬°\\\ÛOd’)9VR¿„*B¥)Î•XNJs•:”\êFP9Á¸\Î„’”g\'FI8´\ÓI£ýq£Z–\"•*ô*Ó¯B½8V£ZŒ\ãR•jU\"§N­*r…Ju!%8N\r\ÆqjQm4ÂŠ(¨4\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nþxÿ\0\à\ê\Ã\áø\"/\íc¦—ò\ï|y­|ðnžwm%\äý¡>x‹PP:¸“Eðö§(\í!c?\Ð\å¿ð{\Å\Ík\Âß±ÿ\0\ì“ðN¼6úgÅ¯Ž1×¼Al¿±ø_\á]\"{(YC\0\ÑÃ«ø\Â\Â\è–Hb\à1V\0\æÝ¦\Ø\\jº†—h¥\îµ+\Û[d\0’÷“\Ço\n€9%¤‘F\\\×û\êxB\Òü/ \è¾\Z\Ñ-c±Ñ¼?¥iú.•g\Ävºv™i••¼cŸ–xcrI\Âó_\âKÿ\0¢ø&¿´Wüƒö3ø;%—ö¯‹¾;x9õ3•fÒ¼7q/‹522h£\Ó4+¹f\È\Ú\"G\'€ký¼h\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯\Î/ø(\ï\íiqû:ü.¶ð¯‚µmñW\âb\Þiú5Õ´\ï\ç„ü5~^·\â¨\äŠ9\Z\rD¼\Ði>\Ý%œ\ßlº¼\Õ\ìn\Z_\ËŸ£RH‘Fò\Ê\éQ£I$’0H\ãgwv!QAff!TI\0Wñ\Ýûe|k¿øñûAx\ç\Æs\Íp\ÚEüžð­¤\ïo(Ó¼7¡O=½œòÁ\Zn·½¸k\Ígl­,‰qª\\)p0‰ýôcð\Ë\r\â,Vo‡†\'‡xN,\ß1\Ã\ÕJTq\Ø\É\Õtòœº¬Zjtj\â)\Ô\Å\â)\Ê2§[\r­†©¥u\â/§‡Žø\ï<yw\r\ã*`x\Ó\ÄLN#†òLe	8b²œ®•\Õ\â<\ë\r4\ã*Xœ>µ»^œ\ã_	ŽÍ°¸\ê›\íóó\Ïu<\×73Kqqq#\Í<ó\Èò\Í4\Ò1y%–YI$’9,ò;3»\ÌI$\ÔTQ_\ëBI$’I%d’²Il’[$Î«nM\ÊM¶\Ûm¶\Ûm\ê\ÛoV\ÛÕ·¸QE\ÄQE\0QE\0~\ÓÁ+¿k»Ÿø’\Ûömñ\æ eðÿ\0Š.e“á¶¥y>\â7Wš¼’°ŒX\ë\á´¤Ü’G­…²‰n_W‚;o\èJ¿…}\'S¾\Ñ5M7Y\Òî¦±Ô´›ûMOO½¶’Hn,\ï¬n#º´º‚X™$Šky\âŽX¤\Õ\Ñ\ÑYX\rg?³‡Å˜~8|øwñ05¹¿ñ‡­N½\r±„Gm\âKl5\èV&m£:µ\Äö\Ö\Ï+Iœ\Ö\á\É\'\'ü\Øú`xc…\áüó.ñ\'\ÃÆ†‰\ë\ÔÁg´iG–<þ7^–5%\î\Å\æ¸XV•h\ÅFø¬lDÜª\â\ä\Ï÷ökøñ\ãÎ¼\Z\â\\lñy¯\á(fœ%‰¯>zõ¸>½x\á1\\¥/\ÞTf5p\Ð\Â\ÊR“Ž5\Âà©ªt2\êiû}Q_\Å\Çú†QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0þx_ð|\Äû=S\â\ìðz\Úò7¼ðw‚¾>|@\Õì”ƒ,+\ã\Íc\á^…£O2˜,‰\à=]a\ÜH\âR›rû¿\Ðö¿\Êþðñ\ÝßŠ¿à±ž5ðÌ·o5Ÿ\Ã/_ü+ij[1\Ù>±\á©ü{r…\î\ÆK!\ê\Ë\åö€<+þ\rlð­ß‰¿à¸Ÿ±½\ÔVOwa\á;O\Ú\Å\ZÄŠ¡’\Æ\Ú\ÛöhøÁ¦i\×r“÷Tx‡UÑ Bo:hð,¿\ë\Û_\æ…ÿ\0Uü´ñ\í¿ûK|d»´YŸ\à\ÏÀ­J\Ón™sö=Sâ—ˆ¯tÑ±º,—\ZG†uˆ\Çv‰eô5þ—´\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEó\ï\í]\â\è¼û5üqñ$’\Ë¶\ßü[cc,\åLš®·¤\\\èzC\Å&AGMOQ´`\ÊC(RT‚¯\ã-˜»31$±$’I$ŸRy5ýkÿ\0ÁF,nµ\Øÿ\0\â\ÄV\Û\Â\Ã‡n\î\Ê0B-m|M¤Lû‰#(Ò¬H\Ë\Î\à\Ø\Æ3_\É5¥ŸBœ—ñNc_Œâ·„¬¿’†)ÀUÃ§\Ö\îxüLµ\è\â†_µ+6\ÆWñw\Ãü–¤po‡‹0\Â\É\Þ\Õ1Y¿fô1²]\ZT²Œ.¾\Ôd¯\ÑQEf\æ QE\0QE\0QE\0Wôƒÿ\0yñÌš\çÀÿ\0ø*\âõg›Á^8Ž\ê\Ö\ÉbDk+ÄºdRÛ´Ž	yMÖ£¥\êÌŒø\0Dc@l[ù¾¯ßø\"Î˜\Ðxwö€\Õ\È;u\rWá½Š·b\Ú]·Ž%aø\rQOü\n¿œ~•\ØL6\'Á>#­]\'W˜pö/xÅµ‰žw‚ÀI§-bþ§\Å+\Ã\Þi¸ü2‘ý³û=3v\éOÁl#q¡›\äüi–\æv”’–Ÿ\næ™¼#$šS‹Ì²¬º\\³¼T£¥\ÍŸ¸QE’§ý…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Œ—üñ~8Ábn\ïÁuö»-/\ãü6\Ó\ä$U´øG\áO|0+)+µ\'ð”\ãh\Æ\ÒJ\Zÿ\0f©%Ž\äši(¢F’YdeH\ã³\É#±\nˆŠ31\nª	$_\àÿ\0ûQx¼|Aý¦hŸ¬\ßh_üuø¹\âõ¸·ž<K\ãÿ\0k\"mÇ–óE\îý\Ý÷f€?ºÿ\0ø1\×\áÖ­a\àÿ\0ø(Ÿ\Åk\ËFM\Ä\Úÿ\0\ì\Ñ\à]ð¡5÷ƒ\ì~8k~\'…$<?—Œ<.YT|„\Ä\î½JþZÿ\0\à\Ð?‡þÿ\0‚Bh>3X•nþ,|zø\Ç\âi¥†–\×ÃºÍ§€mC6\ï.o^‚@\r€s¸\êR€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€>pý¯¼?\ÄÙ\ãw…­\êK\ëŸ\0\ë:¦od]^j~\ZDñ6›§Â 1v\Ô/ô{{˜;\Öá—½\Z\äH ‚	 Ž\Ç\ÜW÷i,i4RC*\îŽTx¤\\‘¹$R®¹RÊ’2#±¿Ÿ\Ú\Ï\à\å\ÏÀ¯Ÿ¼\0\Ö\ßg\Ò\íu©õO\rmVX¤ðÎ²\í¨h¦-\Í\Ü\í“-‹K<¾l³\ÚN\åW\î\ïß¡7QŒ8Ë‚«TQ¯:˜N&Ë©6¿{He™«W·½O“)vWrŒ\ç-6\Ïñ\çö§ø‹•_¼R\Â\á\ÝL%:\çXˆ¦þ¯S\Ú\Ô\Ïxv2²iS¯\í89Ë–1©N”.\åZ(ùÂŠ(¯\ï³ü}\n(¢€\n(¢€\n(¢€\nþ‘ÿ\0\àŽ\Ú\rÍÀk\×²Á»ñ&\â\Þ\Îy#(—¶š>‡¥©žÝú\Øc¼¿¼¶.8Y\àž?½Wó‹¦\é÷z¶¡e¦XA%\Õ\î¡woegm[‹›©R ˆ1U2K+¤q‚F\çeæ¿²Ÿ\Ù_\á\"ü\rýŸþü5tt\ÔtO%\æ¼%H\ÖUñˆ.n<A¯\Ã#Dò,Ÿc\Õu;«d\ÞÛ­­`\Æ\ÕWù\é‘\Ä\Øl³ÃŒ\róÁ\ãø›<\Â\Êy­8\åù:x\ÜV\'•n¡Œyu¥£öòiÞ™þ~\Ì\Î\Çg\Þ7\æ\Üp\éTŽQÀ\\+˜)\âT/Ny\×[)\ËðNOD\êeŸÛ˜¶\âÜ¢ð”\ã$£V\ç\ÐTQE˜\'û\ÔQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0|Ÿûy|Y‡\à?\ìGû^|h™¤Að·öjø\Ûã˜Œ;„\Æ\ï\Ã|E©Ø¤;~o6K\Ëx#ˆ/\Ì]”/\ÌE…\äó\Ës<\×1y®%’y\\õy%s#±÷fbOÖ¿\ÙOþø‘eð\Ëþ\×ûwjws˜fñO\Âøo§(`¦{ßˆ¾ \Ñ|$`‘luK\Ù@%\Ö6\\`–\ãO@\ì£ÿ\0\îü»øÿ\0gý†<¨mG[øs\â?ŠW­\"¢¸?~$x\Óâ­Œ$\"¨\Ûi¥x¿O²Œ¶_Ë¶M\ìÍ’i\ë\ç\Ï\Ù/Àöÿ\0¿eÙ³\áÕ­²\ÚA\ào€¿¼&¶\è¡DM x@\Ó%\0ö–\Ù\ÚC—f=M}@Q@Q@Q@Q@Q@Q@Q@Q@~MÁX~ø[ÆŸ­þ3[K\Ð<kðÑ¡²€\êz…½Œ~-ð\æ¥wûÿ\0\rÚ­\É_´\ë–W“6«¢Cn\é5\Ä_\Úöf+™nlþ\Í÷—\Çÿ\0\Ú\á\ç\ì\å\àk¿\Zø÷RX¾Ya\Ðôy#:Çˆµ%M\Éc§[»T¦\êòM¶\ÖQ2wE\åsö¢ý«~#~\Ô^1}o\ÅWa\á6y‡…|g4¿\Øú³¢Q*.µ)£ö­Ft7Ÿ•|˜vñT}<2\ã|÷Œrž9Ê±2\áük–+8«I\Ê9´T]<fI\Ã\ÉÁbã‹¡9á±µÜ•&\êsK\n4eþ}ý=|xð«„ü3\â/	¸ƒCŒ8ÏŒr¸\Ç\ÃXlDiÏ†\å\Ï\Zùg\æ\Ø\ÈF¬²\ÙeØºT±¹^\rE\âój´•Nž[SŠ¥ò\í\ÒøKÁ\Þ)ñ\æ¹i\á¯h:Ÿˆõ\Û\â\â\×K\Ò-&½¼›Ë\å}@Ž\í¶8\Ý\ÎùU@H\Æ\Ô4û\í*ö\çNÔ­\'±¾²žKk»K¨ž‹y\áb’\Ã4Rx\äÁWF•Wú”±w^xU^‹\ÅS¥\nõ0Ê¤xP«)Âi\ÑRö‘¥RtªBT\'*sŒ[p’_\à#Á\âã„§–\r\\E\\%,k¡Ua*b\èS£Z¾ž%\Ç\Ø\ÏF–\"…Z´#7V:ôg8\Æ5`\åNŠ(­Ž`¢Š(\0¢”H\0IÀ\0Iô\0u5ú?ûÁ=üuûC\ê\Úw‹¼wm©ø+\àÝ´\Ñ\Ü]\ê\ÒF-u¯G:g…a¹ÀŠ\çUÆ½</cew·Kû¤[Fùž.\ã\àl“\ÄO™P\Ër\ì,[\æ©$\ë\â«r¹C	‚Ã§\íqxº\Öj–Œe9k\'\Ë\Îqû¯|6\ãOø§/\à\î\Èñy\æw©\ì\èA¬.\çU\ÌsLd—\Õò\ì·\rÌ¥ˆ\Æbg\nPV„\\\êÎ9û7ü\ËöKºñß‹“öñ¾“*x\'Á·‚ ¿µ–8|M\â¸w\êV¾qX¯´a\ãšAö·\Z\Ã\Ço\r\Ê\Ü\é\Z„ýV†|3 x3\Ã\Ú7…<-¤\Ù\è~ðök¤\èºE„^U¦Ÿ§\ÙÄ°\Û\ÛÂ™f!Ay$gši\Ë4’J\î\í¹_\ãç‹ž&\æ~*ñ†3ˆñžN+‘\ån|ñ\Ërª3”¨Ò“^\ìñU\ç)\âqµc\î\ÏVq§j4\è\Âô©ôqð#\"ú=øk–ðNYVža›×¨ó^,\Ï\ãK\ÙK<\âM*p\Ä×„¿Kƒ¥N–+\Ã\Íó\ÒÁa\éÎ·>.¶&­RŠ(¯\ÌÞ‚Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( \ä¯þ-ø›¨x+þ	W\ài²˜\ÏÅ¿\Ú\çá§…5…2xCøyño\Ç7\0 Ê¿\Û~ðò²’nI*ª\Í\Çö1øD>?þ×Ÿ²÷Àù-£»ƒ\â\ß\íðƒ\á\Ýå´±´±Oa\â\ï\è:&¡±¨bñ5\åÇ˜ ¦\áŠþ\è?\à÷ŒV‘|4ýˆ¿gøgO·_ø\ëÇ¿µ`x-4þ­v^¡\ÚÞ»\Zž70q\Î\Þ?•oø7\ãÀ\Ó|@ÿ\0‚\Ê~À\ZDV²]&ñ\Æ\Ï\Ç7#2-¼?<;¯ø\án¥À\"8\á¸\Ð Ä€²4|\äŠ\0ÿ\0f;Khl­m¬­Eoio\r­¼j0±\Ão\Z\Å(\0‘¢¨€X¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+\ä\ßÚ¿ö»øwû+x9µ_HºïµhgÁ\Þ±¸E\Ôu‹\ÄB\ïQ“\æþ\É\Ð-e(oõ9QÜ¯ú=…½\å\ã¤\Ïÿ\0lŸÛ—Àß³‹q¡i²\ÚxŸ\âÎ£fÍ¤øbVXtA<g\ìÚ¯‰\Z6Í´<‰mt\í\Éw|¸ˆm	¸?Ë§ÄŸ‰^3øµ\ã\r_\Ç^<\Ö\îõ\ïkW\r5\Í\ÝÜ…\ÄQ\äùV–±ñµ²½´)1 h (þ¯ð\è\áñ®Šx¾Ž\'-\àªs\\6ß¡Ž\âguO\r-*a²¦Õ±øÚ¦\"7¡jR–/\rþx}/þ›\ÙGƒ”qþxkˆÁg¾)V¥:†9{<^SÀŠ¤ö¸\Øû\ÔqüE\Ë.l&O\'*8râ³„\á\Z9n?¨ø\ßñ\ß\â?\í\ãmC\Ç?µ©5û§t°\Óa2E£h:~öx4Ä»¥¥•¸l—¸¸}\×s\Ü\\\É$Í“ð‡\á¾9x\ëGøyð\çCŸZñ¯!$ŒÅ§\éV•7ºÎ³|\Ã\É\Óô«\Ø=\ÅÌ§.\í¥¬w\×6¶\Ów¿³\ì\Éñ+ö˜ñ”ð>š\Ñ\éÐºI¯ø¢ö9SD\Ð,w%\Å\åÊ©.\Ý\Â\Þ\Î\"nn\åT(q#\ÅýP~\Í³\Ã_Ù‡Ái\á\é\ë>¯¼¾*ñ}\ìQ¶¹\â[ø“\ï\ÜN6\Úm¼/ön“}–\É\Øù\×r\Ü\ÝOýk\â÷¼)\àžGC†8o	—\âxšž\n|Ÿ‡0‘<»#\Ã((\áñY¬0\î.…\ÅûJJ¬sW\ç¡Jr\ÅGü\èú7}<BúTq^/Žø\Û2\Îp\\[6«‹\â~6\ÌgR¾u\ÅXÿ\0kÍË¸z®25V/9^Ž/5«\Z¹~R<^&”2\éñ²_\ìqðóöYð¼P\é‘A\âˆ:²x\â\ê\Ù\åÄ²$f}?GVM;FI@¬g¸P¯w$„*F\Ï\Ú+öøûIu_ø~\rxÝ•|¿x2X4vržk,zÍ¼–\×Z>¿’H¢yõM:mY`-\ìu[¯±h¯ó>^\"ñÄ¸¦¿\ZÇ‰óz<O‰ª\êVÍ¨b\êP¯(¶ŸÕ¹)8\ÑúŒb•8\åþ\Ë\êQ£\ÑT=šQ?\ÝJ^	øQO\Ã\ì\'…r\à.\Äp„h\áøs—\Ò\Å\áaR)\ß\ê\×U1r\Î\'RS\ÄT\Î^#ûVx©\Ï,c¯\'Qÿ\05\à‘Ÿ<%=\Õ\ÏÃw@ø—¢Áf\×*I_\rkòN²\Ê\r”z=\å\ÍÝ´Î°]$‹Us3´ˆ!B‹\æ|Q¬~\È?µ&‰rö\×³\ï\Åùš3ƒ6™ðÿ\0\Ä\ÚÍ¦?¼/4:ö\Óo©ó°>•ý•\Ñ_\Ðù\Ó+ÄŒ·\Z\ÖW\Ã\ÜG(F1Xº¸z\Ù^2£[Ê·ö}H\à¥)Ó¬\äq‡\ì\ÇðC;\ÆT\Åð·q§Â¬\å/\ì\Ú\Ü.–Q\æwP\Ãÿ\0lP©š\Æ\Ö\Ë›be¯\Åd’þ0´Ÿ\ÙköÖ¯NŸeðK\âzÞÀ[\Þø\'\Ä:tŒS\ïú}¸m¤ƒØšúW\á§üÿ\0ö¯ø‚\ÖW\ZŸ…t¯‡\Z=\Èi$Ô¼{«Å§\ÝD‘\\f‹þ\Ý2=WÄ±\Þ2+\Íiþ“aip¾Yk\ècH?ªŠ+»8úiñö.„¨\äü7\Ã9=I«}j²\Çæ•©\é+Ê”jbp¸e;¸¸{l=hG•©B|\É\Ç\Ë\á¯\Ùu\á]‹§‰\â^8\ã¾%¡NNO/\Ã<Ÿ \Â×´ \ãORŽŽtùUH\ÔXlf¬¹\á(V¥\È\ÕO\Ì_\Ùûþ	mð?\á,öú\çg“\â÷‰\í\Ùdˆ\ëv\éþµ–)Œ±K‡’{Æ¸ua©_\ÞÛ³\Æ\\[®\í«úk0\ÛC½¼1[\Û\Û\Å0Ak0\ÃŠ(¢Œ*Ghª‘ÆŠ¨ˆ¡T\0\0©h¯\æ-\ãŽ,\ã¬\ÃûO‹3\Üvu‹2£õ™\Æ8l,fÓ•<\n„i`ðT\ä\Òr†…(É¤\ä›W?¼¼9ð£Ã¯	2o\ì¸K)\á|¾n\ÄýF”\êc³\n”\â\ãN¶iš\â\êb3LÒ¼\"\Üa[0\ÆbjB-\ÆŒ}Ð¢Š+\å\ÐÂŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( óÿ\0ƒ\Ô|cwªÿ\0ÁL¾x1n\é~ýŠ¼	¨-°$˜u¿|hø\ï&£#|\ÛG¥i^\n»bÌ¬<\çþ\ßø[a\ã\Ïø*÷Š|a©Y¥\Êüý”þ(x\ÛJš@\Øõ\ígÆŸþZ\ÏAý\é\Ò<a®Ä a¶;°8R\Èðs\Ç\ÆûŸŸðX\Ï\ÚQd¸I\í>\Ã\á_‚\Zb\Æ\á\Ò\Þ\ßÀ–\É{o\Ç\ë®k\Z´“\'UšI7|\Ä\×\íGü\rð³RŸ\ãO\íÁñ¶[4}3\á\Ãß…–:‘S†Ôµ\ß\Í\â\ÝV\Å\ÊZøwFžU8xI­\0¢eQ@Q@Q@Q@Q@Q@PN9<\É\'µ\0ù_ûwÿ\0ÁC4º‡\Âï„·6Z÷\Æ\È$·\Õ5Uh®ô‡J‹‰\î\ã\Û$:Š$\É\Óô‡ÿ\0GÓŽ\Ûý`:-¾™¨ù\í\Ïÿ\0+²ð\Ê\ë	?g­Z\rG\Ä\é:g‰þ\"\ÙH³X\è\î3\rÆŸ\á[„-\å\êñÏ­F\Ío‚škM 7?÷\××º\íÞ£¨\Ý\\_\ê\×]\Þ\Þ\Ý\Ê÷WwWdž\â\âyI,\Ò\È\Ì\î\îÅ™‰$\×÷\'\Ñÿ\0\è\Å[5–|IÀÎŽT½ž+&\álT%N¾d\î§GQ’S£—m:9tùj\ã½\Ù\â£\îqŸ\äÿ\0\Ó\é\åC‡\ãšø[\àvkO\Ä½\Ëø£\ÄHV\Â\ä{\Ó\Ä\å\\+ˆƒ•<NsñR\Å\ç”\ÜðùO¿K-•\\\Óý¯*¿\âk¾,Öµ/ø›V\Ô5\ÝwX¼žÿ\0TÕµK©¯o\ï\ïn\\\É=\Í\Õ\ÕÃ¼²\Ë+’\Ì\Î\Äö\è\0¯©ÿ\0d\Ø\ï\â\íS\â\ä¶Ò ŸAøy£\Ü\Åÿ\0	‡.\í\ß\ì\àIý•¤†\Ø5_]\ÆG“cì´‰\ÖóP–\Ú\Ü\ÄfõOØŸöñ_\í\'«A\â¿G¨x_\áp¦÷X0˜o¼I,.<\Í+\Ã\Âe\Ú\åˆ1\ÞjE\Þ\ÄnUÝ&?\é\ÓÀ^ð‡\Ã\ni	ð.…c\á\ß\rh–\ëoa¦\ØD#AÀ2\Ü\\IÌ·W·/™®\ï.K‹™™¤šFcšýsÇ¤v]\á\å\nüÀ\ï	\â\è\Ñú­|E8S©–pµ5\ÅÒŠö8ŒÒ”,¨`,ðø6£<ld °u¿œ>ˆ\ßBl\ïÆŒVÄ¿a˜\åž\ÔÄ¼~^­z\ïˆ_k:¯6±X<ƒW™\ã3Žx\ãs5)\ÓÊ§U\æxns\à\ïÁ¿|\nðF™\à‡š4ZV§¢´\Ó¯¨j×¥BÍ©j·aU\î\ïg#,Íˆ\â\\Co0\"F¾§Eþecñø\Ü\ÓŠ\Ìs,V#\Æ×©‰\Å\ã1Ug_‰\ÄU“JÕª\Ôrœ\ç96Ü¤\ß\Ü»¹>O•pþW—\äy]ƒ\Ê2|«	C–\å™~–Áá ©\Ð\Ãap\Ôc\nThÒ„TcE%\ê\Û\n(¢¹H(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(\'\0“À’x\0¤š+Ç¿h\Ûü*øñ\Ë\â…\Ü\Ëmkð\ß\à÷\Ä\Ï\Ü\Ü1\ÂÁo\àÿ\0k~!šf9X£Ó™\É\ÈÀ\\\æ€?Åƒþ\n«\âdñ—ü\ëþ\n%\âh/F£g«þ\ÜµMÆ—z³ý¦9´dø\á\ãˆ4_\"pÎ²[¦•œv\Æ6ò„	ˆÂýøÁ•¾\n]#þ	­ñÿ\0\ÆòÛ¤w~1ý³¼g§A?”Yô|ø%·\ïq¹\áMSV\ÖQqT‘f f\'ü\Ð|u\â‹\Ïø\ß\Æ>4\Ô$y¯ü_\â¯ø¢úi	2Ky¯\ê÷š­Ì’’]\æ»vbI%‰\Ï5þ·ðk¯À\ËÏÿ\0ðG?\Ù\íµ+wñ‡XñŸ\Ç2~[?\ßZG£±\È\Ãhº6œ\É!\Îø\Ê;v\Ðô-EPEPEPEPEPE\Ïø¯\Å~ð7‡5x¿Z°ð÷†´)ucY\Ô\ç[{+H°’H\Ù,ò;$6öñ,—W2\Ãkk\×E\éFlEjX|=*•\ë×©\n4(Q„ªÖ­Z¬”)Ò¥N\nS©R¤\åB‹”\ä\Ôb›i\âq8|¾3^Ž	…£WŠ\ÅbjÂ†\r‡¡	U¯^½z²*4hÒŒªU«RQ…8FSœ”Sf½\åå¦Ÿiss••œ\Ü\Ý\Ý\ÝJ–ö\Ö\Öð¡’i\çžVX\âŠ(ÕžI•QAf \nþz¿oø(ý\çŽ\äÖ¾\nü\Õg°ð0óô\Ï\ZüB³&ÿ\0\Æl£¹\Ñ<12þûOð 	²ÿ\0V\â¿ñ)y,\àžIŸ\Ä~CûoÁC<Kñþ\çQø{ð\Ö[ÿ\0|!‚y-\ç\É6\Ú×\Ä2ü—š\ÉF-i¦HcYm4To‘H“Py\îJGgùR\Ï,p\Ã\Ë,®±\ÇjY\Ý\Ø\áUTd’IÀ¿Ñ\0>Œt²‚\ão°”±\Ü}ž/&\áª\ê5p\Ù<´©K›EÞž#4†’¡ƒ|\Ô2\é%V¯µ\Ç*kþ\'ý0þžŽ0Y¯…¾	\æ5ð|)?m—ñ7aeSŽ\âh;\Ò\Äe|;QrVÁpýE\ÍK™.L^w*u‡\Ê]I\æ\ì\Ë3wf\'Ü’­~µ~Áÿ\0ðN­[\ãúoÅ7º\Â\È^+¿øvO6\ÏXñü±¸e²m;ÂªW^—z±&8\Å{ôö?\ØKþ	±-\ãh¿hM%\á²V·\Ôü-ð\Þþ“^\ãlÖºŸŠ\í\ä\à´\'d¶ú,Š³\\®QH£o²·\ï40\ÅoPApAi0Â‹P\Å\Z„Ž(£@©q¢„DE\nŠ¨\0\\?H¤\ì2\ï®ðW†¸øT\ÇÚ¦:\â¼,\Ô\é\à^°«\È\ê\Æñ©Œ\Þó89S\Â\ë–*Øœ/«ô9ú\Ô\Îÿ\0²üRñ\Ë)©C&ý\Î?…ü=\ÇÒ•:Ùº´j\á³^+\ÃMFt2·\î\Ô\Â\ä5c\ZÙ»<\Ò4ð\Ø}\rF\Ò|;¥Xhz›e¤húU¬6Zn™§[\Åieei†\Þ\Ú\ÞX\âŽ5\0U§$“ZtQ_\çœ\ç:³J“•J•%)Ô©99\Îs›r”\ç)7)JRnR“m¶\Ûm¶³´©R¡J\n©Ñ£Fœ)Q£J§J•*qP§N8%S„Œ!£¥¤’AETšQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@W\Æ·\í\íû7ÿ\0Á9g\Ïþ\Ñÿ\0´ÏŒ\Ã\ÞÐ£’\Ó@ð\æ“¶¡ã¯‰>,–\ÞYtŸ|=ðý\Å\å‚\ë~\'\Ödˆ\Ç¹½Ó´]&\Ø\\k^$\Ö4O\Øj:­ \Øw·¶zmÞ£¨\Ý\ÛXiö\Ó\Þ\ß\ß\Þ\Ï­•¬O=\Õ\Ý\Ý\Ô\ï\Ö\Ö\ÐFóO<Î‘C<’:¢’??k¿ø8³þ	7û^\ëžñ§\í+¦üNñþ‡¦’ü=ø\r¥^|U\×eÕ´©¢†oÏ«\è{|¡j³™\Ù7Š<U¡i—	Œ5%w§üoþý·?\à§~%\Õ<7ÿ\0	£û<þ\Ì6÷\Ðxgö{øi\âû{]SOž\ê)`\Ô~-xº\Ö=/Rø™\âO\"\Ö\Ò<]\Ûiž\Ò\n\\Ÿ\røSH›SÖ®u_ÁbI\äòO$žôþ¿\à÷_\Ù;L×¡·øWû~Ðž4ð»\ÃO«øû\Ç_¾\Zx‚‚H¸Š?\rø||V\Óf‚<ÁñlRN\ïm­HÁ\ì|\rÿ\0²~\ÂzµÍ­¿\Ä\ÙKö¨ð\\sÈ‘\Ü^øzo…~8´²V 4Ò­ÏŒü},QŒ³{)g`>HXñ_\æ“E\0´÷\ìyÿ\0»ÿ\0‚^~\Ýö\ÞøûYø\ç\Çw	¤\Æ>|GµñÁÿ\0Í©\ë,cµÐ´M#\â~‘\áX|k¬$\á­\ç·ð\ïŠ\âI²\ÜI‘K\'\ê\Õ€ýö—{k¨é·—Zv¡cqÝý\ÄÖ—¶wV\î²Áskunñ\ÏoqŠ²E4.’Fê®Œ_\Õ÷ü\Ëþ‘ý¤?b_\Â¿l\íC\Å´§ì¢‚=\rv\æe\Õ~8| ±K=6\ÃK¹ðÖ³©]@ž:ð¦’º{ý·\Â>!»ƒY#T¾\Õ4¿¼\Ö6\ÞÔ€?\ÔÂŠòŸ¾~\Ò\ß¼ñ\ã\àGt‰\ßþ(x~\Û\Äþñ¿†n^\ãKÖ´«‡–\ÞTx§Ž\Þÿ\0K\Õô­B\ÞóEñ‡u‹M?\Äñªxs\ÄZf—®\éz†Ÿm\êô\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\æ\çü#\Ç\Ú_\Ã_ø%OüGÄº­É´Yÿ\0c_\Ú\'\Â\Údª@c\â|+ñGƒ|5\Z\îeÿ\0Y¯kºz°S¿am€¾ý#¯\æwþ\Õø¡yð\ãþ\åñL°¸{yþ+|døCð½\Ê;!š\Îþÿ\0Yñv£n\ÅH,“i\Þ\rºWCòº\åXH òi<’x\0w¯öüÿ\0‚SxE¼ÿ\0\Äÿ\0‚yxNX>\Íw¤~\Å³z”%v\Ö.¾ø6ûYÜ§\ÇUº¼f\ÏÍ’s\ÎküW>xo‹>|,·P\×þ,ü9ð\n\Ù\ÃM\ã/h\Þˆp_QPp	\Ç@kýÚ¾x2\Ç\á\ÏÃ¯\0ü=\Ò\Ò8ô\ßø+\Â\ÞÓ£ˆm‰,|/¡Xh–‰\Z\àb5·±P`a@(µ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šðo\ÚöŒømû5x\ZüB\Õ9.>\Ñm\áŸ\rZ\Ék\Þ,Õ¡‰dþ\Ï\Ò-X–ò¡ó!}KS•E†•±Iw(’{H.}«*Ì³\Ì\Ç”døNe™\æ\á†Á`p”¥[ˆ­=¡NœSn\É9NNÐ§N2©RQ„e%\ãñ\ä|)’f|IÄ¹®$È²l%Lviš\æ5\á†Áà°´’\æ«Z­F’¼œiÓ„yªV«:th\ÂujB\î>\'üRð/Á\Ï\ê¾<ø‹\âOøoHˆ¼\×W%ž{©\Ø#O\Ól\âs¨\ê7l<»[+H\äžV\É\n]\×ùgý²m¿~Õž$ûý§Â¿	4+×—Âž‚\åÉ¼š#4PøŸ\Å\ÒFþN§\âI\à•\Ò\ÞLðõ¤a¥¬·3j\ÚÎµ\ç´\ç\íUñ+ö ñŒ¾ ñ…\ëXx~\ÊY“\Ã°¹œ\è~²fùDQ¿–/5	QP\Þ\ê·-\ÕÜ€q\r´vö¶þ\à¯x§\â\'‰ôx3D¿ñˆõ\Û\È\ì´\Ý/N\î.\'šCÔ…b†$\r5\Å\Ä\Í½´\Éqq,PE$‹þžxôy\Éü/\ÂG‹ø\Êx,o\Ã\r,K­Zt\ÞUÂ˜uIÊº\ÂÖ¨\Õ\ã¡Ocsiµ\n4Ô¨\à:>\ßŒÿ\0þ–Lþ&ñó1©á¿†Tó\\¯\ÃZ¸\êxapÔ±\âñ’¯\nxIfj	\âieu1\Í\å\\9N2­‰«*x¬\ÕVÅ¼&+\ÂÓ´\ëýZú\ÓL\Ó,\îu\rBþ\â+[;+8d¸ºº¹\Ö8`‚•\ä–YdeD™™‚¨$_\Ño\ìÿ\0\äÓ¾C¥|]ø\é¦\Ûj\ß\æH/ü5à«¨\ã¹\Ó<\nÙ ¾Õ‘·Ã¨ø¬$5ž€Gi\Õ6Í§ú\×\ìMÿ\0þð§\ì\écc\ã\Åaâ¯Œ70,Ÿk(—ZGƒ<\Õ\ìô21\çj)“Î¶Ê²1\Ìv+o\æ—ô’¿	ú@}&ªñ\Z\Æp_‡x\Ê\Ølº˜lãˆ¨¹Q\Ä\çqø*`ò\Ù{µp\ÙTµUñ\æ#1\î\ã\ì°N¤qŸÖ¿CŸ –‚žYâ‡9n\Å\éQ\Çp\Ïb£O‚\áZšU¡™ç¼ðø\î\"§\î\Ï‚j¦$¨½¼\Þ#4\å…Q_\Å\'ú–QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0q¿> xC\áG€|kñC\â·i\á¯ü;ð§ˆ<m\ã_š/†|/¥]kZÞ§p#W‘\ã²Ó¬®\'1Ä’M.Á1¼®ˆ\ÇþMÿ\0cø¥ÿ\0Yý«5ÿ\0\êzŽ¥£ü\0ø©jþýþ»ˆ\ìü1\áž8¥ñ­,b\Ô<a\â\Ói£¬jR*˜-þÇ¥\ÚEo£ù\ßÛ‡ü3ûo\ßüýƒþ~\É^\r\Ö\îtŸ\Z~\ØˆñjCg¼]|øB¶^$ñuŒZ˜M*ûSø©|&·\Ì$º–‰t¹D–7W‘¿ùƒPEPEPEPõ\'ÿ\0\ÈÁcüIûþÓº\'\ì³ñ\Æ\Øÿ\0ö–ñu–“¨\Ù\ëWÏ£ü$ø¹­-¶\áßˆú0&FÑ¬¼C4:_†|v–±›MF\Ähú®£	—\ÃÖ·–¿\ê\Å‰*$±:Iˆ²G$l$G‘\ÑÔ•de!•”À‚	¿À, AA‚\èA\èký‘ÿ\0\à\Þ\ïÛ“Rý¾\à–\0>(x¿V}g\â¿\ÃHõO\Ù÷\ã%\ì\Ò\Ü\\\Ý\Þøó\áJiövZ\î£y=½´wZ·~\ê~ñö¯ö(…Ž§â«½*Ý˜X1 \Û\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nþ-ÿ\0\àö/‹ú^‹û\r~\Ë_\Öx\×_øƒûQ\Ãñ)`\Ü|\çð\ï\Ã…¿¼?~B†\Émc\ân†\ÌÌ¤ùF›?\ÚEœ?ü\ïã»‹\ÏÚö%ød&?eð\çÀ?ø\í\í\Ãyþ4ø‡\'‡ã™—±òü\"#wù\Çj\0þf¿\àŸ\â?üCþ	\ã\áx¢i¢\Û#öv\×5\Ö3&\íÂ¿ü1\â`2€p¦h÷J\ì~TV,\Ü_\í»_\ä»ÿ\0›|)\Ñþ(Ác~\ßkVyÂŸ„ÿ\0>+Y*\à,\ZÆ‹§\é>Ñ®\äÜ­ò\Ûj>+·‘q†2ˆÀe\Îkýh¨\0¢Š(\0¢Š(\0¢Š(\0¢Šü÷ý¶?o/þ\Ì:\\þð\ÛXø¯\ã>§e\æXx}eI´ÿ\0Áu{]k\Å\Æ)‘4±È·:^†¥/uü»©Í¦›,7?GÂœ\'Ÿñ¶yƒ\á\Þ\ZË«fY¦6V…*k–\ZQk\Ú\âñu¥jx\\%%*ØŠÒ8\'\Ý\Îp„¾\'\Ä?8?Â¾\Ìø×Žsœ6GepN®\"»r­Š\Ä\ÍK\êù~]……\ë\ãó,d¢\á…Áa¡:\ÕZ”\í\ZT\êÔ‡ª~\Õßµ÷Ã¯\Ù[\Â-©k\îºÿ\0õKy?\áð\ÜP\êZ´ü¢^\ê2‘!\Òt%\Ç\Úõ)!–G\nð\Ø[^\\ƒÿ\0*\ß\Zþ7üGý <u¨üAø™®É¬k7Ÿ¸²´…^\ßEðö•³\Ú\è~\Ó²Ç¦i6›Ù’ ò\Ü\Ý\\I>¡©\Ý\ß\ê—w—\×\Ç\Äˆ~2ø¥\â\Í_\Æþ<×¯¼E\â]n\å®/µ+\çVv\É>\\\Ç\Z¤6Ö¶\éˆm­m\ãŠ\Þ\ÞH¡‰#UQ\éß³\ì\Ûñöšñ\Ü>ðŸ‹[_³\Ýx£\Ä÷ˆ\ë¡øSIšFAªN¸\ß4\æ9“M\Ó`&ûSž)R\Ý0^\\\Úÿ\0©žøAÁ¾ð\æ3ˆ³\Ìv®{­\Ä<Wµ,._†J2©€Ê½ª\ç\Ã`UNX9(¬nk_\ÙûXÿ\0º\à°ÿ\0\à\Ò\é%\âw\Ò\ãò\Þ\áL«7\Ãð\\\Ú^ðó+\æ\Äcó|sr…ßˆ>®ýž;6•/iYFRy_`ý¼hT\Ó1\Íq¼7Â„ž>ø\Ù\ãM+À_´½\Ä\Z¬Ê‹*R\Ò\Â\Ûr‰õ-Võ‡\Ùô\í6\Í	–\êò\å\Ò(\Ñp7H\Éÿ\0Sÿ\0±\ç\ìa\à_\ÙS\Âhcž&ø£­ZF<aã§¶*Ä¹¾…á¤|ý7Ã¶’\\‘\îµ4K¨jKzv›\è?³_\ì¿ð\Óöbðd~\ZðE€¹\Ö/\"¼Q\ãø¢:\ï‰/#‹\ÜJ£º|R3ý‹K·+kj„\çNdžO£\ëø\ÏÇŸ¤^e\âMZü5\Ã2\Ä\å\\F­ª\'\ÍG\Äs¥$\á_1IóQÀFqU0¹m\í)(\â1¼õ\ãB–ý9ú\"}\nrOðøN9\ãºx ñ[‡½VSÁ4±J®&”\ãË‰\Îe	:8üõE8A\ÔÁe~\Ï	<V\'2(¢Šþ\\?¿Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ó:ÿ\0ƒ\Ù|s«jðPo\Ùc\á¬\Ò¡xKö6\Ó<s¦Ã“¶=[\â\Æß‹úµ(^€\Ëgð\Ã@V=XB ý\Ñ_\Æe]ðz.§%ÿ\0ü_\á\r£\Û\Å\nh¿°\ÇÂ6)c¸i\Þ\ífø\ÙûF\ë\r4ñ›xEœ©&ª\Ö\Â\Õd»\r^…k³kmü‹\ÐEPEPEP_Ý¿ü\áû|~\Íÿ\0³Ÿ€?l‚Ÿ´—\í-ð\Ã\à¤^&ñ·\Ã_ü5\Ò>1üOð§\Ã\Ï_Ü®¯h.—\Â\Ç\Åú®“g{­\ê|65˜\ìg–\à\Ùhús\ÏŠqü$Q@\ïmðû\â\ßÂŸ‹ZTz\ïÂ¯‰¿~&\è“ –g\á÷<7\ã=*X\ÉÀ’=CÃš–¥h\èO\Öb¹\ï^…_\àc\á¿x\ßÁ·w\áø«Â·Hr—>ñ¯¡\Ü!\Îr³iw–²)\È†Šú\Ï\á¿ü»þ\nðŠ\îÏ‡?¶÷\íS\áf¶\Ù\ä\Ú\Ùüuø‘s¥¨Œ†EmQñ\r\æ‘\"‚\0)%“«/\ÊÀ¯þ\ãtWù|6ÿ\0ƒ£ÿ\0àµ¿4\Û]\'þ\Z³Nñí¡ÄŸƒ¿|Q©J\0mÖ¾<a\â Bò\Ó\ê²>I!Á$\×\Þÿ\0\àó\ßø)„e´O‹?¿fÏŒ0ºý¬\Ù\è(øo«\ÞD!o´}Y\Ó-§aÿ\0-SAx\ä[cŠ\0ÿ\0Oj+ø/ð‡ü\à[…³Ç¿ðNi¶\Ô.ü!ûKhþ#RøQq5žŸ¬üð±\n[{\Ãm>¦\ÅF\Ø\Þ\íˆ2Ÿ\Ñ?‚ðx‡ü³\â$\Ð[|T²ø\çû>¼Šžu\ïŠ~j<\ÒmÝ¾øi¾/Šuy3Õ¢\ÐÙ˜r©Ÿ–€?«\Ú+ðÿ\0ÁŸðr/ü/Ç·°iú\í\ç\àk[«–U„x·\á·\Ç‡ðbªª÷ž<øW\á»8‰,8–\á1\É<+úqðsö¸ý—ÿ\0hKX/>üøKñB+˜ü\Ø#ðwŽt\rbñ\Ónò\ß\Ùö÷¦ýv¯\ÌÁí”¨p4ôEQ@Q@Q@Q@Q@Q@Q@”ü\Íñ²\ç\â¯ü\Æ^2Ó¿gß‚~i\è¥HY57Røµ©±\Û\ÑÎ£ñ:x˜?\Î\n	\Úõ~¯ñxÿ\0‚óø\×þ\ïø,Gü#^[•¼Ž\×öˆñ/„b$\Æaøc¥x(\ãu,¥!O\rˆ—iÀ	@¹ðe\Ã­cöòý§¾.I§\Ï&™\à_\ÙV÷Áqj@²\Ú\ë>?ø©ð\ãS‚ÕO´\Ü\éž\Õ,\r\Ân@bú^Wðýÿ\0Cø2+?\Ù{ö\ßø†m#ø‡\ã\ß\Ãÿ\0%ñˆy\Íƒ¾É®Ih³»\ËGñ\ÔS<JB\î‘;þ\àh\0¢Š(\0¢Š(\0¢‚p	<\É\'€\0\êI¯\Ã/\Û\Çþ\nU“\ë_g]efºCq¥x\Ëâ†›+ ‘I†\ïFð=\äL¢Y‡†ó\Å3Ã\Ñ\èrH\êg\ï|:ð\ã‰üN\Ï\éd<7„u\Zä«˜\æ5”¡—e9K–X¼uuÊ´’£B\nXŒUD\éÐ§6¤\ãù^7p\'€üˆ\âþ8\ÌU(\Ë\ÚP\ÉrL,©\ÔÎ¸2Œ9£—\å8I\Î¤—4%‹\Å\ÔpÁ\à(\ÉV\ÅÖ§SU=»ö\ëÿ\0‚Š\èÿ\0mµo…Ÿo¬µÏ‹sE5–­\âXo´_‡fE\Ø\í±Ä–š¿Š\ÑY¶œ\âm?I˜-Æ²—\Z\é\ÍÎ³­jþ\"\Õõ-_Ô¯µoY¾¹\Ôõm[Sºš÷QÔµÙž{»\Û\ÛË‡’{›«‰\åši\ä‘Ø³1\'5Fyæ¹š[‹™dž\âyY§™\ÚIf–F/$²\È\ä³\É#’\î\ìK;\ÌI$\×\èo\ìGûø»ö˜\Õ ñ—Š\ã¿ð§Á2ómÖº\Ñyþ/¹´ŸmÖ\áDš(\Þ7¶\ÔõÂc§\Ë\æ[@nõg¶·ÿ\0Qx[„¼9ú8p6/0\Å\â\è\á\Ô)Sž{\Äx\ÈCûS<\Ç(¿eƒ\ÂQ‹•GOžnQ…s8óÕ«*µž+?ð+üFñ·\é¹\â¾]“\å\Ùn\'*•\ëS\á>	\Ë*\ÔY	\åNpŽ\'2\Ì15:\np¤\é\Ô\Ï8“09×’§‡¡\nh\åùe/*ý“?c¯ˆ¿µO‹\ÓFŠOøJº€x\ÃÇ·–\ìö:]»~ñ\ìt¨Y¢þ\Øñ\ÌJV\ÓN†EŽ\"\és¨\ÜZY5¿ªOƒ>üð.™ð÷á¦‡¢X-\ÝÔ‚)µŸjq\Ý\ë\Þ\"\ÔR[S\Ö/|´ó§1\Åoo\nCa§Z\Øé––vVýO<\á†~\Ñü\àm\n\ÇÃžÐ­R\ÓN\Òôø„qFªù¦s™n¯.3]\ÞÜ¼·WS³\Íq,’1c\×Wù\é\ãWŽ¹ÿ\0‹Y—\Õ\ã\írŽÀ\×sÊ²T»­8\Þ0\ÌsyÁòb±ò‹~Îš¾NNŽJ¤±¬Oû9ô\\ú%ð\Ñ\Ó$X\Ùý[ˆüI\Íp±§ŸñuJŽœ\ÔgS$\áºuc\íp=9\Å{j\ÍG›Õ„q\çNŒ0x	EW\áõ¸QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEüÁ\í²Æ§©xGöCý²´[	f\Ó|/«x«\àŽ®­\í4\Èm\ì›\Ä\Ñ/Œüq¨Þ´ñ\ê\×\Ó\ßK¢x¦\Ê\Â\Þ;{‹[­.Iak´Wÿ\0=ªÿ\0s¯\Û\×ö9øsû~~\Èÿ\0¿dÏŠ>e¯‡>.xB\ãJ°\×\íbIµ/x¿M¸ƒZðO4µg‹Ì¼ð¿Š´\í+Vk3<\ê\Öv÷z-\ì‡NÔ¯#ñBý¨¿f‹¿±\ç\Ç\ïŠ³g\ÇO\ÜøS\âw\Â_xk\Ä:|\É0µ½HH›Jñ‰s4PK\Ã~\'\Ò&²\×ü9ª¤k¥£j6Wj©\æ”P¢Š(\0¢Š(\0¢Š(\0¯ô\Úÿ\0ƒn¿\àŸ²\ïÿ\0\à“\Þñ¯\í“û(|ø³\â\Ú;Ç¾\"ø­\á½k\âƒ|;\âoAð®\â\ÃJ\Ñ<šO‰\Ôø‹\ÃV·«c­j\çO\Óu[/4jP\\\ÜF_\É+ü0Á\"\à›¿à¨¿¶\Ç\Ã/\Ù\Ë\Ã6šŸ\Ã\È/añ·\Ç\ß\Ù*¤¾x~öÑ¼Sª}©\Õ\Ò-w_y\ìü\à\Ø|›¯7Å¾\"\Ñåº·\ZM¶§wiþ\Ñþð\'„þø#\Â_|¡i¾ðg¼=¤xW\Âþ\Ñ\ì­ôý3H\ÐôK(tý:\Æ\Ê\Ê\Ò8m­\á‚\Ú\Ô$Q\"\ç-Œ“@‚_?\à\ÖOø\"—\Ä‰\ï!ý—u\ß\0]\Î]ŒŸþ4ü]\Ð\í\â.K#J\Ô<a¬\è±\'\äE\Óv UB|µðOÆŸø2óþ	\ã\ãGÁ?Ž´_ÁmY‘„Sëº‡†>,\è±\ÊI*Í¤\ßiž\Ô\äA\nb#\ØõÁ‰5ýˆ\Ñ@\ç£\ã_ø1\×\â³\Ìÿ\0\à¡þ\r\Öc,~\Ïk\ã_\Ù\Û[ðÓªö_\è_¼V¬Þ¬šrökó\ãüóÿ\0]øq¨y?	\àø+ûDi­¿mÿ\0„þ%h>¹P •ótÿ\0Š—¾UgÀP\"½U\ÌûAjÿ\0Tª(üp|mÿ\0\áÿ\0Ák¼\Ô\Ú\ç\ìñú\Þ\Ñ$’Yü!\ãÏ‚þ>VŠ0\Ä\É~ø•\â	\äT°E‡\ÍÁ\0\Æ_—¿f/\Ú+\àŽ§}£ü]øñO\áÖ¡¦»¥ô>,ð?ˆtx\í\Ú2Cïºº°KB ¾“²\Èb9¯÷…¢€?ÀŠÿ\0x¿Š?³W\ì÷ñ·K»Ñ¾.üøañM¿]\Ûø»Á>\ÖL\Ù$’\Ó\Ý\Ø\Ér,Nô™_\'9\Í~^x\ëþ\r\Îÿ\0‚+|F»»¾ñ\ìð\ê\Ú\îúYg¸›\Â5ø\Çðð¥%žH\áðÄ\r[\ÂwÁb…#S\Ñ1\Å\0—\ÃŸ¾\n\êqk?¾-üEøm©\Â\Èñ\Ýø/\Åúï‡œ2r…—M½·ŽM½„ˆÀt\Æ+õ\á¯ü7ÿ\0œøM§&•\à\ï\Û\Ç\â[\ØFP\ÇŒ¼)ð›\âc&\ÅÚ¡\'ø•ð÷Å·\n»@‚P¯€\\1\0\×÷kñ§þþÿ\0‚LüC°º‹\á~›ñ«\à£,r-µï„¾(ø‹\Ç¶²¶LrŠ7ž.y\Ö<\å½ò\ïUÁpÄµ~nø\×þvøqs\Ëü:ÿ\0‚†ø\ÛG˜+;_\Zþ\Ï:‰bgþ¹¾Ð¾+xQ\Ñq÷¤‹Ns\ÇsÀ\âŸÁ\ßø;·þ\nûðõ\á_ˆ\Þ7øIñ\î\Ý&1ñ·Áÿ\0xBúh·h>\ÑðŸDð%œjW\äºi\0	fl“úa\à\ßø>#\âÕ­¬~?ÿ\0‚z|<ñ=\Ú\"-\åß„¿hoø&+‡,6z·\Âo}Ü°®¦\0œÀù›\ãoümÿ\0ðt\Êÿ\0¾=þ\Î\ß,2w\ÏâŸ„:ÀP¤ƒ…Ý‡´·$\ápþ ˆ\ä¶?üAÿ\0ƒWÿ\0àµž†[›ÙÃž?¶Œ·\ï>|køG«\Í&\ÞñiÚ§‹t=Y·W6\0œ\ãPýP|\Zÿ\0ƒ\Õ?a=´??f¯\Ú\à\ì’l\Ô<)ñkN¶-þ°‰£ojÆ‡8eÒ•\Ýyò”üµú\àŸø:\ÏþŸ\ã‹;K\ï\ÚGÆžžñ\Ò56øñ’\Þ\Þ\Ý\ß^jð‰t\ÛdRpóKx \\e\Û\Í™/\Ä\Ïø%÷üs\à\î©y¤|Fý…ÿ\0j\ï\Ï`H¸¼ÿ\0…ñWÐˆRAko\è^\Õ<;{Áýå–©q0Û°\ÊO\È\Þ(øqñÁ\Ék\ãOø\Ï\Â11YmüQ\á}s@ž&S†Y!\Õlm$F‚Aƒ@\í{ð£þ\n\Çÿ\0\Îø\Ýkkuð\×ö\ëý—õ\ÃxŠöö7ÿ\0ü!\áMe÷tG\Ð|_©h:\Ü3ù\á6ŸÃ¼b¾\Ìð¯\Å?†>;E“Á¼\ã(\ÝC#øW\Åþñ\n:žŒ­¤j”ö {Wø!\×E\áox·À\ÚÍ¯ˆ¼\âx?\ÄMº\Ï]ð¶·©øY´`Cµ\Õ4››K\Ø \Å:€z@\ï­Eˆÿ\0€?\à¯_ðTŸ…öð\Ùø\'þ\n	û\\iv01i\×<¯é©´a\â]\â-kV± Œ5¹pAW\ß\ß\à\è\ßø,§Á†\Û{ûF\èÿ\0\Zl÷†[\Þ\0ð÷ŠU@\0y\Ú>\Â:\ë!\ÆO™«;\äœ8 õâ¢¿\Ì\ÃÁ\ßðz÷ü7LŽ\Ú/þÌ¿±\ç‹V%Už\ãC\Ñþ1ø:öèŽ²;\Ïñc\ÅVQH\ßô\ÇOH\Çh«ô›\à§ü\çðN\î\Îÿ\0h¿\Ø\ÃâŸ‡\ï\Äq‹¯‚ž)ð—Œ,\Ú_ùla°ñÖ¯\ài–0y‰_Rv?u\Ücq\0þ\êh¯\åÀ¿ðx÷üK\Å\×V–ºß‡ÿ\0k†\Æ\å\Ò9.¼kð‡À÷66Œ\ßy\ç›À¿|i/’‡9‘-Ùˆ\ç\ËÀýFø[ÿ\0\ãÿ\0‚B|Y\Ó,u-öûý<(\×è®ºo\Å/ˆZ\Â\ÍNÔ±Ç—}Ž\î´8­\\½\æ\\m\æÝ·š\0ýe\Ôõ}+N\Ô5K¶	k¦\Ù]\ßÜ¹8	og—1\'€8Ø’xÉ¯ðbø\ÙñRø½ñ\â¯\Å]b\âK½S\âG\Ä_\Zx\æþ\æVf’{¯ø‹QÖ¥‘\Ù\Éb\Ì×§;Žkýši¿ø(÷\ìU/\ì‰ûPx\ß\ág\í{û4|L\Ô|1û>|[\×t»/†_>x\ïUº¿·ð6´4¡cc\ájWW/.§%œI\ä#\Ò)\\œþ)þ®ðhoÁ›Ÿ…ÿ\0ðH_ø\Îö\ßÉ¸øõñ\ã\â\×\Åw1”i´2m\ámƒ\î\'÷Šeøuz\È\Ã‡\ÚA\'úˆ¯\Èø ‡‚§øÿ\0sÿ\0‚|ø~\æÝ­\'¸ø£x²H\Z7Fø­kž=\Ü\èÀ2¼ƒÄ¢V¹\Í~¼PEPTu=ONÑ´û\Ý[W¾´\Ó4½6\Úk\ÝCQ¿¸Š\Ò\Ê\Ê\Ò\Þ6–{›«™\Ù!‚cVy%‘\ÕA,@¬¿ø»\Ã>ð\æ­\â\ï\ëz‡|5¡Z=ö«¬j“‹{;;xð2\ÌròK+•†\Þ\Ú’\æ\ê\âH­í¢–yc¿™Û‹öüñ?\íª\ÞøÀW:†~X\\\ã±\rö]O\Æ\ÒÁ\'Éªø\Êb\ÉdYDº~†$6ö\ë²kß´^0~½\áƒœI\â\ÖuõLº2ÀdX*þ\Ú\â\Zô¥,.\n›´ž½ÕŒÌªÁÞ†*j®\"th{\ïù¿\éô™\à£§hgu!›ñniF¯ú­Á˜LE:yŽkZ7‡\×1’µIe¹­–/2«J|\ÒR\Ã\à¨\â±_¹^\ÅûvÁHµ‰\'YøEðQº\Ò~q¦øŸ\Æ\Ö\æ[M[Æ¨Ê¸±\Ñ\ä\'\Ó|+(²a/uøX¬¿gÒ\íµ\ÇnX÷fc\îI$þd“ùš\0,@$ŸÌŸó\É?S_»?°‡üP¼z?\Æ/\Ú;Cd5/ü,\Õ!’9Â†óm5\Ú>Æ‡\Í_.{_Î¢`…·£…Œ\ÚQÿ\0J1X¿¾\\FÁa#Ì°øj~Î·qVo\Zq\ç©)?g,V&Wƒ¯ˆŸ²À\å\Ô%N\ê\ØuB‹ÿ\0\r°9Žÿ\0N_\êÕYæ¹Œý›\Æcªª\Ø^ðû‡\'^^Ê” ½¬0\Zv©õ\\\'ˆÍ³¬\\+U“\Æ\â\åŠ\Ä\Ç\Ä?a_ø\'&­ñŠ}+\â¯\Æ\Û\í\áLR¥Þ\ái>Õ§k¿Œd˜\ËÈow£xQ¤\í\Z„E5\rböú;\ÚG \Ö-ÿ\0£\Í#HÒ¼?¥i\Ú…¦Xh\Ú.‘em§iZN•i†›¦\éöq,–VV±\Åmiim\n$P[Á\ZEj¨Šª\0«±EGG0Æ‘CH±\ÅQ¨H\ãŽ44@@UP@\0\n’¿Ì¯<Z\â3Ç™\çu~­—aeR.C‡©7—\åXyµ~T\íõŒut¢ñ˜ú±Uk\Ê1„#GK†£þ\î}¾Ž\Üôx\á8\ä<-†X\Ü\ï\n58£‹±”i\Ç8\âm8»s\É9ýK*\ÃNSYnOB£\Ã`\á)Õ©<V>¾3Š(¢Šü¸ýô(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+ù\Ôÿ\0‚ûÿ\0Á	|ÿ\0aøSmñ\'\ách>ý¶¾h3\Ùü6ñ¦¥‹\râ‡…\à–\ãPo„_o ‚Y¢°–\î\â\ê\ïÁ>)x®%ð†¹yuÑ¾ƒ­kŸ\Ñ]þŸ´7\ì\áñ\ÏöOø¯âÿ\0´_\Ã|$ø§\à\ë³k­øK\Å\Úk\ØÝˆØ“kªiwJeÓµ\íTˆ½\Äzæ£¡kV/î—¨]\Ú\Ë\Í\âUþ\â?·\'ü{ö:ÿ\0‚‹|>ÿ\0…{ûUü\Ð|wœ7Qøg\ÆV\ÑG¤|Eð<÷\ÒX½\å\ïƒ<gmjš%\Í\Òé¶\\ª´ö—6Ñ˜.-eŠ\×ñkûZÿ\0Á“?#×ŸUý‡?k/‡:§‡õ\rSRžO~\Óv-ðeÏ…ô©%ß¦Xiþ7øk\á‰\Ï\â\É\à‰Œ\Ü\êðÁo-$ý\ãHû\0?ƒŠ+úµñGü\Åÿ\0tðú»i:\Ç\ì‘ã‚€•Oügñe£KŽ~xAn\Þk\Æ?¼Eyw…¿\à\Ò/ø-ˆ<g§x_WøMðoÀúô¦+Ÿˆþ\'øûðþóÁš:‚\0¸\Ô\ì|{\â\ïˆr@A-ÀzµÀ\0ÿ\0£\îÀ \Ì\Ý}¹ûÁ=?jø(÷Æ7\à§\ì¿ð\ßTñv¨g±—\Æ>0ž	\ìüð\Ï@»¸0¿‰|{â‡ˆ\éúœŠ“µ«\É&«­M\Ùh¶÷Ÿ¹\Ú\ß\ì]ÿ\0Sø@ŸDñO\í\çûN^xþ\á-\í®5o„¿³\æ›y\á\Ç}³U‚ûM¸ø£\â˜\á(ñ›û\ÍP°\Ôt\ßxù&‚ò\Î\ê\Îh%Iöyû3~\Ê³—\ìoð\Ò\Ë\á\ì\ÅðÁ¾Y\Ïö\Ù4/\éihú®¦`†\ÕõŸj\Ó5Æ³\â]nKk{{i5{P\Ôukomh.µ¼\ÆñŸüSþ	Gðþ	;û7\Ù|\"øekg\âO‰\Þ,]3[ø\ëñž\çNŠ\ß\Ä|]io*Cœ\Ê\×v>ðÉ»¾´ðo†¼\ãk¦Cw¨jOö¾·«\Ü\Üþ¨\ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0\Åø\Ó\á¿Ã¿‰:lº7\ÄO\0ø/\Ç\ÚDÑ˜¦Ò¼i\ám\Å:l±6G-Ž¹c}k$d€J<ENEv”Pæ¿?\àŽðJOˆ7—¾(ÿ\0‚wþ\Çó\ß_\Èó^\ß\é?>ø_P¹šO¿4·\Þ\Ñtk¶™º™|\ï3<\î\Í~y|hÿ\0ƒU\àŽ\Ú\î]3\àþ\n\Ý]\n\Üüø•«hkh\Òg\ÓOñu§ôx\Äg˜\ã“M–!À1²ñ_Ñ­übx\Ëþ™ý€\ï,n—\á÷\íUû`øwRh\Û\ìSx\Êÿ\0à¿Œ\ìc—ø~\Õm¢|%ðóFy\"»·aÀœmo\ÌßŒ\ßðd‡\í)c+\Éû<þØ¿¼S	’\×\ã6\ã\ßJ±\î8ß¨x#Â¿œ&\Zj)l”ôm¢€?Ê·\âGü\ãÿ\0rðž÷ú%÷\ì¯ñ`\Æ$&\Ã\á¿\Å\Ï. B.\á²ˆ_\n~\Ç!“‘I˜\îp™\\þ\\|Mÿ\0‚Á]~js\éš\ßü\ëöŸñ\'’\ì‚ÿ\0\á—Â¯üT\Ó\'\Û\Õ\à»ø}§øˆ2\áfD\Ý\Ðx¯ö™¢€?\Âg\âg\ìiû_ü\ß?e?\ÚK\á*§.\ß>|OðA€r\ç\Å>Ò‚ðA\ç{\×\ÎG$N\ÑÊˆJ¼r+#£¡•€e#¸ \Zÿ\0~\r_B\ÐüAjö:ö¥kvR²Y\êúuž¥k\"žªö÷\Í\Ü2k\å¯ÿ\0Á?`Ïˆ—R\ß|Aý‰?d_^\Ü¯¼ñ\ì\Ûðk\Ä÷Su?½¸\Öü},œ±?;·S\êhü1â¹¸·\ß\äO4>dmžT¯™Œ<O±—tn8dl«5.Ÿeq©_\ÙiÖ¨dº¿»¶²¶Œ—ž\êd‚¹i$Prký~4ÁºðG\Ó\Ý\Ý\ë±_ÃŸ\0\Þ]¬§ø.u„0Bd\êöšOn´\nÕ”ó‡JTNŠx¯ƒ§ÿ\0ƒ=¿\à”6\Þ%\Ñ<U\áO~\Ö>\Ô<=\â\r\ÄZ}†ŸñgÁzÎ‰%ÆªZ\ê\Ø_\Úø«\áN»¨]i·-l-.\ãMV\Þñ\íd“Ê½†}³(ô“û=ü.³ø!ð\à\ÇÁ½>(¡³øWð·À_ Š\Z_øcLÐ›\Êa\Ã!{ea÷\ÝÞ½‚Š(\0¯3ø·ñÀ?üªxû\â6»o¡\è:j»¿{©Þ²“m¥iJDÚ†¥v\ãdÐŽ9–gŠ\ä•9\ÚöŽømû5ø\"\ã\Æ^?Ô€šE–/xj\ÊH›]ñ6¢‰”²\Óm²©*ou‚\ÚX\ÄÁ¥f•\à‚o\åcöšý©>$~\Óþ5—Äž2½kM\ÆY\ÓÂ¾²–A¢ør\ÆF!R˜´\êE´_js©¹º`@ò \Û\Çý\à€Y\çŠ\Ø\êyž=b2Ž	\ÂW\å\Çfüœ•ó)Ó—\ï2ü•T‹Z\îÜ˜Œd£<6\n\ï™V®£†Ÿñ—Ò³\éÂ¿G¼¦®E”<x§˜\áò®U=¦#§Z¹\Îx¢Tg\Z˜|*MUÁå‘<vj\ÒPxl§Ž§\è¶\í­\ã\ïÚ—Äl\Ò]xgáŽ“u!ðß‚m\îI…ö3¤ZÆ¾ñS\Öå‰\ÎÀ\Ú\Ø#µµ‚i\înþ7\ÒtO^\Ô\ìtm\Â\ïTÕµ;¨l´ý:\Æ	.o/.\îdX ¶¶·‰^Y¦šFTŽ4Vgf\n ’møÀ¾.ø•\âÁ^\Ð5x£_¼Ž\ÇJ\ÑôÈ„—3É’YžFŽ\Þ\Ö\Ú\ÖK‹\Ë\ëÉ­\ìl,\ážöú\æ\Ú\Î\Þy\ãþžb_\Ø#\Â³F“i\ã¥‡Š¾3\ê6joõuQs¤xAgŒy\ÚG…|øQ\Úu\Ü\Ð_kòG\Õ\ê\îŠ\Ò++7š;Ÿ\ïn:ñ\Ãï£¿\à²|·…†*8iC‡xOQCŒ’¼g\Ì+?iVŽU“–34\Å{ZøªÊ¤i,N!N1ÿ\0 ü%ðk\ÆO¦—‰y¯gy¶>¶_SN¯\Zø‹›Ò•\\Y¡:y>O…‹£C˜C(C,\È2÷C	—\á]\Z˜™`pr¥:¾;ûÿ\0Á94Ï„ƒIø¹ñ\ÃO´\Ö~\'÷†|#9†÷Gð€‰`Ô¯‚\ï·\Ôü[\í‰i¬<? \Û}£XKk\Í3õÖŠ+ü¶\ã®<\â_süOq>:X¼eo\Ý\á\èCšž-\Â)JT°v\Êk…¥\Ì\Ú\\Ò«Z¤§ˆ\ÄÕ­‰«V´ÿ\0\ß\Ï	|\"\ào8;Á\\•G/\ËpÖ­\ÆVä­›g™”¡b3|\ë\Zt\å\Ì1‘N\\”ðøj1¥ƒÀ\Ð\Â\à¨P\ÃR(¢Šø\ÓôÐ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯‘k\Û\á\ç\ì³\á7»\Ö\'ƒ\\ñö­k3xGÀ\Ö\×\0^\ê\0QuQ“{\éš\r¼¤‹\ÙÌ¸ \ÛX\Ç5\Ë_?ý·¿m\ïþ\Êú$>\Ò-]ø·\âm\ê~\Ñ\îO\ì\Í#Kž\æ÷O‡\ÄzËž|ö\Âö-:——“y\ÒAo2ÿ\0.¿>!x\Çâ—‹5ø\ï]¾ñ‰5»–¸¾\Ôo\å29\äùVð\'Z\Ù\Û!ò­m-\Ò;{x€Ž\Ñx¯\ë/\0~Ž\Ï%„\â\Þ/§[ÁP©\í0˜D\åGÄ®”Ú”hµi\áržxÊ|bq­ˆ´¨\à¹o,Uó³\é…ô\Ý\Ë<†a\á×†Õ°\ÙÇŠU(û\Ë0”!‰Ê¸8ŠJqž&½,Ãˆ*«„\Ë\Zž\ÍOšs¥O/\Åôÿ\0\Z~7|Bøù\ã}C\Çu¹õmVñ™--†b\Ó4k\0\ì\ÐizEˆc\r¸b$Ë»š\âY\î$–iðg\àŸ\ÄO^6Ó¼	ð\ãB¹\Ö5k\ÇF»¹\é¦h–b$ú¶µ}´\Ãa§[oS$Ò]\Ù %¸–_±ý›¿f?‰Ÿ´\çað·4Ö‹K´š\ÙüU\âû\Øe\Z…tÙœîº¿@\Þ\Ë\ZL4½\"š¥\Äl‘ù6°\Þ\ßYÿ\0Uß³¯\ì\Ûð\Ûöhð=·ƒü¦¡»š8$ñ/Š®\âŒ\ë\Þ*Ô£B\Z÷R¸\\˜\àFi>Ã¦@\Ëea°‰\Zi..\'þ±ñ‹\ÇðW&¡\Ã5„Ë±\\O:O\á#\nynC„T\Ôpø¬Òž\Ã\ØRŒ-<._OŒV›•\Zú\Ãÿ\0;þE>>úQñ>+8\ã1Î°W4­‹\â.3\Ì\'R¾y\Åù¶r\Æ\åù|ljýo*ŠT±ù\Íh\ÖÀåš”a‹\ÆRú”|\çöFý~þÊ¾TÓ£ƒ\Ä_5‹$‡Å¾<¸¶sr‰\ßGÐ£“tšN«0#Nkxo5\'v†\Î\Ú\Ç\ìj(¯òßˆ¸;\â\Ì\ãŸñcˆ\Í3lÂ««Š\Å\âeyK¤)R„Ti\Ð\ÃÑ‚T°øj§CJ1¥Fœ)\Æ1_\ï\×ðWxy\ÃYWðfK‚\È8w&Ã¬>.À\Ó\å„Võk×«\'*ø¼n*£•|n;R¶/‰LF&µZ\Õ\'6QE\âRQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\ç\íeÿ\0pÿ\0‚rþÄª\éß´G\íeðŸÂ¾/\Ñ\Þ\î\Þ÷á¾‰\â<kñ*\ÛQ´±Q\ZN¡\àl\ëº¡yk4XG\â[]Á24W72ÿ\01ÿ\0µ\Çü³ð\ÂCXðÿ\0\ìYû/ø\×\ã®‚\ê\×Løƒñ«Y‡áŸ‘\æ\Ò-§\Óu«	h‰\â\Zx‚^i\ìu_j>š\î6š\Ã\ÄP¤ð\Ê\0?¸\ÊùOöŒý¹ÿ\0c¯\ÙD¸\×ÿ\0io\Ú_\à\ÏÁ›+x¯\Ý-¼q\ã\ÍK\×ut\Ëµ]\éú†~\×/ˆüA¬¬?4\Z‡¥j\Z\Å\ãb+;\å`‡ü¥ÿ\0k\Ïø9;þ\n\Ûû`&³¤k´;|ð&µ£k7\Ã\ÏÙ¿H…ºZf¯¦>•©\è\Òø†;ýg\âF·¥][K3-·Š<s¯Im4†[Y\áp¤~ø›\Å^\'ñ®·}\â_x^ñoˆõIÚ—ˆ<M«\ê\Zö·¨\Ê –ûU\Õ..¯\î\äª¡\î\'‘‚€ \à@\ë\åû)Á\Ç\ßðM/\ÛSö\Èð\ç\ìYû>x“\âß‰üg\ãK?O\à‰º\×Ã˜|ð—\Å÷\Þ\Z\Ñ_\ÄZ‹/‹<G¤|P\Z\Õ\æ—kª\\\éöÚ§\Â\í6	#Ñµ).n­!Kin¿z+ü(?c\Ú7\Ä?²\ícû;~\Ó~7Ï©üø½\àˆ\éúv t«@\Ñ5\ÛI|W\á6\Ô@cgi\ã6³\ámFlº~¯t¿\Ü\ëÁž0ð\ß\Ä/øO\Ç\Þ\r\Õ\íuÿ\0x\ã\ÃZŒ<+¯X1{o\Ã~%\Ò\íu­W³v\0µ®¥¥\Þ\Ú\Þ[±\0´3! @-~Ù¿²…ÿ\0j¿‡\Ïb~É¢üKð\Ü7>ñsÅ*\à«H\Þ\×$Ž7ž\ãÃš¤¸*‰&\Ò\î™5;$‘–\ê\Îÿ\0ù<ñÇ‚<Sð\ßÅš\ïük£]\è\'ðÞ¡6›«\éWª\Ö\×0r®Œð\Ü[\ÏGqiwo$¶·–²\Ãuk4\ÖóE+ÿ\0qµù\ÛûzþÄšO\í/\ác\ã\Û\Ûi¿<+§ÊºMÚ¬pE\ã2\0Ò¯†µ™H\0\Ï2¶…¨9\Ýiq+\ÚN\Æ\Ê\ä›ë£o³\àLm\â\Ü\\¥Á¹…v°\ÚÒ”¿Õœ}y\Ý\Î\î\ídøº’¾.’÷pu\åõ\êj1ž1Uÿ\09>œ_C\ê~-å˜Ÿ|9\Ë\árl\"y¾U†„iÿ\0¯YFšŒi¨«)q.[B\n9mg\ï\æXH,ª³Jyd°ÿ\0…±_\í\â_\ÙO\â\Úfz\×\Âÿ\0\\ZA\ã\ï\nBcy\Þ„‘[ø‹\Ãþ|‘Eo\â\r%fwXžXm5«@ú]ü1°\Ôô¿\ëÁ¾2ð\Ï\Ä/h^5ðn³g\âø—O‡TÑµ{	<\Ë{»Y‚\\\ÛÊ²Z\ßY\\$Wv°\\Y^AÝ¼Ð§ñ­hÚ§‡umGB\Ö\ìn´\Í_I¼¸\Óõ>ö-\î\ì\ï-%x.-® ”,‘M¨ñº0YH¯\Ñø\'\çíµ¨~\Î^+Ox\âú\ê÷\àÏ‹57\Ð9’\áü­\Ý4p\éQ\0\ïöY‚¤zö\îŽú\ÝZú\Ña¼þƒúHø\rGp8óƒpô\åÅ¸<,*ã°˜U)\Ëh\Ò^\ÎTù=Ú¹¶¬X\ÞX\ì,c‚“œ¡‚öÆ¿B¥\æ#\ÂÞ‡„ž&\ãkSð\ç3\Ì*PÊ³Á\Î3ðÿ\0;\Ä\×j´+ûT§C†ñø¹M\æ”\'\Ë£R¦kÒ§W5u©:*ž¨\Øjöz¦—ym¨iº…´7–7\ÖsGqiwiq\Z\ËÅ¼ñ3G,2\Æ\ÊñÈŒU”‚\r\\¯ó\ZQ”%(N2„\á\'FI\ÆQ”]¥E\Ù\ÆQi¦šM5f¼p©\n°…ZSJu#Ó©	)\ÂpšR„\á8·FQjQ”[RM4\ÚaET”QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Q\\Ï‹¼k\à\ï‡þ\Õ<Y\ã\ÏxkÁ>\Ð\ì§Ôµ¿ø»]\Òü7\áýNµ]÷:†«¬\ë7VzvŸcl€½\Å\Ý\Ý\Ì6ð -$Š š\0é¨¯\ç“öµÿ\0ƒ \à’²\ã\ë\Z.ñ\Ò\ÚW\Æ\ÚS\Þ\Úÿ\0\Â;û;i2ø\ßB}B/¬\ã?g};\á\íö™©ˆ\àƒZð¾¿\â{(nh®LR@\è?˜\ß\ÚóþPý¨<nšß‡?b\ï\Ù\Ï\á\ßÀ\Í\"\éu-;\â7\ÅË«Š¿­\í/t¨a´Õ´¯\nX¾…\à\Äz.¬\×7V‡^<;vÉ¨\è2+\Ïn\0?\Ñÿ\0S\Ôô\ÝN¾\ÕõB\ÇI\Òt»KCS\Õ5;¸,4\í:\Â\Ò\'ž\îöúö\êH­­--`æ¸¹¸–8a‰IQIßµ·ü\ßþ	CûcKø£ûXø3\Å^8\Ñÿ\0´\í\äøgð^+ßŒ9—W\Ó!†\ì;»OE¨\èž¿¿Y‘tÛ¿k¾Ð®_pmb%VqþQ?µ?üþ\nûj\êW·ÿ\0´\Ç\í]ñ\âU¥\ì÷ÓŸK\âI<5\à©\Ù\r;SƒFøu\àøôhV:˜0^\é\Ú7‡\ìtûˆ\ÞE’Ø«°?P÷¿û]Á\ìšõû\êz\ì=û&[\èV%µ{‰´^¼š–»5¼Ö‘®›¨Áð\×À\×?\Ø\Ú¡c{\ç=Í÷Žüac}o\å\"µ«\ïcü\È~\Ö\ßð]?ø*wí ºž›ñkö·ø ø/Uk\äºøoðƒP“\á\æ±\Ô\ìþÃ¨hÚ•‡ŸJ\Õ<K¡]Û–\è¾.\Ö<A§ov‘-\Ñ\È#ò‡GÑµjvZ\'‡ôK\\\Öu;„´Ó´\Â\ëS\Ôõ©N#¶²°²Š{»»‰	I#žM~\ÍþÈŸðoWü“ö\Ì:^¥\à\Ùo\Ä|©.\à|Løùu\ÂÇ¥\ê\ßmX5›(¼K\Zø»\ÅV\ÒX\É¥¼+\âSOim¾Ó§\"\ÜFXñU\äy¼Žò9\ÆYØ³³Nž”\Ð	\è	\êx€\É?€ŸA\Í¡·\ìÿ\0NøEm\Ä¶\ß\íc¬x\âñF“y«|6ýŸ¼=ÿ\0¯†¢ž)\ï·¢\Ëñ\Æ+\â?i\×vÿ\0`m;Y±ðwo\íeK>›:˜ˆþœÿ\0dOø\"§üö\"mTøû&ü69ðú\é2\Ù|Qø‡¦‰\ß\"Õ´P¿bñŸ\âO\Z_þŸoQ4Ú—ƒlü6ò\Î<Òù òŽý‘ÿ\0\à¿ðR¿\Ûut=K\à\'\ìñCRðWˆM¹\Óþ\'x\ËF—\á\ç\ÃK\'VV{-OñwŒ†‘c\âEBÍ¨øUu\è‘J–\005úcûhÿ\0Á¯ÿ\0µ\Ï\ìû|Eý´¾6|Oøs¬kŸ/|&·ðáµ¾¥\âY´/x›]O\ëºç‰¼m¨¾ƒ¤\Û\'‡\ï\ï´H­¡ðõ‡‰WU}KcK§ˆK¿úÆªª\rª¡Wž\09\äð09<šù÷ö²ýŸ¼/ûVþ\Ìf\Ï%¨ðÿ\0\Æÿ\0„ž;øms}u¤iº\é\Ðo<S\á\Ûý7FñVŸ¦jö÷Z|\Ú\ç„5©´ÿ\0xzi\àf²\×t:úŽ\â\Ú)Pü\"«ý{ÿ\0\à\Ù\Ú\Ùj¿ø$ŸÀ{mS[mc\Ç³Ìº\Ç\ìõ\ãµjËª\ê¶ñøh\çðOö€[ka§F\Þ\Õ<7o¤\é­\ç5¾g`Lò,Škü~!ø\Å_\nüãŸ†:Ò¦Ð¼mð\ã\Æ>&ðŒt;‡I\'Ñ¼U\àýj÷\Ã\Þ!Ò¦’\"\Ñ<\Úv­§]\ÚHñ±FxX¡*A¯\í#þ¬ý°‡‚¿i\ÚOö%ñ>¼¶\Ú\'\Æ\ï\Ø|eø_¦_\ê¶\ÖÖ¯ñ\'\álË¦x\ÓH\Ðt§E¸Ô¼A\âÏ‡z\Ü^!¾’)\\Y\è?\îd0ª™d\0\èÿ\0EP\äwüköO‹º]ÿ\0\ÆÏ„\ÚR/\Ä\í\Ì\Í\âŸYDþ½&\Ò<½\å¬I€|S§Û©\Ø³\ëv±­©\ÍôV\Æo\æòhe‚Y ž7Šh£–)£\Æ\êJ²:0YH ‚2+û´¯Ã¯ø)/\ìý¶¯ûA|\Ñ+ø|\íC\â?„ô»uT¹™n¼Y¥Z@€\ß.»m\Z\å‰}R0I½ý\Ùôcú@ÿ\0g\Ë\á¯c_\ÔjN^\ÎñU4ÁT›Q¥‘\ã\ëMéƒ©+C,\ÄMÿ\0²Ô’ÁTV–\ê¿\ä§\Ó\Ç\èpóxf\Þ9xW•ÿ\0Â­\Zuqþ!p®Ž¹¥\ZkŸÅ™F\Z”uÌ¨ÁJ®}ƒ¥øP£	f”cõúxÕ˜x§ü‡öð?\r/ô\ï_u–uK‘o\àŸ\êe<«^N¸\Ó5K©\\|+4Ž\Â\é\ÉMöO:bšd÷S\Øÿ\0E\áƒ\0\ÊC+\0U\È Œ‚\à‚9pE	D21e?B¬\èA¯Þø&¿\í\åö¸´\Ù\ß\ã.°>\Ñ\nÁ¦ü/ñ~¡(S,*\nC\à\ív\îR’,$^\Ô&r\Ò#.‹1S›\æûI\ï£ÿ\0Ö–;Ä¾	À\ß<W\ä˜Jz\â`—5\\ÿ\0Fš\×y\æô ¿l\Â)V†.X”úý1³¥”ø\âžklº£¥€ð\çŠs\n\Ú`*IªxnÍ±5eþ\åVN4¸sV_\ì•2Y\Ë\ê³\ËcƒýÎ¢Š+üø?\Ù`¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šù3ö–ý¼?cO\Ø\ç\Ãòx—öŸý¦>|°j\Ù\Ùx\ÓÆºE§‰uÃ¥ª¶¡i\áo\Ú\Ïw\âÿ\0j–¡\Ó\Ì\Ñü/¡\êú±,¡,˜(\ë:+ø\âý¬ÿ\0\àó/\ØS\á\Öt/\ÙO\á/\Åo\Ú__´}J\ÏOñf»hŸ	>^Oµ¬\ÚV«du\è\ï|y¨h·³M=½\ÌZ„¼-¬\Ú=£\æÁ\ÒX\ä?\Ìg\íÿ\0`ÿ\0ÁV¿ixõ¿ü1ñ¿„d_\0\ê¿Ú–‹§|\r\Ð\ãoˆM£j–p\ÛÏ‹+\ZÇˆ´\íGO•&¹\ÒüKðö\Ó\á\æ½e$ÿ\0%\ë<I%\0©WÆ¯\Ú/\à/\ì\áá‹¯||ø\Çð\Û\àÿ\0†m,5\rMõ_ˆ~0\Ðü/öZTi\Ôe\Ó\á\Õom\îµF³€y³Á¦ÁwpªG\îŽ@?Î¯\íwÿ\0pÿ\0Á-g_\í\á¡ñö¼ñÕ‡ö¥¥—\Â-\n=\á\ØÕ¬\Ä\Äj\ß<o&‘§¾ª‰eòµ\ß\èŸ&¶00ŸG\Ë–ÿ\0\Äÿ\0Œþ6xŸSñ¯\Æ?‰ÿ\0>+x\ÃZ¾›S\ÕüQñ\Æ ñž¿©\êW8ûEýþ­\âCP¾º½¸\Ægºšwšc–‘Ù‰\'\Í\èú\Þý­¿\àñ/ø(\Ï\Æ\Æ\Õ4_\Ù\ÛÁÿ\0?d\ï]ÿ\0i[\ÚO¡\ØKñ3\âJ\Ø_Avÿ\0mñ¯‹ ƒEMSK•%ž\ÏSð\ï‚|6¦)ui:¢ü\Úþ\Ñ¶?\íWû\\kƒ\Ä?´\Ç\íñg\ãeüz…Æ«eüi¬\ëZ¨]Ä°]]x\ÃÜ¯†ü9%\ÌH±\Î4\'NY”~ñ[\'8¿f\Ú/öñ>ýž~üOøË¯\Í}i¦›‡ž\×<L–·\×ÁÍ¾¥}¦\ÙÍ§\éMt\Ì\r©\ÝZ$k\ZþŽÿ\0d/ø4\'þ\nqû@¶—®|t»øeû x\ì\éw7S|DÕ¤ñ¿\Ä\É4\Ëô¼7o£ü3ð<—1.¯¤Kmo\î\ã¯ü>2-ô2\Ø\Þ\Ý,s¬`\Ê}v¿þ\ZüFø±\â#Àÿ\0<\ã_‰^5ñ\ìzn\á\0xW\\ñŠ5\ÍF`LZ~ xv\ÇQÕµ;\Ù@&+K+I\ç“$f¿\ÔöGÿ\0ƒ?\àšŸN®ü{Ö¾(þ\Ö\Þ1°:M\Ý\ì^3\Õcð\ÃYµz5³ð‚\ÞA´-e\'µóôø¿\Å76f\Z\×Vk\×ô…û?~\Ê?³O\ì§\áˆ|û7ü\nø[ðWA‹N\Òô©\àø{\à\Ý\Ã\×úµž‹l¶šXñ¹ihº\ï‰\î­-\ÔG¡\â-KT\Ôni.Ù˜€–\ì…ÿ\0²ÿ\0ÁY?j4\Ðu\ßü&\Ñÿ\0e¿k1é·§_ý u…ðÿ\0Š!Òµ+Yn\ïþŽ“«\ã‹+\ëGH\íõ\Å:o…µ\Ë¥\Ûqd þœÿ\0doø2\çö>ø~ú\'ˆ¿l_?ÿ\0hMj\Î]6ûQðÃ¿#\á\ÃKÉ¡YF§¢jú\ÌXø®hw¥\ã1]ø\\øq®[˜²—€;-i”P\Å?³üöýŒô›m\'öfý–~|(6ñi\ÑI®\è¾°¾ñ–¢úK;i·š\çŽu\Õ\Õ|c¯\êv#˜µmk\\¿\Ô÷\Ív\Í\Í}­E\0QE\0QEþFðtg\ì“ÿ\0·ÿ\0iøÅ®i\Z\Zh\Þý¥4}ö€ð¯\Ùl4}+K¸¿ñ42hþ;\ZnŸ¤\È]<s¡\ë“\ß\Þ\êö\×z¦¯w¨j%óÌ‡ówþ	OûU\Þ~\Å_ðP\ß\ÙCöU}#Gð?Å¿Zx\Ò\çûZ\Ö_‡¾-™¼#\ã\Ë]WV¹W‚\ËE¸ð¶·ª.³4 Eýš.VVXÙsðzg\ì\'ÿ\0d\Ù\ëö\ÇðÞ%Öµû=üO¹økñö\Î\Ê\Ð4?>0\ÛFš&µ­\êRÈ—F\Ã\Ã_ô\r\Ã\ÚFŸl“o\Ô>(\Þ\Ý:$P\Ë\"ÿ\0š\í\0¿uõž§cg©i\×0\Þ\éú…­½õå»¬¶÷vwp¥Åµ\Ì©+$3\Ã\"KŠJº:°85j¿ ÿ\0\àƒÿ\0¶ý¶ÿ\0\à•Ÿ²g\Å\í[X}g\â‡üÁÏ‹S]ê«¬k\'\â?Áù\ÛÀú¶¯¯Ü­½²Áªx\ãI\Ó4?‰\"ÀF\ßa\Ó|i§\Ûed27\ë\å\0\×D•)QdŽEd’7P\è\èà«££¬¬¤«+ Ó¨¡6µZ5ªk 5t\ÓWOFšºi\îš?œ¿ø(\ï\ì#?\Ã]ORø\çð‹F’o‡šµ\Ë\Ýx\ÏÃšt\r!ðN¥s&\é5KH\"RW\Â÷Ò¿\Î\Ñn_\Ë8\Ó\åˆ\Ú~@A<\Ö\ÓEqo,O‹,3D\Å$ŠD;‘\ÑÔ†VR29ý\Ó\ê\Z}Ž­ay¥\êvvÚ†¨[Oe}cy\n\\Z\Ý\Ú\\\Æ\Ð\Ü[\\A*´r\Ã4N\Ñ\É©VV Œ\Zþbÿ\0à ¿°õ\ç\ìý\âI¾\"ü>°¸ºøC\âk\çeŽ%’s\à½Z\åšC£Þ¿\ÎË§\ÌÛ›I»…’0m$cs	kôƒ\è\Íô€\\EG\á\×\Z\ã\Ïpô–‡sŒUMs¼=(¥¯Ro\Þ\ÍhSV\ÃV“o1¡I\ßO›þ!};>‡O‚q9—^e¯ýP\Æbe‹\ã^\ZÀQv\áLn\"¥\çŸe”i/w‡q•\ç|v\ZQ\ÈñUZIeU\Ü2¿ÑŸø\'G\í\Ó\Æ\Ã\à\Ç\Å=V8þ)h–b\r\ë7Žþ­\Êˆe•\Î\Ä\Ú}¼lgV>f«i»M÷Q]\îýg¯\ákEÖµ_\ê\Úv»¡\ß\ÝizÆ‘yo¨iº”\Ïowe{i*\Íoso4edŠXeEtt`\Ê\Ê Œ\×õûþ\Ü\Zo\í-\á¡\à\ï\Z\Íg¥ücðÍ’B\Ù\nÁo\ã2HÏˆ´˜IÚ·*JgO‹þ=§asig<k\æI£ü¸g‹ñ‚ð_ñâªº\ÜA”a¡¦CŠ­4¥Ž\ÂR‚÷rŒUI^­(®\\»+C—Vœ0¿¼ý>˜\Ñ\ã¬&]\à×Š§üf\Ø\n\Ãpo\ãªû\Ü]—\á©{™>cˆ¨ýþ$ÀQƒX|EIs\çx8\'Q\Ï4\ÃÖ«˜~QEü\\¨EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEQ\ÔõM3E°º\ÕuF\ÇI\Ò\ìb3\Þ\êZÝ½……œ\n@i®¯.¤Š\Þ\Þ HI¤D€O\"¿k\Ïø8þ	Aû®©¦üJý«¼\ãŸi©Z¿\ÂßK\'\Æ?ÿ\0j\éL«u¢jø=®ü5\à\ÍM‹©¶Oˆ~&ð}¥Ú’\Ö\×r(b\0?f(¯ó\ãý­\àö?_ÿ\0l\è?±7\ì™g Û–\Ô\í4ˆß´ˆF­ª\É\Åjt}gþ×ƒ\r3L¼†cxº†‹u\ã?ZÈ«n\Öú°\Ü\à0ß¶üþ\n‡ûpÇ¯\è¿\Z¿kˆz\Ã\ß.«ið“\á]ó|)øgq¢kP}C\Ã:Æƒ\à¶\Ó/<i\á\Ùb«¦|A\Õ|\\‘‰$ \r€þ®µ—ü\ãþ	\Åû.µiûAþ\Ö?\n|7\â­	u”½øw\áýz|GMGA\Ú5-\n_xCûgYÓµø\Ö(ôf\r2\îi³Q³«ü\Åþ×¿ðz\ßÁ	g\Ã±\'\ìµ\âÏ‹ºªj\Ø\é¿~9k\Ëð\ßÀ–÷\Ëiý¯Xx\Ã\Ð\ëž7ñ†•{	¾[\íW\Öþ\ê–R-«\Ç}r­,kþtS\Ï=Ì¯=\Ì\Ò\ÜO+n–i\äye‘ºny$,\î\Ø\0e‰<TTû½û[Á\È\ßðV¯\Ú\ä\ê\Úf³ûG_|ðN©ý§ð\ìû¦\Åð\ËI‡L\Õ\ÝeÒ¥\×le»ñ¾­olmÕ¬.µ¿\êZ¥“I1†ý|\×\Ï\á÷‰|Q\â_\ZkºŸŠ|c\âwÅž&Ö®Z÷Yñ‰umC]\×uk\Ç\0=Þ§«\ê—Z…ýË…P\Ó\Ý\\K+\0¹\0W\é?\ì™ÿ\0`ÿ\0‚š~Ú£N¿øû%|O»ðž§&ž¶\ß|s¤Ÿ†¾{mV\ÖK\Í?S·ñ/Î‹mªh÷PD\Í­¢¦§§†(pŽ\èô\×û!Á“ÿ\0<C&•\â/Û‡ö­ð÷Ã¶›u}ð\Ëö}\ÐO|iyk=½\×ö¦•}ñ\Æ\éžð~«§\Ý/²\ßi^ø£¦j0=Ò°°’8À?…\nû3ö]ÿ\0‚wþ\Ü_¶ž³‰û.þËŸ¾14·v–W\Z\ï‡<%{i\à}kût»±o|D×¿²<\á;k\ËY#¸¶¾ñ7‰4›)\âtx\î2\çý[?d¯ø7[þ	1û Uð—\ìÅ üRñÆý—pŸ~=^\\|VñÚ¶™\Ö\í¬E¦\ëÀøCH¹Ô„\îú•Žƒ\á+E™\ÂùZd6Ú½B\Ñ</£i^ðÖ¥xw\Ã\Ú…¦•¢h:i¤\è\Ú>—a\n[X\éºV—a\r½ŽŸagopZY\ÚA\r½¼(‘C\Z\"ª€óWýÿ\0\à\Ì?\Û/\âR\èž ý¯>6ü5ýœtµ°»\Ô|\à°ÿ\0¾$\Ú\Ú]\Ø\Ï%Í…\åÕœºWt\ÍsK¿û4\Ø\ë¾(\Ò.b3½¦¬øô\åû#ÁªŸðIÙ–m\Ä>:ø[\âÚ·\ÇzD–£Xøÿ\0¯Ï«x(j¶°\ÉÄ±|\'ðÿ\0ö/µm&ü\È^m\Çö>=°\Ò\'F$¯\é.Š\0\á~ü/økð—Ãšw„>|?ð_Ã\nhöVún•\á¿ø_Eð¦…¦\éö€­­–•¡\ÙX\Ù[Z[+2\Û\Û\Ã\nE\n’±¢Ž+º¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0øcþ\naû/X~Ù¿°_\íQû7]\ØBÿ\0\âOÁ\ïYøZ(´\ÛmZö/i:tš÷‚nt»;·Ž«\Ã\â3J:d\ì\êÖ·†˜É’%ü?5M6ÿ\0EÔµT¶’\ÏS\Òo®ô\ÍF\Î]¾m¥õ…Ä–·v\ÒlfO2ˆ¤‰ö³.\å;XŒ\Zÿ\0~ªÿ\0\Z?ø8öBØ»þ\n\ÃûVü8\Ót\Ï\ì\ß\0øû\Æñ\ë\áP‡LƒH\ÓÀŸcoeh–0\\\\„\Ò<\â\ë|8µ¸•¢—PoK¨5¼+tˆ\0?¦?ø2sö¹\Ä_µ—\ìC¯\êÏƒ6ûCü7\ÓnµX$‘£ƒÁ?\â\Ò4Af.\'¸¸Ž\Þ\êÚ‘¾)6:}·Ù˜²\'÷ó_\ã!ÿ\0ý¯\ìYÿ\0Yý“~(j\ÚÄš?€<a\ã˜þüT™¯\íô\Í4x\ã¯ƒ%\Ôõ\ëÛˆ\äXôxšû\Ãu4M’\Ï„|„y¤7û7\ÐEP\\ßŒ<#\á\Ïøc[ðw‹´«]o\Ã~!°ŸMÕ´\Ë\Ä\ßÕ¬\ë‚;4r\ÆÁf·ž2³[\Ïs\Â\é,hÃ¤¢µ¡^¶\ZµN\Z­JŒ=Zu¨W£9R­Fµ))Ó«J¤\Z:”\ç\Î‹RŒ’”Zi3V\rŽ\Â\â0X\Ü=^B¶…\ÄÒ…|6\'\rˆ§*UðøŠ5c*u¨Ö¥9S«J¤e\n”£(¸¶\ä“ö\Úý<Gû+ø\ì5¨º\Ö>xª\ê\æ_x£-\ä8/4žÖ¤EÁ®ið22vEªØ©¾²¡\Ô-l>Oð/Ž|Oð\ßÅš¼ª\Ü\è¾#ð\íü:Ž™¨Z¹I\"žÊ¸û²Á2‚\â	á¸·’X&I\"‘Ñ¿´ŠŸ|ñ›Àš÷Ã¿i0\êþñ«A<Nª.l®W\æ³\Õ4Û†Vk=OOœ%Í\Ôctr &’7þJ¿j\ß\Ù{\Æ_²\ï\Ä{¿	\ë©.£\á½A¦¾ðgŠ’K={GóHB\Ç \Ô\ì÷$\ZŽö{ið\Ê\Ò\ÛMksqþ¤}üsÁø£“Ïƒx¾Xiñ~RxbaIá¸¯*T½•lJ£5ì§\ãš\à¹*\ÓoF„ñpŸ\à\'\Ó3èŸ™ø\ÄÔ¼Lð\Þ\ê~fY­N®¥uðóˆ]x\×\Â\à\'Š§/¬R\Ë*\âc\Zœ;šºŠ¦²ŽWŠ«]<\'2þ•?co\Ú\×\Ãµ?\Ã\Øõk]+\â‡ ·¶ñÇ…\Ö@\Z‚i­\éq¹óe\Ñu)´móµ\Ék†$A5\ÇØ•üKüøÁã¯\Þ:Ñ¾ ü>\Ön4oIY‚\Öz•“2ý¯K\Ô\í[0\Þ\é÷\Ñ\rÍ¼\ÊAR$Œ\Ç<qKõ­û/~\Ó	ý§þYx\Ó\Ã\Ãe­Z,6~0ð«\Ü$—þÖ¼¼\É‹‘$ºu\ÑWŸK¾(«uoÁ\Û<SFŸÊŸHŸqfU8›‡(T¯ÀÙ¦%¨\Â*u*p\æ2³ºË±Rw”°5¦\Ú\Ë1sm¤¾¥‰“¯\n5±\èOÐ¯\éyƒñ\Ã$£ÀœmŠ£„ñ_‡ð)Î¬\Ý:4x\Û+\Â\ÅFY\Î\åŒs|4^y—ÓŒb\Ûþ\ÔÀÁa*bp\Ùo\ÒTQE.Ÿ\ß!EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE|ŸûGþ\Ý±\Ç\ì…k\Ï\í1ûJüø.÷Á¾\ãŸhšN·<·V—7Ö‹„\×O¬•¼¶³¸’\Òcb ¸1\ìŠVvEo\É-cþ¡ÿ\0‚$i7_b‡öªñµt·2\ÚÎº?ÀoŽ²\ÚÛ˜¤h\Ì\ßÚ·¿¬4k»f+º)ô\íFö9c*\èYNhú¢¿&¿g?ø.gü—ö¨ñ\à\ï„_¶g\Âû¿xšcm£ø+\Å\Ç\\ø}\âKË¡\ËöXm|k¤hv·8Ù„v·—\Æ\ÐKµú»kwk}m\å•Í½\å\ÌI5µÕ¬\Ñ\Ü[\\C \r°O<R\Ä\êC$‘³#$PŠ(¢€\n(¢€\n+\Åþ4~\Ñ\ß\0g/]x¯\ã\×\Æ†_ü?ic6§6¥ñÆš…bm>\Þh\àž\î\Þ-^ú\Ú\æòfš8\å{8g³€ø¯\ç;ö¾ÿ\0ƒº?\à—³º\êzÁ[¿ˆÿ\0¶lÿ\0´\íb´øW ¿…>\ZZ\êšuÀ‚;}gâŸ\"\Ò\àº\Óu4&\ãM\×~ø_\â^$J~\Ð\Ö\ÎUHõ3\\ŸŽ<}\à_†^Ö¼qñ\'Æžø{\à¯\r\ØËªx‹\Æ8ñ\á?\è\ZdtúŽµ\â\rzò\ÃIÒ¬a\0™n\ï®à·Œ¼€Wù†þ\Ö\ßðxwüs\ãbjú\ìñ\á_…¿²…\ïV·°Ô¼=¦Iñ\âD\Zu\Û[2IüQ\ã(\åÐ£\×4‘\êu\r+\Â\Zm÷\Ú	›IA\Z-6_´O\í}ûR~\Ö\Þ&“\Åß´¿\Çÿ\0Šÿ\0u¯\í\rGR³ÿ\0…ƒ\ãMo]\Ò4;YÌš‚ø[\Ãw_ðŽxF\Ê\å˜\î\Ó|1¤\é\Zj)\Ù¢\'\Ë@\ê—û]ÿ\0Á\ÐðI\ÙYõ\ÝGøÏ¨~\Ò~:\Ñ_W³ÿ\0„cö{\Ñ\Û\Å\ÚLÚ¾u¬ºqøƒ}6•\àY\"½\Ý$\Úfµ¥kZ¾‡&X5\Ç#0ßµ\çü›ûWx\ìjþýŒg†Ÿ\0ô;•Ô¬­~\"üUš\ç\â\ç\ÄÄ\î-e\Ñõ­\ÃÐ¾ð\ã\ÂÚ½¼1][\ê:ˆô¿Š\ÚM\Ú]¶û\Ð$§ø ®\ÏÀ?~!|Wñ^\à?…¾ñŸÄŸx†g¶\Ð<\à\ë~1ñ^¹qm4°hþðíŽ£«\êSG´¯•œî‘«;(PM\0}uûQÿ\0ÁMÿ\0oŸ\Û;Q¼½ý¤jŸ‹ÿ\0¬\ïPÏ†.<W}¢x\"\Ö\rQ¢kû\r?Á>m\'\Â\Ö\Z\\\íLt\Ëm*;(<»t¯„«ú@ý’¿\à\Õ\ïø+/\í6šNµâ¿…¾ý˜ü©µ”¿\Û\ß<Go¤ë‰§_\Ù=\ä:‚øÃ«¯x¶1*\Ú\Þiú¥†“«\Ù]H©q§ \Ëý9þ\Èðe\ç\ìqð\å´\ßþ\Ù?>\'þ\Ò:ôX]M\à‡\å>\r|,$Z\Ï©¤kz•Œº\Ï\Ä\ß\Ú=\Ó\Û\Üiº®âŸ†7v\ëEyaz“ù¯\è\Ú&³\â-N\ÓEðþ‘©\ëº\Åü†+\'F°»\Õ5;\ÙB³˜\í,,¢ž\ê\â@Š\ÎR‚«60	¯Ú\Ùþ\r\Úÿ\0‚µ~\ÙGD\Õ<û/k\ß\n<­Å¥\Þ\ÃñKö‰»¼º>·¥E¬\èþ °Óµ\Ûiþ ø·B\Ôl®-Œ\Z—€|\r\â\Øc’t[Ÿ!VWýZÿ\0f?ø\'O\ì7û\év:o\ì\Õû.üøW5„Zb¯ˆ4?iW1»¸\Ò,\Ú\Æ\ÏS\ÔüiªC\âKY6\î\ëu¬^\ê\ÓjW\Î\ï-\å\Ìò±zûJ€?„/\Ùþ øq£®¯~\Û?µ_ˆ|iz¥Ö­ðó\à‰„ô$3isG£¿<[¯­j\ËV’+‹n\Ï\ÃZ\Û-­„w:<{„þ¿doø\"\ßüö#mTøû#|,ƒ\ÇZ–wv?¾ h±|Oø£k«YÚ›?\í½\Æ^:\Z\Ý÷„5¸Y\Åðð*ø^\Æ\ä»\î±\nv\Ôz(8¢Š\ÒcŽ£P±\Å,q¢ŽŠˆ€*¨\ì\0*J( Š( Š( Š( Š( Š( Š( Š( Š( ¿ÿ\0ø=öJk¿þÉŸ¶Î£’ú5ÿ\0ˆgßˆº­¦ƒýUI<gðñõ½w\íA\ÊÁyg\ã=Lû¯õ[‘> þø+ògþû\Ûþ	sûYüÒ´\×þ \é\ß\ï>+|#¶‡HYÖ\Ä\ï„\Çþ}Kð\Ì\Ïm®ø\Ò\ÏJ\Õ~A{n¢\â/_„t1 ñu³»¸°»µ¾´\ÃweqÝ¬\ÊŒWÒ¬\Ð\ÊÕ‘Œr\"°¬¤Œ2‘‘_\í\åÿ\0³ýª`ý´ÿ\0\àŸ_²—\í\ZÚ¡\Õõ\ïü!ð´^9»›P²Ô¯\Û\â†\ì“\Ã>9}Z}>kHµk¯\é:Ž¡}e¼B\Æk\Ãk´ù[›üAký#ÿ\0\à\Êÿ\0\Û|wû/þÑ¿±g‰u´—\Ä\0þ \Ø|Xøo¥\Þ_iq\\Ið\Ã\â\ÜsÁ\âk\rI†uK«	|HÐ¯µj÷owŸ|?§¬\ÐFm` í¦Š( Š( ¼3ö…ýŸüûH|9\Ôþx\â\Ô*\Ëu\áýz‘µ?k¢	\"´\Õôöb…\Äl\áolZDƒQµ\ßm+#¦‡\Ü\è¯C*\Ís2ÁfùF2¾_™\åØšX¼7\r7N¾FJP©	.\ÍZQ’pœ¡8\Ê”_\Ä?’ñ^Išp\ß\å˜L\ç\"\ÎðUò\ì\×+\ÇRU°¸\Ü\"hÕƒ\×Tù¡88Ô¥R0«Jp«N?\ÅG\Ç_‚9ýŸ>#k\rü{§µ¶¥¦I\çiúŒI)\Ó<A£Nò\r?]Ñ®dDZ}ôq¶%­\Ìw6‘ÁguoCû5þ\Ñ>5ýš~%iž=ð\Ã\Ëj^+?xzY]tÿ\0h-(k­6ñUfU/.Ÿ{±å°¼\Ù<a\Ð\Í\ß\Ô\íyû\'x7ö«øzú¨¶úGŽ´\î®ü\ã/\'7\Z>¡*«K¦ß´jf¹ð\î°\Ð\Ã©h†K}J\Ú\'¼²‰$þL¾#|;ñwÂ\ZkþñÎ‘q¢x›Ã—\ÒX\ê67ø”†\â\ÞU&;›;¸+«+¸Yà»µš˜$’cvÿ\0W¼ñW‡|w\à\ÜvE\Ä8Ló\ê8©q_ÖŠú¾a…ª•\íl6ùž7u	{l¯\Z\ãM\É)`±8ù\ãúJ}x\×\è‘\ânUÅœ˜f´¸G›ÿ\0jx{\Æ8i\É\ãr|\Ã\'‰ÿ\0W³zñ‡³Žk¦¦©J´^?Ê£:ñ„\å\Û‚þ\Êþ|eð?ÇŸ‡\Ú\'\Äo\0\êI}¤jÐª\ÝZ;\Çý£¡\ê±\Ç_hz\Ä\Ìmu+‘VD9Žx^\Ëg–\Ò\æ	¤õjþ@ÿ\0c\ß\Ú\×Å¿²¯\Ä$Ö¬¾Õ¬x\ÄZZx÷Á\ë\"Õ´øZA£§‰™!¶ñ\'žm.\è¼i ’\ãO»±\ÞLWú\Êø\ãÿ\0	üPðvƒ\ã\Ïjöúß†|Ia¡¦\ßÛ²œ¤ƒ\Û\\\Æš\Úú\Î`ö·Ö’\â[[¨¥†@\rø\ë\à¦e\á.Ï†Uñ\Ü›V©,‹5’\æ	YÔžQ˜\Ê)Fü,o\ìª{°\Çá¢±4”jG‡\Ã¯D¿¥&GôŠ\áex\\«Ä®\ÃQ‡ðý9rS\ÅBñ£O‰2HM¹\Õ\Ê1\Õ9Uz	Î®QŽ›À\â%:50\ÌweEW\à\çõ\ÈQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\Ó\Ãm·\Åooo“O<Î±C1!ye–Y\n¤qFŠ\Ï$ŽÊˆŠYˆ\0šÿ\0?¯ø.·üU\ã+\Åþ;ý?\à˜ž\"µÐ¬<>ú¿ƒ¾)þ\×VñC{®j\ZÒ‘c«\è?³\áy%³\Ñ,tô\Ý2û\â­\í¥Æ¹w«n~E\áøôm+Æºÿ\0\èü£ÿ\0Tñ\ì‡û8øWö0ø)\âyü=ñ«ö©\Ðõ=G\Ç\ZÞ‘yw§ø‡ÁŸ-¯g\Ñn§\Ò\î\à‰^\Ú\ë\â·e¬xj\ë;\ëk\ë[Ù´\Æ\Õþ`\×x\ë\Çþ9øŸ\â_\Æÿ\0üa\âoø\Ã_½¹\Ôu¿x»[\Ô|A®\ê—×“\Éuuu}ªj—W—\Ïq4³;I)Ì’3`d\×#E\0W\ïü«þýº?\à™&ðÿ\0†\ãñž±ûB~Ë‘6§kÿ\0³—\ÅOj:®—£h6³\éñ´Ÿ<Y|u\ro\á6µa¥Z\Ý\Ø\èö\ZI¾øt\Ò\ê7\Þ ø¯_A§\Ü\ØþQ@\îuû~Ü¿³\Ïü3ö}ð§\í#û5ø­üE\à	,õ+SŠ\Þ\Ã\Å\Þñ-¢FuOø\ÛD‚\îôhþ\"\Ò\ÚX\Ì\Ð\Çuwewo,úeõöŸsou#ÿ\0iÿ\0\Û\çö.ý‹ü?7ˆÿ\0jO\Úg\áÁ‹T±»Ô¬ôø¿O>4\×m,\Çz|\'ð÷J}KÇž1ž\ÕÔ¤ö~ðÞ³y­n\Å‹ÀŸ\Ûcö¶ý˜|ñÀ?³\Ç\í\rñW\àÇ„~,Å§\ÅñGøw\â\ÍG\Ã	\â#¥4‡N¹’\ïM’CO¿³\Ë:–“wa¨,2I¹0»F~xñ‰<C\âýwVñO‹u\ík\Å&\×\ï\î5Mw\Ä^\"\Õ/µ½wZ\Ô\ï$2\Ý\ê:¶¯©Os¨j7÷R³Kqyyq5\Äò1ydf$\Ðú_~\×ðy—\ì9ð­õ\ÍöTøAñCö™ñ‹jvzoŠ5Á\Â†——¶\Z…¼—q]\ê\Ñj¾3»\Ðu‹uwgx|+§\êV\ìG{¤B\Ò2§óû^Á×ŸðV?\Úa5ü:ø…\á\Ù+\áþ¦º…Ÿö/À_[Á\ã™ôË›\Ë[½<_ü\\ñgöÿ\0t\ÍkJû/‘·ð\Þ\ã\á»^Ásw¡eq\Âÿ\0š\ZûKö\\ÿ\0‚t~\Ý¶¦©›û.þ\Êÿ\0¾0@\×\í¦]xŸ\Ãþ¿±ø{£\ê+mö±e\â?‰ž \Z?\Ã\Ï]Ko‰m\àñ‰ô\É.U¶Y•H\Î¾.|Sø\Ë\â;\ïüZøã‰ž)\Ô\ïo5ÿ\0x\ë\Å\Z×Šuk«ýB_>ú\î[\Ýjòòs=\Üß½¸p\à\Êÿ\03\ä×žWöû%ÿ\0Á˜¶O\Äq¦kµ§\Ç_†?³¾‡pöò\Þx_Áp]üYñü6wr²¤ð÷„m5;;ò¶7–c\\¿µ)¾\æ\ÓQ¹UT\é\ëöAÿ\0ƒW\à’¿²\ãiº\ïŒ~\ëßµw\ìdµ»\"ý£5\Ó\â?\n[]¥“\Ú\ßAað›AƒAøq}£_J\æò;\è~<\Ô4û„‰¬µ¨öÀ\å}ð3ö\\ý£ÿ\0i­z\ß\Ã³\ßÀßŠu»›³a—Ã¿\ëþ\'U½ý£\ì“\Ý\é–3\ÙZ\Ü•bº¹…\Ù\n²‚sý!þ\È?ðhü\Ó\ã\ëi:\ï\í©ü1ýŽü	\ä¯\ãY>$|T“N\Ôô˜µK­;á€\ïŸN¶º¶žtÓµ­Çž?ø\â\r\"\ê;”}.\âH-þ þøkð\ï\áW‡\ì|\'ð\ËÀžø}\á6\Î\ÃN°\Ð<\á\Í#\Ã:E­Ž—kŽ›k†igl°\Ø\Ù\Å­ªùdC,i…®Ú€?”?\Ù/þ\rÿ\0‚füm+[øññ;ö²ñM¢E-í§µ\×ðG\Ã\é\î\ä\Òg°\Ô ‹\Â~}/R“Kk»ƒ©\é±j>%¾\Ôlnm\íw\êW)£ÿ\0HŸ?e\Ï\Ù\ÃöZðÁðo\ì\åð7\ágÁOKœw¶\rü øZMeôø„—~!\Ô4»(5/jQD6ÿ\0jk×šŽ¥!%\åºwfc\ïPEPEPEPEPEPEPEPEPEPEPEPEPP\\\ÛAymqguOkw¶\×0H7G4\Æ\ÑM‹\Ý$™wREOE\0‰ü¿öN›ö&ÿ\0‚Œþ\Ö³\ÄZ3h~ð·\Å}{[ð’iP\è–#\áÏ¥0ðGö6™o,\ÑZ\èpxZ³±\Ñ\ÕUôûH$X\ãW>ôÿ\0ƒaÿ\0kû+ÿ\0Á\\>Áª\ê\é¤x/ö„°ñ\ìñ\ã¹Ô´­Mš?Eo\á#ª\ê:´\Ã¥§´^\Åm«s¨jYXÛ¬“O\Z\×\ë÷üµû |zý—¿m¯\rh\Æ=#\ãƒu¿‚?µ-3Ë¶ƒ\Çÿ\0¤‹]ð&£®j\Íp\Íu«x\ÇÀšö«¢\é61\ÛG¦—ð–\êg‘¤¹þ\'|	\ãoü5ñÇƒ~#x/R—Eñ€<W\á\ïxOX…Q\æ\Ò|K\á]^\Ï]Ðµ8’Eh\Ú[\rR\Â\Ö\ê5‘Y¢”©\"€?\ß6Šù¿ö<ý¡¼7ûYþÊ¿³\Ç\í/\á2©¢|pø=\àˆñ\Øý¾\×T¸\Ðõøv\Âÿ\0]ðÆ¥{dM¬ºß…5\Ù5/\rk\Ë\rkJ¿·!Z\"\Ò\0QE\0QE\0WÀ·w\ì_¤~\Ô	:ß†\à³\Ó~1øJ\Æc\ámZM–ðøŠ\Æ3%Äž\Ö\î1³\ÜH\ÒI£\ßM»û+Q•þhì¯µ\r\ß~Q_EÂœUðV—q/c\'‚\Í2\Ê\ê­\ZŠò§VÝ­…\ÅRº|&*“•M	{µ)NJñ—,—\Åø…\áÿ\0\nø£Áù\×q¦YO5\áü÷,>*„­\nô*E©\á±øEœð™Ž\Zx¬.Ÿ¿CN´£\Í	ºî…¬xcY\Õ<;\â\r6óG\Öô[\ë3U\Òõy-ol/\ì\åx.mnm\æT–¡•C+¯¼`ÿ\0\Û[Wý˜¼`¾ñU\Å\î§ðk\ÅW©ÿ\0	–›®&ðÎ£1†ñf‹\Ì\å\í\ã@º¾›\ß\íK5\r\Zµõ­ \Õ_ø(Ÿ\ì$Ÿ4›¿Œ\nt´O‹º\r†u\Ý\Î=‡\â6‹c\î\â†%\Â?Œ4\È#òô¹p%Ö¬•ty\ÚY\íôqóSqö³\Íms\\[\Ë$3Á24r\Ã4Nc–)cp¯‘º²:8Œ¥X¯õƒ„8«þ‘\Þ\âðy†•O¬P§ƒ\â\\†u\"ñ¹&g\Ê\åGƒª\â\êF¤%Š\Éó(B\ÓP•:‰W£‹\ÃSÿ\0ž|=ñ[\èK\ã^[™dÙŽ&“Á\â«f|\r\Å\Ô\èIe|S‘©Æž\'/\Ìpñ’£:ªX\à8“#©;\ÓuaZŒ¥„\Åe\Ø\ê\ß\Üö‰­\é$\Ñô\Ïh\Z•ž±¢kV6Úž“ª\éó\Çuc¨X^D³\Ú\Ý\Ú\ÜDZ9aš\'WGS\È<\à\äV¥5_ðN¯Ûº_‚Ú½—ÁŸŠú¤’|%×¯\Ùt\rröIe?õ\Ëù\Ô\îgb\ÞW„uK™$—Wˆ+H¾—ûj/\"	5Ÿ´ÿ\0JQKñG42$\ÐÌ‰,R\Ä\ë$R\Å\"‡ŽH\äBQ\ÑÔ†GRU”‚¤‚\rš-øUžxO\Äõr\\\ÉO–bLFAF›†5ÀFI]\Úñ¥Ž\ÂóÂ–?	\Ì\åB«H:˜Zøjõ\ÝO£Ÿ\Ò…>ü‡âŒ\ÓÀg\ØC\Æ/:Ê¦3‡ó‰Sri_–xœ§\ÉV¾O™(Fª©F¬h\ãð˜\ì&ôQE~X~þQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\ïü\åñ§Yø\Éÿ\0£ý®¢¼Ö®uO|(½øuðwÁ¶33›\éžøa\áñ&•b\Ìp\Íñÿ\0Æš\Ì\à|¯{ª\ÝH™FZü	¯Õ¿ø.tw‘ÿ\0Á_¿\à¢?m¶»µ‘ÿ\0j?‰rB—ˆ\é$¶mªŸ±\\\ÄÖ—V‚‹\'\\£\Ú\É	RF\r~RPEPEP_\ÙOüþ\rH\Óÿ\0oŸ\Ù\Ç\àÿ\0\í‘ñ\çö·ÿ\0„;\à\ç\Å\í?[\Ö<;ð\×à§ƒ¥¿ø‹s¦i:·ˆ<#tšç¾ [[xwÁ\ÚÎ•\âýò;?NøñLÕ´¨7\Úkö\ÝG,Æµ²—ü»\áMWÁ¿ðF?\Ø7J\Õb’¾øO{\â»¤Ò¼s\ãOx\Î\ÂU	ÈŽ\ê-{í‘—ù\Ù.\Ï\Ê\Ë@ß²wü¯ÿ\0—ý‘¿²µ/~Ë¾ø­\ã1Uÿ\0\á5øù,Ÿµ+‹\É4‰4}B\ãûÄ«?„-\á\Ôaž\âyt\Ø<:ºuµ\Ü\ßh²··–(]?k´#I\Ð4½?C\Ðt½;D\Ñt›H4ý+H\Ò,­´\Ý/L°µaµ±\Óôû8¡´³´¶…(-­¢ŽcUH\ÑTZ4PEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP\àü³û%\Ú\Çþ	%ûCZišCj¾5ø“ûBx [irjÚœ7Ÿ¥šOG¦E±›Yo¼¨øž\Æòü‰¦—=ôŒ…\×øû\×û\ìx³Â¾ñ×…|M\ài6º÷„üc\áýgÂ¾\'\Ðïƒµ–³\á\ï\é\×:Fµ¤\Þ,o†\×Q\Óo.l\îr#˜¦p®­†\á™ûnþÍž\"ýk\ß\ÚCöañG›.§ðK\ãü	o¨I§¾’šÿ\0‡ô½j\äøO\ÅVzl’\Ìözg‹¼+6\â}&–F]/W´\ÜÄœ\Ðú6Áµ£ücÿ\0‚ux\Çöm\×57ºñ\ì©ñWWÓ´+[›­4I\Ã‰\Í74x4ý>\Ö8¯WO±ñdþ1i\ï\ïŒ\Í=ö¥$)(ŽAýs\×ùSÿ\0Á¢?µ\Ä³ÿ\0ü\Z‚^ \Õ^\ÃÁŸµ÷\Ã?ü4X\äž\Â\ÓM|ÿ\0>^jw7`N\Æ\ê\×KñŸ‚ô[)Ú‰<m¢ÀRL(_õX Š( Š( Š( ¿?à¥¿°—öô:\Ï\íð{GÛ,Ú—\Å?	i\Ðü\Ú\Ô +\Üx\ßH¶ŒcûV\ÝC\Í\âk8—:¤;õ¸”jQjGUý»¤e¥YC+¬¬VR0A‚\àƒÁ\Zû¿|BÏ¼3\âŒd5Ÿ´¢\Õ\ÃRRXL\Û-œ\ã,N_ŒŒw§UEN•K9\á±¥‰¥û\ÊQ?$ñ³ÁžñÛ€³>\âü7\î±\ëY6qFœ%˜ð\îwFœ\ã‚\Î2\Ù\ÎÖ­E\ÎT±£K‚«‰À\â?sˆ¿„Šý\Ãÿ\0‚j~\Þ\Ø\ï¢þ\Î5…]\Ì:o\Â\ßjS\Ç\Zi±ò\í|­]L\ëÿ\0¹Ù’\Þ>N›9]g:t¶\Ù|üƒö?o5O4—>Ô®\Þ\ï\Ç~°‰œx?R¼›/­\é\ÖñF|¯_\Ï&.bE¢^Hˆ4\ëˆR\Ïñ½\âut,ŽŒXd2²œ‚=\"¿\Ô\Úôx\é)\ášq—´Á\ã£\ÍF·-7›ð¯P¦®¥þ\ï…u9j\Ó\æX|\Ã[IO\rŠ…Cþð˜Ÿ>ƒ~:\Ê5!\ìs<®qŽ\'\ÍYp\çˆŠ¯t\á>_\ßeù„h9P¯\É,^M›aý\èS\Ç`*\Ñ?»Z+ñÿ\0þ	Áûv\Åñ?M\Ó~ü[\Ö~#i6«m\àŸ\ê7\n$ñÎ™k°\Ñ\ï%püM¥Z\ÂL³<šÞŸ2\çS´–mOö¿Ê®>\àLÿ\0Ãž&\Çp\Ç\á\Ý,V^\Ó\rŠ„eõL\ÏRRXl\ÇRI{\\6!E¯\ç¡Zp\Õ\ãOB­8\Ð_ƒþ.p¼”ñ\ïc=¾cÀV”c\æôaNX\ì“6£ý†;*wW£‹\ÃT\Ãcð“­‚\Åa\ëT(¢Šø\Ãõ\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ü¾¿\àñ?Ø§Xø/ÿ\0ð\Ï\íy¡i¿ð®?k\0\è)­\ê©m;Lø\Íð«H±ð^½¤ÿ\0£\Ú\Çk¦Ç®xNð7ˆlbº¹’ÿ\0[Ö—\Æú‚©†\ÎF_\ä2¿\Ûwþ\n¥ÿ\0\êøoÿ\0@ýŽ~\"~\Ì^:’\ÃD\×õ\ãñ7\Â\Ýi\âö\ç\á\ß\Å\r)\ß\Ã^#£_·G§\ÎòÍ£xŽ\Þ\ÆE–ÿ\0\ÃÚ–£h\ÑÜ«‹y?\Æ\×ö¶ý’~<~\Ä?<uû9þÑžÕ¼ñ#Àz­ÅÕ­ý­\Êi^!\Ò\Öyc\Ó<[\á\rVXbµñ\'„<Co¿\Ð|A¦´\Ö\Z…¤£J’\ÅÍ”QE\0QOŽ9&’8a\å–WX\âŠ4g’I‚¤q¢‚\Î\î\Ä*ª‚\Ì\Ä\0	4\ê_>ü@ý£>2ü.øð«G:ÿ\0ÄŒ;ð¿Ã¯ij\Û\Åy\â?\ëš.–·wr~\æ\Æ\Æ;«\Èå¿¿¸+mcg÷w\Â\ì?\Ýö|ø\'\à\ßÙ¯\àWÁÿ\0\Ùó\á\â]§~	ü6ðg\Â\ïBDšý¼?\à\Ã\Ã\Ú\\·óF‘G-\ìÖ–\Íw*F‹%\Ã\È\êŠñ\éÿ\0µÿ\0Á\n<Eû6Z\éÿ\0ðQ?\Ú\ãÁóh¼U\áû«O\Ù\ï\á‰,&¶Ö¾ø[\ÄŸg¾ø‰\âš\'\Óü_\â\Z\æ\çL\Ñô‹ø$¸\Ñ4+û‹«˜,õ{ˆ>\Ëýµ\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP_\æÿ\0“þ\É#\á7\íûð\Ûö¢\ÐtU³ð\ß\íCðª\Â\ÛÄš…¦•}\rµ\ç\Äß…/†u­KY¸¼¸µ¿Ö¯¼?ƒm–\Ê\Î\Ú\Ål4Á¤Žg¹iúyWóÿ\0h~\ÇOûJÿ\0Á+¼Kñs\Ãzk¿c\ïhŸ\ìd±Òµ\r[\\?µGÁ\ßllVÌ´V\ZV£\êš/Ä¯ê·´øg{+Moš\\ü¹ÿ\0goŒž$ýþ=üøó\à\ë\Ùt\ïüø¡\ào‰zôö\×sZ\êžñ¯\ÚM\rµêµ¤ò¤– \ÇÊ˜]ð²|¤\×û¨|\"ø—\á\ïŒ\ß\nþ|\\ð”\Ñ\\xg\âoü-\ã½\ráº·¾U\Ó|S¢\Ù\ëV°5Õ£=¼\Ó[Gx-®\Z&(\'ŠEÀ þ	uþ´\ßðjW\ímÿ\0\r3ÿ\0•øo\àcS[\Ïþ\Ê>0ñ/\ìõ®Á\'ö]½\Èð¾,üYð\Âö\r:Á\"4xü\â+Â¶Ú¥üF\ãW\Öü!\âI\Z{‰m§e\0þ”¨¢Š\0(¢Š\0(¢Š\0(¢Š\0­ygi¨\Ù\Ýiú…¥µõ…õ´öw\Ö7EugyguAskum:¼7\×»\Ã<#\Å,N\ÑÈ¬ŒAþaÿ\0\à¡°õ\ß\ìõ\âY~#|;\Ó\î.~\rx¢ÿ\0Áu/€õ«£$‡B¾‘¼\É‹p\Ê\Ç@Ô®¶\Óý‘}+\Þ\ÃmuªP5\Ïø¯Â¾ñÇ‡5Ÿ	x¯I³\×<;¯\ØO¦\ê\Ú]üK5µÝ¥\Ê‘0\Èx¥\\Iª’\Ä\Ë\"+\Öüñk:ð—‰¡š`ý¦3%\Ç:X~!\É}£,\Ã>Z´¹¯\nYŽšu0X›^.U(Toˆ­9ý%¾Ž¼1ôŠ\àJ¼?™û·Šr¥_ÁœS\ìyñ6g8GŸˆpµ\\FK™û:T3\\•§P\ÆQŠ\Æà°µ!ü9X_\ßiW\Özž™yw§jZuÕ½öŸ¨X\\Mg}c{k*Okygwnñ\ÜZ\Ý[O\ZMoq‘\Í¨’D\ê\ê¬?¨Oø\'\ß\í¿gûGxZ?‡þ?¾¶´ø\Õ\áM=>\Ö\í\å\ÛE\ãý\Ùv\ÂG§B»bMf\Ú5A\â]6\0¨ec¬i\Ð\Ça=Í–ø¯ûo~\Æþ ý—<t\×:j]j\ß\n¼Suq7ƒµ÷\r$–L3,¾\Öd\nu;9†S¨YªÜ®dK•\äø\ËÄŸ¼S¡ø\Ï\Â:­Ö‰\â?\êúž•©Y¿—=µÕ»‡V]f9b‘^)¢wŠTxÑ¿\Ò.<\à®úEøy\Ç\å8\Ü<«\Õ\Ã\ÏÂ¼C\'[.\ÆIr\×À\ã¡ÕŽ­Zk	›`e\ïÑ«J5¡¬a¨³ü@ð‹\Å/¾…>3\æ¹?\åx\ÚxJ\ÚYGˆ<R­°\Ù\ÖY	{L.m”Õ°ó\Æ\Ð\Ã\Öy‡\æ\Ô\íG‡\ÄO\rVR\ÇbbrW\Æ?±—\í{\áoÚ›À1\\4¶ºWÄ¿\Û[\Ûø\Û\ÂþbG!˜*\Æ<A¤ÀX¼š.¥\'Ïµw¶›r\æ\Êveû-\Å\×\Ù\ÕþOq\'g<#\æ<;Ÿ\àª\åù®Yˆ–‡ªº­iÖ£5\î\Ö\Ãb)¸\Ö\Ãb)·N½Â­98\É3þ‡øøc\Ä~\ÉxÓƒ³Z\Ï\ç\Ø8c0\Ú[;Æ¶EþóŽÁ×L.;^0\Äa1Tª\á\ëB5)\É\"Š(¯úÀ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯\Ï\ßø(Oüö?ÿ\0‚›ü,‹\á—\íOð\Ê\ÇÄ—ZZ¤Ÿ>%h\ÄhŸþ\êÚ¥›[Ë¨ø7\ÆŠº½”·eªøZý\ï¼#\âK­+JohZ Ó¬ü\Ð*(ü\ÈmOø3wö\âøS®_\êÿ\0±—Ž¼ûPx\ëS\Õ_Jðçˆµ½\áw\ÄýC`“M]ro_i^ñ¥r$¸‰\äÐµg¶\Þ4ø<ø£¯\Æý_þ\rýÿ\0‚\ÈhºÄš%\×\ì	ñ®k”\Æ.\ìcð­þ(iš\äë–¾$“H\ï\\”[\Ï1c)3\"\Â\è\íþ\Í\ÔPùþ\Ï_ðj\×üã–³kg\âo\Þ\Zýžô3ª&ªx—\ãg|=¦A¤Á-\Í\Ìz·ö\'„n|]\â=cNA”\ÇB\Òõ+\È..a2Yˆ„’\'ö‹ÿ\0¢ÿ\0ƒ]?cø\'Îµ |iøÙªÿ\0\Ã\\þ\Ó:PÓµ\r\Ä/ðõž—ð‹á†³l\Æó\í>\Ï&§.£¯\Ù]¼p\Å\ã¿\Z\êz¥û\r/O\Õ<3\á\ß]\\ê¶—Ÿ\Ó\í\0€\0\0\0\0\0\0€\0\à\0\0\ÐR\ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\åŸ¾øk\ã\ÇÁ‹üe§\Ùj¾ø·ð\ç\Æ<E¦\êQ¼\Ú}\î\ã/j¿·½†6W–\ÖK{÷Y\âS™\"Üœ† úþþø“\à/\ÆŠ¿<_kg\âo…¼]ðÿ\0Y‡S\Ón´{\æ½ð¦¹{£=\Ìú]\àV?m[E¼Ž\ÞlºC<3ÿ\0Y¿ðfW\íf>~ÜŸÿ\0efø[xwöøW·£\Ã#\èÖ¶\Ò|Dø9u{ª\è­5\åýÝ¶¥q<\Þñ/Œ\ì4ý#H†ö[Ë›\Ós<	\r‰™>Tÿ\0ƒ³ÿ\0dQû6ÿ\0ÁV¼Qñ;BÒ’\ËÀŸµÇ€<9ñ\ÇLš\ÏN»¶Ó¡ñ\Ü\\ø\'âž“.£q,±j~ ¸ñ‡­þ keòâ±³ø‰¢[ùI•\Ï\âOüÿ\0öŸ¿ý‹ÿ\0moÙö£²û{[üøÁ\áøŠ\ÛI¶µ¼Õµ›õÒ¾!i\ZM½\ì\Ööoª\ë>Ô¼E¥i¦\æ\âc½¼‚Y%EBÀý\Î(¬\íV\Ó5ý\'K\×t]B\ËVÑµ­:\ËV\ÒuM2\îý7R\Ó5+h¯,5\r>ú\Õåµ½²¼µš+‹K»id‚\æ	#šx\ÝX\è\ÐEPEPEPEPŸüPøc\àÏŒ^\×~ø÷H‹Xðßˆ-Z\Þ\æ\Â\\\Ù\Ü(&\ÓS\ÓnJ³Y\êz|\Ûn,\î’.\ÉX$š?’\ßÚ¿öYñ¯\ì»ñ\ï\Ãz\ä3j>Ô¦¸ºðW‹¢…–\Ë^\ÒDŸ»\ã)i«Y«G§§—cÿ\0</5¤\Ö\×bU\âŸ~ø\'öˆøs«ü<ñµ k{´kW…\ê>\ÖcFz¶+‚VH™¶\\BO•yjóZ\Î\Z)XW\ïþxÝ˜xOžýW*ø\Þ\Í\ë\ÓY\Ö]\ç<W\ËMg9u6\ì±t ¢±4ch\ãð\ÐT§û\êXZ´Ž¾—ElŸ\é\Â\ÚL0¹g‰ü7„¬øc9š*Y®sV—guTy§—âª¹KŠŸ4òŒuYb)_\r‰\Ì0ø¯\ã\ï\á/ÅŸüñÞ‰ñ\á\î³.\â\ådC†’\ÇR³f_¶i\Z½žôK\í+Q„5½\å³21Fómå·ºŽˆ¿­\ï\Ùwö˜ðW\íAð\Ö\Ç\Æ\Þ’=?[µXø\Ë\ÂRÜ¤Ú†5Ád\Î\Ø\Þ\ëK½\Ú\×\Z>¨°¤W¶Û£‘-\ï\ío\ì­?”Ÿ|sû<|F\Ö>x\æÅ¢º²•¦\Òuh£i¾!Ñ¤‘Å–±¦L\ã\ÌkûØ·4–—5¬\Ä\Éf\Ùý›?h¯~\Í?t\ßøBá¥¶\ÊYx—@šG\Zwˆô)%\î´\Û\Ø×¿\È%´¹Pf²ºH\îa;«ÿ\0sø\Õ\áE\ã	à¸†qñ&/Ž3†óª3‡Õ³¬¾¬^\"N2¼~,=w\',jžö_‹œ¯\ÉJ¶.ÿ\0\'>‹Hþ-ú*x‡™ðW`óZ\\Œ\Îe–ñ\Ï\â©\Ôúÿ\0\ç\'%N!\Ë0Ž\î8\ìiÂžg…¡\îg9m:j>\×†\Ë*\ÒþÍ¨¯$ø%ñ§Á?þ\è¿<\r~—Zv§\Û’6¿\ÐõEE7šF¥1ò\îm°¯\Ì;˜IŠU5\ëuþR\æ9~;)\Ç\âò\Ì\Ï_˜`1p˜\Ì&œ©\×\Ãb(MÓ«J¬%¬e	&ŸGºm4\ßý\n\ä¹\ÖS\ÄyF[Ÿ\ä9†6É³Œ1\Êó,\rh\×\Âc°XºQ­‡\Ä\á\ëA¸ÎZrŒ“\Ýk%$\Ò(¢Š\ã=0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(øüÿ\0ƒ\Éÿ\0d\ßø[ß°\Ã\ÚcD\ÒbºñG\ìµñ^%\Õo¢\Óõ\íN/†\ßm­ü;\â;X¥µ\Ýk§ii\â/Á:¾«}z‚<iV°,Šò­˜Uºo\í\Ëû4\èß¶7\ì{ûI~\Ì\Z\Úi¾OÆ¯„4ðV“u¬¶\Òô\Þ\é3\Üx\ÄW\Ñ\Ø\Ë\r\Ô\Öþñ®ƒ\â·ŠAö¦y²G#\Æ\ß\á™\âOk^ñ¿\á?i—º/ˆ¼/­j¾×´}J\ÞKMGIÖ´[\éô\ÝSL¿´”	-ol/­§µº·†x¤\Æ\å4þÁ¿ðn\'\í`?k/ø$\ìÁ«\êZ£j~2ø1\á\éÿ\0g¯™£\Óí§Šo„\îš…1gc+´vƒÀC\ÂÖ¶÷w‘\Ãu©Iguy2¼’<¯û£_\çuÿ\0M~\ÖK¢|Sý­?bmwQ[x\ï\Â\Ú\íð\ê\Éâ±‚5\ï]Yx\âM¿\Û$e¿½\Ôõ^ðö›¥A\æG›\áŸj,Š±J\ãýh\0¢ŠkºÆ¥Ý•FYÜ…U¥˜€¹4\0\ê+ÿ\0Ä¾\Ò\ãYµ-wH°‰\É%Þ£idŽNIUx\ï\Ïë‹½ø\Íð\Ê\Æao\'‹ô¹¦bÁ\ÎF½T!\Õ%\Î9\\ƒ\ë@ŸE|ý¨~\Ò\ß¬DŠ.µK™£l¢\Ó\'M\ã$e^a\Z‘\ÇlðA\î3\Å^þ\Ö~EÎ\á\ÍJ\à† ‹›«K|Ð¨\ÞÇ‘\ê\ã\Ü\ëj+\á«ÿ\0\Ú\çS\Ît\ÏiÀ÷o.\î¤*y\Æ\ï)!Ž8V ’~|žJ\ïö©ñü\î\Æ\Þ\ßE²³…K\'¸d\Ï@³! „¶Gp\Ü`ôJŠüÀ½ý¢>*]«¢xŒ\Û#\ç‹[A\'8“È’\à\ÑJÎ¸A 5r·þ$_+%×Œµ÷RI\n—\ïR\Ü¸RGaÁ\ë@aþ\Ö²Ï‚ÿ\0jo‡“xc[\é^,\ÒR{¿ø½-\ÖK½Rt­\î\0\Û%Ö‹¨”Hµ+-\ã\î\Åw[«hš¿ôø#\ß\í\rw=\ÌZÇ‹~\Z\é1#ks­¬\ß\Å:\ã“\"E ¬ð\àð“&G\ÌvŸý{y\â¯\ê*«¯\ëWF\íZ­ý\Æž\ËpÈ dŒ*¨\äñ’s\ïŸ¾5O\áøü3\âK©fðÖ¡:¬;Ht{©\ß03­¤\ÌW\Ï^B·\ïß²ð^$xs’\×\áþ\Í0\ß\Ùu1‡¡™`©\æ\Ùõf\ï_û?\Û\Ê\Ô)be\ïÖ¡(Ô¡\í\\\ëS§NµZ\Õ*1ø»ôBðC\Æ\Þ)\Âñ—d9‡öõp8\ÌVGš\×\É¶°ôRŽ\r\ç|U|£†\ÅS©Cõ~L-z\Õð\Ø|-*yû~Â¿¿eŸ]\ë÷Ÿ<)?„µ8¼¿x#Mðþ³«\éº\ì1+nRûQ¿ð÷ö§d\ì\Ïo©Ee¨,\Ëö²\Å3mý¹ø¿ð\Ê\Ò³M\ãM\Î2y!!¸{Ò–#W¶ŽhÙ‹ +œžk\Ñc–9£Ibu–)QdŽD!’H\ÜWV¬¤G\Zø{ö„ø-ö6»ñÇ†-H´•š}oO·‹iX–{øbAþ¢C\Í\Ê(ùù\Ê>ú¿\Äq¯\çþ gs\â%«‚\Äf•(\Ò\ÃÔ¯ƒ\Ë0oµ§E8\Òu\Ö…‰«¿g\Zø§Zº¥\ZtUOcJ•8~«\ág…<\à\ß\n\Ò\à\Î\Ã\æx<‚†/£„Ì³\Ì\ß;öñrS\Ä}RY®/°4*\ÔN´ð˜á°’\ÄÔ¯Št\'ˆ­W\ß/¿h…\Ús”¹×¦\à‘˜´½Fp@\êWÊ¶bG¦[°\'Š\æ\çý§þD\áaþÚ¹RÁVXôóg\'\0±žHü±ÝšMª£– Í¿ó\ëúŽ×½ò\'\è\ç\è]÷\íY\à\ÛWa«\Þ ?+C-€\'œghlzûc©\Ís÷?µÎ–2m<%x\ëü\"}F\Ùò:\íg×žzWÂ”PÚ·Ÿµ\Ì\ëƒe\ákG\È\åf¾¹8$-¡\èz\áˆ\ëŒñœi¿koJ?s\á\ÝÛ¯ÞšöV<ñ\Ô2Ž8\Îs\Ûü‡E\0}Q\'\ícã’Œ±\éFþ<›\ÉSŸ½sŒc÷MŸnA\Ë?µ/Ä’ùÎ‰\Zz\r1d9\Éþ,|úé‘Žù5ó]ô<ß´\ß\Å$Å¨i±“\é¤[m=B\Ë%Àö\ÇNŸ	?iŠ\Ó\0$\×mÐ€A0\é6g$ùd‘r0@$ öðz(Û¿\á¢~-©>_ŠB©\ÏH\Ñ\ä\Æ}\î,\î\0ÿ\0k Œƒ\É\ÍFøùñY\ÎO‹n\Ô\ã%½¢€s\ÛV%\\ú|¸\ÇŠñ\Ê(\Ù\Ç\ï‹^[Gÿ\0	…\æ?a\Ñ÷ps•\é\Æt=3¶qŸ¡\"ª·\Ç?Š\ÌÅ¿\á2\ÔÔœ•mñ‘\ÆBùA\0#ª…\nO8\Ï5\ä´P°\Åñ÷\âô@\ãK¶\Ú\ê\Ã\Ì\Ót9~\ãP\Æm.I\0ui\nH¹GVBT\ß´w\Æ!Œø®#Œÿ\0Ì¿\áÌŸL\ãJ`:t¯¢€=\Ò\ÛöøÁÅ¼òøš\Þò8gŠim.4\r-®\ãŽEwµ¸kM6\Ö\í`A†VµºµºXÙŒ0Ë¶U\ë\Ç\íkñø´O~\Zvº?Ÿˆ\Í|¹E\0}Soû[xùn­\Þ\ëAð„öK<Mwooi­Z\ÝOl$S<V÷’k—‘Z\Ï$A’+‰,/#†B²=´\ê¦&\ì\í†\Þøw§‹sÿ\0ºÈ¯‰¨ ·\íÿ\0lvº·K¿\0K\r“O\Ý\Ü[xn®¡¶iO-½œºœ7S\ÇgŠ\Þ[\ë8\æuX\Þ\æc*öö´øp\æ\r\ãUú\é\Úôñ¯\Ï\n(ôV\ßö¯øm5Õ½¼ºo‹\í!žx¢–ú\ãM\Ò^\Ö\Î9$T{›„´\×n¯šŒ²­¥\ÕÉAo4›cnÀ~\Ñ?§Œ??ø¤=W\å\Õú—oûA|¹º·³\Æ1$·S\Åo\Ü\è\Þ\"³µY&‘cF¸¾»\Ò ±³€3-\Í\Ý\Ä\Ð&\ég–8Õœv\âWÃ£\Ó\Ç\Þ\n?OhGù_\×\ä%#¥\0~À[üCð\r\ÝÕ½§Ž<u{y<VÖ–vþ%\Ñfºº¹\Ö(-\í\í\â½i§ži]cŠ(‘¤‘\ÙQ±\0öø¡“\êh¯\Ý8úP\í}ø±kywcuõ•\ÍÅí´±Mmyk4–÷VóA – ¸…’XeŠEY#’7WGP\ÊÀ€k³‹\â—Ä¨H)\ã\ïœy\â-N~ž¢\æ\â`s\Üƒ\ß<\Ð\ë¥ùmaûA|Z°*G‹f»Uÿ\0–z†Ÿ¥]†\0c\r!²IH\Îw\î\È\åˆ$W i_µŽmB®§£\è\Z°Ê†“eÍ„\Ø\è\Äy\Zž¸1œŽ0úE|…£~\Ö\Ú¥F¿\áJ\Èm¥\Ò\î,\ï€l\â‹‹7Û\Ý·\nsÇ§è¿´7\Â\Ýd…þ\Ý})Û¢\ë\Íh3Œ\í2F\×‚zÉ†<hÛ¨¬m\'\ÄZº†MW\Óõ$M\ÔS\È\æTbÃ‚ u­š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¨¥ž¤žh¡~ô’È‘¢\ç¦\ærg\Ír:¯\ÄOè¡¿´¼S¢Û².\âŸn†W#Žai7#\åoj\0\ì\è¯\Õi?…ºhV§ª“¸¦i\ÒÈ»”‘ƒ%\ÓZ¡†7F\Ò\0s\Üb¼\×Tý®t¸Ã\Âw—¬p÷÷ðÛ£®8;#\äS\ëÃ\ïÖ€>Å¢¿=5O\Ú\Ã\Çw>bizW‡´\È\ß;$0\Ý\ß\ÝE\é¶I§ŠÙ»\ç}“v\Åy\æ£ñóâ¾¦\á\æñUÅ¸û­\r…µ­”/0U\Ö\Þ$ž\î¥vl\ä\Ð\êT’\ÅÌ²G=Ž¨O,GA\ÏÒ¹}G\Ç~\r\Ò|Á¨x›F¶hÁ/_À\Òs÷Ù³\íŠüœ\ÔüY\âmevjšö¯}s Š\ëQ»ž5f\ÆJ¬³>À;~\è9 œ\â}¢mÛ„®­·n\å;¯pYpXù\'=\èõSý þi€ñ^ƒ»N³¸ºRT\á”8TBÃ¸q\ß\"¿Žß¿ðjÀ\Ï\Û\Ãö\Ïý ?jŸ~\Ù^!øYð\ç\â\ç\Å}W\âG‰¾hŸ–÷\ÄZ&«\ãH\×Wñ]Î—ñW\Ä5¨o.|M\ã\'\×üW,×Ÿ\r’\ÒÁµ–\Òm,#µ´·þ\æ’I$’I\êNI?S_Iþ\Ë\Þ%\ZG\Ä&\Ñ\æuX<I¦\ÜZ bÄ›\ËB·pt3¤r¨\'?(q\ÆE\0~]þÁðm¯\ì‰ÿ\0±ø½cû_|(øñ¿\â\ß\Æß†Z‹“ÁoñYð\æŸ\áˆ!ño„µŸø•5]Âº’º²6¯jO§‡¹·k;Ô¶¹f¸h€¯\Ó\ÍCöø™v`ºÒ´õc‘ö]69Yzý\Ù&“p_L\ï$u<G®`Ž\ê\Þ{i•^+ˆd†Ee¬’¡F§‚cz\×\ä/tðÏ‹5½Ä€\Øj0)‘3\È^Ü¢¡?»û+Àˆˆlƒ\Ì\Ñ\ê>)\êG3x\×Z€\çþ\\&‹Mwd/üK\â¶b\0\ã.\î\Ýr\Ø8®*÷\Å>%\Ôdio¼A­\Ý;ÿ\0¬iµ[\æó9\'\çýøßœœ†Ýœ\Ù\Í`\Ñ@fc’\ÌIfbY˜ž¤³Äž‡$\äS‹¹K1_\î–$qÓŒ\â›E\0QE\0QE\0QE\0Ÿÿ\0]P\Ùß³\Ï\ÆÕµ6¾ñm\æ-Øˆ¼=«\\¿\Ë³`iW“9\Â\Æ\Ì\Ã\ì3¹\0m\ä ˆ\Þ_·¥Š9\âxf%†Td’9<r#Œ2º°*\ÊÀ\à‚\"¿ ‚	A‚\äG ƒ\È#k\ï¯\Ùó\ãP\×\á·ðG‰\î‰\Öm¡	£\ê“©[\ÄV\Òiü\×q/ú¶<\Ë	’\ár\ã¿~I\à»\é|W\á\È¼+¨LZ\î\Ö5\'ûòV\Î\Þ9ûÃ’aÿ\0ªraÝ¼Ÿ3W\í&£§\Ù\ê¶7Zv¡oÕ•\ä/oso2ŽX¤R¬¬­x<z_™¿\Z>]ü9\ÕZ\î\Í%Ÿ\ÃZ„\Ìtû²	\îäŸ°\\6[l©ÿ\0,YŽ\'ŒÄ£\0xmQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@(f\0Q\ØýGÆ’Š\0µ\rõÝ±\rmq-»{vòdt\"H¶¸ÿ\0¾ºW¥hþ#xxE§Š5	-bÀ·ö\Øpd²8\à€\Ã \0z\nòº(\ì¯~\Öz„$\'‰tkØ—jùúl’Y\Ý?@Y\à”\\[\äs\Â\Î3\×\0ƒÞ¼/ñÿ\0\áÇ‰Œ0X\è÷²>Ë«§\ÙB±\è\Ó£0>¢A\ÏùwOI3”vBF	V*H=AÁ¸<P\í-µÝ­\ìI=\ÌP¸\ÊK©,l?\Ùt,\çV+ò\Ãÿ\0|c\ái]^½\Ó\Ìj8£pöŠ\ÎM„¬dcÐ´¶\î\ä¼R¿Lx;ö²¿€Ci\ã};\Õ#:®Šzk›^H\åsý\ÛS\0\ã„\'\0€}\ÍEq~ø…\á[¬þÖ­od(^K\"\â-BLöR<cý¢›f85\ÚPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE! I\0’O\0Ô’z\\v¯ñÀú©\â\ÙØ•H¾\ß²¼ƒ?ºX\áy\Íb\n¤dfùT@•óf·ûQ|<\ÓKG§Ç«kRË‹{Ci¸\Æ\Éz`%~üh\êGLó$\Ök=no—E\Ð4û`\êZ\êY¯.#\å‚Èª©H\Úvy„œ’F\Ú\0ûºª\\\ß\ÙY)kË»kU\n\\›‰\â‡\å[÷Œ¼Zü¿\Öþ=üOÖ‰\r\âK›Ž\å1\éq\Å`¬¼•.~Sƒ¾W\É\ä’+\Ë\ïµ\Í_SbÚ†¥}zÅ·uw<\ã>›$‘£Ç°@(õGWø\Ãð\ÏCmš‡Œtq.	ò­%}FPF~WM>;“ñ²\ì\ç¯,\ÕjÏ‡¶D®c¯\êì¥ƒ­!´ò”’\æp62†>\é8ù\ÚI=}Ï·<œÀ\É\ëŠJ\0úÿ\0Wý®µù·&‡\á=2\ÄBÏ©^\Ï~Î¤ð\Æ\Þ\Ù,\Ö6\Îß´\Ê	\ã Ÿ0Õ¿h_‰Ú¯œ­®½ŒrÑ®—ooda\'9š;—‘G8#–\Îk\Ã\è “Uñ‰õ¹\Z]O]\Õn\Ëý\å–þ\í¢cý\ãLc\Ü{£\Ð`qXt¹{\0€\à\áðz‚\ã\ç9\ï’sÞ¢¢€’NNI=I\ä\ÒQE\0QE\0QE\0µ\á½^}\Ä\Z.·o»\ÎÒµ;K\åU`†E‚Uia.AÚ“Å¾xÝ— X´ \àƒ\ÇFG£¸ \Ú2þ\rSN±Ô­œIo}iow‹÷^9\âY‡±\r_~\Õ\Þþ\Íñ^‘\âHcÅ¿ˆ,ž\Þ\å\Õ8\Z†›±A‘û4ö³\'–þ\Í+v¯¢¿gO¶½ð\î\Ê\Òi\Ü\è3>˜\ÛÊ‡6ª¶O°cj˜BöÀ\ÇPiŸ´†ÿ\0\á øg¨\\\Ç™u\á\ë»]j\ßyV&6\×[Wy{k‰n@\0—\ÎTù—E¨\ì}Gcøõ¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n±kuqeq\rÝ¤\Ò\Û\\\ÛÊ“A<.c–c`\Ñ\Éº\èÀ2œ‘†¤ƒ^Š\0ý.øñ–\Û\âšš6±4pø»N€„8DÕ­\Ó\åûu¨\ã2\0\Ú\àhœ\ï\ães\ìþ\"ðö‘\â­÷C\×-#¼Ó¯\áh¦‰ÀÜ„–h\\‚bž&\Ã\Å \åX‚¹Søó¥\ê—ú5ý®©¥\ÝMeg*\Íms”–)\äAºœ«_§¾-Y|J\Ñ|»–Š\ß\Ä\Úlhº­!D\Ë÷Vú\Ý3\ÌR|\ÄQˆ¤8)\\\0|ñGá¦­ð\Ó\Ä3i·~eÖ—r\Ï>ª\ì\Äwv›¸IùR\î„¸û\Øu%IóJý€ñ¿‚tOhW\Z·n$Ž@^\Ö\åp·W!HŽ\â	0YYI”|®¹V\Zü¶ñÿ\0u‡\Þ ¸\ÐõxŽ74–HƒP´\É\Ùq afA\ÌRp~VR@8Š(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€-\Ú_\Þ\Ø\\Eweu=¥\Ô.‹y^£e\åJÊ…\\`ó\Ûs\É¾ªøoûN\ëš[A¦x\Þ6\Ö\ì2±¦©ª[§@\Óv¾Á9v}\×\å8\éòUû\'\á\ï\èž*Ó¡\ÕtF\ßQ²˜ed\Ã2\é*gtn:`9õ­\Úü‡ð?\Ä/|?\Õc\Õ4Âª]>\Ûa1g²\Ôa^\Z+˜·¸®U.lñ\áv\Èv\×\ég\Ã?Š:\Ä\Í_i­öMN\ÙUu]\ZgSse1yÇŸi!\æ…Q‘òÈ© +@™EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEAsumgš\î\æXAÁ–\æh\àˆN’² 8©\ìk\Ëuÿ\0Žü=½.¼Imwp¡À¶\Ó[ù™\Ó8÷\n\ÈB±pœXš\0õš+\ã~\×:\\A\âðÏ…¯.\ß\ïX¹Š\Ö%um¼\ÙZ™\ä’62·\Û!|c1òq\â\Ú\ç\í+ñ;XÜ¶÷\ÖZFDtJ´MÊ \æHš\â\ìO3\Ç ÂŸ»\"\Åd\É\0~’\Ý\ß\ÙX\Ä\Ó^\Ý\ÛZDŠ]¤¸š8”(äœ»>•\æ:\ç\Æ\ï†\Úx\æñ·¬\ßg\Ò\Ñ\ï\åm€\É>Py%€	¯\Ì]_\Ä\Þ ×§yõ}cR\ÔÜ¸K»Û›ˆ£\'´QO,‰\Zú*\0£Ò±¹,\ÄH\\ ž¤€œö÷‡ˆ?k]\ÛÌ‹\Ã\Þ¼¿\0c¸\Ô.b·€\äg\æ‚6Lû‘‡ñ\0x¯\Z\×?ißˆú˜•tû?BF`Ñ‹\ç–1Ž‚{\Ï4\ä¡\â•Xÿ\0?9Q@f¹\ã¯øŒŸ\í¯kz„{üÅ‚}F\ã\ìñ¹\ÆZh\Þ;xsŽ‘DƒÚ¹B\ÌrX–,Û˜±$–é¸“’N\0¤¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€>¯ý”¼Mö\ê~žB°\ë–kd$\í7\Ú\ï9\àµ3 nYc\01<}\åªiðj\Ún¡¥\Ý\Ûj6WV3\àdùWP¼.Wý ®Jž¡€#‘_‘^\×\äð¿‹|?¯#ùcM\Õ-\'˜’v›s*\Çp¬ \Ë\å9f^2õ\è`!™\'†)\ã9Žh\ã–3\ê’(u<gª‘\Ü\Ð\ãV¿¤\Üh:Þ­¢\Ý)Yô½B\ê\ÆP\Ýw[J\Ñþ …A5‘_H~\Ó~\Z\Z7¤\Ô\âe¿ˆ-b¿RR3u\Z­µ\Ø\\r\î\Æ8dc\Ç>cc\ï\Zù¾€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n\èü)\â[ÁºÝž¿£Lb½³}\Ê2\Ç2o·Tþò	—\ä–6w.\Ùy\Ê(õ«\áŸÄ\âN©§²\Ã}o²[Lg{­¹!—‚\ÐË‚ðJI¡\È ~\é¼;6‘~©ü!\ç\Ñõ@¹—O½\nB6W\çky~\å\Ì@\á\Ð\î\0º­~fx\Çz\Ï\Ã\ï[kšL§j²\Çf\Äùöe‡›ª2	#&7Áh\ß¤šýOðgŒ4ø~\Ç\Ä:,\ÂKk¤X‰uÒ\ç\ÚN£•–%z\rË‡\0€ùŸaðW\â&£\âK\Ï[\èS%Ý„\æ+»ûœÁ¥B›ö¥É»!„Ê¿¼Œ[¬ò²ó\å\à>Ð¿dk%…$ñŠî¤¸8f·\Ò-\"†\Ý2¿4f{––yJœ*ˆ•€\Ý\ä¡<}™€	 \0N2q\É\ÇLžøíž”´òüß²wÃ·ˆˆµ_C>\Â¢ûL–?3\ÐÍ¤;\Î	A2’2Ž£Ç¼_û*xŸK†K\Ï\n\ê\Öþ\"‰79\Ó\î![\rDF “\å8‘­®d#\î\ÆfùGQ_ 4P\âÞ¡§\ß\éWs\ØjVw7¶\Îc¸µº‰¡žU\ãp ñ\ÜÄŽj~£ü]ø=¤|HÒ¦š\á°ñE´,\Úv¨±¨id³½lfKi[\å\Ürð–Þ?˜Úž›{£\êº^£\Û_X\\\Ëkuƒ\rÐ¹GSØŽ2¬¤«)¤‚\r\0Q¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0®ŸÁþ-\Õü¯YxƒF˜\Åsk\"™c\Ë®\íò|\Ë[„€Ÿ¼ca—œç˜¢€?a<\â\í;\Ç\Z\Ó|E¦81^D\Ä9\Ë\Ú^F\0¹µ”vxŸ§÷‘‘\Ç+¬¯‚?e/Mg\â\rWÁ÷3i¬ZF\ÅøP±gX\Ãd\îžÕ·Lnò™›;{\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE÷[F\Ò\Ü\Í¼K÷¥šDŠ5ú»•Qøš\0–Šñ\ßüwøm\á¡$rk±ê—‘—_±\é\noeóå»§\î¢\']ð:ž+\ç\ß~\Öwò\ï\Âú½¢;.µYM\Ì\Æ#m­\ÊÄ’ól–a\Ør(\îJ\ãµÿ\0ˆ>\nð\Â3\ë¾&\Ò,DR^D÷Sª%¼M$\Ï&xq<_™¾$ø\Ãñ\Å^bjž\'¿[i6v4\ëL)\ÊfO-K/MÍ¹\ÎNX\æ¼\Õ\äy]¥‘šI\å¤vg‘Ž1–‘\Ë9üX\Ð\è/ˆ¿j\ïXaðî›ªx‚T+²\æHÿ\0²ôùû\Û^\è}´•ô6JŒ:Iƒšð¯~Ó¾=ÕŒ±\é\Æ\ËC·p\è\Æ6pŒ>Gwa\ØJ¤üØ¶\n@ùH\'#\æ\Ê(¡\Ö|Y\â_\Ì\ÓkZæ©¨»ý\áq{;\ÆN1Ÿ(8ˆ`|¨X˜Œg\å\ã\å.G\Ú03\ïŒ\Óh Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ?\ç\Ç\â8¯\Õ?ž%ÿ\0„£á—†\î\ä—Í»°·mü’K‹-Íº´„“û\É\í­\Û\×À¯Êºû?öLñ/“u¯xZWm—‘¦«h®\à ¹·\Û\ÚC\îð=´²³rY@ò\0¤~\Ô^“YðE¶·k’\ï\Ã÷\È\î#Œ¼¯ezV\Þ`0­„‰\ÊL\Ä\à*‡9\æ¿:+öO\Äú,#ðö³¡\Ü\"\É©§]Y”ºZhYSq\ì7•$öŠüyÔ­e±\Ô/l\ç]“Z\ÝOo2„1ª\Ë¡¾eA\"°@y\Ú \nTQE\0QE\0QE\0QE\0QE\0QE\0QE\0*Œœ}O\×\0œ~8\Å~¯üð‚x/\áþƒ¥²2_\\[&¥ªû\çP¾D–d\ä	\Û\n!\Î\ÅL\nü°\Ò!:¶™n\ÛvÏ¨Y\ÂÁ¸R$¸9õ\ïœW\ìø\ã€0\0\Ô\0QE\0QE\0WÁµgƒ\âÓµ\Ý/\ÅÖ±$që°µöÀv¡` ¤¬\0\É2\Û:¡bF\æQ\ÉÙŠûÞ¾ký©­\"¸øq¥¸¶\×ôó\ã,‰2\ÏÀ{8)»\Óh#‘@œtQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0zÁ{Ù¬>*xx3¾Mv\ÞÅ€I$\Ó\æ\ÈôX®]óØ¨>õú\Ã_•Ÿ´\éuŠžX\×r\ÚjGP›¾È¬­\æ›y\àð$ò—9fú§@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@T3\ÜAmMs4Vð ,ò\Í\"\Å\Z*‚K3¹UP\0$’@\0x5\áþ+ý¡~\Zx`½¼Z\Çü$\Z‚–O²hAn\âG^¨ŽÁSw\È\æ)\ç’6ûñŠù¯ÅŸµ?Šu/2\rYZhVì«¶c›\Ûü?\ßV’TŠeWŠÐ³’¨€}ñ}¨\Øi5Ö£{kcn€–š\îx\à\å 4¬ ¶:*\å@	5\â^\'ý£~øx\É\rµüþ »N<$!ˆùw\ÞLb·U\ÏC¹8V¯ÎoÅž$ñ\Ã\Ü\ëšÖ£©\Ë#?j¹‘\ã\ç;aB£œac«Ÿ,ÍŒ’p02IÀ\ì ôŠ\0ú³\Äÿ\0µ‹µ2i:w‡\á<%\Å\ÏüMoº\ã;¤X¬\Ô0\çh´fSŒJkÀ5\ßø\Ã\Ä\Ì\í¯x‡R\ÔÄŠÑ´W\Öþ[>ð‚\Øn¸\Â-ë“†\ä\×#E\0þƒð\0~\íEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP^ð£\Ä\ßðŠxóÃº«¹Ku\Ô!·»*2M­\Ñû<¨NF\ØÏ˜²?PLI‘Àeóš\ê<)\á/x¿T‡Mð\æŸ=õ\áuf1\îHmTD\×7\ä·E8l» dhöX0¤2°¬§!Ár\àŠü\Éý¡<#6‡ñ?Y–\Ò\Ý\Ú\Û^†/[„]Åš\ä2_@Ü·\Ð\Ü…s ‹\Êm­»qýðÕ®£c\áý\Z\ËWx¤Ô­4\ëKkÇ„\æ6š–2U¿‹…o\â9nõ£-…Œ\×\Ý\Ígk-\Ô*R+™ ‰\ç‰NIX\åe.€’xV“\ë@v~ñN 	±ðÞ»v¡K·\Òo\åEU gH\n\"\å”nb#žEU\Ô4\rkJ\ÔôÛ»	\Å\ÜFÀ\êvÉµ¸\ï\Å~Ë…Uûª«Û…ùaùUK\Ý7NÔÇ¨XY\ßFAR—v\Ð\Ü)SWl\È\ã\èrs@‹€\ç‘\È<‚;\Ñ_¨^+ýŸ¾ø™f’\"=P‘XGw£*ZÆŽ\ìU~\Å1\ë“$$òX\ØañoÄ¯¾(ð|±j\èJ\ß.¥d’7’\Û`;ä…±\ËH¥¢,pª€P‡\ÑE\0QE\0QE\0QE\0QEf\Î\ê[+«{¸x–\Ö\â˜ÿ\0ß¶š9\Ðt=Z0:w¯\Ù\rTƒ[\Ðô^\Ö_>\ßS\Ól¯¡›ó\æ\Þ9C•þwr§•9‘_Œ\Õ÷g\ì¿ñ*4|=\Õn6\ÝØ™§ðü’Å£»Mq§«–š\ÚGyaRw4U!\Å\0}‰EPEP_$þ\Ö\Z\äx{@\Ð»n\ï5Ôš1œýž\Î7X\É\0Œ‰\'\Ìy9‚\Ø$\nú¶öò\×N´¹¿¾ž+[;8d¸¹¸™\ÄqCJ^I$v *ª‚I5ùQñwÇ¯ñ\ÆW\Ú\Ì{\×L‡ýG…ó”\Ó\à;c‚\Çk\Ý0k©\0—¡ /¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š\Ýð×‡µ\ëZ~…¥\Â\Ó^\ê7	 U#ÍžB1¶+xÉ’F\Ï\0(<\Z\0ú\ÃöJð„­}\â\ÜÅ¶mW\Ãúk²dK,òC{¨¼lxV·H,\ã%y\"\é d¸\ë”ðO…,|\á+Ãšz…¸Iš\â\îOž\æ\á\ÏVi%\'’B\\\áEut\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QYz¶¹¤h6¯{¬\êVzeª\Í5\äñÂ¸v‡!œŒý\Ô\Þ\Õó‡Œ?j_	hû\íü3cq\âK Y\Ë9°\Ó”•\'\Ïh\åž}¤«m†\Ü\î\å\ãj\0ú8\ë\Åy¿Šþ,øÁ\Ë0Õµ\Ëy.¡G\éö\í×¤#a\äÀ[f\Ö`¬\\ª©?1ùó\ãŽÿ\0üd%‚\çXþ\È\Ó$c+CCcnc \×šþ\å[hr·R\"¾Lh€‘^E$\Ò\ÊKK#¹f\ÞÅ˜¶\ç )v\Éù‚¨g9vÀ\ÜI ¯¼]ûXj·-%·ƒ´xt\ØyP\Ô\Ê\Ý]78\Ý²ƒo#¤aý\á_5ø—\Ç~,ñtŒúþ»¨\ê\n\ÌÈ–\å\Ö\ÑI\Úc´ˆ¥º\àp#¸Á®BŠ\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢­\Ø\Ù\ÜjvöV±´\×2\Ç1 \Ë<³H±F zu’3ŒPuð\Ï\áÎ­ñ\'\Ä0\èö­¬¢\Û>­©˜÷Eaf\ç<\âoõV\Ñó™;ƒ\Z5~ øCÁ~ð6“\á\ë\í-\ãQ\æ\Ì@{»\É@§¼¹a\æ\Ï+‘¹™Ø€I\Ús	þ\Ùü<ð¦˜ˆ©Ý¬wz\Å\ÐPk·Aû¼õò­\Ôùq©\'qþ*ô\ê\0(¢Š\0(¢Š\0*)¡†\æ) ¸Š9\à•r\Å*,‘ÈŒ0\È\èÀ«)AT´PÁÿ\0¾&‹\r×|m#iª\Í6·¢\Ä79\îmBË\Ïd¤·\Ú`9{^&Vx‚\ß\ãúý¬š(\î\"–	‘d†h\Þ)cq¹$ŽE(\èÀðU”A\ê\r~]üpøyÿ\0‹\ç†\Ò2š.©¾ûH;p©?\ï­g“j\ìy8\É\n€\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0«6w·z}\Ì¶73Z]\ÛJ“[\Ü\Û\È\ÑMÑœ¤‘ºASøH<\Z­E\0}\åð\Ãö›\Ó/m­ôˆ\rö\rB%Ž(õ\èÐ›;À6 {\è”nµ›¼’F7bp‹\É?U\é\ÚÖ‘«[\Çu¦jVW\Öò¨xå¶¹ŠP\Êz+F\0ûW\ãkXkš®˜\á\ìo®­Xcg¹¸¶)$¶\ÒÂ¬À“ó0-\ï€(ög#®F=k†ñWÄŸø:Ý§\Öõ\Ë8¤\0ì³·•nofaÀH\í¡,û‹`|Áq‘ž+ò\Ú\ë\Ç~1¼\Ü\'ñ&²\È\Ø\Ê\rJð/hÿ\0–Å¾\ï\Ë÷º{ó\\\Ì\×3\Ü;\Ë4²K$„—y¤‘\ËN\é´Œ	Pp\ÌF@=¨\Þ~.üw\Ö>\"	4]294o\n‰5¦\àou3e$\Ô%PDKH‰Ppew óýPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE$QK<‰1\É4²º\ÇQ!y$‘\Î#E\åÝ\n£“@1Kq4VðFò\Í3¬QE\Z³\É$Žp¨ˆ ³±\'T{\ný ø	ð<	¥\rZ„7Š5XƒuÒ¬d’\ÍpX‡¦V8a\å«2Š\æ¾ü	\Z[x¾\Ù_]–5“LÒ¦@Ë££¬÷\ÙPe9\nGú6qÄ \íúÆ€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n+\Ëüoñ{Á>\ÓS\Ô\Ò\ëRU,šNžV\æõŽ\Ò\Ë\æ*¶\È\ã¥e\Ç\\b¾7ñ¿\í3\ã	¬ü?·\Ã:s\îPö¬²j’!\Èù\ï2A‘‚~Ì¾`92œ÷/‹> ø?Á04\Þ#\×,\ì¥	¾; ›QŸ*YV1œù›H\ÝR\"\Ø`\Í|•\ã_Ú²þ\äMi\à­6;›r¦¥©¸ºe\ãEjŒ!‡z’WÍ‘\å‰\×k\ÂA\Í|wyuq-\Ý\í\Ä÷w3\È\Ò\Íqq+\Í4²Hw<’K#3»»r\ì\ÌKI&«Pþ½\âŸøž\é\ïuý^ûT¸‘‹n»™\Ñc‹ˆcU\ì5\Å`’I\É$“\Üòi( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ¾ý™¼(ž ñ\çö\ÌBKO\rÛG$t¾vhlù\ì 4\ì\ÊFX„ €­Ÿœ«\ï\ï\ÙGHKOxƒT\ãÌ¿»±‹ ÈŽ5õ?<\ìq\Ðg¥\0}eEPEPEPEP^ûGxI<Eðò÷RŠ2ÿ\0\Ã-ý­(þ\ÇÛ¨©n«\ZÚ—™ŽY­{ýd\ë\Öp\ê:&¯ap†H/4\Û\Ûy£Hå·‘3þÚ’§\Ø\Ð\ã.h§\ËÁ$\È\0’$‰Àù\âv¸\íó)\éÇ§\Ê\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢½K\á\ï\Â?|B¼\é\Ömi¦E K\Ý^ñ;K`1½\r\Å\È\ÉQ;™Ygò\Ê\à€p:6©øƒQ¶\Òt‹+‹ûû¹Com’F\É\å°0¨å™Š¢€K0\×\èoÁÏ€šwD:ÿ\0ˆD\ZŸŠY@6‰,ômÀ¶¡‡\ïn\ÇI.\Ø˜%cP}\á\ÏÂ¿ü7°\éV\â\ãSš5ú\Å\Â!¼¹l|\Ë›{|ý\Ø\ã.\Î\Ü×¥\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEr~-ñ¿†|`Ú‡ˆõK{*M½±o2öñ\Æq¥¤{§™†ÜªlS÷\Ýk\á\ïˆß´·ˆ<C\ç\é¾ø{K%\Ó\íjGö­\Ì|¨c Ü–Š\ë†)ù0J;FÂ€>¿ñ\×\Å\ßx\']_S[Ki1hú~.¯Ý°v‰U	KU$\0MÃ£a••y¯Š<{ûIx\Ï\Å~}Ž‰\è\î\Å@³‘Ž©<D‹‹\àA€A)iå²¶Gœ\êq_=Oq=Ì²Oq4“\Í+–Y]¤’G=YÝ‰f\'Ô“P\Ð’M,\ÎòM,’\É#’I]¤yœ—wrYØ’If$’rMGE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\è\ì©uöŸjJqº\×Zk|\Î\Ñgl\È[Ôp=…~wWÚŸ²Vº‰?ˆü>ò9{ˆmµ(#\ÚDj\Ö\ä\ÛNªÅŽ÷ò\Ì6\0\ÚA ·(¢Š\0(¢Š\0(¢Š\0(¢Š\0)ÀAA\ê<G\\\Ò\×ñ]ÿ\0„kÀþ\'Ö•¶\Íg¤^Pc½Ü‘4V±\ÆAdy…ù»Ž”ù}0¸½¼œ\0\×wS``\ßO$¼À?\0tVN½\0\ç9\à\Îy\Ï×š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šz#\ÈpŠX\ä\0O\'8Sƒ€988P*å†Ÿ}ª]Ee§\Ú\Ïyw;Š\Þ\Ú\'ši	8ùc@X€zœ`w#\"½\Ë\á\Ç\ìù\â\ï<7º¤røkAfFk»¸Û®b8$YY¸RB\Ïq¶48a\ÊHwø\áwƒ¾\Û,z™\ÛJ\â\ãVº\ãR¸o\âfÁò”óû¸Q€v…Û@1ü.ý˜¤‘­uÏˆD\Å²\Í†\á|Jøù—ûNuûŠ[i6\Ñ0r,¬¹\0}¥§\é\Ö:Mœ\Zm¤Vv\è#†\Ú\Ú%Š(\Ô\0¨€©\êj\í\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEp^=ø‘á‡zi¿×¯ž\ê~Å¥\Û“Q¾tX!,6¦xi¤+¬O·¹¹·³‚[«©¢··\ZY§™\Ö8¢fwv!UTI&¾Dø›ûOY\é\Í>‘\àŽþ\íw\Å6»p›\ì¡~Wýqt\è\Ùý\ì£\Ép’ù\Ë\âOÆŸ|Ežhfv\Òô!\'ú.‹k3y^Zœ¬—².\Ów;q¼0\ê\Ñ\É5\ãÄ“\É\æ€5õ½Yñ&¡6©®j7zôä—¸»•¥p	Ï—\ãˆ\â^\ÇTP\0\n\0E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Wð\Ë\Æ2ø\Æz&¼2\Ö\Ð]/£\Éù\ìn\Ê\Ãvr»\Âm1—œf¸\n2G#ƒ@µ6·0^\Û[\ÞZÊ“\Û]CÅ¼Ñ\Ñ\Ë\È$ŽD<e]08\rO_þÍŸ¡š\Ö/‡¾\"ºX®m\Éÿ\0„nòw#\í01,ú\\Ž\Çt.Y\ízoš<’¨+\ì\Ê\0(¢Š\0(¢Š\0(¢Š\0+\ãÚ«Ç°¥¶\à;)VI¤‘u]d#²´+eÓ¢-–\Í;\Ä\ÙVÅ½H+Ÿ£¾$üA\Ò~øv\ãW¿‘^òExt«+\ç^\Þò*©#FHyœðª1ÔŠüªñ»¨x—X¿Öµ9\Å\íýÄ—\ÈKm,\ç…Ecò\Ç\ZŠ0ü‘©*¶@1h¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢œª\ÌB¨$±\n I$(\0u\',£\'‘\Å\06”+6p¤\àd\à\êq\Ð{×´x\àOŽüjb¹]<\èúKòu-QZeÿ\0¦\Çe\Å\ÎpFP*A/Œ\ã\íü\0ðW„W–\ã\Ä\Z¬[_\í:’#\Ú\Å(P7\Û\Ø\íû:·mò$’\ÌXf€>%ðÁxð\Çsm§\'F|¬j\Ë%½¼‰\Ç6‘\çÝœg$1d–<\ä}\Ã\à€¾ðH†\ê{\íýe6·\Ûõ\Ð\Ã€.M¥ˆFA ¿›!\Î]Ù†\ã\íÀT\0\0\0\00\0\0\0\à\08\0t¥ \0(@\0\0\0 \0p-PEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEò_\ÇOk\á\ïµxCÁ·*ú\ã+Cªjña\ÓJ¸k{G©\Ô82á…°\É_\Þ\íd\0\ë~.|y\Ò<·\Z.ˆ\Ð\ê~(	‡_õ–zS6@k²¤	®F2¶ŠÀƒƒ3Fˆü\î×µý_\ÄÚ¥Î±®_\Üj:…Ó–’yÝ›jä•Š$$¬QFÔ0ª z\Öd\ÓMq,“O,“M+´’\Ë+´’I#œ¼’;\Î\îyf\'$þ¢ Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( 	aš[ycž)bu’9#b¡®Œ9VRW\Û_¿iV¾ø?–\è©\r¯ˆ\Ûý[ù5@c`\â\ë”r@s¼> £4ûQiwk}oÕ•\Ä7V\Ó\"\ÉðH²\Ä\è\êJº§*A\ëÞ¬W\ä_„>%ø\ÓÀ\Î‡µ«›kp\Ù6µiÍŸ¼M”û\àGñ\"£\çø±_Fè¿µÖ£C½\áH/Š\"‰¯4\ëß²K+c\æag4rÂ‡=6\Ü\0F\0U4÷=òt_µ¿ƒ	“Ãž ‰À\ÈR\ÖL	ô\Ìs9õÁ¬Oö¼\Ò\Ö\èþ¿šp\Ä2\êWð\ÚÇŒp\È\Öñ\\±\ç9ªx\é\Í\0}‘^9ñ\ã_„¾[K\\&³®\ì&\ßF±•ƒv{Ëº;XA 1;\å9\n‘3\Zø›\Åß´/\Ä?,–\ë}…`û\Ô\Úh\êÐ»\ÆI*\'º‘¤šB\ÚþY…\\ò\Þ#=\Ä\×<³\Èò\È\ì\Î\ì\î\Î\Ì\ÌI,\Î\åÛœnvf\Æ$@_¼w\â/\ë2\ë> »i_.–vQ[-:Ùö±ò®>û¶^F\Ë9f$ž:Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š\ì|/\àx\Îx\áð\æƒ}¨+•\ìG\äXF\í\ß-\ì\Û XÕ¸v\ÜBž	ô\0\ãªí¦}4vöv—3\ÊUb†d–iKGj\ÒI’06+sÖ¾\Êðg\ìŸ*´W~5\Ö\Õp\Ê\çKÑ²NÍ¶kùPm`p¬-ÑÁ\Û.\r}Q\á\0xCÁðˆ¼?¡\ÙY0\05Ï”²\ÝÉ\â{™JI\êp\Ã9>´ð§ÿ\0f?\ZxEy\â¢ð¦˜\à7—q¹\Ö%R,Õ’+p\ÊH\ßq7˜Ž9¶q_^ø+\à\Ãÿ\0¬R\Ú\éIª\êQóý©¬„½¸ßŒŠ\'_³Až\Ä\n¸¤0\Ízý\0€\0€\0À\0t\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEy\Ç\Å?\Û|<ðö¶û$¿qöM\"Õˆ\æþPDci9h\âÿ\0[.:(#p4\ä¿þ3	Z\Ë\á/]\â;\Ø½»…²\ÚE¬£\åTe\ÈK\ë…ÉŒ1TA¤\å¶+~y\É#\Ë#\Ë+¼’H\Å\ä’F,\î\ìr\Î\ìygc\Ë1\äžM\\\Õ5;\ÝcQ¼\Õ5‰.¯o\î%ººžF,\ÒM+ns\ÏE*\"¨<‚j…\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QV!´º¹‘a··šy•Rby%r\Ù\Ú$\í¸ð¤)°3’\0W¢½\ÃÂŸ³\ßÄˆ¦}-t+0~Õ­9¶.öF\Ûb»2!„r\Çº\çÁúW\Â²Ÿ„ô\Ï&\ã\Å:çˆ®«=¬û;N,¼\"2\×R\ÆÃœù°È¬~W\ã$\à?K\Ôu[„µ\Ól®on$;RX$žVl\0H•›œpHž¬+ß¼#û4x\ë\Ä>\\Úª\Å\á«\'\Ã52^e±…ÁWSD“\Ó r+ôBð¯†ü1n¶º‰§iP¨Qþ‰m\ZJûF–r\ZyŸdšGsÝ‰®‚€<Áÿ\0³Ÿ\Ã\ÏùwvrøP]¬\×\Z»	-ƒ©WýÞŸK@©*‰\"2G,¨B\æF*÷k{{{H’X!¶‚1„†’z,qª¢þ\0T\ÔPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP_œ´\çŒf\×|}/‡¡$\Òü+6ˆ°L³C&¥sWZ„¯°²¥Í³\Ì4\Ù\Óph¤³x¤E•¿G\ëò\âj…ø\ã\ìgŸ\Zx¡ŽI<¶·|{“À\è@\0Š\0\áè¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¥\0œ\à’{\0:’{Üžl\é^\×5¹–\ßHÒ¯µ™‚³¶šq¸\ãx\Ð\Ç\Üg\ç\È\ÏJ\0Å¢¾Žð¿\ì\Í\ãýglºµ½®ƒn\ÅHûu\Æû€3—Y,\à@qÀ\ÌñHo›iSô/†ÿ\0e¯\é¥%\×\î¯|A*õ·\Ýö#\È`-È¸—k©’|\ã\0\ç­\0~z\ÚY\Ý\ßÎ–¶V\×w2#·µ‚[‰œŽ\Ë(ò\Ã!p	ä“^\É\á\Ù÷\â_‰|¹?±Ž‹f\å»\ÖeKQ\å°Ï˜¶\à½Ë\È\Â\ÆXq•úI¡xW\Ã~·¾\Ðô\Í&”°±²‚Ý¤dD“I\Z	&—zYY\äbIf$“[ôòW…?e-Nò®<O­\Ýj\×µ\Ú\ÛNO°\Ú,€œ¨·]K^8\ç=AÀ¯¡¼9\à/xN%‹A\Ð4û£rÀ²\\·»\\HR\à\\tW_E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0øÿ\0ñ\n\ê\Þû\Ç\Þ7½³¸‚\î\Î\ï\Åþ$¹´»µ–9\í®m§\Öod·¸·ž&x¦‚h™$ŠXÙ£’6WF*ÀŸ\Ø\nü€øƒá¹¼%\ã?\è2\Ã\äGgª]5š\à…m>\âV¸³t\'ï¯“ xKFq@uQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@R•aŒ«Œ´äŒ1’2@\ã¹½\0%\Ý\è?¼}\âM¤xOZ¸‚UWŽ\êK7´³•	å¢»»ò`(û\ÞSHGM¹¯j\Ð?e?ß•}rÿ\0I\Ð\áÊ–Q3\êE$•HC½F2’I\'Ž2@>Z©£·¸•\ÄQC,’–U\"3JY\ÆTÀ.KF‘_¢>ý–ü¥}^óU×¦\nV@ò>\ÖPy\Ã[Ú’çž»\ç|”ü¼l\Ðü	\àÿ\0*®\á\Ý*É”(óc´‰§;Fi¤W·©3@šø3ñ\Å-²ðõõµ¼¡±w¨Eötq¢_µ´…r8x\ã—’;Wº\è²>£1Ž_xž\Þ\Æ2¨\Ïk¥Ûµ\í\Æ\ï\ã‰\çŸ\ìð\'¬‘¬Àp\n·5÷0\0p\0\ÐR\Ðˆxwöyø_\áÿ\0-Î‹&µs\Ï\Ú5Ë–½\É\ã\èÈ°Y\r§%H¶\Þ3Ë·Zö3N\Ò\âi¶–€—ioº£\"$]\Ä\í“\ïW¨ Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ¾Uý¥>\Ë\âM6?\Zh°5m\ÜÃª[Æ¹’óKB\Ò,Èª2óY19.ð6ý^\ÖúªšÊ®¬Ž¡\ÑÁVV••†\n°9Á‚(ñI•”•a‚;~ úG Ž Ž\r%}™ñ\Ãö}¸\ï<]\à[S5³.um&hN\ZI¯4\åæ‹«Mj1·™\"þ ~4!”•`U”\ÊÀ†R \à‚x4\0”QE\0QWô«\ÕuM7KŽD†MJþ\ÎÁ%1Hžò\â;u‘\Â\åŠ!3ˆh…õ\çü2‰\èo\Ðÿ\0ð\nþød?ÿ\0\Ðß¡ÿ\0\àý.e\Ý_\×õ¨!\Ñ_^\Ã!ø—þ†ýÿ\0\0¯\èÿ\0†Cñ/ý\rúþ_\ÑÌ»ÿ\0_\×õ¸!\Ñ_\\Mû#ø’e™¼]¡•Š7”eÈKß¨òdÑ˜f–C¥’2\Ã8c$gœdf„\ï°QEÀ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢½\Ã\á\×À¯|H\Ð\å\×t½[J²·Šö[#\r\è¹ó‹Ä¨\Ì\ãÊ\Óa\0\ç9\ÏP‡\Ñ_W\Ã$ø\Ïþ†þW\ßüfødŸÿ\0\Ð\Ã\áÿ\0\Êûÿ\0ŒÒºþ¾_\æ¾ð>Q¢¾µ‡öHñ^\åóüG¡\í9\ÞoM¤Û¸l÷W¦º]\'öCM\È\Ú\ï‹Ù7\Ï‘¦ˆ\ÞD=v\Ý^\ÜÊ±H1…&\ÎTù‰dlE\×õòÿ\05÷ñ0\ç\0œrp3\êi\é²°H£y\\\ã´ŒI\è0Ž}ºú\×éŽ‰û6ü-\Ò<¶ŸI½Ö¥ò%\Öun¨\0’\Þ\ØZY™f[Tf\'“Œ\ë:?„</\áõA¢øIÓŒd”’\Ú\Æ\Ý\'R}.6ÿ\03Œœu4Àü¸\Ñ>|A\×\Â6Ÿ\ám]£‘CE<ö­ilë‘“\ç]x\0“º4—¡À#šö-öRñ•ù¬\êz^‰\nÁ>¡s\ÏT\"hÃ¯\'ƒòœõ¯\Ðz(\æ}ö\\ð6–#}N÷U\Öfƒ†i\Ê=\Ø\Ã)ª²I\èI7s^Í ü<ðO†DgDðÎ‘g,O\æGt,\âšñû\Éy:\Ër„Ÿ›	*\Ü\ã5\ÙPN(\0¢“>\Ç\ëJs\Øgô¢ÿ\0\×\ÝþhŠ@O÷qøŠZ\\Ë¿õ§õý0\n(¢Že\ßúþ¿­À(¢Š9—\ëúþ·\0¢Š(\æ]ÿ\0¯\ëú\ÜŠ(£™wþ¿¯\ëp\n(¢„\ï°™úõ\Å-@Sr\ß\ÝýE:‹®ÿ\0ÖŸ\æ€(¢Š9—\ëúþ·\0¢Š(\æ]ÿ\0¯\ëú\ÜŠ(£™wþ¿¯\ëp\n(¢Že\ßúþ¿­À(¢Ši\ß`\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nù\Ó\â—\ì÷\áÿ\04úÆ…\ä\è>\"1\åx\ãÿ\0‰~£#ó]\ÛÇ·d¹@Q™‰2‰5ô]ù\âÿ\0x—Á7­g¯i—6Ÿ6È®\Z6kKƒ‚\Ä\ÛÝ¨0J¸e£—¦\èP_³º¶¥k¶rXk\Z}®£g*•x.¡YW©RF\è\Ûý¨\ÙXv5òßŽ?e]R3_x/S}\Z\é·8\Ò\ï\Ô\Ü\é¯!<,Wíº´@?¼—œ\à\à\ä\àj\è¼!ÿ\0#g…ÿ\0\ìb\Ñ?ô\åm]\'‹~ø÷ÁM#k~ºH\åS±ÿ\0N\Ó\å ý\å–\æF¤a‡ŸG‘\\\ç„A-ðÀ#x‹E\ÜNÚ€?\'?\à\íÛŸö¹ý‡¾þ\Æ^ ý“>=x\ç\à^¯\ã\ï‰_to\Þø&m2|E¦\è\Þð…\î“k¨GM\Ô	Nº¼¼–\ÜC\äü\×S<\Ï\Ýù\Ã\çü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿­Oø>þH/\ì	ÿ\0ew\ãgþ¡¾¯ó¦¥—¢öþÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9Gü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿¨¦ú¿Á­¿µ÷\í5ûgþÀ¿¾%þ\Ô\ß¼añ·\Ç:O\ÇOøgJñŒ\äÓ¥\Ô4\ï\ÚøG\Ã÷Pi6Ï¦\éúz}‘.\înn@™&”Kq&%\ì>Ô¾ÿ\0\Û\Ïúú¸ÿ\0Ñ¯_“ðfü£3\ãoýœ‡‹õð\Í~²_\Ç\í\çý}\\\è×¤·~¿¢­QLŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š)H#‚\ï\Ït\Ï=½\è(­k\rZ\ÕF\í7H\Ô\ï\Ô³\Ó\î\îp3$q”À,\ã=«\Ð4Ÿ‚?µ’¿fð~©n®,šˆƒM‰”Œ†^Mÿ\0dö€<¦ŠúJý•¼}wå¶£s¢\éh\Ü:Iu%\ä\Ñó\Ë¶DŒ€:šLžø\é\é\ZOì§¦[ñ]\Ä\ÅX+N±Ž4q\ßt³¾ñ\Û\0F{\äš\0ødH\0O@$ý)GiR!v‘†\Ëch ò3‘Ž9È¯\Ó]+öpøe¦¦Ù´û\íW\æF¡3Ç¼`\î\Ã\ä\Ä0\Ù*6as€8ô­\'À\Ð\Ê6—\á­\"\ÒD]‚T²…¥#\ÞGVb{\äœçž¼\Ð\åV•\à_\ën‰¥øwW¼2G\æBð\Ø]<3pp‘\Ü,F!\Æ6´‹·«•×¥hÿ\0³\Å][\Ëg\Ñ-ô˜]¶™u}B\Ú\ØÇŒd\Éo\\^…\çªÚ¾pvƒ\ÆM\ãŽ8”$Q¤h¼*F¡@ª\0\Ø\n}\0|1¢þÈº«\ß_ñfŸ%‡I²ž\è‘\Ý\Ò\âôÀ¤\ç\î«Z/xö¯pŸ\ÂKðs\à¿\Ä8ü5ª\ÞI¥øK\Æ^ ²\Ô\çHDöú®}si<q\0\Ñ/\Ùæ·‰\Ñd%9\\+\Ý\ë\Î>1\É\"ø§ÿ\0d\ã\ÇúŒê”¥·\Í~hò$ñ7üYÿ\0˜\ÓüK\â+_Û‡\âv\Öz\î±ko\Ð|V( \ÔncŠ5\Ý\áfm‘Æªˆ˜…P\É\Äÿ\0ˆÿ\0\à³ÿ\0ô|Ÿÿ\0ðC\à/þekñ§\Æò8x³þ\Æ]wÿ\0N—U\ÍS·—\áýv_p·ñ¿üþ“\âþ|ÿ\0Ì­~¢Áÿ\0\à¸?ðT¿\Úgþ\n•û\Z|ø\Ýû[ø\ß\Ç\n~\"|K\Ôô\Zx?P\Ò<ma¯\éø\Åú”vWsiþ´½X’þ\Æ\Ò\éM½\Ì/\æ\Û\ÄKü€W\íü¿ÿ\0)¥ý€?\ì®\ëú­|sJË²û¿®\ÈöW¢Š([/Eù\0QEÀ+ù\Ãÿ\0‚ªÁ\Ë±Oüg\ÄÚ¿ÁŸZ\ê?´\Ï\í!¤#\Û\ëŸ>j\Ö¾ø¨<<Ÿüo8¹³°\Õ#³Kw\á­\ÛSÖ¡‚t7‰§»q÷wüö\Ï\Õ?`Ÿø&\Ç\í1ûCøWQM3\â.Ÿ\áðgÂ»\ÇS›ˆ¾=»‹\Ã^¿„ôK//5ûVp\È\×\ZLh\ÈûöŸñi\Öõ½_ÄºÎ­\â/jw\ÚÖ½¯jW\ÚÆµ¬jw2\Þj:®«©\Ü\Ëy¨j7÷s³\Íuy{w4·77»I4\Ò<ŽÅ˜š[úio=ÿ\0¯ø`þ³>5Á\ä\ßðSj\Ó\Íð‡Àÿ\0³\ßÀ\Í\nXü¸´¸|!¨|H\Ô\àù6y¿\Û~*\Ô`‰\ç?}›û\"\ß\ÌpÄ˜AðŸ?\à\æÿ\0ø,÷Œ§3\Ú\Î\ë\Ây¹{Ÿ#Á~ð6‰\0ÞŠŸg¾‡xE²\íÞ‘nù\\±\Ý\Î+ð.Š,»~\×`?l/ÿ\0\à\â\Ïø,õýÅ›~ÝŸ­V\áU\rÅ†“\àkKÈ‚È’f\Þ\æ/	!f\Ùå³¡\rå»¨ ¶G)ÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ¯Çª)ûÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ£þÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9_TP\ì/ü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ærøÿ\0ü[þ’ñ\çÿ\0¼5ÿ\0\Ì\å~=Q@°¿ðÿ\0ÿ\0ø,·ý$\ã\Ïþxkÿ\0™\Ê?\áÿ\0ÿ\0ðYoúH?ÇŸüð\×ÿ\03•øõE\0~\Âÿ\0\Ãÿ\0ÿ\0\à²\ßô?ø\á¯þg(ÿ\0‡ÿ\0ÿ\0Áe¿\é ÿ\0ð;\Ã_ü\ÎW\ã\ÕþÁÿ\0ðm—\í-ñ\çöµÿ\0‚Uü/ø\ÕûHüOñ/\Åÿ\0Šš\×\ÄÏŒúN§\ã_Ig.±w¦x\ÇZ†™£X\Êö6vP4ûc·ƒ÷\Â3¶>\Ìÿ\0‚‹ÿ\0ÁTÿ\0c¿ø%\ïÃ‹~\ÔŸ®x–;Á\à…\Þ·]w\âOnlÂ¤§Cð\äsG%¾‘ms$j\"\Õ$³\Ñ\ì‡}Ì“!€þYÁ§Ú¥†‰ÿ\0Fø[­j·1\Ù\éšG\Ä\ï\Ú3T\Ôn\å8Š\Ö\ÃOøƒ¬\Ý\Þ\\\Ê{G¼RJç²©5þo¿ðU\Ûc\â\íýûsü|ý¡üy«\Þ\Þ\Ùjþ8\Öü;ð\ëCžòK­;Á¿¼3©\Ý\é~\rðÆ‹\Û½•®™\n^\\\ÑZóS½¾¿¸i.n¥‘¥_™öýl€þ˜?joø=Kö¡ñn¥ªé¿²\'\ì\áð\Û\á†„\ßñ%ñ7\Å{›ßˆþ4– \Ôt]:\ãFðµ¬·2Eo-ú®Fù\äiü´ñ\çü5ÿ\0œñÐ¸	ûFxsÁbx¥ˆü-ð^„mÄ²	Û´ú~¢\ë, yqH\í#\É\\\Õü\ïQM$º_\Òö\ìÁ\ÇðYñø\ÎOˆg\ë x\ç¿ñJþuÅ¿üÿ\0—wgoø(7\Çp]™\ÈK¿Æ€±$…Ž?\r,h¹?*\"ª(Âª…\0W\ã\ÅÀý…ÿ\0‡ÿ\0ÿ\0Áe¿\é ÿ\0ð;\Ã_ü\ÎQÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ¯Çª(öþÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9Gü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿¨ \Ø_øÿ\0ü[þ’ñ\çÿ\0¼5ÿ\0\Ì\åðÿ\0ÿ\0ø,·ý$\ã\Ïþxkÿ\0™\Êüz¢€?a\áÿ\0ÿ\0ðYoúH?ÇŸüð\×ÿ\03”\Ãÿ\0ÿ\0\à²\ßô?ø\á¯þg+ñ\êŠ\0ÿ\0g_ø \Ï\Ç_Œ´§ü\Çö`ø\Ïñ\ã\â¿ñGâ—Œô_]øŸ\Æ\Þ&{I5bko\ë6v¦\í\ìm,­›\ì\ÖpAm[uo*$ó\ZI7;~Á\×\á\'üSÿ\0(cýŽ\ì\\ñ_þ¦ºõ~\í\Ò]}DES\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(UÕ•”2°*\ÊÀ2²‘‚¬AF\à×™jÿ\0~\ë\Z•¦±\'‡l\ìuK+\È/ »\Ò\Óû8››y’xä¸†\ÓÊ‚\ë÷‘©aq™\æ½:Š\0þ?\àø?ù ¿°\'ý•ßŸú†ø\"¿Îš¿\Ñgþƒÿ\0’û\Ù]ø\Ùÿ\0¨o‚+ü\é©-—¢ü€(¢Š`§ü™Kÿ\0\Ðø\Õc|Ÿ´ŸŠ\ã\\ð7?ƒ<0«“\ØdŽköOYð¥ÿ\0†üzž\×\á€\Ül\Ø-\Ô0N\'…\í\ï\îa/›>ü\0\àa”’¯\Ç?ø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¢‰ÿ\0¼{®|P>.\Ñô¸oôyu\r\Z\á5n#Š\Ï\ì¢v6÷7\È\ÅDNB¯\Ì\Øw%»õý´Wÿ\0`ÿ\0\Ù@ð\ïŠ?i¯ü2ø#\áÿ\0jsh~\Ö>!x–]\n\ÇZ\Ö-mE\åÆŸa4ó•ž\êR.$yý+\äŸøy—üþGö[ÿ\0Ã™ÿ\0¯\Ã_ø=µGü2/\ìa•—ö€ñž	©ÿ\0…~€\àö\È\à\ãµ›$“»\èÿ\0/òü@ÿ\0eoøy—üþGö[ÿ\0Ã™ÿ\0£þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh§g\Ýÿ\0Vÿ\0\'÷þ\âÿ\0³×‹ÿ\0a\Ï\Ú\×\ÂzÇÿ\0f|7ø\Ó\á=X—\Ãz·ˆü\â)µ\Ý/L\×\Ò\Ò\Æ\Ó.® Ÿdw‰kuora Ÿ*XÛÕ‘ñ\Óö1ýœ\ì\ï\ÇÏ?ü\ÅÊŸˆ¿¼=\á	%¶¸ŸÊ†KM\ïP³¼¸„HDK,N8%˜mb?‚¿ø#\ÇüŸÁ\ßðIÿ\0ø!÷\í?\ã½:}[ý£þ*~\Ô\Zÿ\0„?g¿\0]\Ï³\ÜxŠO†Žó\â½¦\r\à\ß¡[Ë¹,:¶®¶\ZRn¹¹{\ä«\ã_\ÇOŒ´g\Ä_üXø\åñÅŸ>!ø¯R½\Õu¯x\ÃY½\Öu	\îo\îd»š+cw,‘iö\Ë+M2\Â;m>\Ê-°Z[C\n*”¯¿o\Âßž·ûÀÿ\0`k¯ø)Gü.\Â\æ{+¯\Û;ö\\Ž\æ\ÒW·¸ŒüN·r’\Äv:—Ž\å£bY”õŠƒþeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh§g\Ýÿ\0Vÿ\0\'÷þ\Ê\ãþ\neÿ\0D%@ý´?e²K\0ü,È¹$€úþ\ä×ªøöšÿ\0‚Sø\êö-\Ã?µo\ì\ç}¨\ÝÆ“A\r§\Æ\ï\ÚL\Ñ\ÊQc1\Éy­C,\ÓFn\Éo¿\ÅNŠ,û¿\ê\ß\äþð?Ü–?\Ù\ß\áwŽô¦Ö¾üB³\Õl_+m¥k\ZW‹4I%\Ú+j\ZT\ÒÁ\rˆ\æf\ÚG\ÊA¼?RýŸ~%Xx’\ÛÃ±\éz/Lk¬[J\Ð\Äy-\Å\Ë\0mLjUžKó¨Ešÿ\0Ù§ö\äý®ÿ\0c\ßi^3ý›?hOŠ?	õmÉ·µðßŠõ4ð\í\Ä.TOi©xV\î{Ÿjvw1¯‘<º\\\Êð¼‘¡\Í£\ì“ÿ\0C|+ñWü/\â\íûB	§\ígð\â\ßá—ˆ>h·Qhƒ\â\ç\Å\r~\ÆWøo\âh\Æg½Ó¼+\â\ÑÆ¡\â™,\Ö{?¶\âX\';4\Ø\çZ¯5\çò\ë\ç¯\Ï\ä€þ„¡ýœ~x\'FoüWñíŽ•§[ûu\íî©§øc@´f•e\Ö5i¢U8Vù¤xCfU\Æqó‡Œÿ\0l\Ïø$7\Â+™t\Ï~\×?³^•y\Ék,z‡\Æ=U•\'u2*4­R\î2\ÅA$†*\0Á ñ_\ä\×ûpÁNmOø(O\Ä=wÇŸ´Ÿ\Æ\ïøŽ\ÇTººm\'á¾“«j\Z\'\Â\ï\éS\\I=¾…\á\Ï\Ù]&‘\r˜¤w\Ñ_js’ò\Ý\ßO$Ž\Ç\à:v}û~Ÿ?\Ïp?\Ù[þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\èÿ\0‡™Á?\èôe¿ü9‘ñúÿ\0\Zš(³\îÿ\0«“ûÀÿ\0gýö\íÿ\0‚8ø\Ò´øwöÀý™o!K•°f·ø¹¤Ùƒu!R‘²^\ê±c½@/–aƒ^ÿ\0\á«_Ø\â‚c\á¿\Ço†~%¸˜\ì‰<!ñƒÁ\Þ\"•_\Ìò¶ý†\×V¼˜3?È¨È¥‰R \îÿ\0ˆ\rjhú\æµ\á\ë\Øõ=W\Õ4=J/õZ†¨]é—±a•Ç—we4¦þYÌŠ\ÝT¬û¿\ê\ß\äþð?\Ûû\Å²MôI?„|Góª³-†±µ–V\Ï\ËWpn„q\Æ\é£@O%‡”¼E\á­wÂš”ºGˆ4Û2þ.L7	$g\î\Íƒ1\ÍŽVHÙ”ô\È9ü\Îÿ\0`\ïø/Ÿü¯öñ.‹7‚þ=x£\â\Ç\Ã;\å›[ø1ñ³W\Ôü}\à\Íj\Ê[‹i/ ³¾\Õ\î®<I\á«\é­`kK=KD\Õ`R\â\Î\ácH«ý<?a\Ûo\à?üCö.ð÷\íð²Ñ¼=\â›v¹ðÿ\0Œ¼¨OÏˆ~|O\Ò\í\â—Vð¦£u ¾Ñµ’ýQ	Z¶‡}c¨ù6÷K-¼U¾ºþvK·\Ì\ïösð‡‡<e\â½WOñ.™©iŒ\×\Ã+ÊŠ“ý¢4ó†HØ¬F	#œ\ãŠ\äþ/~\ÚðI_€_¼AðŸ\ãG\í-û?|4ø“\áIm\áñ‚ü[\ã\Ï\ì½F–\î\Ý.í£¿²–}ð¼\Ö\Ò\Ç2rcun„W¬~Ê¶óZxÿ\0\ÄV·´S\Ûh\ÓA4l0\É,W±\Ç\"ue\"¿Ë‹þW\0Ágl|\03\â?	\Ôÿ\0\Â ŸS€}©jÝ¿­9_ùý\à£\ßü<\Ëþ‰ÿ\0G£û-ÿ\0\áÌ‹ÿ\0\Ñÿ\02ÿ\0‚\"\Ñ\èþ\Ëøs\"ÿ\0\ãõþ54S³\îÿ\0«“ûÀÿ\0eoøy—üþGö[ÿ\0Ã™ÿ\0£þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh¢Ï»þ­þO\ïý•¿\á\æ_ðDOú=\Ùoÿ\0d_ü~øy—üþGö[ÿ\0Ã™ÿ\0¯ñ©¢‹>\ïú·ù?¼öVÿ\0‡™Á?\èôe¿ü9‘ñú?\á\æ_ðDOú=\Ùoÿ\0d_ü~¿Æ¦Š,û¿\ê\ß\äþð?\ÙXÿ\0ÁLÿ\0\àˆ`m\Ùo“ÿ\02>ƒ¯ü·¯N\ÐjŸø$\ï\î!±ð\ç\ícû8^\\\ÞZB\Ý-¾6xj\É\Ú\ÕDldG¾\Ö`DP%÷n\ÂC»I\rñ[¢•Ÿ\ëO?\'÷þ\ãú\Â\Ù\ß\âm¼“|-ø©¡øB\ïûG„<i\á¿\ZÁ\ZŒ\Íý™yt\n`Œ“(À#\æƒ^s\ã_Ù—\Æþ\ZŠk\í\àñNŸ¼Ž¶J\ÐjQF§Œ\ÙHOžBe\ß\ì\Ò9\0|¨I\Å‹g\ÃßŒ?~jvú\Ï\ÂÏ‰¾?øqª\ÚÜ¥\äþñ~¿\ák”¹•–S.‰d]¾E$Ü®£c†BV¿¬ø$ŸüwûT~\Ï^>ðŸ\Â\Û\ç\Äz‡\íû<\ëz­Ž}ñ#XŽ\Ü|aø[o}4Vc\ÄZ·†%ñ·†ôhü™µ\rUµd\Óà»—LÔ¤¼u·™\ë\ë\ëò_\æöûDtx\ã‘9#fI#u(\è\êJ²:0¬¤\Ê@ ‚\Í2¾\Ãø\ë\á?\nx\ÇÁ\Ú\Ç‡WV\Z®…\â=;I\Ö_T\Ñ\Ý&\Óu\Ý^µ‚\ïFñ¬ƒ¥\Ä7g	bšo\\ŸøQ\à)~\"x\ËO\ÐYž-=\ßj÷ý\è´\ëb¦Uº	n’\Þ#œ†¸\Î\Â(N\êÿ\0\×ü8ð\Â\ÏüD†§c…¹\Õ\ï	·\Ó`9N\Ê|ùÀ\É@®ÿ\0/Í°s_L\Ùþ\Ë^\Ð4Ùµoø\Ü[ZY\Ç\æ\ßÜ£\Ù\èúE¤@®eŸQ\Ôd\ÄH3³|¦$‚rHð·þ\éÿ\0üð÷üwG\Ñe\ÙwÃ¾ñW\ík\âo\n\Ûk¾f³W\Þ\nø\áMDHš6»\â]9_x³^\É}¡øz\æH-M‚cXšX.¬\í®ÿ\0\Îö—ÿ\0‚þ\Ý?µÿ\0ˆõþÐ¿µ\ÆÍ¨‹ˆ›EŸ\Æ:®‘\á+K)\çyÆ›c\á\n}7\Ã\Ööoò­\áþ\ÎwHU\å““\ëø\ë°\ëóâ¿‰ŸðM\ï…q¼ž=ý¥¾\è\0a4z÷\Ç‹”>`„™,`\Ö\Å\Â/\È0\á\Æ	VÇˆjŸðQø\"¯‡oe\Ñõo\Û+ö_·¿´\Û\ç\Å/\Å+K‰\Í]\éºk{¹a|©\È\Ø\çƒƒ_\ã6\îò;I#3\È\ì\Î\î\ìY\ÝØ–ffbK31%˜’I$“šm+>\ïò\í\éøþ\Ê\ßðó/ø\"\'ý\ì·ÿ\0‡2/þ?Gü<\Ëþ‰ÿ\0G£û-ÿ\0\áÌ‹ÿ\0\×ø\Ô\ÑNÏ»þ­þO\ïý•¿\á\æ_ðDOú=\Ùoÿ\0d_ü~øy—üþGö[ÿ\0Ã™ÿ\0¯ñ©¢‹>\ïú·ù?¼öVÿ\0‡™Á?\èôe¿ü9‘ñú?\á\æ_ðDOú=\Ùoÿ\0d_ü~¿Æ¦Š,û¿\ê\ß\äþð?\ÚK\Ã?¶Oü#\â0µ>ý®f»ñªy±Ù›OŒºŸ½­x˜\Çý¡ª\ÛyL»N\ã.\Ðü\í\Ý\Å}	\áÿ\0‡?²\ç\ÅCð»\âÿ\0…|LóÇ¾ðg\ÄO\nø\ÉY_\î<q\é·\×\Ì\ë\Ï;\Ó5þ5\ÖøO\Ç\Þ;ð\r\çö|i\â\ß\ê\Õþ\ß\á?\ë¼Þ„µh÷–s\ïBVß• F+>ý¿~vü@ÿ\0oŸ\ÙT¼?bñl\Ø1\0\Í:U¼ˆ`‚Û­\îD08!Lj:ƒ¸u\è4¿\Ù+Ã±l}WÄºÛ¦—iokm÷\Ã\ïIdô\èG\ät¯ò\çÿ\0‚yÿ\0Á\Ì\ßðR?Ø\Ä\Þ\Òüwñ3Uýª>Z\Íce­|0øÍ¨Ï­k6š-:\Ü\ÂñQ\'‰4\rT†¹µgL¹¸‚\î\ìLo,•þ£ß±\íŸðSöÿ\0ýš~~\Ô\0õ™5?üBÓ¤’M>ùc^ðŸ‰4\é\Z\Ë\Ä~\rñ-¬N\ëi¯xwTŠk\ÄVxn\"¼´y-. •\Ýõµ»¯—õ\Ö\àz\Z|øC\à\íT\Ô5\"\Ëû\'K²¾\ÕuSZ¹\í\í´\ë+V»¿º¹Ì¢­-­\á’y\0Œ,q£À¯€,¿\à¬ÿ\0ðFmm–_¶‡\ì‘aug3\Ç\æ/‹twÐ¹\Ô\\=»\\#F\èW‰8+\Å~ˆþ\Ð\\üø\á\Ü„_¿ø¢õšÿ\0\Í|®\ë@\0\0Õµ \0\0É°\0\0¥«o^«O¹ÿ\0Àùþ\Óiÿ\0¦ÿ\0‚K\ÆIöýý™·\Þ)ñLR\Ø\é’gôÿ\0ø}_üoþ’û4ÿ\0\á\ÆÓ¿øšÿ\0º)\Ù÷Õ¿\Éý\à·\Ï\Âoø*üŸ\ã¿\ÄO|%ø;ûeü\nøñ/Æ—“\ØxSÁ^ñ½–§\â\r~ö\Ú\Æ\ëR¸¶\Ólb]÷Eaewvè¼ˆm\å~Šk\î/x›Ãž\Ñ\ï|E\â\ï\è~ðöœ‹.¡®øU°\Ñ4{‰$½\Õ5;‹[+Tg šhÔ±95þ8_ðoF·£xkþûx—\Äz†‰\áÿ\0x\ÛÇšþ¹­j·0\Ùiº>£üø©\êw÷—\Ú\Ú\ÙYA=\ÄóH\ê4nI ^ÿ\0‚õÁf¾#ÿ\0ÁN¿j_\é?üi\âö;øi{y\àÿ\0ƒþ\0³\Ô\ï´\Í\Æ6zu\Û%ÿ\0\Ä\ï\èöóEoª\ë^-¼…o4ÈµHî¿°ô8´\Ëa\âòYÕþ\'ý[ó·ç¾ §_\à­ðL¯‡ºœš?ŒnÙ«EÔ¡¸¹µ’Ù¾(øvô¬öŒ\â?7Mº¼„ùl@\Ü$(\ßÀ\Ì+Œÿ\0‡\Õÿ\0Á&ÿ\0\é ?³Oþm;ÿ\0‰¯ñK¢Ÿwý[üŸ\ÞûZ\Ã\êÿ\0\à“ôÙ§ÿ\06ÿ\0\Ä\Ñÿ\0«ÿ\0‚Mÿ\0\Ò@fŸü8\Úwÿ\0_\â—E}\ßõoòx\îƒû9~\Ýÿ\0±¿\íy­x›ÃŸ³\í#ð³ã†»\à\Í.\Ã[ñV—ð÷\Äö\ÚõÞƒ¤\êwsX\é÷úŒp(ò-®\ï-æ·…\Øü\Ò\ÆË\Æ}\Ã\ãü’/ŠöN<qÿ\0¨Î©_\ç­ÿ\0Aÿ\0\É\Ì~\Ý?öBþÿ\0\ê«\×úübÿ\0’EñOþ\ÉÇŽ?õ\Õ)k®·\Ö+ÿ\0IüÀÿ\0?ÿ\0\È\á\â\Ïûu\ßý:]W5]/Œÿ\0\äpñgýŒº\ïþ.«šª\0¯\Öø!—\Åo†ÿ\0ÿ\0à¬Ÿ±G\Å‹þ5ðÿ\0ÃŸ†\Þ\nø«jž,ñ¯Š¯—Mðþa\'€<ca\rÖ§|\ê\Ém\×\×v–i#ž}\ÌJÌªÅ‡\äõþÖ§þYÿ\0›?óÙ }>\"\é\ßüM>/ø-7ü~yb‚\Ûûök’i\åŽcOˆºqy%™\Ö8£Q·–weU\Éþ(õµ\á ˆ´\0@ \ëZP Œ‚\rô \Ô\Ù÷\íø[üŸ\Þû\éX^\ÚjVVZ–Ÿså†£mo}ew‡†\ê\Î\î¸¶¸…\ÇðÈ’\Æ\ÝXÖ®Wžü%ÿ\0’Uð\Çþ\Éÿ\0ƒ?õ\ZÓ«Ð¨‹\Ó\îÿ\0\ÒP\Êü7­\Íaÿ\0™Ñ´xƒ„×¿j/„\Ép\Ê\ÛTÁ¦\è~:½Xd_\ãW¸ò\Ð<Ý…–©üUÿ\0(²ðGýÃ¯ýF|q_\å½Dvû¿ô”EU\ê_¾	|Zý¢þ&xS\à\ßÀß‡þ&øŸñC\Æú‚\é~ð_„´\é5-gV»*\Ò8Š$\Ûöñ+\Ïw{w-½•º=\Å\Ý\Ä0£8þ¯¾Á˜_ðP_ˆ~±\×þ0ünøðU¼ó?„.\äñ\'\Ä]r\Î\ÚuY¼¸ð½­¾‰ô¶\Ù\ì\ÓS•c¸p\Ê\ZQõ§ü!ð[Àú¯ÿ\0lÿ\0z¦“g¨xû\ÂZ\Ã\ï‡^Ô®­!–\çÃº7ˆ\æ\Ö5I¥\\º™mg\×\r†›g~\Ñi-,R\Þ\\²«¡˜\Ï~¤ðÿ\0\ZW\è·ÿ\0†ý—ùù\Úø2\ãNN?nÿ\0…ø\ÏøM\â\Ì\ã¶q\â´ŸñÆ¯ú>ÿ\0…\ßøi¼Yÿ\0\Í\r¢f\Ñ\è?*0=\åK\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?do\ØÅŸðJ\ßø\"¯\Ç\Ï\Ùg\\ø—£|Oñ\'€þ~\×\Þ7ƒ\Æþ\Ñoô\r>fño…üm\â}6´\ÝB\ê\ê\î)ôÕ–§\Ü–dg‹jüyÙ™Ù™‰fbY™‰ff\'%˜œ’I9$òO&¿\ÝWö\àýŠÿ\0küùµßÿ\0ú©üY_\áSDo­÷¿\è€(¢Š 44\'T\×õ]7C\Ðô\ë\Ý_Z\Öo\ìô­#I\Ómf½\Ôu=OP¸Ž\Ò\ÇO°³·I..\ï/.¥Š\Þ\Ú\Ú\Þi\æ‘#\Øýb~\Ë?ðgŸüc\ã¿\Ã\í\Ç\ßüyð‡ö^\é\Ðj¶	ñññŠ<weiu2\Û\Ã\â-Â¶’Zh:¡?\Út»­NK›?,%\ÈIÙ \ãø5÷\à\ï…þ1Ádfø<Ya§gð\ßKøñkM²ºŽ­\Ä>\rð\Í\Çö\Äöó¤‘\Ît\ëýF-J\Ôm\ß\rý¥\ÔdIšÿ\0^¾ùÏ¶?\ÏzM»\ÙVjúz>\àŠÿ\0Á?6&ÿ\0Û¿\áfý‰\æmøO\âÒžfÑ¿f|@\ÍùÙ¸nÛŒóšwüAñ«þ¿\áwþ\ZoóC_è™\è?*0=\åK\Þ\î¾ÿ\0O/\êþ€ŸüAñ«þ¿\áwþ\ZoóCGüAñ«þ¿\áwþ\ZoóC_è™\è?*0=\åE\å\Ý}þž]ö\ï@?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò¢ò\î¾ÿ\0O.¿ûw \çgÿ\0@üjÿ\0£\ïø]ÿ\0†›ÅŸü\Ð\Ñÿ\0@üjÿ\0£\ïø]ÿ\0†›ÅŸü\Ð\×ú&`zÊŒAùQyw_§—_ý»\Ð\Ï\ïø%\×\ì]­ÿ\0Á>?aÿ\0‚²Wˆ|q¦|G\Õþéš½…\çŒ4m.\ëE\Óuw\Õ5\ÝCXW¶\Óof¸¹·HVôA‰fvcló_ T˜Ÿ—´\Õþÿ\0òK²\0¢Š)€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEü0ÁðòA`Oû+¿?õ\rðE5¢\Ïüÿ\0$öÿ\0²»ñ³ÿ\0P\ßWù\ÓR[/Eù\0QEÀÿ\0Oø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¯\ï\àÿ\0€ÿ\0Jþ@\à\Ì?ùF\Ï\Æû9¯ÿ\0\ê!\ájþ¿¿ƒþý)-ß¯\è€þ&?\àöÿ\0ù4o\Ø\Ïþ\ÎÆŸú€%›…¤ü\ßÿ\0&ûÿ\0\ÙÀø\Óÿ\0P¯óp¡l½\äESWži#Š–WŠ\r\âÝ£‡\ÌmòyHIXü\ÇùŸ`\Û\ælžj*þ³?\à\Ùø!ÿ\0ÁŸø)~·ñcöŒýªF©®|ø!\â]#Á\Z7\ÃM#Rº\Ñ\Ä/ˆwšm·ˆ\î¿\á$\Õl\Ìw\ÑøO@\Ñ\îtóqa§O\Ú\Å\î¤-§¹‚\Ú\Öh\î?ºeÿ\0ƒÿ\0\à\n ø\'\ÏÀr\0\0e\âf$–oc\ê\ÌI\'’I¥_\ê\ß\çp?\Æ6Šÿ\0g?øpü§þ‘ñðÿ\0\0|Kÿ\0\Í|¯ûVÿ\0Á®ŸðI\Ú\áÞ³\áÏ‡-¿f_¶™xžø‡ð{V\×,\ßH\Ö\Ú[ýg\Ã:Æ©©\è¾#\Ó\à•—\íZe\ÄV\Æ\â,˜\î`¸X§BýÕ¿¥ú»|˜\äiE}ûZ~\Í\Þ7ý¿i_Ÿ³\Äyl®|iðG\âˆ|®_iŒÏ¦\êr\è·m®¯§³|\Æ\ËW°k]J\Ô6YaºDbYM|ñLœÂ²`ŽTº‚B±\\\í,¹\Ã\ÉÛq“Ž´\Ú(\0¢¿Ô“þ	1ÿ\0\Â~À_?e…¾=ý°¾\é´‡\íñOÀ^ñ—\ÇZ¦­?‚</‰¬­u\Û/x?\Ã\ÚEþ™l²h¶WqX\ß\ë—\ïu{©]}¥ö[B¶ð\ÇúŸÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¥~\Úÿ\0Ã¯óü\ãE³Ÿü8þ\Óÿ\0Høø\rÿ\0€>%ÿ\0æŽ¿\àº_ðm?\ìL?cÏŠÿ\0´·\ìMðº\×ö}ø\ÃðÁ—þ>ºðoƒou)|ñ\ÂŽK\ïišŽ‰¬_j\Ù:ý®ö­[O\ÖôÛ˜G\Ó…å¬±\Ý\á/\ÝZÿ\0\ä¿\ÏðüÔ¨¢Š`ý¬Á•?´.³\á\Úûö–ýšg\Ôn¥ð\×\ÅoƒVl4wºYYø—á®¿i§\Þjööy1}®÷Gñ\\V7s\0à´³R\ÅaU¯âž¿ªø3È‘ÿ\0ŒþË¿AÁ##ûGÀG\Ôdƒ\Ü\Ô\nOošü\Ð\ék\àmè¿´7\Ä?.#¶½\Ò\ÓP¼§X·_½­Ëª>ÁÝ¾PÄ‚yþP¿ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\èþ\Ã\"(Ä†Q\Z	Xm2_0¯)|n#Á8\àzWøóÁ\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T­þ_¤\0ü#¢Š*À(¢¿\Ø_öÿ\0‚ÁüUð\à—Š5ÿ\0\Ø\à^¥®ø“\á\Ãm{Z\Ôg²ñ+O«k\rÑµ\rJöfÿ\0„™n¯.&žC\Ý\ä&“vþ¼\Òý@ÿ\0Š+ýœÿ\0\áÀðFŸúG\ÇÀoüñ/ÿ\04tÃ€?\à?ô€\ßø\â_þh\è»\ìÿ\0«yy¿¸ñŒ¢¿\Ù\Ïþÿ\0iÿ\0¤||ÿ\0Àÿ\0óGTõø7\ÏþÏ¨\Ø^X?\ìðJ\Ño-\æ¶7Zt^*²¿¶ó§Ÿgw‰[{˜‰\ß¨~GPHeÊ•~\é¯\é›û˜\ã1EEðq—üóÀŸðJO\ÚgÀð¢µ=Pýž>>økTñ7´¯]6©¬x_\Ð/\Ò\ÃÄž\nŸ]‘R]n\Æ$¸°\Õôk\ë¤ûrY_µ•\ä—Ù‹™ÿ\0z \n(¢€?\×þ\r•ø\Ñ{ûJÁ?g›/Io®\Üü4¹ñ¿ÀÛ¸.X\Ü<š\Ã\ßOi\áh¯‹9‘\ä_Ï¥*»\ÛbM¤\ì¿|ôø[\Â\ÆVðö…§i/:,sKi\0Y¥YcyX´¬¡˜¶\Ò\ädŽ8þ[ÿ\0\à\Î\ÏùD\í\çh¯ŠY÷ù4:þ¬¥?º“þ¹¿þ‚j{ÿ\0‰}\ÞîŸ \âÿ\0Dý¡µÿ\0ÚŸþ\nû\\üoñõ\Õô\Þ-ø\ã\ã»})n¦–a§økÃº\Ý×‡<7¤Ù‰YŒ:~›£iVv¶V\à…†U\0s_×¨|n$ühø¼I$ŸŠ?$’I$ø¯V\É$òI\îO&¼¾¨Š+Ö¾ü\Zñ\íñ¯\áOÀ\0\Ã\Þ2ø»\ãÿ\0|>ð\ï\Ú7ý’\ßRñN±k¤\Å}|c\r\"\Øi\Â\å¯\ï\Þ5gK;i\Ý™B%¢¿\×öBÿ\0ƒ]?\à”¿³¯\Â\í\Ã_>\éßµÄ§Ò´ÿ\0øM>#|ZÔµË¸µ/-¼cRŸ\Ã>\Z\Òõ=3JðÖ%Àag`‘]\\$*¯qw-Ä“;}cÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¥~Éµ\ß\æ¿\Ïð`Œeþ\Îð\àø#Oý#\ã\à7þ\0ø—ÿ\0š:?\áÀðFŸúG\ÇÀoüñ/ÿ\04t]öÕ¼¼\ß\Üø\ÆQ_\ì\çÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¯\å{þ\\ÿ\0ƒ|ÿ\0e\ÏÙŸön»ýºÿ\0bOÿ\0Â¡³ðˆt\r\ãÁý*úþûÀ÷^ñ\Ñ\èö1ð´\Z­\Í\í\ç‡õ#Z6Vú¶Ü¶\Z•¾¬\×QCi5‘Y\Îm¯¥öû—ùþ\0´QE0\nÿ\0A/ø2/ö€×¯´\Ûcö_¿ºi¼=\áë¯‡Ÿ|;÷Hm/¼F5xŽ\ÊAm\"\èZ\Í\ÒÂŠ¯s2\ÊÙ‘Ý›üûkûiÿ\0ƒ$?\ä\î¿l³ŽG\ìý\à¿ýOÞ“\Û\æ¿4ú~\Ð9ÿ\0…	ñ¿#ñh~%t\è\âŒÖ‡—N\Õþ¾ ÿ\0ö·ÿ\0a}Kÿ\0K&¯÷‚ý ¿\ä‚üpÿ\0²Eñ+ÿ\0P½f¿Á÷\Äò\Öÿ\0\ì/©\éd\Ô\'{¾\í\é(Š(¢˜ô\ÝWS\Ñ\îMæ‘¨\ßiw†›_µ\é\×S\Ù\\ýšò	-o-\ÅÅ³\Ç(†\î\ÖYm®c{ie‚PñH\è\Ô+\êOØ›ö]ñ?\í«ûY|ý•|¨A£\ë¿þ#h¾‹Y¹Pð\èºm\ÃK{¯\ëM2‹†\Ò4-ORŽØº}¦[T·Þžf\áþ­ÿ\0¿\àÚ¯ø#\×Á†\Þð³û&xO\ãNµ¥\Ú\Â5ˆ\ßõ\r^ñ‰53I{u%ž¯§\éº}µ\Å\ÊKqm¥i\ÖP\ÚX$\ßfˆÈ‘«R¿õý_€\ã\ÙE³Ÿü8þ\Óÿ\0Høø\rÿ\0€>%ÿ\0æŽøpü§þ‘ñðÿ\0\0|Kÿ\0\Í}Ÿõo/7÷þ1”Wû9ÿ\0Ã€?\à?ô€\ßø\â_þh\èÿ\0‡\0Á\Z\é¿ðÄ¿ü\Ñ\Ñw\Ùÿ\0VòópÈ§üÿ\0\'1ûtÿ\0\Ùø_ÿ\0©þ¯_\èSñ‹þI\Å?û\'8ÿ\0\ÔgT¯›?e_ø\'\ì7ûkþ,ñG\ìû5ü:ø\â\é:‹u_[j\Ý\ëº6›zúŽŸzÚ†§~¦\Þ\Úõ\Ú\å%Œ™Y˜\0\Ò¿\ä‘|Sÿ\0²q\ãýFuJZë¥µ‹ÿ\0\Ò ?Á\Ï\Æò8x³þ\Æ]wÿ\0N—U\ÍWK\ã?ù<Yÿ\0c.»ÿ\0§Kªæª€(¢¿Tÿ\0\àˆ¿>þ\Ðÿ\0ðU_\Ø\Ç\à·\Æ\ß\è¿~ü@ø•«h\Þ3ðGˆ’\éô_i±ø\ÅúŒ6·\égsgr\ÑÃ¨YY\ÞF#¸÷ö\Ño\ßø\Øò²¶ü5ÿ\0#‡ÿ\0\ì7¥\é|þ\Ëð\àø#Oý#\ã\à7þ\0ø—ÿ\0š:|ð@?ø#\\R$‰ÿ\0ùø\n7WBtÿ\0°„2’­\â&V\0•`Tô Ž*So£þ­\å\æþ\à?P>\É+øcÿ\0dÿ\0ÁŸú\é\Õ\èUGNÓ¬´};O\Òt\Ëh\ì´\Ý*\Î\×N\Ó\ì\áCicen–¶–\ÑIÁq\Å$ª2OZ½Dvû¿ô”òQÿ\0•\Ê,¼ÿ\0gGð\ëÿ\0QŸWùoWúÿ\0Á\å_ò‹/\Ù\Ñü:ÿ\0\Ôg\Çþ[\ÔGo»ÿ\0I@QEP\è?ÿ\0@ÿ\0È£ûwÿ\0\Ø\Çð›ÿ\0Mž!¯\ïf¿‚oø2þEÛ¿þ\Æ?„\ßúlñ\r{5+\â?\Ê\0QEPQ@Q@Q@.þ\Ü?òeµ÷ýš\ï\Çÿ\0ýTþ-¯ð©¯÷Vý¸\ä\Êÿ\0k\ïû5ßÿ\0ú©ü[_\áSInýDESújÿ\0ƒH?\å2\ì‰ümÿ\0\Ó…¬u“ü\ZAÿ\0)“øsÿ\0dO\ãoþ˜,+ýcªW\Äþ”\0ü¿ÿ\0‚·ÿ\0ÁKü;ÿ\0£ý•mj/|,\×>/i—?|!ð\Ïþ_\ë\Ú‡/¢ŸÅšˆµõf\Ô5+k¸\r½¢øzH^\Ý id’\î&cI2Ÿñ÷Á_ú1Š?øv|\'ÿ\0\Ìõ}óÿ\0Œÿ\0\Ê#4\ßû:Ïƒú|G¯ò¹¥š\ëÓ«\í\ßúùþ‰¿ñ÷Á_ú1Š?øv|\'ÿ\0\Ìõñ÷Á_ú1Š?øv|\'ÿ\0\Ìõ•\\«\Ï\ï\ç\ä¾\à?\Ñ7þ#~ø+ÿ\0F!ñGÿ\0Ï„ÿ\0ùž£þ#~ø+ÿ\0F!ñGÿ\0Ï„ÿ\0ùž¯ó²¢ŽU\ç÷¿óò_p\è›ÿ\0¿|ÿ\0£ø£ÿ\0‡g\Âü\ÏQÿ\0¿|ÿ\0£ø£ÿ\0‡g\Âü\ÏWù\ÙQG*óû\ßùù/¸÷ÿ\0‚tþ\ÚZGüö@øIûZ\è^\Õ>\é¬5[\ë_k:­žµ¨i+¥\ëWú;,ú•„0[\\†±7”†6H\åTu¬+\í\Úü$ÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯Ýº—]Ÿ\è€(¢Š`QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0ð|ü_\Øþ\Ê\ï\Æ\ÏýC|_\çM_\è³ÿ\0Áÿ\0\Éý?\ì®ülÿ\0\Ô7ÁþtÔ–\Ë\Ñ~@QE0?\Ó\ãþ\Ãÿ\0”lüaÿ\0³šñ/þ¢¯\ëûø?\à?Ò¿ø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¯\ï\àÿ\0€ÿ\0JKw\ëú ?‰ø=¿þMö3ÿ\0³ñ§þ 	_\æ\á_\éÿ\0·ÿ\0É£~\Æöp>4ÿ\0\Ô+ü\Ü([/Eù\0QEÀÿ\0M_ø2´\çþ	ñûE\Óþ\ZŽûû§ž¯\ìˆtAü«ø\Ýÿ\0ƒ+?\å´Wý÷þ«¿\×öD: þU+\â—\Ëòi;¡þkKI\Ü}óKeþ(\éHñšÿ\0ƒ‚\É?ðY?\Û\ç?ô[.\ÇþP4:üm¯\Ù/ø8/þS\'û|ÿ\0\Ùl»ÿ\0\Ó‰_µ@$?\ëbÿ\0®‰ÿ\0¡\nŽ¤‡ýl_õ\Ñ?ô!@\ïGðLŸøS_=þxŸü%4šõ\Zò\ï‚_òF¾\Ù0ðþ¢zMzLvû¿ô”_%~\ß@\Ø[ö\Î?\á”ÿ\0hNqð—Å§¡\È\ë\ÏÖ¾µ¯’ÿ\0oŸù1\Û;þ\ÍOö…ÿ\0\ÕK\â\Úoošü\Ð\áwES\0¯\êƒþòÿ\0”ÀEÿ\0f»ñ·ÿ\0N¯\å~¿ªø3\ËþSýš\ï\Æ\ßý8x“\Û\æ¿4ú¬Wøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê WûWøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T\Çu\éú@\Â:(¢¬¿\Þö^ÿ\0“gýÿ\0\ì…ü$ÿ\0\Ô\ÃõþuþðŸ²÷ü›?\ì\ïÿ\0d/\á\'þ ¥\Õz?\Í\î”QE0\n(¢€?€_ø>üŸ°Oû\ßÿ\0—„«ø¯\ïûþûŸ°Oû\ßÿ\0—„«ø¤¶^‹ò\0¢Š)þ¨_ðgoü¢vóþ\Î+\â—þ¢Wõe7ú©\ë›ÿ\0\è&¿”\ßø3·þQ;yÿ\0gñKÿ\0@\Ñ+ú²›ýT¿õ\Íÿ\0ôS\ßüQÿ\0\Û@ÿ\0¯\ßòYþ.ÿ\0\ÙOñ÷þ¥zµy…z\Æ\ïù,ÿ\0\ì§øûÿ\0R½Z¼Â¨¿Q\à‰\àø+\ì\ÃEx/‚=\Ñ\èr:óõ¯ËªýFÿ\0‚\'\ÊX¿`û8¯ÿ\0\èwTþ\ÖTQE%²ô_QL¿	ÿ\0\à\åb\á\Ë_¶—¿†|?ó%øB¿v+ðŸþVÿ\0”-~\Ú_ö,øÿ\0V_„*^\ëúûQüwè¢Š \nþ\Ú\à\Éù;Ÿ\Û3þ\ÍûÁúŸ½\Õý´ÿ\0Á’òw?¶gý›÷‚ÿ\0õ?zOošü\Ð\èaûA\Éø\áÿ\0d‹\âWþ¡z\Íƒ\ïˆ?\ä=­ÿ\0\Ø_Rÿ\0\ÒÉ«ý\à¿h/ù ¿?\ì‘|Jÿ\0\Ô/Y¯ð}ñü‡µ¿û\ê_úY5(\í÷\é(Š(¢¨\Û/ø70ÿ\0ªý‚r\Ç\Ä\ÏøS\ãò\Ïpy¨<Žký‘\Þo\ÃùWø\ÞÁ¹òš¯\Ø\'þ\Ê_Šÿ\0õTxþ¿\Ù}\æü?•.«\ÑþhQEÀ(¢Š\0+\Î>1\É\"ø§ÿ\0d\ã\ÇúŒ\ê•\èõ\ç¿\ä‘|Sÿ\0²q\ãýFuJOošü\Ð\à\ç\ã?ù<Yÿ\0c.»ÿ\0§Kªæ«¥ñŸüŽ,ÿ\0±—]ÿ\0Ó¥\ÕsTÀ+ö‡þ\r\ßÿ\0”\ÒþÀöWuýV¾9¯\Å\êý¡ÿ\0ƒwÿ\0\å4¿°ý•\Ýcÿ\0U·Žhý•è¢ŠKe\è¿ \n(¢˜\ÉGüUÿ\0(²ðGýÃ¯ýF|q_\å½_\êCÿ\0•\Ê,¼ÿ\0gGð\ëÿ\0QŸWùoT\Ço»ÿ\0I@QEP\è?ÿ\0@ÿ\0È£ûwÿ\0\Ø\Çð›ÿ\0Mž!¯\ïf¿‚Oø2\ÓþOÛ¾=\é\æü&sõó7\Ä*Ç\á¡ö\í,\nƒE{y©_ùþP\0¢Š*€(¢Š\0(¢Š\0(¢Š\0ùwö\áÿ\0“+ý¯¿\ì\×~?ÿ\0\ê§ñm…Mº·\í\Ãÿ\0&Wû_Ù®üÿ\0\ÕO\â\Úÿ\0\nšKw\ëú \n(¢˜\ÓWü\ZAÿ\0)“øsÿ\0dO\ãoþ˜,+ýc«üš¿\à\Ò{›{oø,§\Ã1q4p›Ÿƒ_\Z­­Ãœy\×\á\ë7Hc\ã™#‘€\ã!ž+ýej~\×\ßùD\æþºø!ñƒö€ÿ\0‚\\\é\Þø!ð\Ó\Æ¼f?iŸ„\Ú\ÓøcÀº÷ˆµ´\Ñ\ì4?\Ã{©¶Ÿ§\Ç5È²µšò\Ò\ç”ŠK¨C#ü\Ø?\á\ÖðQÿ\0ú2?\ÚWÿ\0\rGŠ¿ù__\íÿ\0E™t\íÿ\0¶¯\Êÿ\00?\Äþaÿ\0ÿ\0£#ý¥ð\Ôx«ÿ\0•ôÃ¬?\à£ÿ\0ôd´¯þ\Zò¾¿\ÛþŠ=\î\ßÖž~ ƒwÆ¿\Ù\×\ã·\ìß®i>ø÷ð“Ç¿|C¯iG\\\Ñtoˆ\Ô|5¨\êš8»ž\Ä\êvVº”0Kqf/m®-Lñ©ŒO‘\çr<b¿´Ÿø=¤“ûsþ\É ’@ý”\îp2p3ñk\Ç\àv\É\ä\×ñmTžˆŠ( öÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯Ýºü$ÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯ÝºKw\ëú \n(¢˜Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@\Ãüÿ\0$öÿ\0²»ñ³ÿ\0P\ßWù\ÓWú,ÿ\0ÁðòA`Oû+¿?õ\rðE5%²ô_QLôøÿ\0ƒ0ÿ\0\å?\ì\æ¼Kÿ\0¨‡…«úþþøô¯\äþ\Ãÿ\0”lüaÿ\0³šñ/þ¢¯\ëûø?\à?Ò’\Ýúþˆ\âcþoÿ\0“FýŒÿ\0\ì\à|iÿ\0¨Wù¸WúGÿ\0Á\íÿ\0òhß±Ÿýœ?õ\0Jÿ\07\n\Ë\Ñ~@QE0?\ÓWþ¬ÿ\0”|~\Ñ_ötw\ßú®ü_\Ù\è>ƒùWñ»ÿ\0V\Ê>?h¯û:;\ïýW~¯\ìˆtAüªW\Å/—\ä\ÒwCü\Å-\'qô?\ÌQ-—ø¡ÿ\0¥\Äñšÿ\0ƒ‚ÿ\0\å2·\Ïý–Ë¿ý0h•ø\Û_²_ðp_ü¦Oöùÿ\0²\Ùwÿ\0¦\r¿j€*H\Ö\Åÿ\0]ÿ\0BIúØ¿\ë¢\èB€?Þ\à—ü‘¯„öL<ÿ\0¨ž“^£^]ðKþH\×\Âû&ÿ\0\ÔOI¯Q©Ž\ßwþ’€+\ä¿\Û\çþL_ö\Îÿ\0³Sý¡õRø¶¾´¯’ÿ\0oŸù1\Û;þ\ÍOö…ÿ\0\ÕK\â\Úoošü\Ð\áwES\0¯\êƒþòÿ\0”ÀEÿ\0f»ñ·ÿ\0N¯\å~¿ªø3\ËþSýš\ï\Æ\ßý8x“\Û\æ¿4ú¬Wøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê WûWøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T\Çu\éú@\Â:(¢¬¿\Úsösÿ\0‚œÁ<´?\Ù\ï\à>«þ\Ú³–Ÿª\é¾éš•…\ß\Å/Áuea\à\Öò\Ò\æ	o–Xg¶¸ŠHfŠEWŽTdu¤Wø±\ÑI«\Ûú\êŸ\èû€ÿ\0\Ã\Ó?\àœ_ô{³Wþ\nòÂøzgü‹þoöjÿ\0Ã±\áOþXWøQEŸwý[üŸ\Þû€ÿ\0\Ã\Ó?\àœ_ô{³Wþ\nòÂ¼\êûþCÿ\0£\Ó.n\ì\ï¿o\ßÙ¦›	%Š\î#ñK“Ê’ùªZ?1n1³©þküP\è¥g\Ýÿ\0Vóòx\Õ\×üSÿ\0Lýÿ\0à ¿´/Àÿ\0‡?²ÏŒ¬þ&ü.ýŸ<)\â«üJÒ­\çÃ¾\'ñÇ.\ì®o-ü+wu\Z–£i\Z}…¬ú‡\Ùã·¸\Õ$»Ž\Ô\Ë\r°šO\åŠ*–‰.ÀQE\0ªü\Ø\ãS·Ÿöq_¿ô\r¿«)¿\ÕKÿ\0\\\ßÿ\0A5ü\ìÁ¬?uÏƒ_ðF\ï€w^\"\ÓV\ÃSø·\â_ˆ\ßm¹\ï<7\â\ïO…/¸:›gpŠÀ&\Ê\îFF?\ÑW±\èGO\çü\ÅOñ/ý·_N¾€‚¿\Æ\ßù,ÿ\0\ì§øûÿ\0R½Z¼Â¾\Ðÿ\0‚‹ü\Öÿ\0g/Û»ö¶ø-\âZ-GÀ~&i£(È“X\\ø£P\Ôô«˜*‰-®t\Ë\ëI­\æA²h$Cµ…|_T_J~\Ç¦ý•ÿ\0j¿\Ù\ïöŒŠ\Â]U>\r|ZðWo´¸R\çR\Òt-j\Ö\ãZ\Ó\í]Ê¢]\Þim¶µy.$‰¤ùW\ÍtPûN|ÿ\0‚\ßÿ\0Á,h\0\è\Þ?ð\í›ðgCƒR\Ó\ìn\ïü1\ã\ï\Ùx\Æ^\Zº½g:Gˆ¼=\â³º²\Ô\íN\è§HMÍ¾\å-\rÄ±•s\ì¿ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°¯ðþ¢•»7n\Úù“ûÀÿ\0pøzgü‹þoöjÿ\0Ã±\áOþXQÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\nÿ\0\ê(³\îÿ\0«“ûÀÿ\0o‹\Ïø*\Çüf\Â\Ò\æú\ïö\àýš¡µ´…ç¸—þ¯…\ßË†1¹\ßdw\Î\í´s„Fc\Ø\ZþY\à\åø.÷\ì)ñ{öñ¯\ìmû)|e\Ðÿ\0h‰\Z5ŸZø›Zð\n^_øÁžð\î»»ª¶¥\ây µ²¼\×oot½:\ÓO\Ó4\Ãx<¹gººšƒË“ü\èh¢\Ý\Ûvÿ\0ú«€QEÀ+ûiÿ\0ƒ$üe\Ï\í—ÿ\0fý\à¿ýOÞ¿‰jþú?\à\È_‚ºúk_·\'\ísfW\Â÷\ZW\Ã?ƒzEó)Mz\ÒóUñ¦½dñ\'•§\Þh\å?Õ™B±ý\à=¾kó@v?´ü_ŽöH¾%\ê¬\×ø>øƒþC\Ú\ßý…õ/ý,š¿\Þö\Ïü(Où\ÆO\Â‰]:È™­Wø>øƒþC\Ú\ßý…õ/ý,š”zü¿ô”EQT\íŸü—ÿ\0)ªý‚\ì¥ø¯ÿ\0UG\ëý\Ç\Þo\ÃùWø\ÞÁ¹òš¯\Ø\'þ\Ê_Šÿ\0õTxþ¿\Ù}\æü?•.«\ÑþhQEÀ(¢Š\0+Î¾0+?\Â_Š(Š\Î\ïð\ë\ÆÊŠ ³37†µ0ª rX’\0’Nz-Q\Ôôûm_M\Ô4«\Ä/g©\Ø\Ý\é÷H	\í¯`’\ÚurE#ö\ÏŸ\ê¿4øø\Ô2ø\ËÅªÀ«/‰µ\å`AªÝ‚=<\\\Í}û`|%ñ7ÀÚ«öŠø9\ã	4\Ï|9ø\Ïñ\ÂÚ”ª\ÊñI¦ø§SŽ\ÚÜ…ž\Ð\Û\ÜGœ\æ9T‚A\ÉùÊ˜}‹ÿ\0ùý¨\ìWûkþ\Ìÿ\0µC\érkv_>+øs\ÅúÎ“\Å\Íÿ\0‡Y4\Ï[Ù‚U\Zùü?¨jaŽFXd¼G3™\Èø\êŠ\0ÿ\0jŸƒ?ð[/ø%\Ç_i^<ðg\í«ðKO±Ô¬\ì\î.t/\Zø¶\ÇÁ^,\Ð.o-\ã¹:Wˆ|;\â³½Óµ[UGu\0Â’)\\MY\Ö?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE+y¿\ê\ß\äþð?\Ü¿\à©\ßðNVfý·?f ª1ÿ\0…¯\áN\0\'C<Jû·O¿²\Õl,µM6\ê\í;R´¶¿°½¶‘f¶¼²¼….-n­\åBRX. ’9b‘IWÕ”E€•¼\ß\ìú1ð\àˆ\0|\"øl\0\0\à\Í\0\nZ§{\Þÿ\0‚_\å˜\ÌGüSÿ\0¯ð\\‹´qþÔŸ\rÄ’%¿†|s°;…/µ¶\ç¶œt¯òÛ¯õ»ÿ\0ƒ«¾\n\ë¿ÿ\0\àŽ?ot+i®\î~xÿ\0\á\Æ[ø­\Ð\É Ñ¼;«^xwW›\Ê\\³\Çog\â\É.&\Ú“RNØŽ#ü‘(Ž\ßwþ’€(¢Š ?r¿\àƒ_ðWË¯ø$o\íM­ø\×Åž\Ô|mð\ãF…¥ø#\ãW‡tCñ.›e¥\ê2\ßøs\ÇK—Ž\Ú\ïUðµ\Í\æ¡ö\"Y ]gI\Ô/­c¸Šò;&\éð;þÿ\0 ý </a\â~\Ú\ßô–»°†þ\ï\Ã>?\×\×\áÿ\0‹ôAp_m¾·\áÿ\0&Ÿsiv\n6ô®#\Î@•ˆ ‹u­òz~ÿ\0+þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þáŸ´?\ÆO…??\àžÿ\0µŸ\Äoƒ¼\'ñ?Àz‡\ì\ÕûH\é\Ö>.ðVµg¯\èW\ÚG\Ã/Xê–jVKm$ö‘Imu\Z¹1LŒ‚+ü<\ëýSÿ\0\à\ÙOŠðo­¿\Ãh\ão‰\Z‡\í{\àA$²5o\ëþ*ððyj/ö€,\Äª3‚+ü¸~!ø7Tøu\ã\ïx\\µ¹²\Ö<\â\ßxOT´¼‰àº·¿ðö¯w¤\ÝE<R*¼r,ÖŽYA\ÏlRŽ—[\ë¿\É\ÇQE@}›ÿ\0øý²|aû\0~ØŸk?\éË®\ßü%ñtZž­\á‰n¤³·ñ_…u[\Å>žt?º:ž‰x–sH¯¶¢–Wo‹}§ý`¿e\ïø8;þ	?ûQø/\Ã\Þ%Ñ¿k‡\ß¼O«\Ù$ºŸ\Ã/Œz’ø\Æ\Þ¾H\Ó\í¶7–ú¸M¾†\Úå¤†OK\Ô.¬¯cE¸…\ÄSFø\ØQJ\×ù_\×ü0\îÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\n?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE}\ßõoòx\îÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\n?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE}\ßõoòx\×üÿ\0ûD|	ý£¿l¿\Ù\Ä\ß~-ø\â÷‡ô/Ù¢\ãCÖµ‡þ$\ÓüK§\éZÁøŸ\ãõ\Ó/®´Ù¦†Ö²¹·º3\ïò&ŽL\0Â¿‘\Ê(¦€(¢Š\0ÿ\0a\ßø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¯\ÂOø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¤·~¿¢\0¢Š)€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEü0ÁðòA`Oû+¿?õ\rðE5¹o\í‰ÿ\0ûýo½À\Ú\íoð_@øÉ¤|7\Õ5gÁvz\í\î·bš£\âK+b\â\Ýô]OM–C{m§YG*Nò\Æ>\Í*«OÁÿ\0ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUJvIY\ÝY~_\æ€ÿ\0*+ý\âø#ý\ß\Ã\Ïüx÷ÿ\0šª?\âø#ý\ß\Ã\Ïüx÷ÿ\0šª|Þ¿Õ¿\Íùuÿ\0aÿ\0\Ê6~0ÿ\0\Ù\Íx—ÿ\0QWõýüð\é_+þ\É_±7\ìÁûxYø_û*|\'\Ñ>ø_ñÇ‹u}CºÕ¯-\ï¼Csgka6¥,º\Åþ£tf{;+[}«0ŒG\nA\Î~¨\çn?\Ù\Ç\éBw»óý\Ä\Çü\ßÿ\0&ûÿ\0\ÙÀø\Óÿ\0P¯óp¯÷8ý°?`Ÿ\Ù/ö÷ðÇ„|ûZü\Ð~1øsÀz\í\ç‰<\'¦\ë×šÍœz6·¨X2òþ\ÚMQ\Óf2\\X³:\Ë$‘\ì\è€ó_\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T“\Ñ&ŸEÿ\0¤ÿ\0˜\ã…E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUO›\×ú·ù ?%ÿ\0\à\Ê\ÏùG\Ç\íÿ\0gG}ÿ\0ª\ïÁõý‘ƒ\è?•|Ÿû\"þÃŸ²\Ï\ì!\àü8ý”>\è¼\â¯·Œ<A¢hWZ½\ä\ZŸˆ\ßO³ÒŽ§<ºÆ¡¨\Üù\ß\Ùöv¡ReŒE\0™\É?Xƒ\è)GW\'m\íù\0´\Ç\Ðÿ\01KI\Ü}ô¢WkþÞ‹û¤›üf¿\à\à¿ùLŸ\íóÿ\0e²\ïÿ\0L\Z%~6\×ûI|pÿ\0‚\ZÁ+ÿ\0hÿ\0‹8ø\ãñ£öFð?Ž>)|H\Ö_\Ä>5ñmþ¯\ãk\Ý{Y’m¤¿º‡Oñ\r¥š\Ìð[\Ãy6ñ)¯Ëœ“\å_ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8U$?\ëbÿ\0®‰ÿ\0¡\nÿ\0cŸø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªø‡þÁ\Çü`\ß\Ã\Î?òñ\á\ès\È>*Á õù½«šõ«\à—ü‘¯„öL<ÿ\0¨ž“^£Yš>‘§øI\Ò4-\Õ,´M²\Ò4»8\Ë\í4\í:\Ö+;hË–b[AJY™ˆQ’NMiÒŽ\ßwþ’€+\ä¿\Û\çþL_ö\Îÿ\0³Sý¡õRø¶¾´®_\Çð\ÏÄø»\á\çt˜5\ïø\ï\Ã\Z÷ƒ|Y¡\ÝV\×Yð×‰´»­\\Ò®\ZŠeƒP\Ó/n­&1I‚9˜£«aƒ–\ß5ù ?À¾Šÿ\0c\Ñÿ\0\ãÿ\0Á\0þo\á\é\Ç:ÿ\0r~¿ñUu£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\n¿ªø3\ËþSýš\ï\Æ\ßý8x¿¹\ßø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æª¾‘ý•¿\à?ðNØŸ\âª|lý˜fo	|(øžž\Ö|$¾+ÑµO^^\ë\ïe&­§u}sP´ò\ïN´\Þÿ\0góTE„u\ÙM\Ýu\Ý~q¨¥Uþ<ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\èþÃ•þ<ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\è£¿\Ëô€„tQEXWúñüÿ\0ƒz?\àŽþ.øðS\Å^ ý‰þ\ê:÷‰¾|7ñ·¨K®ø\åe¿\ÕõŸhÚŽ¥{2\Å\âx\â\Ý\Þ\Ü\Í<‚8\ãŒ<„\"\"\áBn\ß×š_¨\ä9E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@ŽþÇ¿ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8TWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05U\Ý\è?ð@ø#†þ\È\Úüû\àD\ÓZAöx\î5m3^\Ö\æ2yo-Á\Õõ\ÛÔšw‹M\"R\ÄFQp Nýÿ\0«˜\ã7£hš×ˆõ+m\Ã\ÚF©®\ê÷¯\åY\éZ6ŸwªjWr\Ï;k(§ºÿ\0ØŠ\'ojþ–¿\à‘ÿ\0ðl\ï\í‘ûtøûÁ?¿h¿ø£öký’­\ïô\Ío\Ä\Þ$ñÕ…Ç‡~!|E\Ðc¸ó¥ð÷Ã\ß\Ç±šº[\\i÷^(\Õ\í¬tý	\\\ÜE¡w\äZ¿úzü&ýd¿	f>~\Í>O§\É\æ\Ù_øOáŸ„t­^\Ú@ˆŠñkP\éCVR4þšvX`³ô¦	\ï\íþ=Gœû\Ñw¥—\ß\ÓnŸð\Û\Çü>ð„~xÁÿ\0\r<¡\ÙxkÁðÞ\á/\nh\Zt)Ž‘ x~\Â\r7J\Ó\í¢@ª#·´·‰7cs²³¹.\ìO`}}?\É\ç¾)h¡+-u{¿_\ë`?\ßø9þ\r\åñ·\í\å\â!ûl~\Æ:U\ß\í¦xr\ÛFø±ð¢\î\ê\ßHôo\Ú,\Z»\á}Få¢°·ñþ‘¦\Ãý“&Ÿ%½¿‰la\Ó\áK¨u+Uû_ù\Ãüdøñ¿öxñf¥\à_ŽŸ	¾ |&ñn‘s¦_h~=ð®¯á»´¾´fKˆ`mJ\Ö/Dl­û\ë)® p7$¬¼\×û\Ì\ã¸\ãùv\Ï¸¶kÌ¾%üø?ñŸK:\'\Å\ï…_þ\'\é>D\Ö\ëc\ã\ïø{\Å\ÖðE8e•m“]Ó¯¾\Ê\Ìˆ’\ÛÊ‘—WW\ÃQ¶?­?\àöüCüh¯ö˜ñ?ü¿þ	\ã-B]S\ÄðOÿ\0\Ù\æ\æúyæ¹š{O]h\Þd\×,Vh´]KO„†a‘dg>Z&N|®\çþ\r\Îÿ\0‚0\\\ÜMpao†°\äiL6\Ú×Žá·ˆ±\ÉHa_Š1ü(¼(\àq\Å.o&¿¥\éÕþ7tWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05Tù½«šüp¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\nŠÿ\0eþ\r\äÿ\0‚2h\Âq\ìð†ü\ÎP“¬\\ø\ËT1bu\â‡Xƒg/°\ÄœWÓŸ	¿\à”¿ðM¯·‰¨|,ýˆÿ\0g/_Å°\Åv¿ü?¬\\F\Ñ\Ã\äG$Rø‚\ÛUd•c\àJ¥e<\Í\Þf—7“\×þùþ\0’ÿ\0\ìÿ\0cý¿ÿ\0\à¢þ2\Ñôo‚üQ¡ü?¹\Ôl\íüGñ³\â&“©xC\áo…t\ÙÇŸ6¥6¹ªZÀúô\Ée\Äö:W‡aÔ¯µ9\áp*Hû—ýj\àš?ðOß…_ðL\ï\Ù\á\Ï\ì±ð®yu¨ü5\rÆµ\ã\Þ\Ú\Åkªü@ø…­ùw(ñf¡E¾\Ï\å\Ú-¶“§¦]+Gµ±\Ó\ã’E·go»tý:\ÃI±µ\Ó4«=/M±…-\ì´ý:\Ö;+;x\Æ[Khã··…	Qª(ûª*\ïOñõ§«\ß\É\Û\î\ß\Ñþ€y\íÿ\0$\ã‡ý’/‰?ú…\ë5þ¾ ÿ\0ö·ÿ\0a}Kÿ\0K&¯÷\Ë\×tM/\Ä\Ú&µ\á½r\Î=CEñ—¨hš½„¥\ÄWº^«e-†¡i!FW\Ü\ÚO4.Q•‚¹\ÚÀ\à\Å\Ù?\àÜ¿ø#²I+þÃŸ\Ë\Ë#\È\äk¾;Q¹Ø³aW\Å!Tdœ*€ p\0‹Ù¿7ÿ\0È¯\Ìñ¿¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Í\×þ\r\Ëÿ\0”\Õ~Á?öRüWÿ\0ª£\Çõþ\Èc\ï7\áü«ò\à7üûþ	oû2|]ðO\Çß²_‚¼ñ_\áÎ£s«x3\Åún¯\âû›\íQ»\Óot{‹«h5\ÞY<’iÚ\í©ó\í¥\'r 8V«£«{\â„\î\ÓòüùXES\0¢Š(\0¤>¼ñ\éþy¥¢÷øšÿ\0ƒŽ¿\à\Üþ\×þ>Ö¿n\Ï\Ø[I°\Ö>6\êšT#\ãÀÖ¸´Ò®~\'\\h¶^EŽ<}töö\r\ãYt\ëh4\Ío\Ãú„ö\ë\â‚\Æú\Â\íuw\Ïù\á|[øñ£\à\'‰õ|køU\ãÿ\0…~(\Ò\ï\î´\Ë\ÝÇž\Ö|3v—\ÖR4w0\Â5K;h\î\Äl‰m$ž	y‘\Èñ\Çý\èq\ßüH\í\Û\×üó^oñ\à\ß\Â?‹ö	¥üXø[ðó\âfŸR\ÃŸ|\á\ß[\Û\Ç2ºÈ¶\Ñ\ëúuø¶\Þ$š-Ô±`ÁŽ\êJ\ë\ÏÏ¯õ\ç\à¡Eµ‹¿\à‡_ðHÿ\0\ßI©xŸöýž//¤¸š\æK‹O	M¢3\Í0A+\Ð\ïô\Ø\Ê8Eý\Ö\Ï(¨šñù\àÜ¿ø#³K/ü0\ÇÃˆ¼\Ùd—Ê‹]ñ\êC˜Å¼¸“þ³²$\Î\Ø\×\'j€2qš/¶_øõüo¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¯÷›ýŸ¿\ä‚üÿ\0²Eð\Ûÿ\0P\Ý¿(üÿ\0` øaÏ‡£ ŒÇ Œ÷þ®¾•ûO¡hš_†´MÃš¤z~‹\áý+O\Ñ4‹‹˜¬´½*\Ò\r>\Ò\"\ì\Îc¶´‚P»3A¹‰É¥{¸Û¥ÿ\0¿\Ì{\âG\Ã\Ï|[ø}\ã…¿4koø\â/…uÿ\0x·C»]\Öú§‡¼M¦]i\Z½”‡“ž\Ê\îdŽd\Û,”šYQ”—ü\Ëþ\r±ý±ÿ\0`oˆ0ñ\ßÀŸx¯öý’®õ+ýSÂž5ð.—q\â/øEšt–\ß\Ãÿ\0ü%¥Gq«[\Ü\éks„%Ó­.´m`k¦6[Hÿ\0ÖŽóþ\Ïjv³Ó®ÿ\0\ç\ßm-\é°\à-©\ézž‰u¥k:uþ‘ªX\Ê`¾\Óu;;‹û9\Ô\Ð\ÝY\ÝGÅ¼ª&9£G\0‚G5B¿\Ý#\ã\ì%û~\Ð+t~4þ\Ë?~#\\_;½\æ¡\âO†~º\Ön\ÚN®5¸ô\Øuy‹d“\æ^¶	f$“ñ&½ÿ\0þÁ<D/\r\ï\ìðB\Ök\é¼ù®4{oè“¤¥÷³Aý—\âX\às¾8£X˜1%	 ÐŸ“_\Òÿ\0?ó°\ã%E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@ŽþÇ¿ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8TWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05Tszÿ\0Vÿ\04ø\áQ_\ì{ÿ\0\ãÿ\0Á?\è\Æþ\àûÇ¿ü\ÕQÿ\0\ãÿ\0Á?\è\Æþ\àûÇ¿ü\ÕQ\Í\ëý[ü\Ð\ã…E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@|¿ÿ\0”ÿ\0\Ê¾\rÿ\0\Ù]ý ?õejµø\Éÿ\0ÿ\0Áµÿ\0\Z~*|jñ\ç\í\ßû\0xM~!\Íñ\"\âo|rø¤\Ë¿‹\ãñœÌƒUñ\×\ÃkI\äŽA\âGe¿\×|/‘jVš¼\Ô4¸®\í®^\Ú\Ûûrý˜?eo€±Ÿ\ÂM+\àW\ì\Õð\ïKø]ð«EÕµ\ÝsLðŽs©]\ÙZ\êž$\Ô$\Õ5«µŸU¼¿½g½¾•\æp÷,©±ª _A\ã¦8ö\Ç\×\éþ·J•«r[\é¿k\'÷ý\àÿ\0¾\Z|EøU¯\\ø[\âo€üað÷Ä–’\ÏÆ‡\ãOjþ\Õc’\Ö_&qö-b\Ò\ÎwX¥ù\ZDF%HbI\â+ý\æ>(~Ï¿>6\ÛKgñ‹\à\Ç\Â\ïŠKhöL|{\à?xªdµ•J<÷ZÖ™yuj»¶š&\\\åH¯ÏŸÿ\0Á	¿\à^.½“P\×\àŸß³\Ô÷’™L“\ÙxnûF.fb\îYt]WOŒ\Ì\Å\Ü\ÄIò¶fª\ï³þ­ý|ž€‹mþ\Ç\Íÿ\0\äÁ™¿á†¾\Ì[¯xô(\É\'\n?\á*8Qœž\0“þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\nŠÿ\0c\ßø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªŽo_\ê\ß\æ€ÿ\0*+ý\âø#ý\ß\Ã\Ïüx÷ÿ\0šª?\âø#ý\ß\Ã\Ïüx÷ÿ\0šª9½«šüp¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù 9ÿ\0ø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¯ýžÿ\0gƒŸ²·\Â_\n|ø\à;\á\×Â¯\Ãwo\á\éS^\ÜX\éQ_^Ï¨Ý¬Sj77—’\ïng¸vš\âF/#\ãŠöš{o¯\à€(¢Š`QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\Ì?¶\Ç\ÍSöiøâ‹z7‡\ì|M©hwz-¥¶“©\\\Ïie1\Õu;{\'’ym‡Ÿˆc•\ÝR2¥Ÿn[\0ƒø\Åÿ\0ºø£ÿ\0DKÀŸø=\×ÿ\0Æ¿eðûÀ/üQ\Ékñd˜\\\Ç*\Ãf5²ªµ\ë\ç9V_5\Ã\Ð\Âbj\ÓT1¸ºœcKFJ¢‡$›iI¸\Ê\ßÎ¾*})üðg‰ip—gYž;­•\ásˆaðYg™RúŽ2¾+Br\Äa(NŠœª`\ëÞŸ3”c)$¤\è\îŠþq?\á÷_\è‰xÿ\0ºÿ\0øÔ°ÿ\0Ánþ%‰¢7<ðS2C\âr)š<\ëŽ“$nW!]¢‘T\à”`0~\éýü}I¿õS/vW²\â~»\ÛE|\Å+\ê÷ii«]?6\í\0ú3¶“\âŒö)´œ¥\Â9õ£v•Ý°\Ù^\îÉ»\'dÚ±ýQ_žÿ\0‚\àØ¾£~*ýŸ¯-ô©%…f¼Ð¼w\Õõ¤%È¸•,/|9o\rü‚2Vÿ\0o\Ó\Ã:•k…¹?iþü[ðW\Ç/‡~\ZøŸðûP“Qð¿Š,\ÍÕ“\ÜÂ¶\×Ö“E,–÷ºn¥j²\Ì-u>\ê)mo-\ÄÒ¢K1M4M¯ù‡x1\âg†|&7¸[“\à1õþ«…\Ç\Ç–fX*˜¯e:\Ë\r,NU\ÆÓ¡ˆ•*ugNŽ%ÑXR«*Jq§6¿ið»\é\àÿ\0Œ¸\ÜnY\á\ç\áó¬\×.Â¼v3*­—\æ\ÙNaO«Bƒ\Å\Ó\Ã\æ\Ø±XxU«Fj\à\Þ\"8yW¡C¥*\Ô\ã/L¢Š+òóö ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šü¬ý½\à \Þ0ý¾\"x+Á^ø}\á\Ï\Ûx§Ásx¦\â÷Y\Ôu+9\ígMvÿ\0H[Xc²!\Z/.\ÈL\Îùbò0Ÿ¯\àn\â_¸‹\rÂ¼\'‚¥Î±t1xš8zØ¼.œ¨\à¨\Ëˆ“\Äc*Ñ¡\nQrQ”Ó›÷b›gÀx—\âg	øI\Âx¾5\ãl^\'`±X,|Fˆ\Ì+F¾aˆŽ\r†\Â\Âu¥UšR’ ½\éh~©\Ñ_ß±—ü\ß\Ç´÷\Ç]\á&½ð\Ë\Â\ÞÓµ=Äš»j\ÚN«ª\Ý^E6‰d—qD°\Ý\æŽrJHNFO\Ù\Z\é\ãÿ\0¸³\ÃòŸq––]›U\Ëðù¤(Q\Ç`ó<*®\"…\Zž\ßZ½\'W^.›šœyqJQ¿…^-ðWŒü5[‹x‹\Ì2Z®+%«_—\â²Ú«ƒ\Ã\àñU\é¬>.\ê¸FŽ;\ÕEI9J)\ÞH¯ñ\ãÿ\0ƒ•ÿ\0\å3¿¶7ýŒ^ÿ\0\Ô\'@¯ö¯ò\Øÿ\0‚ûÿ\0Á.?\à¢_´üsö©ø­ðcö8ø\ïñ#á¿‰õÿ\0\Í\á¿\ZxSÁwZ®®Am\á\r\Öyô\ë\ÛyfŠ+¨¦¶}Áf†@ShVo…¿½÷þP?K?’\ê+õþ¥ÿ\0dÿ\0£\0ý¦?ð\Ý\ê?\ãGü9Kþ\n\Éÿ\0FûL\á»\ÔÆªÿ\0\×õ\ê¾ð?/ký\á?e\ïù6\Ù\ßþ\È_\ÂOý@<?_\ãz\àŠðV0	?°\í1\Éÿ\0‹w¨öüký\\þ-~\Õ:÷\ì9û%þ\ËwzŸ\Ãi|I¯\ßø\áÏ‚5ŸjzÁðõÏ‡µ-\áÆŽÚ•½\Þ\Í?Rg¼·¼·–\Îh0‚)b“\ç~{¼/\Ã9\ßñU\Âü7ƒY†wœÖ©†\ËðX\ÃaUz´\èU\ÅN/Œ­‡\ÃRJ…\n³\æ«Z	òò¦\ä\ãòœq\Æ\Ü7\á\Ï\n\æüi\Åøùeœ9‘R\Ã\Ö\Ìñ\Ð\ÂbñÒ¡^7\r—\á\Üp¸\ZŒUWS‹\ÃÒµ*3\å\ç\çŸ-8\ÊKõŠü(øaÿ\0“\Õ~!|Hð€\æøg¦\Å\ã?ø\Ãj1ø\êK‰,W\\\Ô\í´\ãx7‡#Y¿\Ú<\ß(ÈžfÍ›\Ó;‡îª’@Ï¿ó¯¤ñ\Â\Þ9ð·–\àx\ç%Y6\'6\ÃW\Å\à!\Ç+\ÌUzz£ZNyf3\ZN*F<µ\\%+\Þ)«µò>x\ßá·X\\\ç\á\Î{W<¡b0xl\ÖUr¬\Û+xj\Øúu\ê\áb£š`°n²«5wz>\ÑC’\Õ9y¡\Ì\ê(¢¿>?Y\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¯‘¿m\ÚCYý•þ\ÜüU\Ð|7¦ø«P‡\Åðú\éZ­\ÕÍŸ•¬½\à–å¥´ýñ’µ4)g\Ë³Ã¹i\ÅY\îQ\Ãy%\âs|ó‡\Ër\ì<\ëR\ÃB¶/QS£	×¯:tiFRzÎ¤\ã\î\ÚG\Îq\ä\Ü\r\Ã\ïqz¸l‡2\ÜNkšW£‡«Š«K…‡=i\Ó\ÃÑŒªÖš\ÃNœ\\¤ôHú\æŠþvt/ø-W\Ä\Ý[]\Ñ4©~\nø(µMcK\Óe’=w]2Gýý½¤’G¼•ó&,›]Ànd\è†	<\èb—|\Ø\ÖM¹\Î\Ý\à63œgÀÏ¥}§ˆþq\ï„õ2Š|q•P\Ë\'žCS-öž_˜ª\Ñ\Ë\Þbùž_\Ù:o‡IU\å\ç\æ|—å•¿9ðƒ\Çÿ\0\r<sŽ}/óL~b¸nYtsUŽ\Ê1ù[¥ý¨±\ìþ»Jš­\ÏõG?³m\Óq2\\È–Š(¯Ì\ÚBŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š+ñ“ö—ÿ\0‚¯\ê_³ÿ\0\Æ\ß|\"¶ø/k\âX¼wchº\ä\Þ2}9\ï\ÍÖ›k|\Ò}‰4¡\0V¸1ªyò&Ks_sÀ>ñ—‰Ù¶\'$\àœ¥gž<\Ï‡–?.\Ë\Õ<<F:\Þ\×2\Å\á(ÍªØºöpœª>w.^X\ÊKó¼aðÿ\0ÁœŸ/Ï¼CÎªd™fi™,£^–Y™\ær­–ŒT,³	‹«M}_Z~Ò¤!NñQ\æ\æ”Sý›¢¿9¿ao\Û\Âóö\Ç\Ôþ!\é·!ð!ð5Ÿ‡\ïRh<F\Ú\à\ÔFµ>£DÑ¾•§›s±<¡ÃUp	ý¯3Œ8?ˆ¸ˆq\Ü-\ÅYz\Ë3Ü¶8Yc0KƒÆªQ\Æ\à\èc°\Íb0ñ8jž\Ó\r‰£SÜ­\'.I¨\Í8¯g\Ã\ß¸O\Å.Àq¯\æSÍ¸s3«Ž£ƒ\Æ\ÔÁcrùÔ©—ck\åø¸¼.a‡\Ãb¡\ì±Xj\ÔÓ\Æj*tÜ¡(É”QE|\Éö¡EPEPEPEùoû{þ\ß\Þ.ýüm\à?\nøsÀñ|>.ð½ÿ\0ˆ.nõ­KQ³’\Ò[]^]5- Ž\Ë\nÑ”ˆ\È\î\ä±f\0\0\'\ëx#‚8“\ÄN#\Âp§\n`\écó¬m,]|>\Z¶/\r§*X,<ñX‰<F.­\Zp£NRQ”Ó“\\±»gÀø—\â_	øK\ÂX\Î6\ã\\^\'`q8&#„Ábs\nñ­˜\â©\á0±Ž	Ö’•j‘R’,#yI\Ù©W\ã\ì{ÿ\0@ñ\Ï\í+ñ\ßÃŸõß†ðÞ®i^!¾}_IÕµ[›\Ëytm2KøUa¼\Ý\Ç+G\å\ÈeX`\çör»<@ð\ç‹|/\Î\èð\ï\åôr\ìÖ¾]C5¥B†;˜BX,MlN•Oo‚­^”d\ê\á+\ÅÓ”•H¨©8¨\Î-ùþx¿Àþ4ð\î+Šx‹\Ì2|m_%\ÄU\ÆeØ¼²¬1øl.Vš¡Œ§N¤ ¨c°òUbœ”£~h4QE|1úpQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEù\Éÿ\0Xÿ\0“.ø…ÿ\0aÿ\0\éþÒ¿’.\ãý\å™¿­\ßø*\Çü™w\Ä/ûøGÿ\0Oö•ü‘ˆüû~9\é_\ëw\ÐSþMsÿ\0e\æmÿ\0ª^?\Â?\ÚAÿ\0)€ÿ\0³wÃŸú´\âú\ÖðŸü+ö+Ô¼-\á\ÍB÷\áw} \è÷—S7Œüt†[‹­:\Úy\å\Û‰#w\Ë#6\Ø\ÑPg\n \0ý_þ	oû\\iZ”ü/—G’k¨\ã\Õ\í¼k\ã_´inð8MFw\â)\í\Z[&\"\å\î	­Y£q—Fþ~l~1ÁDa±²‡Oñg\íLš|V¶ñ\Ø-´?²Ù¬(-E±Kr†\Ü@#òJ†=¥\Ò\rAª|Rÿ\0‚‡kZ}Þ•ªx£ö¬»\Óuk‹+û&O‰o{gw[\ÝZ]F*\Ïmq\Ð\È7e#\×\çñ|wú\ëªþ”J/­:¶qeYR§\íy\ÔV¦>4f\á=”Ú§+r\Ë\Ým?Ñ©ý\"þŒñË¡‡—Ð·/­‰Ž\n4]wÀ\ÜO\Ú\×T#jñ²o¬\Óö•“¯Mûxs{H^¢Wø\çY³‡N\Öu:\ÞVž\ßO\Õõ;y˜©i­\ìï§¶†V(KIJ\ìUB’\Ç\0+ú«ÿ\0‚DH\ïûøuY‰x÷\âq\î¡\ÖüÂ£þ#·ü\n¿šötý |K¡üø­¨\Þ\Í$I²?x™#®$G%\Õ\Ôúlv¶p´†¹»š\æi%UV#ú\Èý‚>ø£öxý™|ðóÆ©,koÄ¾ °·’)\ÓJ\Ô<I©M¨d½Õ¼\Ó[\ÝM§[´\Ó\Ïo#@ó$‚&tP\íõŸM\Þ(\áÊ¾\ä\Ü?G=\Êñ\Ù\Þ#‹²Œ],†\Äce…Àå™¼qX\éÐ¡Rs¥B3\ÄP¦\ê\ÍF¦\"8¶\åeóÿ\0³£„øžŸ\Ù\ïT\á\Ì\ß\Ãø^\Îð•³F‡Ë©bs\ß%–/Ž/J:ØŠ‘\Ãb\'NŒe*ŽžµYE*rk\á\Ûsþ\nañ£ögý üCð“Á~øa­\è\ZFƒ\á]V\ßQñE§‹&\Ö$Ÿ]\ÒRþ\ê9ŸIñF•e\åE+€GfŽ#Ç˜ò7\Í^\'\à?ø-\'\Ä\Ò|y}ñ#\á\ï\ÃÅ¿°ðü?ð€\é>·ñUœšÇŠ®®ü¤]j\ïVñ­\r¾ƒaj²]_há¾•Œö\Î¯$?*ÁZ\äõümÿ\0boÃ¿ýG\"­\ßø%Áo†~<ø®\ß\â…4¿\éžð#kšV‡®\ÛE¢Iª\\\ëZw\Ú5.\á^\×QX-¦”Á\ÜrÛ¬¬%h™•q†Y\á7™O\Ñ\Ï ñŠ¼?¡˜W\Ãð\rqsŠ\Ë*\â(\ç–*­¶­xS­<m*4§˜\â**š‹\Ù8a\ë×•\'\nŠ\ro\Ä>7ý#ó¿¥WxQÁ^(b²œ>3\Ä\Þ%\ál‡šR\Â\Ö\Érœq\Øü5	T£jõ!–\á`\ëa`\Õg*ô(ª‘©h\Ë\ÑOü¿ö‘\É\Ç\Ã?ø\É\Ætÿ\0\ç³c8\ê{žkôþ	\åû|üTý®¼}\ãÿ\0\nxÿ\0\Â¼=c\á?\Øx‚\Â\ãÁ\Ö\Þ$‚\î\â\î\ëXM=\á»:ßˆu˜Z\Ùab\ê!ŠD˜&B¿-}µÿ\0}û)ÿ\0Ñ¸|ÿ\0\Ãc\à\ßþS\×y\à/‚>\ß_j\r>|?ð£ªZ¥Ž¥}\á\è^»¾²ŠQ<v—w\ZU¬\×\é8,2»F$\Â\î\0\×ò·ø¡ôz\Ï8K;\ÊxCÁ\Zü3Ä˜\Ü5*yV}<m\Z‘Ë«\Ç†«R³„1\Õe.|=*\Ôt§-j\Þ\Ú]løm\à\×Ò§‡8ã‡³®9úB\áx·„òü]J¹\×Cˆ§<\×\r,-zP ªO/¥¸\â*Q­wR7öM_U/ý­¿jo	~\É_\â\'‰4«¿__j¶º†|-ayŸu®kI,\æ7¾ž+‘cagio5\Å\í\ê\ÙÞ¼_¸‰m™®—ñQÿ\0‚\Øþ\Ð^NúGÂŸƒÖš{J\æ\Ú\ßSÆ·÷±BX˜’{»O\é°O\"¡I#²·GpYbHQô\Çüù˜|8ø ­\ãŸ›nƒ§\í\È\ï·\'™>¦¿>\0xCEøñ\Ã\á/‚<I³ø\Å_</¡\ëVðLöò\Üi—ú¥¼7–\é<dI	žñc+\"+–•Â°þ‡ú4ø%\á6o\à\Êñ¸^—fU\êñ&3S_8ar\ì‹‹\ÃCÁR\Åá°¼ò§©^UjG\ÛU­]Ó•hÒ…8\Ãù3\éôñÃ‡þ8¿øŒñ)“å”¸[—\áò\ê8*_\\\Ì8‹+Ë±õq¹ž2¶‹«\æQ\ÃB”fð\Ô0\ØhT¥‡XŠ˜‰\Öý,ÿ\0‡\×þ\Ò_ôLþ\à¿\Ç\ßü\ÝQÿ\0¯ý¤¿\è™üÿ\0Á¿ùº¯\Ýk\Ø\ÏöN°²µ²‡ötø7,V–ñ[\Ç%\ï\Ã\ßj7’$H^\æúÿ\0M¸½»€Ì—S\Í<®K\É#1&¼\Ë\ã·\ìcû,^üø›ö_€ÿ\04\Û/ø£UÓµŸx;BðÞ·§j:N‰}¨\Ø]Y\êº5\ì&+«hŒ‘	¼›ˆ÷C<rD\ì§ó,¿Å¿¢Ž;1À\àŸ\Ñ\ïBŽ3†\ÂýfX¬<\åJŠô\èª\Ò\Ã\Ç6\\\Î\nJr¥\Zº\Ù\ÅOf~Íšøô\Û\Êò\\\Ç5I\ì¿_/\Ë1xù`£…\ÅÓ…j˜L,ñ\ÃC,‘ò©\Êœk\Ëm§*I{§\åGƒ?\à¶\ß­õ{fø‰ðsÀZ®‚\\-\ì~\n¿ñƒ«$d\í2\ÛM®\ê~%´–H”ùŸg’\Þ%¸+\åý¢\r\Þj@Ÿþ!øo\âÏ€<#ñ+\Â\Íq\áŸ\ZhV\Zþ-\Ì^EÈ´¾„I\ä\ÝC¹\Ä7V²ù–\×Qq\Ä2*»¨ƒ\å\ÎÑžN:ú\ãŒþ5ý‹ÿ\0Á7Ù›ö+ø¹™±\á½AF\âN|C¬Q\èpa\Å}?\ÓÁ?|?\á>\âž\È)ðö7\Äk%\ÇPÁbq“Ác0µò\Ì~6%…\Åb+Ó£ˆ\Ã\ÕÀ%\n˜uG\ÚS­R5\ÕW\Z.Ÿ\Æý~‘+ø™Ç¼WÁ~ qF#Š²\Ú<)[ˆòúùŽv„Í²¬Jt±x\\6µ\\&&†c\'<>\"UcJ­\ns\Ãûz\ê¯\Í?¶¿ü\Ù\Ç\â£ð‡\áÇ€\ì|e\ã]\×M¸ñ¹\â-F{\è÷\ZŒ	zšTZv˜\Ð\ê:­à²š¸ŸûSLŽ\Êwh7EK‚ü»ö’\Ïü“/\àgŒ\éþ>\é\Û?ñ\\œuõ¯Œo†fý±¿hÄœxúùFI8ol\0\ì\0\0€p+\îø$G\ìÿ\0ð‹\ã¥ñ‹\\ø¥\à}\Ço\áeð•ž‡§øš\ÆSJ²:‘\Õ\î/.³\îU\íg¸—\ìpEº\â)UcR¡~v\Ï\é´|%ð\Ã/ò8«\Ã\èñez|1\Âù¾mZ¦#[2\Ìs ŽWIª¯˜aðXJ\Å\æ1\å¥IR¥K\rùjÖ»©ø´¼wúLøÁôŽÍ¼2\à\ß\êpm<ÃŒ8«\"\Èð°¡„\Ã\ä¹FWÃ•3ŒD=·\Õò\ÌN7]\àrÉ©\â*ªØŒN*pŒ\êS£gK3þ_ûI\Ñ3øÿ\0‚ÿ\0óu_\nþ\Õµ?kxsÆž?\Ð|%\áýG\ÃX\Úø>\rblŸSº\ÕL\×+­jú\Å\Ã\\ù÷r(1\Ï^^\ß\ÝoËŸ\ë/þûöSÿ\0£pø#ÿ\0†\ÇÁ¿ü§¯\ç\ßþ\n\íð¿\á\ÇÂ¿?4†¾ðŸ€´½O\á„úž£§xGA\Ó|?e{¨jö‹ysk¥\Û\ÛA-È¶‚(\Íq*gj€<¯£\çˆþq\'‰™nUÀ~\Ö\à\Þ#«–\çp\Ù\ìñtkFŽ†s\Å\Ðp†2´¿\ÚhFT“TÝœµij¾£\éG\á\'\Ò[„¼!Í³¿üv\Ãq\ç	\Ð\Ír:X¾¥ƒ\ÄPž#ˆ\ÇÓ¥‚¯\Ï<\r\Û^QªÓ¨¯Ë¢z\'\Åÿ\0Á$ÿ\0\äô|\'ÿ\0bO¿ôÎ•ý!~\Ö¼Aðözøñw\Â\Úv«kþ	\Ñlµ-7N\×ã¾“Gºš\ç]\Òt·K\äÓ¯4û\æ`¿–D÷¶\í\æ¤{œ¦\åo\æ÷þ	\'ÿ\0\'£\á?û|}ÿ\0¦t¯\Þ\Ïø)ü™\'\íÿ\0b®•ÿ\0©†\ëóÏ¥_‚\Íþ”þ\ZeY–¼»3£\á\Þ_\ÂU\æöX¬7Œs6+S•\Æ\\•¨U©N|²Œ¹d\ì\Ó\Ôý_\ècšf\'Ð¿\Å\ì\ë)\ÅTÀ\æ™F/\Å,\Ó-\Æ\Ñ\åö\Ø<\ÃÀyN/Š¥\Ï\Ã\Úañ©Õ‡<eh.hµtÿ\0_þ_ûIª;Â²øò«7üƒ¼\Øÿ\0C\ÕI~\Ön|G\àÿ\0\nx†ò(!¼×¼5¡k7P\Û	´7:¦—i{<V\âg–Qr\Î\ë’G“\Ë½Ý²\Çø(›ýT¿õ\Íÿ\0ô_\Þ\Â\Ïù&??\ìCð‡þ£úusý3¼.ðÿ\0\ÃÌ·\Ã\ê\Ü\Â\Ùw\Õ\Í1üEK0ž\ëØªx<6Q,4jûzõ•¨Ê½iG•GZ’½ô·O\ìüñ“\Ä\ï3¨xƒ\Æ9§\ÑÉ²\Þ­–S\Ì~­Ëƒ«\ÅgP\ÅN—\Õðô]\ëG\rF2\ærV¦¬–§vz¡¯\ç§\ã¿ü\Ç\ãÿ\0\Âßþ\è>\ßhþñÏˆ|1¦^\ê¶>6“Sº²\Ò/äµ·žý\ìücgj\×RF¦6ö¶ð\ï\'dH¸ý‡\è•ÿ\0¶ü_\íÿ\0ewÆ¿úwž¾C\èm\á÷xÅ¼c\ã>ÀñÃ˜<^†;\Ûòañ2\Í)Q•Z~Æµ\Í*MÁó6¬ö¾§\Ü}?¼Rñ\Â\Þ\à\Ã\Ãþ(\Ìx_šq&gƒ\Ì+\åÿ\0W\ç\Åa¨å­J•O¬P¬¹aVó\\ª.\ïV\Ï\éƒþ	\ãû[xûö»ð\Äü@ð÷„<=\á?\Ûxr\Â\ßÁ\ÐkpZ\\YÍ¡X\ê5\Ú\ëzÎ³3\\‰\îž50\Í^R¨1\Ï\Ê\ßð[_ù#ÿ\0ÿ\0\ì£j_úŽ\ÉNÿ\0‚#\Éø\Ñÿ\0eR\Ãÿ\0P\í›ÿ\0µÿ\0’?ð{þ\Ê6¥ÿ\0¨\ì•\éð÷\ä\Ü-ô\ÝË²\Ë\èeY6WÅ“£€\Ëð\Þ\Ó\ØaiOƒjÖœ)ûIÔ¥V­I¾i\ËÞ›µ•‘óük\Äùÿ\0þ\ÎlwñFgˆ\Îsüß…òŒFe™â½Ÿ\Ö1u¡\â^]‡…J¾\Ê\éóF\ZT\×,\"¹`ºÝ¿\ç‹Àþ-\Ô<\ã?\nx\ãI‚\Ò\çTð‡ˆti\Ö÷\ë3YO{£_Cm\Ú\Û\Ë\ínòÀ«0†xe(N\É°\Ãú4ýƒ?\à£?j—üq\àß†ºo\à½kÄ‰}\á+_Aª\Í6óK·†}c\ÄÚµ§Ùo¤i@µ–T\Ù*Á¿Ÿ\ï€\ZN™¯|sø=¡\ëVš¦‘«üKðV›ªi·ðGuea{\â{»;»i•¢ž\Ú\â)¡‘Y$™XH¯\ì÷À\ß\0>|4\Õ\Û\Ä?>ü7ð>½%œ\Ús\ë>ðg‡ôQ¬\'xž{6¿\Ótûk¦¶™\à…\å„\Êc‘£B\êJ‚?xúiq?‡\ÙV‘ñO=\â\Ü\ï†s˜p§F´)Ç†\ê,NœªJ­	\Ô\æ¯(U´i\Ôø~Gó7\ìú\àÿ\03\Üó6Ï¸?\ép\Ïp\çp¥~9\á‰Ð©R|[ƒq\ÇÖŽ\ZH\á\êÂ›ŽŽ+\Ü\ê\ÑO\ë	\ßF×¯“šü>ýª?\à¯_~$øŸ\áÁ¿‡z‰®<¬\Ü\èzß‹üa¨_I£\ßj–$Ã¨Z\èú>‡s§Ü›k;\ÅhF¥>²\Âð#ùv0\r®ß·\ï÷O\áü\Å	\äø§ñ)Ý™\Ýü{\â\ÖwbY™Ž»|K1<’O$šþsúøSÁ~\'q/\Õ\ã\\¯ûk\ÃYVSW–\Õ\Äb°øJ˜¼\×Œ¦ñ•„¯‡©_\êô°…:&\èI\â%:”\å*tù­>Ÿž7x…\áð\Ã\Ü\ê|;‹\âüËˆ^g›\á°øJÙ„0™šT°xY\ã0ø˜a£Š­œ*µñ#Ol%:0«\Z5«Â§\êYÿ\0‚\×~\Ò}þ|÷ñðÿ\0\Ý\ê“þ_ûI\Ñ3øÿ\0‚ÿ\0óu^\Ûÿ\0ý›>üPøY\ã\ïüIøm\áxŠ\Û\ÇSxf\ÊO\é–\Þ Ó¬4›}I¿X\í4J;2;‡¹¼\ä¼6­vT¬k2Æ»kõ\ÓþûöSÿ\0£pø#ÿ\0†\ÇÁ¿ü§¯\Ñ<D\ã?¢ß‡¼iŸpf#ÀIæ˜®\ÅC‹\Æ\áñ°øjØ‡‡¡ˆŸ\Õ\áW4•WJ\n¬ §QS”¤¦ýœc\Ê\ß\åžp\'\Ó3ÅŸxw\Ä<\ÒNŽM€\âZœV/\Å\á«b±tpø|v\'\0ž*t2xQ…Z•0µg\ì\éJ´cM\Ã÷®M\Æ?„1ÿ\0Ákÿ\0hýÀ\Éð\Ç\à“GŸœGa\ã\År=›\Çª\Þ\åX{\Zý!ý‡ÿ\0\à¥:W\íQ\âÉ¾ø»Á	\àoˆq\è·ZÞ›q¥jO¨øoÄi¬­ªCi\ÜI¤^\ÚA,W\ÚOu©­\Ü	s\"\Ü\Â\ÐyR~Zÿ\0Á[¾	|.ø;ñw\áÌŸü¢ø\Z\Ó\Å\Þ½¿Ö´ZG¦h’\ß\éÚ¼–0^Z\é6\Â;\r>Gµ	\éc¼3²	¤§i$!ÿ\0‚]3/\í«ð³k2\î²ñ’¶\ÒF\å>\Ôò§T\àd~‡\Ä^øÇŸG\ì\Û\Ä\Þ\à8ðž)ð~w\Äy=Z8œ]v’SÆ¹\áñT\é\ãñe\n˜Œ¾­	ª°©\á\ê*\Ô\Õ\nüŽ—\ä|3\ã\ß\ÒC\ÃO¤\æI\áO\Zø—W0”8÷ \à\ìÿ\0W„¯•fXû—Rú\Æuò\Ì6;Š§†\Ìh\â!V‹¥R–\"œ¨JxŒ;¨ªÿ\0UŸ~\'øs\à¿\Ã_|Rñi¹ðV‰q­j)g›w:\Ä\ÑÁmgl„…7×“\ÛYÀ\\¬i$\ë$¬±£‘üÿ\0ø¯þmñ‚\ãV¹“À\ß~\é:‘…¥¯‹o<O¯\ê\ÂŠnot]_\ÃVFVûÌ±\é\áS;U\Ûn\ãû\'ûs|7ñÅ¿\Ù[\â÷€¼¥¶µ\â\ÍoC°mHŽx-\å\Ôf\Óu\í\'Tš\Òne†q%¥•Ç’H¢iU!Rd‘þ;|Wð\ß\â\ïdÒ¼e\à_xORV’1i\â\r\êúEÁt˜£¾´„Ê `ñ\îFR¬¬Tƒ_˜}|*ðx‰3.6\Ëò¼ÿ\0‰p¹óÀ\àòŒ\Ç3«M\á2xe¸M<m<«‹\ÃÊ²\Åb\ë\ã)<ejU£©û*¥(W\çý§\é\ï\ã\Þq	\å\\œ\ç)\ÂŽ†g‹\Îrì®ƒ£\Ïjæ™–®¾u‰Áb!©\à\è\àf²\ÚU\éJø¸\âq\êª\ØW\Õø}\í\'ÿ\0D\Ë\à‡þ¼~—Žhÿ\0‡\×þ\ÒôL¾\à·\âÿ\075\í\ß\nÿ\0n\ï\Ø\Âÿ\0<\á\ß~\Ëþ%°×´i¶\Z\Ô\Zg\ÂxŠÅµKkhá½ºƒ[\Õ<A§\ê:˜½ž6»{«\Û8.]\æe”1]\í\ß7ü7þ	Ø ³~Íž3UPY™¾|:@$“\â\Ì\0$ž\0¯´\Æpÿ\0\áq¸¼5¡6Š¥‡\ÅW¡KÖ‡&&\Z¾Îx{,Ez|µ£Ô³­Z’\ä«R.2™e\Üm\Ç\ØÜ¿Œ­ûBx#[ƒ\Â\âj\à\ê\á1j®¦\"*³\ÃUl·YT¡*Ž”\ãWB¢œ\Z*r¼\Ì:_ü—ö¾\Ôô\Û)>üX\ïu+I4\ïT¹¹Šd-\ãvPÁd%K+( ¬8?Ò¶Ÿp÷V6w2Y.-`\Õ3±ZX–F¸“´!rI\Æ2I¯ÅÁC\àšº–¥gÿ\0¯|,¿h…—WÖ¾ø8ZÙ²È¬—Nt_Z¿T…€5½œÒ‚„¬d…õ\ï\á\ß\ÄoüVð–•ã‡$\ÒüW\á-f&}7X\Òdv·“\Êm“[\Ë\ÑÁucwlÿ\0»¹°¾·¶½µ“÷s\Û\Ä\Øü\Ëô‚Ê°˜hp\Þ\'*ð=ðo	BY~/0XŒF;\Äb£‚–„qž\Ë\ê´ñ8a1²m\íªB¼\çrÓ“_\ÙE<ÿ\04\Çcx¿\ÄInñ\×[•\Ö\Ë2Ì¦¥,>?!\Ã\àç‹Žex:ªŽ.¾<v]Fxšt\'‡£R*s«\n•¡	vôQE4Ÿ\ÙÁ_–¿ðXù3»ÿ\0û)ÿ\0\ÐõjýJ¯\Ë_ø,ü™\Ýÿ\0ý”ÿ\0\èzµ~·\à\'üžŸ¿\ìµÈ¿õ2\à¿J?ùG¿\ìƒ\ÏõŸË¯ƒ?\äqð‡ý^ÿ\0\ÓÍ•y6ñ\åmÿ\0^\Ñ\è±_Á·ƒ?\äqð‡ý^ÿ\0\ÓÍ•y6ñ\ãmÿ\0^\Ñ\è±_\×´ý\ï\Â\ßû\ãý9\Ãgð\ìºþŒ\ßõóÿ\0ôž)?ÿ\0iø*÷Ç‚ÿ\0>\'ü+ðß€>jz‚<Ms¢i·úå—Œ\äÕ®­ Ž\'Yož\Ã\Åö6m;;½¤ð0\Ï\á¿ø-G\ÄEðW\ï|_ð\ç\á\ä¾9I4[_‡šW‡\àñU–+\Ï%\Ëkº—Šf\Ô<E©\ÜKgcn¶«ce¦\Íaqwq<›\î¢HF\ï\Î\ß\Û\ßþOö‚ÿ\0±þÿ\0ÿ\0D[W\Ú_ðHo?	~/ø·\âö¯ñCÀú\ÂZO…\à\Ðt\ßiöúÆ‹h\Ú\ìú\Ê\êRh÷\ÑÍ§\ÝÝ²X[¥¼\×vó5¨\ÖþTŽ^¿H\Î<)ð„|\nÉ¼D\â?\rðùƒÁp¯g›\Êj\â(f™ž7ý…Suª\ã©Q§KŽ\ÅFŒ“¦þ§[©Znüg ñ¿\é7ÇŸHl\ÇÂ¾ñs•K5\ãN9\È2§œQ\Â\×\Êr\Ìq¹\Ý*9mzó«—\å\Ø:•2\ÏvMf0r©8\ÅN¤Yÿ\0®ý¤³\Ç\Ã?þ\ßñ/ñöõ:¯LøQÿ\0«ñ\ÍÇŒt{Œ¿<\ro\à\Ëû\ë[-OYð4¾%°\Ôô{›˜\â›Y’\×X\Õ<Fš­¶Ÿ½\Ìú}¼v—W\Æ\Éop%Øö\×\í\Éûþ\Ìúo\ì\Ëñk\Å\Þø1\à?xŸ\Â»\×4oÁ\Þ°ðµ\å­õ”ð2¿°á±†ú\äŠX/¢¸‰‘ò:F\Éü§d\í\Ï|gô§\á\'ý¼{\áLó2É¼\'\\7õ,Â®GŠUq5\è\ã\èb\'‚\Ãb\ébòün2­vž&œ¡*‡-jrJ5)5\Ï\Ñã‰ŸK_£gd9x\Ù>(­Œ\Êð|O‚–\rB¾[‰Á¼\Ç–4À\æM\ï\â2\ìD*Ò§:°ž\Zt\ç\Zô\ê\ÉÆ—\î\Å?ø-o\áñž³iðwá—%ð=\äöšF¥\ã\ßøI/5\Íj\Ú	8õi-ôMwB¶\Ò\ã¿UY\áÓž;¹\ícq\×rÉ¸×ž/ü»ö‘\È\'\á—Á¹‚\éþ=\ÉÀ\'\Ç$\ÇBA\0\à\â¿Qÿ\0c¿\Øûöe¸ýš¾k:\çÁ?‡+×¼M\àm\Ä\Ú\î½\â\ß	\èþ&Õ¯õmkO†òòF½\Ö\ío® ·9X,­\äŠ\Î\Ý!71o\Ìø+\×À?„ŸüEð‡^ø_\àÀ’xº\ËÄ–:\î—\á}>\×F\Ðî¿±?³d±¼H±Š+k\Ü_Kó[\Å\Úc2«HŸð÷ô]\â¯høI‚ðg±´1Y\ÖO†\â\ßñ_^\Äp\í]LF#Éš\Ëc!—b*F¢Œ¿y*qt©BO\Ù~•\ât>™\á<v\Ì<}\Â\Õ\ÊóL\'gØŽ\É0¿Tž]„\âú˜9`ðø/k“\Ã\nãžg…¥<:•5\nQª\éÕª\éG\Û}\ïûÿ\0ÁO\ìÿ\0iOZ|$ø‡\à‹x\ëT±¾¼ðö­¡\ês\\øk\Ä\éñ5\ÕÖ”,u-ú†“~¶I%Í±mGTŽ÷Éž<Z2G\çý\×ûTüZ\×þ~\Ï>-ø_O\Ò5]Àú:®™§\ë\É{&u<š¶`Rù4\ë\ËÖˆEw#oynþb¦\\®\å?\Êÿ\0ü¥™mO€»I¼K«)\Çu>×²±À¯\é7þ\n)ÿ\0&OûAÿ\0Ø™kÿ\0©‡_—ø\é\á7ð?\Ò\Ãn\á\ì¡axkŠñ<‹\Ìò:˜œV\'¿´8º¾Q˜a¨OZ®*ž…\ÃGž‡·q¥*•UN›…:µý¼pñ#\ÄO¢\çŒU\ÅYôñüUÀøN7Ád¼E6\r˜ò\å\Ü\r†\Îò\ÜF)a\èR\ÃW\Æ`q¸©8b¥C\ÚV…:O\íª\Æu*~3\Ã\ëi?ú&_ÿ\0ð_\ãÿ\0þn©?\áõÿ\0´—ý?\ßø/ñ÷ÿ\07Uø\ç!!ŽF Ž\Ü\ZþÊ¾þ\É²þ¥ð¯á®¥¨þ\Ï¯õ\rGÀ^¿¿½½øq\á;«»»\Û\ÍO¸º¹¹¸¸\Ò\åši§žG’Y$‘Ý‹“_\Ñ>7ð\ï\Ñ\ÇÀücso°9\äx‡˜ahS\ËkÔ¡,<²\ê8J\Õ\'Y\â±ñREˆ‚‚…\Úq•ú\ËG^+úXý\"ó\'Ë²/±\Ü;>Áe\Ø\ÜM\\\ßKL3\ZøŠ\áE`²\é\Ê2¦ðÓ”\Ü\ìšiF\î\ç\ãü>¿ö’ÿ\0¢gð;ÿ\0þ>ÿ\0\æ\êº\rÿ\0Ám>5Áª\Ú\É\âÿ\0„?õMfS{iá«hZ¤°\Z\Ú\ê\Z®¹\â;H&?\Âò\éw;¡\Í~\Êx\ïö\'ý”5\Ïx—Ko€?\nôƒu£j+§\á\ßø{@Ö¬&’˜nô\íWJ\Ó\ío-nm\ä,L’\ì. J’FYñ™Z\ß\ß\Ú\ÆX\Çk}yks—1\Û\Ü\Ë\n \0Xª\Ç\'\'¥rø+}\Z|v\Âñ,2Ÿ©d5r—\Ò\Å\Ã‰\Ä)Õ¥š\Ã°õp˜¼»4UiÔ„°\ãQ~\êtß³9Ë™û=¾\ÜQôºú7f<\'O=ñ\ë\ÄTø––?€¯•\á\è(Q­“VÁ,Mv2\Ê:”ä±¸iA^½*ñu©Ö§\Å{O\î;\à7ÆŸ\n~\Ð\n¼\'ñcÁŸi‹FñM“\Ìl/•ÿ\0I\Ôm&’\ÏU\Ò/|¦hš\ãN¿†{v–1Nˆ“ U*ü‘ût~\ßú7\ì€\Þð¶™\àöñ¿\ÄO\é7zÎcu¨fhZ.•Ì–jz¼\Ð\Ãqyxn/¡št\Ë_±\É\"C$\Í’cÁ$I?±gƒ³“|E<\à\ÂSyÀöö¯ÉŸø,ƒ»~\ÕzB³³,<<±«1+mGVv\n\Éf\0±$òM4ø[\àÿ\0gŸI\Î&ð\ß7\Ãbs\áŒ×Œý†®/J®3‘ce…Ë°Ø¼^\Ztq2„=­\Z•\åN­9\â=‡$\å\ÉV¢\×~6øû\â}x\Å,“†\Ëx\ãò\Î¡‹\Íð¸,4©\à1<A”T\Ìó\\fŒ¥Š\ÂÓ©Y`\ëP¢¥Nk	õ§[\ãR)G«“þ]ûG\ïc\Ã‚K~A-@½ƒºx\Þ4fõeD²Ž•ü>¿ö’ÿ\0¢gð;ÿ\0þ>ÿ\0\æ\ê¼þ	ðw\á\çÆ¯\Úf/üMðí§Šü9£x#\Ä%‹B\ÔL­¦]\ê–7zM­›\ê6ñ¼k{m\n^\Î\æ\Î}ö\Ó9O>9\×ô¸?c\ß\ÙHqÿ\0\ãðG_†>?©\Ñò\Zý¿\Æ\Ç\è\Ã\à\ïS\àü\ÃÀ\Ø\çxõ•\àóJØŒ\ruCN–6u£B”eŠ\Í=µZ¼¸iN«t\áó\Å)NN\\¿\ÏeLOø+\ÆùG\Ò)ðþYG;\Å\äT°Ù\â±\Õq>ˆ­8\árcJ“X\ê1¥jõgQÆ£œi\Ú*ƒ\ßðú\ï\ÚHôøgð;ÿ\0þ>ÿ\0\æ\ê½\ï\à_üR×¼a¡øk\ão\ÂýI\ÑõýV\ÃJ>+ð.¡©A‚÷\Ó-¬wš†‰¯\Ýjb—\Ân^\rb\Æ[Ko6\ác»x\ÄzOüöaø\àÙŽ÷\Ç^øM\àø«\Ãþ,ð\Üz¯ƒ<=¦xbI­u{¶³¾´\Ôc\Ñ\í­!\Ô`xÂ¼Ky\Ím*·h‹Ë¿ù··$\\[‘Á\ÂA¿z•÷¾\Zxcôtñß€q\ÙþK\ár\áh¼~a‘¹,f*†g\ÇapøZ\Ð\Æaq8,Ê¥\Z°<f\Z¬#^”\êF¥F\Z­û\Ï\Êü`ñ“\é[ôoñ?\Â\Ù÷Œ•8·ƒË²¾ ŠŽ	_&\ÌpùW§,;Ê©Ô„¥<&*…GJN¥:nž\'\r‰¥]\Ç\Øÿ\0y¾,\Ö\æ\Ðü#\â?i\â\Þ\æ}#\Ã\ÚÆ³f³{K‰tý2\æú\Ýe0º;\Û\Ìð *Dv‰Ž\ÇRC\æ\åÿ\0àµŸ´’»¨øeð@…wPN\ãì¬Tc8û\×ô­1oz³1%Â«òI\ä’|)$ž\äžI5ü3\Éþ¶_ú\ë/þ†\Õøo\Ð\Û\Â\Þ\ã\ì?ˆ\ß\ë¯\å\ÜIS&\Çðõº¦=b\ÃCO9x•IP¯I%^Xj2š—7À­n¿\Ñ\ßOo|Pð\ß1ðø\Åù§	\Ð\â.Ï±ù¦-xgMz5òO«J£\Äa«Iº\ÅV„\\SS“j\çî‡‰?à´Ÿlü\à6ð\ï\Ã\ï‡Wÿ\0uu{\Ï\È|VžÑ£]FXt-7F²\Ä1j“\ßO§$wÚ\åÆµ<\É/\Ùc´R¥\ë\Í\áõÿ\0´—ý?\ßø/ñ÷ÿ\07Uö\ßü3öVýžü]û-x[Çž7øK\à_x¯Åš·‰f\Õ5xwMñ4\É—¯_\év6¶\ëP^Á§[\Åkn›\Ò\Â;qq!2\Üy²a‡\è7ü1÷\ì§ÿ\0F\áðGÿ\0\rƒùOXq/ýx‰¸—„jø\Î\ë\äCeØœÊ¶>Œc[‡Ì±\ÄS\ÂÓže\ÍK/\ÃVŒ°¹}9F3X*4]XûiTo¯<9úhx™ÁÇ´>’YvG…\âžÈ³l[º¼ªQÁbr\Ü3\ÂU\ÆN–R©\Ï2\Å\á\Õ<fg(sA\ã\ë\â}œ\çO‘¼O\Ø\Çã§‰ÿ\0hÿ\0\ÙûÁ\ßüa¥\è:6½\â+Aw§xj=F-\Z\Ò5\Ûý.¶T¿\Ô\ïCI\rª<\Þm\ä \Ê[`D\Â\æGþ\nAÿ\0\'£ñ·þ\ÂúGþ˜4\Úþ¼<!\à¿ü?Ð­</\ào\è^ðÝœ\Ø\èÒ¬t]Ñ®§’\ê\å\í´\í:{XZ\â\âY&™£‰L’»;å˜“ü‡ÿ\0ÁH?\äô~6ÿ\0\Ø_Hÿ\0\Ó›]ŸC<nS™x\í\âa\å%\Èñ\Ü5Ÿ\âò|¢RUW–b8§%«À9\ÆSRxL4©\ÐrS’|—R{žO\Óÿ\0,\â—\è\ç\à\ÞQÅ™\Ìx‹‰²\Î\'\Ê09þ}JœsŒ\ß\r\Â\Å,~eJ\å\ã11©]EÓƒJvq‹\Ñr¿²—\í“ñöA\Ô|c©|?ð\ç‚üC/¬ô›-N/[\ë“\Ãm5\Üö\ÒXZÑdv½•e3¼\ë´.\ÅC’¨¿Ø“\ã÷Š¿i\Ùÿ\0ÃŸ¼g¤øD×µ_\Ä\ÚuÆŸ\áˆõ(´ˆ¢\Ñ5«6\Ù\áV\ÔuKÁ,‘B¯9{\ÇS!;?\à\ß	>|Uñ\'\Æ\è~&|<ðg\áÑ´É¤\Ã\ãi>\"‹M–ö÷[K©,¢\Õmn£¶’\á ‰ex•Y\Ö4HQ_Ñ·ƒ|\r\àß‡z¿†<\áoø7\Ãv’\\Mk øcH°\Ðô{y¯\'{›¹¡Ó´\Ø-­c–\æwyg‘\"\r,Œ]\ÉbMy¿Lþ&\àG\ç/\à¹\á|CÀ\æ|9Œ\Íø\ÝÕ¦\á˜\åR\á¨NžZ¨ªÎ¤\\)bò\Ú|Î„Sú‹÷½\å\Íô?³ÛƒüP\Ãð^G\Æx\Þ>¥Šð¯€\âÜ¿(ðõQ©\ír\Ü\îP\áW6•w‡T\ÜjVÁ\æ•#ˆ“__W†—™ø\Ù\ã}O\á¯\Â/‰4k[\Ý[Ážñ‰4\ë=MnNº¼\Ò4Ë›\Ûx/V\Ò{k¦¶’H•f÷\ÊP’#a‡ó¾¿ð[\ÚM•Oü+‚€\äñ¸\Ïý5ý|gø«ðû\à·\ÃüCøŸ‡ƒ´K<jJö\ÂúmE¯Z[\é:qÿ\0\î¥4\Ëm\rŸ\á\ÞI\Þ+h¦–?\É;\ïø*ÿ\0\ìY\Ë\Çað#\Å÷–¨%\Äþð\rœŽqó\æ\ÜkwaHùžK/\ÌUOð?Gì––?%Ï«â¾Ž¸ÿ\0!,ÖŒ0ù\Ý,\Í\åXl©\Ñ\ÂQuò\ÈÕ«BT+Ö“«GR0«\í)Â­7(%8·úgÒ›‰1yWðýÒ§,ð&Q\Èù±\\5[&©\ã3W[ŠöÌ©aj<FŒ£N¦­Òœ°²\ä¨\ä\Ú_\'\Ã\ëÿ\0i?ú&_?ð[ñÿ\0›š?\áõÿ\0´Ÿý/‚ø.ñøþ~9¯³aÿ\0‚—~Í—\Åqoû(üPž	\Ñe†x~øZXf\ÆRH¤I\Ù$F«£a\È&¼—\ã\Ç\íÁû0üXøM\ã\ß~\Éÿ\0\íg\Õ|=ª¦«\\ü;\Ðt¥\Ðu\Ñe1\Òuµ\Ô\ì\ævO½\Ï<ð2±µY¡}\ÑH\è\ß\Ðyoð¦+2À\á1ÿ\0B\ê¹~Œ\Ã\áñx\Øñ†]Šž\n…J´©\Õ\ÄýU\Õ\Ã{w‡‹uoEÏ’PS‹iŸ\Éù·qž)\Ìq\Ù_\Óÿ\0š\ãð\ØN+—O‚3¼\r<\ÃF„ª\Ñ\Â}u`±k±3Š¥\Z\ï\rZ0rŒ¥Û€ðGü\Û\â„\ZÕ©ø‘ð{ÀzŸ‡šEK\åðE\ïˆtMbY‚¼ö¯¯jž#´¸’&AjðÛ‹‚¢/µA¿\Í_\è+\á\ïŽü;ñ?Áø…\á+©/|5\ãOñ‹s4/o4–\Zº\\D³Àü\Ãq\ã\r\ÄYp“F\ê®\ê\Ûø6\\\í\\NÑ’:ŽHö\'šþ\Îÿ\0`?ù3?\Ù\Ûþ\ÉÆ—ÿ\0£\î\ë\å>˜\Þxu\á\ï\rð·ðVCO‡±˜\î ©“cðø,N.x^¦[‹\ÆÓ«,6*½x\Ñ\ÄP©ƒ\å„ð\Þ\ÅT§^¢¯\Z®4?\Ò~€ŸH¼P\ã5\á/8¢¿e\Ø‡\åøŒ\Ç\r„Ža‚\ÆSÍ°uJ4qxZi\ÔÁ\â(\ã\\\êPÄª\êZ¥†t±¯ò\Ï\í¿ÿ\07¶ý˜üs7\ÂOø\Û\Æ^=²\Ót\ÝO\\\Ôõûù\í<5¡&«\ÞXØ‹=?f¡«_Obñ\ÜJRÿ\0M†\ËÌŽ6ûK³ˆ¿=ü»ö’\É\Ç\Ã/\àd\ã:³Ž\Ùÿ\0Š\ä\ã©\îy¯–?\à¤L\Íûhük,\Ì\Äjº2Äœ*øM\n£=G\n\0tô\çü3\àO\ÂoŒ¾5ø¹{ñOÁ\ZŽ“\ÂZ…[AÓ¼GjºŽ“i>­ª­\íÌšdå¬®\çt±·Ž6»†e…A\Z6Lþ•xK\àG‡~\0d\Þ%qg‡ñ\â\ÌD8O†s\ì\æµLF*¶c\Çñ\Ë)òa¡[0\Ã`°˜zx¼Êœ#J’¥\nXjr›U«ó:¿ˆf~<}%<WúK\ç^ðW‰\Õx2†7øŸ†r*£„¡“\åyo\r\Ö\Í\ê)be†Ê±X\Ü^&X,®´\ç^¬j\Ö\Ä\â§\nr©C\É\ì-\Ã\ëÿ\0i/ú&¿ð_\ã\ïþn«\á\ÏÚ«ö·ñ÷\íw\âø«\Çú„<=}\á=\n\ã@°¶ðt\Z\Ôs\Ú\Ý_Ë¨\É5\Ú\ëZÆ³;\\ùÒ²)†h£òÂƒl±þ±?á¿e?ú7‚?øl|ÿ\0\Êzüÿ\0‚½|+økð«\â§\Â];á§€¼#\à?Vð«}©\ØøC\Ãú_‡¬\ï\ï!ñÍ¼WWV\ÚUµ¬3\Ü$\0D²ÈŒ\â0 \nòü\0ñ\'Àn#ñ;\'\ÊxÁ\Ê\ÜÄ•ðY\Äð™\ìñtkG\rF†[^®.“„1µ¤þ³†„\è/Ý»9\ßM\×\Ò}(|$úKð—ƒù\Îw\â_Žøn;\á:žEKÃ”°XŠ3\Ä\âq\nX\Z\ê¥L\r¯ªbe\n\í{E~F’z_\É\à•òzÿ\0\ì]ñ\Ïþ£\×ýU|Høá¿…^ñ_\Ä_]½—†¼¢\Þëš¼ð\Å\ç\\}–\Î\"\âX šò\îS¥œM$I%\Ôð£\Ë\Z1uþU\à•òzÿ\0\ì]ñ\Ïþ£\×ýÁE\ä\Ê?hOûm¿õ#\Ð\ëó¥¾O‡\â/¤‡\Ü?ŒZXL÷*\àœ›RƒQ¯6gÅ¹®:2’”cV4«\ÍÓ”£%¨·%gú¿\Ð[=\Æð¿\Ñ;\Å\Î&Ë£By‡\ç|{ž\à!Š„ªa¥\Ê8%\Ì0±\ÄS…JS©BUððUa\n´\å*nQH6¤¿%<gÿ\0¶ø©q¬\Ü?Ã¯ƒ¾\0\Òü<­œ^5½ñ»¬I$	®gÐµo\r\Ù\Ã$«‡6ñ\ÛJ $\Çö‰ö‰ÿ\0®ý¤¿\è™üÿ\0Á¿ùº¯\ÇG$#\Ô+õ\0šþÁ¿g¿Ø›öX\Ò>|6û_Á‡~)\ÔuOxk[\Õu\ßøSEñF·¨jZ¶e}{<ú†³gy:#\\N\æ+h\Z+hSK\É?²ø\ÉÂŸFŸ²^\Äf\Þ\Ó\Ï\çb±8\r,.\'Wl¾\nØœF7˜\æ¼ò•«QQþ5J³œ\ÛpŒn~\à\Zý.þ’|C\Äø,‡\ÇJ\Ü;‹	C5Ì±9†O¥™bjQ\Â\árü¿+\É\Ü!*U\ä\ãaCNšŒTœ¡òþ_ûI\Ñ3øÿ\0‚ÿ\0óuZZ_ü\Ë\ã\ìW>·ðŸ\áîž²\Æn-ô•ñž›{$ þõ!¼½ñ>­22\ãË‘\ì§Da–Á\Å~\åOûþ\Ê3C4/û8ü	,RD\Æ/†\Þ‚P²!V1O•ð\È%%†Hå°ñº¸?\ß\ÚoÁ\Z\Ã_\Ú\ãO€<)o-§†¼ñÄº‡k4\Ïq-¶›ez\ÉmNÿ\0<¾RŠ\ÍóU¥xž\ná¾Œ¾8\æY\îG–x)O!\ÅeeÆ¤ñØš“…|-lL0sö5ð9§¶£^•Y\Ñk\ÝWŒ\å(ÔŒ¡gôH|G\Ó\è\ë“ð\îý «q>\Íket\ÖUF+\áq˜|7×©ª\Ô1\ÙJ§[Z•:É¸\Ôv•?gR”¡U3ú\àý’?jŸ~\Ö\ß›\Çþ\Ò\ï¼;¨\éz¬\ÚŠü/¨N·³\è:\ÌPCvÃ©Com§cweqÕ\ê\Û\Ú\È\ê\ïÖIˆý¶m/þ\Ç^ð\æ©uá›\Zx¯Æ—\×ö\Zð\ì\Z”:U²¦™m\×ú®«|\Ö÷³Cej\×V‰Ù´—ò<¥Í¯”Ò‡¿\àˆ_òJ¾9ÿ\0\ÙG\Ðõ†«ÿ\0Áa?gß‹¿\ág\Ä/‡žÖ¼o¢øKO×´_i\Þ\Z³¸\Õõ½.]B\ê\Öö\ÏRþÅ³Io\î\ì&Hå·–\æ\Æ\Þ\ã\ìm\ë\ß\"!wþt¡\áo‡Ò³\á®yY`¼?\Â\çxˆÂ†c›U\Â)Â§,\ã/\É\êfÓ¯GT\ÌkQÁR©,R\Æb)F\"xš\Þ\Ò_\Õy‡>.fB\\·Å¾¥<\Ç\Ä\ì~Iƒú\Æ?)É¨b\ç‡T¸¦y&gŸ\Ó\Éc†\Åa%VžY†«Œ\Ä\Â?©aªÔ­‹††‚¥O\åËø-\íeskð¿\à´Vû‰.m<u<\ê¤ð$š/\ÛF\ä\r\Ë`õ\Ú3Šƒþ_ûIÿ\0\Ñ2ø!ÿ\0‚ßˆü\Ü\×\çgÀ\Ý[CøSñ³Àž)ø·ð\ÛTñg„|1¯%ßŠ|¨h…ç¾´6\×®ý/V†;[©l®%†þ++\ß.™mR)$Œ7˜¿¸ðð\Ïø\'wý_?ð\Æü:ÿ\0æ®¿­¼Cð\Û\Ã\r\Ì2\ì\r}\êø‰ƒ\Æ`.¦m\æ>\Ï…­\í\åE`ªª\Ø\Êõ\ç_\ÙS§‰u%R:ðT\çVjª§ü%\áo.ñ\æYšbøŸé–øaŽ\Ës§“ñ^\ÏŽ ðôªý~Œðù|h{Vup²§\í%ˆ…juiÓ…J«ò—ü>¿ö“ÿ\0¢eðCÿ\0¿?ù¹¯°¿aø)O\Æ_Úƒ\ã\í‡ÂŸx+áž…¡]øS\Ä\Úó\ßøZ\ÏÅj\Ëu¢\Åi%´HúÇ‰õ[?\"Sp\âp\ÖfBùrFAÝ‹/üOþ	\Ï‡Ÿöqñ|(HP\Ó|øq\Z–=\çñjŒŸL×´|ý¿?\àžz¿‹m\Ã:FŸðwÄ—at½;Xñ7Ã­#Â‹9\Ôe†±mÃ’k6š|36Ï´Kª^\Øi\ê±nž\áB©?Šñ¶A’\Ö\á!¥”ý\r¸§‡³*ùN2†_\Ä+V\Ì^M‹©C–Žcõ\\$+Uª°s\å­%5\Ë)5Wô/‡<eÄ¸~;\á,N{ôó\à>(\É(g¸\nù§Tq\Ë\égx\Z5\á<VVñ\Ø\Ê8|.\ZXºJTc:\Õ\é§)F1—4¢\Õú)‘K\Ñ\Ç42$±J‰$R\Æ\ë$rG\"‡I#t%Heu%YHe$iõüªÑ¦š\èÕšõ]þ©¦¤”¢\ÓM&šwM=SMh\ÓZ¦·\n(¢…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@œŸðUù2\ïˆ_öðþŸ\í+ù\"\î?\Þ_ýW÷eñW\á?€þ6x+Rø{ñ+COxGW’\Ò[ý)¯5\r?Î–\Æ\æ+»G[½2\ê\ÊöŠx‘ó\ÂnVÊ’ÈŸð\ë\ÏØþˆ\èÿ\0\Â\×\Ç\ßü\Ó\×÷Ñ·\é3À\Þð.a\ÂüK”q^;Š\âlvsN¾Iƒ\Ê1E…\ÅeùV”ñ\Ù\Ö]YWLiN*ƒ‚ƒƒI6\ãóC\éqô;ñK\Ço°¼kÁ™·`²š<\'”\äu(ñmž`1ÿ\0\\À\ã³\\EYÂŽ]\ÃY½	a\åKG\Ù\Ôx¨\ÔsHÊŒRŒ§ö§?\á	ð€Ú¸ðø(\à\r&\Ïº½‹ý\Õÿ\0¾GøUkm2\Æ\ÓN³ŒCicm¬!™„V\Ö\Ñ$DÙ„qFˆÙ±–bI5n¿ˆ+\Ê«Ö¬¡eVµJ©IG™)\Í\Í)Z\ë™]^Í«­\Üÿ\0Hðg…À\à°\ÕL>\rBn\nñs£F\ä\â\Üb\Ü\\¡x·Úµ\Òz\rÚ£¢¨ü:Š+$’\Ù%\è­ù›h•‘ü—ÿ\0ÁZ\äõümÿ\0boÃ¿ýG\"¯oÿ\0‚)\É{ø¥ÿ\0dºýIô\êý«ø·û\r~\Ìüm}ñ\âwÃ‘\â?\ê6zvŸyªÿ\0\ÂK\â\Í3Í´\Òm…¥„_d\Òu\Ë+$ò-\ÕcÞ–\êòct…˜“[¿¿cÿ\0\Ùóöv\×uoü\"ð\ZøWZ\Öô´Ñµ+\ß\í\ïj\í>š—QÞ‹u‹[\Õõ!ÿ\0HŠ72C\ZJv\í.S*º3¤\ï\ãþŽ”¼\"£“ñdxŽ‘ð\Ó\Æ\ÔÁ\å&úöZ²\å^ª\ÄG;ž7\ê²ú¥Oe?¨{Y^\Ôawoó;\'úx§úW\ÖñÂ¾mÀ¯ƒ\êx“žq|pt³|ò|Cý™˜b1Õ°\Ô^\\3O/X\ä±4\ãZ—ö³¡§É‰¨”yþ™¢Š+ø`ÿ\0LO\Åoø-‡†5K\à\ÇÂŸZZ¼\ÚG…þ _\Û\ë	‚,\Û\Ä\Z2Á§<«\Â)fÓ§ˆ\È\Ôs\Z±E\Ïó¿ðûÆº¯ÃøC\â‡¬ú¿ƒ<E¤ø“M†õ\ZK9\îô›È®\â†\å#x\äh%1ùrùrG V%$G‡÷a\â\è>,\Ñ\ïü=\â}KñƒªÀÖº–­X[jzeý³\ãt–7‘Mmq ’\Æ\ë2¯Šuoø&‡\ìU¬\ê\Z\ÇÁM6\Ö[—.ði>!ñva\';mô\í/^´±¶A’Aj\0\0?¹üúSð‡>/ø×†3\ì\Ë‡\Äg\Ã’G.\Å\Ó\Æ`3¬E\\V#	Ž\Â\ãó±Ò”*b±Tý¥\ZÕ£V„©\ÅÂœ\á\'?ó3\éCô(ñ\Å1)xu\Å|1\Ä\æt27ŒÀq.+6\Ê\ê\å¸ü‹†Ë°ø¬·•\äùÒ¯N¥¿³­GRŽ%\×j¥Jnœaùb¿ð[ŸŠAT7Á?–\n¡Š\ëšú©l\r\ÅT»•RsµK1\0±\Æk•ñ\çüWâ¿Œü\âŸÁð“ÀzCxŸAÕ¼?&§ý¥¯^½•¶³aq§]\\Aln-\Ñ\îc‚\å\Ú\Ü\È\í\Ê¤ŠU\ë7ü:óö#ÿ\0¢8?ðµñ÷ÿ\04ôÃ¯?b?ú#ƒÿ\0_óOZa¼Rúa11T<\ãV\ÃV¥ˆ£\'\n5#\n´g\n”\ä\é\Ô\ã\éÓšŒ\árN„¬Ô£(»>Wÿ\0´?…\Ä`±^;ð5L6/Wˆ§ý·™AÔ¡^Ÿ²«z~B¤y\é\Îqr„\ã5v\ã$\ì\×ò0 z§©÷úŸoÂ¿³O\Ø\ÃZ¿…?cÏZF¹gq§\êGÁ‘\ê2\Ø\ÝÁ%µÕ¼ZÆ¡ªY¬ð\ÊH\Ý\ì\î\í\å\Ã*²@\ÍC\àø\'\Ï\ìðûW·\×4‚~\Z›R´™.m&ñú·‹bµ¹Œ£Eqok\â}CWµŠx]HeHC\Ã ó#*\äµ}”ª¨ªŠ¡U@UU\0\0\0À\0\0\0\è\0À¯›úL}%²ò<‹†¸g \Îr\ì[œ<\ïŽ\ÏŽ*µx`±8\Z\\>Š\ÇÓ…%n\"­Z\Ó\Æs9F”!E.y}ô=ú ño€\\M\Ä<g\ÆüCÃ¹Žišd2\á\ìW\ÃU3,f‡¯˜`³V3\ÌpMIUr\Ëðôh\á\é\à%Õœ«¦£üsÁF¼/¬xWö\Êø\Ó±l\Öÿ\0\Ûúí·Š4§?\ê\îôsOµ¹³¸‰þ\ë\ã\ç†P¤˜§ŠHŸk©QOö=ýµ¼oûj3Ÿ\Ã\Ð<]¦ø\Þ\ßKMKM\×\'¿´kk½®Í•\å•Õ„\ÈT²^\Í\ÌSE2ÈžYŒ\Ä\ÊKX_ÿ\0g¿‚ÿ\0l¢²ø¯ð\ç\Ã>36°\Éoa¨jv52˜<±\éšå·“«\é\É#\r\Ò-\ä*\Íó[|\Çÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=~•ý-|(\Í|.\Ê<<ñ;8›5£ƒ\Èò\\4\Ãe\ËqY^e’–le:\Õs¼›…œ\ê\à¨b½Œ\"\åBª\äŽ&¬W4¿â ¯Ž¹ŒÏ‰~øƒÁ¹d±\\EžqI˜g8\ì\ã,\Ï2‰g\Õñ³\Ä`j\Ð\Âð\Æ}€ÅªXl\Ãƒx—R1\ÅRnr\ÂÐ”ù#ù‹ÿ\0ºø£ÿ\0DKÀŸø=\×ÿ\0Æ¿=k\ß\Ú\Ï\Äµ\ïü1\ã_xSFð•Ç…ü0þµ±\Ñn¯nà¸¶“U»Õ\Ä\Ò^³H&Ý¼xM©°·9¯\éþyûÿ\0\ÑøZøûÿ\0šz?\á×Ÿ±ýÁÿ\0…¯¿ù§¬xG\ÇÏ¢w\çTx‹„¼*\ãl›:\Ã\Ñ\Äa\è\ã\éQÁb*S£‹¥\ì1P\Æq\Æ&\ïi7	7M\É+ò´\ìÍ¸\Û\è¿ô\êñ ¯\Âüm\ã‡¼Abk\á±8Œ³žfô\èU¯ƒ©\Z\Øj’–\Ãl=kÑª½¤R¨¢\åtÕ’ü6ÿ\0‚Iÿ\0\É\èøOþÄŸ\é+úý¿ü?«x£ö8øû£h–7:Ž¥/‚~\Û¤O4òC£\ëZF³|\É\ZfXi÷W#‰\ÈV‡\Â?\Øwöeø\ãK_ˆ_þ¯‡<]ec¦\Ûj§\Ä~+\Õ|«=R!ôB\ÓW\×/¬Éž³\Ìh‘õ”\ç?Y2«©V\0«FA¨ ðAx x¯\Âüjñ¿%\ã¿øW\Ä\Þ\ÊóJ8^\Ãð¼\é\àsúxL&#Ž\á\ìóœ8?\ìüngNj\ê­\ZJ¯µuö\Ø\Ú1sþŸú;}8§\Ão£ÿ\0ø?\Ç®Gý£\Æ8¾1¦ó.\Äc³\\/\âŽÀdP­ÿ\0\nyvIZ®/\r:Š\Ò\ÃûÑ”U$±7œýŸðòº‘Ù”‚;\àŒŽÇžõû%\à?ø,·\Å\ßx/\Âþ¿øU\ào\\øoD\Ót3­I¨k:|ºŒ:]¤6V\×3\Ù\Û\ÈðCpð@ž’V\'“.±¦\â£ö{\ÇðO¿\Øÿ\0\â©.±¯üð½¾¡q4—SxrMS\Â+uq3´“\\]A\á}CH·žy]\Ë\É,±3»’\ÌÄ’Oÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=FñÒ£\è\ë\âf_•aüCðÏŒ³ye•j\âp¸gK+<\'S\Äý_…âœ«ZXS¦§\í(ÓOgNR¢§[ù‚¾…?K	3\\\ã\ágŠ¼‘\Ó\Íi\Ñ\Âbñ”ó|ûW2\ÂaªJ®\ë™v#‚3|5*”gR«¦\á^´\é*•c\nüµf¥ù7ü\×\â\Üñ´6_|—r”Kbú·ˆn”\Ê\Ò Tkx\æ†I¼\Þb\Ç4r\ãc†\Å~Fü_\Ö<a\âŠ^?ñ\Ä8ô\ï\ë¾)\ÕuŸXE\ZEž¯ªNo®-\âŠ7•#Ž!:\" ‘\Ù@\Ø\È\×õ¥\á?ø\'\'\ìs\à¯h\Þ,\Ð~\é\ë­x~þ\ßT\Ò\äÔµÿ\0\ëvp_\Ú8–\Ö\âM3X\×/´Û—·™RxEÍ¬\Ë\Ñ\Ç\"®\äŸ\ãø\'O\ìƒ\ã\ßxƒÆ¾)øRº‰<Sª\Ý\ëz\åúø³Æ¶bóR¾\Ëup-l¼Eoio\æHIò­\àŠèˆ£Šóx\é1ôqð\ß:\Æb8#\Â\Þ*\È0Y–V¨f8ú4°¬\×Š¥Š£<.R\Çqf&•¾¬V«8b½¥lL¨G\ØF4}¤ýO~‡K\ß²,ü]\à¾(Ì²œ\ÚU2¼¯œg42\\\n¾Q\Æc\Þ#À\Øzµ³Jµ\ã‡\ÃÒ£,³£……yýrr®¨Sø³þÿ\0$g\ãGý•KýC´z\è¿\à´~\Ö5\ÙûÀ~%°¶’\ãMðŸ\Äh[Zx‘­-õ­\"ò\Ê\Ö\êP ùv\Ëu\n\Ã,\Ìi$ð+02(?¤??go„_³ž‹­x{\àÿ\0…G…4ê©­\êö¿\Ú\ÚÖ®nµ(\ì\à°K;[\Ôu¡\Ûko~T.‘»\Êo%¬\ëz\âM&ÿ\0Bñ•§kš.©m%ž¥¤\ê\ÖVú†›k0\Û-µ\å•\Ür\Û\ÜÀ\ã\ïE4n‡# WóŽi\ã>_¤MO\ZrL«[+‡\ásj9NdðøLÂ¶	e42œn¬°Õ±øjŠ”~²ðó\\D#7JSûQ_\×ùG\Ñ\ë8\Å}pÿ\0G\Î$\Íò\Ü{.«•W\Î2‰b³ª†gCˆjq[^”±X\\·‰Á\ÇK\\e…\ÃU•?¬B’¿$\ßðƒ\à¯\ê>ñ…|m£¥¼º¯„<E£x—NŠ\í]\í%½\Ñ5}F\Þ¤ã‘­\å’\Ýc˜G$rÙ¶:6~\Í\Ùÿ\0Ám~(I5œ3|ð!ó&¶Šf‹\\×“>cÆ“4A\ÞM™\ËÃ´›x\Ü_Ÿ\Ôýwþ	±ûø†þ]F\ï\à–g4­#´:³\âØ©‘ÌŒ#Ó´Mj\Â\Æ%\ÄF±ÛªÆ˜¢…¬¨¿\à˜±,2\Å2|]ðÈ’¦\ïøñ\×|lw#x˜«\r\Ê2¬\n°\à‚	ý/\Æ\ßI£7‰r\Ëq\\w\á\Z\çX\ì¯^†\nu(å´¾©T©Ô¯Jl`%Z©JN­+Å¦\áó>o\ãNúý2¼%þ\Ø\Âøgâ·‡œ9‚\Î1j¸\ç‡\Î3®l|°Q«zø|g‡ùŒiT¥Mt©Ó­(\ÚmJS÷Zû¯K¼:–•a¨òõ•¥ç•»—ö˜#Ÿ\Ë…Ý³~\Ð\Ä\Ø\É5ü=~Ð¾\Ö<ñ\×\â\ï…uûW³\Õtˆ^)†\â1ó$Úµ\ÍÍ´ñ0ùe‚\æ\Úh§‚X\ËG$r+#s_Ü…µ¼6vð\ÚÛ Žx£‚\Æv\ÇH±\Ç\Zä“„EU$\àrI¯øÁû*þÏ¿\'K\ïŠ¼3\âm^8’\Ý5ö¶—Lñ¶Œ0ŽÕµý&[]\í£\Þ]»\Þ4Q“û´^süñôlñ\Ï,ðGˆ¸‹›\ä¸ü\Ó$\â\\	ˆYdðÿ\0\ÚX\Z¹n&½|%ZT±u¨añT\åO‰¥^”±T%\Ì\éTV¡(Oú\Ï\ésôi\Ïþü)Á\Ø|‡ˆ2¬«Šx7™V¢³•Š§“æ”³œ._K1§[\ÂbñX:\Ë•`\ê\á«Cˆ§\ì\Þ\"œ\è\'8NŸó!û!ÁB<wû\"ø?Äž	\Ð<	\ái ñü$‚mb\ïS±¾²¿{M>x’K)¼™­d†\Î\'Tx©.\ã\ç20Eú\ãþuñGþˆ—?ð{¯ÿ\0~Ã¯?b?ú#ƒÿ\0_óOGü:óö#ÿ\0¢8?ðµñ÷ÿ\04õû_x\ÛôB\â\Ì\ï0\â. ð‹3\ë5­FaŽ,-	\âkF*J¤\é\áx\ê…/gJn(ór¹;É¶ÿ\0›xS\è\ßôö\àŽ\ËxW…|g\à›‡òzU(\å¹f;\ÍjQ\ÂR­ˆ©Š©Nœñ>\ZÖ¬\ã*õ\ëT´\ê\Ê\ÎmF\Ñ\åKù¾ý¯?k¿~\×\Þ0ð×Š¼S\á\Âi\á=\n}K\Ótu…’«\é5‹«Û‹ù\åin\ZY<´ò#·‰!ES¾donÿ\0‚PøcWñ\í\àýONµ–[	øs\Å\ÚÞ·v±;[\ÙZM£Í¤Ú‰\æQ\å\Ä÷w\×ðAn²2™X>À\Ûº©ÿ\0¾ý‰\Õ\ÇÁ\Ä%Xñ—	R\âb®¤™aÀ‚E}Yð³\à—\Â‚ZDº\'Â¿xoÁ67>S_bi\Ð\Û\ÞjrBE6«¨•kýRx\Ã0I¯\în$E;U€âº¸\Ã\ée\á}?	ó\r<4\àŽ%Ê°øüƒ1\áÌ¾Žm·	–\å8<Úzx¼B\ç9\Æb\ëEb±5aJ§\'´\ÄMJ¥uk\å\áÿ\0\ÐkÆ¼G9Š\Þ1q\ç\æ•r\Þ&\Êx¯5\Åd˜\Ì\ß3\Î3¼~K[\r‰\Âa¥Opö	N¬ðXjk\ÂsöXx\Ë\Ù\á\ç.Tðhÿ\0V¿³\ÇÁŸ\Züa¼\Ð.|Oo\à\ÛK§Ð­/¢\Ó\'\Ô>Ý«iúRÆ·óZ\Þ\Çl#7\âvsk1aÀ¹|\ÈY¿\à¶\Þ¹`\×?³n¯9\0\Í\ã\í.B>…ü\Øß­~\×üLøi\àÏ‹þ	\×~|A\Ñ\×^ð‡‰ ‚\ßY\ÒZ\îú\Ç\íp\Û^[\ßÀ¢\ïM¹³½€\Çwi¡ ¸ŽÂ„•f\ã¯øu\ç\ìGÿ\0Dp\ák\ã\ïþi\ëù\ÇÂœó\èó•\äXú>.pOñ\'\Ï7«W/\Çpöa_	ƒ£“K…,-Jt¸¯\"Ol1\Õg\'…¨\Ý:´—·••:\Õþ;ð¯\Ò\Ó=âœ»\àGˆ|	Âœ#O#\Ã\ÑÌ²\Þ(À\à1X\Ê\Ùü1ø\é\×\ÆR–3€8®Vž¦”qô ªQ«l$$\Ýj\ßÿ\0\Ã\ë<ÿ\0FË¨ÿ\0\áu£ÿ\0óHàµž \ãöd\Ôƒ\ã­#\Ðÿ\0QÀ\'©Á\Ç\\•÷ü:óö#ÿ\0¢8?ðµñ÷ÿ\04ôÃ¯?b?ú#ƒÿ\0_óO_¨®B_ú5>(\á\ï\åÿ\0Wú·¡ø‡üC\Ú=ÿ\0GŸÁ\îŸó\'\Èÿ\0»ÿ\0Vc\ËðóGòyñ#\Å\Öþ>ø\ã?[xJð·‹<Iª\ëðxkD\Ê\Ò48µ+§¸M6Á0»m\í\Ã\íU·2¢HŸðF^\Óÿ\0f\ß\êzŒ0hú\ï\ÄýV\çÃ­;·“sme£\é\Z~¡=œD\á!þÒ‚h]\Ô–xe<”&¾–\Ðÿ\0\àš¿±f¨Á©\Ú|\Ò/&·eeƒZ\×<U¯iïµƒb}3Y\×/l.‘†Y\í¤VV+\íMB\Ñ|1¤iú‡47B\Ðô«X¬´\ÍH²·Ó´\Í>\Ò¶+k+Hâ¶¶‚1÷b†4A’q’k\Õñÿ\0\éC\Â%xy‡ð÷ƒxk?ÀaV3\'­W\Ä2ÁR–	’û\Ø|6Ž1\Íj\â+Ô”(BxœN*\rQe(Ö©Wž¿EÏ¡ˆ^x«/¼D\â®\Å\â°ø<\îž+\áJ™Ž.8\ìvyBXzøœu|vM‘Q\Â\á\è\Ó\Äb§.	QKõwÑ¥NT\ç­EWðùþ”…~Zÿ\0Á`\ä\Î\ïÿ\0\ì¤xÿ\0CÕ«õ*¼³\ãÁ‡?¼\'€~)ø|x—Â’\êV\Z´ša\ÔuM,CM2µ•À»\Ñ\ïl/\Äg—1‹ð\êÀ_q\áŸ`x3\Ä.\r\â\ÌÎŽ/—p÷å¹¶6Žjc*\á°u\ãV¬0\Ôñð\ÔgY\Å5\Õ\ÄQƒ{\Î+Só/ø75ñÂž?\à|Ž¶›ñG\æy6][3«^†_KŒ¢\áJx\Ê\Øl63J‚—ñ\'G	ˆ©¬iM\è\Þÿ\0‘\Ç\Âö5xsÿ\0O6Uý\ä\Ùÿ\0Ç·ý{Eÿ\0¢\Å|\'cÿ\0\ÉýŠô\Û\ë-F\Ó\àú\Çw§\Ý\Û_Z\È|e\ã¹w6“%\Ä\äñ3F\á%£«#ck©RAû\ÑQQj\0U]ª\0(\à×€8û§Ò‡\Ç^ñ²¿T\á|·ˆrøð\íþž7û{\r—aYf“\Ê%‡ú²Àf™—:‚ÀVö®«£\Ê\åO“žò\åþgúý\Zøû\èõO\Äñ\ÎcÂ˜\éqTømå«†3\×0T–Q\éb¾¸ó<%öNO1 ¨*+\Ï\ËU\Í\Òå‚Ÿñ‹û{ÿ\0\É\âþ\Ð_ö?\ßÿ\0\è‹jý-ÿ\0‚ÿ\0\È_öƒÿ\0¯‡ÿ\0úQ\âZý@øÿ\0ùý“~(x\Ë\Ä?ñ¿\Â\ä\ÕüY\â‹\ã©kššø§\Æ6öõ£H\Þsi§ø‚\Ö\ÎuK,F…²\ÛrI¯Løû,üýœ_\Ä2|ðZxNO=u\Ù±¯j\ï|š_ÚŠn\×5=DÀµ\å\Ãm·òƒ—\Ë\î\Â\ãô>”\Å~/\nòü›‹(ñú·Á\Ù3\Æc0yE<¡bx‘\Ö\Æ\Ôöôsºø\ÇB¤r\Ú\ë\r/¨ûI\ÊT•Jt”¤\áù…Bÿ\0¸\'\é3„ñ‡7\Î8·\na¸Ç8\árü\ß=¯ž\Ë\Ä>!\Ã\à)¬#†0˜‰Œól3\ÅA\æžÎ”aYÒ­]\Æ\n§!ûuÿ\0É¡þ\ÐöNµýÚ¿‹\àÿ\0€ÿ\0Jþóüs\à\r|Hð–¿\àoi«¬x_\Å\ZmÆ‘®io=Í²\Þ\Ø\\€%‡\ís[\Ý@N\Õ+-¼ñJŒ+‚+\âŸøu\ß\ìGŒÂœ\éÿ\0#¯¿ù§¯\è\Çô\à¿¸gˆò^\'\ÊxŸ‰\ÍøŠ¾\Z®E„Ê±!‡Yf\áZXü\ã-©\Z\Þ\×\r9rÂ•Hr8¾~fâ¾«\é‹ôKñ/\Ç\î>\áž)\àœÓ‚ð8Ÿ„h\äº<Mšg8\\±”³¬\ß1u(C-\á\Ü\æ”ð\î†aJ*s­J¢©\n‘ö\\¼³—·þÇŸòk_\0?\ì“ø\'ÿ\0L–µùÿ\0\Âÿ\0[û>½\ã¿ý W\îÿ\0„<\' ø\Ã\Zƒ|-`º_‡<1¤\Ø\èzš’\Ï2X\éšmºZ\Ù\Û,\×2\Íq/•j¦Y\æ’W9gvbMy\Ç/\Ù{\à\í<<>1x5|Yÿ\0³_¶„¶5\í¬Ž¦¶\Ëz7hšžœgY…¤-Á”FP˜Â–bð\Ã\ÄÜ‚¼o\Ãø—š`ó\\FGO<\â¼\ÊxL%L\×\Øg¸L\æŽ*Ž#†\Â:´\ç˜Pú\Ä~¸£Æ£§:®1Œÿ\0uñ‡Á^+\ãß£5òLnCGŠ(p\ç\å\\\Ìñxü>G,O\Ö\È\å˜Mb°\Ùf7¨ÕŽ[ˆxIf¹\Ôr¤ªÓ¡\Í\'\åoþ	\×ÿ\0\'©ðþ\ÆmWÿ\0Q]z¿¤ÿ\0ø(§ü™?\íÿ\0be¯þ¤ZYøuÿ\0ÿ\0ý”¾ø\×@ø‡\à/†#Dñw†.f¼\Ñ5_øJ|cö+™\í.,d—\ìzŽ¿ue96\×S [‹yP\Þ\0uV¿à¢¼~\Äÿ\0´ ðm¯þ¤z~©\â7‹\Ü;\ã7\Ò\Â#\áœu€ÁeÙ§\äµ\ég”08|LñT¸Ú¦:S¥a˜\Ót=–:”T§Vu#Q{5\Ïñ\ï¼\ã?\0>Œ^=ð\Çcxs˜\ç7\çøZœ5Ž\Ìqø8`ªx{K.Œ+\ÕÌ²Œš¬1>\ß]ºp\ÃÕ§\ì9{g)Jþ6\ØnR¿\Þ~cû5\à\ïø,¿\Ä\ßxK\Ã>‹\à\ï‚/¢ðÖ¤h\ÞK¬\ë°\És‘a„3IH\è’Iº4\Ý\ä\àŠücv‚\n\ÄŽ \Zþ°>ÿ\0Á4ÿ\0cO|5ø¯\êÿ\0	Mæ«®x+\ÂúÆ¥t\Þ1ñ\ÄF\âÿ\0S\Ñ,¯n\æò­üG‰.\'‘‚EF€…U\0_ÛŸI®#ðs‡²\ÞŸ‹ü›q~\Íc‘Q\ÊR\çÀ\âh\áðR\ÇU¬\Þ{‘\Ú5©OÚ¦\"\î÷!ñKü\èú$p‡\Ò‹s~3¥\à\'d¼Áe¹LøŽ¾sŒ¯„§Á\Ö\Åb£€¥C\Øð\ßûIÐ­O9sR\ÃrÆ§»R|\Î1ü\ê\×?\àµu]V\Ó->øNº\Ôt\ë\Ë}@\êº\í\×Ø¥º\à[¡l\ÒÄ³µ¾ÿ\05#wÎªrnSø·<\ïq<÷03\\\Ï5Ä¤\0 \Ë<,„(À\0»¶\0\à;Wõ\çÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=u~ÿ\0‚v~\Æ\Þ¿Q\Òþxfö\â<\Ø\×Ä—:Ï‹-VM¡U¾\Å\â]OU³m˜ª\ÐWùÀÝ’\0\àß¥Ñ¿\Ã,>j¼>ðÏ2jÙ·Õ§§\Z9g.6x(ÖŽ5ñX\Î,\Ì\êÑ§K\ëù}•)E:³“§&\Ñý3\ÇBÿ\0¥\ï‹xìš§Š*x}Ÿ\Ñ\É\Ö\"Ž[8\Ïk\ÔË¨\ãeBx\Éa°xn\Ê\èÖg‡¢\å\í+BRö0Š©ž{ÿ\0ªðþ±\á\ïØ»\á\ÜzÅÅƒ\ë\ZÇŒüC`—1˜\Þ}\'Wñ%\ìúu\â«|\ÞM\Ü\0M¾dL’((\êO\åü\Âú®™ûEø\'\Å3\Û\Ëý\â_†öv¶¢·Û´]_QŠö\Ä\Ü\å5\ÔqOmtÐ†,9]¬\rMÖ¶\ÖöV\ÐY\ÙÁ\r­¥¬1\Û\Û[[Ä\Û\Û\ÛÂ‹0Aj±\Å1ª\ÇhªˆŠª (¸ˆ¿>|\\\Ð\Âÿ\0ü\á\ßhM!™4ÿ\0ivº”V\×&7ˆ^X½\Äm-…\ê$Œ#¼³’˜óòJ+ù—€|u	ø\éœx¿ÈªbpœC™q6#2\Épx˜}g\r„\â<ELJ†^¥Z¾¢Ã¿\ÞÆ„1Q¥RXj¥\ì\Ï¾ŒÕ¸\ë\è\Û\Ã^\à8’×ƒò\î¥”gøü%X`±¹`?³¥<n:µ°øl~¶.+\Ù<Tð“©FnŸd\ã?\ãSöYý¤üMû+|Sâ‡…ô-Ä—M \ê~½\Ñõ·»Š\Ò\çO\Õ\Òi)ì¥Šh.¡š\Ê†C\æÅ1$…\Ã\r¿¥\ßðû¯Š?ôD¼	ÿ\0ƒ\Ýükôú_ø&\ìK4²J\ß\ãV‘Ë²\Å\ãC,rBE‰R8\ÔvDUQ\ØTð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó\×ôOý þŠ~ \æñ\Ïø\ÇÂ¾5\Îs•„¡xÚ´0z†œ\çBŒ–ð´\æ©JµNIÊ›©\Ë.W+(E#ð\'\Ñ[\é\Å\áŽK>\à?|=\áÜŠxúù“\Ëð™\æqR‹\Æ\âi\á\éW\Äÿ\0µøqŠ«Õ¥†£F5y²\\ª\í\Éþ\Zþ\Ô\ßðSˆµ\ÂÙ¾j\ßü#\á-÷Y\Ó5}CP\Ó/ukýFc¤H\Ó\ÚZÁö¹\Ö\Þ\Þw\ßp\í\Ò:¢,mÏ¿ó³\Ãz6£\âO\è\Ñí¤½Õµ\ÝkK\Ò4\Û8Q¤–\âûQ½‚\Ö\ÖE‰yePx\àdœ\0M[¿ð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó×³ü&ýŽ?fŸ‚:œZ\çÃ„žÑµûf-g\â¸n5\íz\ÇtoýƒX\×\î5=F\Ç\ÌIdû%\Ì>bœW±‘ý.üð\ï…ñ™†^ñn[\Õ\Åc°¹n.9n/©™\âhÓ¤ñ\Ìtø‹:\ÇF2ö#S\ÙÐ¬ý%\ZpŽ‡‡žý>’¾)ñŽˆ<_ñ7s)JŽ/\Ì3¼&?:\ÌózYVs”0ø,¹ðŽA©8*ø‡ET\Å\á\á\íj9T›Rg¤øª\Æm3\àÏˆôë¾}‡\Ã]b\Êm¤2ù¶¾¹‚L0$¾6Á‚+ø[“ýl¿õ\Ö_ý\r«û\èÔ´\ëM[O½Ò¯\á[‹\rF\Ò\æ\ÂöÝ‹*\Ïiy–\×01FGU–	FV²¤ðkÁ/¿bGfsðqr\ì\Î\Øñ§@\Ë\Ç\0xŸ\0dž ¯\ÄþŒ_HðbCŠò¾\"\Ì*q./%\Ä\á%ar\ÜD)ÿ\0g\Ó\Í#‰X…˜f¹l©¹KI\Ñöj²”cS™Á\Æ*\Ñ?L_¢¿ˆ=c¼:­ÀyŸ	`p\Ü!”g9f6<S™\æø\n\Õ6¶U,$ð¯+\È3˜VJžª®\ê¼3Œù9#QMòfÁ+ÿ\0\ä\Êþÿ\0\×÷õ/\Õ\ëôJ¼\ï\ágÂ¯üðV“ðóá¾ˆžð†ˆoM\ÒR\îþü@÷÷“\ßÝ»]\êwW—³<\×W\Ê\Í5Ä„nÚ¸P\0ôJþq\ãþ \Âq_q\åô±40<C\Äù\îuƒ£Œ(b\éas<\ÏŒ¡O\n±a^4«EU*õ©\ÆjJ5&’“þ¼ð‹„³.ð³\Ã\Î	\Î+`ñ¯	ðoðþe_.©Z¶®7)\Êð\Ø,ML\\F^¦\ZU¨\ÍÑ©[\r‡©:|²\Zrn(¯\äþ\n{\á½_ÃŸ¶o\Åµ[I-\íüG‡¼A£\\2H°_\é·Z”>u¼®Š’ù0Okp#,!¹†H˜\îS_\×\Íy\'\Å_þ7X\Ú\Ø|Uøy\áEa\ægO­iO¨i¾k+\Ëý›©¨MFÀLÈ¾r\Ú\\Â³c÷«ô£×Œ_ø\æ¿f9N\'8\Êó“‘\ãðø\Z´ic¨S¯ŒÀci\âð«\áB´\éUÀFœðõjÐŒ\éÕ”•h\ÊŒÿ\0%úWxúBøwáŒ›:Ády\æI\Ä~ \Ê\ë\ætñ\Ë1S§\ÇeõðX\Ù\ái\Ö\Ä\á£VŽ9Õ¥Š£C\éÔ¢¡,<\ãUÔ¥ü”~Ç¿¶WŒ?c\Ý{\Æ:¿†<) xº\Û\Æ\Úf™§\êv\Z\ä÷ö¦\ÞM\"\â\ê\â\Ê\ê\Ê\æ\Æd*Ù¼ž;ˆ\æŠe‘\nò\Ýw\Û\ÏØƒþ\nG\ã?Ú³\ã\ï\Ãü6ðß…l\àðv¯\âXµ]UÔ®®~Ñ¦^\é–\ëlðÞ†¢•/œ–]®¬ŠA#*}Ý¿\à—ß±#31ø8 ³!|g\ã\ÕPX’Bªø˜*¨\Ï\n *Œ\0\0\0W«üý‹?fÿ\0€+Ÿ\Æÿ\0\n>/†<Mq¤\Ýhrjg\Ä(Õ›û2òki\îm\Ö\ßYÖ¯\íP\Ë%¤Ê°‰€Bª\áYý§\Æ/\ZþŽ%e\ÜU›aü9\â\Èø‹œe1\Â\åœI£ƒ\ÃR¡\Ãa\è\árüF*..­E\Ã\rB:\\\ë.\ÄNP§:u,\æ\ß¾ŽK\ï	3®\n\Éñ\'ð=?\nò> §\ÎøW)Í³L\\ñYV\'ñ¹\Æ	OÀxiÊ®6uk\ÍByž*­YN5©·s\çø+G‡µö8ñLºE”·‹\áÿ\0ø?\Ä:±‡­t{;Û›K›¶\\\îx\áŸPµU\\\ÈF\Ôb?”ÿ\0\ê\Ñ\è^!\Ð5\Ù,-uh´MsH\Ö$\Ò\ï\ë=N=/P¶¾}:\ì\0sk|kƒ˜e~Jþõo¬lµK;­;R´¶¿\Ó\ï­æ´½²¼‚;›K»[ˆ\Ú+‹k›y•\âž	\âvŽXeFŽDb®¥IñO‰\àœ±‡ŠµIµmC\àŽƒes;3\É‡µ/øcN\Üí¹Œz_‡µ}3N‡,I+TU\Î\Ås}þ“¼1\á7f|Å¼;žf<NqŽ\Íp¹†@ðUk8f8L&„\Åa±¸ü·‘Ó–Î–\'Š”œ+r:P•R§¯ô´úqÏ~!e~\"ðð\ÆG%\Ë2ŒvU\Å53\Zur¬^3‡\Ç`ñ™vSœªÑ«OU\ÂbppQ©A\ÍW«\nþÊÁö?ðZ„q\Ø\Ù\Ç?À/\ÛO´)5µŽ³\áógˆZBlacma\Ì1‘U(1Š\å~#ÿ\0Áa~ø\Ó\á\ïŽ|aðGÅ–Wž+ð‡‰<7m{s«h/œú\æ{¦Ew*Gjdt¶’\éf(…Y¶aYN\r}õÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=ð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó\×Œ¾…øLe}\r¼W†#\rŠ¥‹¢\Þk\Â¨Õ…jm\Â|q%(\ÆqM\Æ\\\ÊI5+\ÝóF+\Ã_\Ú#ŒÀb2\ÜOŠþO‹Á\ÕÀ\â\"²ü4%<=zW«:~\ÂP”©\ÊiJ..\Î6´müƒ\"\íD^»UW>¸\0Wöwûÿ\0É™þ\Î\ßöN4¿ýw^{ÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=}£\àø[á‡ƒ<;ðÿ\0Á:`Ñ¼\'\áM6-#A\Ò\Å\Í\åà²°€»GÚ¯\î.¯\'!‰’\âyd$œ¹\ã_I¯¤x\ÑÂ™E\Ã9O`1yW,\ßW<\ÂeX|<ð\ë,\Ç\àù(\Ëœf5%[\Ú\â¡.YR„9#7\í.£t}~‰\Þ&x\Ç<QÄ¼o™ð^;p¤²<%>\Ísœ~.Ç›å™‡>\"žeÃ¹5(aýŽ¬y\é×«S\Ú8/e\Ë\'8ÿ\0\'?ðTjþ\Zý³~\'Oª[I\r·‰`ðçˆ´k–ŽD‚÷Oº\Ñ,\àg·•\Ô$\Æ\Ú\ê\Ú{Kƒ0Ž\â\'°ÀŠ\à¿cÿ\0\Û+\Æ?±\î¿\ã\rc\Âþðÿ\0‹m¼k¦\éš~«§\ë³j\Æ\Ò..®,®lnl\'Ë›\É\ãg†\á$M›n»\Ïõ­ñg\à/Á\ïŽZl:g\Åo‡¾\Zñ¤6‰2i÷:¾ŸjšXœ©˜\éZ¼>V§¦J)\Ø\ÝÁ¼€[$_-ÿ\0Ã¯?b?ú#ƒðñ¯¿ù§ËŽ\Õ÷</ô³ð¯\áNOá·‰œÄ¹µC“ðþe‡\Ê\éå¸¬³4¡’S\ÂC	ŠU+gY67VSÁa±.”\"\Ý\Zðjž\"qI¿Ë¸\Ï\è1\ã†W\ã6wâƒ|{Á¹Tñ\ÜIq6MÎ±¹\Æ[d¸Œú¶.®/\éaøkˆp8¸S§˜bð«*±ú\ÆWž”¦\á\Ì_ø}\×\Åú\"^ÿ\0Á\î¿þ5ùýû`~\×~#ý¯üY\á/ø\ÂZ7„\'ð—‡\î¼?mi¢\Þ^\ÞCuÖ¥.¢\×=ó3¬ªòùaSTŒæ¿£¿øu\ç\ìGÿ\0Dp\ák\ã\ïþi\èÿ\0‡^~\ÄôGþ¾>ÿ\0æž£„¼zú&p.w‡\â>ð§²|\ë	KG¥K^¥*Xº\rˆŠ§‹\ãœEªÑœ¡\'*M¤Û‹R\åb\ã_£Ó«\Än\Äp·xÁ\á\î\Ãøº\Ø\\F\',\Å\çyµ:5k`\ëC†©)a|6\ÃÖ½\Z\ÐU\"£Q\'(\ÚI§cðƒþ	Qÿ\0\'§ðÿ\0þ\Å\ßÿ\0\ê=q_\Ñ7\í\é\á\íc\Å_±÷\Ç\ÝA±ŸR\Ô\î|qs²\'–-+QÓµk\Ój9†\Â\Æ\êr\Û\0i~þ\Âÿ\0³Á\Z\ØüBøið\Ý|=\â\í6\Öþ\Î\ÇU>$ñf©\ä[\êv\íix«i«k—¶L\ÒÀ\íw·g%£enk\ë†PÀ«\0\ÊAA Ž„kð\ï|p\É8ÿ\0\Åþñ+…2¼ÖŽ†0¼5(\àsúX<%|V; Ï±¹Ë¦ÿ\0³ñÙ•8\ákÆµ\Z>\×Úª©ûW\ì­¹ÿ\0L}>üWá}\á7f\Ùöcx®+1\á|F;4\Â\àrþ#áŒ¿ k\æ™fKR¦3\rR†\"»¡\ì=Œ¢¨¯¬79ªÀ7¤vaƒØ€Gq\ØýzWì‡€?\à²_<\à\nx>\ã\áGõ\É</ \é~MZMKZ±’ú\ßH³†\Â\Öy­a•\áŠf·‚?4DV6pYQAÀýžñ\Ïü\ëö?ø…«Í®øƒ\àŸ†¡\Ôî¦’\â\êoÏ«xJ;»‰‰i®.m|/¨\é³\Ï+’òK$,\ï!i³±c\ÅÃ¯?b?ú#ƒÿ\0_óO_Ñœ_ô©ú;x™—\åXoü4\ã<\ÞYeZ˜¬6\Ùå“¥\Åb)Â–#\êø\Ü/\åXŠÐ©B2u(ÒOg	:1”co\äž\nú}-ü%Í³Œ_…ž)ø‘C4§OŠ\Æ\Ó\Íó\ì-|\Ç‡ª\ëa¾·—\â8#7\ÃQ©Js©({<Ei\Ó\ç©\×q©$ÿ\01þsñH«ø\'\à0\ÅX)ms_eT\í,¡Ð²†Áe¤Œ€\ÊNG\ã\ç\Ä\ïˆ\Z\×\Åoˆž5ø—\â8\ì\à\×|u\âMO\ÄÚ¬6´60\Þê“´ò\Ãi’J\éy	y°2\Ì\Ç&¿«\ïøu\ç\ìGÿ\0Dp\ák\ã\ïþi\ëOHÿ\0‚hþ\ÅZ-ü:·Á]2\êXƒVñ‹u›\Ã+b};U×®\ìgRT³[¸*YH\Ú\Ì\'}%>Œ>\Z\â3øaÆ¹&?1\ÂC	Š­O–Öž&…)ª\Ôðò«Ž\ã,s£I\ÖQœ\Ý\ZkšQŒ¥òA.\Î<ú!}4|W\Ã\åyo‰,ø}\ÄY^YŒ–/	Gžgœ˜:õ©ª±Tðø?°¯]Qs„=µOv.p„éª³o\äoø\"n‡«X|øµ®^X\Ü\Û\é~ ø•fº5\ä\Ð\É:ˆ\Ò<9gm¨Ik#¨Iâ¶º˜[I$Lê³¤‘6¯§ÿ\0m\Û\ãHýŽµ\ß\èz\ÃmO\Çsx\ÓK\Õ5X\æ±ñ®ƒŸ›w§”\ë>ª½\Ë\Ìò\ÈòV5\\|Å¾_»|;\á¿øCEÓ¼7\á]Kð\ï‡ô‹u´\Òô]\Â\ÛL\ÒôûU%–;8¡¶¶ˆ33lŠ4™˜‚Ä“\á\ß?dÿ\0€ÿ\0´mö…©|`ðBx®÷\ÃV\×vz-\Çö×ˆtw´µ¾•\'¹„ÿ\0bjºrÎ¯,j\ã\í)C…C0?\Ëÿ\0øŽ|m\Íü@ñ\'†3|W\ç˜\Ìf#Ã¹66K4…:Y<r\ì}n–a’óÔ§_\rƒ\Ä\ã=–2„ö±‚«M(Tþ\×\ÂøQâ¿‡Gð»Áþ2\Èp#p\î/\Ã\áx§;À\ÓY4ý®y<\Ó>Œp¸¬›‰£\nu(bñ˜\\«exŠ’Š¥9<-Y¹\Òüœoø-dbò~\Ìú“¹\ä³x\ëH$ýIðY?­7þY\à/ú6]Gÿ\0­ÿ\0˜ªû\Ãþyûÿ\0\ÑøZøûÿ\0šz?\á×Ÿ±ýÁÿ\0…¯¿ù§¯\Ö?\×¡/ý\ZŸ?ð÷òÿ\0«ý[\Ðüþ!\Ç\íz¿\Z<¾·“\äoùwÿ\01®ßƒ\îÊ¿\Úþ\n·\àß?<yðº\Ëöv\Z=ßŒ´f\ÒmõW\Å:f©k¤I%\Äi-Œ±š{«aûAå±Ž\ãË˜\ÈV3þ.,RLR\Þ$yæ˜¬0\Ã\Z´“M,„GqÆ ¼’H\åQAfr‚H¯\ë\ßþyûÿ\0\ÑøZøûÿ\0šzô¿†¿°¯\ì£ð›Z´ñƒ>\rxb\ß]\Ó\æK7U\Ö´<Q{¦\ÝG –;½:\Þj\Ícw\å\\\ÛyS\Ä>X\äU¯Ô¸+\éOôð£!Ì²¯\rü>\ãü$1Ø¹\ærÀ\æX¼-l>\'1xj8hÊ®?\Å9\æ\'	I\Ò\ÃÑ„–\rR+–STg7\ï~E\Æÿ\0B¯¥_Œ¼O”g^-ø‘\á~:¦_¥”,\×,§Š£‹\ÂeTñUñžÊŽS”p`1\Õc_‰œ%‰\ÄÑ«.uNX˜Ò5_ø¥kZÁ_„\Ú?ˆ\Ì\Ç^\Ó>x6\ÇWòN—ö\Þ\Óá¹Šg“e†Th¤\ÞB\â½^\Å-Ù†2yŽaŽ\Ì*B\êcñ¸¬mJt•©Óž.½Jò…5\Ò•G/\åHÿ\0Z2L®–G“e-\nµk\Ñ\Ê2\ÌWF½ysW­K/\Â\Ò\ÂS«Z_j­HQS©.³m…Q\\g¦QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0ƒ\âøoÆº§\áo\è:G‰ü7¬À-um^Ó­5m#R¶Yc`¾Ó¯¢ž\Ò\ê!4QJhD‘£€T\ê+JUjÐ«N½\nµ(Ö£R¨Ö£9Ò­F­))Ó«J­7Ó©NqŒ\á8J2„’”Zi3*ô(\â¨V\Ãbh\Ò\Äa±ªP\Äa\ëÓ…j\èVƒ§VjU#*uiU§)B¥9\ÆPœ$\ã(¸¶œO\ì{û)\ì\áðDƒÁá‡ƒyÿ\0\Ê=}	ace¥\Ø\Ù\éºm¥½†§\Ú\Û\Ø\ØX\Ù\Ãµ¥¬Iµ­­¼*‘Aooi0Ä‹q¢¢(U\0Z¢½\Ç<\ÎóxÒŽmœ\æÙ¬hJr¡\Ë2\Æ\ã\ãFUT\åF8ªõU)MF*n\n.J1Rm$y9Oð\ÞA:\Õ2.\ÈòZ˜˜\Â‰\åN-xSm\Â5¥ƒ\ÃÑ•XÁ\ÊN¨\ä¢\å&’m¶QE\åž\ØQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEÿ\Ù'),(2,6,'ÿ\Øÿ\à\0JFIF\0,,\0\0ÿ\Û\0C\0ÿ\Û\0CÿÀ\0°°\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0þþ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+\â?ÛŸþ\n%û$Á9¾\Íñcö«ø­¤øM¹ƒPÿ\0„O\Âv\Ø\Õþ!|BÔ´\ë>MÀ¾¶j:\Õ\ë3Ao-\Ûý“DÓ¦ºµ:Æ­¦\Ã<r¯\Û\Ûö\ÒøYÿ\0úý”>.þ\Õ\ß¦øká–ƒ\ç\é~†ö-W\Ç1\ÕgLð‚tC2\Í#\ê\Zþµsm\r\ÄÖ¶z„ºN«¯\Ëcqe¤]¨ÿ\0?\Û\Ëö\êøõÿ\0ý¤<oûJ~\Ð>%»\ÕüI\â{\É`ð\ç‡ò\âo\rü;ðt>…\ào\ÙË¶\rF‚RÁ»\êZ„—šµ\äl½˜\ÐõµûTÿ\0Á\ì_u-r\ïMý‹ÿ\0e/†þðí¦§n\Ö>,ý¡õ/ø\çW\ÖtÄ´–+\Ø.|\à=sÀÖšD\×\Æ+\Ë\Èüe¨4©ö[½>I]¥_›ôŸø=sþ\na\r\Ô/®~\Î?°¾£d¤yöúOþ?h·Rò!¼¼ý¢µ\è %r{€8#\å?\Ç]þ•ŸðOÿ\0ø<—öføÍ®\é\Þý»~\Ýþ\Ëzö¯ªMkañKÁR\êþ?ø3kjmmÆž<Q\Ã?¼7u{©4ö­w‡®øO·0\Þ\êúÎ›j—S\Åý–xOÅ¾ñ\ï†4x\Ä\Þñ§ƒ<W¤Xxƒ\Â\Þ-ðž³§x‹\Ã%\Ðu[h\ï4½o@×´{›\Í+X\Ò5+Ibº°Ô´ë»›;\Ëicž\Þi\"ucþõý]Á±ÿ\0ðZo~\Äÿ\0´w„¿c¯Ž6½½ý¿hZxsHƒ_º¹»Ó¾\n|Uñ\ÂYø\Å:·.\á\ß\ê²\Ú\è^/\Ó\ícþ\Í{‹\Í?_¸†\Ý\ì.\ï€úŸQH¬®ª\èÁ‘€ee!••†U•†AAr)h\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(øÿ\0ƒ\ÞhYøwö\Zý•´m`\Ã\áOk>9ü@\Ð\Ö(ö†»\áK?	ø#\ámûO“<K¥\Øø\Ã\â¬m\0\Û\r\ÃjJû\Þ\Ò\"Ÿ\ç\Ñ_\Ú\ÇüÑ \ßYþÙ¿²>½ý—|šN±û9kp.´ö\×NºÕ¬>\"jð\Ý\éP]¶m¤½\Ó\ì?³/.m\ã\Û40\êv²Ê¥&‰ñO@Q@9Y‘•Ñ™2²’¬¬§*\Ê\Ã2 ‚È¦\Ñ@\í—ÿ\0rý¦µŸ\Ûþ	ûþ\Ð~&—T»ñŒ~	\èšŽ5Mb+Xoµ\ï|2¿\Ôþxó\Ä\ÞMŒqZ\Ãg\âx\'[ñ™1F#\Ó5;DdWVô¶¿?\à€^ÿ\0„/þ\Õÿ\0ø\Ñü¿+\íŸ4\ïm\Æ3ÿ\0	\ïˆüC\ã¯3ô\Ûþ?7?Å¿=\ëö€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€?˜Oø:¿þ	\Í\âÛ‡þ	óeñc\áG‡µülýŒ¼C­üVÐ¼?¥$—z§‰þx‡L³Ó¾4xsG\Ó~\ÛmÞ±o§\è~ñõ’Am©\ëZ‚|?¹ðÇ‡ô\ëKÄ±\Æ\Ê\n¿\ß\Îx º‚kk˜b¸¶¸ŠH.-\ç&‚x&C°\Í£–)cfI#udtb¬\n’+üö?\àºÿ\0ðj÷Œ¬üY\âÿ\0\Ú\Ïþ	•\áWñ?‡|K¨\ê¾\'ø›û+\ÙH‰­øgT¿¸K»\íkà°”ˆõmö\ê\âò\î\ïÀ—S[]x}c?ð]_\ØI§\0tWK\â\ßx\ÃÀ:\Ýç†¼s\áox;\ÄZ|ö‡\âQ\ÐukIŠ²Ï§\êvö·Qü\Ê@-\rŒ©#š\æ¨\0¯¥?cÿ\0\Ù_\âŸ\í³ûKüý–þé¨xÿ\0\ã4¿\ni³½½\ÍÆ\á\í:y|ÿ\0x\Ë^‘\Ëq†|\áø5?ø’\ê(\Ý\ítM&útGdU=G\ìûþ\Öÿ\0·Ä\'\á_\ì­ð?Æ¿|E©\\Áî§¦i¯e\à¿\nX\Í$ñ¾»\ã\êdð¯„4vµ¸I5=sU³Š{¨\×L±zµÍ…\Çú‘ÿ\0Áÿ\0\àƒ¿¿\à’Ÿµ?x÷Y\Ñ>*þ\Ø_4k}?\Ç\ßt\Ë7ð€\ÏÜ¿¾=ý¼\Z¤š[\ÝG¾\"ñEü6W\Þ%º´¶iºF›´¹\0ý\ÅøðoÀ¿³¿ÁŸ…¾\éói_¾\rü?ðŸ\ÃOi\×7/{ug\áh–Z‹\r\Õ\ä€Iwt¶0ý¦\ê@\âs$¬9¯T¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0þ?\à÷ýC\Â:NŸûhš„¼o\ã_\Z\ê¿|C\âO\Å\á}\r|s¡øOøU£øsF¸ñj\Ù6ƒÇ‹õ™†& \Út—1\Û\Ïö6\Î6_\åkþoû8èŸµoüoö/ø7\â¿i\Þ4ð^£ñU<]\ãŸkk¤køo \ë?|EeªÙ¸1\ÜX\\i\Þ–+˜¥)#r²+!*z¿\àõÿ\0ŠZg‰¿mo\ÙW\áU…ú\\\Ý|-ýŸu\ÝcZ²F$\éÚŸ\Äo\Z˜’E\è²]h\Þ\Òn=LM<`\à\Ð_\\ø§þ\r\á¿\Çl\Ò\Û|5ýŸ~6øª\â\ãnR\ÖM[K\Ò|o“ü/7ü&F2¢N{õ;ð/Ã¿‡ÿ\0ôü-ð\ÓÀ\Þø{\á˜n\'»‹Ã¾ðÖ\áM;»§ó.®“I\Ðl¬,\æ\êO\Þ\\N óg“/+»\×cE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEþBÿ\0ðt¯\æñü\ïö¼´ûK\ÜXx&\Ã\à?ƒt\Õi‘\Û%—\ìõð·T\Ô\à„#U×µ}Y¤N¢v”žM~\Ðÿ\0Á?mµo‹¿·Ÿ\Çk˜\Ô\ÜxÀ¾\é2ó\Å\Æ×¼{\âmgaÿ\0¦qü7\Òñ\È	žŸ\åŸþ\n\éñ¶\Óö‹ÿ\0‚˜þÚ¿ô\é\Ò\ëLñÇ&•<r	c—Ið\Û\ÛøKKh¤4_\Ùú\r°Œ¯Àý\ÃÁ“?oü=û~\×?n\íš+o‰¼+\áý.b¤«/‡	—Í‘X¹bÔ¼e…hÛœ–\0ûY¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¬[°ðÖ…­x‹U”A¦h\ZN£­j3±\Â\Ãc¥\Ù\Í{w!\'€$oÂµ\ëókþ	ñ\Õÿ\0f¿ø&/\í«ñ–*\Ýø_\à‡ˆt\í9 Çš5_\\\éþ\ÒJ@ûK\Äö¿6FÑ“Ú€?\Ä\ïUÔ®uSR\Õ\ï[Ì¼\Õo\ï5+·9;\îo®$ºòz\î–W9÷¯õ\Èÿ\0ƒW~Yxþ—û+\êð¦\ÍG\âV»ñ\ß\Çz\É1É¸?ü-¦À–˜øcH‘dm§÷†5]ˆ¬\ß\äQ_\í‘ÿ\0mø-/\ìõÿ\0¹ýˆ>\Ü+¥\ç‡~økR\ÔVE(ÿ\0Úž3žÿ\0\Ç:©u f\Ô|It\Ä`\0O\0\n\0ý0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯š>>þ\×??fû&ˆ\Þ,_\í\æƒÏ±ð_‡\âMg\ÅÚˆh§š‹LI¡†\Â;‘o\"A}®^\é:Y˜\Å—ñ4ñoøöôÿ\0‚ÿ\0Â²»\Õþ|\r¼‚\ã\Ç0y–>+ñ\Â®m|+)gÒ´4%\ã¹\×\ã¥\Í\ì\Êmô§;bŽ\â\ìoü÷øƒ\Ä:çŠµ‹ÿ\0x“U¾\Öõ­R\á\îµ\rOR¹š\îò\î\áð\ZI®\'w–FÚª ³TgŠþ\Åð_è«˜q–\Äüwˆ\Å\ä\\=Š„1~S…Q§f\Øy(Î–&­JÐ©O,À×‹\æ¤\åJ®3Oß…<59\Ñ\ÄOü\ÐúP~\Ðl›\Ã,\Ë2\à/	0Ywñž_V®9\â,\ÂU+p·\ã)¹S¯‚\Ã\Ñ\ÂÖ£W>Í°µ†\"0\Ä\á²\Ü\ru\ì\ê\Ö\ÇW¥‰ÁRýwø©ÿ\0‰ø§®\\\\Zü$ð‡|	¥‹\ìÚ—ˆüY\â9|©¦ó$‘°Ð¬â»·0n²\Zv£-¤\Ë&\ÍV\åWÇš\ïüö¼×¾Ú’|gñ›ó34Z$Zf\ÖÁ‰;,\î¬l`¼µQœ)†\á\r\Ü\nøÊŠþ\ä\È|ð«†ðð\Ã\åœ	Ã‘E}c1Ë¨\ç\É8Ù©\Ï›,n%\Ê\ë™?j’m¸¨ÝŸ\äÿ\0ý(>|q‹«‹\Ï|\\\ãxûYM¼I\â¸g,„gu*tò\ÎžWT\Üd\á$\èI\Î6U\ì­÷•ÿ\0#ý´ô7OÒ­¾6^Ok¦YZiöò\êžøq¬\êr\Û\ÙA¼/¨k:¿ƒ\ïµmZöH\âSw©ê··º•ü\æK«Û»‹©dý\ßÀ_ðW\Ú3\Ã÷¶?ð›hþøƒ¥B\0¿ŠM1|1¬Þ€W\æƒS\Ñt\Û)Žu%JÀ6ß”´V™—ƒ^\æÔª\Ñ\Æxw\Â	V\çu*\à²,WŠ“©~y,nYGŒŒ\ÛmûHWŒÔŸ4d¥©ŽGô›úCðö\'Š\Ë|iñ*R\Âû%B†iÅ¹\Æ}—\Â4y}7•gØœ\Ë,©J**>Æ¦t¥\É(8hU?³\ßü³öø\ã=–¬\Ü^|(ñµ\ÒÂƒEñÍ›hW×²,\ÒIm¢x¶Ý¢³¹HR™5\Ë\r\Í3ºGmk3\Zý ‚r<‚\à‚:\ZþU™NT•> kõö#ÿ\0‚ø§\á6§£ü7øÓ©^xŸ\áeÌ¦\Î\Ï\ÄM=÷ˆ¼÷Št—÷³\êºr³ý«M5\å¬S4úl\Î-cÒ®ÿ\0‘<]ú\"G„\Åq…µ1x˜\á\áR¾\'„±µ^+\éAsKû?\ß\âjB)¸\åø\ÙU\ÄÖ³T1•«:xiÿ\0¤G\ÚC<\Û2\Ëø;\Ç\ê~xÚ”p˜²¼<0b*\ÉB\ëfWMýWF¤\ä”óœ®8|ñx¼³\r…|}/\éRŠ\Ë\Ñ5½#ÄšF›¯\è\Z•ž±¢\ëpj\Z^©§Î—6W\ÖWQ¬°\\\ÛOd’)9VR¿„*B¥)Î•XNJs•:”\êFP9Á¸\Î„’”g\'FI8´\ÓI£ýq£Z–\"•*ô*Ó¯B½8V£ZŒ\ãR•jU\"§N­*r…Ju!%8N\r\ÆqjQm4ÂŠ(¨4\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nþxÿ\0\à\ê\Ã\áø\"/\íc¦—ò\ï|y­|ðnžwm%\äý¡>x‹PP:¸“Eðö§(\í!c?\Ð\å¿ð{\Å\Ík\Âß±ÿ\0\ì“ðN¼6úgÅ¯Ž1×¼Al¿±ø_\á]\"{(YC\0\ÑÃ«ø\Â\Â\è–Hb\à1V\0\æÝ¦\Ø\\jº†—h¥\îµ+\Û[d\0’÷“\Ço\n€9%¤‘F\\\×û\êxB\Òü/ \è¾\Z\Ñ-c±Ñ¼?¥iú.•g\Ävºv™i••¼cŸ–xcrI\Âó_\âKÿ\0¢ø&¿´Wüƒö3ø;%—ö¯‹¾;x9õ3•fÒ¼7q/‹522h£\Ó4+¹f\È\Ú\"G\'€ký¼h\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯\Î/ø(\ï\íiqû:ü.¶ð¯‚µmñW\âb\Þiú5Õ´\ï\ç„ü5~^·\â¨\äŠ9\Z\rD¼\Ði>\Ý%œ\ßlº¼\Õ\ìn\Z_\ËŸ£RH‘Fò\Ê\éQ£I$’0H\ãgwv!QAff!TI\0Wñ\Ýûe|k¿øñûAx\ç\Æs\Íp\ÚEüžð­¤\ïo(Ó¼7¡O=½œòÁ\Zn·½¸k\Ígl­,‰qª\\)p0‰ýôcð\Ë\r\â,Vo‡†\'‡xN,\ß1\Ã\ÕJTq\Ø\É\Õtòœº¬Zjtj\â)\Ô\Å\â)\Ê2§[\r­†©¥u\â/§‡Žø\ï<yw\r\ã*`x\Ó\ÄLN#†òLe	8b²œ®•\Õ\â<\ë\r4\ã*Xœ>µ»^œ\ã_	ŽÍ°¸\ê›\íóó\Ïu<\×73Kqqq#\Í<ó\Èò\Í4\Ò1y%–YI$’9,ò;3»\ÌI$\ÔTQ_\ëBI$’I%d’²Il’[$Î«nM\ÊM¶\Ûm¶\Ûm\ê\ÛoV\ÛÕ·¸QE\ÄQE\0QE\0~\ÓÁ+¿k»Ÿø’\Ûömñ\æ eðÿ\0Š.e“á¶¥y>\â7Wš¼’°ŒX\ë\á´¤Ü’G­…²‰n_W‚;o\èJ¿…}\'S¾\Ñ5M7Y\Òî¦±Ô´›ûMOO½¶’Hn,\ï¬n#º´º‚X™$Šky\âŽX¤\Õ\Ñ\ÑYX\rg?³‡Å˜~8|øwñ05¹¿ñ‡­N½\r±„Gm\âKl5\èV&m£:µ\Äö\Ö\Ï+Iœ\Ö\á\É\'\'ü\Øú`xc…\áüó.ñ\'\ÃÆ†‰\ë\ÔÁg´iG–<þ7^–5%\î\Å\æ¸XV•h\ÅFø¬lDÜª\â\ä\Ï÷ökøñ\ãÎ¼\Z\â\\lñy¯\á(fœ%‰¯>zõ¸>½x\á1\\¥/\ÞTf5p\Ð\Â\ÊR“Ž5\Âà©ªt2\êiû}Q_\Å\Çú†QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0þx_ð|\Äû=S\â\ìðz\Úò7¼ðw‚¾>|@\Õì”ƒ,+\ã\Íc\á^…£O2˜,‰\à=]a\ÜH\âR›rû¿\Ðö¿\Êþðñ\ÝßŠ¿à±ž5ðÌ·o5Ÿ\Ã/_ü+ij[1\Ù>±\á©ü{r…\î\ÆK!\ê\Ë\åö€<+þ\rlð­ß‰¿à¸Ÿ±½\ÔVOwa\á;O\Ú\Å\ZÄŠ¡’\Æ\Ú\ÛöhøÁ¦i\×r“÷Tx‡UÑ Bo:hð,¿\ë\Û_\æ…ÿ\0Uü´ñ\í¿ûK|d»´YŸ\à\ÏÀ­J\Ón™sö=Sâ—ˆ¯tÑ±º,—\ZG†uˆ\Çv‰eô5þ—´\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEó\ï\í]\â\è¼û5üqñ$’\Ë¶\ßü[cc,\åLš®·¤\\\èzC\Å&AGMOQ´`\ÊC(RT‚¯\ã-˜»31$±$’I$ŸRy5ýkÿ\0ÁF,nµ\Øÿ\0\â\ÄV\Û\Â\Ã‡n\î\Ê0B-m|M¤Lû‰#(Ò¬H\Ë\Î\à\Ø\Æ3_\É5¥ŸBœ—ñNc_Œâ·„¬¿’†)ÀUÃ§\Ö\îxüLµ\è\â†_µ+6\ÆWñw\Ãü–¤po‡‹0\Â\É\Þ\Õ1Y¿fô1²]\ZT²Œ.¾\Ôd¯\ÑQEf\æ QE\0QE\0QE\0Wôƒÿ\0yñÌš\çÀÿ\0ø*\âõg›Á^8Ž\ê\Ö\ÉbDk+ÄºdRÛ´Ž	yMÖ£¥\êÌŒø\0Dc@l[ù¾¯ßø\"Î˜\Ðxwö€\Õ\È;u\rWá½Š·b\Ú]·Ž%aø\rQOü\n¿œ~•\ØL6\'Á>#­]\'W˜pö/xÅµ‰žw‚ÀI§-bþ§\Å+\Ã\Þi¸ü2‘ý³û=3v\éOÁl#q¡›\äüi–\æv”’–Ÿ\næ™¼#$šS‹Ì²¬º\\³¼T£¥\ÍŸ¸QE’§ý…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Œ—üñ~8Ábn\ïÁuö»-/\ãü6\Ó\ä$U´øG\áO|0+)+µ\'ð”\ãh\Æ\ÒJ\Zÿ\0f©%Ž\äši(¢F’YdeH\ã³\É#±\nˆŠ31\nª	$_\àÿ\0ûQx¼|Aý¦hŸ¬\ßh_üuø¹\âõ¸·ž<K\ãÿ\0k\"mÇ–óE\îý\Ý÷f€?ºÿ\0ø1\×\áÖ­a\àÿ\0ø(Ÿ\Åk\ËFM\Ä\Úÿ\0\ì\Ñ\à]ð¡5÷ƒ\ì~8k~\'…$<?—Œ<.YT|„\Ä\î½JþZÿ\0\à\Ð?‡þÿ\0‚Bh>3X•nþ,|zø\Ç\âi¥†–\×ÃºÍ§€mC6\ï.o^‚@\r€s¸\êR€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€>pý¯¼?\ÄÙ\ãw…­\êK\ëŸ\0\ë:¦od]^j~\ZDñ6›§Â 1v\Ô/ô{{˜;\Öá—½\Z\äH ‚	 Ž\Ç\ÜW÷i,i4RC*\îŽTx¤\\‘¹$R®¹RÊ’2#±¿Ÿ\Ú\Ï\à\å\ÏÀ¯Ÿ¼\0\Ö\ßg\Ò\íu©õO\rmVX¤ðÎ²\í¨h¦-\Í\Ü\í“-‹K<¾l³\ÚN\åW\î\ïß¡7QŒ8Ë‚«TQ¯:˜N&Ë©6¿{He™«W·½O“)vWrŒ\ç-6\Ïñ\çö§ø‹•_¼R\Â\á\ÝL%:\çXˆ¦þ¯S\Ú\Ô\Ïxv2²iS¯\í89Ë–1©N”.\åZ(ùÂŠ(¯\ï³ü}\n(¢€\n(¢€\n(¢€\nþ‘ÿ\0\àŽ\Ú\rÍÀk\×²Á»ñ&\â\Þ\Îy#(—¶š>‡¥©žÝú\Øc¼¿¼¶.8Y\àž?½Wó‹¦\é÷z¶¡e¦XA%\Õ\î¡woegm[‹›©R ˆ1U2K+¤q‚F\çeæ¿²Ÿ\Ù_\á\"ü\rýŸþü5tt\ÔtO%\æ¼%H\ÖUñˆ.n<A¯\Ã#Dò,Ÿc\Õu;«d\ÞÛ­­`\Æ\ÕWù\é‘\Ä\Øl³ÃŒ\róÁ\ãø›<\Â\Êy­8\åù:x\ÜV\'•n¡Œyu¥£öòiÞ™þ~\Ì\Î\Çg\Þ7\æ\Üp\éTŽQÀ\\+˜)\âT/Ny\×[)\ËðNOD\êeŸÛ˜¶\âÜ¢ð”\ã$£V\ç\ÐTQE˜\'û\ÔQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0|Ÿûy|Y‡\à?\ìGû^|h™¤Að·öjø\Ûã˜Œ;„\Æ\ï\Ã|E©Ø¤;~o6K\Ëx#ˆ/\Ì]”/\ÌE…\äó\Ës<\×1y®%’y\\õy%s#±÷fbOÖ¿\ÙOþø‘eð\Ëþ\×ûwjws˜fñO\Âøo§(`¦{ßˆ¾ \Ñ|$`‘luK\Ù@%\Ö6\\`–\ãO@\ì£ÿ\0\îü»øÿ\0gý†<¨mG[øs\â?ŠW­\"¢¸?~$x\Óâ­Œ$\"¨\Ûi¥x¿O²Œ¶_Ë¶M\ìÍ’i\ë\ç\Ï\Ù/Àöÿ\0¿eÙ³\áÕ­²\ÚA\ào€¿¼&¶\è¡DM x@\Ó%\0ö–\Ù\ÚC—f=M}@Q@Q@Q@Q@Q@Q@Q@Q@~MÁX~ø[ÆŸ­þ3[K\Ð<kðÑ¡²€\êz…½Œ~-ð\æ¥wûÿ\0\rÚ­\É_´\ë–W“6«¢Cn\é5\Ä_\Úöf+™nlþ\Í÷—\Çÿ\0\Ú\á\ç\ì\å\àk¿\Zø÷RX¾Ya\Ðôy#:Çˆµ%M\Éc§[»T¦\êòM¶\ÖQ2wE\åsö¢ý«~#~\Ô^1}o\ÅWa\á6y‡…|g4¿\Øú³¢Q*.µ)£ö­Ft7Ÿ•|˜vñT}<2\ã|÷Œrž9Ê±2\áük–+8«I\Ê9´T]<fI\Ã\ÉÁbã‹¡9á±µÜ•&\êsK\n4eþ}ý=|xð«„ü3\â/	¸ƒCŒ8ÏŒr¸\Ç\ÃXlDiÏ†\å\Ï\Zùg\æ\Ø\ÈF¬²\ÙeØºT±¹^\rE\âój´•Nž[SŠ¥ò\í\ÒøKÁ\Þ)ñ\æ¹i\á¯h:Ÿˆõ\Û\â\â\×K\Ò-&½¼›Ë\å}@Ž\í¶8\Ý\ÎùU@H\Æ\Ô4û\í*ö\çNÔ­\'±¾²žKk»K¨ž‹y\áb’\Ã4Rx\äÁWF•Wú”±w^xU^‹\ÅS¥\nõ0Ê¤xP«)Âi\ÑRö‘¥RtªBT\'*sŒ[p’_\à#Á\âã„§–\r\\E\\%,k¡Ua*b\èS£Z¾ž%\Ç\Ø\ÏF–\"…Z´#7V:ôg8\Æ5`\åNŠ(­Ž`¢Š(\0¢”H\0IÀ\0Iô\0u5ú?ûÁ=üuûC\ê\Úw‹¼wm©ø+\àÝ´\Ñ\Ü]\ê\ÒF-u¯G:g…a¹ÀŠ\çUÆ½</cew·Kû¤[Fùž.\ã\àl“\ÄO™P\Ër\ì,[\æ©$\ë\â«r¹C	‚Ã§\íqxº\Öj–Œe9k\'\Ë\Îqû¯|6\ãOø§/\à\î\Èñy\æw©\ì\èA¬.\çU\ÌsLd—\Õò\ì·\rÌ¥ˆ\Æbg\nPV„\\\êÎ9û7ü\ËöKºñß‹“öñ¾“*x\'Á·‚ ¿µ–8|M\â¸w\êV¾qX¯´a\ãšAö·\Z\Ã\Ço\r\Ê\Ü\é\Z„ýV†|3 x3\Ã\Ú7…<-¤\Ù\è~ðök¤\èºE„^U¦Ÿ§\ÙÄ°\Û\ÛÂ™f!Ay$gši\Ë4’J\î\í¹_\ãç‹ž&\æ~*ñ†3ˆñžN+‘\ån|ñ\Ërª3”¨Ò“^\ìñU\ç)\âqµc\î\ÏVq§j4\è\Âô©ôqð#\"ú=øk–ðNYVža›×¨ó^,\Ï\ãK\ÙK<\âM*p\Ä×„¿Kƒ¥N–+\Ã\Íó\ÒÁa\éÎ·>.¶&­RŠ(¯\ÌÞ‚Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( \ä¯þ-ø›¨x+þ	W\ài²˜\ÏÅ¿\Ú\çá§…5…2xCøyño\Ç7\0 Ê¿\Û~ðò²’nI*ª\Í\Çö1øD>?þ×Ÿ²÷Àù-£»ƒ\â\ß\íðƒ\á\Ýå´±´±Oa\â\ï\è:&¡±¨bñ5\åÇ˜ ¦\áŠþ\è?\à÷ŒV‘|4ýˆ¿gøgO·_ø\ëÇ¿µ`x-4þ­v^¡\ÚÞ»\Zž70q\Î\Þ?•oø7\ãÀ\Ó|@ÿ\0‚\Ê~À\ZDV²]&ñ\Æ\Ï\Ç7#2-¼?<;¯ø\án¥À\"8\á¸\Ð Ä€²4|\äŠ\0ÿ\0f;Khl­m¬­Eoio\r­¼j0±\Ão\Z\Å(\0‘¢¨€X¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+\ä\ßÚ¿ö»øwû+x9µ_HºïµhgÁ\Þ±¸E\Ôu‹\ÄB\ïQ“\æþ\É\Ð-e(oõ9QÜ¯ú=…½\å\ã¤\Ïÿ\0lŸÛ—Àß³‹q¡i²\ÚxŸ\âÎ£fÍ¤øbVXtA<g\ìÚ¯‰\Z6Í´<‰mt\í\Éw|¸ˆm	¸?Ë§ÄŸ‰^3øµ\ã\r_\Ç^<\Ö\îõ\ïkW\r5\Í\ÝÜ…\ÄQ\äùV–±ñµ²½´)1 h (þ¯ð\è\áñ®Šx¾Ž\'-\àªs\\6ß¡Ž\âguO\r-*a²¦Õ±øÚ¦\"7¡jR–/\rþx}/þ›\ÙGƒ”qþxkˆÁg¾)V¥:†9{<^SÀŠ¤ö¸\Øû\ÔqüE\Ë.l&O\'*8râ³„\á\Z9n?¨ø\ßñ\ß\â?\í\ãmC\Ç?µ©5û§t°\Óa2E£h:~öx4Ä»¥¥•¸l—¸¸}\×s\Ü\\\É$Í“ð‡\á¾9x\ëGøyð\çCŸZñ¯!$ŒÅ§\éV•7ºÎ³|\Ã\É\Óô«\Ø=\ÅÌ§.\í¥¬w\×6¶\Ów¿³\ì\Éñ+ö˜ñ”ð>š\Ñ\éÐºI¯ø¢ö9SD\Ð,w%\Å\åÊ©.\Ý\Â\Þ\Î\"nn\åT(q#\ÅýP~\Í³\Ã_Ù‡Ái\á\é\ë>¯¼¾*ñ}\ìQ¶¹\â[ø“\ï\ÜN6\Úm¼/ön“}–\É\Øù\×r\Ü\ÝOýk\â÷¼)\àžGC†8o	—\âxšž\n|Ÿ‡0‘<»#\Ã((\áñY¬0\î.…\ÅûJJ¬sW\ç¡Jr\ÅGü\èú7}<BúTq^/Žø\Û2\Îp\\[6«‹\â~6\ÌgR¾u\ÅXÿ\0kÍË¸z®25V/9^Ž/5«\Z¹~R<^&”2\éñ²_\ìqðóöYð¼P\é‘A\âˆ:²x\â\ê\Ù\åÄ²$f}?GVM;FI@¬g¸P¯w$„*F\Ï\Ú+öøûIu_ø~\rxÝ•|¿x2X4vržk,zÍ¼–\×Z>¿’H¢yõM:mY`-\ìu[¯±h¯ó>^\"ñÄ¸¦¿\ZÇ‰óz<O‰ª\êVÍ¨b\êP¯(¶ŸÕ¹)8\ÑúŒb•8\åþ\Ë\êQ£\ÑT=šQ?\ÝJ^	øQO\Ã\ì\'…r\à.\Äp„h\áøs—\Ò\Å\áaR)\ß\ê\×U1r\Î\'RS\ÄT\Î^#ûVx©\Ï,c¯\'Qÿ\05\à‘Ÿ<%=\Õ\ÏÃw@ø—¢Áf\×*I_\rkòN²\Ê\r”z=\å\ÍÝ´Î°]$‹Us3´ˆ!B‹\æ|Q¬~\È?µ&‰rö\×³\ï\Åùš3ƒ6™ðÿ\0\Ä\ÚÍ¦?¼/4:ö\Óo©ó°>•ý•\Ñ_\Ðù\Ó+ÄŒ·\Z\ÖW\Ã\ÜG(F1Xº¸z\Ù^2£[Ê·ö}H\à¥)Ó¬\äq‡\ì\ÇðC;\ÆT\Åð·q§Â¬\å/\ì\Ú\Ü.–Q\æwP\Ãÿ\0lP©š\Æ\Ö\Ë›be¯\Åd’þ0´Ÿ\ÙköÖ¯NŸeðK\âzÞÀ[\Þø\'\Ä:tŒS\ïú}¸m¤ƒØšúW\á§üÿ\0ö¯ø‚\ÖW\ZŸ…t¯‡\Z=\Èi$Ô¼{«Å§\ÝD‘\\f‹þ\Ý2=WÄ±\Þ2+\Íiþ“aip¾Yk\ècH?ªŠ+»8úiñö.„¨\äü7\Ã9=I«}j²\Çæ•©\é+Ê”jbp¸e;¸¸{l=hG•©B|\É\Ç\Ë\á¯\Ùu\á]‹§‰\â^8\ã¾%¡NNO/\Ã<Ÿ \Â×´ \ãORŽŽtùUH\ÔXlf¬¹\á(V¥\È\ÕO\Ì_\Ùûþ	mð?\á,öú\çg“\â÷‰\í\Ùdˆ\ëv\éþµ–)Œ±K‡’{Æ¸ua©_\ÞÛ³\Æ\\[®\í«úk0\ÛC½¼1[\Û\Û\Å0Ak0\ÃŠ(¢Œ*Ghª‘ÆŠ¨ˆ¡T\0\0©h¯\æ-\ãŽ,\ã¬\ÃûO‹3\Üvu‹2£õ™\Æ8l,fÓ•<\n„i`ðT\ä\Òr†…(É¤\ä›W?¼¼9ð£Ã¯	2o\ì¸K)\á|¾n\ÄýF”\êc³\n”\â\ãN¶iš\â\êb3LÒ¼\"\Üa[0\ÆbjB-\ÆŒ}Ð¢Š+\å\ÐÂŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( óÿ\0ƒ\Ô|cwªÿ\0ÁL¾x1n\é~ýŠ¼	¨-°$˜u¿|hø\ï&£#|\ÛG¥i^\n»bÌ¬<\çþ\ßø[a\ã\Ïø*÷Š|a©Y¥\Êüý”þ(x\ÛJš@\Øõ\ígÆŸþZ\ÏAý\é\Ò<a®Ä a¶;°8R\Èðs\Ç\ÆûŸŸðX\Ï\ÚQd¸I\í>\Ã\á_‚\Zb\Æ\á\Ò\Þ\ßÀ–\É{o\Ç\ë®k\Z´“\'UšI7|\Ä\×\íGü\rð³RŸ\ãO\íÁñ¶[4}3\á\Ãß…–:‘S†Ôµ\ß\Í\â\ÝV\Å\ÊZøwFžU8xI­\0¢eQ@Q@Q@Q@Q@Q@PN9<\É\'µ\0ù_ûwÿ\0ÁC4º‡\Âï„·6Z÷\Æ\È$·\Õ5Uh®ô‡J‹‰\î\ã\Û$:Š$\É\Óô‡ÿ\0GÓŽ\Ûý`:-¾™¨ù\í\Ïÿ\0+²ð\Ê\ë	?g­Z\rG\Ä\é:g‰þ\"\ÙH³X\è\î3\rÆŸ\á[„-\å\êñÏ­F\Ío‚škM 7?÷\××º\íÞ£¨\Ý\\_\ê\×]\Þ\Þ\Ý\Ê÷WwWdž\â\âyI,\Ò\È\Ì\î\îÅ™‰$\×÷\'\Ñÿ\0\è\Å[5–|IÀÎŽT½ž+&\álT%N¾d\î§GQ’S£—m:9tùj\ã½\Ù\â£\îqŸ\äÿ\0\Ó\é\åC‡\ãšø[\àvkO\Ä½\Ëø£\ÄHV\Â\ä{\Ó\Ä\å\\+ˆƒ•<NsñR\Å\ç”\ÜðùO¿K-•\\\Óý¯*¿\âk¾,Öµ/ø›V\Ô5\ÝwX¼žÿ\0TÕµK©¯o\ï\ïn\\\É=\Í\Õ\ÕÃ¼²\Ë+’\Ì\Î\Äö\è\0¯©ÿ\0d\Ø\ï\â\íS\â\ä¶Ò ŸAøy£\Ü\Åÿ\0	‡.\í\ß\ì\àIý•¤†\Ø5_]\ÆG“cì´‰\ÖóP–\Ú\Ü\ÄfõOØŸöñ_\í\'«A\â¿G¨x_\áp¦÷X0˜o¼I,.<\Í+\Ã\Âe\Ú\åˆ1\ÞjE\Þ\ÄnUÝ&?\é\ÓÀ^ð‡\Ã\ni	ð.…c\á\ß\rh–\ëoa¦\ØD#AÀ2\Ü\\IÌ·W·/™®\ï.K‹™™¤šFcšýsÇ¤v]\á\å\nüÀ\ï	\â\è\Ñú­|E8S©–pµ5\ÅÒŠö8ŒÒ”,¨`,ðø6£<ld °u¿œ>ˆ\ßBl\ïÆŒVÄ¿a˜\åž\ÔÄ¼~^­z\ïˆ_k:¯6±X<ƒW™\ã3Žx\ãs5)\ÓÊ§U\æxns\à\ïÁ¿|\nðF™\à‡š4ZV§¢´\Ó¯¨j×¥BÍ©j·aU\î\ïg#,Íˆ\â\\Co0\"F¾§Eþecñø\Ü\ÓŠ\Ìs,V#\Æ×©‰\Å\ã1Ug_‰\ÄU“JÕª\Ôrœ\ç96Ü¤\ß\Ü»¹>O•pþW—\äy]ƒ\Ê2|«	C–\å™~–Áá ©\Ð\Ãap\Ôc\nThÒ„TcE%\ê\Û\n(¢¹H(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(\'\0“À’x\0¤š+Ç¿h\Ûü*øñ\Ë\â…\Ü\Ëmkð\ß\à÷\Ä\Ï\Ü\Ü1\ÂÁo\àÿ\0k~!šf9X£Ó™\É\ÈÀ\\\æ€?Åƒþ\n«\âdñ—ü\ëþ\n%\âh/F£g«þ\ÜµMÆ—z³ý¦9´dø\á\ãˆ4_\"pÎ²[¦•œv\Æ6ò„	ˆÂýøÁ•¾\n]#þ	­ñÿ\0\ÆòÛ¤w~1ý³¼g§A?”Yô|ø%·\ïq¹\áMSV\ÖQqT‘f f\'ü\Ð|u\â‹\Ïø\ß\Æ>4\Ô$y¯ü_\â¯ø¢úi	2Ky¯\ê÷š­Ì’’]\æ»vbI%‰\Ï5þ·ðk¯À\ËÏÿ\0ðG?\Ù\íµ+wñ‡XñŸ\Ç2~[?\ßZG£±\È\Ãhº6œ\É!\Îø\Ê;v\Ðô-EPEPEPEPEPE\Ïø¯\Å~ð7‡5x¿Z°ð÷†´)ucY\Ô\ç[{+H°’H\Ù,ò;$6öñ,—W2\Ãkk\×E\éFlEjX|=*•\ë×©\n4(Q„ªÖ­Z¬”)Ò¥N\nS©R¤\åB‹”\ä\Ôb›i\âq8|¾3^Ž	…£WŠ\ÅbjÂ†\r‡¡	U¯^½z²*4hÒŒªU«RQ…8FSœ”Sf½\åå¦Ÿiss••œ\Ü\Ý\Ý\ÝJ–ö\Ö\Öð¡’i\çžVX\âŠ(ÕžI•QAf \nþz¿oø(ý\çŽ\äÖ¾\nü\Õg°ð0óô\Ï\ZüB³&ÿ\0\Æl£¹\Ñ<12þûOð 	²ÿ\0V\â¿ñ)y,\àžIŸ\Ä~CûoÁC<Kñþ\çQø{ð\Ö[ÿ\0|!‚y-\ç\É6\Ú×\Ä2ü—š\ÉF-i¦HcYm4To‘H“Py\îJGgùR\Ï,p\Ã\Ë,®±\ÇjY\Ý\Ø\áUTd’IÀ¿Ñ\0>Œt²‚\ão°”±\Ü}ž/&\áª\ê5p\Ù<´©K›EÞž#4†’¡ƒ|\Ô2\é%V¯µ\Ç*kþ\'ý0þžŽ0Y¯…¾	\æ5ð|)?m—ñ7aeSŽ\âh;\Ò\Äe|;QrVÁpýE\ÍK™.L^w*u‡\Ê]I\æ\ì\Ë3wf\'Ü’­~µ~Áÿ\0ðN­[\ãúoÅ7º\Â\È^+¿øvO6\ÏXñü±¸e²m;ÂªW^—z±&8\Å{ôö?\ØKþ	±-\ãh¿hM%\á²V·\Ôü-ð\Þþ“^\ãlÖºŸŠ\í\ä\à´\'d¶ú,Š³\\®QH£o²·\ï40\ÅoPApAi0Â‹P\Å\Z„Ž(£@©q¢„DE\nŠ¨\0\\?H¤\ì2\ï®ðW†¸øT\ÇÚ¦:\â¼,\Ô\é\à^°«\È\ê\Æñ©Œ\Þó89S\Â\ë–*Øœ/«ô9ú\Ô\Îÿ\0²üRñ\Ë)©C&ý\Î?…ü=\ÇÒ•:Ùº´j\á³^+\ÃMFt2·\î\Ô\Â\ä5c\ZÙ»<\Ò4ð\Ø}\rF\Ò|;¥Xhz›e¤húU¬6Zn™§[\Åieei†\Þ\Ú\ÞX\âŽ5\0U§$“ZtQ_\çœ\ç:³J“•J•%)Ô©99\Îs›r”\ç)7)JRnR“m¶\Ûm¶³´©R¡J\n©Ñ£Fœ)Q£J§J•*qP§N8%S„Œ!£¥¤’AETšQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@W\Æ·\í\íû7ÿ\0Á9g\Ïþ\Ñÿ\0´ÏŒ\Ã\ÞÐ£’\Ó@ð\æ“¶¡ã¯‰>,–\ÞYtŸ|=ðý\Å\å‚\ë~\'\Ödˆ\Ç¹½Ó´]&\Ø\\k^$\Ö4O\Øj:­ \Øw·¶zmÞ£¨\Ý\ÛXiö\Ó\Þ\ß\ß\Þ\Ï­•¬O=\Õ\Ý\Ý\Ô\ï\Ö\Ö\ÐFóO<Î‘C<’:¢’??k¿ø8³þ	7û^\ëžñ§\í+¦üNñþ‡¦’ü=ø\r¥^|U\×eÕ´©¢†oÏ«\è{|¡j³™\Ù7Š<U¡i—	Œ5%w§üoþý·?\à§~%\Õ<7ÿ\0	£û<þ\Ì6÷\Ðxgö{øi\âû{]SOž\ê)`\Ô~-xº\Ö=/Rø™\âO\"\Ö\Ò<]\Ûiž\Ò\n\\Ÿ\røSH›SÖ®u_ÁbI\äòO$žôþ¿\à÷_\Ù;L×¡·øWû~Ðž4ð»\ÃO«øû\Ç_¾\Zx‚‚H¸Š?\rø||V\Óf‚<ÁñlRN\ïm­HÁ\ì|\rÿ\0²~\ÂzµÍ­¿\Ä\ÙKö¨ð\\sÈ‘\Ü^øzo…~8´²V 4Ò­ÏŒü},QŒ³{)g`>HXñ_\æ“E\0´÷\ìyÿ\0»ÿ\0‚^~\Ýö\ÞøûYø\ç\Çw	¤\Æ>|GµñÁÿ\0Í©\ë,cµÐ´M#\â~‘\áX|k¬$\á­\ç·ð\ïŠ\âI²\ÜI‘K\'\ê\Õ€ýö—{k¨é·—Zv¡cqÝý\ÄÖ—¶wV\î²Áskunñ\ÏoqŠ²E4.’Fê®Œ_\Õ÷ü\Ëþ‘ý¤?b_\Â¿l\íC\Å´§ì¢‚=\rv\æe\Õ~8| ±K=6\ÃK¹ðÖ³©]@ž:ð¦’º{ý·\Â>!»ƒY#T¾\Õ4¿¼\Ö6\ÞÔ€?\ÔÂŠòŸ¾~\Ò\ß¼ñ\ã\àGt‰\ßþ(x~\Û\Äþñ¿†n^\ãKÖ´«‡–\ÞTx§Ž\Þÿ\0K\Õô­B\ÞóEñ‡u‹M?\Äñªxs\ÄZf—®\éz†Ÿm\êô\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\æ\çü#\Ç\Ú_\Ã_ø%OüGÄº­É´Yÿ\0c_\Ú\'\Â\Údª@c\â|+ñGƒ|5\Z\îeÿ\0Y¯kºz°S¿am€¾ý#¯\æwþ\Õø¡yð\ãþ\åñL°¸{yþ+|døCð½\Ê;!š\Îþÿ\0Yñv£n\ÅH,“i\Þ\rºWCòº\åXH òi<’x\0w¯öüÿ\0‚SxE¼ÿ\0\Äÿ\0‚yxNX>\Íw¤~\Å³z”%v\Ö.¾ø6ûYÜ§\ÇUº¼f\ÏÍ’s\ÎküW>xo‹>|,·P\×þ,ü9ð\n\Ù\ÃM\ã/h\Þˆp_QPp	\Ç@kýÚ¾x2\Ç\á\ÏÃ¯\0ü=\Ò\Ò8ô\ßø+\Â\ÞÓ£ˆm‰,|/¡Xh–‰\Z\àb5·±P`a@(µ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šðo\ÚöŒømû5x\ZüB\Õ9.>\Ñm\áŸ\rZ\Ék\Þ,Õ¡‰dþ\Ï\Ò-X–ò¡ó!}KS•E†•±Iw(’{H.}«*Ì³\Ì\Ç”døNe™\æ\á†Á`p”¥[ˆ­=¡NœSn\É9NNÐ§N2©RQ„e%\ãñ\ä|)’f|IÄ¹®$È²l%Lviš\æ5\á†Áà°´’\æ«Z­F’¼œiÓ„yªV«:th\ÂujB\î>\'üRð/Á\Ï\ê¾<ø‹\âOøoHˆ¼\×W%ž{©\Ø#O\Ól\âs¨\ê7l<»[+H\äžV\É\n]\×ùgý²m¿~Õž$ûý§Â¿	4+×—Âž‚\åÉ¼š#4PøŸ\Å\ÒFþN§\âI\à•\Ò\ÞLðõ¤a¥¬·3j\ÚÎµ\ç´\ç\íUñ+ö ñŒ¾ ñ…\ëXx~\ÊY“\Ã°¹œ\è~²fùDQ¿–/5	QP\Þ\ê·-\ÕÜ€q\r´vö¶þ\à¯x§\â\'‰ôx3D¿ñˆõ\Û\È\ì´\Ý/N\î.\'šCÔ…b†$\r5\Å\Ä\Í½´\Éqq,PE$‹þžxôy\Éü/\ÂG‹ø\Êx,o\Ã\r,K­Zt\ÞUÂ˜uIÊº\ÂÖ¨\Õ\ã¡Ocsiµ\n4Ô¨\à:>\ßŒÿ\0þ–Lþ&ñó1©á¿†Tó\\¯\ÃZ¸\êxapÔ±\âñ’¯\nxIfj	\âieu1\Í\å\\9N2­‰«*x¬\ÕVÅ¼&+\ÂÓ´\ëýZú\ÓL\Ó,\îu\rBþ\â+[;+8d¸ºº¹\Ö8`‚•\ä–YdeD™™‚¨$_\Ño\ìÿ\0\äÓ¾C¥|]ø\é¦\Ûj\ß\æH/ü5à«¨\ã¹\Ó<\nÙ ¾Õ‘·Ã¨ø¬$5ž€Gi\Õ6Í§ú\×\ìMÿ\0þð§\ì\écc\ã\Åaâ¯Œ70,Ÿk(—ZGƒ<\Õ\ìô21\çj)“Î¶Ê²1\Ìv+o\æ—ô’¿	ú@}&ªñ\Z\Æp_‡x\Ê\Ølº˜lãˆ¨¹Q\Ä\çqø*`ò\Ù{µp\ÙTµUñ\æ#1\î\ã\ì°N¤qŸÖ¿CŸ –‚žYâ‡9n\Å\éQ\Çp\Ïb£O‚\áZšU¡™ç¼ðø\î\"§\î\Ï‚j¦$¨½¼\Þ#4\å…Q_\Å\'ú–QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0q¿> xC\áG€|kñC\â·i\á¯ü;ð§ˆ<m\ã_š/†|/¥]kZÞ§p#W‘\ã²Ó¬®\'1Ä’M.Á1¼®ˆ\ÇþMÿ\0cø¥ÿ\0Yý«5ÿ\0\êzŽ¥£ü\0ø©jþýþ»ˆ\ìü1\áž8¥ñ­,b\Ô<a\â\Ói£¬jR*˜-þÇ¥\ÚEo£ù\ßÛ‡ü3ûo\ßüýƒþ~\É^\r\Ö\îtŸ\Z~\ØˆñjCg¼]|øB¶^$ñuŒZ˜M*ûSø©|&·\Ì$º–‰t¹D–7W‘¿ùƒPEPEPEPõ\'ÿ\0\ÈÁcüIûþÓº\'\ì³ñ\Æ\Øÿ\0ö–ñu–“¨\Ù\ëWÏ£ü$ø¹­-¶\áßˆú0&FÑ¬¼C4:_†|v–±›MF\Ähú®£	—\ÃÖ·–¿\ê\Å‰*$±:Iˆ²G$l$G‘\ÑÔ•de!•”À‚	¿À, AA‚\èA\èký‘ÿ\0\à\Þ\ïÛ“Rý¾\à–\0>(x¿V}g\â¿\ÃHõO\Ù÷\ã%\ì\Ò\Ü\\\Ý\Þøó\áJiövZ\î£y=½´wZ·~\ê~ñö¯ö(…Ž§â«½*Ý˜X1 \Û\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nþ-ÿ\0\àö/‹ú^‹û\r~\Ë_\Öx\×_øƒûQ\Ãñ)`\Ü|\çð\ï\Ã…¿¼?~B†\Émc\ân†\ÌÌ¤ùF›?\ÚEœ?ü\ïã»‹\ÏÚö%ød&?eð\çÀ?ø\í\í\Ãyþ4ø‡\'‡ã™—±òü\"#wù\Çj\0þf¿\àŸ\â?üCþ	\ã\áx¢i¢\Û#öv\×5\Ö3&\íÂ¿ü1\â`2€p¦h÷J\ì~TV,\Ü_\í»_\ä»ÿ\0›|)\Ñþ(Ác~\ßkVyÂŸ„ÿ\0>+Y*\à,\ZÆ‹§\é>Ñ®\äÜ­ò\Ûj>+·‘q†2ˆÀe\Îkýh¨\0¢Š(\0¢Š(\0¢Š(\0¢Šü÷ý¶?o/þ\Ì:\\þð\ÛXø¯\ã>§e\æXx}eI´ÿ\0Áu{]k\Å\Æ)‘4±È·:^†¥/uü»©Í¦›,7?GÂœ\'Ÿñ¶yƒ\á\Þ\ZË«fY¦6V…*k–\ZQk\Ú\âñu¥jx\\%%*ØŠÒ8\'\Ý\Îp„¾\'\Ä?8?Â¾\Ìø×Žsœ6GepN®\"»r­Š\Ä\ÍK\êù~]……\ë\ãó,d¢\á…Áa¡:\ÕZ”\í\ZT\êÔ‡ª~\Õßµ÷Ã¯\Ù[\Â-©k\îºÿ\0õKy?\áð\ÜP\êZ´ü¢^\ê2‘!\Òt%\Ç\Úõ)!–G\nð\Ø[^\\ƒÿ\0*\ß\Zþ7üGý <u¨üAø™®É¬k7Ÿ¸²´…^\ßEðö•³\Ú\è~\Ó²Ç¦i6›Ù’ ò\Ü\Ý\\I>¡©\Ý\ß\ê—w—\×\Ç\Äˆ~2ø¥\â\Í_\Æþ<×¯¼E\â]n\å®/µ+\çVv\É>\\\Ç\Z¤6Ö¶\éˆm­m\ãŠ\Þ\ÞH¡‰#UQ\éß³\ì\Ûñöšñ\Ü>ðŸ‹[_³\Ýx£\Ä÷ˆ\ë¡øSIšFAªN¸\ß4\æ9“M\Ó`&ûSž)R\Ý0^\\\Úÿ\0©žøAÁ¾ð\æ3ˆ³\Ìv®{­\Ä<Wµ,._†J2©€Ê½ª\ç\Ã`UNX9(¬nk_\ÙûXÿ\0º\à°ÿ\0\à\Ò\é%\âw\Ò\ãò\Þ\áL«7\Ãð\\\Ú^ðó+\æ\Äcó|sr…ßˆ>®ýž;6•/iYFRy_`ý¼hT\Ó1\Íq¼7Â„ž>ø\Ù\ãM+À_´½\Ä\Z¬Ê‹*R\Ò\Â\Ûr‰õ-Võ‡\Ùô\í6\Í	–\êò\å\Ò(\Ñp7H\Éÿ\0Sÿ\0±\ç\ìa\à_\ÙS\Âhcž&ø£­ZF<aã§¶*Ä¹¾…á¤|ý7Ã¶’\\‘\îµ4K¨jKzv›\è?³_\ì¿ð\Óöbðd~\ZðE€¹\Ö/\"¼Q\ãø¢:\ï‰/#‹\ÜJ£º|R3ý‹K·+kj„\çNdžO£\ëø\ÏÇŸ¤^e\âMZü5\Ã2\Ä\å\\F­ª\'\ÍG\Äs¥$\á_1IóQÀFqU0¹m\í)(\â1¼õ\ãB–ý9ú\"}\nrOðøN9\ãºx ñ[‡½VSÁ4±J®&”\ãË‰\Îe	:8üõE8A\ÔÁe~\Ï	<V\'2(¢Šþ\\?¿Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ó:ÿ\0ƒ\Ù|s«jðPo\Ùc\á¬\Ò¡xKö6\Ó<s¦Ã“¶=[\â\Æß‹úµ(^€\Ëgð\Ã@V=XB ý\Ñ_\Æe]ðz.§%ÿ\0ü_\á\r£\Û\Å\nh¿°\ÇÂ6)c¸i\Þ\ífø\ÙûF\ë\r4ñ›xEœ©&ª\Ö\Â\Õd»\r^…k³kmü‹\ÐEPEPEP_Ý¿ü\áû|~\Íÿ\0³Ÿ€?l‚Ÿ´—\í-ð\Ã\à¤^&ñ·\Ã_ü5\Ò>1üOð§\Ã\Ï_Ü®¯h.—\Â\Ç\Åú®“g{­\ê|65˜\ìg–\à\Ùhús\ÏŠqü$Q@\ïmðû\â\ßÂŸ‹ZTz\ïÂ¯‰¿~&\è“ –g\á÷<7\ã=*X\ÉÀ’=CÃš–¥h\èO\Öb¹\ï^…_\àc\á¿x\ßÁ·w\áø«Â·Hr—>ñ¯¡\Ü!\Îr³iw–²)\È†Šú\Ï\á¿ü»þ\nðŠ\îÏ‡?¶÷\íS\áf¶\Ù\ä\Ú\Ùüuø‘s¥¨Œ†EmQñ\r\æ‘\"‚\0)%“«/\ÊÀ¯þ\ãtWù|6ÿ\0ƒ£ÿ\0àµ¿4\Û]\'þ\Z³Nñí¡ÄŸƒ¿|Q©J\0mÖ¾<a\â Bò\Ó\ê²>I!Á$\×\Þÿ\0\àó\ßø)„e´O‹?¿fÏŒ0ºý¬\Ù\è(øo«\ÞD!o´}Y\Ó-§aÿ\0-SAx\ä[cŠ\0ÿ\0Oj+ø/ð‡ü\à[…³Ç¿ðNi¶\Ô.ü!ûKhþ#RøQq5žŸ¬üð±\n[{\Ãm>¦\ÅF\Ø\Þ\íˆ2Ÿ\Ñ?‚ðx‡ü³\â$\Ð[|T²ø\çû>¼Šžu\ïŠ~j<\ÒmÝ¾øi¾/Šuy3Õ¢\ÐÙ˜r©Ÿ–€?«\Ú+ðÿ\0ÁŸðr/ü/Ç·°iú\í\ç\àk[«–U„x·\á·\Ç‡ðbªª÷ž<øW\á»8‰,8–\á1\É<+úqðsö¸ý—ÿ\0hKX/>üøKñB+˜ü\Ø#ðwŽt\rbñ\Ónò\ß\Ùö÷¦ýv¯\ÌÁí”¨p4ôEQ@Q@Q@Q@Q@Q@Q@”ü\Íñ²\ç\â¯ü\Æ^2Ó¿gß‚~i\è¥HY57Røµ©±\Û\ÑÎ£ñ:x˜?\Î\n	\Úõ~¯ñxÿ\0‚óø\×þ\ïø,Gü#^[•¼Ž\×öˆñ/„b$\Æaøc¥x(\ãu,¥!O\rˆ—iÀ	@¹ðe\Ã­cöòý§¾.I§\Ï&™\à_\ÙV÷Áqj@²\Ú\ë>?ø©ð\ãS‚ÕO´\Ü\éž\Õ,\r\Ân@bú^Wðýÿ\0Cø2+?\Ù{ö\ßø†m#ø‡\ã\ß\Ãÿ\0%ñˆy\Íƒ¾É®Ih³»\ËGñ\ÔS<JB\î‘;þ\àh\0¢Š(\0¢Š(\0¢‚p	<\É\'€\0\êI¯\Ã/\Û\Çþ\nU“\ë_g]efºCq¥x\Ëâ†›+ ‘I†\ïFð=\äL¢Y‡†ó\Å3Ã\Ñ\èrH\êg\ï|:ð\ã‰üN\Ï\éd<7„u\Zä«˜\æ5”¡—e9K–X¼uuÊ´’£B\nXŒUD\éÐ§6¤\ãù^7p\'€üˆ\âþ8\ÌU(\Ë\ÚP\ÉrL,©\ÔÎ¸2Œ9£—\å8I\Î¤—4%‹\Å\ÔpÁ\à(\ÉV\ÅÖ§SU=»ö\ëÿ\0‚Š\èÿ\0mµo…Ÿo¬µÏ‹sE5–­\âXo´_‡fE\Ø\í±Ä–š¿Š\ÑY¶œ\âm?I˜-Æ²—\Z\é\ÍÎ³­jþ\"\Õõ-_Ô¯µoY¾¹\Ôõm[Sºš÷QÔµÙž{»\Û\ÛË‡’{›«‰\åši\ä‘Ø³1\'5Fyæ¹š[‹™dž\âyY§™\ÚIf–F/$²\È\ä³\É#’\î\ìK;\ÌI$\×\èo\ìGûø»ö˜\Õ ñ—Š\ã¿ð§Á2ómÖº\Ñyþ/¹´ŸmÖ\áDš(\Þ7¶\ÔõÂc§\Ë\æ[@nõg¶·ÿ\0Qx[„¼9ú8p6/0\Å\â\è\á\Ô)Sž{\Äx\ÈCûS<\Ç(¿eƒ\ÂQ‹•GOžnQ…s8óÕ«*µž+?ð+üFñ·\é¹\â¾]“\å\Ùn\'*•\ëS\á>	\Ë*\ÔY	\åNpŽ\'2\Ì15:\np¤\é\Ô\Ï8“09×’§‡¡\nh\åùe/*ý“?c¯ˆ¿µO‹\ÓFŠOøJº€x\ÃÇ·–\ìö:]»~ñ\ìt¨Y¢þ\Øñ\ÌJV\ÓN†EŽ\"\és¨\ÜZY5¿ªOƒ>üð.™ð÷á¦‡¢X-\ÝÔ‚)µŸjq\Ý\ë\Þ\"\ÔR[S\Ö/|´ó§1\Åoo\nCa§Z\Øé––vVýO<\á†~\Ñü\àm\n\ÇÃžÐ­R\ÓN\Òôø„qFªù¦s™n¯.3]\ÞÜ¼·WS³\Íq,’1c\×Wù\é\ãWŽ¹ÿ\0‹Y—\Õ\ã\írŽÀ\×sÊ²T»­8\Þ0\ÌsyÁòb±ò‹~Îš¾NNŽJ¤±¬Oû9ô\\ú%ð\Ñ\Ó$X\Ùý[ˆüI\Íp±§ŸñuJŽœ\ÔgS$\áºuc\íp=9\Å{j\ÍG›Õ„q\çNŒ0x	EW\áõ¸QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEüÁ\í²Æ§©xGöCý²´[	f\Ó|/«x«\àŽ®­\í4\Èm\ì›\Ä\Ñ/Œüq¨Þ´ñ\ê\×\Ó\ßK¢x¦\Ê\Â\Þ;{‹[­.Iak´Wÿ\0=ªÿ\0s¯\Û\×ö9øsû~~\Èÿ\0¿dÏŠ>e¯‡>.xB\ãJ°\×\íbIµ/x¿M¸ƒZðO4µg‹Ì¼ð¿Š´\í+Vk3<\ê\Öv÷z-\ì‡NÔ¯#ñBý¨¿f‹¿±\ç\Ç\ïŠ³g\ÇO\ÜøS\âw\Â_xk\Ä:|\É0µ½HH›Jñ‰s4PK\Ã~\'\Ò&²\×ü9ª¤k¥£j6Wj©\æ”P¢Š(\0¢Š(\0¢Š(\0¯ô\Úÿ\0ƒn¿\àŸ²\ïÿ\0\à“\Þñ¯\í“û(|ø³\â\Ú;Ç¾\"ø­\á½k\âƒ|;\âoAð®\â\ÃJ\Ñ<šO‰\Ôø‹\ÃV·«c­j\çO\Óu[/4jP\\\ÜF_\É+ü0Á\"\à›¿à¨¿¶\Ç\Ã/\Ù\Ë\Ã6šŸ\Ã\È/añ·\Ç\ß\Ù*¤¾x~öÑ¼Sª}©\Õ\Ò-w_y\ìü\à\Ø|›¯7Å¾\"\Ñåº·\ZM¶§wiþ\Ñþð\'„þø#\Â_|¡i¾ðg¼=¤xW\Âþ\Ñ\ì­ôý3H\ÐôK(tý:\Æ\Ê\Ê\Ò8m­\á‚\Ú\Ô$Q\"\ç-Œ“@‚_?\à\ÖOø\"—\Ä‰\ï!ý—u\ß\0]\Î]ŒŸþ4ü]\Ð\í\â.K#J\Ô<a¬\è±\'\äE\Óv UB|µðOÆŸø2óþ	\ã\ãGÁ?Ž´_ÁmY‘„Sëº‡†>,\è±\ÊI*Í¤\ßiž\Ô\äA\nb#\ØõÁ‰5ýˆ\Ñ@\ç£\ã_ø1\×\â³\Ìÿ\0\à¡þ\r\Öc,~\Ïk\ã_\Ù\Û[ðÓªö_\è_¼V¬Þ¬šrökó\ãüóÿ\0]øq¨y?	\àø+ûDi­¿mÿ\0„þ%h>¹P •ótÿ\0Š—¾UgÀP\"½U\ÌûAjÿ\0Tª(üp|mÿ\0\áÿ\0Ák¼\Ô\Ú\ç\ìñú\Þ\Ñ$’Yü!\ãÏ‚þ>VŠ0\Ä\É~ø•\â	\äT°E‡\ÍÁ\0\Æ_—¿f/\Ú+\àŽ§}£ü]øñO\áÖ¡¦»¥ô>,ð?ˆtx\í\Ú2Cïºº°KB ¾“²\Èb9¯÷…¢€?ÀŠÿ\0x¿Š?³W\ì÷ñ·K»Ñ¾.üøañM¿]\Ûø»Á>\ÖL\Ù$’\Ó\Ý\Ø\Ér,Nô™_\'9\Í~^x\ëþ\r\Îÿ\0‚+|F»»¾ñ\ìð\ê\Ú\îúYg¸›\Â5ø\Çðð¥%žH\áðÄ\r[\ÂwÁb…#S\Ñ1\Å\0—\ÃŸ¾\n\êqk?¾-üEøm©\Â\Èñ\Ýø/\Åúï‡œ2r…—M½·ŽM½„ˆÀt\Æ+õ\á¯ü7ÿ\0œøM§&•\à\ï\Û\Ç\â[\ØFP\ÇŒ¼)ð›\âc&\ÅÚ¡\'ø•ð÷Å·\n»@‚P¯€\\1\0\×÷kñ§þþÿ\0‚LüC°º‹\á~›ñ«\à£,r-µï„¾(ø‹\Ç¶²¶LrŠ7ž.y\Ö<\å½ò\ïUÁpÄµ~nø\×þvøqs\Ëü:ÿ\0‚†ø\ÛG˜+;_\Zþ\Ï:‰bgþ¹¾Ð¾+xQ\Ñq÷¤‹Ns\ÇsÀ\âŸÁ\ßø;·þ\nûðõ\á_ˆ\Þ7øIñ\î\Ý&1ñ·Áÿ\0xBúh·h>\ÑðŸDð%œjW\äºi\0	fl“úa\à\ßø>#\âÕ­¬~?ÿ\0‚z|<ñ=\Ú\"-\åß„¿hoø&+‡,6z·\Âo}Ü°®¦\0œÀù›\ãoümÿ\0ðt\Êÿ\0¾=þ\Î\ß,2w\ÏâŸ„:ÀP¤ƒ…Ý‡´·$\ápþ ˆ\ä¶?üAÿ\0ƒWÿ\0àµž†[›ÙÃž?¶Œ·\ï>|køG«\Í&\ÞñiÚ§‹t=Y·W6\0œ\ãPýP|\Zÿ\0ƒ\Õ?a=´??f¯\Ú\à\ì’l\Ô<)ñkN¶-þ°‰£ojÆ‡8eÒ•\Ýyò”üµú\àŸø:\ÏþŸ\ã‹;K\ï\ÚGÆžžñ\Ò56øñ’\Þ\Þ\Ý\ß^jð‰t\ÛdRpóKx \\e\Û\Í™/\Ä\Ïø%÷üs\à\î©y¤|Fý…ÿ\0j\ï\Ï`H¸¼ÿ\0…ñWÐˆRAko\è^\Õ<;{Áýå–©q0Û°\ÊO\È\Þ(øqñÁ\Ék\ãOø\Ï\Â11YmüQ\á}s@ž&S†Y!\Õlm$F‚Aƒ@\í{ð£þ\n\Çÿ\0\Îø\Ýkkuð\×ö\ëý—õ\ÃxŠöö7ÿ\0ü!\áMe÷tG\Ð|_©h:\Ü3ù\á6ŸÃ¼b¾\Ìð¯\Å?†>;E“Á¼\ã(\ÝC#øW\Åþñ\n:žŒ­¤j”ö {Wø!\×E\áox·À\ÚÍ¯ˆ¼\âx?\ÄMº\Ï]ð¶·©øY´`Cµ\Õ4››K\Ø \Å:€z@\ï­Eˆÿ\0€?\à¯_ðTŸ…öð\Ùø\'þ\n	û\\iv01i\×<¯é©´a\â]\â-kV± Œ5¹pAW\ß\ß\à\è\ßø,§Á†\Û{ûF\èÿ\0\Zl÷†[\Þ\0ð÷ŠU@\0y\Ú>\Â:\ë!\ÆO™«;\äœ8 õâ¢¿\Ì\ÃÁ\ßðz÷ü7LŽ\Ú/þÌ¿±\ç‹V%Už\ãC\Ñþ1ø:öèŽ²;\Ïñc\ÅVQH\ßô\ÇOH\Çh«ô›\à§ü\çðN\î\Îÿ\0h¿\Ø\ÃâŸ‡\ï\Äq‹¯‚ž)ð—Œ,\Ú_ùla°ñÖ¯\ài–0y‰_Rv?u\Ücq\0þ\êh¯\åÀ¿ðx÷üK\Å\×V–ºß‡ÿ\0k†\Æ\å\Ò9.¼kð‡À÷66Œ\ßy\ç›À¿|i/’‡9‘-Ùˆ\ç\ËÀýFø[ÿ\0\ãÿ\0‚B|Y\Ó,u-öûý<(\×è®ºo\Å/ˆZ\Â\ÍNÔ±Ç—}Ž\î´8­\\½\æ\\m\æÝ·š\0ýe\Ôõ}+N\Ô5K¶	k¦\Ù]\ßÜ¹8	og—1\'€8Ø’xÉ¯ðbø\ÙñRø½ñ\â¯\Å]b\âK½S\âG\Ä_\Zx\æþ\æVf’{¯ø‹QÖ¥‘\Ù\Éb\Ì×§;Žkýši¿ø(÷\ìU/\ì‰ûPx\ß\ág\í{û4|L\Ô|1û>|[\×t»/†_>x\ïUº¿·ð6´4¡cc\ájWW/.§%œI\ä#\Ò)\\œþ)þ®ðhoÁ›Ÿ…ÿ\0ðH_ø\Îö\ßÉ¸øõñ\ã\â\×\Åw1”i´2m\ámƒ\î\'÷Šeøuz\È\Ã‡\ÚA\'úˆ¯\Èø ‡‚§øÿ\0sÿ\0‚|ø~\æÝ­\'¸ø£x²H\Z7Fø­kž=\Ü\èÀ2¼ƒÄ¢V¹\Í~¼PEPTu=ONÑ´û\Ý[W¾´\Ó4½6\Úk\ÝCQ¿¸Š\Ò\Ê\Ê\Ò\Þ6–{›«™\Ù!‚cVy%‘\ÕA,@¬¿ø»\Ã>ð\æ­\â\ï\ëz‡|5¡Z=ö«¬j“‹{;;xð2\ÌròK+•†\Þ\Ú’\æ\ê\âH­í¢–yc¿™Û‹öüñ?\íª\ÞøÀW:†~X\\\ã±\rö]O\Æ\ÒÁ\'Éªø\Êb\ÉdYDº~†$6ö\ë²kß´^0~½\áƒœI\â\ÖuõLº2ÀdX*þ\Ú\â\Zô¥,.\n›´ž½ÕŒÌªÁÞ†*j®\"th{\ïù¿\éô™\à£§hgu!›ñniF¯ú­Á˜LE:yŽkZ7‡\×1’µIe¹­–/2«J|\ÒR\Ã\à¨\â±_¹^\ÅûvÁHµ‰\'YøEðQº\Ò~q¦øŸ\Æ\Ö\æ[M[Æ¨Ê¸±\Ñ\ä\'\Ó|+(²a/uøX¬¿gÒ\íµ\ÇnX÷fc\îI$þd“ùš\0,@$ŸÌŸó\É?S_»?°‡üP¼z?\Æ/\Ú;Cd5/ü,\Õ!’9Â†óm5\Ú>Æ‡\Í_.{_Î¢`…·£…Œ\ÚQÿ\0J1X¿¾\\FÁa#Ì°øj~Î·qVo\Zq\ç©)?g,V&Wƒ¯ˆŸ²À\å\Ô%N\ê\ØuB‹ÿ\0\r°9Žÿ\0N_\êÕYæ¹Œý›\Æcªª\Ø^ðû‡\'^^Ê” ½¬0\Zv©õ\\\'ˆÍ³¬\\+U“\Æ\â\åŠ\Ä\Ç\Ä?a_ø\'&­ñŠ}+\â¯\Æ\Û\í\áLR¥Þ\ái>Õ§k¿Œd˜\ËÈow£xQ¤\í\Z„E5\rböú;\ÚG \Ö-ÿ\0£\Í#HÒ¼?¥i\Ú…¦Xh\Ú.‘em§iZN•i†›¦\éöq,–VV±\Åmiim\n$P[Á\ZEj¨Šª\0«±EGG0Æ‘CH±\ÅQ¨H\ãŽ44@@UP@\0\n’¿Ì¯<Z\â3Ç™\çu~­—aeR.C‡©7—\åXyµ~T\íõŒut¢ñ˜ú±Uk\Ê1„#GK†£þ\î}¾Ž\Üôx\á8\ä<-†X\Ü\ï\n58£‹±”i\Ç8\âm8»s\É9ýK*\ÃNSYnOB£\Ã`\á)Õ©<V>¾3Š(¢Šü¸ýô(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+ù\Ôÿ\0‚ûÿ\0Á	|ÿ\0aøSmñ\'\ách>ý¶¾h3\Ùü6ñ¦¥‹\râ‡…\à–\ãPo„_o ‚Y¢°–\î\â\ê\ïÁ>)x®%ð†¹yuÑ¾ƒ­kŸ\Ñ]þŸ´7\ì\áñ\ÏöOø¯âÿ\0´_\Ã|$ø§\à\ë³k­øK\Å\Úk\ØÝˆØ“kªiwJeÓµ\íTˆ½\Äzæ£¡kV/î—¨]\Ú\Ë\Í\âUþ\â?·\'ü{ö:ÿ\0‚‹|>ÿ\0…{ûUü\Ð|wœ7Qøg\ÆV\ÑG¤|Eð<÷\ÒX½\å\ïƒ<gmjš%\Í\Òé¶\\ª´ö—6Ñ˜.-eŠ\×ñkûZÿ\0Á“?#×ŸUý‡?k/‡:§‡õ\rSRžO~\Óv-ðeÏ…ô©%ß¦Xiþ7øk\á‰\Ï\â\É\à‰Œ\Ü\êðÁo-$ý\ãHû\0?ƒŠ+úµñGü\Åÿ\0tðú»i:\Ç\ì‘ã‚€•Oügñe£KŽ~xAn\Þk\Æ?¼Eyw…¿\à\Ò/ø-ˆ<g§x_WøMðoÀúô¦+Ÿˆþ\'øûðþóÁš:‚\0¸\Ô\ì|{\â\ïˆr@A-ÀzµÀ\0ÿ\0£\îÀ \Ì\Ý}¹ûÁ=?jø(÷Æ7\à§\ì¿ð\ßTñv¨g±—\Æ>0ž	\ìüð\Ï@»¸0¿‰|{â‡ˆ\éúœŠ“µ«\É&«­M\Ùh¶÷Ÿ¹\Ú\ß\ì]ÿ\0Sø@ŸDñO\í\çûN^xþ\á-\í®5o„¿³\æ›y\á\Ç}³U‚ûM¸ø£\â˜\á(ñ›û\ÍP°\Ôt\ßxù&‚ò\Î\ê\Îh%Iöyû3~\Ê³—\ìoð\Ò\Ë\á\ì\ÅðÁ¾Y\Ïö\Ù4/\éihú®¦`†\ÕõŸj\Ó5Æ³\â]nKk{{i5{P\Ôukomh.µ¼\ÆñŸüSþ	Gðþ	;û7\Ù|\"øekg\âO‰\Þ,]3[ø\ëñž\çNŠ\ß\Ä|]io*Cœ\Ê\×v>ðÉ»¾´ðo†¼\ãk¦Cw¨jOö¾·«\Ü\Üþ¨\ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0\Åø\Ó\á¿Ã¿‰:lº7\ÄO\0ø/\Ç\ÚDÑ˜¦Ò¼i\ám\Å:l±6G-Ž¹c}k$d€J<ENEv”Pæ¿?\àŽðJOˆ7—¾(ÿ\0‚wþ\Çó\ß_\Èó^\ß\é?>ø_P¹šO¿4·\Þ\Ñtk¶™º™|\ï3<\î\Í~y|hÿ\0ƒU\àŽ\Ú\î]3\àþ\n\Ý]\n\Üüø•«hkh\Òg\ÓOñu§ôx\Äg˜\ã“M–!À1²ñ_Ñ­übx\Ëþ™ý€\ï,n—\á÷\íUû`øwRh\Û\ìSx\Êÿ\0à¿Œ\ìc—ø~\Õm¢|%ðóFy\"»·aÀœmo\ÌßŒ\ßðd‡\í)c+\Éû<þØ¿¼S	’\×\ã6\ã\ßJ±\î8ß¨x#Â¿œ&\Zj)l”ôm¢€?Ê·\âGü\ãÿ\0rðž÷ú%÷\ì¯ñ`\Æ$&\Ã\á¿\Å\Ï. B.\á²ˆ_\n~\Ç!“‘I˜\îp™\\þ\\|Mÿ\0‚Á]~js\éš\ßü\ëöŸñ\'’\ì‚ÿ\0\á—Â¯üT\Ó\'\Û\Õ\à»ø}§øˆ2\áfD\Ý\Ðx¯ö™¢€?\Âg\âg\ìiû_ü\ß?e?\ÚK\á*§.\ß>|OðA€r\ç\Å>Ò‚ðA\ç{\×\ÎG$N\ÑÊˆJ¼r+#£¡•€e#¸ \Zÿ\0~\r_B\ÐüAjö:ö¥kvR²Y\êúuž¥k\"žªö÷\Í\Ü2k\å¯ÿ\0Á?`Ïˆ—R\ß|Aý‰?d_^\Ü¯¼ñ\ì\Ûðk\Ä÷Su?½¸\Öü},œ±?;·S\êhü1â¹¸·\ß\äO4>dmžT¯™Œ<O±—tn8dl«5.Ÿeq©_\ÙiÖ¨dº¿»¶²¶Œ—ž\êd‚¹i$Prký~4ÁºðG\Ó\Ý\Ý\ë±_ÃŸ\0\Þ]¬§ø.u„0Bd\êöšOn´\nÕ”ó‡JTNŠx¯ƒ§ÿ\0ƒ=¿\à”6\Þ%\Ñ<U\áO~\Ö>\Ô<=\â\r\ÄZ}†ŸñgÁzÎ‰%ÆªZ\ê\Ø_\Úø«\áN»¨]i·-l-.\ãMV\Þñ\íd“Ê½†}³(ô“û=ü.³ø!ð\à\ÇÁ½>(¡³øWð·À_ Š\Z_øcLÐ›\Êa\Ã!{ea÷\ÝÞ½‚Š(\0¯3ø·ñÀ?üªxû\â6»o¡\è:j»¿{©Þ²“m¥iJDÚ†¥v\ãdÐŽ9–gŠ\ä•9\ÚöŽømû5ø\"\ã\Æ^?Ô€šE–/xj\ÊH›]ñ6¢‰”²\Óm²©*ou‚\ÚX\ÄÁ¥f•\à‚o\åcöšý©>$~\Óþ5—Äž2½kM\ÆY\ÓÂ¾²–A¢ør\ÆF!R˜´\êE´_js©¹º`@ò \Û\Çý\à€Y\çŠ\Ø\êyž=b2Ž	\ÂW\å\Çfüœ•ó)Ó—\ï2ü•T‹Z\îÜ˜Œd£<6\n\ï™V®£†Ÿñ—Ò³\éÂ¿G¼¦®E”<x§˜\áò®U=¦#§Z¹\Îx¢Tg\Z˜|*MUÁå‘<vj\ÒPxl§Ž§\è¶\í­\ã\ïÚ—Äl\Ò]xgáŽ“u!ðß‚m\îI…ö3¤ZÆ¾ñS\Öå‰\ÎÀ\Ú\Ø#µµ‚i\înþ7\ÒtO^\Ô\ìtm\Â\ïTÕµ;¨l´ý:\Æ	.o/.\îdX ¶¶·‰^Y¦šFTŽ4Vgf\n ’møÀ¾.ø•\âÁ^\Ð5x£_¼Ž\ÇJ\ÑôÈ„—3É’YžFŽ\Þ\Ö\Ú\ÖK‹\Ë\ëÉ­\ìl,\ážöú\æ\Ú\Î\Þy\ãþžb_\Ø#\Â³F“i\ã¥‡Š¾3\ê6joõuQs¤xAgŒy\ÚG…|øQ\Úu\Ü\Ð_kòG\Õ\ê\îŠ\Ò++7š;Ÿ\ïn:ñ\Ãï£¿\à²|·…†*8iC‡xOQCŒ’¼g\Ì+?iVŽU“–34\Å{ZøªÊ¤i,N!N1ÿ\0 ü%ðk\ÆO¦—‰y¯gy¶>¶_SN¯\Zø‹›Ò•\\Y¡:y>O…‹£C˜C(C,\È2÷C	—\á]\Z˜™`pr¥:¾;ûÿ\0Á94Ï„ƒIø¹ñ\ÃO´\Ö~\'÷†|#9†÷Gð€‰`Ô¯‚\ï·\Ôü[\í‰i¬<? \Û}£XKk\Í3õÖŠ+ü¶\ã®<\â_süOq>:X¼eo\Ý\á\èCšž-\Â)JT°v\Êk…¥\Ì\Ú\\Ò«Z¤§ˆ\ÄÕ­‰«V´ÿ\0\ß\Ï	|\"\ào8;Á\\•G/\ËpÖ­\ÆVä­›g™”¡b3|\ë\Zt\å\Ì1‘N\\”ðøj1¥ƒÀ\Ð\Â\à¨P\ÃR(¢Šø\ÓôÐ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯‘k\Û\á\ç\ì³\á7»\Ö\'ƒ\\ñö­k3xGÀ\Ö\×\0^\ê\0QuQ“{\éš\r¼¤‹\ÙÌ¸ \ÛX\Ç5\Ë_?ý·¿m\ïþ\Êú$>\Ò-]ø·\âm\ê~\Ñ\îO\ì\Í#Kž\æ÷O‡\ÄzËž|ö\Âö-:——“y\ÒAo2ÿ\0.¿>!x\Çâ—‹5ø\ï]¾ñ‰5»–¸¾\Ôo\å29\äùVð\'Z\Ù\Û!ò­m-\Ò;{x€Ž\Ñx¯\ë/\0~Ž\Ï%„\â\Þ/§[ÁP©\í0˜D\åGÄ®”Ú”hµi\áržxÊ|bq­ˆ´¨\à¹o,Uó³\é…ô\Ý\Ë<†a\á×†Õ°\ÙÇŠU(û\Ë0”!‰Ê¸8ŠJqž&½,Ãˆ*«„\Ë\Zž\ÍOšs¥O/\Åôÿ\0\Z~7|Bøù\ã}C\Çu¹õmVñ™--†b\Ó4k\0\ì\ÐizEˆc\r¸b$Ë»š\âY\î$–iðg\àŸ\ÄO^6Ó¼	ð\ãB¹\Ö5k\ÇF»¹\é¦h–b$ú¶µ}´\Ãa§[oS$Ò]\Ù %¸–_±ý›¿f?‰Ÿ´\çað·4Ö‹K´š\ÙüU\âû\Øe\Z…tÙœîº¿@\Þ\Ë\ZL4½\"š¥\Äl‘ù6°\Þ\ßYÿ\0Uß³¯\ì\Ûð\Ûöhð=·ƒü¦¡»š8$ñ/Š®\âŒ\ë\Þ*Ô£B\Z÷R¸\\˜\àFi>Ã¦@\Ëea°‰\Zi..\'þ±ñ‹\ÇðW&¡\Ã5„Ë±\\O:O\á#\nynC„T\Ôpø¬Òž\Ã\ØRŒ-<._OŒV›•\Zú\Ãÿ\0;þE>>úQñ>+8\ã1Î°W4­‹\â.3\Ì\'R¾y\Åù¶r\Æ\åù|ljýo*ŠT±ù\Íh\ÖÀåš”a‹\ÆRú”|\çöFý~þÊ¾TÓ£ƒ\Ä_5‹$‡Å¾<¸¶sr‰\ßGÐ£“tšN«0#Nkxo5\'v†\Î\Ú\Ç\ìj(¯òßˆ¸;\â\Ì\ãŸñcˆ\Í3lÂ««Š\Å\âeyK¤)R„Ti\Ð\ÃÑ‚T°øj§CJ1¥Fœ)\Æ1_\ï\×ðWxy\ÃYWðfK‚\È8w&Ã¬>.À\Ó\å„Võk×«\'*ø¼n*£•|n;R¶/‰LF&µZ\Õ\'6QE\âRQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\ç\íeÿ\0pÿ\0‚rþÄª\éß´G\íeðŸÂ¾/\Ñ\Þ\î\Þ÷á¾‰\â<kñ*\ÛQ´±Q\ZN¡\àl\ëº¡yk4XG\â[]Á24W72ÿ\01ÿ\0µ\Çü³ð\ÂCXðÿ\0\ìYû/ø\×\ã®‚\ê\×Løƒñ«Y‡áŸ‘\æ\Ò-§\Óu«	h‰\â\Zx‚^i\ìu_j>š\î6š\Ã\ÄP¤ð\Ê\0?¸\ÊùOöŒý¹ÿ\0c¯\ÙD¸\×ÿ\0io\Ú_\à\ÏÁ›+x¯\Ý-¼q\ã\ÍK\×ut\Ëµ]\éú†~\×/ˆüA¬¬?4\Z‡¥j\Z\Å\ãb+;\å`‡ü¥ÿ\0k\Ïø9;þ\n\Ûû`&³¤k´;|ð&µ£k7\Ã\ÏÙ¿H…ºZf¯¦>•©\è\Òø†;ýg\âF·¥][K3-·Š<s¯Im4†[Y\áp¤~ø›\Å^\'ñ®·}\â_x^ñoˆõIÚ—ˆ<M«\ê\Zö·¨\Ê –ûU\Õ..¯\î\äª¡\î\'‘‚€ \à@\ë\åû)Á\Ç\ßðM/\ÛSö\Èð\ç\ìYû>x“\âß‰üg\ãK?O\à‰º\×Ã˜|ð—\Å÷\Þ\Z\Ñ_\ÄZ‹/‹<G¤|P\Z\Õ\æ—kª\\\éöÚ§\Â\í6	#Ñµ).n­!Kin¿z+ü(?c\Ú7\Ä?²\ícû;~\Ó~7Ï©üø½\àˆ\éúv t«@\Ñ5\ÛI|W\á6\Ô@cgi\ã6³\ámFlº~¯t¿\Ü\ëÁž0ð\ß\Ä/øO\Ç\Þ\r\Õ\íuÿ\0x\ã\ÃZŒ<+¯X1{o\Ã~%\Ò\íu­W³v\0µ®¥¥\Þ\Ú\Þ[±\0´3! @-~Ù¿²…ÿ\0j¿‡\Ïb~É¢üKð\Ü7>ñsÅ*\à«H\Þ\×$Ž7ž\ãÃš¤¸*‰&\Ò\î™5;$‘–\ê\Îÿ\0ù<ñÇ‚<Sð\ßÅš\ïük£]\è\'ðÞ¡6›«\éWª\Ö\×0r®Œð\Ü[\ÏGqiwo$¶·–²\Ãuk4\ÖóE+ÿ\0qµù\ÛûzþÄšO\í/\ác\ã\Û\Ûi¿<+§ÊºMÚ¬pE\ã2\0Ò¯†µ™H\0\Ï2¶…¨9\Ýiq+\ÚN\Æ\Ê\ä›ë£o³\àLm\â\Ü\\¥Á¹…v°\ÚÒ”¿Õœ}y\Ý\Î\î\ídøº’¾.’÷pu\åõ\êj1ž1Uÿ\09>œ_C\ê~-å˜Ÿ|9\Ë\árl\"y¾U†„iÿ\0¯YFšŒi¨«)q.[B\n9mg\ï\æXH,ª³Jyd°ÿ\0…±_\í\â_\ÙO\â\Úfz\×\Âÿ\0\\ZA\ã\ï\nBcy\Þ„‘[ø‹\Ãþ|‘Eo\â\r%fwXžXm5«@ú]ü1°\Ôô¿\ëÁ¾2ð\Ï\Ä/h^5ðn³g\âø—O‡TÑµ{	<\Ë{»Y‚\\\ÛÊ²Z\ßY\\$Wv°\\Y^AÝ¼Ð§ñ­hÚ§‡umGB\Ö\ìn´\Í_I¼¸\Óõ>ö-\î\ì\ï-%x.-® ”,‘M¨ñº0YH¯\Ñø\'\çíµ¨~\Î^+Ox\âú\ê÷\àÏ‹57\Ð9’\áü­\Ý4p\éQ\0\ïöY‚¤zö\îŽú\ÝZú\Ña¼þƒúHø\rGp8óƒpô\åÅ¸<,*ã°˜U)\Ëh\Ò^\ÎTù=Ú¹¶¬X\ÞX\ì,c‚“œ¡‚öÆ¿B¥\æ#\ÂÞ‡„ž&\ãkSð\ç3\Ì*PÊ³Á\Î3ðÿ\0;\Ä\×j´+ûT§C†ñø¹M\æ”\'\Ë£R¦kÒ§W5u©:*ž¨\Øjöz¦—ym¨iº…´7–7\ÖsGqiwiq\Z\ËÅ¼ñ3G,2\Æ\ÊñÈŒU”‚\r\\¯ó\ZQ”%(N2„\á\'FI\ÆQ”]¥E\Ù\ÆQi¦šM5f¼p©\n°…ZSJu#Ó©	)\ÂpšR„\á8·FQjQ”[RM4\ÚaET”QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Q\\Ï‹¼k\à\ï‡þ\Õ<Y\ã\ÏxkÁ>\Ð\ì§Ôµ¿ø»]\Òü7\áýNµ]÷:†«¬\ë7VzvŸcl€½\Å\Ý\Ý\Ì6ð -$Š š\0é¨¯\ç“öµÿ\0ƒ \à’²\ã\ë\Z.ñ\Ò\ÚW\Æ\ÚS\Þ\Úÿ\0\Â;û;i2ø\ßB}B/¬\ã?g};\á\íö™©ˆ\àƒZð¾¿\â{(nh®LR@\è?˜\ß\ÚóþPý¨<nšß‡?b\ï\Ù\Ï\á\ßÀ\Í\"\éu-;\â7\ÅË«Š¿­\í/t¨a´Õ´¯\nX¾…\à\Äz.¬\×7V‡^<;vÉ¨\è2+\Ïn\0?\Ñÿ\0S\Ôô\ÝN¾\ÕõB\ÇI\Òt»KCS\Õ5;¸,4\í:\Â\Ò\'ž\îöúö\êH­­--`æ¸¹¸–8a‰IQIßµ·ü\ßþ	CûcKø£ûXø3\Å^8\Ñÿ\0´\í\äøgð^+ßŒ9—W\Ó!†\ì;»OE¨\èž¿¿Y‘tÛ¿k¾Ð®_pmb%VqþQ?µ?üþ\nûj\êW·ÿ\0´\Ç\í]ñ\âU¥\ì÷ÓŸK\âI<5\à©\Ù\r;SƒFøu\àøôhV:˜0^\é\Ú7‡\ìtûˆ\ÞE’Ø«°?P÷¿û]Á\ìšõû\êz\ì=û&[\èV%µ{‰´^¼š–»5¼Ö‘®›¨Áð\×À\×?\Ø\Ú¡c{\ç=Í÷Žüac}o\å\"µ«\ïcü\È~\Ö\ßð]?ø*wí ºž›ñkö·ø ø/Uk\äºøoðƒP“\á\æ±\Ô\ìþÃ¨hÚ•‡ŸJ\Õ<K¡]Û–\è¾.\Ö<A§ov‘-\Ñ\È#ò‡GÑµjvZ\'‡ôK\\\Öu;„´Ó´\Â\ëS\Ôõ©N#¶²°²Š{»»‰	I#žM~\ÍþÈŸðoWü“ö\Ì:^¥\à\Ùo\Ä|©.\à|Løùu\ÂÇ¥\ê\ßmX5›(¼K\Zø»\ÅV\ÒX\É¥¼+\âSOim¾Ó§\"\ÜFXñU\äy¼Žò9\ÆYØ³³Nž”\Ð	\è	\êx€\É?€ŸA\Í¡·\ìÿ\0NøEm\Ä¶\ß\íc¬x\âñF“y«|6ýŸ¼=ÿ\0¯†¢ž)\ï·¢\Ëñ\Æ+\â?i\×vÿ\0`m;Y±ðwo\íeK>›:˜ˆþœÿ\0dOø\"§üö\"mTøû&ü69ðú\é2\Ù|Qø‡¦‰\ß\"Õ´P¿bñŸ\âO\Z_þŸoQ4Ú—ƒlü6ò\Î<Òù òŽý‘ÿ\0\à¿ðR¿\Ûut=K\à\'\ìñCRðWˆM¹\Óþ\'x\ËF—\á\ç\ÃK\'VV{-OñwŒ†‘c\âEBÍ¨øUu\è‘J–\005úcûhÿ\0Á¯ÿ\0µ\Ï\ìû|Eý´¾6|Oøs¬kŸ/|&·ðáµ¾¥\âY´/x›]O\ëºç‰¼m¨¾ƒ¤\Û\'‡\ï\ï´H­¡ðõ‡‰WU}KcK§ˆK¿úÆªª\rª¡Wž\09\äð09<šù÷ö²ýŸ¼/ûVþ\Ìf\Ï%¨ðÿ\0\Æÿ\0„ž;øms}u¤iº\é\Ðo<S\á\Ûý7FñVŸ¦jö÷Z|\Ú\ç„5©´ÿ\0xzi\àf²\×t:úŽ\â\Ú)Pü\"«ý{ÿ\0\à\Ù\Ú\Ùj¿ø$ŸÀ{mS[mc\Ç³Ìº\Ç\ìõ\ãµjËª\ê¶ñøh\çðOö€[ka§F\Þ\Õ<7o¤\é­\ç5¾g`Lò,Škü~!ø\Å_\nüãŸ†:Ò¦Ð¼mð\ã\Æ>&ðŒt;‡I\'Ñ¼U\àýj÷\Ã\Þ!Ò¦’\"\Ñ<\Úv­§]\ÚHñ±FxX¡*A¯\í#þ¬ý°‡‚¿i\ÚOö%ñ>¼¶\Ú\'\Æ\ï\Ø|eø_¦_\ê¶\ÖÖ¯ñ\'\álË¦x\ÓH\Ðt§E¸Ô¼A\âÏ‡z\Ü^!¾’)\\Y\è?\îd0ª™d\0\èÿ\0EP\äwüköO‹º]ÿ\0\ÆÏ„\ÚR/\Ä\í\Ì\Í\âŸYDþ½&\Ò<½\å¬I€|S§Û©\Ø³\ëv±­©\ÍôV\Æo\æòhe‚Y ž7Šh£–)£\Æ\êJ²:0YH ‚2+û´¯Ã¯ø)/\ìý¶¯ûA|\Ñ+ø|\íC\â?„ô»uT¹™n¼Y¥Z@€\ß.»m\Z\å‰}R0I½ý\Ùôcú@ÿ\0g\Ë\á¯c_\ÔjN^\ÎñU4ÁT›Q¥‘\ã\ëMéƒ©+C,\ÄMÿ\0²Ô’ÁTV–\ê¿\ä§\Ó\Ç\èpóxf\Þ9xW•ÿ\0Â­\Zuqþ!p®Ž¹¥\ZkŸÅ™F\Z”uÌ¨ÁJ®}ƒ¥øP£	f”cõúxÕ˜x§ü‡öð?\r/ô\ï_u–uK‘o\àŸ\êe<«^N¸\Ó5K©\\|+4Ž\Â\é\ÉMöO:bšd÷S\Øÿ\0E\áƒ\0\ÊC+\0U\È Œ‚\à‚9pE	D21e?B¬\èA¯Þø&¿\í\åö¸´\Ù\ß\ã.°>\Ñ\nÁ¦ü/ñ~¡(S,*\nC\à\ív\îR’,$^\Ô&r\Ò#.‹1S›\æûI\ï£ÿ\0Ö–;Ä¾	À\ß<W\ä˜Jz\â`—5\\ÿ\0Fš\×y\æô ¿l\Â)V†.X”úý1³¥”ø\âžklº£¥€ð\çŠs\n\Ú`*IªxnÍ±5eþ\åVN4¸sV_\ì•2Y\Ë\ê³\ËcƒýÎ¢Š+üø?\Ù`¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šù3ö–ý¼?cO\Ø\ç\Ãòx—öŸý¦>|°j\Ù\Ùx\ÓÆºE§‰uÃ¥ª¶¡i\áo\Ú\Ïw\âÿ\0j–¡\Ó\Ì\Ñü/¡\êú±,¡,˜(\ë:+ø\âý¬ÿ\0\àó/\ØS\á\Öt/\ÙO\á/\Åo\Ú__´}J\ÏOñf»hŸ	>^Oµ¬\ÚV«du\è\ï|y¨h·³M=½\ÌZ„¼-¬\Ú=£\æÁ\ÒX\ä?\Ìg\íÿ\0`ÿ\0ÁV¿ixõ¿ü1ñ¿„d_\0\ê¿Ú–‹§|\r\Ð\ãoˆM£j–p\ÛÏ‹+\ZÇˆ´\íGO•&¹\ÒüKðö\Ó\á\æ½e$ÿ\0%\ë<I%\0©WÆ¯\Ú/\à/\ì\áá‹¯||ø\Çð\Û\àÿ\0†m,5\rMõ_ˆ~0\Ðü/öZTi\Ôe\Ó\á\Õom\îµF³€y³Á¦ÁwpªG\îŽ@?Î¯\íwÿ\0pÿ\0Á-g_\í\á¡ñö¼ñÕ‡ö¥¥—\Â-\n=\á\ØÕ¬\Ä\Äj\ß<o&‘§¾ª‰eòµ\ß\èŸ&¶00ŸG\Ë–ÿ\0\Äÿ\0Œþ6xŸSñ¯\Æ?‰ÿ\0>+x\ÃZ¾›S\ÕüQñ\Æ ñž¿©\êW8ûEýþ­\âCP¾º½¸\Ægºšwšc–‘Ù‰\'\Í\èú\Þý­¿\àñ/ø(\Ï\Æ\Æ\Õ4_\Ù\ÛÁÿ\0?d\ï]ÿ\0i[\ÚO¡\ØKñ3\âJ\Ø_Avÿ\0mñ¯‹ ƒEMSK•%ž\ÏSð\ï‚|6¦)ui:¢ü\Úþ\Ñ¶?\íWû\\kƒ\Ä?´\Ç\íñg\ãeüz…Æ«eüi¬\ëZ¨]Ä°]]x\ÃÜ¯†ü9%\ÌH±\Î4\'NY”~ñ[\'8¿f\Ú/öñ>ýž~üOøË¯\Í}i¦›‡ž\×<L–·\×ÁÍ¾¥}¦\ÙÍ§\éMt\Ì\r©\ÝZ$k\ZþŽÿ\0d/ø4\'þ\nqû@¶—®|t»øeû x\ì\éw7S|DÕ¤ñ¿\Ä\É4\Ëô¼7o£ü3ð<—1.¯¤Kmo\î\ã¯ü>2-ô2\Ø\Þ\Ý,s¬`\Ê}v¿þ\ZüFø±\â#Àÿ\0<\ã_‰^5ñ\ìzn\á\0xW\\ñŠ5\ÍF`LZ~ xv\ÇQÕµ;\Ù@&+K+I\ç“$f¿\ÔöGÿ\0ƒ?\àšŸN®ü{Ö¾(þ\Ö\Þ1°:M\Ý\ì^3\Õcð\ÃYµz5³ð‚\ÞA´-e\'µóôø¿\Å76f\Z\×Vk\×ô…û?~\Ê?³O\ì§\áˆ|û7ü\nø[ðWA‹N\Òô©\àø{\à\Ý\Ã\×úµž‹l¶šXñ¹ihº\ï‰\î­-\ÔG¡\â-KT\Ôni.Ù˜€–\ì…ÿ\0²ÿ\0ÁY?j4\Ðu\ßü&\Ñÿ\0e¿k1é·§_ý u…ðÿ\0Š!Òµ+Yn\ïþŽ“«\ã‹+\ëGH\íõ\Å:o…µ\Ë¥\Ûqd þœÿ\0doø2\çö>ø~ú\'ˆ¿l_?ÿ\0hMj\Î]6ûQðÃ¿#\á\ÃKÉ¡YF§¢jú\ÌXø®hw¥\ã1]ø\\øq®[˜²—€;-i”P\Å?³üöýŒô›m\'öfý–~|(6ñi\ÑI®\è¾°¾ñ–¢úK;i·š\çŽu\Õ\Õ|c¯\êv#˜µmk\\¿\Ô÷\Ív\Í\Í}­E\0QE\0QEþFðtg\ì“ÿ\0·ÿ\0iøÅ®i\Z\Zh\Þý¥4}ö€ð¯\Ùl4}+K¸¿ñ42hþ;\ZnŸ¤\È]<s¡\ë“\ß\Þ\êö\×z¦¯w¨j%óÌ‡ówþ	OûU\Þ~\Å_ðP\ß\ÙCöU}#Gð?Å¿Zx\Ò\çûZ\Ö_‡¾-™¼#\ã\Ë]WV¹W‚\ËE¸ð¶·ª.³4 Eýš.VVXÙsðzg\ì\'ÿ\0d\Ù\ëö\ÇðÞ%Öµû=üO¹økñö\Î\Ê\Ð4?>0\ÛFš&µ­\êRÈ—F\Ã\Ã_ô\r\Ã\ÚFŸl“o\Ô>(\Þ\Ý:$P\Ë\"ÿ\0š\í\0¿uõž§cg©i\×0\Þ\éú…­½õå»¬¶÷vwp¥Åµ\Ì©+$3\Ã\"KŠJº:°85j¿ ÿ\0\àƒÿ\0¶ý¶ÿ\0\à•Ÿ²g\Å\í[X}g\â‡üÁÏ‹S]ê«¬k\'\â?Áù\ÛÀú¶¯¯Ü­½²Áªx\ãI\Ó4?‰\"ÀF\ßa\Ó|i§\Ûed27\ë\å\0\×D•)QdŽEd’7P\è\èà«££¬¬¤«+ Ó¨¡6µZ5ªk 5t\ÓWOFšºi\îš?œ¿ø(\ï\ì#?\Ã]ORø\çð‹F’o‡šµ\Ë\Ýx\ÏÃšt\r!ðN¥s&\é5KH\"RW\Â÷Ò¿\Î\Ñn_\Ë8\Ó\åˆ\Ú~@A<\Ö\ÓEqo,O‹,3D\Å$ŠD;‘\ÑÔ†VR29ý\Ó\ê\Z}Ž­ay¥\êvvÚ†¨[Oe}cy\n\\Z\Ý\Ú\\\Æ\Ð\Ü[\\A*´r\Ã4N\Ñ\É©VV Œ\Zþbÿ\0à ¿°õ\ç\ìý\âI¾\"ü>°¸ºøC\âk\çeŽ%’s\à½Z\åšC£Þ¿\ÎË§\ÌÛ›I»…’0m$cs	kôƒ\è\Íô€\\EG\á\×\Z\ã\Ïpô–‡sŒUMs¼=(¥¯Ro\Þ\ÍhSV\ÃV“o1¡I\ßO›þ!};>‡O‚q9—^e¯ýP\Æbe‹\ã^\ZÀQv\áLn\"¥\çŸe”i/w‡q•\ç|v\ZQ\ÈñUZIeU\Ü2¿ÑŸø\'G\í\Ó\Æ\Ã\à\Ç\Å=V8þ)h–b\r\ë7Žþ­\Êˆe•\Î\Ä\Ú}¼lgV>f«i»M÷Q]\îýg¯\ákEÖµ_\ê\Úv»¡\ß\ÝizÆ‘yo¨iº”\Ïowe{i*\Íoso4edŠXeEtt`\Ê\Ê Œ\×õûþ\Ü\Zo\í-\á¡\à\ï\Z\Íg¥ücðÍ’B\Ù\nÁo\ã2HÏˆ´˜IÚ·*JgO‹þ=§asig<k\æI£ü¸g‹ñ‚ð_ñâªº\ÜA”a¡¦CŠ­4¥Ž\ÂR‚÷rŒUI^­(®\\»+C—Vœ0¿¼ý>˜\Ñ\ã¬&]\à×Š§üf\Ø\n\Ãpo\ãªû\Ü]—\á©{™>cˆ¨ýþ$ÀQƒX|EIs\çx8\'Q\Ï4\ÃÖ«˜~QEü\\¨EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEQ\ÔõM3E°º\ÕuF\ÇI\Ò\ìb3\Þ\êZÝ½……œ\n@i®¯.¤Š\Þ\Þ HI¤D€O\"¿k\Ïø8þ	Aû®©¦üJý«¼\ãŸi©Z¿\ÂßK\'\Æ?ÿ\0j\éL«u¢jø=®ü5\à\ÍM‹©¶Oˆ~&ð}¥Ú’\Ö\×r(b\0?f(¯ó\ãý­\àö?_ÿ\0l\è?±7\ì™g Û–\Ô\í4ˆß´ˆF­ª\É\Åjt}gþ×ƒ\r3L¼†cxº†‹u\ã?ZÈ«n\Öú°\Ü\à0ß¶üþ\n‡ûpÇ¯\è¿\Z¿kˆz\Ã\ß.«ið“\á]ó|)øgq¢kP}C\Ã:Æƒ\à¶\Ó/<i\á\Ùb«¦|A\Õ|\\‘‰$ \r€þ®µ—ü\ãþ	\Åû.µiûAþ\Ö?\n|7\â­	u”½øw\áýz|GMGA\Ú5-\n_xCûgYÓµø\Ö(ôf\r2\îi³Q³«ü\Åþ×¿ðz\ßÁ	g\Ã±\'\ìµ\âÏ‹ºªj\Ø\é¿~9k\Ëð\ßÀ–÷\Ëiý¯Xx\Ã\Ð\ëž7ñ†•{	¾[\íW\Öþ\ê–R-«\Ç}r­,kþtS\Ï=Ì¯=\Ì\Ò\ÜO+n–i\äye‘ºny$,\î\Ø\0e‰<TTû½û[Á\È\ßðV¯\Ú\ä\ê\Úf³ûG_|ðN©ý§ð\ìû¦\Åð\ËI‡L\Õ\ÝeÒ¥\×le»ñ¾­olmÕ¬.µ¿\êZ¥“I1†ý|\×\Ï\á÷‰|Q\â_\ZkºŸŠ|c\âwÅž&Ö®Z÷Yñ‰umC]\×uk\Ç\0=Þ§«\ê—Z…ýË…P\Ó\Ý\\K+\0¹\0W\é?\ì™ÿ\0`ÿ\0‚š~Ú£N¿øû%|O»ðž§&ž¶\ß|s¤Ÿ†¾{mV\ÖK\Í?S·ñ/Î‹mªh÷PD\Í­¢¦§§†(pŽ\èô\×û!Á“ÿ\0<C&•\â/Û‡ö­ð÷Ã¶›u}ð\Ëö}\ÐO|iyk=½\×ö¦•}ñ\Æ\éžð~«§\Ý/²\ßi^ø£¦j0=Ò°°’8À?…\nû3ö]ÿ\0‚wþ\Ü_¶ž³‰û.þËŸ¾14·v–W\Z\ï‡<%{i\à}kût»±o|D×¿²<\á;k\ËY#¸¶¾ñ7‰4›)\âtx\î2\çý[?d¯ø7[þ	1û Uð—\ìÅ üRñÆý—pŸ~=^\\|VñÚ¶™\Ö\í¬E¦\ëÀøCH¹Ô„\îú•Žƒ\á+E™\ÂùZd6Ú½B\Ñ</£i^ðÖ¥xw\Ã\Ú…¦•¢h:i¤\è\Ú>—a\n[X\éºV—a\r½ŽŸagopZY\ÚA\r½¼(‘C\Z\"ª€óWýÿ\0\à\Ì?\Û/\âR\èž ý¯>6ü5ýœtµ°»\Ô|\à°ÿ\0¾$\Ú\Ú]\Ø\Ï%Í…\åÕœºWt\ÍsK¿û4\Ø\ë¾(\Ò.b3½¦¬øô\åû#ÁªŸðIÙ–m\Ä>:ø[\âÚ·\ÇzD–£Xøÿ\0¯Ï«x(j¶°\ÉÄ±|\'ðÿ\0ö/µm&ü\È^m\Çö>=°\Ò\'F$¯\é.Š\0\á~ü/økð—Ãšw„>|?ð_Ã\nhöVún•\á¿ø_Eð¦…¦\éö€­­–•¡\ÙX\Ù[Z[+2\Û\Û\Ã\nE\n’±¢Ž+º¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0øcþ\naû/X~Ù¿°_\íQû7]\ØBÿ\0\âOÁ\ïYøZ(´\ÛmZö/i:tš÷‚nt»;·Ž«\Ã\â3J:d\ì\êÖ·†˜É’%ü?5M6ÿ\0EÔµT¶’\ÏS\Òo®ô\ÍF\Î]¾m¥õ…Ä–·v\ÒlfO2ˆ¤‰ö³.\å;XŒ\Zÿ\0~ªÿ\0\Z?ø8öBØ»þ\n\ÃûVü8\Ót\Ï\ì\ß\0øû\Æñ\ë\áP‡LƒH\ÓÀŸcoeh–0\\\\„\Ò<\â\ë|8µ¸•¢—PoK¨5¼+tˆ\0?¦?ø2sö¹\Ä_µ—\ìC¯\êÏƒ6ûCü7\ÓnµX$‘£ƒÁ?\â\Ò4Af.\'¸¸Ž\Þ\êÚ‘¾)6:}·Ù˜²\'÷ó_\ã!ÿ\0ý¯\ìYÿ\0Yý“~(j\ÚÄš?€<a\ã˜þüT™¯\íô\Í4x\ã¯ƒ%\Ôõ\ëÛˆ\äXôxšû\Ãu4M’\Ï„|„y¤7û7\ÐEP\\ßŒ<#\á\Ïøc[ðw‹´«]o\Ã~!°ŸMÕ´\Ë\Ä\ßÕ¬\ë‚;4r\ÆÁf·ž2³[\Ïs\Â\é,hÃ¤¢µ¡^¶\ZµN\Z­JŒ=Zu¨W£9R­Fµ))Ó«J¤\Z:”\ç\Î‹RŒ’”Zi3V\rŽ\Â\â0X\Ü=^B¶…\ÄÒ…|6\'\rˆ§*UðøŠ5c*u¨Ö¥9S«J¤e\n”£(¸¶\ä“ö\Úý<Gû+ø\ì5¨º\Ö>xª\ê\æ_x£-\ä8/4žÖ¤EÁ®ið22vEªØ©¾²¡\Ô-l>Oð/Ž|Oð\ßÅš¼ª\Ü\è¾#ð\íü:Ž™¨Z¹I\"žÊ¸û²Á2‚\â	á¸·’X&I\"‘Ñ¿´ŠŸ|ñ›Àš÷Ã¿i0\êþñ«A<Nª.l®W\æ³\Õ4Û†Vk=OOœ%Í\Ôctr &’7þJ¿j\ß\Ù{\Æ_²\ï\Ä{¿	\ë©.£\á½A¦¾ðgŠ’K={GóHB\Ç \Ô\ì÷$\ZŽö{ið\Ê\Ò\ÛMksqþ¤}üsÁø£“Ïƒx¾Xiñ~RxbaIá¸¯*T½•lJ£5ì§\ãš\à¹*\ÓoF„ñpŸ\à\'\Ó3èŸ™ø\ÄÔ¼Lð\Þ\ê~fY­N®¥uðóˆ]x\×\Â\à\'Š§/¬R\Ë*\âc\Zœ;šºŠ¦²ŽWŠ«]<\'2þ•?co\Ú\×\Ãµ?\Ã\Øõk]+\â‡ ·¶ñÇ…\Ö@\Z‚i­\éq¹óe\Ñu)´móµ\Ék†$A5\ÇØ•üKüøÁã¯\Þ:Ñ¾ ü>\Ön4oIY‚\Öz•“2ý¯K\Ô\í[0\Þ\é÷\Ñ\rÍ¼\ÊAR$Œ\Ç<qKõ­û/~\Ó	ý§þYx\Ó\Ã\Ãe­Z,6~0ð«\Ü$—þÖ¼¼\É‹‘$ºu\ÑWŸK¾(«uoÁ\Û<SFŸÊŸHŸqfU8›‡(T¯ÀÙ¦%¨\Â*u*p\æ2³ºË±Rw”°5¦\Ú\Ë1sm¤¾¥‰“¯\n5±\èOÐ¯\éyƒñ\Ã$£ÀœmŠ£„ñ_‡ð)Î¬\Ý:4x\Û+\Â\ÅFY\Î\åŒs|4^y—ÓŒb\Ûþ\ÔÀÁa*bp\Ùo\ÒTQE.Ÿ\ß!EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE|ŸûGþ\Ý±\Ç\ì…k\Ï\í1ûJüø.÷Á¾\ãŸhšN·<·V—7Ö‹„\×O¬•¼¶³¸’\Òcb ¸1\ìŠVvEo\É-cþ¡ÿ\0‚$i7_b‡öªñµt·2\ÚÎº?ÀoŽ²\ÚÛ˜¤h\Ì\ßÚ·¿¬4k»f+º)ô\íFö9c*\èYNhú¢¿&¿g?ø.gü—ö¨ñ\à\ï„_¶g\Âû¿xšcm£ø+\Å\Ç\\ø}\âKË¡\ËöXm|k¤hv·8Ù„v·—\Æ\ÐKµú»kwk}m\å•Í½\å\ÌI5µÕ¬\Ñ\Ü[\\C \r°O<R\Ä\êC$‘³#$PŠ(¢€\n(¢€\n+\Åþ4~\Ñ\ß\0g/]x¯\ã\×\Æ†_ü?ic6§6¥ñÆš…bm>\Þh\àž\î\Þ-^ú\Ú\æòfš8\å{8g³€ø¯\ç;ö¾ÿ\0ƒº?\à—³º\êzÁ[¿ˆÿ\0¶lÿ\0´\íb´øW ¿…>\ZZ\êšuÀ‚;}gâŸ\"\Ò\àº\Óu4&\ãM\×~ø_\â^$J~\Ð\Ö\ÎUHõ3\\ŸŽ<}\à_†^Ö¼qñ\'Æžø{\à¯\r\ØËªx‹\Æ8ñ\á?\è\ZdtúŽµ\â\rzò\ÃIÒ¬a\0™n\ï®à·Œ¼€Wù†þ\Ö\ßðxwüs\ãbjú\ìñ\á_…¿²…\ïV·°Ô¼=¦Iñ\âD\Zu\Û[2IüQ\ã(\åÐ£\×4‘\êu\r+\Â\Zm÷\Ú	›IA\Z-6_´O\í}ûR~\Ö\Þ&“\Åß´¿\Çÿ\0Šÿ\0u¯\í\rGR³ÿ\0…ƒ\ãMo]\Ò4;YÌš‚ø[\Ãw_ðŽxF\Ê\å˜\î\Ó|1¤\é\Zj)\Ù¢\'\Ë@\ê—û]ÿ\0Á\ÐðI\ÙYõ\ÝGøÏ¨~\Ò~:\Ñ_W³ÿ\0„cö{\Ñ\Û\Å\ÚLÚ¾u¬ºqøƒ}6•\àY\"½\Ý$\Úfµ¥kZ¾‡&X5\Ç#0ßµ\çü›ûWx\ìjþýŒg†Ÿ\0ô;•Ô¬­~\"üUš\ç\â\ç\ÄÄ\î-e\Ñõ­\ÃÐ¾ð\ã\ÂÚ½¼1][\ê:ˆô¿Š\ÚM\Ú]¶û\Ð$§ø ®\ÏÀ?~!|Wñ^\à?…¾ñŸÄŸx†g¶\Ð<\à\ë~1ñ^¹qm4°hþðíŽ£«\êSG´¯•œî‘«;(PM\0}uûQÿ\0ÁMÿ\0oŸ\Û;Q¼½ý¤jŸ‹ÿ\0¬\ïPÏ†.<W}¢x\"\Ö\rQ¢kû\r?Á>m\'\Â\Ö\Z\\\íLt\Ëm*;(<»t¯„«ú@ý’¿\à\Õ\ïø+/\í6šNµâ¿…¾ý˜ü©µ”¿\Û\ß<Go¤ë‰§_\Ù=\ä:‚øÃ«¯x¶1*\Ú\Þiú¥†“«\Ù]H©q§ \Ëý9þ\Èðe\ç\ìqð\å´\ßþ\Ù?>\'þ\Ò:ôX]M\à‡\å>\r|,$Z\Ï©¤kz•Œº\Ï\Ä\ß\Ú=\Ó\Û\Üiº®âŸ†7v\ëEyaz“ù¯\è\Ú&³\â-N\ÓEðþ‘©\ëº\Åü†+\'F°»\Õ5;\ÙB³˜\í,,¢ž\ê\â@Š\ÎR‚«60	¯Ú\Ùþ\r\Úÿ\0‚µ~\ÙGD\Õ<û/k\ß\n<­Å¥\Þ\ÃñKö‰»¼º>·¥E¬\èþ °Óµ\Ûiþ ø·B\Ôl®-Œ\Z—€|\r\â\Øc’t[Ÿ!VWýZÿ\0f?ø\'O\ì7û\év:o\ì\Õû.üøW5„Zb¯ˆ4?iW1»¸\Ò,\Ú\Æ\ÏS\ÔüiªC\âKY6\î\ëu¬^\ê\ÓjW\Î\ï-\å\Ìò±zûJ€?„/\Ùþ øq£®¯~\Û?µ_ˆ|iz¥Ö­ðó\à‰„ô$3isG£¿<[¯­j\ËV’+‹n\Ï\ÃZ\Û-­„w:<{„þ¿doø\"\ßüö#mTøû#|,ƒ\ÇZ–wv?¾ h±|Oø£k«YÚ›?\í½\Æ^:\Z\Ý÷„5¸Y\Åðð*ø^\Æ\ä»\î±\nv\Ôz(8¢Š\ÒcŽ£P±\Å,q¢ŽŠˆ€*¨\ì\0*J( Š( Š( Š( Š( Š( Š( Š( Š( ¿ÿ\0ø=öJk¿þÉŸ¶Î£’ú5ÿ\0ˆgßˆº­¦ƒýUI<gðñõ½w\íA\ÊÁyg\ã=Lû¯õ[‘> þø+ògþû\Ûþ	sûYüÒ´\×þ \é\ß\ï>+|#¶‡HYÖ\Ä\ï„\Çþ}Kð\Ì\Ïm®ø\Ò\ÏJ\Õ~A{n¢\â/_„t1 ñu³»¸°»µ¾´\ÃweqÝ¬\ÊŒWÒ¬\Ð\ÊÕ‘Œr\"°¬¤Œ2‘‘_\í\åÿ\0³ýª`ý´ÿ\0\àŸ_²—\í\ZÚ¡\Õõ\ïü!ð´^9»›P²Ô¯\Û\â†\ì“\Ã>9}Z}>kHµk¯\é:Ž¡}e¼B\Æk\Ãk´ù[›üAký#ÿ\0\à\Êÿ\0\Û|wû/þÑ¿±g‰u´—\Ä\0þ \Ø|Xøo¥\Þ_iq\\Ið\Ã\â\ÜsÁ\âk\rI†uK«	|HÐ¯µj÷owŸ|?§¬\ÐFm` í¦Š( Š( ¼3ö…ýŸüûH|9\Ôþx\â\Ô*\Ëu\áýz‘µ?k¢	\"´\Õôöb…\Äl\áolZDƒQµ\ßm+#¦‡\Ü\è¯C*\Ís2ÁfùF2¾_™\åØšX¼7\r7N¾FJP©	.\ÍZQ’pœ¡8\Ê”_\Ä?’ñ^Išp\ß\å˜L\ç\"\ÎðUò\ì\×+\ÇRU°¸\Ü\"hÕƒ\×Tù¡88Ô¥R0«Jp«N?\ÅG\Ç_‚9ýŸ>#k\rü{§µ¶¥¦I\çiúŒI)\Ó<A£Nò\r?]Ñ®dDZ}ôq¶%­\Ìw6‘ÁguoCû5þ\Ñ>5ýš~%iž=ð\Ã\Ëj^+?xzY]tÿ\0h-(k­6ñUfU/.Ÿ{±å°¼\Ù<a\Ð\Í\ß\Ô\íyû\'x7ö«øzú¨¶úGŽ´\î®ü\ã/\'7\Z>¡*«K¦ß´jf¹ð\î°\Ð\Ã©h†K}J\Ú\'¼²‰$þL¾#|;ñwÂ\ZkþñÎ‘q¢x›Ã—\ÒX\ê67ø”†\â\ÞU&;›;¸+«+¸Yà»µš˜$’cvÿ\0W¼ñW‡|w\à\ÜvE\Ä8Ló\ê8©q_ÖŠú¾a…ª•\íl6ùž7u	{l¯\Z\ãM\É)`±8ù\ãúJ}x\×\è‘\ânUÅœ˜f´¸G›ÿ\0jx{\Æ8i\É\ãr|\Ã\'‰ÿ\0W³zñ‡³Žk¦¦©J´^?Ê£:ñ„\å\Û‚þ\Êþ|eð?ÇŸ‡\Ú\'\Äo\0\êI}¤jÐª\ÝZ;\Çý£¡\ê±\Ç_hz\Ä\Ìmu+‘VD9Žx^\Ëg–\Ò\æ	¤õjþ@ÿ\0c\ß\Ú\×Å¿²¯\Ä$Ö¬¾Õ¬x\ÄZZx÷Á\ë\"Õ´øZA£§‰™!¶ñ\'žm.\è¼i ’\ãO»±\ÞLWú\Êø\ãÿ\0	üPðvƒ\ã\Ïjöúß†|Ia¡¦\ßÛ²œ¤ƒ\Û\\\Æš\Úú\Î`ö·Ö’\â[[¨¥†@\rø\ë\à¦e\á.Ï†Uñ\Ü›V©,‹5’\æ	YÔžQ˜\Ê)Fü,o\ìª{°\Çá¢±4”jG‡\Ã¯D¿¥&GôŠ\áex\\«Ä®\ÃQ‡ðý9rS\ÅBñ£O‰2HM¹\Õ\Ê1\Õ9Uz	Î®QŽ›À\â%:50\ÌweEW\à\çõ\ÈQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\Ó\Ãm·\Åooo“O<Î±C1!ye–Y\n¤qFŠ\Ï$ŽÊˆŠYˆ\0šÿ\0?¯ø.·üU\ã+\Åþ;ý?\à˜ž\"µÐ¬<>ú¿ƒ¾)þ\×VñC{®j\ZÒ‘c«\è?³\áy%³\Ñ,tô\Ý2û\â­\í¥Æ¹w«n~E\áøôm+Æºÿ\0\èü£ÿ\0Tñ\ì‡û8øWö0ø)\âyü=ñ«ö©\Ðõ=G\Ç\ZÞ‘yw§ø‡ÁŸ-¯g\Ñn§\Ò\î\à‰^\Ú\ë\â·e¬xj\ë;\ëk\ë[Ù´\Æ\Õþ`\×x\ë\Çþ9øŸ\â_\Æÿ\0üa\âoø\Ã_½¹\Ôu¿x»[\Ô|A®\ê—×“\Éuuu}ªj—W—\Ïq4³;I)Ì’3`d\×#E\0W\ïü«þýº?\à™&ðÿ\0†\ãñž±ûB~Ë‘6§kÿ\0³—\ÅOj:®—£h6³\éñ´Ÿ<Y|u\ro\á6µa¥Z\Ý\Ø\èö\ZI¾øt\Ò\ê7\Þ ø¯_A§\Ü\ØþQ@\îuû~Ü¿³\Ïü3ö}ð§\í#û5ø­üE\à	,õ+SŠ\Þ\Ã\Å\Þñ-¢FuOø\ÛD‚\îôhþ\"\Ò\ÚX\Ì\Ð\Çuwewo,úeõöŸsou#ÿ\0iÿ\0\Û\çö.ý‹ü?7ˆÿ\0jO\Úg\áÁ‹T±»Ô¬ôø¿O>4\×m,\Çz|\'ð÷J}KÇž1ž\ÕÔ¤ö~ðÞ³y­n\Å‹ÀŸ\Ûcö¶ý˜|ñÀ?³\Ç\í\rñW\àÇ„~,Å§\ÅñGøw\â\ÍG\Ã	\â#¥4‡N¹’\ïM’CO¿³\Ë:–“wa¨,2I¹0»F~xñ‰<C\âýwVñO‹u\ík\Å&\×\ï\î5Mw\Ä^\"\Õ/µ½wZ\Ô\ï$2\Ý\ê:¶¯©Os¨j7÷R³Kqyyq5\Äò1ydf$\Ðú_~\×ðy—\ì9ð­õ\ÍöTøAñCö™ñ‹jvzoŠ5Á\Â†——¶\Z…¼—q]\ê\Ñj¾3»\Ðu‹uwgx|+§\êV\ìG{¤B\Ò2§óû^Á×ŸðV?\Úa5ü:ø…\á\Ù+\áþ¦º…Ÿö/À_[Á\ã™ôË›\Ë[½<_ü\\ñgöÿ\0t\ÍkJû/‘·ð\Þ\ã\á»^Ásw¡eq\Âÿ\0š\ZûKö\\ÿ\0‚t~\Ý¶¦©›û.þ\Êÿ\0¾0@\×\í¦]xŸ\Ãþ¿±ø{£\ê+mö±e\â?‰ž \Z?\Ã\Ï]Ko‰m\àñ‰ô\É.U¶Y•H\Î¾.|Sø\Ë\â;\ïüZøã‰ž)\Ô\ïo5ÿ\0x\ë\Å\Z×Šuk«ýB_>ú\î[\Ýjòòs=\Üß½¸p\à\Êÿ\03\ä×žWöû%ÿ\0Á˜¶O\Äq¦kµ§\Ç_†?³¾‡pöò\Þx_Áp]üYñü6wr²¤ð÷„m5;;ò¶7–c\\¿µ)¾\æ\ÓQ¹UT\é\ëöAÿ\0ƒW\à’¿²\ãiº\ïŒ~\ëßµw\ìdµ»\"ý£5\Ó\â?\n[]¥“\Ú\ßAað›AƒAøq}£_J\æò;\è~<\Ô4û„‰¬µ¨öÀ\å}ð3ö\\ý£ÿ\0i­z\ß\Ã³\ßÀßŠu»›³a—Ã¿\ëþ\'U½ý£\ì“\Ý\é–3\ÙZ\Ü•bº¹…\Ù\n²‚sý!þ\È?ðhü\Ó\ã\ëi:\ï\í©ü1ýŽü	\ä¯\ãY>$|T“N\Ôô˜µK­;á€\ïŸN¶º¶žtÓµ­Çž?ø\â\r\"\ê;”}.\âH-þ þøkð\ï\áW‡\ì|\'ð\ËÀžø}\á6\Î\ÃN°\Ð<\á\Í#\Ã:E­Ž—kŽ›k†igl°\Ø\Ù\Å­ªùdC,i…®Ú€?”?\Ù/þ\rÿ\0‚füm+[øññ;ö²ñM¢E-í§µ\×ðG\Ã\é\î\ä\Òg°\Ô ‹\Â~}/R“Kk»ƒ©\é±j>%¾\Ôlnm\íw\êW)£ÿ\0HŸ?e\Ï\Ù\ÃöZðÁðo\ì\åð7\ágÁOKœw¶\rü øZMeôø„—~!\Ô4»(5/jQD6ÿ\0jk×šŽ¥!%\åºwfc\ïPEPEPEPEPEPEPEPEPEPEPEPEPP\\\ÛAymqguOkw¶\×0H7G4\Æ\ÑM‹\Ý$™wREOE\0‰ü¿öN›ö&ÿ\0‚Œþ\Ö³\ÄZ3h~ð·\Å}{[ð’iP\è–#\áÏ¥0ðGö6™o,\ÑZ\èpxZ³±\Ñ\ÕUôûH$X\ãW>ôÿ\0ƒaÿ\0kû+ÿ\0Á\\>Áª\ê\é¤x/ö„°ñ\ìñ\ã¹Ô´­Mš?Eo\á#ª\ê:´\Ã¥§´^\Åm«s¨jYXÛ¬“O\Z\×\ë÷üµû |zý—¿m¯\rh\Æ=#\ãƒu¿‚?µ-3Ë¶ƒ\Çÿ\0¤‹]ð&£®j\Íp\Íu«x\ÇÀšö«¢\é61\ÛG¦—ð–\êg‘¤¹þ\'|	\ãoü5ñÇƒ~#x/R—Eñ€<W\á\ïxOX…Q\æ\Ò|K\á]^\Ï]Ðµ8’Eh\Ú[\rR\Â\Ö\ê5‘Y¢”©\"€?\ß6Šù¿ö<ý¡¼7ûYþÊ¿³\Ç\í/\á2©¢|pø=\àˆñ\Øý¾\×T¸\Ðõøv\Âÿ\0]ðÆ¥{dM¬ºß…5\Ù5/\rk\Ë\rkJ¿·!Z\"\Ò\0QE\0QE\0WÀ·w\ì_¤~\Ô	:ß†\à³\Ó~1øJ\Æc\ámZM–ðøŠ\Æ3%Äž\Ö\î1³\ÜH\ÒI£\ßM»û+Q•þhì¯µ\r\ß~Q_EÂœUðV—q/c\'‚\Í2\Ê\ê­\ZŠò§VÝ­…\ÅRº|&*“•M	{µ)NJñ—,—\Åø…\áÿ\0\nø£Áù\×q¦YO5\áü÷,>*„­\nô*E©\á±øEœð™Ž\Zx¬.Ÿ¿CN´£\Í	ºî…¬xcY\Õ<;\â\r6óG\Öô[\ë3U\Òõy-ol/\ì\åx.mnm\æT–¡•C+¯¼`ÿ\0\Û[Wý˜¼`¾ñU\Å\î§ðk\ÅW©ÿ\0	–›®&ðÎ£1†ñf‹\Ì\å\í\ã@º¾›\ß\íK5\r\Zµõ­ \Õ_ø(Ÿ\ì$Ÿ4›¿Œ\nt´O‹º\r†u\Ý\Î=‡\â6‹c\î\â†%\Â?Œ4\È#òô¹p%Ö¬•ty\ÚY\íôqóSqö³\Íms\\[\Ë$3Á24r\Ã4Nc–)cp¯‘º²:8Œ¥X¯õƒ„8«þ‘\Þ\âðy†•O¬P§ƒ\â\\†u\"ñ¹&g\Ê\åGƒª\â\êF¤%Š\Éó(B\ÓP•:‰W£‹\ÃSÿ\0ž|=ñ[\èK\ã^[™dÙŽ&“Á\â«f|\r\Å\Ô\èIe|S‘©Æž\'/\Ìpñ’£:ªX\à8“#©;\ÓuaZŒ¥„\Åe\Ø\ê\ß\Üö‰­\é$\Ñô\Ïh\Z•ž±¢kV6Úž“ª\éó\Çuc¨X^D³\Ú\Ý\Ú\ÜDZ9aš\'WGS\È<\à\äV¥5_ðN¯Ûº_‚Ú½—ÁŸŠú¤’|%×¯\Ùt\rröIe?õ\Ëù\Ô\îgb\ÞW„uK™$—Wˆ+H¾—ûj/\"	5Ÿ´ÿ\0JQKñG42$\ÐÌ‰,R\Ä\ë$R\Å\"‡ŽH\äBQ\ÑÔ†GRU”‚¤‚\rš-øUžxO\Äõr\\\ÉO–bLFAF›†5ÀFI]\Úñ¥Ž\ÂóÂ–?	\Ì\åB«H:˜Zøjõ\ÝO£Ÿ\Ò…>ü‡âŒ\ÓÀg\ØC\Æ/:Ê¦3‡ó‰Sri_–xœ§\ÉV¾O™(Fª©F¬h\ãð˜\ì&ôQE~X~þQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\ïü\åñ§Yø\Éÿ\0£ý®¢¼Ö®uO|(½øuðwÁ¶33›\éžøa\áñ&•b\Ìp\Íñÿ\0Æš\Ì\à|¯{ª\ÝH™FZü	¯Õ¿ø.tw‘ÿ\0Á_¿\à¢?m¶»µ‘ÿ\0j?‰rB—ˆ\é$¶mªŸ±\\\ÄÖ—V‚‹\'\\£\Ú\É	RF\r~RPEPEP_\ÙOüþ\rH\Óÿ\0oŸ\Ù\Ç\àÿ\0\í‘ñ\çö·ÿ\0„;\à\ç\Å\í?[\Ö<;ð\×à§ƒ¥¿ø‹s¦i:·ˆ<#tšç¾ [[xwÁ\ÚÎ•\âýò;?NøñLÕ´¨7\Úkö\ÝG,Æµ²—ü»\áMWÁ¿ðF?\Ø7J\Õb’¾øO{\â»¤Ò¼s\ãOx\Î\ÂU	ÈŽ\ê-{í‘—ù\Ù.\Ï\Ê\Ë@ß²wü¯ÿ\0—ý‘¿²µ/~Ë¾ø­\ã1Uÿ\0\á5øù,Ÿµ+‹\É4‰4}B\ãûÄ«?„-\á\Ôaž\âyt\Ø<:ºuµ\Ü\ßh²··–(]?k´#I\Ð4½?C\Ðt½;D\Ñt›H4ý+H\Ò,­´\Ý/L°µaµ±\Óôû8¡´³´¶…(-­¢ŽcUH\ÑTZ4PEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP\àü³û%\Ú\Çþ	%ûCZišCj¾5ø“ûBx [irjÚœ7Ÿ¥šOG¦E±›Yo¼¨øž\Æòü‰¦—=ôŒ…\×øû\×û\ìx³Â¾ñ×…|M\ài6º÷„üc\áýgÂ¾\'\Ðïƒµ–³\á\ï\é\×:Fµ¤\Þ,o†\×Q\Óo.l\îr#˜¦p®­†\á™ûnþÍž\"ýk\ß\ÚCöañG›.§ðK\ãü	o¨I§¾’šÿ\0‡ô½j\äøO\ÅVzl’\Ìözg‹¼+6\â}&–F]/W´\ÜÄœ\Ðú6Áµ£ücÿ\0‚ux\Çöm\×57ºñ\ì©ñWWÓ´+[›­4I\Ã‰\Í74x4ý>\Ö8¯WO±ñdþ1i\ï\ïŒ\Í=ö¥$)(ŽAýs\×ùSÿ\0Á¢?µ\Ä³ÿ\0ü\Z‚^ \Õ^\ÃÁŸµ÷\Ã?ü4X\äž\Â\ÓM|ÿ\0>^jw7`N\Æ\ê\×KñŸ‚ô[)Ú‰<m¢ÀRL(_õX Š( Š( Š( ¿?à¥¿°—öô:\Ï\íð{GÛ,Ú—\Å?	i\Ðü\Ú\Ô +\Üx\ßH¶ŒcûV\ÝC\Í\âk8—:¤;õ¸”jQjGUý»¤e¥YC+¬¬VR0A‚\àƒÁ\Zû¿|BÏ¼3\âŒd5Ÿ´¢\Õ\ÃRRXL\Û-œ\ã,N_ŒŒw§UEN•K9\á±¥‰¥û\ÊQ?$ñ³ÁžñÛ€³>\âü7\î±\ëY6qFœ%˜ð\îwFœ\ã‚\Î2\Ù\ÎÖ­E\ÎT±£K‚«‰À\â?sˆ¿„Šý\Ãÿ\0‚j~\Þ\Ø\ï¢þ\Î5…]\Ì:o\Â\ßjS\Ç\Zi±ò\í|­]L\ëÿ\0¹Ù’\Þ>N›9]g:t¶\Ù|üƒö?o5O4—>Ô®\Þ\ï\Ç~°‰œx?R¼›/­\é\ÖñF|¯_\Ï&.bE¢^Hˆ4\ëˆR\Ïñ½\âut,ŽŒXd2²œ‚=\"¿\Ô\Úôx\é)\ášq—´Á\ã£\ÍF·-7›ð¯P¦®¥þ\ï…u9j\Ó\æX|\Ã[IO\rŠ…Cþð˜Ÿ>ƒ~:\Ê5!\ìs<®qŽ\'\ÍYp\çˆŠ¯t\á>_\ßeù„h9P¯\É,^M›aý\èS\Ç`*\Ñ?»Z+ñÿ\0þ	Áûv\Åñ?M\Ó~ü[\Ö~#i6«m\àŸ\ê7\n$ñÎ™k°\Ñ\ï%püM¥Z\ÂL³<šÞŸ2\çS´–mOö¿Ê®>\àLÿ\0Ãž&\Çp\Ç\á\Ý,V^\Ó\rŠ„eõL\ÏRRXl\ÇRI{\\6!E¯\ç¡Zp\Õ\ãOB­8\Ð_ƒþ.p¼”ñ\ïc=¾cÀV”c\æôaNX\ì“6£ý†;*wW£‹\ÃT\Ãcð“­‚\Åa\ëT(¢Šø\Ãõ\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ü¾¿\àñ?Ø§Xø/ÿ\0ð\Ï\íy¡i¿ð®?k\0\è)­\ê©m;Lø\Íð«H±ð^½¤ÿ\0£\Ú\Çk¦Ç®xNð7ˆlbº¹’ÿ\0[Ö—\Æú‚©†\ÎF_\ä2¿\Ûwþ\n¥ÿ\0\êøoÿ\0@ýŽ~\"~\Ì^:’\ÃD\×õ\ãñ7\Â\Ýi\âö\ç\á\ß\Å\r)\ß\Ã^#£_·G§\ÎòÍ£xŽ\Þ\ÆE–ÿ\0\ÃÚ–£h\ÑÜ«‹y?\Æ\×ö¶ý’~<~\Ä?<uû9þÑžÕ¼ñ#Àz­ÅÕ­ý­\Êi^!\Ò\Öyc\Ó<[\á\rVXbµñ\'„<Co¿\Ð|A¦´\Ö\Z…¤£J’\ÅÍ”QE\0QOŽ9&’8a\å–WX\âŠ4g’I‚¤q¢‚\Î\î\Ä*ª‚\Ì\Ä\0	4\ê_>ü@ý£>2ü.øð«G:ÿ\0ÄŒ;ð¿Ã¯ij\Û\Åy\â?\ëš.–·wr~\æ\Æ\Æ;«\Èå¿¿¸+mcg÷w\Â\ì?\Ýö|ø\'\à\ßÙ¯\àWÁÿ\0\Ùó\á\â]§~	ü6ðg\Â\ïBDšý¼?\à\Ã\Ã\Ú\\·óF‘G-\ìÖ–\Íw*F‹%\Ã\È\êŠñ\éÿ\0µÿ\0Á\n<Eû6Z\éÿ\0ðQ?\Ú\ãÁóh¼U\áû«O\Ù\ï\á‰,&¶Ö¾ø[\ÄŸg¾ø‰\âš\'\Óü_\â\Z\æ\çL\Ñô‹ø$¸\Ñ4+û‹«˜,õ{ˆ>\Ëýµ\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP_\æÿ\0“þ\É#\á7\íûð\Ûö¢\ÐtU³ð\ß\íCðª\Â\ÛÄš…¦•}\rµ\ç\Äß…/†u­KY¸¼¸µ¿Ö¯¼?ƒm–\Ê\Î\Ú\Ål4Á¤Žg¹iúyWóÿ\0h~\ÇOûJÿ\0Á+¼Kñs\Ãzk¿c\ïhŸ\ìd±Òµ\r[\\?µGÁ\ßllVÌ´V\ZV£\êš/Ä¯ê·´øg{+Moš\\ü¹ÿ\0goŒž$ýþ=üøó\à\ë\Ùt\ïüø¡\ào‰zôö\×sZ\êžñ¯\ÚM\rµêµ¤ò¤– \ÇÊ˜]ð²|¤\×û¨|\"ø—\á\ïŒ\ß\nþ|\\ð”\Ñ\\xg\âoü-\ã½\ráº·¾U\Ó|S¢\Ù\ëV°5Õ£=¼\Ó[Gx-®\Z&(\'ŠEÀ þ	uþ´\ßðjW\ímÿ\0\r3ÿ\0•øo\àcS[\Ïþ\Ê>0ñ/\ìõ®Á\'ö]½\Èð¾,üYð\Âö\r:Á\"4xü\â+Â¶Ú¥üF\ãW\Öü!\âI\Z{‰m§e\0þ”¨¢Š\0(¢Š\0(¢Š\0(¢Š\0­ygi¨\Ù\Ýiú…¥µõ…õ´öw\Ö7EugyguAskum:¼7\×»\Ã<#\Å,N\ÑÈ¬ŒAþaÿ\0\à¡°õ\ß\ìõ\âY~#|;\Ó\î.~\rx¢ÿ\0Áu/€õ«£$‡B¾‘¼\É‹p\Ê\Ç@Ô®¶\Óý‘}+\Þ\ÃmuªP5\Ïø¯Â¾ñÇ‡5Ÿ	x¯I³\×<;¯\ØO¦\ê\Ú]üK5µÝ¥\Ê‘0\Èx¥\\Iª’\Ä\Ë\"+\Öüñk:ð—‰¡š`ý¦3%\Ç:X~!\É}£,\Ã>Z´¹¯\nYŽšu0X›^.U(Toˆ­9ý%¾Ž¼1ôŠ\àJ¼?™û·Šr¥_ÁœS\ìyñ6g8GŸˆpµ\\FK™û:T3\\•§P\ÆQŠ\Æà°µ!ü9X_\ßiW\Özž™yw§jZuÕ½öŸ¨X\\Mg}c{k*Okygwnñ\ÜZ\Ý[O\ZMoq‘\Í¨’D\ê\ê¬?¨Oø\'\ß\í¿gûGxZ?‡þ?¾¶´ø\Õ\áM=>\Ö\í\å\ÛE\ãý\Ùv\ÂG§B»bMf\Ú5A\â]6\0¨ec¬i\Ð\Ça=Í–ø¯ûo~\Æþ ý—<t\×:j]j\ß\n¼Suq7ƒµ÷\r$–L3,¾\Öd\nu;9†S¨YªÜ®dK•\äø\ËÄŸ¼S¡ø\Ï\Â:­Ö‰\â?\êúž•©Y¿—=µÕ»‡V]f9b‘^)¢wŠTxÑ¿\Ò.<\à®úEøy\Ç\å8\Ü<«\Õ\Ã\ÏÂ¼C\'[.\ÆIr\×À\ã¡ÕŽ­Zk	›`e\ïÑ«J5¡¬a¨³ü@ð‹\Å/¾…>3\æ¹?\åx\ÚxJ\ÚYGˆ<R­°\Ù\ÖY	{L.m”Õ°ó\Æ\Ð\Ã\Öy‡\æ\Ô\íG‡\ÄO\rVR\ÇbbrW\Æ?±—\í{\áoÚ›À1\\4¶ºWÄ¿\Û[\Ûø\Û\ÂþbG!˜*\Æ<A¤ÀX¼š.¥\'Ïµw¶›r\æ\Êveû-\Å\×\Ù\ÕþOq\'g<#\æ<;Ÿ\àª\åù®Yˆ–‡ªº­iÖ£5\î\Ö\Ãb)¸\Ö\Ãb)·N½Â­98\É3þ‡øøc\Ä~\ÉxÓƒ³Z\Ï\ç\Ø8c0\Ú[;Æ¶EþóŽÁ×L.;^0\Äa1Tª\á\ëB5)\É\"Š(¯úÀ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯\Ï\ßø(Oüö?ÿ\0‚›ü,‹\á—\íOð\Ê\ÇÄ—ZZ¤Ÿ>%h\ÄhŸþ\êÚ¥›[Ë¨ø7\ÆŠº½”·eªøZý\ï¼#\âK­+JohZ Ó¬ü\Ð*(ü\ÈmOø3wö\âøS®_\êÿ\0±—Ž¼ûPx\ëS\Õ_Jðçˆµ½\áw\ÄýC`“M]ro_i^ñ¥r$¸‰\äÐµg¶\Þ4ø<ø£¯\Æý_þ\rýÿ\0‚\ÈhºÄš%\×\ì	ñ®k”\Æ.\ìcð­þ(iš\äë–¾$“H\ï\\”[\Ï1c)3\"\Â\è\íþ\Í\ÔPùþ\Ï_ðj\×üã–³kg\âo\Þ\Zýžô3ª&ªx—\ãg|=¦A¤Á-\Í\Ìz·ö\'„n|]\â=cNA”\ÇB\Òõ+\È..a2Yˆ„’\'ö‹ÿ\0¢ÿ\0ƒ]?cø\'Îµ |iøÙªÿ\0\Ã\\þ\Ó:PÓµ\r\Ä/ðõž—ð‹á†³l\Æó\í>\Ï&§.£¯\Ù]¼p\Å\ã¿\Z\êz¥û\r/O\Õ<3\á\ß]\\ê¶—Ÿ\Ó\í\0€\0\0\0\0\0\0€\0\à\0\0\ÐR\ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\åŸ¾øk\ã\ÇÁ‹üe§\Ùj¾ø·ð\ç\Æ<E¦\êQ¼\Ú}\î\ã/j¿·½†6W–\ÖK{÷Y\âS™\"Üœ† úþþø“\à/\ÆŠ¿<_kg\âo…¼]ðÿ\0Y‡S\Ón´{\æ½ð¦¹{£=\Ìú]\àV?m[E¼Ž\ÞlºC<3ÿ\0Y¿ðfW\íf>~ÜŸÿ\0efø[xwöøW·£\Ã#\èÖ¶\Ò|Dø9u{ª\è­5\åýÝ¶¥q<\Þñ/Œ\ì4ý#H†ö[Ë›\Ós<	\r‰™>Tÿ\0ƒ³ÿ\0dQû6ÿ\0ÁV¼Qñ;BÒ’\ËÀŸµÇ€<9ñ\ÇLš\ÏN»¶Ó¡ñ\Ü\\ø\'âž“.£q,±j~ ¸ñ‡­þ keòâ±³ø‰¢[ùI•\Ï\âOüÿ\0öŸ¿ý‹ÿ\0moÙö£²û{[üøÁ\áøŠ\ÛI¶µ¼Õµ›õÒ¾!i\ZM½\ì\Ööoª\ë>Ô¼E¥i¦\æ\âc½¼‚Y%EBÀý\Î(¬\íV\Ó5ý\'K\×t]B\ËVÑµ­:\ËV\ÒuM2\îý7R\Ó5+h¯,5\r>ú\Õåµ½²¼µš+‹K»id‚\æ	#šx\ÝX\è\ÐEPEPEPEPŸüPøc\àÏŒ^\×~ø÷H‹Xðßˆ-Z\Þ\æ\Â\\\Ù\Ü(&\ÓS\ÓnJ³Y\êz|\Ûn,\î’.\ÉX$š?’\ßÚ¿öYñ¯\ì»ñ\ï\Ãz\ä3j>Ô¦¸ºðW‹¢…–\Ë^\ÒDŸ»\ã)i«Y«G§§—cÿ\0</5¤\Ö\×bU\âŸ~ø\'öˆøs«ü<ñµ k{´kW…\ê>\ÖcFz¶+‚VH™¶\\BO•yjóZ\Î\Z)XW\ïþxÝ˜xOžýW*ø\Þ\Í\ë\ÓY\Ö]\ç<W\ËMg9u6\ì±t ¢±4ch\ãð\ÐT§û\êXZ´Ž¾—ElŸ\é\Â\ÚL0¹g‰ü7„¬øc9š*Y®sV—guTy§—âª¹KŠŸ4òŒuYb)_\r‰\Ì0ø¯\ã\ï\á/ÅŸüñÞ‰ñ\á\î³.\â\ådC†’\ÇR³f_¶i\Z½žôK\í+Q„5½\å³21Fómå·ºŽˆ¿­\ï\Ùwö˜ðW\íAð\Ö\Ç\Æ\Þ’=?[µXø\Ë\ÂRÜ¤Ú†5Ád\Î\Ø\Þ\ëK½\Ú\×\Z>¨°¤W¶Û£‘-\ï\ío\ì­?”Ÿ|sû<|F\Ö>x\æÅ¢º²•¦\Òuh£i¾!Ñ¤‘Å–±¦L\ã\ÌkûØ·4–—5¬\Ä\Éf\Ùý›?h¯~\Í?t\ßøBá¥¶\ÊYx—@šG\Zwˆô)%\î´\Û\Ø×¿\È%´¹Pf²ºH\îa;«ÿ\0sø\Õ\áE\ã	à¸†qñ&/Ž3†óª3‡Õ³¬¾¬^\"N2¼~,=w\',jžö_‹œ¯\ÉJ¶.ÿ\0\'>‹Hþ-ú*x‡™ðW`óZ\\Œ\Îe–ñ\Ï\â©\Ôúÿ\0\ç\'%N!\Ë0Ž\î8\ìiÂžg…¡\îg9m:j>\×†\Ë*\ÒþÍ¨¯$ø%ñ§Á?þ\è¿<\r~—Zv§\Û’6¿\ÐõEE7šF¥1ò\îm°¯\Ì;˜IŠU5\ëuþR\æ9~;)\Ç\âò\Ì\Ï_˜`1p˜\Ì&œ©\×\Ãb(MÓ«J¬%¬e	&ŸGºm4\ßý\n\ä¹\ÖS\ÄyF[Ÿ\ä9†6É³Œ1\Êó,\rh\×\Âc°XºQ­‡\Ä\á\ëA¸ÎZrŒ“\Ýk%$\Ò(¢Š\ã=0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(øüÿ\0ƒ\Éÿ\0d\ßø[ß°\Ã\ÚcD\ÒbºñG\ìµñ^%\Õo¢\Óõ\íN/†\ßm­ü;\â;X¥µ\Ýk§ii\â/Á:¾«}z‚<iV°,Šò­˜Uºo\í\Ëû4\èß¶7\ì{ûI~\Ì\Z\Úi¾OÆ¯„4ðV“u¬¶\Òô\Þ\é3\Üx\ÄW\Ñ\Ø\Ë\r\Ô\Öþñ®ƒ\â·ŠAö¦y²G#\Æ\ß\á™\âOk^ñ¿\á?i—º/ˆ¼/­j¾×´}J\ÞKMGIÖ´[\éô\ÝSL¿´”	-ol/­§µº·†x¤\Æ\å4þÁ¿ðn\'\í`?k/ø$\ìÁ«\êZ£j~2ø1\á\éÿ\0g¯™£\Óí§Šo„\îš…1gc+´vƒÀC\ÂÖ¶÷w‘\Ãu©Iguy2¼’<¯û£_\çuÿ\0M~\ÖK¢|Sý­?bmwQ[x\ï\Â\Ú\íð\ê\Éâ±‚5\ï]Yx\âM¿\Û$e¿½\Ôõ^ðö›¥A\æG›\áŸj,Š±J\ãýh\0¢ŠkºÆ¥Ý•FYÜ…U¥˜€¹4\0\ê+ÿ\0Ä¾\Ò\ãYµ-wH°‰\É%Þ£idŽNIUx\ï\Ïë‹½ø\Íð\Ê\Æao\'‹ô¹¦bÁ\ÎF½T!\Õ%\Î9\\ƒ\ë@ŸE|ý¨~\Ò\ß¬DŠ.µK™£l¢\Ó\'M\ã$e^a\Z‘\ÇlðA\î3\Å^þ\Ö~EÎ\á\ÍJ\à† ‹›«K|Ð¨\ÞÇ‘\ê\ã\Ü\ëj+\á«ÿ\0\Ú\çS\Ît\ÏiÀ÷o.\î¤*y\Æ\ï)!Ž8V ’~|žJ\ïö©ñü\î\Æ\Þ\ßE²³…K\'¸d\Ï@³! „¶Gp\Ü`ôJŠüÀ½ý¢>*]«¢xŒ\Û#\ç‹[A\'8“È’\à\ÑJÎ¸A 5r·þ$_+%×Œµ÷RI\n—\ïR\Ü¸RGaÁ\ë@aþ\Ö²Ï‚ÿ\0jo‡“xc[\é^,\ÒR{¿ø½-\ÖK½Rt­\î\0\Û%Ö‹¨”Hµ+-\ã\î\Åw[«hš¿ôø#\ß\í\rw=\ÌZÇ‹~\Z\é1#ks­¬\ß\Å:\ã“\"E ¬ð\àð“&G\ÌvŸý{y\â¯\ê*«¯\ëWF\íZ­ý\Æž\ËpÈ dŒ*¨\äñ’s\ïŸ¾5O\áøü3\âK©fðÖ¡:¬;Ht{©\ß03­¤\ÌW\Ï^B·\ïß²ð^$xs’\×\áþ\Í0\ß\Ùu1‡¡™`©\æ\Ùõf\ï_û?\Û\Ê\Ô)be\ïÖ¡(Ô¡\í\\\ëS§NµZ\Õ*1ø»ôBðC\Æ\Þ)\Âñ—d9‡öõp8\ÌVGš\×\É¶°ôRŽ\r\ç|U|£†\ÅS©Cõ~L-z\Õð\Ø|-*yû~Â¿¿eŸ]\ë÷Ÿ<)?„µ8¼¿x#Mðþ³«\éº\ì1+nRûQ¿ð÷ö§d\ì\Ïo©Ee¨,\Ëö²\Å3mý¹ø¿ð\Ê\Ò³M\ãM\Î2y!!¸{Ò–#W¶ŽhÙ‹ +œžk\Ñc–9£Ibu–)QdŽD!’H\ÜWV¬¤G\Zø{ö„ø-ö6»ñÇ†-H´•š}oO·‹iX–{øbAþ¢C\Í\Ê(ùù\Ê>ú¿\Äq¯\çþ gs\â%«‚\Äf•(\Ò\ÃÔ¯ƒ\Ë0oµ§E8\Òu\Ö…‰«¿g\Zø§Zº¥\ZtUOcJ•8~«\ág…<\à\ß\n\Ò\à\Î\Ã\æx<‚†/£„Ì³\Ì\ß;öñrS\Ä}RY®/°4*\ÔN´ð˜á°’\ÄÔ¯Št\'ˆ­W\ß/¿h…\Ús”¹×¦\à‘˜´½Fp@\êWÊ¶bG¦[°\'Š\æ\çý§þD\áaþÚ¹RÁVXôóg\'\0±žHü±ÝšMª£– Í¿ó\ëúŽ×½ò\'\è\ç\è]÷\íY\à\ÛWa«\Þ ?+C-€\'œghlzûc©\Ís÷?µÎ–2m<%x\ëü\"}F\Ùò:\íg×žzWÂ”PÚ·Ÿµ\Ì\ëƒe\ákG\È\åf¾¹8$-¡\èz\áˆ\ëŒñœi¿koJ?s\á\ÝÛ¯ÞšöV<ñ\Ô2Ž8\Îs\Ûü‡E\0}Q\'\ícã’Œ±\éFþ<›\ÉSŸ½sŒc÷MŸnA\Ë?µ/Ä’ùÎ‰\Zz\r1d9\Éþ,|úé‘Žù5ó]ô<ß´\ß\Å$Å¨i±“\é¤[m=B\Ë%Àö\ÇNŸ	?iŠ\Ó\0$\×mÐ€A0\é6g$ùd‘r0@$ öðz(Û¿\á¢~-©>_ŠB©\ÏH\Ñ\ä\Æ}\î,\î\0ÿ\0k Œƒ\É\ÍFøùñY\ÎO‹n\Ô\ã%½¢€s\ÛV%\\ú|¸\ÇŠñ\Ê(\Ù\Ç\ï‹^[Gÿ\0	…\æ?a\Ñ÷ps•\é\Æt=3¶qŸ¡\"ª·\Ç?Š\ÌÅ¿\á2\ÔÔœ•mñ‘\ÆBùA\0#ª…\nO8\Ï5\ä´P°\Åñ÷\âô@\ãK¶\Ú\ê\Ã\Ì\Ót9~\ãP\Æm.I\0ui\nH¹GVBT\ß´w\Æ!Œø®#Œÿ\0Ì¿\áÌŸL\ãJ`:t¯¢€=\Ò\ÛöøÁÅ¼òøš\Þò8gŠim.4\r-®\ãŽEwµ¸kM6\Ö\í`A†VµºµºXÙŒ0Ë¶U\ë\Ç\íkñø´O~\Zvº?Ÿˆ\Í|¹E\0}Soû[xùn­\Þ\ëAð„öK<Mwooi­Z\ÝOl$S<V÷’k—‘Z\Ï$A’+‰,/#†B²=´\ê¦&\ì\í†\Þøw§‹sÿ\0ºÈ¯‰¨ ·\íÿ\0lvº·K¿\0K\r“O\Ý\Ü[xn®¡¶iO-½œºœ7S\ÇgŠ\Þ[\ë8\æuX\Þ\æc*öö´øp\æ\r\ãUú\é\Úôñ¯\Ï\n(ôV\ßö¯øm5Õ½¼ºo‹\í!žx¢–ú\ãM\Ò^\Ö\Î9$T{›„´\×n¯šŒ²­¥\ÕÉAo4›cnÀ~\Ñ?§Œ??ø¤=W\å\Õú—oûA|¹º·³\Æ1$·S\Åo\Ü\è\Þ\"³µY&‘cF¸¾»\Ò ±³€3-\Í\Ý\Ä\Ð&\ég–8Õœv\âWÃ£\Ó\Ç\Þ\n?OhGù_\×\ä%#¥\0~À[üCð\r\ÝÕ½§Ž<u{y<VÖ–vþ%\Ñfºº¹\Ö(-\í\í\â½i§ži]cŠ(‘¤‘\ÙQ±\0öø¡“\êh¯\Ý8úP\í}ø±kywcuõ•\ÍÅí´±Mmyk4–÷VóA – ¸…’XeŠEY#’7WGP\ÊÀ€k³‹\â—Ä¨H)\ã\ïœy\â-N~ž¢\æ\â`s\Üƒ\ß<\Ð\ë¥ùmaûA|Z°*G‹f»Uÿ\0–z†Ÿ¥]†\0c\r!²IH\Îw\î\È\åˆ$W i_µŽmB®§£\è\Z°Ê†“eÍ„\Ø\è\Äy\Zž¸1œŽ0úE|…£~\Ö\Ú¥F¿\áJ\Èm¥\Ò\î,\ï€l\â‹‹7Û\Ý·\nsÇ§è¿´7\Â\Ýd…þ\Ý})Û¢\ë\Íh3Œ\í2F\×‚zÉ†<hÛ¨¬m\'\ÄZº†MW\Óõ$M\ÔS\È\æTbÃ‚ u­š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¨¥ž¤žh¡~ô’È‘¢\ç¦\ærg\Ír:¯\ÄOè¡¿´¼S¢Û².\âŸn†W#Žai7#\åoj\0\ì\è¯\Õi?…ºhV§ª“¸¦i\ÒÈ»”‘ƒ%\ÓZ¡†7F\Ò\0s\Üb¼\×Tý®t¸Ã\Âw—¬p÷÷ðÛ£®8;#\äS\ëÃ\ïÖ€>Å¢¿=5O\Ú\Ã\Çw>bizW‡´\È\ß;$0\Ý\ß\ÝE\é¶I§ŠÙ»\ç}“v\Åy\æ£ñóâ¾¦\á\æñUÅ¸û­\r…µ­”/0U\Ö\Þ$ž\î¥vl\ä\Ð\êT’\ÅÌ²G=Ž¨O,GA\ÏÒ¹}G\Ç~\r\Ò|Á¨x›F¶hÁ/_À\Òs÷Ù³\íŠüœ\ÔüY\âmevjšö¯}s Š\ëQ»ž5f\ÆJ¬³>À;~\è9 œ\â}¢mÛ„®­·n\å;¯pYpXù\'=\èõSý þi€ñ^ƒ»N³¸ºRT\á”8TBÃ¸q\ß\"¿Žß¿ðjÀ\Ï\Û\Ãö\Ïý ?jŸ~\Ù^!øYð\ç\â\ç\Å}W\âG‰¾hŸ–÷\ÄZ&«\ãH\×Wñ]Î—ñW\Ä5¨o.|M\ã\'\×üW,×Ÿ\r’\ÒÁµ–\Òm,#µ´·þ\æ’I$’I\êNI?S_Iþ\Ë\Þ%\ZG\Ä&\Ñ\æuX<I¦\ÜZ bÄ›\ËB·pt3¤r¨\'?(q\ÆE\0~]þÁðm¯\ì‰ÿ\0±ø½cû_|(øñ¿\â\ß\Æß†Z‹“ÁoñYð\æŸ\áˆ!ño„µŸø•5]Âº’º²6¯jO§‡¹·k;Ô¶¹f¸h€¯\Ó\ÍCöø™v`ºÒ´õc‘ö]69Yzý\Ù&“p_L\ï$u<G®`Ž\ê\Þ{i•^+ˆd†Ee¬’¡F§‚cz\×\ä/tðÏ‹5½Ä€\Øj0)‘3\È^Ü¢¡?»û+Àˆˆlƒ\Ì\Ñ\ê>)\êG3x\×Z€\çþ\\&‹Mwd/üK\â¶b\0\ã.\î\Ýr\Ø8®*÷\Å>%\Ôdio¼A­\Ý;ÿ\0¬iµ[\æó9\'\çýøßœœ†Ýœ\Ù\Í`\Ñ@fc’\ÌIfbY˜ž¤³Äž‡$\äS‹¹K1_\î–$qÓŒ\â›E\0QE\0QE\0QE\0Ÿÿ\0]P\Ùß³\Ï\ÆÕµ6¾ñm\æ-Øˆ¼=«\\¿\Ë³`iW“9\Â\Æ\Ì\Ã\ì3¹\0m\ä ˆ\Þ_·¥Š9\âxf%†Td’9<r#Œ2º°*\ÊÀ\à‚\"¿ ‚	A‚\äG ƒ\È#k\ï¯\Ùó\ãP\×\á·ðG‰\î‰\Öm¡	£\ê“©[\ÄV\Òiü\×q/ú¶<\Ë	’\ár\ã¿~I\à»\é|W\á\È¼+¨LZ\î\Ö5\'ûòV\Î\Þ9ûÃ’aÿ\0ªraÝ¼Ÿ3W\í&£§\Ù\ê¶7Zv¡oÕ•\ä/oso2ŽX¤R¬¬­x<z_™¿\Z>]ü9\ÕZ\î\Í%Ÿ\ÃZ„\Ìtû²	\îäŸ°\\6[l©ÿ\0,YŽ\'ŒÄ£\0xmQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@(f\0Q\ØýGÆ’Š\0µ\rõÝ±\rmq-»{vòdt\"H¶¸ÿ\0¾ºW¥hþ#xxE§Š5	-bÀ·ö\Øpd²8\à€\Ã \0z\nòº(\ì¯~\Öz„$\'‰tkØ—jùúl’Y\Ý?@Y\à”\\[\äs\Â\Î3\×\0ƒÞ¼/ñÿ\0\áÇ‰Œ0X\è÷²>Ë«§\ÙB±\è\Ó£0>¢A\ÏùwOI3”vBF	V*H=AÁ¸<P\í-µÝ­\ìI=\ÌP¸\ÊK©,l?\Ùt,\çV+ò\Ãÿ\0|c\ái]^½\Ó\Ìj8£pöŠ\ÎM„¬dcÐ´¶\î\ä¼R¿Lx;ö²¿€Ci\ã};\Õ#:®Šzk›^H\åsý\ÛS\0\ã„\'\0€}\ÍEq~ø…\á[¬þÖ­od(^K\"\â-BLöR<cý¢›f85\ÚPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE! I\0’O\0Ô’z\\v¯ñÀú©\â\ÙØ•H¾\ß²¼ƒ?ºX\áy\Íb\n¤dfùT@•óf·ûQ|<\ÓKG§Ç«kRË‹{Ci¸\Æ\Éz`%~üh\êGLó$\Ök=no—E\Ð4û`\êZ\êY¯.#\å‚Èª©H\Úvy„œ’F\Ú\0ûºª\\\ß\ÙY)kË»kU\n\\›‰\â‡\å[÷Œ¼Zü¿\Öþ=üOÖ‰\r\âK›Ž\å1\éq\Å`¬¼•.~Sƒ¾W\É\ä’+\Ë\ïµ\Í_SbÚ†¥}zÅ·uw<\ã>›$‘£Ç°@(õGWø\Ãð\ÏCmš‡Œtq.	ò­%}FPF~WM>;“ñ²\ì\ç¯,\ÕjÏ‡¶D®c¯\êì¥ƒ­!´ò”’\æp62†>\é8ù\ÚI=}Ï·<œÀ\É\ëŠJ\0úÿ\0Wý®µù·&‡\á=2\ÄBÏ©^\Ï~Î¤ð\Æ\Þ\Ù,\Ö6\Îß´\Ê	\ã Ÿ0Õ¿h_‰Ú¯œ­®½ŒrÑ®—ooda\'9š;—‘G8#–\Îk\Ã\è “Uñ‰õ¹\Z]O]\Õn\Ëý\å–þ\í¢cý\ãLc\Ü{£\Ð`qXt¹{\0€\à\áðz‚\ã\ç9\ï’sÞ¢¢€’NNI=I\ä\ÒQE\0QE\0QE\0µ\á½^}\Ä\Z.·o»\ÎÒµ;K\åU`†E‚Uia.AÚ“Å¾xÝ— X´ \àƒ\ÇFG£¸ \Ú2þ\rSN±Ô­œIo}iow‹÷^9\âY‡±\r_~\Õ\Þþ\Íñ^‘\âHcÅ¿ˆ,ž\Þ\å\Õ8\Z†›±A‘û4ö³\'–þ\Í+v¯¢¿gO¶½ð\î\Ê\Òi\Ü\è3>˜\ÛÊ‡6ª¶O°cj˜BöÀ\ÇPiŸ´†ÿ\0\á øg¨\\\Ç™u\á\ë»]j\ßyV&6\×[Wy{k‰n@\0—\ÎTù—E¨\ì}Gcøõ¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n±kuqeq\rÝ¤\Ò\Û\\\ÛÊ“A<.c–c`\Ñ\Éº\èÀ2œ‘†¤ƒ^Š\0ý.øñ–\Û\âšš6±4pø»N€„8DÕ­\Ó\åûu¨\ã2\0\Ú\àhœ\ï\ães\ìþ\"ðö‘\â­÷C\×-#¼Ó¯\áh¦‰ÀÜ„–h\\‚bž&\Ã\Å \åX‚¹Søó¥\ê—ú5ý®©¥\ÝMeg*\Íms”–)\äAºœ«_§¾-Y|J\Ñ|»–Š\ß\Ä\Úlhº­!D\Ë÷Vú\Ý3\ÌR|\ÄQˆ¤8)\\\0|ñGá¦­ð\Ó\Ä3i·~eÖ—r\Ï>ª\ì\Äwv›¸IùR\î„¸û\Øu%IóJý€ñ¿‚tOhW\Z·n$Ž@^\Ö\åp·W!HŽ\â	0YYI”|®¹V\Zü¶ñÿ\0u‡\Þ ¸\ÐõxŽ74–HƒP´\É\Ùq afA\ÌRp~VR@8Š(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€-\Ú_\Þ\Ø\\Eweu=¥\Ô.‹y^£e\åJÊ…\\`ó\Ûs\É¾ªøoûN\ëš[A¦x\Þ6\Ö\ì2±¦©ª[§@\Óv¾Á9v}\×\å8\éòUû\'\á\ï\èž*Ó¡\ÕtF\ßQ²˜ed\Ã2\é*gtn:`9õ­\Úü‡ð?\Ä/|?\Õc\Õ4Âª]>\Ûa1g²\Ôa^\Z+˜·¸®U.lñ\áv\Èv\×\ég\Ã?Š:\Ä\Í_i­öMN\ÙUu]\ZgSse1yÇŸi!\æ…Q‘òÈ© +@™EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEAsumgš\î\æXAÁ–\æh\àˆN’² 8©\ìk\Ëuÿ\0Žü=½.¼Imwp¡À¶\Ó[ù™\Ó8÷\n\ÈB±pœXš\0õš+\ã~\×:\\A\âðÏ…¯.\ß\ïX¹Š\Ö%um¼\ÙZ™\ä’62·\Û!|c1òq\â\Ú\ç\í+ñ;XÜ¶÷\ÖZFDtJ´MÊ \æHš\â\ìO3\Ç ÂŸ»\"\Åd\É\0~’\Ý\ß\ÙX\Ä\Ó^\Ý\ÛZDŠ]¤¸š8”(äœ»>•\æ:\ç\Æ\ï†\Úx\æñ·¬\ßg\Ò\Ñ\ï\åm€\É>Py%€	¯\Ì]_\Ä\Þ ×§yõ}cR\ÔÜ¸K»Û›ˆ£\'´QO,‰\Zú*\0£Ò±¹,\ÄH\\ ž¤€œö÷‡ˆ?k]\ÛÌ‹\Ã\Þ¼¿\0c¸\Ô.b·€\äg\æ‚6Lû‘‡ñ\0x¯\Z\×?ißˆú˜•tû?BF`Ñ‹\ç–1Ž‚{\Ï4\ä¡\â•Xÿ\0?9Q@f¹\ã¯øŒŸ\í¯kz„{üÅ‚}F\ã\ìñ¹\ÆZh\Þ;xsŽ‘DƒÚ¹B\ÌrX–,Û˜±$–é¸“’N\0¤¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€>¯ý”¼Mö\ê~žB°\ë–kd$\í7\Ú\ï9\àµ3 nYc\01<}\åªiðj\Ún¡¥\Ý\Ûj6WV3\àdùWP¼.Wý ®Jž¡€#‘_‘^\×\äð¿‹|?¯#ùcM\Õ-\'˜’v›s*\Çp¬ \Ë\å9f^2õ\è`!™\'†)\ã9Žh\ã–3\ê’(u<gª‘\Ü\Ð\ãV¿¤\Üh:Þ­¢\Ý)Yô½B\ê\ÆP\Ýw[J\Ñþ …A5‘_H~\Ó~\Z\Z7¤\Ô\âe¿ˆ-b¿RR3u\Z­µ\Ø\\r\î\Æ8dc\Ç>cc\ï\Zù¾€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n\èü)\â[ÁºÝž¿£Lb½³}\Ê2\Ç2o·Tþò	—\ä–6w.\Ùy\Ê(õ«\áŸÄ\âN©§²\Ã}o²[Lg{­¹!—‚\ÐË‚ðJI¡\È ~\é¼;6‘~©ü!\ç\Ñõ@¹—O½\nB6W\çky~\å\Ì@\á\Ð\î\0º­~fx\Çz\Ï\Ã\ï[kšL§j²\Çf\Äùöe‡›ª2	#&7Áh\ß¤šýOðgŒ4ø~\Ç\Ä:,\ÂKk¤X‰uÒ\ç\ÚN£•–%z\rË‡\0€ùŸaðW\â&£\âK\Ï[\èS%Ý„\æ+»ûœÁ¥B›ö¥É»!„Ê¿¼Œ[¬ò²ó\å\à>Ð¿dk%…$ñŠî¤¸8f·\Ò-\"†\Ý2¿4f{––yJœ*ˆ•€\Ý\ä¡<}™€	 \0N2q\É\ÇLžøíž”´òüß²wÃ·ˆˆµ_C>\Â¢ûL–?3\ÐÍ¤;\Î	A2’2Ž£Ç¼_û*xŸK†K\Ï\n\ê\Öþ\"‰79\Ó\î![\rDF “\å8‘­®d#\î\ÆfùGQ_ 4P\âÞ¡§\ß\éWs\ØjVw7¶\Îc¸µº‰¡žU\ãp ñ\ÜÄŽj~£ü]ø=¤|HÒ¦š\á°ñE´,\Úv¨±¨id³½lfKi[\å\Ürð–Þ?˜Úž›{£\êº^£\Û_X\\\Ëkuƒ\rÐ¹GSØŽ2¬¤«)¤‚\r\0Q¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0®ŸÁþ-\Õü¯YxƒF˜\Åsk\"™c\Ë®\íò|\Ë[„€Ÿ¼ca—œç˜¢€?a<\â\í;\Ç\Z\Ó|E¦81^D\Ä9\Ë\Ú^F\0¹µ”vxŸ§÷‘‘\Ç+¬¯‚?e/Mg\â\rWÁ÷3i¬ZF\ÅøP±gX\Ãd\îžÕ·Lnò™›;{\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE÷[F\Ò\Ü\Í¼K÷¥šDŠ5ú»•Qøš\0–Šñ\ßüwøm\á¡$rk±ê—‘—_±\é\noeóå»§\î¢\']ð:ž+\ç\ß~\Öwò\ï\Âú½¢;.µYM\Ì\Æ#m­\ÊÄ’ól–a\Ør(\îJ\ãµÿ\0ˆ>\nð\Â3\ë¾&\Ò,DR^D÷Sª%¼M$\Ï&xq<_™¾$ø\Ãñ\Å^bjž\'¿[i6v4\ëL)\ÊfO-K/MÍ¹\ÎNX\æ¼\Õ\äy]¥‘šI\å¤vg‘Ž1–‘\Ë9üX\Ð\è/ˆ¿j\ïXaðî›ªx‚T+²\æHÿ\0²ôùû\Û^\è}´•ô6JŒ:Iƒšð¯~Ó¾=ÕŒ±\é\Æ\ËC·p\è\Æ6pŒ>Gwa\ØJ¤üØ¶\n@ùH\'#\æ\Ê(¡\Ö|Y\â_\Ì\ÓkZæ©¨»ý\áq{;\ÆN1Ÿ(8ˆ`|¨X˜Œg\å\ã\å.G\Ú03\ïŒ\Óh Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ?\ç\Ç\â8¯\Õ?ž%ÿ\0„£á—†\î\ä—Í»°·mü’K‹-Íº´„“û\É\í­\Û\×À¯Êºû?öLñ/“u¯xZWm—‘¦«h®\à ¹·\Û\ÚC\îð=´²³rY@ò\0¤~\Ô^“YðE¶·k’\ï\Ã÷\È\î#Œ¼¯ezV\Þ`0­„‰\ÊL\Ä\à*‡9\æ¿:+öO\Äú,#ðö³¡\Ü\"\É©§]Y”ºZhYSq\ì7•$öŠüyÔ­e±\Ô/l\ç]“Z\ÝOo2„1ª\Ë¡¾eA\"°@y\Ú \nTQE\0QE\0QE\0QE\0QE\0QE\0QE\0*Œœ}O\×\0œ~8\Å~¯üð‚x/\áþƒ¥²2_\\[&¥ªû\çP¾D–d\ä	\Û\n!\Î\ÅL\nü°\Ò!:¶™n\ÛvÏ¨Y\ÂÁ¸R$¸9õ\ïœW\ìø\ã€0\0\Ô\0QE\0QE\0WÁµgƒ\âÓµ\Ý/\ÅÖ±$që°µöÀv¡` ¤¬\0\É2\Û:¡bF\æQ\ÉÙŠûÞ¾ký©­\"¸øq¥¸¶\×ôó\ã,‰2\ÏÀ{8)»\Óh#‘@œtQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0zÁ{Ù¬>*xx3¾Mv\ÞÅ€I$\Ó\æ\ÈôX®]óØ¨>õú\Ã_•Ÿ´\éuŠžX\×r\ÚjGP›¾È¬­\æ›y\àð$ò—9fú§@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@T3\ÜAmMs4Vð ,ò\Í\"\Å\Z*‚K3¹UP\0$’@\0x5\áþ+ý¡~\Zx`½¼Z\Çü$\Z‚–O²hAn\âG^¨ŽÁSw\È\æ)\ç’6ûñŠù¯ÅŸµ?Šu/2\rYZhVì«¶c›\Ûü?\ßV’TŠeWŠÐ³’¨€}ñ}¨\Øi5Ö£{kcn€–š\îx\à\å 4¬ ¶:*\å@	5\â^\'ý£~øx\É\rµüþ »N<$!ˆùw\ÞLb·U\ÏC¹8V¯ÎoÅž$ñ\Ã\Ü\ëšÖ£©\Ë#?j¹‘\ã\ç;aB£œac«Ÿ,ÍŒ’p02IÀ\ì ôŠ\0ú³\Äÿ\0µ‹µ2i:w‡\á<%\Å\ÏüMoº\ã;¤X¬\Ô0\çh´fSŒJkÀ5\ßø\Ã\Ä\Ì\í¯x‡R\ÔÄŠÑ´W\Öþ[>ð‚\Øn¸\Â-ë“†\ä\×#E\0þƒð\0~\íEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP^ð£\Ä\ßðŠxóÃº«¹Ku\Ô!·»*2M­\Ñû<¨NF\ØÏ˜²?PLI‘Àeóš\ê<)\á/x¿T‡Mð\æŸ=õ\áuf1\îHmTD\×7\ä·E8l» dhöX0¤2°¬§!Ár\àŠü\Éý¡<#6‡ñ?Y–\Ò\Ý\Ú\Û^†/[„]Åš\ä2_@Ü·\Ð\Ü…s ‹\Êm­»qýðÕ®£c\áý\Z\ËWx¤Ô­4\ëKkÇ„\æ6š–2U¿‹…o\â9nõ£-…Œ\×\Ý\Ígk-\Ô*R+™ ‰\ç‰NIX\åe.€’xV“\ë@v~ñN 	±ðÞ»v¡K·\Òo\åEU gH\n\"\å”nb#žEU\Ô4\rkJ\ÔôÛ»	\Å\ÜFÀ\êvÉµ¸\ï\Å~Ë…Uûª«Û…ùaùUK\Ý7NÔÇ¨XY\ßFAR—v\Ð\Ü)SWl\È\ã\èrs@‹€\ç‘\È<‚;\Ñ_¨^+ýŸ¾ø™f’\"=P‘XGw£*ZÆŽ\ìU~\Å1\ë“$$òX\ØañoÄ¯¾(ð|±j\èJ\ß.¥d’7’\Û`;ä…±\ËH¥¢,pª€P‡\ÑE\0QE\0QE\0QE\0QEf\Î\ê[+«{¸x–\Ö\â˜ÿ\0ß¶š9\Ðt=Z0:w¯\Ù\rTƒ[\Ðô^\Ö_>\ßS\Ól¯¡›ó\æ\Þ9C•þwr§•9‘_Œ\Õ÷g\ì¿ñ*4|=\Õn6\ÝØ™§ðü’Å£»Mq§«–š\ÚGyaRw4U!\Å\0}‰EPEP_$þ\Ö\Z\äx{@\Ð»n\ï5Ôš1œýž\Î7X\É\0Œ‰\'\Ìy9‚\Ø$\nú¶öò\×N´¹¿¾ž+[;8d¸¹¸™\ÄqCJ^I$v *ª‚I5ùQñwÇ¯ñ\ÆW\Ú\Ì{\×L‡ýG…ó”\Ó\à;c‚\Çk\Ý0k©\0—¡ /¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š\Ýð×‡µ\ëZ~…¥\Â\Ó^\ê7	 U#ÍžB1¶+xÉ’F\Ï\0(<\Z\0ú\ÃöJð„­}\â\ÜÅ¶mW\Ãúk²dK,òC{¨¼lxV·H,\ã%y\"\é d¸\ë”ðO…,|\á+Ãšz…¸Iš\â\îOž\æ\á\ÏVi%\'’B\\\áEut\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QYz¶¹¤h6¯{¬\êVzeª\Í5\äñÂ¸v‡!œŒý\Ô\Þ\Õó‡Œ?j_	hû\íü3cq\âK Y\Ë9°\Ó”•\'\Ïh\åž}¤«m†\Ü\î\å\ãj\0ú8\ë\Åy¿Šþ,øÁ\Ë0Õµ\Ëy.¡G\éö\í×¤#a\äÀ[f\Ö`¬\\ª©?1ùó\ãŽÿ\0üd%‚\çXþ\È\Ó$c+CCcnc \×šþ\å[hr·R\"¾Lh€‘^E$\Ò\ÊKK#¹f\ÞÅ˜¶\ç )v\Éù‚¨g9vÀ\ÜI ¯¼]ûXj·-%·ƒ´xt\ØyP\Ô\Ê\Ý]78\Ý²ƒo#¤aý\á_5ø—\Ç~,ñtŒúþ»¨\ê\n\ÌÈ–\å\Ö\ÑI\Úc´ˆ¥º\àp#¸Á®BŠ\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢­\Ø\Ù\ÜjvöV±´\×2\Ç1 \Ë<³H±F zu’3ŒPuð\Ï\áÎ­ñ\'\Ä0\èö­¬¢\Û>­©˜÷Eaf\ç<\âoõV\Ñó™;ƒ\Z5~ øCÁ~ð6“\á\ë\í-\ãQ\æ\Ì@{»\É@§¼¹a\æ\Ï+‘¹™Ø€I\Ús	þ\Ùü<ð¦˜ˆ©Ý¬wz\Å\ÐPk·Aû¼õò­\Ôùq©\'qþ*ô\ê\0(¢Š\0(¢Š\0*)¡†\æ) ¸Š9\à•r\Å*,‘ÈŒ0\È\èÀ«)AT´PÁÿ\0¾&‹\r×|m#iª\Í6·¢\Ä79\îmBË\Ïd¤·\Ú`9{^&Vx‚\ß\ãúý¬š(\î\"–	‘d†h\Þ)cq¹$ŽE(\èÀðU”A\ê\r~]üpøyÿ\0‹\ç†\Ò2š.©¾ûH;p©?\ï­g“j\ìy8\É\n€\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0«6w·z}\Ì¶73Z]\ÛJ“[\Ü\Û\È\ÑMÑœ¤‘ºASøH<\Z­E\0}\åð\Ãö›\Ó/m­ôˆ\rö\rB%Ž(õ\èÐ›;À6 {\è”nµ›¼’F7bp‹\É?U\é\ÚÖ‘«[\Çu¦jVW\Öò¨xå¶¹ŠP\Êz+F\0ûW\ãkXkš®˜\á\ìo®­Xcg¹¸¶)$¶\ÒÂ¬À“ó0-\ï€(ög#®F=k†ñWÄŸø:Ý§\Öõ\Ë8¤\0ì³·•nofaÀH\í¡,û‹`|Áq‘ž+ò\Ú\ë\Ç~1¼\Ü\'ñ&²\È\Ø\Ê\rJð/hÿ\0–Å¾\ï\Ë÷º{ó\\\Ì\×3\Ü;\Ë4²K$„—y¤‘\ËN\é´Œ	Pp\ÌF@=¨\Þ~.üw\Ö>\"	4]294o\n‰5¦\àou3e$\Ô%PDKH‰Ppew óýPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE$QK<‰1\É4²º\ÇQ!y$‘\Î#E\åÝ\n£“@1Kq4VðFò\Í3¬QE\Z³\É$Žp¨ˆ ³±\'T{\ný ø	ð<	¥\rZ„7Š5XƒuÒ¬d’\ÍpX‡¦V8a\å«2Š\æ¾ü	\Z[x¾\Ù_]–5“LÒ¦@Ë££¬÷\ÙPe9\nGú6qÄ \íúÆ€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n+\Ëüoñ{Á>\ÓS\Ô\Ò\ëRU,šNžV\æõŽ\Ò\Ë\æ*¶\È\ã¥e\Ç\\b¾7ñ¿\í3\ã	¬ü?·\Ã:s\îPö¬²j’!\Èù\ï2A‘‚~Ì¾`92œ÷/‹> ø?Á04\Þ#\×,\ì¥	¾; ›QŸ*YV1œù›H\ÝR\"\Ø`\Í|•\ã_Ú²þ\äMi\à­6;›r¦¥©¸ºe\ãEjŒ!‡z’WÍ‘\å‰\×k\ÂA\Í|wyuq-\Ý\í\Ä÷w3\È\Ò\Íqq+\Í4²Hw<’K#3»»r\ì\ÌKI&«Pþ½\âŸøž\é\ïuý^ûT¸‘‹n»™\Ñc‹ˆcU\ì5\Å`’I\É$“\Üòi( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ¾ý™¼(ž ñ\çö\ÌBKO\rÛG$t¾vhlù\ì 4\ì\ÊFX„ €­Ÿœ«\ï\ï\ÙGHKOxƒT\ãÌ¿»±‹ ÈŽ5õ?<\ìq\Ðg¥\0}eEPEPEPEP^ûGxI<Eðò÷RŠ2ÿ\0\Ã-ý­(þ\ÇÛ¨©n«\ZÚ—™ŽY­{ýd\ë\Öp\ê:&¯ap†H/4\Û\Ûy£Hå·‘3þÚ’§\Ø\Ð\ã.h§\ËÁ$\È\0’$‰Àù\âv¸\íó)\éÇ§\Ê\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢½K\á\ï\Â?|B¼\é\Ömi¦E K\Ý^ñ;K`1½\r\Å\È\ÉQ;™Ygò\Ê\à€p:6©øƒQ¶\Òt‹+‹ûû¹Com’F\É\å°0¨å™Š¢€K0\×\èoÁÏ€šwD:ÿ\0ˆD\ZŸŠY@6‰,ômÀ¶¡‡\ïn\ÇI.\Ø˜%cP}\á\ÏÂ¿ü7°\éV\â\ãSš5ú\Å\Â!¼¹l|\Ë›{|ý\Ø\ã.\Î\Ü×¥\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEr~-ñ¿†|`Ú‡ˆõK{*M½±o2öñ\Æq¥¤{§™†ÜªlS÷\Ýk\á\ïˆß´·ˆ<C\ç\é¾ø{K%\Ó\íjGö­\Ì|¨c Ü–Š\ë†)ù0J;FÂ€>¿ñ\×\Å\ßx\']_S[Ki1hú~.¯Ý°v‰U	KU$\0MÃ£a••y¯Š<{ûIx\Ï\Å~}Ž‰\è\î\Å@³‘Ž©<D‹‹\àA€A)iå²¶Gœ\êq_=Oq=Ì²Oq4“\Í+–Y]¤’G=YÝ‰f\'Ô“P\Ð’M,\ÎòM,’\É#’I]¤yœ—wrYØ’If$’rMGE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\è\ì©uöŸjJqº\×Zk|\Î\Ñgl\È[Ôp=…~wWÚŸ²Vº‰?ˆü>ò9{ˆmµ(#\ÚDj\Ö\ä\ÛNªÅŽ÷ò\Ì6\0\ÚA ·(¢Š\0(¢Š\0(¢Š\0(¢Š\0)ÀAA\ê<G\\\Ò\×ñ]ÿ\0„kÀþ\'Ö•¶\Íg¤^Pc½Ü‘4V±\ÆAdy…ù»Ž”ù}0¸½¼œ\0\×wS``\ßO$¼À?\0tVN½\0\ç9\à\Îy\Ï×š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šz#\ÈpŠX\ä\0O\'8Sƒ€988P*å†Ÿ}ª]Ee§\Ú\Ïyw;Š\Þ\Ú\'ši	8ùc@X€zœ`w#\"½\Ë\á\Ç\ìù\â\ï<7º¤røkAfFk»¸Û®b8$YY¸RB\Ïq¶48a\ÊHwø\áwƒ¾\Û,z™\ÛJ\â\ãVº\ãR¸o\âfÁò”óû¸Q€v…Û@1ü.ý˜¤‘­uÏˆD\Å²\Í†\á|Jøù—ûNuûŠ[i6\Ñ0r,¬¹\0}¥§\é\Ö:Mœ\Zm¤Vv\è#†\Ú\Ú%Š(\Ô\0¨€©\êj\í\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEp^=ø‘á‡zi¿×¯ž\ê~Å¥\Û“Q¾tX!,6¦xi¤+¬O·¹¹·³‚[«©¢··\ZY§™\Ö8¢fwv!UTI&¾Dø›ûOY\é\Í>‘\àŽþ\íw\Å6»p›\ì¡~Wýqt\è\Ùý\ì£\Ép’ù\Ë\âOÆŸ|Ežhfv\Òô!\'ú.‹k3y^Zœ¬—².\Ów;q¼0\ê\Ñ\É5\ãÄ“\É\æ€5õ½Yñ&¡6©®j7zôä—¸»•¥p	Ï—\ãˆ\â^\ÇTP\0\n\0E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Wð\Ë\Æ2ø\Æz&¼2\Ö\Ð]/£\Éù\ìn\Ê\Ãvr»\Âm1—œf¸\n2G#ƒ@µ6·0^\Û[\ÞZÊ“\Û]CÅ¼Ñ\Ñ\Ë\È$ŽD<e]08\rO_þÍŸ¡š\Ö/‡¾\"ºX®m\Éÿ\0„nòw#\í01,ú\\Ž\Çt.Y\ízoš<’¨+\ì\Ê\0(¢Š\0(¢Š\0(¢Š\0+\ãÚ«Ç°¥¶\à;)VI¤‘u]d#²´+eÓ¢-–\Í;\Ä\ÙVÅ½H+Ÿ£¾$üA\Ò~øv\ãW¿‘^òExt«+\ç^\Þò*©#FHyœðª1ÔŠüªñ»¨x—X¿Öµ9\Å\íýÄ—\ÈKm,\ç…Ecò\Ç\ZŠ0ü‘©*¶@1h¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢œª\ÌB¨$±\n I$(\0u\',£\'‘\Å\06”+6p¤\àd\à\êq\Ð{×´x\àOŽüjb¹]<\èúKòu-QZeÿ\0¦\Çe\Å\ÎpFP*A/Œ\ã\íü\0ðW„W–\ã\Ä\Z¬[_\í:’#\Ú\Å(P7\Û\Ø\íû:·mò$’\ÌXf€>%ðÁxð\Çsm§\'F|¬j\Ë%½¼‰\Ç6‘\çÝœg$1d–<\ä}\Ã\à€¾ðH†\ê{\íýe6·\Ûõ\Ð\Ã€.M¥ˆFA ¿›!\Î]Ù†\ã\íÀT\0\0\0\00\0\0\0\à\08\0t¥ \0(@\0\0\0 \0p-PEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEò_\ÇOk\á\ïµxCÁ·*ú\ã+Cªjña\ÓJ¸k{G©\Ô82á…°\É_\Þ\íd\0\ë~.|y\Ò<·\Z.ˆ\Ð\ê~(	‡_õ–zS6@k²¤	®F2¶ŠÀƒƒ3Fˆü\î×µý_\ÄÚ¥Î±®_\Üj:…Ó–’yÝ›jä•Š$$¬QFÔ0ª z\Öd\ÓMq,“O,“M+´’\Ë+´’I#œ¼’;\Î\îyf\'$þ¢ Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( 	aš[ycž)bu’9#b¡®Œ9VRW\Û_¿iV¾ø?–\è©\r¯ˆ\Ûý[ù5@c`\â\ë”r@s¼> £4ûQiwk}oÕ•\Ä7V\Ó\"\ÉðH²\Ä\è\êJº§*A\ëÞ¬W\ä_„>%ø\ÓÀ\Î‡µ«›kp\Ù6µiÍŸ¼M”û\àGñ\"£\çø±_Fè¿µÖ£C½\áH/Š\"‰¯4\ëß²K+c\æag4rÂ‡=6\Ü\0F\0U4÷=òt_µ¿ƒ	“Ãž ‰À\ÈR\ÖL	ô\Ìs9õÁ¬Oö¼\Ò\Ö\èþ¿šp\Ä2\êWð\ÚÇŒp\È\Öñ\\±\ç9ªx\é\Í\0}‘^9ñ\ã_„¾[K\\&³®\ì&\ßF±•ƒv{Ëº;XA 1;\å9\n‘3\Zø›\Åß´/\Ä?,–\ë}…`û\Ô\Úh\êÐ»\ÆI*\'º‘¤šB\ÚþY…\\ò\Þ#=\Ä\×<³\Èò\È\ì\Î\ì\î\Î\Ì\ÌI,\Î\åÛœnvf\Æ$@_¼w\â/\ë2\ë> »i_.–vQ[-:Ùö±ò®>û¶^F\Ë9f$ž:Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š\ì|/\àx\Îx\áð\æƒ}¨+•\ìG\äXF\í\ß-\ì\Û XÕ¸v\ÜBž	ô\0\ãªí¦}4vöv—3\ÊUb†d–iKGj\ÒI’06+sÖ¾\Êðg\ìŸ*´W~5\Ö\Õp\Ê\çKÑ²NÍ¶kùPm`p¬-ÑÁ\Û.\r}Q\á\0xCÁðˆ¼?¡\ÙY0\05Ï”²\ÝÉ\â{™JI\êp\Ã9>´ð§ÿ\0f?\ZxEy\â¢ð¦˜\à7—q¹\Ö%R,Õ’+p\ÊH\ßq7˜Ž9¶q_^ø+\à\Ãÿ\0¬R\Ú\éIª\êQóý©¬„½¸ßŒŠ\'_³Až\Ä\n¸¤0\Ízý\0€\0€\0À\0t\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEy\Ç\Å?\Û|<ðö¶û$¿qöM\"Õˆ\æþPDci9h\âÿ\0[.:(#p4\ä¿þ3	Z\Ë\á/]\â;\Ø½»…²\ÚE¬£\åTe\ÈK\ë…ÉŒ1TA¤\å¶+~y\É#\Ë#\Ë+¼’H\Å\ä’F,\î\ìr\Î\ìygc\Ë1\äžM\\\Õ5;\ÝcQ¼\Õ5‰.¯o\î%ººžF,\ÒM+ns\ÏE*\"¨<‚j…\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QV!´º¹‘a··šy•Rby%r\Ù\Ú$\í¸ð¤)°3’\0W¢½\ÃÂŸ³\ßÄˆ¦}-t+0~Õ­9¶.öF\Ûb»2!„r\Çº\çÁúW\Â²Ÿ„ô\Ï&\ã\Å:çˆ®«=¬û;N,¼\"2\×R\ÆÃœù°È¬~W\ã$\à?K\Ôu[„µ\Ól®on$;RX$žVl\0H•›œpHž¬+ß¼#û4x\ë\Ä>\\Úª\Å\á«\'\Ã52^e±…ÁWSD“\Ó r+ôBð¯†ü1n¶º‰§iP¨Qþ‰m\ZJûF–r\ZyŸdšGsÝ‰®‚€<Áÿ\0³Ÿ\Ã\ÏùwvrøP]¬\×\Z»	-ƒ©WýÞŸK@©*‰\"2G,¨B\æF*÷k{{{H’X!¶‚1„†’z,qª¢þ\0T\ÔPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP_œ´\çŒf\×|}/‡¡$\Òü+6ˆ°L³C&¥sWZ„¯°²¥Í³\Ì4\Ù\Óph¤³x¤E•¿G\ëò\âj…ø\ã\ìgŸ\Zx¡ŽI<¶·|{“À\è@\0Š\0\áè¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¥\0œ\à’{\0:’{Üžl\é^\×5¹–\ßHÒ¯µ™‚³¶šq¸\ãx\Ð\Ç\Üg\ç\È\ÏJ\0Å¢¾Žð¿\ì\Í\ãýglºµ½®ƒn\ÅHûu\Æû€3—Y,\à@qÀ\ÌñHo›iSô/†ÿ\0e¯\é¥%\×\î¯|A*õ·\Ýö#\È`-È¸—k©’|\ã\0\ç­\0~z\ÚY\Ý\ßÎ–¶V\×w2#·µ‚[‰œŽ\Ë(ò\Ã!p	ä“^\É\á\Ù÷\â_‰|¹?±Ž‹f\å»\ÖeKQ\å°Ï˜¶\à½Ë\È\Â\ÆXq•úI¡xW\Ã~·¾\Ðô\Í&”°±²‚Ý¤dD“I\Z	&—zYY\äbIf$“[ôòW…?e-Nò®<O­\Ýj\×µ\Ú\ÛNO°\Ú,€œ¨·]K^8\ç=AÀ¯¡¼9\à/xN%‹A\Ð4û£rÀ²\\·»\\HR\à\\tW_E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0øÿ\0ñ\n\ê\Þû\Ç\Þ7½³¸‚\î\Î\ï\Åþ$¹´»µ–9\í®m§\Öod·¸·ž&x¦‚h™$ŠXÙ£’6WF*ÀŸ\Ø\nü€øƒá¹¼%\ã?\è2\Ã\äGgª]5š\à…m>\âV¸³t\'ï¯“ xKFq@uQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@R•aŒ«Œ´äŒ1’2@\ã¹½\0%\Ý\è?¼}\âM¤xOZ¸‚UWŽ\êK7´³•	å¢»»ò`(û\ÞSHGM¹¯j\Ð?e?ß•}rÿ\0I\Ð\áÊ–Q3\êE$•HC½F2’I\'Ž2@>Z©£·¸•\ÄQC,’–U\"3JY\ÆTÀ.KF‘_¢>ý–ü¥}^óU×¦\nV@ò>\ÖPy\Ã[Ú’çž»\ç|”ü¼l\Ðü	\àÿ\0*®\á\Ý*É”(óc´‰§;Fi¤W·©3@šø3ñ\Å-²ðõõµ¼¡±w¨Eötq¢_µ´…r8x\ã—’;Wº\è²>£1Ž_xž\Þ\Æ2¨\Ïk¥Ûµ\í\Æ\ï\ã‰\çŸ\ìð\'¬‘¬Àp\n·5÷0\0p\0\ÐR\Ðˆxwöyø_\áÿ\0-Î‹&µs\Ï\Ú5Ë–½\É\ã\èÈ°Y\r§%H¶\Þ3Ë·Zö3N\Ò\âi¶–€—ioº£\"$]\Ä\í“\ïW¨ Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ¾Uý¥>\Ë\âM6?\Zh°5m\ÜÃª[Æ¹’óKB\Ò,Èª2óY19.ð6ý^\ÖúªšÊ®¬Ž¡\ÑÁVV••†\n°9Á‚(ñI•”•a‚;~ úG Ž Ž\r%}™ñ\Ãö}¸\ï<]\à[S5³.um&hN\ZI¯4\åæ‹«Mj1·™\"þ ~4!”•`U”\ÊÀ†R \à‚x4\0”QE\0QWô«\ÕuM7KŽD†MJþ\ÎÁ%1Hžò\â;u‘\Â\åŠ!3ˆh…õ\çü2‰\èo\Ðÿ\0ð\nþød?ÿ\0\Ðß¡ÿ\0\àý.e\Ý_\×õ¨!\Ñ_^\Ã!ø—þ†ýÿ\0\0¯\èÿ\0†Cñ/ý\rúþ_\ÑÌ»ÿ\0_\×õ¸!\Ñ_\\Mû#ø’e™¼]¡•Š7”eÈKß¨òdÑ˜f–C¥’2\Ã8c$gœdf„\ï°QEÀ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢½\Ã\á\×À¯|H\Ð\å\×t½[J²·Šö[#\r\è¹ó‹Ä¨\Ì\ãÊ\Óa\0\ç9\ÏP‡\Ñ_W\Ã$ø\Ïþ†þW\ßüfødŸÿ\0\Ð\Ã\áÿ\0\Êûÿ\0ŒÒºþ¾_\æ¾ð>Q¢¾µ‡öHñ^\åóüG¡\í9\ÞoM¤Û¸l÷W¦º]\'öCM\È\Ú\ï‹Ù7\Ï‘¦ˆ\ÞD=v\Ý^\ÜÊ±H1…&\ÎTù‰dlE\×õòÿ\05÷ñ0\ç\0œrp3\êi\é²°H£y\\\ã´ŒI\è0Ž}ºú\×éŽ‰û6ü-\Ò<¶ŸI½Ö¥ò%\Öun¨\0’\Þ\ØZY™f[Tf\'“Œ\ë:?„</\áõA¢øIÓŒd”’\Ú\Æ\Ý\'R}.6ÿ\03Œœu4Àü¸\Ñ>|A\×\Â6Ÿ\ám]£‘CE<ö­ilë‘“\ç]x\0“º4—¡À#šö-öRñ•ù¬\êz^‰\nÁ>¡s\ÏT\"hÃ¯\'ƒòœõ¯\Ðz(\æ}ö\\ð6–#}N÷U\Öfƒ†i\Ê=\Ø\Ã)ª²I\èI7s^Í ü<ðO†DgDðÎ‘g,O\æGt,\âšñû\Éy:\Ër„Ÿ›	*\Ü\ã5\ÙPN(\0¢“>\Ç\ëJs\Øgô¢ÿ\0\×\ÝþhŠ@O÷qøŠZ\\Ë¿õ§õý0\n(¢Že\ßúþ¿­À(¢Š9—\ëúþ·\0¢Š(\æ]ÿ\0¯\ëú\ÜŠ(£™wþ¿¯\ëp\n(¢„\ï°™úõ\Å-@Sr\ß\ÝýE:‹®ÿ\0ÖŸ\æ€(¢Š9—\ëúþ·\0¢Š(\æ]ÿ\0¯\ëú\ÜŠ(£™wþ¿¯\ëp\n(¢Že\ßúþ¿­À(¢Ši\ß`\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nù\Ó\â—\ì÷\áÿ\04úÆ…\ä\è>\"1\åx\ãÿ\0‰~£#ó]\ÛÇ·d¹@Q™‰2‰5ô]ù\âÿ\0x—Á7­g¯i—6Ÿ6È®\Z6kKƒ‚\Ä\ÛÝ¨0J¸e£—¦\èP_³º¶¥k¶rXk\Z}®£g*•x.¡YW©RF\è\Ûý¨\ÙXv5òßŽ?e]R3_x/S}\Z\é·8\Ò\ï\Ô\Ü\é¯!<,Wíº´@?¼—œ\à\à\ä\àj\è¼!ÿ\0#g…ÿ\0\ìb\Ñ?ô\åm]\'‹~ø÷ÁM#k~ºH\åS±ÿ\0N\Ó\å ý\å–\æF¤a‡ŸG‘\\\ç„A-ðÀ#x‹E\ÜNÚ€?\'?\à\íÛŸö¹ý‡¾þ\Æ^ ý“>=x\ç\à^¯\ã\ï‰_to\Þø&m2|E¦\è\Þð…\î“k¨GM\Ô	Nº¼¼–\ÜC\äü\×S<\Ï\Ýù\Ã\çü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿­Oø>þH/\ì	ÿ\0ew\ãgþ¡¾¯ó¦¥—¢öþÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9Gü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿¨¦ú¿Á­¿µ÷\í5ûgþÀ¿¾%þ\Ô\ß¼añ·\Ç:O\ÇOøgJñŒ\äÓ¥\Ô4\ï\ÚøG\Ã÷Pi6Ï¦\éúz}‘.\înn@™&”Kq&%\ì>Ô¾ÿ\0\Û\Ïúú¸ÿ\0Ñ¯_“ðfü£3\ãoýœ‡‹õð\Í~²_\Ç\í\çý}\\\è×¤·~¿¢­QLŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š)H#‚\ï\Ït\Ï=½\è(­k\rZ\ÕF\í7H\Ô\ï\Ô³\Ó\î\îp3$q”À,\ã=«\Ð4Ÿ‚?µ’¿fð~©n®,šˆƒM‰”Œ†^Mÿ\0dö€<¦ŠúJý•¼}wå¶£s¢\éh\Ü:Iu%\ä\Ñó\Ë¶DŒ€:šLžø\é\é\ZOì§¦[ñ]\Ä\ÅX+N±Ž4q\ßt³¾ñ\Û\0F{\äš\0ødH\0O@$ý)GiR!v‘†\Ëch ò3‘Ž9È¯\Ó]+öpøe¦¦Ù´û\íW\æF¡3Ç¼`\î\Ã\ä\Ä0\Ù*6as€8ô­\'À\Ð\Ê6—\á­\"\ÒD]‚T²…¥#\ÞGVb{\äœçž¼\Ð\åV•\à_\ën‰¥øwW¼2G\æBð\Ø]<3pp‘\Ü,F!\Æ6´‹·«•×¥hÿ\0³\Å][\Ëg\Ñ-ô˜]¶™u}B\Ú\ØÇŒd\Éo\\^…\çªÚ¾pvƒ\ÆM\ãŽ8”$Q¤h¼*F¡@ª\0\Ø\n}\0|1¢þÈº«\ß_ñfŸ%‡I²ž\è‘\Ý\Ò\âôÀ¤\ç\î«Z/xö¯pŸ\ÂKðs\à¿\Ä8ü5ª\ÞI¥øK\Æ^ ²\Ô\çHDöú®}si<q\0\Ñ/\Ùæ·‰\Ñd%9\\+\Ý\ë\Î>1\É\"ø§ÿ\0d\ã\ÇúŒê”¥·\Í~hò$ñ7üYÿ\0˜\ÓüK\â+_Û‡\âv\Öz\î±ko\Ð|V( \ÔncŠ5\Ý\áfm‘Æªˆ˜…P\É\Äÿ\0ˆÿ\0\à³ÿ\0ô|Ÿÿ\0ðC\à/þekñ§\Æò8x³þ\Æ]wÿ\0N—U\ÍS·—\áýv_p·ñ¿üþ“\âþ|ÿ\0Ì­~¢Áÿ\0\à¸?ðT¿\Úgþ\n•û\Z|ø\Ýû[ø\ß\Ç\n~\"|K\Ôô\Zx?P\Ò<ma¯\éø\Åú”vWsiþ´½X’þ\Æ\Ò\éM½\Ì/\æ\Û\ÄKü€W\íü¿ÿ\0)¥ý€?\ì®\ëú­|sJË²û¿®\ÈöW¢Š([/Eù\0QEÀ+ù\Ãÿ\0‚ªÁ\Ë±Oüg\ÄÚ¿ÁŸZ\ê?´\Ï\í!¤#\Û\ëŸ>j\Ö¾ø¨<<Ÿüo8¹³°\Õ#³Kw\á­\ÛSÖ¡‚t7‰§»q÷wüö\Ï\Õ?`Ÿø&\Ç\í1ûCøWQM3\â.Ÿ\áðgÂ»\ÇS›ˆ¾=»‹\Ã^¿„ôK//5ûVp\È\×\ZLh\ÈûöŸñi\Öõ½_ÄºÎ­\â/jw\ÚÖ½¯jW\ÚÆµ¬jw2\Þj:®«©\Ü\Ëy¨j7÷s³\Íuy{w4·77»I4\Ò<ŽÅ˜š[úio=ÿ\0¯ø`þ³>5Á\ä\ßðSj\Ó\Íð‡Àÿ\0³\ßÀ\Í\nXü¸´¸|!¨|H\Ô\àù6y¿\Û~*\Ô`‰\ç?}›û\"\ß\ÌpÄ˜AðŸ?\à\æÿ\0ø,÷Œ§3\Ú\Î\ë\Ây¹{Ÿ#Á~ð6‰\0ÞŠŸg¾‡xE²\íÞ‘nù\\±\Ý\Î+ð.Š,»~\×`?l/ÿ\0\à\â\Ïø,õýÅ›~ÝŸ­V\áU\rÅ†“\àkKÈ‚È’f\Þ\æ/	!f\Ùå³¡\rå»¨ ¶G)ÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ¯Çª)ûÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ£þÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9_TP\ì/ü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ærøÿ\0ü[þ’ñ\çÿ\0¼5ÿ\0\Ì\å~=Q@°¿ðÿ\0ÿ\0ø,·ý$\ã\Ïþxkÿ\0™\Ê?\áÿ\0ÿ\0ðYoúH?ÇŸüð\×ÿ\03•øõE\0~\Âÿ\0\Ãÿ\0ÿ\0\à²\ßô?ø\á¯þg(ÿ\0‡ÿ\0ÿ\0Áe¿\é ÿ\0ð;\Ã_ü\ÎW\ã\ÕþÁÿ\0ðm—\í-ñ\çöµÿ\0‚Uü/ø\ÕûHüOñ/\Åÿ\0Šš\×\ÄÏŒúN§\ã_Ig.±w¦x\ÇZ†™£X\Êö6vP4ûc·ƒ÷\Â3¶>\Ìÿ\0‚‹ÿ\0ÁTÿ\0c¿ø%\ïÃ‹~\ÔŸ®x–;Á\à…\Þ·]w\âOnlÂ¤§Cð\äsG%¾‘ms$j\"\Õ$³\Ñ\ì‡}Ì“!€þYÁ§Ú¥†‰ÿ\0Fø[­j·1\Ù\éšG\Ä\ï\Ú3T\Ôn\å8Š\Ö\ÃOøƒ¬\Ý\Þ\\\Ê{G¼RJç²©5þo¿ðU\Ûc\â\íýûsü|ý¡üy«\Þ\Þ\Ùjþ8\Öü;ð\ëCžòK­;Á¿¼3©\Ý\é~\rðÆ‹\Û½•®™\n^\\\ÑZóS½¾¿¸i.n¥‘¥_™öýl€þ˜?joø=Kö¡ñn¥ªé¿²\'\ì\áð\Û\á†„\ßñ%ñ7\Å{›ßˆþ4– \Ôt]:\ãFðµ¬·2Eo-ú®Fù\äiü´ñ\çü5ÿ\0œñÐ¸	ûFxsÁbx¥ˆü-ð^„mÄ²	Û´ú~¢\ë, yqH\í#\É\\\Õü\ïQM$º_\Òö\ìÁ\ÇðYñø\ÎOˆg\ë x\ç¿ñJþuÅ¿üÿ\0—wgoø(7\Çp]™\ÈK¿Æ€±$…Ž?\r,h¹?*\"ª(Âª…\0W\ã\ÅÀý…ÿ\0‡ÿ\0ÿ\0Áe¿\é ÿ\0ð;\Ã_ü\ÎQÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ¯Çª(öþÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9Gü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿¨ \Ø_øÿ\0ü[þ’ñ\çÿ\0¼5ÿ\0\Ì\åðÿ\0ÿ\0ø,·ý$\ã\Ïþxkÿ\0™\Êüz¢€?a\áÿ\0ÿ\0ðYoúH?ÇŸüð\×ÿ\03”\Ãÿ\0ÿ\0\à²\ßô?ø\á¯þg+ñ\êŠ\0ÿ\0g_ø \Ï\Ç_Œ´§ü\Çö`ø\Ïñ\ã\â¿ñGâ—Œô_]øŸ\Æ\Þ&{I5bko\ë6v¦\í\ìm,­›\ì\ÖpAm[uo*$ó\ZI7;~Á\×\á\'üSÿ\0(cýŽ\ì\\ñ_þ¦ºõ~\í\Ò]}DES\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(UÕ•”2°*\ÊÀ2²‘‚¬AF\à×™jÿ\0~\ë\Z•¦±\'‡l\ìuK+\È/ »\Ò\Óû8››y’xä¸†\ÓÊ‚\ë÷‘©aq™\æ½:Š\0þ?\àø?ù ¿°\'ý•ßŸú†ø\"¿Îš¿\Ñgþƒÿ\0’û\Ù]ø\Ùÿ\0¨o‚+ü\é©-—¢ü€(¢Š`§ü™Kÿ\0\Ðø\Õc|Ÿ´ŸŠ\ã\\ð7?ƒ<0«“\ØdŽköOYð¥ÿ\0†üzž\×\á€\Ül\Ø-\Ô0N\'…\í\ï\îa/›>ü\0\àa”’¯\Ç?ø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¢‰ÿ\0¼{®|P>.\Ñô¸oôyu\r\Z\á5n#Š\Ï\ì¢v6÷7\È\ÅDNB¯\Ì\Øw%»õý´Wÿ\0`ÿ\0\Ù@ð\ïŠ?i¯ü2ø#\áÿ\0jsh~\Ö>!x–]\n\ÇZ\Ö-mE\åÆŸa4ó•ž\êR.$yý+\äŸøy—üþGö[ÿ\0Ã™ÿ\0¯\Ã_ø=µGü2/\ìa•—ö€ñž	©ÿ\0…~€\àö\È\à\ãµ›$“»\èÿ\0/òü@ÿ\0eoøy—üþGö[ÿ\0Ã™ÿ\0£þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh§g\Ýÿ\0Vÿ\0\'÷þ\âÿ\0³×‹ÿ\0a\Ï\Ú\×\ÂzÇÿ\0f|7ø\Ó\á=X—\Ãz·ˆü\â)µ\Ý/L\×\Ò\Ò\Æ\Ó.® Ÿdw‰kuora Ÿ*XÛÕ‘ñ\Óö1ýœ\ì\ï\ÇÏ?ü\ÅÊŸˆ¿¼=\á	%¶¸ŸÊ†KM\ïP³¼¸„HDK,N8%˜mb?‚¿ø#\ÇüŸÁ\ßðIÿ\0ø!÷\í?\ã½:}[ý£þ*~\Ô\Zÿ\0„?g¿\0]\Ï³\ÜxŠO†Žó\â½¦\r\à\ß¡[Ë¹,:¶®¶\ZRn¹¹{\ä«\ã_\ÇOŒ´g\Ä_üXø\åñÅŸ>!ø¯R½\Õu¯x\ÃY½\Öu	\îo\îd»š+cw,‘iö\Ë+M2\Â;m>\Ê-°Z[C\n*”¯¿o\Âßž·ûÀÿ\0`k¯ø)Gü.\Â\æ{+¯\Û;ö\\Ž\æ\ÒW·¸ŒüN·r’\Äv:—Ž\å£bY”õŠƒþeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh§g\Ýÿ\0Vÿ\0\'÷þ\Ê\ãþ\neÿ\0D%@ý´?e²K\0ü,È¹$€úþ\ä×ªøöšÿ\0‚Sø\êö-\Ã?µo\ì\ç}¨\ÝÆ“A\r§\Æ\ï\ÚL\Ñ\ÊQc1\Éy­C,\ÓFn\Éo¿\ÅNŠ,û¿\ê\ß\äþð?Ü–?\Ù\ß\áwŽô¦Ö¾üB³\Õl_+m¥k\ZW‹4I%\Ú+j\ZT\ÒÁ\rˆ\æf\ÚG\ÊA¼?RýŸ~%Xx’\ÛÃ±\éz/Lk¬[J\Ð\Äy-\Å\Ë\0mLjUžKó¨Ešÿ\0Ù§ö\äý®ÿ\0c\ßi^3ý›?hOŠ?	õmÉ·µðßŠõ4ð\í\Ä.TOi©xV\î{Ÿjvw1¯‘<º\\\Êð¼‘¡\Í£\ì“ÿ\0C|+ñWü/\â\íûB	§\ígð\â\ßá—ˆ>h·Qhƒ\â\ç\Å\r~\ÆWøo\âh\Æg½Ó¼+\â\ÑÆ¡\â™,\Ö{?¶\âX\';4\Ø\çZ¯5\çò\ë\ç¯\Ï\ä€þ„¡ýœ~x\'FoüWñíŽ•§[ûu\íî©§øc@´f•e\Ö5i¢U8Vù¤xCfU\Æqó‡Œÿ\0l\Ïø$7\Â+™t\Ï~\×?³^•y\Ék,z‡\Æ=U•\'u2*4­R\î2\ÅA$†*\0Á ñ_\ä\×ûpÁNmOø(O\Ä=wÇŸ´Ÿ\Æ\ïøŽ\ÇTººm\'á¾“«j\Z\'\Â\ï\éS\\I=¾…\á\Ï\Ù]&‘\r˜¤w\Ñ_js’ò\Ý\ßO$Ž\Ç\à:v}û~Ÿ?\Ïp?\Ù[þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\èÿ\0‡™Á?\èôe¿ü9‘ñúÿ\0\Zš(³\îÿ\0«“ûÀÿ\0gýö\íÿ\0‚8ø\Ò´øwöÀý™o!K•°f·ø¹¤Ùƒu!R‘²^\ê±c½@/–aƒ^ÿ\0\á«_Ø\â‚c\á¿\Ço†~%¸˜\ì‰<!ñƒÁ\Þ\"•_\Ìò¶ý†\×V¼˜3?È¨È¥‰R \îÿ\0ˆ\rjhú\æµ\á\ë\Øõ=W\Õ4=J/õZ†¨]é—±a•Ç—we4¦þYÌŠ\ÝT¬û¿\ê\ß\äþð?\Ûû\Å²MôI?„|Góª³-†±µ–V\Ï\ËWpn„q\Æ\é£@O%‡”¼E\á­wÂš”ºGˆ4Û2þ.L7	$g\î\Íƒ1\ÍŽVHÙ”ô\È9ü\Îÿ\0`\ïø/Ÿü¯öñ.‹7‚þ=x£\â\Ç\Ã;\å›[ø1ñ³W\Ôü}\à\Íj\Ê[‹i/ ³¾\Õ\î®<I\á«\é­`kK=KD\Õ`R\â\Î\ácH«ý<?a\Ûo\à?üCö.ð÷\íð²Ñ¼=\â›v¹ðÿ\0Œ¼¨OÏˆ~|O\Ò\í\â—Vð¦£u ¾Ñµ’ýQ	Z¶‡}c¨ù6÷K-¼U¾ºþvK·\Ì\ïösð‡‡<e\â½WOñ.™©iŒ\×\Ã+ÊŠ“ý¢4ó†HØ¬F	#œ\ãŠ\äþ/~\ÚðI_€_¼AðŸ\ãG\í-û?|4ø“\áIm\áñ‚ü[\ã\Ï\ì½F–\î\Ý.í£¿²–}ð¼\Ö\Ò\Ç2rcun„W¬~Ê¶óZxÿ\0\ÄV·´S\Ûh\ÓA4l0\É,W±\Ç\"ue\"¿Ë‹þW\0Ágl|\03\â?	\Ôÿ\0\Â ŸS€}©jÝ¿­9_ùý\à£\ßü<\Ëþ‰ÿ\0G£û-ÿ\0\áÌ‹ÿ\0\Ñÿ\02ÿ\0‚\"\Ñ\èþ\Ëøs\"ÿ\0\ãõþ54S³\îÿ\0«“ûÀÿ\0eoøy—üþGö[ÿ\0Ã™ÿ\0£þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh¢Ï»þ­þO\ïý•¿\á\æ_ðDOú=\Ùoÿ\0d_ü~øy—üþGö[ÿ\0Ã™ÿ\0¯ñ©¢‹>\ïú·ù?¼öVÿ\0‡™Á?\èôe¿ü9‘ñú?\á\æ_ðDOú=\Ùoÿ\0d_ü~¿Æ¦Š,û¿\ê\ß\äþð?\ÙXÿ\0ÁLÿ\0\àˆ`m\Ùo“ÿ\02>ƒ¯ü·¯N\ÐjŸø$\ï\î!±ð\ç\ícû8^\\\ÞZB\Ý-¾6xj\É\Ú\ÕDldG¾\Ö`DP%÷n\ÂC»I\rñ[¢•Ÿ\ëO?\'÷þ\ãú\Â\Ù\ß\âm¼“|-ø©¡øB\ïûG„<i\á¿\ZÁ\ZŒ\Íý™yt\n`Œ“(À#\æƒ^s\ã_Ù—\Æþ\ZŠk\í\àñNŸ¼Ž¶J\ÐjQF§Œ\ÙHOžBe\ß\ì\Ò9\0|¨I\Å‹g\ÃßŒ?~jvú\Ï\ÂÏ‰¾?øqª\ÚÜ¥\äþñ~¿\ák”¹•–S.‰d]¾E$Ü®£c†BV¿¬ø$ŸüwûT~\Ï^>ðŸ\Â\Û\ç\Äz‡\íû<\ëz­Ž}ñ#XŽ\Ü|aø[o}4Vc\ÄZ·†%ñ·†ôhü™µ\rUµd\Óà»—LÔ¤¼u·™\ë\ë\ëò_\æöûDtx\ã‘9#fI#u(\è\êJ²:0¬¤\Ê@ ‚\Í2¾\Ãø\ë\á?\nx\ÇÁ\Ú\Ç‡WV\Z®…\â=;I\Ö_T\Ñ\Ý&\Óu\Ý^µ‚\ïFñ¬ƒ¥\Ä7g	bšo\\ŸøQ\à)~\"x\ËO\ÐYž-=\ßj÷ý\è´\ëb¦Uº	n’\Þ#œ†¸\Î\Â(N\êÿ\0\×ü8ð\Â\ÏüD†§c…¹\Õ\ï	·\Ó`9N\Ê|ùÀ\É@®ÿ\0/Í°s_L\Ùþ\Ë^\Ð4Ùµoø\Ü[ZY\Ç\æ\ßÜ£\Ù\èúE¤@®eŸQ\Ôd\ÄH3³|¦$‚rHð·þ\éÿ\0üð÷üwG\Ñe\ÙwÃ¾ñW\ík\âo\n\Ûk¾f³W\Þ\nø\áMDHš6»\â]9_x³^\É}¡øz\æH-M‚cXšX.¬\í®ÿ\0\Îö—ÿ\0‚þ\Ý?µÿ\0ˆõþÐ¿µ\ÆÍ¨‹ˆ›EŸ\Æ:®‘\á+K)\çyÆ›c\á\n}7\Ã\Ööoò­\áþ\ÎwHU\å““\ëø\ë°\ëóâ¿‰ŸðM\ï…q¼ž=ý¥¾\è\0a4z÷\Ç‹”>`„™,`\Ö\Å\Â/\È0\á\Æ	VÇˆjŸðQø\"¯‡oe\Ñõo\Û+ö_·¿´\Û\ç\Å/\Å+K‰\Í]\éºk{¹a|©\È\Ø\çƒƒ_\ã6\îò;I#3\È\ì\Î\î\ìY\ÝØ–ffbK31%˜’I$“šm+>\ïò\í\éøþ\Ê\ßðó/ø\"\'ý\ì·ÿ\0‡2/þ?Gü<\Ëþ‰ÿ\0G£û-ÿ\0\áÌ‹ÿ\0\×ø\Ô\ÑNÏ»þ­þO\ïý•¿\á\æ_ðDOú=\Ùoÿ\0d_ü~øy—üþGö[ÿ\0Ã™ÿ\0¯ñ©¢‹>\ïú·ù?¼öVÿ\0‡™Á?\èôe¿ü9‘ñú?\á\æ_ðDOú=\Ùoÿ\0d_ü~¿Æ¦Š,û¿\ê\ß\äþð?\ÚK\Ã?¶Oü#\â0µ>ý®f»ñªy±Ù›OŒºŸ½­x˜\Çý¡ª\ÛyL»N\ã.\Ðü\í\Ý\Å}	\áÿ\0‡?²\ç\ÅCð»\âÿ\0…|LóÇ¾ðg\ÄO\nø\ÉY_\î<q\é·\×\Ì\ë\Ï;\Ó5þ5\ÖøO\Ç\Þ;ð\r\çö|i\â\ß\ê\Õþ\ß\á?\ë¼Þ„µh÷–s\ïBVß• F+>ý¿~vü@ÿ\0oŸ\ÙT¼?bñl\Ø1\0\Í:U¼ˆ`‚Û­\îD08!Lj:ƒ¸u\è4¿\Ù+Ã±l}WÄºÛ¦—iokm÷\Ã\ïIdô\èG\ät¯ò\çÿ\0‚yÿ\0Á\Ì\ßðR?Ø\Ä\Þ\Òüwñ3Uýª>Z\Íce­|0øÍ¨Ï­k6š-:\Ü\ÂñQ\'‰4\rT†¹µgL¹¸‚\î\ìLo,•þ£ß±\íŸðSöÿ\0ýš~~\Ô\0õ™5?üBÓ¤’M>ùc^ðŸ‰4\é\Z\Ë\Ä~\rñ-¬N\ëi¯xwTŠk\ÄVxn\"¼´y-. •\Ýõµ»¯—õ\Ö\àz\Z|øC\à\íT\Ô5\"\Ëû\'K²¾\ÕuSZ¹\í\í´\ë+V»¿º¹Ì¢­-­\á’y\0Œ,q£À¯€,¿\à¬ÿ\0ðFmm–_¶‡\ì‘aug3\Ç\æ/‹twÐ¹\Ô\\=»\\#F\èW‰8+\Å~ˆþ\Ð\\üø\á\Ü„_¿ø¢õšÿ\0\Í|®\ë@\0\0Õµ \0\0É°\0\0¥«o^«O¹ÿ\0Àùþ\Óiÿ\0¦ÿ\0‚K\ÆIöýý™·\Þ)ñLR\Ø\é’gôÿ\0ø}_üoþ’û4ÿ\0\á\ÆÓ¿øšÿ\0º)\Ù÷Õ¿\Éý\à·\Ï\Âoø*üŸ\ã¿\ÄO|%ø;ûeü\nøñ/Æ—“\ØxSÁ^ñ½–§\â\r~ö\Ú\Æ\ëR¸¶\Ólb]÷Eaewvè¼ˆm\å~Šk\î/x›Ãž\Ñ\ï|E\â\ï\è~ðöœ‹.¡®øU°\Ñ4{‰$½\Õ5;‹[+Tg šhÔ±95þ8_ðoF·£xkþûx—\Äz†‰\áÿ\0x\ÛÇšþ¹­j·0\Ùiº>£üø©\êw÷—\Ú\Ú\ÙYA=\ÄóH\ê4nI ^ÿ\0‚õÁf¾#ÿ\0ÁN¿j_\é?üi\âö;øi{y\àÿ\0ƒþ\0³\Ô\ï´\Í\Æ6zu\Û%ÿ\0\Ä\ï\èöóEoª\ë^-¼…o4ÈµHî¿°ô8´\Ëa\âòYÕþ\'ý[ó·ç¾ §_\à­ðL¯‡ºœš?ŒnÙ«EÔ¡¸¹µ’Ù¾(øvô¬öŒ\â?7Mº¼„ùl@\Ü$(\ßÀ\Ì+Œÿ\0‡\Õÿ\0Á&ÿ\0\é ?³Oþm;ÿ\0‰¯ñK¢Ÿwý[üŸ\ÞûZ\Ã\êÿ\0\à“ôÙ§ÿ\06ÿ\0\Ä\Ñÿ\0«ÿ\0‚Mÿ\0\Ò@fŸü8\Úwÿ\0_\â—E}\ßõoòx\îƒû9~\Ýÿ\0±¿\íy­x›ÃŸ³\í#ð³ã†»\à\Í.\Ã[ñV—ð÷\Äö\ÚõÞƒ¤\êwsX\é÷úŒp(ò-®\ï-æ·…\Øü\Ò\ÆË\Æ}\Ã\ãü’/ŠöN<qÿ\0¨Î©_\ç­ÿ\0Aÿ\0\É\Ì~\Ý?öBþÿ\0\ê«\×úübÿ\0’EñOþ\ÉÇŽ?õ\Õ)k®·\Ö+ÿ\0IüÀÿ\0?ÿ\0\È\á\â\Ïûu\ßý:]W5]/Œÿ\0\äpñgýŒº\ïþ.«šª\0¯\Öø!—\Åo†ÿ\0ÿ\0à¬Ÿ±G\Å‹þ5ðÿ\0ÃŸ†\Þ\nø«jž,ñ¯Š¯—Mðþa\'€<ca\rÖ§|\ê\Ém\×\×v–i#ž}\ÌJÌªÅ‡\äõþÖ§þYÿ\0›?óÙ }>\"\é\ßüM>/ø-7ü~yb‚\Ûûök’i\åŽcOˆºqy%™\Ö8£Q·–weU\Éþ(õµ\á ˆ´\0@ \ëZP Œ‚\rô \Ô\Ù÷\íø[üŸ\Þû\éX^\ÚjVVZ–Ÿså†£mo}ew‡†\ê\Î\î¸¶¸…\ÇðÈ’\Æ\ÝXÖ®Wžü%ÿ\0’Uð\Çþ\Éÿ\0ƒ?õ\ZÓ«Ð¨‹\Ó\îÿ\0\ÒP\Êü7­\Íaÿ\0™Ñ´xƒ„×¿j/„\Ép\Ê\ÛTÁ¦\è~:½Xd_\ãW¸ò\Ð<Ý…–©üUÿ\0(²ðGýÃ¯ýF|q_\å½Dvû¿ô”EU\ê_¾	|Zý¢þ&xS\à\ßÀß‡þ&øŸñC\Æú‚\é~ð_„´\é5-gV»*\Ò8Š$\Ûöñ+\Ïw{w-½•º=\Å\Ý\Ä0£8þ¯¾Á˜_ðP_ˆ~±\×þ0ünøðU¼ó?„.\äñ\'\Ä]r\Î\ÚuY¼¸ð½­¾‰ô¶\Ù\ì\ÓS•c¸p\Ê\ZQõ§ü!ð[Àú¯ÿ\0lÿ\0z¦“g¨xû\ÂZ\Ã\ï‡^Ô®­!–\çÃº7ˆ\æ\Ö5I¥\\º™mg\×\r†›g~\Ñi-,R\Þ\\²«¡˜\Ï~¤ðÿ\0\ZW\è·ÿ\0†ý—ùù\Úø2\ãNN?nÿ\0…ø\ÏøM\â\Ì\ã¶q\â´ŸñÆ¯ú>ÿ\0…\ßøi¼Yÿ\0\Í\r¢f\Ñ\è?*0=\åK\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?do\ØÅŸðJ\ßø\"¯\Ç\Ï\Ùg\\ø—£|Oñ\'€þ~\×\Þ7ƒ\Æþ\Ñoô\r>fño…üm\â}6´\ÝB\ê\ê\î)ôÕ–§\Ü–dg‹jüyÙ™Ù™‰fbY™‰ff\'%˜œ’I9$òO&¿\ÝWö\àýŠÿ\0küùµßÿ\0ú©üY_\áSDo­÷¿\è€(¢Š 44\'T\×õ]7C\Ðô\ë\Ý_Z\Öo\ìô­#I\Ómf½\Ôu=OP¸Ž\Ò\ÇO°³·I..\ï/.¥Š\Þ\Ú\Ú\Þi\æ‘#\Øýb~\Ë?ðgŸüc\ã¿\Ã\í\Ç\ßüyð‡ö^\é\Ðj¶	ñññŠ<weiu2\Û\Ã\â-Â¶’Zh:¡?\Út»­NK›?,%\ÈIÙ \ãø5÷\à\ï…þ1Ádfø<Ya§gð\ßKøñkM²ºŽ­\Ä>\rð\Í\Çö\Äöó¤‘\Ît\ëýF-J\Ôm\ß\rý¥\ÔdIšÿ\0^¾ùÏ¶?\ÏzM»\ÙVjúz>\àŠÿ\0Á?6&ÿ\0Û¿\áfý‰\æmøO\âÒžfÑ¿f|@\ÍùÙ¸nÛŒóšwüAñ«þ¿\áwþ\ZoóC_è™\è?*0=\åK\Þ\î¾ÿ\0O/\êþ€ŸüAñ«þ¿\áwþ\ZoóCGüAñ«þ¿\áwþ\ZoóC_è™\è?*0=\åE\å\Ý}þž]ö\ï@?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò¢ò\î¾ÿ\0O.¿ûw \çgÿ\0@üjÿ\0£\ïø]ÿ\0†›ÅŸü\Ð\Ñÿ\0@üjÿ\0£\ïø]ÿ\0†›ÅŸü\Ð\×ú&`zÊŒAùQyw_§—_ý»\Ð\Ï\ïø%\×\ì]­ÿ\0Á>?aÿ\0‚²Wˆ|q¦|G\Õþéš½…\çŒ4m.\ëE\Óuw\Õ5\ÝCXW¶\Óof¸¹·HVôA‰fvcló_ T˜Ÿ—´\Õþÿ\0òK²\0¢Š)€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEü0ÁðòA`Oû+¿?õ\rðE5¢\Ïüÿ\0$öÿ\0²»ñ³ÿ\0P\ßWù\ÓR[/Eù\0QEÀÿ\0Oø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¯\ï\àÿ\0€ÿ\0Jþ@\à\Ì?ùF\Ï\Æû9¯ÿ\0\ê!\ájþ¿¿ƒþý)-ß¯\è€þ&?\àöÿ\0ù4o\Ø\Ïþ\ÎÆŸú€%›…¤ü\ßÿ\0&ûÿ\0\ÙÀø\Óÿ\0P¯óp¡l½\äESWži#Š–WŠ\r\âÝ£‡\ÌmòyHIXü\ÇùŸ`\Û\ælžj*þ³?\à\Ùø!ÿ\0ÁŸø)~·ñcöŒýªF©®|ø!\â]#Á\Z7\ÃM#Rº\Ñ\Ä/ˆwšm·ˆ\î¿\á$\Õl\Ìw\ÑøO@\Ñ\îtóqa§O\Ú\Å\î¤-§¹‚\Ú\Öh\î?ºeÿ\0ƒÿ\0\à\n ø\'\ÏÀr\0\0e\âf$–oc\ê\ÌI\'’I¥_\ê\ß\çp?\Æ6Šÿ\0g?øpü§þ‘ñðÿ\0\0|Kÿ\0\Í|¯ûVÿ\0Á®ŸðI\Ú\áÞ³\áÏ‡-¿f_¶™xžø‡ð{V\×,\ßH\Ö\Ú[ýg\Ã:Æ©©\è¾#\Ó\à•—\íZe\ÄV\Æ\â,˜\î`¸X§BýÕ¿¥ú»|˜\äiE}ûZ~\Í\Þ7ý¿i_Ÿ³\Äyl®|iðG\âˆ|®_iŒÏ¦\êr\è·m®¯§³|\Æ\ËW°k]J\Ô6YaºDbYM|ñLœÂ²`ŽTº‚B±\\\í,¹\Ã\ÉÛq“Ž´\Ú(\0¢¿Ô“þ	1ÿ\0\Â~À_?e…¾=ý°¾\é´‡\íñOÀ^ñ—\ÇZ¦­?‚</‰¬­u\Û/x?\Ã\ÚEþ™l²h¶WqX\ß\ë—\ïu{©]}¥ö[B¶ð\ÇúŸÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¥~\Úÿ\0Ã¯óü\ãE³Ÿü8þ\Óÿ\0Høø\rÿ\0€>%ÿ\0æŽ¿\àº_ðm?\ìL?cÏŠÿ\0´·\ìMðº\×ö}ø\ÃðÁ—þ>ºðoƒou)|ñ\ÂŽK\ïišŽ‰¬_j\Ù:ý®ö­[O\ÖôÛ˜G\Ó…å¬±\Ý\á/\ÝZÿ\0\ä¿\ÏðüÔ¨¢Š`ý¬Á•?´.³\á\Úûö–ýšg\Ôn¥ð\×\ÅoƒVl4wºYYø—á®¿i§\Þjööy1}®÷Gñ\\V7s\0à´³R\ÅaU¯âž¿ªø3È‘ÿ\0ŒþË¿AÁ##ûGÀG\Ôdƒ\Ü\Ô\nOošü\Ð\ék\àmè¿´7\Ä?.#¶½\Ò\ÓP¼§X·_½­Ëª>ÁÝ¾PÄ‚yþP¿ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\èþ\Ã\"(Ä†Q\Z	Xm2_0¯)|n#Á8\àzWøóÁ\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T­þ_¤\0ü#¢Š*À(¢¿\Ø_öÿ\0‚ÁüUð\à—Š5ÿ\0\Ø\à^¥®ø“\á\Ãm{Z\Ôg²ñ+O«k\rÑµ\rJöfÿ\0„™n¯.&žC\Ý\ä&“vþ¼\Òý@ÿ\0Š+ýœÿ\0\áÀðFŸúG\ÇÀoüñ/ÿ\04tÃ€?\à?ô€\ßø\â_þh\è»\ìÿ\0«yy¿¸ñŒ¢¿\Ù\Ïþÿ\0iÿ\0¤||ÿ\0Àÿ\0óGTõø7\ÏþÏ¨\Ø^X?\ìðJ\Ño-\æ¶7Zt^*²¿¶ó§Ÿgw‰[{˜‰\ß¨~GPHeÊ•~\é¯\é›û˜\ã1EEðq—üóÀŸðJO\ÚgÀð¢µ=Pýž>>økTñ7´¯]6©¬x_\Ð/\Ò\ÃÄž\nŸ]‘R]n\Æ$¸°\Õôk\ë¤ûrY_µ•\ä—Ù‹™ÿ\0z \n(¢€?\×þ\r•ø\Ñ{ûJÁ?g›/Io®\Üü4¹ñ¿ÀÛ¸.X\Ü<š\Ã\ßOi\áh¯‹9‘\ä_Ï¥*»\ÛbM¤\ì¿|ôø[\Â\ÆVðö…§i/:,sKi\0Y¥YcyX´¬¡˜¶\Ò\ädŽ8þ[ÿ\0\à\Î\ÏùD\í\çh¯ŠY÷ù4:þ¬¥?º“þ¹¿þ‚j{ÿ\0‰}\ÞîŸ \âÿ\0Dý¡µÿ\0ÚŸþ\nû\\üoñõ\Õô\Þ-ø\ã\ã»})n¦–a§økÃº\Ý×‡<7¤Ù‰YŒ:~›£iVv¶V\à…†U\0s_×¨|n$ühø¼I$ŸŠ?$’I$ø¯V\É$òI\îO&¼¾¨Š+Ö¾ü\Zñ\íñ¯\áOÀ\0\Ã\Þ2ø»\ãÿ\0|>ð\ï\Ú7ý’\ßRñN±k¤\Å}|c\r\"\Øi\Â\å¯\ï\Þ5gK;i\Ý™B%¢¿\×öBÿ\0ƒ]?\à”¿³¯\Â\í\Ã_>\éßµÄ§Ò´ÿ\0øM>#|ZÔµË¸µ/-¼cRŸ\Ã>\Z\Òõ=3JðÖ%Àag`‘]\\$*¯qw-Ä“;}cÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¥~Éµ\ß\æ¿\Ïð`Œeþ\Îð\àø#Oý#\ã\à7þ\0ø—ÿ\0š:?\áÀðFŸúG\ÇÀoüñ/ÿ\04t]öÕ¼¼\ß\Üø\ÆQ_\ì\çÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¯\å{þ\\ÿ\0ƒ|ÿ\0e\ÏÙŸön»ýºÿ\0bOÿ\0Â¡³ðˆt\r\ãÁý*úþûÀ÷^ñ\Ñ\èö1ð´\Z­\Í\í\ç‡õ#Z6Vú¶Ü¶\Z•¾¬\×QCi5‘Y\Îm¯¥öû—ùþ\0´QE0\nÿ\0A/ø2/ö€×¯´\Ûcö_¿ºi¼=\áë¯‡Ÿ|;÷Hm/¼F5xŽ\ÊAm\"\èZ\Í\ÒÂŠ¯s2\ÊÙ‘Ý›üûkûiÿ\0ƒ$?\ä\î¿l³ŽG\ìý\à¿ýOÞ“\Û\æ¿4ú~\Ð9ÿ\0…	ñ¿#ñh~%t\è\âŒÖ‡—N\Õþ¾ ÿ\0ö·ÿ\0a}Kÿ\0K&¯÷‚ý ¿\ä‚üpÿ\0²Eñ+ÿ\0P½f¿Á÷\Äò\Öÿ\0\ì/©\éd\Ô\'{¾\í\é(Š(¢˜ô\ÝWS\Ñ\îMæ‘¨\ßiw†›_µ\é\×S\Ù\\ýšò	-o-\ÅÅ³\Ç(†\î\ÖYm®c{ie‚PñH\è\Ô+\êOØ›ö]ñ?\í«ûY|ý•|¨A£\ë¿þ#h¾‹Y¹Pð\èºm\ÃK{¯\ëM2‹†\Ò4-ORŽØº}¦[T·Þžf\áþ­ÿ\0¿\àÚ¯ø#\×Á†\Þð³û&xO\ãNµ¥\Ú\Â5ˆ\ßõ\r^ñ‰53I{u%ž¯§\éº}µ\Å\ÊKqm¥i\ÖP\ÚX$\ßfˆÈ‘«R¿õý_€\ã\ÙE³Ÿü8þ\Óÿ\0Høø\rÿ\0€>%ÿ\0æŽøpü§þ‘ñðÿ\0\0|Kÿ\0\Í}Ÿõo/7÷þ1”Wû9ÿ\0Ã€?\à?ô€\ßø\â_þh\èÿ\0‡\0Á\Z\é¿ðÄ¿ü\Ñ\Ñw\Ùÿ\0VòópÈ§üÿ\0\'1ûtÿ\0\Ùø_ÿ\0©þ¯_\èSñ‹þI\Å?û\'8ÿ\0\ÔgT¯›?e_ø\'\ì7ûkþ,ñG\ìû5ü:ø\â\é:‹u_[j\Ý\ëº6›zúŽŸzÚ†§~¦\Þ\Úõ\Ú\å%Œ™Y˜\0\Ò¿\ä‘|Sÿ\0²q\ãýFuJZë¥µ‹ÿ\0\Ò ?Á\Ï\Æò8x³þ\Æ]wÿ\0N—U\ÍWK\ã?ù<Yÿ\0c.»ÿ\0§Kªæª€(¢¿Tÿ\0\àˆ¿>þ\Ðÿ\0ðU_\Ø\Ç\à·\Æ\ß\è¿~ü@ø•«h\Þ3ðGˆ’\éô_i±ø\ÅúŒ6·\égsgr\ÑÃ¨YY\ÞF#¸÷ö\Ño\ßø\Øò²¶ü5ÿ\0#‡ÿ\0\ì7¥\é|þ\Ëð\àø#Oý#\ã\à7þ\0ø—ÿ\0š:|ð@?ø#\\R$‰ÿ\0ùø\n7WBtÿ\0°„2’­\â&V\0•`Tô Ž*So£þ­\å\æþ\à?P>\É+øcÿ\0dÿ\0ÁŸú\é\Õ\èUGNÓ¬´};O\Òt\Ëh\ì´\Ý*\Î\×N\Ó\ì\áCicen–¶–\ÑIÁq\Å$ª2OZ½Dvû¿ô”òQÿ\0•\Ê,¼ÿ\0gGð\ëÿ\0QŸWùoWúÿ\0Á\å_ò‹/\Ù\Ñü:ÿ\0\Ôg\Çþ[\ÔGo»ÿ\0I@QEP\è?ÿ\0@ÿ\0È£ûwÿ\0\Ø\Çð›ÿ\0Mž!¯\ïf¿‚oø2þEÛ¿þ\Æ?„\ßúlñ\r{5+\â?\Ê\0QEPQ@Q@Q@.þ\Ü?òeµ÷ýš\ï\Çÿ\0ýTþ-¯ð©¯÷Vý¸\ä\Êÿ\0k\ïû5ßÿ\0ú©ü[_\áSInýDESújÿ\0ƒH?\å2\ì‰ümÿ\0\Ó…¬u“ü\ZAÿ\0)“øsÿ\0dO\ãoþ˜,+ýcªW\Äþ”\0ü¿ÿ\0‚·ÿ\0ÁKü;ÿ\0£ý•mj/|,\×>/i—?|!ð\Ïþ_\ë\Ú‡/¢ŸÅšˆµõf\Ô5+k¸\r½¢øzH^\Ý id’\î&cI2Ÿñ÷Á_ú1Š?øv|\'ÿ\0\Ìõ}óÿ\0Œÿ\0\Ê#4\ßû:Ïƒú|G¯ò¹¥š\ëÓ«\í\ßúùþ‰¿ñ÷Á_ú1Š?øv|\'ÿ\0\Ìõñ÷Á_ú1Š?øv|\'ÿ\0\Ìõ•\\«\Ï\ï\ç\ä¾\à?\Ñ7þ#~ø+ÿ\0F!ñGÿ\0Ï„ÿ\0ùž£þ#~ø+ÿ\0F!ñGÿ\0Ï„ÿ\0ùž¯ó²¢ŽU\ç÷¿óò_p\è›ÿ\0¿|ÿ\0£ø£ÿ\0‡g\Âü\ÏQÿ\0¿|ÿ\0£ø£ÿ\0‡g\Âü\ÏWù\ÙQG*óû\ßùù/¸÷ÿ\0‚tþ\ÚZGüö@øIûZ\è^\Õ>\é¬5[\ë_k:­žµ¨i+¥\ëWú;,ú•„0[\\†±7”†6H\åTu¬+\í\Úü$ÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯Ýº—]Ÿ\è€(¢Š`QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0ð|ü_\Øþ\Ê\ï\Æ\ÏýC|_\çM_\è³ÿ\0Áÿ\0\Éý?\ì®ülÿ\0\Ô7ÁþtÔ–\Ë\Ñ~@QE0?\Ó\ãþ\Ãÿ\0”lüaÿ\0³šñ/þ¢¯\ëûø?\à?Ò¿ø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¯\ï\àÿ\0€ÿ\0JKw\ëú ?‰ø=¿þMö3ÿ\0³ñ§þ 	_\æ\á_\éÿ\0·ÿ\0É£~\Æöp>4ÿ\0\Ô+ü\Ü([/Eù\0QEÀÿ\0M_ø2´\çþ	ñûE\Óþ\ZŽûû§ž¯\ìˆtAü«ø\Ýÿ\0ƒ+?\å´Wý÷þ«¿\×öD: þU+\â—\Ëòi;¡þkKI\Ü}óKeþ(\éHñšÿ\0ƒ‚\É?ðY?\Û\ç?ô[.\ÇþP4:üm¯\Ù/ø8/þS\'û|ÿ\0\Ùl»ÿ\0\Ó‰_µ@$?\ëbÿ\0®‰ÿ\0¡\nŽ¤‡ýl_õ\Ñ?ô!@\ïGðLŸøS_=þxŸü%4šõ\Zò\ï‚_òF¾\Ù0ðþ¢zMzLvû¿ô”_%~\ß@\Ø[ö\Î?\á”ÿ\0hNqð—Å§¡\È\ë\ÏÖ¾µ¯’ÿ\0oŸù1\Û;þ\ÍOö…ÿ\0\ÕK\â\Úoošü\Ð\áwES\0¯\êƒþòÿ\0”ÀEÿ\0f»ñ·ÿ\0N¯\å~¿ªø3\ËþSýš\ï\Æ\ßý8x“\Û\æ¿4ú¬Wøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê WûWøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T\Çu\éú@\Â:(¢¬¿\Þö^ÿ\0“gýÿ\0\ì…ü$ÿ\0\Ô\ÃõþuþðŸ²÷ü›?\ì\ïÿ\0d/\á\'þ ¥\Õz?\Í\î”QE0\n(¢€?€_ø>üŸ°Oû\ßÿ\0—„«ø¯\ïûþûŸ°Oû\ßÿ\0—„«ø¤¶^‹ò\0¢Š)þ¨_ðgoü¢vóþ\Î+\â—þ¢Wõe7ú©\ë›ÿ\0\è&¿”\ßø3·þQ;yÿ\0gñKÿ\0@\Ñ+ú²›ýT¿õ\Íÿ\0ôS\ßüQÿ\0\Û@ÿ\0¯\ßòYþ.ÿ\0\ÙOñ÷þ¥zµy…z\Æ\ïù,ÿ\0\ì§øûÿ\0R½Z¼Â¨¿Q\à‰\àø+\ì\ÃEx/‚=\Ñ\èr:óõ¯ËªýFÿ\0‚\'\ÊX¿`û8¯ÿ\0\èwTþ\ÖTQE%²ô_QL¿	ÿ\0\à\åb\á\Ë_¶—¿†|?ó%øB¿v+ðŸþVÿ\0”-~\Ú_ö,øÿ\0V_„*^\ëúûQüwè¢Š \nþ\Ú\à\Éù;Ÿ\Û3þ\ÍûÁúŸ½\Õý´ÿ\0Á’òw?¶gý›÷‚ÿ\0õ?zOošü\Ð\èaûA\Éø\áÿ\0d‹\âWþ¡z\Íƒ\ïˆ?\ä=­ÿ\0\Ø_Rÿ\0\ÒÉ«ý\à¿h/ù ¿?\ì‘|Jÿ\0\Ô/Y¯ð}ñü‡µ¿û\ê_úY5(\í÷\é(Š(¢¨\Û/ø70ÿ\0ªý‚r\Ç\Ä\ÏøS\ãò\Ïpy¨<Žký‘\Þo\ÃùWø\ÞÁ¹òš¯\Ø\'þ\Ê_Šÿ\0õTxþ¿\Ù}\æü?•.«\ÑþhQEÀ(¢Š\0+\Î>1\É\"ø§ÿ\0d\ã\ÇúŒ\ê•\èõ\ç¿\ä‘|Sÿ\0²q\ãýFuJOošü\Ð\à\ç\ã?ù<Yÿ\0c.»ÿ\0§Kªæ«¥ñŸüŽ,ÿ\0±—]ÿ\0Ó¥\ÕsTÀ+ö‡þ\r\ßÿ\0”\ÒþÀöWuýV¾9¯\Å\êý¡ÿ\0ƒwÿ\0\å4¿°ý•\Ýcÿ\0U·Žhý•è¢ŠKe\è¿ \n(¢˜\ÉGüUÿ\0(²ðGýÃ¯ýF|q_\å½_\êCÿ\0•\Ê,¼ÿ\0gGð\ëÿ\0QŸWùoT\Ço»ÿ\0I@QEP\è?ÿ\0@ÿ\0È£ûwÿ\0\Ø\Çð›ÿ\0Mž!¯\ïf¿‚Oø2\ÓþOÛ¾=\é\æü&sõó7\Ä*Ç\á¡ö\í,\nƒE{y©_ùþP\0¢Š*€(¢Š\0(¢Š\0(¢Š\0ùwö\áÿ\0“+ý¯¿\ì\×~?ÿ\0\ê§ñm…Mº·\í\Ãÿ\0&Wû_Ù®üÿ\0\ÕO\â\Úÿ\0\nšKw\ëú \n(¢˜\ÓWü\ZAÿ\0)“øsÿ\0dO\ãoþ˜,+ýc«üš¿\à\Ò{›{oø,§\Ã1q4p›Ÿƒ_\Z­­Ãœy\×\á\ë7Hc\ã™#‘€\ã!ž+ýej~\×\ßùD\æþºø!ñƒö€ÿ\0‚\\\é\Þø!ð\Ó\Æ¼f?iŸ„\Ú\ÓøcÀº÷ˆµ´\Ñ\ì4?\Ã{©¶Ÿ§\Ç5È²µšò\Ò\ç”ŠK¨C#ü\Ø?\á\ÖðQÿ\0ú2?\ÚWÿ\0\rGŠ¿ù__\íÿ\0E™t\íÿ\0¶¯\Êÿ\00?\Äþaÿ\0ÿ\0£#ý¥ð\Ôx«ÿ\0•ôÃ¬?\à£ÿ\0ôd´¯þ\Zò¾¿\ÛþŠ=\î\ßÖž~ ƒwÆ¿\Ù\×\ã·\ìß®i>ø÷ð“Ç¿|C¯iG\\\Ñtoˆ\Ô|5¨\êš8»ž\Ä\êvVº”0Kqf/m®-Lñ©ŒO‘\çr<b¿´Ÿø=¤“ûsþ\É ’@ý”\îp2p3ñk\Ç\àv\É\ä\×ñmTžˆŠ( öÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯Ýºü$ÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯ÝºKw\ëú \n(¢˜Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@\Ãüÿ\0$öÿ\0²»ñ³ÿ\0P\ßWù\ÓWú,ÿ\0ÁðòA`Oû+¿?õ\rðE5%²ô_QLôøÿ\0ƒ0ÿ\0\å?\ì\æ¼Kÿ\0¨‡…«úþþøô¯\äþ\Ãÿ\0”lüaÿ\0³šñ/þ¢¯\ëûø?\à?Ò’\Ýúþˆ\âcþoÿ\0“FýŒÿ\0\ì\à|iÿ\0¨Wù¸WúGÿ\0Á\íÿ\0òhß±Ÿýœ?õ\0Jÿ\07\n\Ë\Ñ~@QE0?\ÓWþ¬ÿ\0”|~\Ñ_ötw\ßú®ü_\Ù\è>ƒùWñ»ÿ\0V\Ê>?h¯û:;\ïýW~¯\ìˆtAüªW\Å/—\ä\ÒwCü\Å-\'qô?\ÌQ-—ø¡ÿ\0¥\Äñšÿ\0ƒ‚ÿ\0\å2·\Ïý–Ë¿ý0h•ø\Û_²_ðp_ü¦Oöùÿ\0²\Ùwÿ\0¦\r¿j€*H\Ö\Åÿ\0]ÿ\0BIúØ¿\ë¢\èB€?Þ\à—ü‘¯„öL<ÿ\0¨ž“^£^]ðKþH\×\Âû&ÿ\0\ÔOI¯Q©Ž\ßwþ’€+\ä¿\Û\çþL_ö\Îÿ\0³Sý¡õRø¶¾´¯’ÿ\0oŸù1\Û;þ\ÍOö…ÿ\0\ÕK\â\Úoošü\Ð\áwES\0¯\êƒþòÿ\0”ÀEÿ\0f»ñ·ÿ\0N¯\å~¿ªø3\ËþSýš\ï\Æ\ßý8x“\Û\æ¿4ú¬Wøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê WûWøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T\Çu\éú@\Â:(¢¬¿\Úsösÿ\0‚œÁ<´?\Ù\ï\à>«þ\Ú³–Ÿª\é¾éš•…\ß\Å/Áuea\à\Öò\Ò\æ	o–Xg¶¸ŠHfŠEWŽTdu¤Wø±\ÑI«\Ûú\êŸ\èû€ÿ\0\Ã\Ó?\àœ_ô{³Wþ\nòÂøzgü‹þoöjÿ\0Ã±\áOþXWøQEŸwý[üŸ\Þû€ÿ\0\Ã\Ó?\àœ_ô{³Wþ\nòÂ¼\êûþCÿ\0£\Ó.n\ì\ï¿o\ßÙ¦›	%Š\î#ñK“Ê’ùªZ?1n1³©þküP\è¥g\Ýÿ\0Vóòx\Õ\×üSÿ\0Lýÿ\0à ¿´/Àÿ\0‡?²ÏŒ¬þ&ü.ýŸ<)\â«üJÒ­\çÃ¾\'ñÇ.\ì®o-ü+wu\Z–£i\Z}…¬ú‡\Ùã·¸\Õ$»Ž\Ô\Ë\r°šO\åŠ*–‰.ÀQE\0ªü\Ø\ãS·Ÿöq_¿ô\r¿«)¿\ÕKÿ\0\\\ßÿ\0A5ü\ìÁ¬?uÏƒ_ðF\ï€w^\"\ÓV\ÃSø·\â_ˆ\ßm¹\ï<7\â\ïO…/¸:›gpŠÀ&\Ê\îFF?\ÑW±\èGO\çü\ÅOñ/ý·_N¾€‚¿\Æ\ßù,ÿ\0\ì§øûÿ\0R½Z¼Â¾\Ðÿ\0‚‹ü\Öÿ\0g/Û»ö¶ø-\âZ-GÀ~&i£(È“X\\ø£P\Ôô«˜*‰-®t\Ë\ëI­\æA²h$Cµ…|_T_J~\Ç¦ý•ÿ\0j¿\Ù\ïöŒŠ\Â]U>\r|ZðWo´¸R\çR\Òt-j\Ö\ãZ\Ó\í]Ê¢]\Þim¶µy.$‰¤ùW\ÍtPûN|ÿ\0‚\ßÿ\0Á,h\0\è\Þ?ð\í›ðgCƒR\Ó\ìn\ïü1\ã\ï\Ùx\Æ^\Zº½g:Gˆ¼=\â³º²\Ô\íN\è§HMÍ¾\å-\rÄ±•s\ì¿ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°¯ðþ¢•»7n\Úù“ûÀÿ\0pøzgü‹þoöjÿ\0Ã±\áOþXQÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\nÿ\0\ê(³\îÿ\0«“ûÀÿ\0o‹\Ïø*\Çüf\Â\Ò\æú\ïö\àýš¡µ´…ç¸—þ¯…\ßË†1¹\ßdw\Î\í´s„Fc\Ø\ZþY\à\åø.÷\ì)ñ{öñ¯\ìmû)|e\Ðÿ\0h‰\Z5ŸZø›Zð\n^_øÁžð\î»»ª¶¥\ây µ²¼\×oot½:\ÓO\Ó4\Ãx<¹gººšƒË“ü\èh¢\Ý\Ûvÿ\0ú«€QEÀ+ûiÿ\0ƒ$üe\Ï\í—ÿ\0fý\à¿ýOÞ¿‰jþú?\à\È_‚ºúk_·\'\ísfW\Â÷\ZW\Ã?ƒzEó)Mz\ÒóUñ¦½dñ\'•§\Þh\å?Õ™B±ý\à=¾kó@v?´ü_ŽöH¾%\ê¬\×ø>øƒþC\Ú\ßý…õ/ý,š¿\Þö\Ïü(Où\ÆO\Â‰]:È™­Wø>øƒþC\Ú\ßý…õ/ý,š”zü¿ô”EQT\íŸü—ÿ\0)ªý‚\ì¥ø¯ÿ\0UG\ëý\Ç\Þo\ÃùWø\ÞÁ¹òš¯\Ø\'þ\Ê_Šÿ\0õTxþ¿\Ù}\æü?•.«\ÑþhQEÀ(¢Š\0+Î¾0+?\Â_Š(Š\Î\ïð\ë\ÆÊŠ ³37†µ0ª rX’\0’Nz-Q\Ôôûm_M\Ô4«\Ä/g©\Ø\Ý\é÷H	\í¯`’\ÚurE#ö\ÏŸ\ê¿4øø\Ô2ø\ËÅªÀ«/‰µ\å`AªÝ‚=<\\\Í}û`|%ñ7ÀÚ«öŠø9\ã	4\Ï|9ø\Ïñ\ÂÚ”ª\ÊñI¦ø§SŽ\ÚÜ…ž\Ð\Û\ÜGœ\æ9T‚A\ÉùÊ˜}‹ÿ\0ùý¨\ìWûkþ\Ìÿ\0µC\érkv_>+øs\ÅúÎ“\Å\Íÿ\0‡Y4\Ï[Ù‚U\Zùü?¨jaŽFXd¼G3™\Èø\êŠ\0ÿ\0jŸƒ?ð[/ø%\Ç_i^<ðg\í«ðKO±Ô¬\ì\î.t/\Zø¶\ÇÁ^,\Ð.o-\ã¹:Wˆ|;\â³½Óµ[UGu\0Â’)\\MY\Ö?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE+y¿\ê\ß\äþð?\Ü¿\à©\ßðNVfý·?f ª1ÿ\0…¯\áN\0\'C<Jû·O¿²\Õl,µM6\ê\í;R´¶¿°½¶‘f¶¼²¼….-n­\åBRX. ’9b‘IWÕ”E€•¼\ß\ìú1ð\àˆ\0|\"øl\0\0\à\Í\0\nZ§{\Þÿ\0‚_\å˜\ÌGüSÿ\0¯ð\\‹´qþÔŸ\rÄ’%¿†|s°;…/µ¶\ç¶œt¯òÛ¯õ»ÿ\0ƒ«¾\n\ë¿ÿ\0\àŽ?ot+i®\î~xÿ\0\á\Æ[ø­\Ð\É Ñ¼;«^xwW›\Ê\\³\Çog\â\É.&\Ú“RNØŽ#ü‘(Ž\ßwþ’€(¢Š ?r¿\àƒ_ðWË¯ø$o\íM­ø\×Åž\Ô|mð\ãF…¥ø#\ãW‡tCñ.›e¥\ê2\ßøs\ÇK—Ž\Ú\ïUðµ\Í\æ¡ö\"Y ]gI\Ô/­c¸Šò;&\éð;þÿ\0 ý </a\â~\Ú\ßô–»°†þ\ï\Ã>?\×\×\áÿ\0‹ôAp_m¾·\áÿ\0&Ÿsiv\n6ô®#\Î@•ˆ ‹u­òz~ÿ\0+þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þáŸ´?\ÆO…??\àžÿ\0µŸ\Äoƒ¼\'ñ?Àz‡\ì\ÕûH\é\Ö>.ðVµg¯\èW\ÚG\Ã/Xê–jVKm$ö‘Imu\Z¹1LŒ‚+ü<\ëýSÿ\0\à\ÙOŠðo­¿\Ãh\ão‰\Z‡\í{\àA$²5o\ëþ*ððyj/ö€,\Äª3‚+ü¸~!ø7Tøu\ã\ïx\\µ¹²\Ö<\â\ßxOT´¼‰àº·¿ðö¯w¤\ÝE<R*¼r,ÖŽYA\ÏlRŽ—[\ë¿\É\ÇQE@}›ÿ\0øý²|aû\0~ØŸk?\éË®\ßü%ñtZž­\á‰n¤³·ñ_…u[\Å>žt?º:ž‰x–sH¯¶¢–Wo‹}§ý`¿e\ïø8;þ	?ûQø/\Ã\Þ%Ñ¿k‡\ß¼O«\Ù$ºŸ\Ã/Œz’ø\Æ\Þ¾H\Ó\í¶7–ú¸M¾†\Úå¤†OK\Ô.¬¯cE¸…\ÄSFø\ØQJ\×ù_\×ü0\îÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\n?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE}\ßõoòx\îÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\n?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE}\ßõoòx\×üÿ\0ûD|	ý£¿l¿\Ù\Ä\ß~-ø\â÷‡ô/Ù¢\ãCÖµ‡þ$\ÓüK§\éZÁøŸ\ãõ\Ó/®´Ù¦†Ö²¹·º3\ïò&ŽL\0Â¿‘\Ê(¦€(¢Š\0ÿ\0a\ßø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¯\ÂOø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¤·~¿¢\0¢Š)€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEü0ÁðòA`Oû+¿?õ\rðE5¹o\í‰ÿ\0ûýo½À\Ú\íoð_@øÉ¤|7\Õ5gÁvz\í\î·bš£\âK+b\â\Ýô]OM–C{m§YG*Nò\Æ>\Í*«OÁÿ\0ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUJvIY\ÝY~_\æ€ÿ\0*+ý\âø#ý\ß\Ã\Ïüx÷ÿ\0šª?\âø#ý\ß\Ã\Ïüx÷ÿ\0šª|Þ¿Õ¿\Íùuÿ\0aÿ\0\Ê6~0ÿ\0\Ù\Íx—ÿ\0QWõýüð\é_+þ\É_±7\ìÁûxYø_û*|\'\Ñ>ø_ñÇ‹u}CºÕ¯-\ï¼Csgka6¥,º\Åþ£tf{;+[}«0ŒG\nA\Î~¨\çn?\Ù\Ç\éBw»óý\Ä\Çü\ßÿ\0&ûÿ\0\ÙÀø\Óÿ\0P¯óp¯÷8ý°?`Ÿ\Ù/ö÷ðÇ„|ûZü\Ð~1øsÀz\í\ç‰<\'¦\ë×šÍœz6·¨X2òþ\ÚMQ\Óf2\\X³:\Ë$‘\ì\è€ó_\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T“\Ñ&ŸEÿ\0¤ÿ\0˜\ã…E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUO›\×ú·ù ?%ÿ\0\à\Ê\ÏùG\Ç\íÿ\0gG}ÿ\0ª\ïÁõý‘ƒ\è?•|Ÿû\"þÃŸ²\Ï\ì!\àü8ý”>\è¼\â¯·Œ<A¢hWZ½\ä\ZŸˆ\ßO³ÒŽ§<ºÆ¡¨\Üù\ß\Ùöv¡ReŒE\0™\É?Xƒ\è)GW\'m\íù\0´\Ç\Ðÿ\01KI\Ü}ô¢WkþÞ‹û¤›üf¿\à\à¿ùLŸ\íóÿ\0e²\ïÿ\0L\Z%~6\×ûI|pÿ\0‚\ZÁ+ÿ\0hÿ\0‹8ø\ãñ£öFð?Ž>)|H\Ö_\Ä>5ñmþ¯\ãk\Ý{Y’m¤¿º‡Oñ\r¥š\Ìð[\Ãy6ñ)¯Ëœ“\å_ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8U$?\ëbÿ\0®‰ÿ\0¡\nÿ\0cŸø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªø‡þÁ\Çü`\ß\Ã\Î?òñ\á\ès\È>*Á õù½«šõ«\à—ü‘¯„öL<ÿ\0¨ž“^£Yš>‘§øI\Ò4-\Õ,´M²\Ò4»8\Ë\í4\í:\Ö+;hË–b[AJY™ˆQ’NMiÒŽ\ßwþ’€+\ä¿\Û\çþL_ö\Îÿ\0³Sý¡õRø¶¾´®_\Çð\ÏÄø»\á\çt˜5\ïø\ï\Ã\Z÷ƒ|Y¡\ÝV\×Yð×‰´»­\\Ò®\ZŠeƒP\Ó/n­&1I‚9˜£«aƒ–\ß5ù ?À¾Šÿ\0c\Ñÿ\0\ãÿ\0Á\0þo\á\é\Ç:ÿ\0r~¿ñUu£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\n¿ªø3\ËþSýš\ï\Æ\ßý8x¿¹\ßø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æª¾‘ý•¿\à?ðNØŸ\âª|lý˜fo	|(øžž\Ö|$¾+ÑµO^^\ë\ïe&­§u}sP´ò\ïN´\Þÿ\0góTE„u\ÙM\Ýu\Ý~q¨¥Uþ<ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\èþÃ•þ<ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\è£¿\Ëô€„tQEXWúñüÿ\0ƒz?\àŽþ.øðS\Å^ ý‰þ\ê:÷‰¾|7ñ·¨K®ø\åe¿\ÕõŸhÚŽ¥{2\Å\âx\â\Ý\Þ\Ü\Í<‚8\ãŒ<„\"\"\áBn\ß×š_¨\ä9E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@ŽþÇ¿ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8TWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05U\Ý\è?ð@ø#†þ\È\Úüû\àD\ÓZAöx\î5m3^\Ö\æ2yo-Á\Õõ\ÛÔšw‹M\"R\ÄFQp Nýÿ\0«˜\ã7£hš×ˆõ+m\Ã\ÚF©®\ê÷¯\åY\éZ6ŸwªjWr\Ï;k(§ºÿ\0ØŠ\'ojþ–¿\à‘ÿ\0ðl\ï\í‘ûtøûÁ?¿h¿ø£öký’­\ïô\Ío\Ä\Þ$ñÕ…Ç‡~!|E\Ðc¸ó¥ð÷Ã\ß\Ç±šº[\\i÷^(\Õ\í¬tý	\\\ÜE¡w\äZ¿úzü&ýd¿	f>~\Í>O§\É\æ\Ù_øOáŸ„t­^\Ú@ˆŠñkP\éCVR4þšvX`³ô¦	\ï\íþ=Gœû\Ñw¥—\ß\ÓnŸð\Û\Çü>ð„~xÁÿ\0\r<¡\ÙxkÁðÞ\á/\nh\Zt)Ž‘ x~\Â\r7J\Ó\í¢@ª#·´·‰7cs²³¹.\ìO`}}?\É\ç¾)h¡+-u{¿_\ë`?\ßø9þ\r\åñ·\í\å\â!ûl~\Æ:U\ß\í¦xr\ÛFø±ð¢\î\ê\ßHôo\Ú,\Z»\á}Få¢°·ñþ‘¦\Ãý“&Ÿ%½¿‰la\Ó\áK¨u+Uû_ù\Ãüdøñ¿öxñf¥\à_ŽŸ	¾ |&ñn‘s¦_h~=ð®¯á»´¾´fKˆ`mJ\Ö/Dl­û\ë)® p7$¬¼\×û\Ì\ã¸\ãùv\Ï¸¶kÌ¾%üø?ñŸK:\'\Å\ï…_þ\'\é>D\Ö\ëc\ã\ïø{\Å\ÖðE8e•m“]Ó¯¾\Ê\Ìˆ’\ÛÊ‘—WW\ÃQ¶?­?\àöüCüh¯ö˜ñ?ü¿þ	\ã-B]S\ÄðOÿ\0\Ù\æ\æúyæ¹š{O]h\Þd\×,Vh´]KO„†a‘dg>Z&N|®\çþ\r\Îÿ\0‚0\\\ÜMpao†°\äiL6\Ú×Žá·ˆ±\ÉHa_Š1ü(¼(\àq\Å.o&¿¥\éÕþ7tWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05Tù½«šüp¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\nŠÿ\0eþ\r\äÿ\0‚2h\Âq\ìð†ü\ÎP“¬\\ø\ËT1bu\â‡Xƒg/°\ÄœWÓŸ	¿\à”¿ðM¯·‰¨|,ýˆÿ\0g/_Å°\Åv¿ü?¬\\F\Ñ\Ã\äG$Rø‚\ÛUd•c\àJ¥e<\Í\Þf—7“\×þùþ\0’ÿ\0\ìÿ\0cý¿ÿ\0\à¢þ2\Ñôo‚üQ¡ü?¹\Ôl\íüGñ³\â&“©xC\áo…t\ÙÇŸ6¥6¹ªZÀúô\Ée\Äö:W‡aÔ¯µ9\áp*Hû—ýj\àš?ðOß…_ðL\ï\Ù\á\Ï\ì±ð®yu¨ü5\rÆµ\ã\Þ\Ú\Åkªü@ø…­ùw(ñf¡E¾\Ï\å\Ú-¶“§¦]+Gµ±\Ó\ã’E·go»tý:\ÃI±µ\Ó4«=/M±…-\ì´ý:\Ö;+;x\Æ[Khã··…	Qª(ûª*\ïOñõ§«\ß\É\Û\î\ß\Ñþ€y\íÿ\0$\ã‡ý’/‰?ú…\ë5þ¾ ÿ\0ö·ÿ\0a}Kÿ\0K&¯÷\Ë\×tM/\Ä\Ú&µ\á½r\Î=CEñ—¨hš½„¥\ÄWº^«e-†¡i!FW\Ü\ÚO4.Q•‚¹\ÚÀ\à\Å\Ù?\àÜ¿ø#²I+þÃŸ\Ë\Ë#\È\äk¾;Q¹Ø³aW\Å!Tdœ*€ p\0‹Ù¿7ÿ\0È¯\Ìñ¿¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Í\×þ\r\Ëÿ\0”\Õ~Á?öRüWÿ\0ª£\Çõþ\Èc\ï7\áü«ò\à7üûþ	oû2|]ðO\Çß²_‚¼ñ_\áÎ£s«x3\Åún¯\âû›\íQ»\Óot{‹«h5\ÞY<’iÚ\í©ó\í¥\'r 8V«£«{\â„\î\ÓòüùXES\0¢Š(\0¤>¼ñ\éþy¥¢÷øšÿ\0ƒŽ¿\à\Üþ\×þ>Ö¿n\Ï\Ø[I°\Ö>6\êšT#\ãÀÖ¸´Ò®~\'\\h¶^EŽ<}töö\r\ãYt\ëh4\Ío\Ãú„ö\ë\â‚\Æú\Â\íuw\Ïù\á|[øñ£\à\'‰õ|køU\ãÿ\0…~(\Ò\ï\î´\Ë\ÝÇž\Ö|3v—\ÖR4w0\Â5K;h\î\Äl‰m$ž	y‘\Èñ\Çý\èq\ßüH\í\Û\×üó^oñ\à\ß\Â?‹ö	¥üXø[ðó\âfŸR\ÃŸ|\á\ß[\Û\Ç2ºÈ¶\Ñ\ëúuø¶\Þ$š-Ô±`ÁŽ\êJ\ë\ÏÏ¯õ\ç\à¡Eµ‹¿\à‡_ðHÿ\0\ßI©xŸöýž//¤¸š\æK‹O	M¢3\Í0A+\Ð\ïô\Ø\Ê8Eý\Ö\Ï(¨šñù\àÜ¿ø#³K/ü0\ÇÃˆ¼\Ùd—Ê‹]ñ\êC˜Å¼¸“þ³²$\Î\Ø\×\'j€2qš/¶_øõüo¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¯÷›ýŸ¿\ä‚üÿ\0²Eð\Ûÿ\0P\Ý¿(üÿ\0` øaÏ‡£ ŒÇ Œ÷þ®¾•ûO¡hš_†´MÃš¤z~‹\áý+O\Ñ4‹‹˜¬´½*\Ò\r>\Ò\"\ì\Îc¶´‚P»3A¹‰É¥{¸Û¥ÿ\0¿\Ì{\âG\Ã\Ï|[ø}\ã…¿4koø\â/…uÿ\0x·C»]\Öú§‡¼M¦]i\Z½”‡“ž\Ê\îdŽd\Û,”šYQ”—ü\Ëþ\r±ý±ÿ\0`oˆ0ñ\ßÀŸx¯öý’®õ+ýSÂž5ð.—q\â/øEšt–\ß\Ãÿ\0ü%¥Gq«[\Ü\éks„%Ó­.´m`k¦6[Hÿ\0ÖŽóþ\Ïjv³Ó®ÿ\0\ç\ßm-\é°\à-©\ézž‰u¥k:uþ‘ªX\Ê`¾\Óu;;‹û9\Ô\Ð\ÝY\ÝGÅ¼ª&9£G\0‚G5B¿\Ý#\ã\ì%û~\Ð+t~4þ\Ë?~#\\_;½\æ¡\âO†~º\Ön\ÚN®5¸ô\Øuy‹d“\æ^¶	f$“ñ&½ÿ\0þÁ<D/\r\ï\ìðB\Ök\é¼ù®4{oè“¤¥÷³Aý—\âX\às¾8£X˜1%	 ÐŸ“_\Òÿ\0?ó°\ã%E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@ŽþÇ¿ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8TWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05Tszÿ\0Vÿ\04ø\áQ_\ì{ÿ\0\ãÿ\0Á?\è\Æþ\àûÇ¿ü\ÕQÿ\0\ãÿ\0Á?\è\Æþ\àûÇ¿ü\ÕQ\Í\ëý[ü\Ð\ã…E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@|¿ÿ\0”ÿ\0\Ê¾\rÿ\0\Ù]ý ?õejµø\Éÿ\0ÿ\0Áµÿ\0\Z~*|jñ\ç\í\ßû\0xM~!\Íñ\"\âo|rø¤\Ë¿‹\ãñœÌƒUñ\×\ÃkI\äŽA\âGe¿\×|/‘jVš¼\Ô4¸®\í®^\Ú\Ûûrý˜?eo€±Ÿ\ÂM+\àW\ì\Õð\ïKø]ð«EÕµ\ÝsLðŽs©]\ÙZ\êž$\Ô$\Õ5«µŸU¼¿½g½¾•\æp÷,©±ª _A\ã¦8ö\Ç\×\éþ·J•«r[\é¿k\'÷ý\àÿ\0¾\Z|EøU¯\\ø[\âo€üað÷Ä–’\ÏÆ‡\ãOjþ\Õc’\Ö_&qö-b\Ò\ÎwX¥ù\ZDF%HbI\â+ý\æ>(~Ï¿>6\ÛKgñ‹\à\Ç\Â\ïŠKhöL|{\à?xªdµ•J<÷ZÖ™yuj»¶š&\\\åH¯ÏŸÿ\0Á	¿\à^.½“P\×\àŸß³\Ô÷’™L“\ÙxnûF.fb\îYt]WOŒ\Ì\Å\Ü\ÄIò¶fª\ï³þ­ý|ž€‹mþ\Ç\Íÿ\0\äÁ™¿á†¾\Ì[¯xô(\É\'\n?\á*8Qœž\0“þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\nŠÿ\0c\ßø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªŽo_\ê\ß\æ€ÿ\0*+ý\âø#ý\ß\Ã\Ïüx÷ÿ\0šª?\âø#ý\ß\Ã\Ïüx÷ÿ\0šª9½«šüp¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù 9ÿ\0ø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¯ýžÿ\0gƒŸ²·\Â_\n|ø\à;\á\×Â¯\Ãwo\á\éS^\ÜX\éQ_^Ï¨Ý¬Sj77—’\ïng¸vš\âF/#\ãŠöš{o¯\à€(¢Š`QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\Ì?¶\Ç\ÍSöiøâ‹z7‡\ì|M©hwz-¥¶“©\\\Ïie1\Õu;{\'’ym‡Ÿˆc•\ÝR2¥Ÿn[\0ƒø\Åÿ\0ºø£ÿ\0DKÀŸø=\×ÿ\0Æ¿eðûÀ/üQ\Ékñd˜\\\Ç*\Ãf5²ªµ\ë\ç9V_5\Ã\Ð\Âbj\ÓT1¸ºœcKFJ¢‡$›iI¸\Ê\ßÎ¾*})üðg‰ip—gYž;­•\ásˆaðYg™RúŽ2¾+Br\Äa(NŠœª`\ëÞŸ3”c)$¤\è\îŠþq?\á÷_\è‰xÿ\0ºÿ\0øÔ°ÿ\0Ánþ%‰¢7<ðS2C\âr)š<\ëŽ“$nW!]¢‘T\à”`0~\éýü}I¿õS/vW²\â~»\ÛE|\Å+\ê÷ii«]?6\í\0ú3¶“\âŒö)´œ¥\Â9õ£v•Ý°\Ù^\îÉ»\'dÚ±ýQ_žÿ\0‚\àØ¾£~*ýŸ¯-ô©%…f¼Ð¼w\Õõ¤%È¸•,/|9o\rü‚2Vÿ\0o\Ó\Ã:•k…¹?iþü[ðW\Ç/‡~\ZøŸðûP“Qð¿Š,\ÍÕ“\ÜÂ¶\×Ö“E,–÷ºn¥j²\Ì-u>\ê)mo-\ÄÒ¢K1M4M¯ù‡x1\âg†|&7¸[“\à1õþ«…\Ç\Ç–fX*˜¯e:\Ë\r,NU\ÆÓ¡ˆ•*ugNŽ%ÑXR«*Jq§6¿ið»\é\àÿ\0Œ¸\ÜnY\á\ç\áó¬\×.Â¼v3*­—\æ\ÙNaO«Bƒ\Å\Ó\Ã\æ\Ø±XxU«Fj\à\Þ\"8yW¡C¥*\Ô\ã/L¢Š+òóö ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šü¬ý½\à \Þ0ý¾\"x+Á^ø}\á\Ï\Ûx§Ásx¦\â÷Y\Ôu+9\ígMvÿ\0H[Xc²!\Z/.\ÈL\Îùbò0Ÿ¯\àn\â_¸‹\rÂ¼\'‚¥Î±t1xš8zØ¼.œ¨\à¨\Ëˆ“\Äc*Ñ¡\nQrQ”Ó›÷b›gÀx—\âg	øI\Âx¾5\ãl^\'`±X,|Fˆ\Ì+F¾aˆŽ\r†\Â\Âu¥UšR’ ½\éh~©\Ñ_ß±—ü\ß\Ç´÷\Ç]\á&½ð\Ë\Â\ÞÓµ=Äš»j\ÚN«ª\Ý^E6‰d—qD°\Ý\æŽrJHNFO\Ù\Z\é\ãÿ\0¸³\ÃòŸq––]›U\Ëðù¤(Q\Ç`ó<*®\"…\Zž\ßZ½\'W^.›šœyqJQ¿…^-ðWŒü5[‹x‹\Ì2Z®+%«_—\â²Ú«ƒ\Ã\àñU\é¬>.\ê¸FŽ;\ÕEI9J)\ÞH¯ñ\ãÿ\0ƒ•ÿ\0\å3¿¶7ýŒ^ÿ\0\Ô\'@¯ö¯ò\Øÿ\0‚ûÿ\0Á.?\à¢_´üsö©ø­ðcö8ø\ïñ#á¿‰õÿ\0\Í\á¿\ZxSÁwZ®®Am\á\r\Öyô\ë\ÛyfŠ+¨¦¶}Áf†@ShVo…¿½÷þP?K?’\ê+õþ¥ÿ\0dÿ\0£\0ý¦?ð\Ý\ê?\ãGü9Kþ\n\Éÿ\0FûL\á»\ÔÆªÿ\0\×õ\ê¾ð?/ký\á?e\ïù6\Ù\ßþ\È_\ÂOý@<?_\ãz\àŠðV0	?°\í1\Éÿ\0‹w¨öüký\\þ-~\Õ:÷\ì9û%þ\ËwzŸ\Ãi|I¯\ßø\áÏ‚5ŸjzÁðõÏ‡µ-\áÆŽÚ•½\Þ\Í?Rg¼·¼·–\Îh0‚)b“\ç~{¼/\Ã9\ßñU\Âü7ƒY†wœÖ©†\ËðX\ÃaUz´\èU\ÅN/Œ­‡\ÃRJ…\n³\æ«Z	òò¦\ä\ãòœq\Æ\Ü7\á\Ï\n\æüi\Åøùeœ9‘R\Ã\Ö\Ìñ\Ð\ÂbñÒ¡^7\r—\á\Üp¸\ZŒUWS‹\ÃÒµ*3\å\ç\çŸ-8\ÊKõŠü(øaÿ\0“\Õ~!|Hð€\æøg¦\Å\ã?ø\Ãj1ø\êK‰,W\\\Ô\í´\ãx7‡#Y¿\Ú<\ß(ÈžfÍ›\Ó;‡îª’@Ï¿ó¯¤ñ\Â\Þ9ð·–\àx\ç%Y6\'6\ÃW\Å\à!\Ç+\ÌUzz£ZNyf3\ZN*F<µ\\%+\Þ)«µò>x\ßá·X\\\ç\á\Î{W<¡b0xl\ÖUr¬\Û+xj\Øúu\ê\áb£š`°n²«5wz>\ÑC’\Õ9y¡\Ì\ê(¢¿>?Y\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¯‘¿m\ÚCYý•þ\ÜüU\Ð|7¦ø«P‡\Åðú\éZ­\ÕÍŸ•¬½\à–å¥´ýñ’µ4)g\Ë³Ã¹i\ÅY\îQ\Ãy%\âs|ó‡\Ër\ì<\ëR\ÃB¶/QS£	×¯:tiFRzÎ¤\ã\î\ÚG\Îq\ä\Ü\r\Ã\ïqz¸l‡2\ÜNkšW£‡«Š«K…‡=i\Ó\ÃÑŒªÖš\ÃNœ\\¤ôHú\æŠþvt/ø-W\Ä\Ý[]\Ñ4©~\nø(µMcK\Óe’=w]2Gýý½¤’G¼•ó&,›]Ànd\è†	<\èb—|\Ø\ÖM¹\Î\Ý\à63œgÀÏ¥}§ˆþq\ï„õ2Š|q•P\Ë\'žCS-öž_˜ª\Ñ\Ë\Þbùž_\Ù:o‡IU\å\ç\æ|—å•¿9ðƒ\Çÿ\0\r<sŽ}/óL~b¸nYtsUŽ\Ê1ù[¥ý¨±\ìþ»Jš­\ÏõG?³m\Óq2\\È–Š(¯Ì\ÚBŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š+ñ“ö—ÿ\0‚¯\ê_³ÿ\0\Æ\ß|\"¶ø/k\âX¼wchº\ä\Þ2}9\ï\ÍÖ›k|\Ò}‰4¡\0V¸1ªyò&Ks_sÀ>ñ—‰Ù¶\'$\àœ¥gž<\Ï‡–?.\Ë\Õ<<F:\Þ\×2\Å\á(ÍªØºöpœª>w.^X\ÊKó¼aðÿ\0ÁœŸ/Ï¼CÎªd™fi™,£^–Y™\ær­–ŒT,³	‹«M}_Z~Ò¤!NñQ\æ\æ”Sý›¢¿9¿ao\Û\Âóö\Ç\Ôþ!\é·!ð!ð5Ÿ‡\ïRh<F\Ú\à\ÔFµ>£DÑ¾•§›s±<¡ÃUp	ý¯3Œ8?ˆ¸ˆq\Ü-\ÅYz\Ë3Ü¶8Yc0KƒÆªQ\Æ\à\èc°\Íb0ñ8jž\Ó\r‰£SÜ­\'.I¨\Í8¯g\Ã\ß¸O\Å.Àq¯\æSÍ¸s3«Ž£ƒ\Æ\ÔÁcrùÔ©—ck\åø¸¼.a‡\Ãb¡\ì±Xj\ÔÓ\Æj*tÜ¡(É”QE|\Éö¡EPEPEPEùoû{þ\ß\Þ.ýüm\à?\nøsÀñ|>.ð½ÿ\0ˆ.nõ­KQ³’\Ò[]^]5- Ž\Ë\nÑ”ˆ\È\î\ä±f\0\0\'\ëx#‚8“\ÄN#\Âp§\n`\écó¬m,]|>\Z¶/\r§*X,<ñX‰<F.­\Zp£NRQ”Ó“\\±»gÀø—\â_	øK\ÂX\Î6\ã\\^\'`q8&#„Ábs\nñ­˜\â©\á0±Ž	Ö’•j‘R’,#yI\Ù©W\ã\ì{ÿ\0@ñ\Ï\í+ñ\ßÃŸõß†ðÞ®i^!¾}_IÕµ[›\Ëytm2KøUa¼\Ý\Ç+G\å\ÈeX`\çör»<@ð\ç‹|/\Î\èð\ï\åôr\ìÖ¾]C5¥B†;˜BX,MlN•Oo‚­^”d\ê\á+\ÅÓ”•H¨©8¨\Î-ùþx¿Àþ4ð\î+Šx‹\Ì2|m_%\ÄU\ÆeØ¼²¬1øl.Vš¡Œ§N¤ ¨c°òUbœ”£~h4QE|1úpQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEù\Éÿ\0Xÿ\0“.ø…ÿ\0aÿ\0\éþÒ¿’.\ãý\å™¿­\ßø*\Çü™w\Ä/ûøGÿ\0Oö•ü‘ˆüû~9\é_\ëw\ÐSþMsÿ\0e\æmÿ\0ª^?\Â?\ÚAÿ\0)€ÿ\0³wÃŸú´\âú\ÖðŸü+ö+Ô¼-\á\ÍB÷\áw} \è÷—S7Œüt†[‹­:\Úy\å\Û‰#w\Ë#6\Ø\ÑPg\n \0ý_þ	oû\\iZ”ü/—G’k¨\ã\Õ\í¼k\ã_´inð8MFw\â)\í\Z[&\"\å\î	­Y£q—Fþ~l~1ÁDa±²‡Oñg\íLš|V¶ñ\Ø-´?²Ù¬(-E±Kr†\Ü@#òJ†=¥\Ò\rAª|Rÿ\0‚‡kZ}Þ•ªx£ö¬»\Óuk‹+û&O‰o{gw[\ÝZ]F*\Ïmq\Ð\È7e#\×\çñ|wú\ëªþ”J/­:¶qeYR§\íy\ÔV¦>4f\á=”Ú§+r\Ë\Ým?Ñ©ý\"þŒñË¡‡—Ð·/­‰Ž\n4]wÀ\ÜO\Ú\×T#jñ²o¬\Óö•“¯Mûxs{H^¢Wø\çY³‡N\Öu:\ÞVž\ßO\Õõ;y˜©i­\ìï§¶†V(KIJ\ìUB’\Ç\0+ú«ÿ\0‚DH\ïûøuY‰x÷\âq\î¡\ÖüÂ£þ#·ü\n¿šötý |K¡üø­¨\Þ\Í$I²?x™#®$G%\Õ\Ôúlv¶p´†¹»š\æi%UV#ú\Èý‚>ø£öxý™|ðóÆ©,koÄ¾ °·’)\ÓJ\Ô<I©M¨d½Õ¼\Ó[\ÝM§[´\Ó\Ïo#@ó$‚&tP\íõŸM\Þ(\áÊ¾\ä\Ü?G=\Êñ\Ù\Þ#‹²Œ],†\Äce…Àå™¼qX\éÐ¡Rs¥B3\ÄP¦\ê\ÍF¦\"8¶\åeóÿ\0³£„øžŸ\Ù\ïT\á\Ì\ß\Ãø^\Îð•³F‡Ë©bs\ß%–/Ž/J:ØŠ‘\Ãb\'NŒe*ŽžµYE*rk\á\Ûsþ\nañ£ögý üCð“Á~øa­\è\ZFƒ\á]V\ßQñE§‹&\Ö$Ÿ]\ÒRþ\ê9ŸIñF•e\åE+€GfŽ#Ç˜ò7\Í^\'\à?ø-\'\Ä\Ò|y}ñ#\á\ï\ÃÅ¿°ðü?ð€\é>·ñUœšÇŠ®®ü¤]j\ïVñ­\r¾ƒaj²]_há¾•Œö\Î¯$?*ÁZ\äõümÿ\0boÃ¿ýG\"­\ßø%Áo†~<ø®\ß\â…4¿\éžð#kšV‡®\ÛE¢Iª\\\ëZw\Ú5.\á^\×QX-¦”Á\ÜrÛ¬¬%h™•q†Y\á7™O\Ñ\Ï ñŠ¼?¡˜W\Ãð\rqsŠ\Ë*\â(\ç–*­¶­xS­<m*4§˜\â**š‹\Ù8a\ë×•\'\nŠ\ro\Ä>7ý#ó¿¥WxQÁ^(b²œ>3\Ä\Þ%\ál‡šR\Â\Ö\Érœq\Øü5	T£jõ!–\á`\ëa`\Õg*ô(ª‘©h\Ë\ÑOü¿ö‘\É\Ç\Ã?ø\É\Ætÿ\0\ç³c8\ê{žkôþ	\åû|üTý®¼}\ãÿ\0\nxÿ\0\Â¼=c\á?\Øx‚\Â\ãÁ\Ö\Þ$‚\î\â\î\ëXM=\á»:ßˆu˜Z\Ùab\ê!ŠD˜&B¿-}µÿ\0}û)ÿ\0Ñ¸|ÿ\0\Ãc\à\ßþS\×y\à/‚>\ß_j\r>|?ð£ªZ¥Ž¥}\á\è^»¾²ŠQ<v—w\ZU¬\×\é8,2»F$\Â\î\0\×ò·ø¡ôz\Ï8K;\ÊxCÁ\Zü3Ä˜\Ü5*yV}<m\Z‘Ë«\Ç†«R³„1\Õe.|=*\Ôt§-j\Þ\Ú]løm\à\×Ò§‡8ã‡³®9úB\áx·„òü]J¹\×Cˆ§<\×\r,-zP ªO/¥¸\â*Q­wR7öM_U/ý­¿jo	~\É_\â\'‰4«¿__j¶º†|-ayŸu®kI,\æ7¾ž+‘cagio5\Å\í\ê\ÙÞ¼_¸‰m™®—ñQÿ\0‚\Øþ\Ð^NúGÂŸƒÖš{J\æ\Ú\ßSÆ·÷±BX˜’{»O\é°O\"¡I#²·GpYbHQô\Çüù˜|8ø ­\ãŸ›nƒ§\í\È\ï·\'™>¦¿>\0xCEøñ\Ã\á/‚<I³ø\Å_</¡\ëVðLöò\Üi—ú¥¼7–\é<dI	žñc+\"+–•Â°þ‡ú4ø%\á6o\à\Êñ¸^—fU\êñ&3S_8ar\ì‹‹\ÃCÁR\Åá°¼ò§©^UjG\ÛU­]Ó•hÒ…8\Ãù3\éôñÃ‡þ8¿øŒñ)“å”¸[—\áò\ê8*_\\\Ì8‹+Ë±õq¹ž2¶‹«\æQ\ÃB”fð\Ô0\ØhT¥‡XŠ˜‰\Öý,ÿ\0‡\×þ\Ò_ôLþ\à¿\Ç\ßü\ÝQÿ\0¯ý¤¿\è™üÿ\0Á¿ùº¯\Ýk\Ø\ÏöN°²µ²‡ötø7,V–ñ[\Ç%\ï\Ã\ßj7’$H^\æúÿ\0M¸½»€Ì—S\Í<®K\É#1&¼\Ë\ã·\ìcû,^üø›ö_€ÿ\04\Û/ø£UÓµŸx;BðÞ·§j:N‰}¨\Ø]Y\êº5\ì&+«hŒ‘	¼›ˆ÷C<rD\ì§ó,¿Å¿¢Ž;1À\àŸ\Ñ\ïBŽ3†\ÂýfX¬<\åJŠô\èª\Ò\Ã\Ç6\\\Î\nJr¥\Zº\Ù\ÅOf~Íšøô\Û\Êò\\\Ç5I\ì¿_/\Ë1xù`£…\ÅÓ…j˜L,ñ\ÃC,‘ò©\Êœk\Ëm§*I{§\åGƒ?\à¶\ß­õ{fø‰ðsÀZ®‚\\-\ì~\n¿ñƒ«$d\í2\ÛM®\ê~%´–H”ùŸg’\Þ%¸+\åý¢\r\Þj@Ÿþ!øo\âÏ€<#ñ+\Â\Íq\áŸ\ZhV\Zþ-\Ì^EÈ´¾„I\ä\ÝC¹\Ä7V²ù–\×Qq\Ä2*»¨ƒ\å\ÎÑžN:ú\ãŒþ5ý‹ÿ\0Á7Ù›ö+ø¹™±\á½AF\âN|C¬Q\èpa\Å}?\ÓÁ?|?\á>\âž\È)ðö7\Äk%\ÇPÁbq“Ác0µò\Ì~6%…\Åb+Ó£ˆ\Ã\ÕÀ%\n˜uG\ÚS­R5\ÕW\Z.Ÿ\Æý~‘+ø™Ç¼WÁ~ qF#Š²\Ú<)[ˆòúùŽv„Í²¬Jt±x\\6µ\\&&†c\'<>\"UcJ­\ns\Ãûz\ê¯\Í?¶¿ü\Ù\Ç\â£ð‡\áÇ€\ì|e\ã]\×M¸ñ¹\â-F{\è÷\ZŒ	zšTZv˜\Ð\ê:­à²š¸ŸûSLŽ\Êwh7EK‚ü»ö’\Ïü“/\àgŒ\éþ>\é\Û?ñ\\œuõ¯Œo†fý±¿hÄœxúùFI8ol\0\ì\0\0€p+\îø$G\ìÿ\0ð‹\ã¥ñ‹\\ø¥\à}\Ço\áeð•ž‡§øš\ÆSJ²:‘\Õ\î/.³\îU\íg¸—\ìpEº\â)UcR¡~v\Ï\é´|%ð\Ã/ò8«\Ã\èñez|1\Âù¾mZ¦#[2\Ìs ŽWIª¯˜aðXJ\Å\æ1\å¥IR¥K\rùjÖ»©ø´¼wúLøÁôŽÍ¼2\à\ß\êpm<ÃŒ8«\"\Èð°¡„\Ã\ä¹FWÃ•3ŒD=·\Õò\ÌN7]\àrÉ©\â*ªØŒN*pŒ\êS£gK3þ_ûI\Ñ3øÿ\0‚ÿ\0óu_\nþ\Õµ?kxsÆž?\Ð|%\áýG\ÃX\Úø>\rblŸSº\ÕL\×+­jú\Å\Ã\\ù÷r(1\Ï^^\ß\ÝoËŸ\ë/þûöSÿ\0£pø#ÿ\0†\ÇÁ¿ü§¯\ç\ßþ\n\íð¿\á\ÇÂ¿?4†¾ðŸ€´½O\á„úž£§xGA\Ó|?e{¨jö‹ysk¥\Û\ÛA-È¶‚(\Íq*gj€<¯£\çˆþq\'‰™nUÀ~\Ö\à\Þ#«–\çp\Ù\ìñtkFŽ†s\Å\Ðp†2´¿\ÚhFT“TÝœµij¾£\éG\á\'\Ò[„¼!Í³¿üv\Ãq\ç	\Ð\Ír:X¾¥ƒ\ÄPž#ˆ\ÇÓ¥‚¯\Ï<\r\Û^QªÓ¨¯Ë¢z\'\Åÿ\0Á$ÿ\0\äô|\'ÿ\0bO¿ôÎ•ý!~\Ö¼Aðözøñw\Â\Úv«kþ	\Ñlµ-7N\×ã¾“Gºš\ç]\Òt·K\äÓ¯4û\æ`¿–D÷¶\í\æ¤{œ¦\åo\æ÷þ	\'ÿ\0\'£\á?û|}ÿ\0¦t¯\Þ\Ïø)ü™\'\íÿ\0b®•ÿ\0©†\ëóÏ¥_‚\Íþ”þ\ZeY–¼»3£\á\Þ_\ÂU\æöX¬7Œs6+S•\Æ\\•¨U©N|²Œ¹d\ì\Ó\Ôý_\ècšf\'Ð¿\Å\ì\ë)\ÅTÀ\æ™F/\Å,\Ó-\Æ\Ñ\åö\Ø<\ÃÀyN/Š¥\Ï\Ã\Úañ©Õ‡<eh.hµtÿ\0_þ_ûIª;Â²øò«7üƒ¼\Øÿ\0C\ÕI~\Ön|G\àÿ\0\nx†ò(!¼×¼5¡k7P\Û	´7:¦—i{<V\âg–Qr\Î\ë’G“\Ë½Ý²\Çø(›ýT¿õ\Íÿ\0ô_\Þ\Â\Ïù&??\ìCð‡þ£úusý3¼.ðÿ\0\ÃÌ·\Ã\ê\Ü\Â\Ùw\Õ\Í1üEK0ž\ëØªx<6Q,4jûzõ•¨Ê½iG•GZ’½ô·O\ìüñ“\Ä\ï3¨xƒ\Æ9§\ÑÉ²\Þ­–S\Ì~­Ëƒ«\ÅgP\ÅN—\Õðô]\ëG\rF2\ærV¦¬–§vz¡¯\ç§\ã¿ü\Ç\ãÿ\0\Âßþ\è>\ßhþñÏˆ|1¦^\ê¶>6“Sº²\Ò/äµ·žý\ìücgj\×RF¦6ö¶ð\ï\'dH¸ý‡\è•ÿ\0¶ü_\íÿ\0ewÆ¿úwž¾C\èm\á÷xÅ¼c\ã>ÀñÃ˜<^†;\Ûòañ2\Í)Q•Z~Æµ\Í*MÁó6¬ö¾§\Ü}?¼Rñ\Â\Þ\à\Ã\Ãþ(\Ìx_šq&gƒ\Ì+\åÿ\0W\ç\Åa¨å­J•O¬P¬¹aVó\\ª.\ïV\Ï\éƒþ	\ãû[xûö»ð\Äü@ð÷„<=\á?\Ûxr\Â\ßÁ\ÐkpZ\\YÍ¡X\ê5\Ú\ëzÎ³3\\‰\îž50\Í^R¨1\Ï\Ê\ßð[_ù#ÿ\0ÿ\0\ì£j_úŽ\ÉNÿ\0‚#\Éø\Ñÿ\0eR\Ãÿ\0P\í›ÿ\0µÿ\0’?ð{þ\Ê6¥ÿ\0¨\ì•\éð÷\ä\Ü-ô\ÝË²\Ë\èeY6WÅ“£€\Ëð\Þ\Ó\ØaiOƒjÖœ)ûIÔ¥V­I¾i\ËÞ›µ•‘óük\Äùÿ\0þ\ÎlwñFgˆ\Îsüß…òŒFe™â½Ÿ\Ö1u¡\â^]‡…J¾\Ê\éóF\ZT\×,\"¹`ºÝ¿\ç‹Àþ-\Ô<\ã?\nx\ãI‚\Ò\çTð‡ˆti\Ö÷\ë3YO{£_Cm\Ú\Û\Ë\ínòÀ«0†xe(N\É°\Ãú4ýƒ?\à£?j—üq\àß†ºo\à½kÄ‰}\á+_Aª\Í6óK·†}c\ÄÚµ§Ùo¤i@µ–T\Ù*Á¿Ÿ\ï€\ZN™¯|sø=¡\ëVš¦‘«üKðV›ªi·ðGuea{\â{»;»i•¢ž\Ú\â)¡‘Y$™XH¯\ì÷À\ß\0>|4\Õ\Û\Ä?>ü7ð>½%œ\Ús\ë>ðg‡ôQ¬\'xž{6¿\Ótûk¦¶™\à…\å„\Êc‘£B\êJ‚?xúiq?‡\ÙV‘ñO=\â\Ü\ï†s˜p§F´)Ç†\ê,NœªJ­	\Ô\æ¯(U´i\Ôø~Gó7\ìú\àÿ\03\Üó6Ï¸?\ép\Ïp\çp¥~9\á‰Ð©R|[ƒq\ÇÖŽ\ZH\á\êÂ›ŽŽ+\Ü\ê\ÑO\ë	\ßF×¯“šü>ýª?\à¯_~$øŸ\áÁ¿‡z‰®<¬\Ü\èzß‹üa¨_I£\ßj–$Ã¨Z\èú>‡s§Ü›k;\ÅhF¥>²\Âð#ùv0\r®ß·\ï÷O\áü\Å	\äø§ñ)Ý™\Ýü{\â\ÖwbY™Ž»|K1<’O$šþsúøSÁ~\'q/\Õ\ã\\¯ûk\ÃYVSW–\Õ\Äb°øJ˜¼\×Œ¦ñ•„¯‡©_\êô°…:&\èI\â%:”\å*tù­>Ÿž7x…\áð\Ã\Ü\ê|;‹\âüËˆ^g›\á°øJÙ„0™šT°xY\ã0ø˜a£Š­œ*µñ#Ol%:0«\Z5«Â§\êYÿ\0‚\×~\Ò}þ|÷ñðÿ\0\Ý\ê“þ_ûI\Ñ3øÿ\0‚ÿ\0óu^\Ûÿ\0ý›>üPøY\ã\ïüIøm\áxŠ\Û\ÇSxf\ÊO\é–\Þ Ó¬4›}I¿X\í4J;2;‡¹¼\ä¼6­vT¬k2Æ»kõ\ÓþûöSÿ\0£pø#ÿ\0†\ÇÁ¿ü§¯\Ñ<D\ã?¢ß‡¼iŸpf#ÀIæ˜®\ÅC‹\Æ\áñ°øjØ‡‡¡ˆŸ\Õ\áW4•WJ\n¬ §QS”¤¦ýœc\Ê\ß\åžp\'\Ó3ÅŸxw\Ä<\ÒNŽM€\âZœV/\Å\á«b±tpø|v\'\0ž*t2xQ…Z•0µg\ì\éJ´cM\Ã÷®M\Æ?„1ÿ\0Ákÿ\0hýÀ\Éð\Ç\à“GŸœGa\ã\År=›\Çª\Þ\åX{\Zý!ý‡ÿ\0\à¥:W\íQ\âÉ¾ø»Á	\àoˆq\è·ZÞ›q¥jO¨øoÄi¬­ªCi\ÜI¤^\ÚA,W\ÚOu©­\Ü	s\"\Ü\Â\ÐyR~Zÿ\0Á[¾	|.ø;ñw\áÌŸü¢ø\Z\Ó\Å\Þ½¿Ö´ZG¦h’\ß\éÚ¼–0^Z\é6\Â;\r>Gµ	\éc¼3²	¤§i$!ÿ\0‚]3/\í«ð³k2\î²ñ’¶\ÒF\å>\Ôò§T\àd~‡\Ä^øÇŸG\ì\Û\Ä\Þ\à8ðž)ð~w\Äy=Z8œ]v’SÆ¹\áñT\é\ãñe\n˜Œ¾­	ª°©\á\ê*\Ô\Õ\nüŽ—\ä|3\ã\ß\ÒC\ÃO¤\æI\áO\Zø—W0”8÷ \à\ìÿ\0W„¯•fXû—Rú\Æuò\Ì6;Š§†\Ìh\â!V‹¥R–\"œ¨JxŒ;¨ªÿ\0UŸ~\'øs\à¿\Ã_|Rñi¹ðV‰q­j)g›w:\Ä\ÑÁmgl„…7×“\ÛYÀ\\¬i$\ë$¬±£‘üÿ\0ø¯þmñ‚\ãV¹“À\ß~\é:‘…¥¯‹o<O¯\ê\ÂŠnot]_\ÃVFVûÌ±\é\áS;U\Ûn\ãû\'ûs|7ñÅ¿\Ù[\â÷€¼¥¶µ\â\ÍoC°mHŽx-\å\Ôf\Óu\í\'Tš\Òne†q%¥•Ç’H¢iU!Rd‘þ;|Wð\ß\â\ïdÒ¼e\à_xORV’1i\â\r\êúEÁt˜£¾´„Ê `ñ\îFR¬¬Tƒ_˜}|*ðx‰3.6\Ëò¼ÿ\0‰p¹óÀ\àòŒ\Ç3«M\á2xe¸M<m<«‹\ÃÊ²\Åb\ë\ã)<ejU£©û*¥(W\çý§\é\ï\ã\Þq	\å\\œ\ç)\ÂŽ†g‹\Îrì®ƒ£\Ïjæ™–®¾u‰Áb!©\à\è\àf²\ÚU\éJø¸\âq\êª\ØW\Õø}\í\'ÿ\0D\Ë\à‡þ¼~—Žhÿ\0‡\×þ\ÒôL¾\à·\âÿ\075\í\ß\nÿ\0n\ï\Ø\Âÿ\0<\á\ß~\Ëþ%°×´i¶\Z\Ô\Zg\ÂxŠÅµKkhá½ºƒ[\Õ<A§\ê:˜½ž6»{«\Û8.]\æe”1]\í\ß7ü7þ	Ø ³~Íž3UPY™¾|:@$“\â\Ì\0$ž\0¯´\Æpÿ\0\áq¸¼5¡6Š¥‡\ÅW¡KÖ‡&&\Z¾Îx{,Ez|µ£Ô³­Z’\ä«R.2™e\Üm\Ç\ØÜ¿Œ­ûBx#[ƒ\Â\âj\à\ê\á1j®¦\"*³\ÃUl·YT¡*Ž”\ãWB¢œ\Z*r¼\Ì:_ü—ö¾\Ôô\Û)>üX\ïu+I4\ïT¹¹Šd-\ãvPÁd%K+( ¬8?Ò¶Ÿp÷V6w2Y.-`\Õ3±ZX–F¸“´!rI\Æ2I¯ÅÁC\àšº–¥gÿ\0¯|,¿h…—WÖ¾ø8ZÙ²È¬—Nt_Z¿T…€5½œÒ‚„¬d…õ\ï\á\ß\ÄoüVð–•ã‡$\ÒüW\á-f&}7X\Òdv·“\Êm“[\Ë\ÑÁucwlÿ\0»¹°¾·¶½µ“÷s\Û\Ä\Øü\Ëô‚Ê°˜hp\Þ\'*ð=ðo	BY~/0XŒF;\Äb£‚–„qž\Ë\ê´ñ8a1²m\íªB¼\çrÓ“_\ÙE<ÿ\04\Çcx¿\ÄInñ\×[•\Ö\Ë2Ì¦¥,>?!\Ã\àç‹Žex:ªŽ.¾<v]Fxšt\'‡£R*s«\n•¡	vôQE4Ÿ\ÙÁ_–¿ðXù3»ÿ\0û)ÿ\0\ÐõjýJ¯\Ë_ø,ü™\Ýÿ\0ý”ÿ\0\èzµ~·\à\'üžŸ¿\ìµÈ¿õ2\à¿J?ùG¿\ìƒ\ÏõŸË¯ƒ?\äqð‡ý^ÿ\0\ÓÍ•y6ñ\åmÿ\0^\Ñ\è±_Á·ƒ?\äqð‡ý^ÿ\0\ÓÍ•y6ñ\ãmÿ\0^\Ñ\è±_\×´ý\ï\Â\ßû\ãý9\Ãgð\ìºþŒ\ßõóÿ\0ôž)?ÿ\0iø*÷Ç‚ÿ\0>\'ü+ðß€>jz‚<Ms¢i·úå—Œ\äÕ®­ Ž\'Yož\Ã\Åö6m;;½¤ð0\Ï\á¿ø-G\ÄEðW\ï|_ð\ç\á\ä¾9I4[_‡šW‡\àñU–+\Ï%\Ëkº—Šf\Ô<E©\ÜKgcn¶«ce¦\Íaqwq<›\î¢HF\ï\Î\ß\Û\ßþOö‚ÿ\0±þÿ\0ÿ\0D[W\Ú_ðHo?	~/ø·\âö¯ñCÀú\ÂZO…\à\Ðt\ßiöúÆ‹h\Ú\ìú\Ê\êRh÷\ÑÍ§\ÝÝ²X[¥¼\×vó5¨\ÖþTŽ^¿H\Î<)ð„|\nÉ¼D\â?\rðùƒÁp¯g›\Êj\â(f™ž7ý…Suª\ã©Q§KŽ\ÅFŒ“¦þ§[©Znüg ñ¿\é7ÇŸHl\ÇÂ¾ñs•K5\ãN9\È2§œQ\Â\×\Êr\Ìq¹\Ý*9mzó«—\å\Ø:•2\ÏvMf0r©8\ÅN¤Yÿ\0®ý¤³\Ç\Ã?þ\ßñ/ñöõ:¯LøQÿ\0«ñ\ÍÇŒt{Œ¿<\ro\à\Ëû\ë[-OYð4¾%°\Ôô{›˜\â›Y’\×X\Õ<Fš­¶Ÿ½\Ìú}¼v—W\Æ\Éop%Øö\×\í\Éûþ\Ìúo\ì\Ëñk\Å\Þø1\à?xŸ\Â»\×4oÁ\Þ°ðµ\å­õ”ð2¿°á±†ú\äŠX/¢¸‰‘ò:F\Éü§d\í\Ï|gô§\á\'ý¼{\áLó2É¼\'\\7õ,Â®GŠUq5\è\ã\èb\'‚\Ãb\ébòün2­vž&œ¡*‡-jrJ5)5\Ï\Ñã‰ŸK_£gd9x\Ù>(­Œ\Êð|O‚–\rB¾[‰Á¼\Ç–4À\æM\ï\â2\ìD*Ò§:°ž\Zt\ç\Zô\ê\ÉÆ—\î\Å?ø-o\áñž³iðwá—%ð=\äöšF¥\ã\ßøI/5\Íj\Ú	8õi-ôMwB¶\Ò\ã¿UY\áÓž;¹\ícq\×rÉ¸×ž/ü»ö‘\È\'\á—Á¹‚\éþ=\ÉÀ\'\Ç$\ÇBA\0\à\â¿Qÿ\0c¿\Øûöe¸ýš¾k:\çÁ?‡+×¼M\àm\Ä\Ú\î½\â\ß	\èþ&Õ¯õmkO†òòF½\Ö\ío® ·9X,­\äŠ\Î\Ý!71o\Ìø+\×À?„ŸüEð‡^ø_\àÀ’xº\ËÄ–:\î—\á}>\×F\Ðî¿±?³d±¼H±Š+k\Ü_Kó[\Å\Úc2«HŸð÷ô]\â¯høI‚ðg±´1Y\ÖO†\â\ßñ_^\Äp\í]LF#Éš\Ëc!—b*F¢Œ¿y*qt©BO\Ù~•\ât>™\á<v\Ì<}\Â\Õ\ÊóL\'gØŽ\É0¿Tž]„\âú˜9`ðø/k“\Ã\nãžg…¥<:•5\nQª\éÕª\éG\Û}\ïûÿ\0ÁO\ìÿ\0iOZ|$ø‡\à‹x\ëT±¾¼ðö­¡\ês\\øk\Ä\éñ5\ÕÖ”,u-ú†“~¶I%Í±mGTŽ÷Éž<Z2G\çý\×ûTüZ\×þ~\Ï>-ø_O\Ò5]Àú:®™§\ë\É{&u<š¶`Rù4\ë\ËÖˆEw#oynþb¦\\®\å?\Êÿ\0ü¥™mO€»I¼K«)\Çu>×²±À¯\é7þ\n)ÿ\0&OûAÿ\0Ø™kÿ\0©‡_—ø\é\á7ð?\Ò\Ãn\á\ì¡axkŠñ<‹\Ìò:˜œV\'¿´8º¾Q˜a¨OZ®*ž…\ÃGž‡·q¥*•UN›…:µý¼pñ#\ÄO¢\çŒU\ÅYôñüUÀøN7Ád¼E6\r˜ò\å\Ü\r†\Îò\ÜF)a\èR\ÃW\Æ`q¸©8b¥C\ÚV…:O\íª\Æu*~3\Ã\ëi?ú&_ÿ\0ð_\ãÿ\0þn©?\áõÿ\0´—ý?\ßø/ñ÷ÿ\07Uø\ç!!ŽF Ž\Ü\ZþÊ¾þ\É²þ¥ð¯á®¥¨þ\Ï¯õ\rGÀ^¿¿½½øq\á;«»»\Û\ÍO¸º¹¹¸¸\Ò\åši§žG’Y$‘Ý‹“_\Ñ>7ð\ï\Ñ\ÇÀücso°9\äx‡˜ahS\ËkÔ¡,<²\ê8J\Õ\'Y\â±ñREˆ‚‚…\Úq•ú\ËG^+úXý\"ó\'Ë²/±\Ü;>Áe\Ø\ÜM\\\ßKL3\ZøŠ\áE`²\é\Ê2¦ðÓ”\Ü\ìšiF\î\ç\ãü>¿ö’ÿ\0¢gð;ÿ\0þ>ÿ\0\æ\êº\rÿ\0Ám>5Áª\Ú\É\âÿ\0„?õMfS{iá«hZ¤°\Z\Ú\ê\Z®¹\â;H&?\Âò\éw;¡\Í~\Êx\ïö\'ý”5\Ïx—Ko€?\nôƒu£j+§\á\ßø{@Ö¬&’˜nô\íWJ\Ó\ío-nm\ä,L’\ì. J’FYñ™Z\ß\ß\Ú\ÆX\Çk}yks—1\Û\Ü\Ë\n \0Xª\Ç\'\'¥rø+}\Z|v\Âñ,2Ÿ©d5r—\Ò\Å\Ã‰\Ä)Õ¥š\Ã°õp˜¼»4UiÔ„°\ãQ~\êtß³9Ë™û=¾\ÜQôºú7f<\'O=ñ\ë\ÄTø––?€¯•\á\è(Q­“VÁ,Mv2\Ê:”ä±¸iA^½*ñu©Ö§\Å{O\î;\à7ÆŸ\n~\Ð\n¼\'ñcÁŸi‹FñM“\Ìl/•ÿ\0I\Ôm&’\ÏU\Ò/|¦hš\ãN¿†{v–1Nˆ“ U*ü‘ût~\ßú7\ì€\Þð¶™\àöñ¿\ÄO\é7zÎcu¨fhZ.•Ì–jz¼\Ð\Ãqyxn/¡št\Ë_±\É\"C$\Í’cÁ$I?±gƒ³“|E<\à\ÂSyÀöö¯ÉŸø,ƒ»~\ÕzB³³,<<±«1+mGVv\n\Éf\0±$òM4ø[\àÿ\0gŸI\Î&ð\ß7\Ãbs\áŒ×Œý†®/J®3‘ce…Ë°Ø¼^\Ztq2„=­\Z•\åN­9\â=‡$\å\ÉV¢\×~6øû\â}x\Å,“†\Ëx\ãò\Î¡‹\Íð¸,4©\à1<A”T\Ìó\\fŒ¥Š\ÂÓ©Y`\ëP¢¥Nk	õ§[\ãR)G«“þ]ûG\ïc\Ã‚K~A-@½ƒºx\Þ4fõeD²Ž•ü>¿ö’ÿ\0¢gð;ÿ\0þ>ÿ\0\æ\ê¼þ	ðw\á\çÆ¯\Úf/üMðí§Šü9£x#\Ä%‹B\ÔL­¦]\ê–7zM­›\ê6ñ¼k{m\n^\Î\æ\Î}ö\Ó9O>9\×ô¸?c\ß\ÙHqÿ\0\ãðG_†>?©\Ñò\Zý¿\Æ\Ç\è\Ã\à\ïS\àü\ÃÀ\Ø\çxõ•\àóJØŒ\ruCN–6u£B”eŠ\Í=µZ¼¸iN«t\áó\Å)NN\\¿\ÏeLOø+\ÆùG\Ò)ðþYG;\Å\äT°Ù\â±\Õq>ˆ­8\árcJ“X\ê1¥jõgQÆ£œi\Ú*ƒ\ßðú\ï\ÚHôøgð;ÿ\0þ>ÿ\0\æ\ê½\ï\à_üR×¼a¡øk\ão\ÂýI\ÑõýV\ÃJ>+ð.¡©A‚÷\Ó-¬wš†‰¯\Ýjb—\Ân^\rb\Æ[Ko6\ác»x\ÄzOüöaø\àÙŽ÷\Ç^øM\àø«\Ãþ,ð\Üz¯ƒ<=¦xbI­u{¶³¾´\Ôc\Ñ\í­!\Ô`xÂ¼Ky\Ím*·h‹Ë¿ù··$\\[‘Á\ÂA¿z•÷¾\Zxcôtñß€q\ÙþK\ár\áh¼~a‘¹,f*†g\ÇapøZ\Ð\Æaq8,Ê¥\Z°<f\Z¬#^”\êF¥F\Z­û\Ï\Êü`ñ“\é[ôoñ?\Â\Ù÷Œ•8·ƒË²¾ ŠŽ	_&\ÌpùW§,;Ê©Ô„¥<&*…GJN¥:nž\'\r‰¥]\Ç\Øÿ\0y¾,\Ö\æ\Ðü#\â?i\â\Þ\æ}#\Ã\ÚÆ³f³{K‰tý2\æú\Ýe0º;\Û\Ìð *Dv‰Ž\ÇRC\æ\åÿ\0àµŸ´’»¨øeð@…wPN\ãì¬Tc8û\×ô­1oz³1%Â«òI\ä’|)$ž\äžI5ü3\Éþ¶_ú\ë/þ†\Õøo\Ð\Û\Â\Þ\ã\ì?ˆ\ß\ë¯\å\ÜIS&\Çðõº¦=b\ÃCO9x•IP¯I%^Xj2š—7À­n¿\Ñ\ßOo|Pð\ß1ðø\Åù§	\Ð\â.Ï±ù¦-xgMz5òO«J£\Äa«Iº\ÅV„\\SS“j\çî‡‰?à´Ÿlü\à6ð\ï\Ã\ï‡Wÿ\0uu{\Ï\È|VžÑ£]FXt-7F²\Ä1j“\ßO§$wÚ\åÆµ<\É/\Ùc´R¥\ë\Í\áõÿ\0´—ý?\ßø/ñ÷ÿ\07Uö\ßü3öVýžü]û-x[Çž7øK\à_x¯Åš·‰f\Õ5xwMñ4\É—¯_\év6¶\ëP^Á§[\Åkn›\Ò\Â;qq!2\Üy²a‡\è7ü1÷\ì§ÿ\0F\áðGÿ\0\rƒùOXq/ýx‰¸—„jø\Î\ë\äCeØœÊ¶>Œc[‡Ì±\ÄS\ÂÓže\ÍK/\ÃVŒ°¹}9F3X*4]XûiTo¯<9úhx™ÁÇ´>’YvG…\âžÈ³l[º¼ªQÁbr\Ü3\ÂU\ÆN–R©\Ï2\Å\á\Õ<fg(sA\ã\ë\â}œ\çO‘¼O\Ø\Çã§‰ÿ\0hÿ\0\ÙûÁ\ßüa¥\è:6½\â+Aw§xj=F-\Z\Ò5\Ûý.¶T¿\Ô\ïCI\rª<\Þm\ä \Ê[`D\Â\æGþ\nAÿ\0\'£ñ·þ\ÂúGþ˜4\Úþ¼<!\à¿ü?Ð­</\ào\è^ðÝœ\Ø\èÒ¬t]Ñ®§’\ê\å\í´\í:{XZ\â\âY&™£‰L’»;å˜“ü‡ÿ\0ÁH?\äô~6ÿ\0\Ø_Hÿ\0\Ó›]ŸC<nS™x\í\âa\å%\Èñ\Ü5Ÿ\âò|¢RUW–b8§%«À9\ÆSRxL4©\ÐrS’|—R{žO\Óÿ\0,\â—\è\ç\à\ÞQÅ™\Ìx‹‰²\Î\'\Ê09þ}JœsŒ\ß\r\Â\Å,~eJ\å\ã11©]EÓƒJvq‹\Ñr¿²—\í“ñöA\Ô|c©|?ð\ç‚üC/¬ô›-N/[\ë“\Ãm5\Üö\ÒXZÑdv½•e3¼\ë´.\ÅC’¨¿Ø“\ã÷Š¿i\Ùÿ\0ÃŸ¼g¤øD×µ_\Ä\ÚuÆŸ\áˆõ(´ˆ¢\Ñ5«6\Ù\áV\ÔuKÁ,‘B¯9{\ÇS!;?\à\ß	>|Uñ\'\Æ\è~&|<ðg\áÑ´É¤\Ã\ãi>\"‹M–ö÷[K©,¢\Õmn£¶’\á ‰ex•Y\Ö4HQ_Ñ·ƒ|\r\àß‡z¿†<\áoø7\Ãv’\\Mk øcH°\Ðô{y¯\'{›¹¡Ó´\Ø-­c–\æwyg‘\"\r,Œ]\ÉbMy¿Lþ&\àG\ç/\à¹\á|CÀ\æ|9Œ\Íø\ÝÕ¦\á˜\åR\á¨NžZ¨ªÎ¤\\)bò\Ú|Î„Sú‹÷½\å\Íô?³ÛƒüP\Ãð^G\Æx\Þ>¥Šð¯€\âÜ¿(ðõQ©\ír\Ü\îP\áW6•w‡T\ÜjVÁ\æ•#ˆ“__W†—™ø\Ù\ã}O\á¯\Â/‰4k[\Ý[Ážñ‰4\ë=MnNº¼\Ò4Ë›\Ûx/V\Ò{k¦¶’H•f÷\ÊP’#a‡ó¾¿ð[\ÚM•Oü+‚€\äñ¸\Ïý5ý|gø«ðû\à·\ÃüCøŸ‡ƒ´K<jJö\ÂúmE¯Z[\é:qÿ\0\î¥4\Ëm\rŸ\á\ÞI\Þ+h¦–?\É;\ïø*ÿ\0\ìY\Ë\Çað#\Å÷–¨%\Äþð\rœŽqó\æ\ÜkwaHùžK/\ÌUOð?Gì––?%Ï«â¾Ž¸ÿ\0!,ÖŒ0ù\Ý,\Í\åXl©\Ñ\ÂQuò\ÈÕ«BT+Ö“«GR0«\í)Â­7(%8·úgÒ›‰1yWðýÒ§,ð&Q\Èù±\\5[&©\ã3W[ŠöÌ©aj<FŒ£N¦­Òœ°²\ä¨\ä\Ú_\'\Ã\ëÿ\0i?ú&_?ð[ñÿ\0›š?\áõÿ\0´Ÿý/‚ø.ñøþ~9¯³aÿ\0‚—~Í—\Åqoû(üPž	\Ñe†x~øZXf\ÆRH¤I\Ù$F«£a\È&¼—\ã\Ç\íÁû0üXøM\ã\ß~\Éÿ\0\íg\Õ|=ª¦«\\ü;\Ðt¥\Ðu\Ñe1\Òuµ\Ô\ì\ævO½\Ï<ð2±µY¡}\ÑH\è\ß\Ðyoð¦+2À\á1ÿ\0B\ê¹~Œ\Ã\áñx\Øñ†]Šž\n…J´©\Õ\ÄýU\Õ\Ã{w‡‹uoEÏ’PS‹iŸ\Éù·qž)\Ìq\Ù_\Óÿ\0š\ãð\ØN+—O‚3¼\r<\ÃF„ª\Ñ\Â}u`±k±3Š¥\Z\ï\rZ0rŒ¥Û€ðGü\Û\â„\ZÕ©ø‘ð{ÀzŸ‡šEK\åðE\ïˆtMbY‚¼ö¯¯jž#´¸’&AjðÛ‹‚¢/µA¿\Í_\è+\á\ïŽü;ñ?Áø…\á+©/|5\ãOñ‹s4/o4–\Zº\\D³Àü\Ãq\ã\r\ÄYp“F\ê®\ê\Ûø6\\\í\\NÑ’:ŽHö\'šþ\Îÿ\0`?ù3?\Ù\Ûþ\ÉÆ—ÿ\0£\î\ë\å>˜\Þxu\á\ï\rð·ðVCO‡±˜\î ©“cðø,N.x^¦[‹\ÆÓ«,6*½x\Ñ\ÄP©ƒ\å„ð\Þ\ÅT§^¢¯\Z®4?\Ò~€ŸH¼P\ã5\á/8¢¿e\Ø‡\åøŒ\Ç\r„Ža‚\ÆSÍ°uJ4qxZi\ÔÁ\â(\ã\\\êPÄª\êZ¥†t±¯ò\Ï\í¿ÿ\07¶ý˜üs7\ÂOø\Û\Æ^=²\Ót\ÝO\\\Ôõûù\í<5¡&«\ÞXØ‹=?f¡«_Obñ\ÜJRÿ\0M†\ËÌŽ6ûK³ˆ¿=ü»ö’\É\Ç\Ã/\àd\ã:³Ž\Ùÿ\0Š\ä\ã©\îy¯–?\à¤L\Íûhük,\Ì\Äjº2Äœ*øM\n£=G\n\0tô\çü3\àO\ÂoŒ¾5ø¹{ñOÁ\ZŽ“\ÂZ…[AÓ¼GjºŽ“i>­ª­\íÌšdå¬®\çt±·Ž6»†e…A\Z6Lþ•xK\àG‡~\0d\Þ%qg‡ñ\â\ÌD8O†s\ì\æµLF*¶c\Çñ\Ë)òa¡[0\Ã`°˜zx¼Êœ#J’¥\nXjr›U«ó:¿ˆf~<}%<WúK\ç^ðW‰\Õx2†7øŸ†r*£„¡“\åyo\r\Ö\Í\ê)be†Ê±X\Ü^&X,®´\ç^¬j\Ö\Ä\â§\nr©C\É\ì-\Ã\ëÿ\0i/ú&¿ð_\ã\ïþn«\á\ÏÚ«ö·ñ÷\íw\âø«\Çú„<=}\á=\n\ã@°¶ðt\Z\Ôs\Ú\Ý_Ë¨\É5\Ú\ëZÆ³;\\ùÒ²)†h£òÂƒl±þ±?á¿e?ú7‚?øl|ÿ\0\Êzüÿ\0‚½|+økð«\â§\Â];á§€¼#\à?Vð«}©\ØøC\Ãú_‡¬\ï\ï!ñÍ¼WWV\ÚUµ¬3\Ü$\0D²ÈŒ\â0 \nòü\0ñ\'Àn#ñ;\'\ÊxÁ\Ê\ÜÄ•ðY\Äð™\ìñtkG\rF†[^®.“„1µ¤þ³†„\è/Ý»9\ßM\×\Ò}(|$úKð—ƒù\Îw\â_Žøn;\á:žEKÃ”°XŠ3\Ä\âq\nX\Z\ê¥L\r¯ªbe\n\í{E~F’z_\É\à•òzÿ\0\ì]ñ\Ïþ£\×ýU|Høá¿…^ñ_\Ä_]½—†¼¢\Þëš¼ð\Å\ç\\}–\Î\"\âX šò\îS¥œM$I%\Ôð£\Ë\Z1uþU\à•òzÿ\0\ì]ñ\Ïþ£\×ýÁE\ä\Ê?hOûm¿õ#\Ð\ëó¥¾O‡\â/¤‡\Ü?ŒZXL÷*\àœ›RƒQ¯6gÅ¹®:2’”cV4«\ÍÓ”£%¨·%gú¿\Ð[=\Æð¿\Ñ;\Å\Î&Ë£By‡\ç|{ž\à!Š„ªa¥\Ê8%\Ì0±\ÄS…JS©BUððUa\n´\å*nQH6¤¿%<gÿ\0¶ø©q¬\Ü?Ã¯ƒ¾\0\Òü<­œ^5½ñ»¬I$	®gÐµo\r\Ù\Ã$«‡6ñ\ÛJ $\Çö‰ö‰ÿ\0®ý¤¿\è™üÿ\0Á¿ùº¯\ÇG$#\Ô+õ\0šþÁ¿g¿Ø›öX\Ò>|6û_Á‡~)\ÔuOxk[\Õu\ßøSEñF·¨jZ¶e}{<ú†³gy:#\\N\æ+h\Z+hSK\É?²ø\ÉÂŸFŸ²^\Äf\Þ\Ó\Ï\çb±8\r,.\'Wl¾\nØœF7˜\æ¼ò•«QQþ5J³œ\ÛpŒn~\à\Zý.þ’|C\Äø,‡\ÇJ\Ü;‹	C5Ì±9†O¥™bjQ\Â\árü¿+\É\Ü!*U\ä\ãaCNšŒTœ¡òþ_ûI\Ñ3øÿ\0‚ÿ\0óuZZ_ü\Ë\ã\ìW>·ðŸ\áîž²\Æn-ô•ñž›{$ þõ!¼½ñ>­22\ãË‘\ì§Da–Á\Å~\åOûþ\Ê3C4/û8ü	,RD\Æ/†\Þ‚P²!V1O•ð\È%%†Hå°ñº¸?\ß\ÚoÁ\Z\Ã_\Ú\ãO€<)o-§†¼ñÄº‡k4\Ïq-¶›ez\ÉmNÿ\0<¾RŠ\ÍóU¥xž\ná¾Œ¾8\æY\îG–x)O!\ÅeeÆ¤ñØš“…|-lL0sö5ð9§¶£^•Y\Ñk\ÝWŒ\å(ÔŒ¡gôH|G\Ó\è\ë“ð\îý «q>\Íket\ÖUF+\áq˜|7×©ª\Ô1\ÙJ§[Z•:É¸\Ôv•?gR”¡U3ú\àý’?jŸ~\Ö\ß›\Çþ\Ò\ï¼;¨\éz¬\ÚŠü/¨N·³\è:\ÌPCvÃ©Com§cweqÕ\ê\Û\Ú\È\ê\ïÖIˆý¶m/þ\Ç^ð\æ©uá›\Zx¯Æ—\×ö\Zð\ì\Z”:U²¦™m\×ú®«|\Ö÷³Cej\×V‰Ù´—ò<¥Í¯”Ò‡¿\àˆ_òJ¾9ÿ\0\ÙG\Ðõ†«ÿ\0Áa?gß‹¿\ág\Ä/‡žÖ¼o¢øKO×´_i\Þ\Z³¸\Õõ½.]B\ê\Öö\ÏRþÅ³Io\î\ì&Hå·–\æ\Æ\Þ\ã\ìm\ë\ß\"!wþt¡\áo‡Ò³\á®yY`¼?\Â\çxˆÂ†c›U\Â)Â§,\ã/\É\êfÓ¯GT\ÌkQÁR©,R\Æb)F\"xš\Þ\Ò_\Õy‡>.fB\\·Å¾¥<\Ç\Ä\ì~Iƒú\Æ?)É¨b\ç‡T¸¦y&gŸ\Ó\Éc†\Åa%VžY†«Œ\Ä\Â?©aªÔ­‹††‚¥O\åËø-\íeskð¿\à´Vû‰.m<u<\ê¤ð$š/\ÛF\ä\r\Ë`õ\Ú3Šƒþ_ûIÿ\0\Ñ2ø!ÿ\0‚ßˆü\Ü\×\çgÀ\Ý[CøSñ³Àž)ø·ð\ÛTñg„|1¯%ßŠ|¨h…ç¾´6\×®ý/V†;[©l®%†þ++\ß.™mR)$Œ7˜¿¸ðð\Ïø\'wý_?ð\Æü:ÿ\0æ®¿­¼Cð\Û\Ã\r\Ì2\ì\r}\êø‰ƒ\Æ`.¦m\æ>\Ï…­\í\åE`ªª\Ø\Êõ\ç_\ÙS§‰u%R:ðT\çVjª§ü%\áo.ñ\æYšbøŸé–øaŽ\Ës§“ñ^\ÏŽ ðôªý~Œðù|h{Vup²§\í%ˆ…juiÓ…J«ò—ü>¿ö“ÿ\0¢eðCÿ\0¿?ù¹¯°¿aø)O\Æ_Úƒ\ã\í‡ÂŸx+áž…¡]øS\Ä\Úó\ßøZ\ÏÅj\Ëu¢\Åi%´HúÇ‰õ[?\"Sp\âp\ÖfBùrFAÝ‹/üOþ	\Ï‡Ÿöqñ|(HP\Ó|øq\Z–=\çñjŒŸL×´|ý¿?\àžz¿‹m\Ã:FŸðwÄ—at½;Xñ7Ã­#Â‹9\Ôe†±mÃ’k6š|36Ï´Kª^\Øi\ê±nž\áB©?Šñ¶A’\Ö\á!¥”ý\r¸§‡³*ùN2†_\Ä+V\Ì^M‹©C–Žcõ\\$+Uª°s\å­%5\Ë)5Wô/‡<eÄ¸~;\á,N{ôó\à>(\É(g¸\nù§Tq\Ë\égx\Z5\á<VVñ\Ø\Ê8|.\ZXºJTc:\Õ\é§)F1—4¢\Õú)‘K\Ñ\Ç42$±J‰$R\Æ\ë$rG\"‡I#t%Heu%YHe$iõüªÑ¦š\èÕšõ]þ©¦¤”¢\ÓM&šwM=SMh\ÓZ¦·\n(¢…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@œŸðUù2\ïˆ_öðþŸ\í+ù\"\î?\Þ_ýW÷eñW\á?€þ6x+Rø{ñ+COxGW’\Ò[ý)¯5\r?Î–\Æ\æ+»G[½2\ê\ÊöŠx‘ó\ÂnVÊ’ÈŸð\ë\ÏØþˆ\èÿ\0\Â\×\Ç\ßü\Ó\×÷Ñ·\é3À\Þð.a\ÂüK”q^;Š\âlvsN¾Iƒ\Ê1E…\ÅeùV”ñ\Ù\Ö]YWLiN*ƒ‚ƒƒI6\ãóC\éqô;ñK\Ço°¼kÁ™·`²š<\'”\äu(ñmž`1ÿ\0\\À\ã³\\EYÂŽ]\ÃY½	a\åKG\Ù\Ôx¨\ÔsHÊŒRŒ§ö§?\á	ð€Ú¸ðø(\à\r&\Ïº½‹ý\Õÿ\0¾GøUkm2\Æ\ÓN³ŒCicm¬!™„V\Ö\Ñ$DÙ„qFˆÙ±–bI5n¿ˆ+\Ê«Ö¬¡eVµJ©IG™)\Í\Í)Z\ë™]^Í«­\Üÿ\0Hðg…À\à°\ÕL>\rBn\nñs£F\ä\â\Üb\Ü\\¡x·Úµ\Òz\rÚ£¢¨ü:Š+$’\Ù%\è­ù›h•‘ü—ÿ\0ÁZ\äõümÿ\0boÃ¿ýG\"¯oÿ\0‚)\É{ø¥ÿ\0dºýIô\êý«ø·û\r~\Ìüm}ñ\âwÃ‘\â?\ê6zvŸyªÿ\0\ÂK\â\Í3Í´\Òm…¥„_d\Òu\Ë+$ò-\ÕcÞ–\êòct…˜“[¿¿cÿ\0\Ùóöv\×uoü\"ð\ZøWZ\Öô´Ñµ+\ß\í\ïj\í>š—QÞ‹u‹[\Õõ!ÿ\0HŠ72C\ZJv\í.S*º3¤\ï\ãþŽ”¼\"£“ñdxŽ‘ð\Ó\Æ\ÔÁ\å&úöZ²\å^ª\ÄG;ž7\ê²ú¥Oe?¨{Y^\Ôawoó;\'úx§úW\ÖñÂ¾mÀ¯ƒ\êx“žq|pt³|ò|Cý™˜b1Õ°\Ô^\\3O/X\ä±4\ãZ—ö³¡§É‰¨”yþ™¢Š+ø`ÿ\0LO\Åoø-‡†5K\à\ÇÂŸZZ¼\ÚG…þ _\Û\ë	‚,\Û\Ä\Z2Á§<«\Â)fÓ§ˆ\È\Ôs\Z±E\Ïó¿ðûÆº¯ÃøC\â‡¬ú¿ƒ<E¤ø“M†õ\ZK9\îô›È®\â†\å#x\äh%1ùrùrG V%$G‡÷a\â\è>,\Ñ\ïü=\â}KñƒªÀÖº–­X[jzeý³\ãt–7‘Mmq ’\Æ\ë2¯Šuoø&‡\ìU¬\ê\Z\ÇÁM6\Ö[—.ði>!ñva\';mô\í/^´±¶A’Aj\0\0?¹üúSð‡>/ø×†3\ì\Ë‡\Äg\Ã’G.\Å\Ó\Æ`3¬E\\V#	Ž\Â\ãó±Ò”*b±Tý¥\ZÕ£V„©\ÅÂœ\á\'?ó3\éCô(ñ\Å1)xu\Å|1\Ä\æt27ŒÀq.+6\Ê\ê\å¸ü‹†Ë°ø¬·•\äùÒ¯N¥¿³­GRŽ%\×j¥Jnœaùb¿ð[ŸŠAT7Á?–\n¡Š\ëšú©l\r\ÅT»•RsµK1\0±\Æk•ñ\çüWâ¿Œü\âŸÁð“ÀzCxŸAÕ¼?&§ý¥¯^½•¶³aq§]\\Aln-\Ñ\îc‚\å\Ú\Ü\È\í\Ê¤ŠU\ë7ü:óö#ÿ\0¢8?ðµñ÷ÿ\04ôÃ¯?b?ú#ƒÿ\0_óOZa¼Rúa11T<\ãV\ÃV¥ˆ£\'\n5#\n´g\n”\ä\é\Ô\ã\éÓšŒ\árN„¬Ô£(»>Wÿ\0´?…\Ä`±^;ð5L6/Wˆ§ý·™AÔ¡^Ÿ²«z~B¤y\é\Îqr„\ã5v\ã$\ì\×ò0 z§©÷úŸoÂ¿³O\Ø\ÃZ¿…?cÏZF¹gq§\êGÁ‘\ê2\Ø\ÝÁ%µÕ¼ZÆ¡ªY¬ð\ÊH\Ý\ì\î\í\å\Ã*²@\ÍC\àø\'\Ï\ìðûW·\×4‚~\Z›R´™.m&ñú·‹bµ¹Œ£Eqok\â}CWµŠx]HeHC\Ã ó#*\äµ}”ª¨ªŠ¡U@UU\0\0\0À\0\0\0\è\0À¯›úL}%²ò<‹†¸g \Îr\ì[œ<\ïŽ\ÏŽ*µx`±8\Z\\>Š\ÇÓ…%n\"­Z\Ó\Æs9F”!E.y}ô=ú ño€\\M\Ä<g\ÆüCÃ¹Žišd2\á\ìW\ÃU3,f‡¯˜`³V3\ÌpMIUr\Ëðôh\á\é\à%Õœ«¦£üsÁF¼/¬xWö\Êø\Ó±l\Öÿ\0\Ûúí·Š4§?\ê\îôsOµ¹³¸‰þ\ë\ã\ç†P¤˜§ŠHŸk©QOö=ýµ¼oûj3Ÿ\Ã\Ð<]¦ø\Þ\ßKMKM\×\'¿´kk½®Í•\å•Õ„\ÈT²^\Í\ÌSE2ÈžYŒ\Ä\ÊKX_ÿ\0g¿‚ÿ\0l¢²ø¯ð\ç\Ã>36°\Éoa¨jv52˜<±\éšå·“«\é\É#\r\Ò-\ä*\Íó[|\Çÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=~•ý-|(\Í|.\Ê<<ñ;8›5£ƒ\Èò\\4\Ãe\ËqY^e’–le:\Õs¼›…œ\ê\à¨b½Œ\"\åBª\äŽ&¬W4¿â ¯Ž¹ŒÏ‰~øƒÁ¹d±\\EžqI˜g8\ì\ã,\Ï2‰g\Õñ³\Ä`j\Ð\Âð\Æ}€ÅªXl\Ãƒx—R1\ÅRnr\ÂÐ”ù#ù‹ÿ\0ºø£ÿ\0DKÀŸø=\×ÿ\0Æ¿=k\ß\Ú\Ï\Äµ\ïü1\ã_xSFð•Ç…ü0þµ±\Ñn¯nà¸¶“U»Õ\Ä\Ò^³H&Ý¼xM©°·9¯\éþyûÿ\0\ÑøZøûÿ\0šz?\á×Ÿ±ýÁÿ\0…¯¿ù§¬xG\ÇÏ¢w\çTx‹„¼*\ãl›:\Ã\Ñ\Äa\è\ã\éQÁb*S£‹¥\ì1P\Æq\Æ&\ïi7	7M\É+ò´\ìÍ¸\Û\è¿ô\êñ ¯\Âüm\ã‡¼Abk\á±8Œ³žfô\èU¯ƒ©\Z\Øj’–\Ãl=kÑª½¤R¨¢\åtÕ’ü6ÿ\0‚Iÿ\0\É\èøOþÄŸ\é+úý¿ü?«x£ö8øû£h–7:Ž¥/‚~\Û¤O4òC£\ëZF³|\É\ZfXi÷W#‰\ÈV‡\Â?\Øwöeø\ãK_ˆ_þ¯‡<]ec¦\Ûj§\Ä~+\Õ|«=R!ôB\ÓW\×/¬Éž³\Ìh‘õ”\ç?Y2«©V\0«FA¨ ðAx x¯\Âüjñ¿%\ã¿øW\Ä\Þ\ÊóJ8^\Ãð¼\é\àsúxL&#Ž\á\ìóœ8?\ìüngNj\ê­\ZJ¯µuö\Ø\Ú1sþŸú;}8§\Ão£ÿ\0ø?\Ç®Gý£\Æ8¾1¦ó.\Äc³\\/\âŽÀdP­ÿ\0\nyvIZ®/\r:Š\Ò\ÃûÑ”U$±7œýŸðòº‘Ù”‚;\àŒŽÇžõû%\à?ø,·\Å\ßx/\Âþ¿øU\ào\\øoD\Ót3­I¨k:|ºŒ:]¤6V\×3\Ù\Û\ÈðCpð@ž’V\'“.±¦\â£ö{\ÇðO¿\Øÿ\0\â©.±¯üð½¾¡q4—SxrMS\Â+uq3´“\\]A\á}CH·žy]\Ë\É,±3»’\ÌÄ’Oÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=FñÒ£\è\ë\âf_•aüCðÏŒ³ye•j\âp¸gK+<\'S\Äý_…âœ«ZXS¦§\í(ÓOgNR¢§[ù‚¾…?K	3\\\ã\ágŠ¼‘\Ó\Íi\Ñ\Âbñ”ó|ûW2\ÂaªJ®\ë™v#‚3|5*”gR«¦\á^´\é*•c\nüµf¥ù7ü\×\â\Üñ´6_|—r”Kbú·ˆn”\Ê\Ò Tkx\æ†I¼\Þb\Ç4r\ãc†\Å~Fü_\Ö<a\âŠ^?ñ\Ä8ô\ï\ë¾)\ÕuŸXE\ZEž¯ªNo®-\âŠ7•#Ž!:\" ‘\Ù@\Ø\È\×õ¥\á?ø\'\'\ìs\à¯h\Þ,\Ð~\é\ë­x~þ\ßT\Ò\äÔµÿ\0\ëvp_\Ú8–\Ö\âM3X\×/´Û—·™RxEÍ¬\Ë\Ñ\Ç\"®\äŸ\ãø\'O\ìƒ\ã\ßxƒÆ¾)øRº‰<Sª\Ý\ëz\åúø³Æ¶bóR¾\Ëup-l¼Eoio\æHIò­\àŠèˆ£Šóx\é1ôqð\ß:\Æb8#\Â\Þ*\È0Y–V¨f8ú4°¬\×Š¥Š£<.R\Çqf&•¾¬V«8b½¥lL¨G\ØF4}¤ýO~‡K\ß²,ü]\à¾(Ì²œ\ÚU2¼¯œg42\\\n¾Q\Æc\Þ#À\Øzµ³Jµ\ã‡\ÃÒ£,³£……yýrr®¨Sø³þÿ\0$g\ãGý•KýC´z\è¿\à´~\Ö5\ÙûÀ~%°¶’\ãMðŸ\Äh[Zx‘­-õ­\"ò\Ê\Ö\êP ùv\Ëu\n\Ã,\Ìi$ð+02(?¤??go„_³ž‹­x{\àÿ\0…G…4ê©­\êö¿\Ú\ÚÖ®nµ(\ì\à°K;[\Ôu¡\Ûko~T.‘»\Êo%¬\ëz\âM&ÿ\0Bñ•§kš.©m%ž¥¤\ê\ÖVú†›k0\Û-µ\å•\Ür\Û\ÜÀ\ã\ïE4n‡# WóŽi\ã>_¤MO\ZrL«[+‡\ásj9NdðøLÂ¶	e42œn¬°Õ±øjŠ”~²ðó\\D#7JSûQ_\×ùG\Ñ\ë8\Å}pÿ\0G\Î$\Íò\Ü{.«•W\Î2‰b³ª†gCˆjq[^”±X\\·‰Á\ÇK\\e…\ÃU•?¬B’¿$\ßðƒ\à¯\ê>ñ…|m£¥¼º¯„<E£x—NŠ\í]\í%½\Ñ5}F\Þ¤ã‘­\å’\Ýc˜G$rÙ¶:6~\Í\Ùÿ\0Ám~(I5œ3|ð!ó&¶Šf‹\\×“>cÆ“4A\ÞM™\ËÃ´›x\Ü_Ÿ\Ôýwþ	±ûø†þ]F\ï\à–g4­#´:³\âØ©‘ÌŒ#Ó´Mj\Â\Æ%\ÄF±ÛªÆ˜¢…¬¨¿\à˜±,2\Å2|]ðÈ’¦\ïøñ\×|lw#x˜«\r\Ê2¬\n°\à‚	ý/\Æ\ßI£7‰r\Ëq\\w\á\Z\çX\ì¯^†\nu(å´¾©T©Ô¯Jl`%Z©JN­+Å¦\áó>o\ãNúý2¼%þ\Ø\Âøgâ·‡œ9‚\Î1j¸\ç‡\Î3®l|°Q«zø|g‡ùŒiT¥Mt©Ó­(\ÚmJS÷Zû¯K¼:–•a¨òõ•¥ç•»—ö˜#Ÿ\Ë…Ý³~\Ð\Ä\Ø\É5ü=~Ð¾\Ö<ñ\×\â\ï…uûW³\Õtˆ^)†\â1ó$Úµ\ÍÍ´ñ0ùe‚\æ\Úh§‚X\ËG$r+#s_Ü…µ¼6vð\ÚÛ Žx£‚\Æv\ÇH±\Ç\Zä“„EU$\àrI¯øÁû*þÏ¿\'K\ïŠ¼3\âm^8’\Ý5ö¶—Lñ¶Œ0ŽÕµý&[]\í£\Þ]»\Þ4Q“û´^süñôlñ\Ï,ðGˆ¸‹›\ä¸ü\Ó$\â\\	ˆYdðÿ\0\ÚX\Z¹n&½|%ZT±u¨añT\åO‰¥^”±T%\Ì\éTV¡(Oú\Ï\ésôi\Ïþü)Á\Ø|‡ˆ2¬«Šx7™V¢³•Š§“æ”³œ._K1§[\ÂbñX:\Ë•`\ê\á«Cˆ§\ì\Þ\"œ\è\'8NŸó!û!ÁB<wû\"ø?Äž	\Ð<	\ái ñü$‚mb\ïS±¾²¿{M>x’K)¼™­d†\Î\'Tx©.\ã\ç20Eú\ãþuñGþˆ—?ð{¯ÿ\0~Ã¯?b?ú#ƒÿ\0_óOGü:óö#ÿ\0¢8?ðµñ÷ÿ\04õû_x\ÛôB\â\Ì\ï0\â. ð‹3\ë5­FaŽ,-	\âkF*J¤\é\áx\ê…/gJn(ór¹;É¶ÿ\0›xS\è\ßôö\àŽ\ËxW…|g\à›‡òzU(\å¹f;\ÍjQ\ÂR­ˆ©Š©Nœñ>\ZÖ¬\ã*õ\ëT´\ê\Ê\ÎmF\Ñ\åKù¾ý¯?k¿~\×\Þ0ð×Š¼S\á\Âi\á=\n}K\Ótu…’«\é5‹«Û‹ù\åin\ZY<´ò#·‰!ES¾donÿ\0‚PøcWñ\í\àýONµ–[	øs\Å\ÚÞ·v±;[\ÙZM£Í¤Ú‰\æQ\å\Ä÷w\×ðAn²2™X>À\Ûº©ÿ\0¾ý‰\Õ\ÇÁ\Ä%Xñ—	R\âb®¤™aÀ‚E}Yð³\à—\Â‚ZDº\'Â¿xoÁ67>S_bi\Ð\Û\ÞjrBE6«¨•kýRx\Ã0I¯\în$E;U€âº¸\Ã\ée\á}?	ó\r<4\àŽ%Ê°øüƒ1\áÌ¾Žm·	–\å8<Úzx¼B\ç9\Æb\ëEb±5aJ§\'´\ÄMJ¥uk\å\áÿ\0\ÐkÆ¼G9Š\Þ1q\ç\æ•r\Þ&\Êx¯5\Åd˜\Ì\ß3\Î3¼~K[\r‰\Âa¥Opö	N¬ðXjk\ÂsöXx\Ë\Ù\á\ç.Tðhÿ\0V¿³\ÇÁŸ\Züa¼\Ð.|Oo\à\ÛK§Ð­/¢\Ó\'\Ô>Ý«iúRÆ·óZ\Þ\Çl#7\âvsk1aÀ¹|\ÈY¿\à¶\Þ¹`\×?³n¯9\0\Í\ã\í.B>…ü\Øß­~\×üLøi\àÏ‹þ	\×~|A\Ñ\×^ð‡‰ ‚\ßY\ÒZ\îú\Ç\íp\Û^[\ßÀ¢\ïM¹³½€\Çwi¡ ¸ŽÂ„•f\ã¯øu\ç\ìGÿ\0Dp\ák\ã\ïþi\ëù\ÇÂœó\èó•\äXú>.pOñ\'\Ï7«W/\Çpöa_	ƒ£“K…,-Jt¸¯\"Ol1\Õg\'…¨\Ý:´—·••:\Õþ;ð¯\Ò\Ó=âœ»\àGˆ|	Âœ#O#\Ã\ÑÌ²\Þ(À\à1X\Ê\Ùü1ø\é\×\ÆR–3€8®Vž¦”qô ªQ«l$$\Ýj\ßÿ\0\Ã\ë<ÿ\0FË¨ÿ\0\áu£ÿ\0óHàµž \ãöd\Ôƒ\ã­#\Ðÿ\0QÀ\'©Á\Ç\\•÷ü:óö#ÿ\0¢8?ðµñ÷ÿ\04ôÃ¯?b?ú#ƒÿ\0_óO_¨®B_ú5>(\á\ï\åÿ\0Wú·¡ø‡üC\Ú=ÿ\0GŸÁ\îŸó\'\Èÿ\0»ÿ\0Vc\ËðóGòyñ#\Å\Öþ>ø\ã?[xJð·‹<Iª\ëðxkD\Ê\Ò48µ+§¸M6Á0»m\í\Ã\íU·2¢HŸðF^\Óÿ\0f\ß\êzŒ0hú\ï\ÄýV\çÃ­;·“sme£\é\Z~¡=œD\á!þÒ‚h]\Ô–xe<”&¾–\Ðÿ\0\àš¿±f¨Á©\Ú|\Ò/&·eeƒZ\×<U¯iïµƒb}3Y\×/l.‘†Y\í¤VV+\íMB\Ñ|1¤iú‡47B\Ðô«X¬´\ÍH²·Ó´\Í>\Ò¶+k+Hâ¶¶‚1÷b†4A’q’k\Õñÿ\0\éC\Â%xy‡ð÷ƒxk?ÀaV3\'­W\Ä2ÁR–	’û\Ø|6Ž1\Íj\â+Ô”(BxœN*\rQe(Ö©Wž¿EÏ¡ˆ^x«/¼D\â®\Å\â°ø<\îž+\áJ™Ž.8\ìvyBXzøœu|vM‘Q\Â\á\è\Ó\Äb§.	QKõwÑ¥NT\ç­EWðùþ”…~Zÿ\0Á`\ä\Î\ïÿ\0\ì¤xÿ\0CÕ«õ*¼³\ãÁ‡?¼\'€~)ø|x—Â’\êV\Z´ša\ÔuM,CM2µ•À»\Ñ\ïl/\Äg—1‹ð\êÀ_q\áŸ`x3\Ä.\r\â\ÌÎŽ/—p÷å¹¶6Žjc*\á°u\ãV¬0\Ôñð\ÔgY\Å5\Õ\ÄQƒ{\Î+Só/ø75ñÂž?\à|Ž¶›ñG\æy6][3«^†_KŒ¢\áJx\Ê\Øl63J‚—ñ\'G	ˆ©¬iM\è\Þÿ\0‘\Ç\Âö5xsÿ\0O6Uý\ä\Ùÿ\0Ç·ý{Eÿ\0¢\Å|\'cÿ\0\ÉýŠô\Û\ë-F\Ó\àú\Çw§\Ý\Û_Z\È|e\ã¹w6“%\Ä\äñ3F\á%£«#ck©RAû\ÑQQj\0U]ª\0(\à×€8û§Ò‡\Ç^ñ²¿T\á|·ˆrøð\íþž7û{\r—aYf“\Ê%‡ú²Àf™—:‚ÀVö®«£\Ê\åO“žò\åþgúý\Zøû\èõO\Äñ\ÎcÂ˜\éqTømå«†3\×0T–Q\éb¾¸ó<%öNO1 ¨*+\Ï\ËU\Í\Òå‚Ÿñ‹û{ÿ\0\É\âþ\Ð_ö?\ßÿ\0\è‹jý-ÿ\0‚ÿ\0\È_öƒÿ\0¯‡ÿ\0úQ\âZý@øÿ\0ùý“~(x\Ë\Ä?ñ¿\Â\ä\ÕüY\â‹\ã©kššø§\Æ6öõ£H\Þsi§ø‚\Ö\ÎuK,F…²\ÛrI¯Løû,üýœ_\Ä2|ðZxNO=u\Ù±¯j\ï|š_ÚŠn\×5=DÀµ\å\Ãm·òƒ—\Ë\î\Â\ãô>”\Å~/\nòü›‹(ñú·Á\Ù3\Æc0yE<¡bx‘\Ö\Æ\Ôöôsºø\ÇB¤r\Ú\ë\r/¨ûI\ÊT•Jt”¤\áù…Bÿ\0¸\'\é3„ñ‡7\Î8·\na¸Ç8\árü\ß=¯ž\Ë\Ä>!\Ã\à)¬#†0˜‰Œól3\ÅA\æžÎ”aYÒ­]\Æ\n§!ûuÿ\0É¡þ\ÐöNµýÚ¿‹\àÿ\0€ÿ\0Jþóüs\à\r|Hð–¿\àoi«¬x_\Å\ZmÆ‘®io=Í²\Þ\Ø\\€%‡\ís[\Ý@N\Õ+-¼ñJŒ+‚+\âŸøu\ß\ìGŒÂœ\éÿ\0#¯¿ù§¯\è\Çô\à¿¸gˆò^\'\ÊxŸ‰\ÍøŠ¾\Z®E„Ê±!‡Yf\áZXü\ã-©\Z\Þ\×\r9rÂ•Hr8¾~fâ¾«\é‹ôKñ/\Ç\î>\áž)\àœÓ‚ð8Ÿ„h\äº<Mšg8\\±”³¬\ß1u(C-\á\Ü\æ”ð\î†aJ*s­J¢©\n‘ö\\¼³—·þÇŸòk_\0?\ì“ø\'ÿ\0L–µùÿ\0\Âÿ\0[û>½\ã¿ý W\îÿ\0„<\' ø\Ã\Zƒ|-`º_‡<1¤\Ø\èzš’\Ï2X\éšmºZ\Ù\Û,\×2\Íq/•j¦Y\æ’W9gvbMy\Ç/\Ù{\à\í<<>1x5|Yÿ\0³_¶„¶5\í¬Ž¦¶\Ëz7hšžœgY…¤-Á”FP˜Â–bð\Ã\ÄÜ‚¼o\Ãø—š`ó\\FGO<\â¼\ÊxL%L\×\Øg¸L\æŽ*Ž#†\Â:´\ç˜Pú\Ä~¸£Æ£§:®1Œÿ\0uñ‡Á^+\ãß£5òLnCGŠ(p\ç\å\\\Ìñxü>G,O\Ö\È\å˜Mb°\Ùf7¨ÕŽ[ˆxIf¹\Ôr¤ªÓ¡\Í\'\åoþ	\×ÿ\0\'©ðþ\ÆmWÿ\0Q]z¿¤ÿ\0ø(§ü™?\íÿ\0be¯þ¤ZYøuÿ\0ÿ\0ý”¾ø\×@ø‡\à/†#Dñw†.f¼\Ñ5_øJ|cö+™\í.,d—\ìzŽ¿ue96\×S [‹yP\Þ\0uV¿à¢¼~\Äÿ\0´ ðm¯þ¤z~©\â7‹\Ü;\ã7\Ò\Â#\áœu€ÁeÙ§\äµ\ég”08|LñT¸Ú¦:S¥a˜\Ót=–:”T§Vu#Q{5\Ïñ\ï¼\ã?\0>Œ^=ð\Çcxs˜\ç7\çøZœ5Ž\Ìqø8`ªx{K.Œ+\ÕÌ²Œš¬1>\ß]ºp\ÃÕ§\ì9{g)Jþ6\ØnR¿\Þ~cû5\à\ïø,¿\Ä\ßxK\Ã>‹\à\ï‚/¢ðÖ¤h\ÞK¬\ë°\És‘a„3IH\è’Iº4\Ý\ä\àŠücv‚\n\ÄŽ \Zþ°>ÿ\0Á4ÿ\0cO|5ø¯\êÿ\0	Mæ«®x+\ÂúÆ¥t\Þ1ñ\ÄF\âÿ\0S\Ñ,¯n\æò­üG‰.\'‘‚EF€…U\0_ÛŸI®#ðs‡²\ÞŸ‹ü›q~\Íc‘Q\ÊR\çÀ\âh\áðR\ÇU¬\Þ{‘\Ú5©OÚ¦\"\î÷!ñKü\èú$p‡\Ò‹s~3¥\à\'d¼Áe¹LøŽ¾sŒ¯„§Á\Ö\Åb£€¥C\Øð\ßûIÐ­O9sR\ÃrÆ§»R|\Î1ü\ê\×?\àµu]V\Ó->øNº\Ôt\ë\Ë}@\êº\í\×Ø¥º\à[¡l\ÒÄ³µ¾ÿ\05#wÎªrnSø·<\ïq<÷03\\\Ï5Ä¤\0 \Ë<,„(À\0»¶\0\à;Wõ\çÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=u~ÿ\0‚v~\Æ\Þ¿Q\Òþxfö\â<\Ø\×Ä—:Ï‹-VM¡U¾\Å\â]OU³m˜ª\ÐWùÀÝ’\0\àß¥Ñ¿\Ã,>j¼>ðÏ2jÙ·Õ§§\Z9g.6x(ÖŽ5ñX\Î,\Ì\êÑ§K\ëù}•)E:³“§&\Ñý3\ÇBÿ\0¥\ï‹xìš§Š*x}Ÿ\Ñ\É\Ö\"Ž[8\Ïk\ÔË¨\ãeBx\Éa°xn\Ê\èÖg‡¢\å\í+BRö0Š©ž{ÿ\0ªðþ±\á\ïØ»\á\ÜzÅÅƒ\ë\ZÇŒüC`—1˜\Þ}\'Wñ%\ìúu\â«|\ÞM\Ü\0M¾dL’((\êO\åü\Âú®™ûEø\'\Å3\Û\Ëý\â_†öv¶¢·Û´]_QŠö\Ä\Ü\å5\ÔqOmtÐ†,9]¬\rMÖ¶\ÖöV\ÐY\ÙÁ\r­¥¬1\Û\Û[[Ä\Û\Û\ÛÂ‹0Aj±\Å1ª\ÇhªˆŠª (¸ˆ¿>|\\\Ð\Âÿ\0ü\á\ßhM!™4ÿ\0ivº”V\×&7ˆ^X½\Äm-…\ê$Œ#¼³’˜óòJ+ù—€|u	ø\éœx¿ÈªbpœC™q6#2\Épx˜}g\r„\â<ELJ†^¥Z¾¢Ã¿\ÞÆ„1Q¥RXj¥\ì\Ï¾ŒÕ¸\ë\è\Û\Ã^\à8’×ƒò\î¥”gøü%X`±¹`?³¥<n:µ°øl~¶.+\Ù<Tð“©FnŸd\ã?\ãSöYý¤üMû+|Sâ‡…ô-Ä—M \ê~½\Ñõ·»Š\Ò\çO\Õ\Òi)ì¥Šh.¡š\Ê†C\æÅ1$…\Ã\r¿¥\ßðû¯Š?ôD¼	ÿ\0ƒ\Ýükôú_ø&\ìK4²J\ß\ãV‘Ë²\Å\ãC,rBE‰R8\ÔvDUQ\ØTð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó\×ôOý þŠ~ \æñ\Ïø\ÇÂ¾5\Îs•„¡xÚ´0z†œ\çBŒ–ð´\æ©JµNIÊ›©\Ë.W+(E#ð\'\Ñ[\é\Å\áŽK>\à?|=\áÜŠxúù“\Ëð™\æqR‹\Æ\âi\á\éW\Äÿ\0µøqŠ«Õ¥†£F5y²\\ª\í\Éþ\Zþ\Ô\ßðSˆµ\ÂÙ¾j\ßü#\á-÷Y\Ó5}CP\Ó/ukýFc¤H\Ó\ÚZÁö¹\Ö\Þ\Þw\ßp\í\Ò:¢,mÏ¿ó³\Ãz6£\âO\è\Ñí¤½Õµ\ÝkK\Ò4\Û8Q¤–\âûQ½‚\Ö\ÖE‰yePx\àdœ\0M[¿ð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó×³ü&ýŽ?fŸ‚:œZ\çÃ„žÑµûf-g\â¸n5\íz\ÇtoýƒX\×\î5=F\Ç\ÌIdû%\Ì>bœW±‘ý.üð\ï…ñ™†^ñn[\Õ\Åc°¹n.9n/©™\âhÓ¤ñ\Ìtø‹:\ÇF2ö#S\ÙÐ¬ý%\ZpŽ‡‡žý>’¾)ñŽˆ<_ñ7s)JŽ/\Ì3¼&?:\ÌózYVs”0ø,¹ðŽA©8*ø‡ET\Å\á\á\íj9T›Rg¤øª\Æm3\àÏˆôë¾}‡\Ã]b\Êm¤2ù¶¾¹‚L0$¾6Á‚+ø[“ýl¿õ\Ö_ý\r«û\èÔ´\ëM[O½Ò¯\á[‹\rF\Ò\æ\ÂöÝ‹*\Ïiy–\×01FGU–	FV²¤ðkÁ/¿bGfsðqr\ì\Î\Øñ§@\Ë\Ç\0xŸ\0dž ¯\ÄþŒ_HðbCŠò¾\"\Ì*q./%\Ä\á%ar\ÜD)ÿ\0g\Ó\Í#‰X…˜f¹l©¹KI\Ñöj²”cS™Á\Æ*\Ñ?L_¢¿ˆ=c¼:­ÀyŸ	`p\Ü!”g9f6<S™\æø\n\Õ6¶U,$ð¯+\È3˜VJžª®\ê¼3Œù9#QMòfÁ+ÿ\0\ä\Êþÿ\0\×÷õ/\Õ\ëôJ¼\ï\ágÂ¯üðV“ðóá¾ˆžð†ˆoM\ÒR\îþü@÷÷“\ßÝ»]\êwW—³<\×W\Ê\Í5Ä„nÚ¸P\0ôJþq\ãþ \Âq_q\åô±40<C\Äù\îuƒ£Œ(b\éas<\ÏŒ¡O\n±a^4«EU*õ©\ÆjJ5&’“þ¼ð‹„³.ð³\Ã\Î	\Î+`ñ¯	ðoðþe_.©Z¶®7)\Êð\Ø,ML\\F^¦\ZU¨\ÍÑ©[\r‡©:|²\Zrn(¯\äþ\n{\á½_ÃŸ¶o\Åµ[I-\íüG‡¼A£\\2H°_\é·Z”>u¼®Š’ù0Okp#,!¹†H˜\îS_\×\Íy\'\Å_þ7X\Ú\Ø|Uøy\áEa\ægO­iO¨i¾k+\Ëý›©¨MFÀLÈ¾r\Ú\\Â³c÷«ô£×Œ_ø\æ¿f9N\'8\Êó“‘\ãðø\Z´ic¨S¯ŒÀci\âð«\áB´\éUÀFœðõjÐŒ\éÕ”•h\ÊŒÿ\0%úWxúBøwáŒ›:Ády\æI\Ä~ \Ê\ë\ætñ\Ë1S§\ÇeõðX\Ù\ái\Ö\Ä\á£VŽ9Õ¥Š£C\éÔ¢¡,<\ãUÔ¥ü”~Ç¿¶WŒ?c\Ý{\Æ:¿†<) xº\Û\Æ\Úf™§\êv\Z\ä÷ö¦\ÞM\"\â\ê\â\Ê\ê\Ê\æ\Æd*Ù¼ž;ˆ\æŠe‘\nò\Ýw\Û\ÏØƒþ\nG\ã?Ú³\ã\ï\Ãü6ðß…l\àðv¯\âXµ]UÔ®®~Ñ¦^\é–\ëlðÞ†¢•/œ–]®¬ŠA#*}Ý¿\à—ß±#31ø8 ³!|g\ã\ÕPX’Bªø˜*¨\Ï\n *Œ\0\0\0W«üý‹?fÿ\0€+Ÿ\Æÿ\0\n>/†<Mq¤\Ýhrjg\Ä(Õ›û2òki\îm\Ö\ßYÖ¯\íP\Ë%¤Ê°‰€Bª\áYý§\Æ/\ZþŽ%e\ÜU›aü9\â\Èø‹œe1\Â\åœI£ƒ\ÃR¡\Ãa\è\árüF*..­E\Ã\rB:\\\ë.\ÄNP§:u,\æ\ß¾ŽK\ï	3®\n\Éñ\'ð=?\nò> §\ÎøW)Í³L\\ñYV\'ñ¹\Æ	OÀxiÊ®6uk\ÍByž*­YN5©·s\çø+G‡µö8ñLºE”·‹\áÿ\0ø?\Ä:±‡­t{;Û›K›¶\\\îx\áŸPµU\\\ÈF\Ôb?”ÿ\0\ê\Ñ\è^!\Ð5\Ù,-uh´MsH\Ö$\Ò\ï\ë=N=/P¶¾}:\ì\0sk|kƒ˜e~Jþõo¬lµK;­;R´¶¿\Ó\ï­æ´½²¼‚;›K»[ˆ\Ú+‹k›y•\âž	\âvŽXeFŽDb®¥IñO‰\àœ±‡ŠµIµmC\àŽƒes;3\É‡µ/øcN\Üí¹Œz_‡µ}3N‡,I+TU\Î\Ås}þ“¼1\á7f|Å¼;žf<NqŽ\Íp¹†@ðUk8f8L&„\Åa±¸ü·‘Ó–Î–\'Š”œ+r:P•R§¯ô´úqÏ~!e~\"ðð\ÆG%\Ë2ŒvU\Å53\Zur¬^3‡\Ç`ñ™vSœªÑ«OU\ÂbppQ©A\ÍW«\nþÊÁö?ðZ„q\Ø\Ù\Ç?À/\ÛO´)5µŽ³\áógˆZBlacma\Ì1‘U(1Š\å~#ÿ\0Áa~ø\Ó\á\ïŽ|aðGÅ–Wž+ð‡‰<7m{s«h/œú\æ{¦Ew*Gjdt¶’\éf(…Y¶aYN\r}õÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=ð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó\×Œ¾…øLe}\r¼W†#\rŠ¥‹¢\Þk\Â¨Õ…jm\Â|q%(\ÆqM\Æ\\\ÊI5+\ÝóF+\Ã_\Ú#ŒÀb2\ÜOŠþO‹Á\ÕÀ\â\"²ü4%<=zW«:~\ÂP”©\ÊiJ..\Î6´müƒ\"\íD^»UW>¸\0Wöwûÿ\0É™þ\Î\ßöN4¿ýw^{ÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=}£\àø[á‡ƒ<;ðÿ\0Á:`Ñ¼\'\áM6-#A\Ò\Å\Í\åà²°€»GÚ¯\î.¯\'!‰’\âyd$œ¹\ã_I¯¤x\ÑÂ™E\Ã9O`1yW,\ßW<\ÂeX|<ð\ë,\Ç\àù(\Ëœf5%[\Ú\â¡.YR„9#7\í.£t}~‰\Þ&x\Ç<QÄ¼o™ð^;p¤²<%>\Ísœ~.Ç›å™‡>\"žeÃ¹5(aýŽ¬y\é×«S\Ú8/e\Ë\'8ÿ\0\'?ðTjþ\Zý³~\'Oª[I\r·‰`ðçˆ´k–ŽD‚÷Oº\Ñ,\àg·•\Ô$\Æ\Ú\ê\Ú{Kƒ0Ž\â\'°ÀŠ\à¿cÿ\0\Û+\Æ?±\î¿\ã\rc\Âþðÿ\0‹m¼k¦\éš~«§\ë³j\Æ\Ò..®,®lnl\'Ë›\É\ãg†\á$M›n»\Ïõ­ñg\à/Á\ïŽZl:g\Åo‡¾\Zñ¤6‰2i÷:¾ŸjšXœ©˜\éZ¼>V§¦J)\Ø\ÝÁ¼€[$_-ÿ\0Ã¯?b?ú#ƒðñ¯¿ù§ËŽ\Õ÷</ô³ð¯\áNOá·‰œÄ¹µC“ðþe‡\Ê\éå¸¬³4¡’S\ÂC	ŠU+gY67VSÁa±.”\"\Ý\Zðjž\"qI¿Ë¸\Ï\è1\ã†W\ã6wâƒ|{Á¹Tñ\ÜIq6MÎ±¹\Æ[d¸Œú¶.®/\éaøkˆp8¸S§˜bð«*±ú\ÆWž”¦\á\Ì_ø}\×\Åú\"^ÿ\0Á\î¿þ5ùýû`~\×~#ý¯üY\á/ø\ÂZ7„\'ð—‡\î¼?mi¢\Þ^\ÞCuÖ¥.¢\×=ó3¬ªòùaSTŒæ¿£¿øu\ç\ìGÿ\0Dp\ák\ã\ïþi\èÿ\0‡^~\ÄôGþ¾>ÿ\0æž£„¼zú&p.w‡\â>ð§²|\ë	KG¥K^¥*Xº\rˆŠ§‹\ãœEªÑœ¡\'*M¤Û‹R\åb\ã_£Ó«\Än\Äp·xÁ\á\î\Ãøº\Ø\\F\',\Å\çyµ:5k`\ëC†©)a|6\ÃÖ½\Z\ÐU\"£Q\'(\ÚI§cðƒþ	Qÿ\0\'§ðÿ\0þ\Å\ßÿ\0\ê=q_\Ñ7\í\é\á\íc\Å_±÷\Ç\ÝA±ŸR\Ô\î|qs²\'–-+QÓµk\Ój9†\Â\Æ\êr\Û\0i~þ\Âÿ\0³Á\Z\ØüBøið\Ý|=\â\í6\Öþ\Î\ÇU>$ñf©\ä[\êv\íix«i«k—¶L\ÒÀ\íw·g%£enk\ë†PÀ«\0\ÊAA Ž„kð\ï|p\É8ÿ\0\Åþñ+…2¼ÖŽ†0¼5(\àsúX<%|V; Ï±¹Ë¦ÿ\0³ñÙ•8\ákÆµ\Z>\×Úª©ûW\ì­¹ÿ\0L}>üWá}\á7f\Ùöcx®+1\á|F;4\Â\àrþ#áŒ¿ k\æ™fKR¦3\rR†\"»¡\ì=Œ¢¨¯¬79ªÀ7¤vaƒØ€Gq\ØýzWì‡€?\à²_<\à\nx>\ã\áGõ\É</ \é~MZMKZ±’ú\ßH³†\Â\Öy­a•\áŠf·‚?4DV6pYQAÀýžñ\Ïü\ëö?ø…«Í®øƒ\àŸ†¡\Ôî¦’\â\êoÏ«xJ;»‰‰i®.m|/¨\é³\Ï+’òK$,\ï!i³±c\ÅÃ¯?b?ú#ƒÿ\0_óO_Ñœ_ô©ú;x™—\åXoü4\ã<\ÞYeZ˜¬6\Ùå“¥\Åb)Â–#\êø\Ü/\åXŠÐ©B2u(ÒOg	:1”co\äž\nú}-ü%Í³Œ_…ž)ø‘C4§OŠ\Æ\Ó\Íó\ì-|\Ç‡ª\ëa¾·—\â8#7\ÃQ©Js©({<Ei\Ó\ç©\×q©$ÿ\01þsñH«ø\'\à0\ÅX)ms_eT\í,¡Ð²†Áe¤Œ€\ÊNG\ã\ç\Ä\ïˆ\Z\×\Åoˆž5ø—\â8\ì\à\×|u\âMO\ÄÚ¬6´60\Þê“´ò\Ãi’J\éy	y°2\Ì\Ç&¿«\ïøu\ç\ìGÿ\0Dp\ák\ã\ïþi\ëOHÿ\0‚hþ\ÅZ-ü:·Á]2\êXƒVñ‹u›\Ã+b};U×®\ìgRT³[¸*YH\Ú\Ì\'}%>Œ>\Z\â3øaÆ¹&?1\ÂC	Š­O–Öž&…)ª\Ôðò«Ž\ã,s£I\ÖQœ\Ý\ZkšQŒ¥òA.\Î<ú!}4|W\Ã\åyo‰,ø}\ÄY^YŒ–/	Gžgœ˜:õ©ª±Tðø?°¯]Qs„=µOv.p„éª³o\äoø\"n‡«X|øµ®^X\Ü\Û\é~ ø•fº5\ä\Ð\É:ˆ\Ò<9gm¨Ik#¨Iâ¶º˜[I$Lê³¤‘6¯§ÿ\0m\Û\ãHýŽµ\ß\èz\ÃmO\Çsx\ÓK\Õ5X\æ±ñ®ƒŸ›w§”\ë>ª½\Ë\Ìò\ÈòV5\\|Å¾_»|;\á¿øCEÓ¼7\á]Kð\ï‡ô‹u´\Òô]\Â\ÛL\ÒôûU%–;8¡¶¶ˆ33lŠ4™˜‚Ä“\á\ß?dÿ\0€ÿ\0´mö…©|`ðBx®÷\ÃV\×vz-\Çö×ˆtw´µ¾•\'¹„ÿ\0bjºrÎ¯,j\ã\í)C…C0?\Ëÿ\0øŽ|m\Íü@ñ\'†3|W\ç˜\Ìf#Ã¹66K4…:Y<r\ì}n–a’óÔ§_\rƒ\Ä\ã=–2„ö±‚«M(Tþ\×\ÂøQâ¿‡Gð»Áþ2\Èp#p\î/\Ã\áx§;À\ÓY4ý®y<\Ó>Œp¸¬›‰£\nu(bñ˜\\«exŠ’Š¥9<-Y¹\Òüœoø-dbò~\Ìú“¹\ä³x\ëH$ýIðY?­7þY\à/ú6]Gÿ\0­ÿ\0˜ªû\Ãþyûÿ\0\ÑøZøûÿ\0šz?\á×Ÿ±ýÁÿ\0…¯¿ù§¯\Ö?\×¡/ý\ZŸ?ð÷òÿ\0«ý[\Ðüþ!\Ç\íz¿\Z<¾·“\äoùwÿ\01®ßƒ\îÊ¿\Úþ\n·\àß?<yðº\Ëöv\Z=ßŒ´f\ÒmõW\Å:f©k¤I%\Äi-Œ±š{«aûAå±Ž\ãË˜\ÈV3þ.,RLR\Þ$yæ˜¬0\Ã\Z´“M,„GqÆ ¼’H\åQAfr‚H¯\ë\ßþyûÿ\0\ÑøZøûÿ\0šzô¿†¿°¯\ì£ð›Z´ñƒ>\rxb\ß]\Ó\æK7U\Ö´<Q{¦\ÝG –;½:\Þj\Ícw\å\\\ÛyS\Ä>X\äU¯Ô¸+\éOôð£!Ì²¯\rü>\ãü$1Ø¹\ærÀ\æX¼-l>\'1xj8hÊ®?\Å9\æ\'	I\Ò\ÃÑ„–\rR+–STg7\ï~E\Æÿ\0B¯¥_Œ¼O”g^-ø‘\á~:¦_¥”,\×,§Š£‹\ÂeTñUñžÊŽS”p`1\Õc_‰œ%‰\ÄÑ«.uNX˜Ò5_ø¥kZÁ_„\Ú?ˆ\Ì\Ç^\Ó>x6\ÇWòN—ö\Þ\Óá¹Šg“e†Th¤\ÞB\â½^\Å-Ù†2yŽaŽ\Ì*B\êcñ¸¬mJt•©Óž.½Jò…5\Ò•G/\åHÿ\0Z2L®–G“e-\nµk\Ñ\Ê2\ÌWF½ysW­K/\Â\Ò\ÂS«Z_j­HQS©.³m…Q\\g¦QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0ƒ\âøoÆº§\áo\è:G‰ü7¬À-um^Ó­5m#R¶Yc`¾Ó¯¢ž\Ò\ê!4QJhD‘£€T\ê+JUjÐ«N½\nµ(Ö£R¨Ö£9Ò­F­))Ó«J­7Ó©NqŒ\á8J2„’”Zi3*ô(\â¨V\Ãbh\Ò\Äa±ªP\Äa\ëÓ…j\èVƒ§VjU#*uiU§)B¥9\ÆPœ$\ã(¸¶œO\ì{û)\ì\áðDƒÁá‡ƒyÿ\0\Ê=}	ace¥\Ø\Ù\éºm¥½†§\Ú\Û\Ø\ØX\Ù\Ãµ¥¬Iµ­­¼*‘Aooi0Ä‹q¢¢(U\0Z¢½\Ç<\ÎóxÒŽmœ\æÙ¬hJr¡\Ë2\Æ\ã\ãFUT\åF8ªõU)MF*n\n.J1Rm$y9Oð\ÞA:\Õ2.\ÈòZ˜˜\Â‰\åN-xSm\Â5¥ƒ\ÃÑ•XÁ\ÊN¨\ä¢\å&’m¶QE\åž\ØQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEÿ\Ù'),(3,6,'ÿ\Øÿ\à\0JFIF\0,,\0\0ÿ\Û\0C\0ÿ\Û\0CÿÀ\0°°\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\êñòóôõö÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3Rðbr\Ñ\n$4\á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\êòóôõö÷øùúÿ\Ú\0\0\0?\0þþ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+\â?ÛŸþ\n%û$Á9¾\Íñcö«ø­¤øM¹ƒPÿ\0„O\Âv\Ø\Õþ!|BÔ´\ë>MÀ¾¶j:\Õ\ë3Ao-\Ûý“DÓ¦ºµ:Æ­¦\Ã<r¯\Û\Ûö\ÒøYÿ\0úý”>.þ\Õ\ß¦øká–ƒ\ç\é~†ö-W\Ç1\ÕgLð‚tC2\Í#\ê\Zþµsm\r\ÄÖ¶z„ºN«¯\Ëcqe¤]¨ÿ\0?\Û\Ëö\êøõÿ\0ý¤<oûJ~\Ð>%»\ÕüI\â{\É`ð\ç‡ò\âo\rü;ðt>…\ào\ÙË¶\rF‚RÁ»\êZ„—šµ\äl½˜\ÐõµûTÿ\0Á\ì_u-r\ïMý‹ÿ\0e/†þðí¦§n\Ö>,ý¡õ/ø\çW\ÖtÄ´–+\Ø.|\à=sÀÖšD\×\Æ+\Ë\Èüe¨4©ö[½>I]¥_›ôŸø=sþ\na\r\Ô/®~\Î?°¾£d¤yöúOþ?h·Rò!¼¼ý¢µ\è %r{€8#\å?\Ç]þ•ŸðOÿ\0ø<—öføÍ®\é\Þý»~\Ýþ\Ëzö¯ªMkañKÁR\êþ?ø3kjmmÆž<Q\Ã?¼7u{©4ö­w‡®øO·0\Þ\êúÎ›j—S\Åý–xOÅ¾ñ\ï†4x\Ä\Þñ§ƒ<W¤Xxƒ\Â\Þ-ðž³§x‹\Ã%\Ðu[h\ï4½o@×´{›\Í+X\Ò5+Ibº°Ô´ë»›;\Ëicž\Þi\"ucþõý]Á±ÿ\0ðZo~\Äÿ\0´w„¿c¯Ž6½½ý¿hZxsHƒ_º¹»Ó¾\n|Uñ\ÂYø\Å:·.\á\ß\ê²\Ú\è^/\Ó\ícþ\Í{‹\Í?_¸†\Ý\ì.\ï€úŸQH¬®ª\èÁ‘€ee!••†U•†AAr)h\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(øÿ\0ƒ\ÞhYøwö\Zý•´m`\Ã\áOk>9ü@\Ð\Ö(ö†»\áK?	ø#\ámûO“<K¥\Øø\Ã\â¬m\0\Û\r\ÃjJû\Þ\Ò\"Ÿ\ç\Ñ_\Ú\ÇüÑ \ßYþÙ¿²>½ý—|šN±û9kp.´ö\×NºÕ¬>\"jð\Ý\éP]¶m¤½\Ó\ì?³/.m\ã\Û40\êv²Ê¥&‰ñO@Q@9Y‘•Ñ™2²’¬¬§*\Ê\Ã2 ‚È¦\Ñ@\í—ÿ\0rý¦µŸ\Ûþ	ûþ\Ð~&—T»ñŒ~	\èšŽ5Mb+Xoµ\ï|2¿\Ôþxó\Ä\ÞMŒqZ\Ãg\âx\'[ñ™1F#\Ó5;DdWVô¶¿?\à€^ÿ\0„/þ\Õÿ\0ø\Ñü¿+\íŸ4\ïm\Æ3ÿ\0	\ïˆüC\ã¯3ô\Ûþ?7?Å¿=\ëö€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€?˜Oø:¿þ	\Í\âÛ‡þ	óeñc\áG‡µülýŒ¼C­üVÐ¼?¥$—z§‰þx‡L³Ó¾4xsG\Ó~\ÛmÞ±o§\è~ñõ’Am©\ëZ‚|?¹ðÇ‡ô\ëKÄ±\Æ\Ê\n¿\ß\Îx º‚kk˜b¸¶¸ŠH.-\ç&‚x&C°\Í£–)cfI#udtb¬\n’+üö?\àºÿ\0ðj÷Œ¬üY\âÿ\0\Ú\Ïþ	•\áWñ?‡|K¨\ê¾\'ø›û+\ÙH‰­øgT¿¸K»\íkà°”ˆõmö\ê\âò\î\ïÀ—S[]x}c?ð]_\ØI§\0tWK\â\ßx\ÃÀ:\Ýç†¼s\áox;\ÄZ|ö‡\âQ\ÐukIŠ²Ï§\êvö·Qü\Ê@-\rŒ©#š\æ¨\0¯¥?cÿ\0\Ù_\âŸ\í³ûKüý–þé¨xÿ\0\ã4¿\ni³½½\ÍÆ\á\í:y|ÿ\0x\Ë^‘\Ëq†|\áø5?ø’\ê(\Ý\ítM&útGdU=G\ìûþ\Öÿ\0·Ä\'\á_\ì­ð?Æ¿|E©\\Áî§¦i¯e\à¿\nX\Í$ñ¾»\ã\êdð¯„4vµ¸I5=sU³Š{¨\×L±zµÍ…\Çú‘ÿ\0Áÿ\0\àƒ¿¿\à’Ÿµ?x÷Y\Ñ>*þ\Ø_4k}?\Ç\ßt\Ë7ð€\ÏÜ¿¾=ý¼\Z¤š[\ÝG¾\"ñEü6W\Þ%º´¶iºF›´¹\0ý\ÅøðoÀ¿³¿ÁŸ…¾\éói_¾\rü?ðŸ\ÃOi\×7/{ug\áh–Z‹\r\Õ\ä€Iwt¶0ý¦\ê@\âs$¬9¯T¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0þ?\à÷ýC\Â:NŸûhš„¼o\ã_\Z\ê¿|C\âO\Å\á}\r|s¡øOøU£øsF¸ñj\Ù6ƒÇ‹õ™†& \Út—1\Û\Ïö6\Î6_\åkþoû8èŸµoüoö/ø7\â¿i\Þ4ð^£ñU<]\ãŸkk¤køo \ë?|EeªÙ¸1\ÜX\\i\Þ–+˜¥)#r²+!*z¿\àõÿ\0ŠZg‰¿mo\ÙW\áU…ú\\\Ý|-ýŸu\ÝcZ²F$\éÚŸ\Äo\Z˜’E\è²]h\Þ\Òn=LM<`\à\Ð_\\ø§þ\r\á¿\Çl\Ò\Û|5ýŸ~6øª\â\ãnR\ÖM[K\Ò|o“ü/7ü&F2¢N{õ;ð/Ã¿‡ÿ\0ôü-ð\ÓÀ\Þø{\á˜n\'»‹Ã¾ðÖ\áM;»§ó.®“I\Ðl¬,\æ\êO\Þ\\N óg“/+»\×cE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEþBÿ\0ðt¯\æñü\ïö¼´ûK\ÜXx&\Ã\à?ƒt\Õi‘\Û%—\ìõð·T\Ô\à„#U×µ}Y¤N¢v”žM~\Ðÿ\0Á?mµo‹¿·Ÿ\Çk˜\Ô\ÜxÀ¾\é2ó\Å\Æ×¼{\âmgaÿ\0¦qü7\Òñ\È	žŸ\åŸþ\n\éñ¶\Óö‹ÿ\0‚˜þÚ¿ô\é\Ò\ëLñÇ&•<r	c—Ið\Û\ÛøKKh¤4_\Ùú\r°Œ¯Àý\ÃÁ“?oü=û~\×?n\íš+o‰¼+\áý.b¤«/‡	—Í‘X¹bÔ¼e…hÛœ–\0ûY¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¬[°ðÖ…­x‹U”A¦h\ZN£­j3±\Â\Ãc¥\Ù\Í{w!\'€$oÂµ\ëókþ	ñ\Õÿ\0f¿ø&/\í«ñ–*\Ýø_\à‡ˆt\í9 Çš5_\\\éþ\ÒJ@ûK\Äö¿6FÑ“Ú€?\Ä\ïUÔ®uSR\Õ\ï[Ì¼\Õo\ï5+·9;\îo®$ºòz\î–W9÷¯õ\Èÿ\0ƒW~Yxþ—û+\êð¦\ÍG\âV»ñ\ß\Çz\É1É¸?ü-¦À–˜øcH‘dm§÷†5]ˆ¬\ß\äQ_\í‘ÿ\0mø-/\ìõÿ\0¹ýˆ>\Ü+¥\ç‡~økR\ÔVE(ÿ\0Úž3žÿ\0\Ç:©u f\Ô|It\Ä`\0O\0\n\0ý0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯š>>þ\×??fû&ˆ\Þ,_\í\æƒÏ±ð_‡\âMg\ÅÚˆh§š‹LI¡†\Â;‘o\"A}®^\é:Y˜\Å—ñ4ñoøöôÿ\0‚ÿ\0Â²»\Õþ|\r¼‚\ã\Ç0y–>+ñ\Â®m|+)gÒ´4%\ã¹\×\ã¥\Í\ì\Êmô§;bŽ\â\ìoü÷øƒ\Ä:çŠµ‹ÿ\0x“U¾\Öõ­R\á\îµ\rOR¹š\îò\î\áð\ZI®\'w–FÚª ³TgŠþ\Åð_è«˜q–\Äüwˆ\Å\ä\\=Š„1~S…Q§f\Øy(Î–&­JÐ©O,À×‹\æ¤\åJ®3Oß…<59\Ñ\ÄOü\ÐúP~\Ðl›\Ã,\Ë2\à/	0Ywñž_V®9\â,\ÂU+p·\ã)¹S¯‚\Ã\Ñ\ÂÖ£W>Í°µ†\"0\Ä\á²\Ü\ru\ì\ê\Ö\ÇW¥‰ÁRýwø©ÿ\0‰ø§®\\\\Zü$ð‡|	¥‹\ìÚ—ˆüY\â9|©¦ó$‘°Ð¬â»·0n²\Zv£-¤\Ë&\ÍV\åWÇš\ïüö¼×¾Ú’|gñ›ó34Z$Zf\ÖÁ‰;,\î¬l`¼µQœ)†\á\r\Ü\nøÊŠþ\ä\È|ð«†ðð\Ã\åœ	Ã‘E}c1Ë¨\ç\É8Ù©\Ï›,n%\Ê\ë™?j’m¸¨ÝŸ\äÿ\0ý(>|q‹«‹\Ï|\\\ãxûYM¼I\â¸g,„gu*tò\ÎžWT\Üd\á$\èI\Î6U\ì­÷•ÿ\0#ý´ô7OÒ­¾6^Ok¦YZiöò\êžøq¬\êr\Û\ÙA¼/¨k:¿ƒ\ïµmZöH\âSw©ê··º•ü\æK«Û»‹©dý\ßÀ_ðW\Ú3\Ã÷¶?ð›hþøƒ¥B\0¿ŠM1|1¬Þ€W\æƒS\Ñt\Û)Žu%JÀ6ß”´V™—ƒ^\æÔª\Ñ\Æxw\Â	V\çu*\à²,WŠ“©~y,nYGŒŒ\ÛmûHWŒÔŸ4d¥©ŽGô›úCðö\'Š\Ë|iñ*R\Âû%B†iÅ¹\Æ}—\Â4y}7•gØœ\Ë,©J**>Æ¦t¥\É(8hU?³\ßü³öø\ã=–¬\Ü^|(ñµ\ÒÂƒEñÍ›hW×²,\ÒIm¢x¶Ý¢³¹HR™5\Ë\r\Í3ºGmk3\Zý ‚r<‚\à‚:\ZþU™NT•> kõö#ÿ\0‚ø§\á6§£ü7øÓ©^xŸ\áeÌ¦\Î\Ï\ÄM=÷ˆ¼÷Št—÷³\êºr³ý«M5\å¬S4úl\Î-cÒ®ÿ\0‘<]ú\"G„\Åq…µ1x˜\á\áR¾\'„±µ^+\éAsKû?\ß\âjB)¸\åø\ÙU\ÄÖ³T1•«:xiÿ\0¤G\ÚC<\Û2\Ëø;\Ç\ê~xÚ”p˜²¼<0b*\ÉB\ëfWMýWF¤\ä”óœ®8|ñx¼³\r…|}/\éRŠ\Ë\Ñ5½#ÄšF›¯\è\Z•ž±¢\ëpj\Z^©§Î—6W\ÖWQ¬°\\\ÛOd’)9VR¿„*B¥)Î•XNJs•:”\êFP9Á¸\Î„’”g\'FI8´\ÓI£ýq£Z–\"•*ô*Ó¯B½8V£ZŒ\ãR•jU\"§N­*r…Ju!%8N\r\ÆqjQm4ÂŠ(¨4\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nþxÿ\0\à\ê\Ã\áø\"/\íc¦—ò\ï|y­|ðnžwm%\äý¡>x‹PP:¸“Eðö§(\í!c?\Ð\å¿ð{\Å\Ík\Âß±ÿ\0\ì“ðN¼6úgÅ¯Ž1×¼Al¿±ø_\á]\"{(YC\0\ÑÃ«ø\Â\Â\è–Hb\à1V\0\æÝ¦\Ø\\jº†—h¥\îµ+\Û[d\0’÷“\Ço\n€9%¤‘F\\\×û\êxB\Òü/ \è¾\Z\Ñ-c±Ñ¼?¥iú.•g\Ävºv™i••¼cŸ–xcrI\Âó_\âKÿ\0¢ø&¿´Wüƒö3ø;%—ö¯‹¾;x9õ3•fÒ¼7q/‹522h£\Ó4+¹f\È\Ú\"G\'€ký¼h\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯\Î/ø(\ï\íiqû:ü.¶ð¯‚µmñW\âb\Þiú5Õ´\ï\ç„ü5~^·\â¨\äŠ9\Z\rD¼\Ði>\Ý%œ\ßlº¼\Õ\ìn\Z_\ËŸ£RH‘Fò\Ê\éQ£I$’0H\ãgwv!QAff!TI\0Wñ\Ýûe|k¿øñûAx\ç\Æs\Íp\ÚEüžð­¤\ïo(Ó¼7¡O=½œòÁ\Zn·½¸k\Ígl­,‰qª\\)p0‰ýôcð\Ë\r\â,Vo‡†\'‡xN,\ß1\Ã\ÕJTq\Ø\É\Õtòœº¬Zjtj\â)\Ô\Å\â)\Ê2§[\r­†©¥u\â/§‡Žø\ï<yw\r\ã*`x\Ó\ÄLN#†òLe	8b²œ®•\Õ\â<\ë\r4\ã*Xœ>µ»^œ\ã_	ŽÍ°¸\ê›\íóó\Ïu<\×73Kqqq#\Í<ó\Èò\Í4\Ò1y%–YI$’9,ò;3»\ÌI$\ÔTQ_\ëBI$’I%d’²Il’[$Î«nM\ÊM¶\Ûm¶\Ûm\ê\ÛoV\ÛÕ·¸QE\ÄQE\0QE\0~\ÓÁ+¿k»Ÿø’\Ûömñ\æ eðÿ\0Š.e“á¶¥y>\â7Wš¼’°ŒX\ë\á´¤Ü’G­…²‰n_W‚;o\èJ¿…}\'S¾\Ñ5M7Y\Òî¦±Ô´›ûMOO½¶’Hn,\ï¬n#º´º‚X™$Šky\âŽX¤\Õ\Ñ\ÑYX\rg?³‡Å˜~8|øwñ05¹¿ñ‡­N½\r±„Gm\âKl5\èV&m£:µ\Äö\Ö\Ï+Iœ\Ö\á\É\'\'ü\Øú`xc…\áüó.ñ\'\ÃÆ†‰\ë\ÔÁg´iG–<þ7^–5%\î\Å\æ¸XV•h\ÅFø¬lDÜª\â\ä\Ï÷ökøñ\ãÎ¼\Z\â\\lñy¯\á(fœ%‰¯>zõ¸>½x\á1\\¥/\ÞTf5p\Ð\Â\ÊR“Ž5\Âà©ªt2\êiû}Q_\Å\Çú†QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0þx_ð|\Äû=S\â\ìðz\Úò7¼ðw‚¾>|@\Õì”ƒ,+\ã\Íc\á^…£O2˜,‰\à=]a\ÜH\âR›rû¿\Ðö¿\Êþðñ\ÝßŠ¿à±ž5ðÌ·o5Ÿ\Ã/_ü+ij[1\Ù>±\á©ü{r…\î\ÆK!\ê\Ë\åö€<+þ\rlð­ß‰¿à¸Ÿ±½\ÔVOwa\á;O\Ú\Å\ZÄŠ¡’\Æ\Ú\ÛöhøÁ¦i\×r“÷Tx‡UÑ Bo:hð,¿\ë\Û_\æ…ÿ\0Uü´ñ\í¿ûK|d»´YŸ\à\ÏÀ­J\Ón™sö=Sâ—ˆ¯tÑ±º,—\ZG†uˆ\Çv‰eô5þ—´\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEó\ï\í]\â\è¼û5üqñ$’\Ë¶\ßü[cc,\åLš®·¤\\\èzC\Å&AGMOQ´`\ÊC(RT‚¯\ã-˜»31$±$’I$ŸRy5ýkÿ\0ÁF,nµ\Øÿ\0\â\ÄV\Û\Â\Ã‡n\î\Ê0B-m|M¤Lû‰#(Ò¬H\Ë\Î\à\Ø\Æ3_\É5¥ŸBœ—ñNc_Œâ·„¬¿’†)ÀUÃ§\Ö\îxüLµ\è\â†_µ+6\ÆWñw\Ãü–¤po‡‹0\Â\É\Þ\Õ1Y¿fô1²]\ZT²Œ.¾\Ôd¯\ÑQEf\æ QE\0QE\0QE\0Wôƒÿ\0yñÌš\çÀÿ\0ø*\âõg›Á^8Ž\ê\Ö\ÉbDk+ÄºdRÛ´Ž	yMÖ£¥\êÌŒø\0Dc@l[ù¾¯ßø\"Î˜\Ðxwö€\Õ\È;u\rWá½Š·b\Ú]·Ž%aø\rQOü\n¿œ~•\ØL6\'Á>#­]\'W˜pö/xÅµ‰žw‚ÀI§-bþ§\Å+\Ã\Þi¸ü2‘ý³û=3v\éOÁl#q¡›\äüi–\æv”’–Ÿ\næ™¼#$šS‹Ì²¬º\\³¼T£¥\ÍŸ¸QE’§ý…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Œ—üñ~8Ábn\ïÁuö»-/\ãü6\Ó\ä$U´øG\áO|0+)+µ\'ð”\ãh\Æ\ÒJ\Zÿ\0f©%Ž\äši(¢F’YdeH\ã³\É#±\nˆŠ31\nª	$_\àÿ\0ûQx¼|Aý¦hŸ¬\ßh_üuø¹\âõ¸·ž<K\ãÿ\0k\"mÇ–óE\îý\Ý÷f€?ºÿ\0ø1\×\áÖ­a\àÿ\0ø(Ÿ\Åk\ËFM\Ä\Úÿ\0\ì\Ñ\à]ð¡5÷ƒ\ì~8k~\'…$<?—Œ<.YT|„\Ä\î½JþZÿ\0\à\Ð?‡þÿ\0‚Bh>3X•nþ,|zø\Ç\âi¥†–\×ÃºÍ§€mC6\ï.o^‚@\r€s¸\êR€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€>pý¯¼?\ÄÙ\ãw…­\êK\ëŸ\0\ë:¦od]^j~\ZDñ6›§Â 1v\Ô/ô{{˜;\Öá—½\Z\äH ‚	 Ž\Ç\ÜW÷i,i4RC*\îŽTx¤\\‘¹$R®¹RÊ’2#±¿Ÿ\Ú\Ï\à\å\ÏÀ¯Ÿ¼\0\Ö\ßg\Ò\íu©õO\rmVX¤ðÎ²\í¨h¦-\Í\Ü\í“-‹K<¾l³\ÚN\åW\î\ïß¡7QŒ8Ë‚«TQ¯:˜N&Ë©6¿{He™«W·½O“)vWrŒ\ç-6\Ïñ\çö§ø‹•_¼R\Â\á\ÝL%:\çXˆ¦þ¯S\Ú\Ô\Ïxv2²iS¯\í89Ë–1©N”.\åZ(ùÂŠ(¯\ï³ü}\n(¢€\n(¢€\n(¢€\nþ‘ÿ\0\àŽ\Ú\rÍÀk\×²Á»ñ&\â\Þ\Îy#(—¶š>‡¥©žÝú\Øc¼¿¼¶.8Y\àž?½Wó‹¦\é÷z¶¡e¦XA%\Õ\î¡woegm[‹›©R ˆ1U2K+¤q‚F\çeæ¿²Ÿ\Ù_\á\"ü\rýŸþü5tt\ÔtO%\æ¼%H\ÖUñˆ.n<A¯\Ã#Dò,Ÿc\Õu;«d\ÞÛ­­`\Æ\ÕWù\é‘\Ä\Øl³ÃŒ\róÁ\ãø›<\Â\Êy­8\åù:x\ÜV\'•n¡Œyu¥£öòiÞ™þ~\Ì\Î\Çg\Þ7\æ\Üp\éTŽQÀ\\+˜)\âT/Ny\×[)\ËðNOD\êeŸÛ˜¶\âÜ¢ð”\ã$£V\ç\ÐTQE˜\'û\ÔQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0|Ÿûy|Y‡\à?\ìGû^|h™¤Að·öjø\Ûã˜Œ;„\Æ\ï\Ã|E©Ø¤;~o6K\Ëx#ˆ/\Ì]”/\ÌE…\äó\Ës<\×1y®%’y\\õy%s#±÷fbOÖ¿\ÙOþø‘eð\Ëþ\×ûwjws˜fñO\Âøo§(`¦{ßˆ¾ \Ñ|$`‘luK\Ù@%\Ö6\\`–\ãO@\ì£ÿ\0\îü»øÿ\0gý†<¨mG[øs\â?ŠW­\"¢¸?~$x\Óâ­Œ$\"¨\Ûi¥x¿O²Œ¶_Ë¶M\ìÍ’i\ë\ç\Ï\Ù/Àöÿ\0¿eÙ³\áÕ­²\ÚA\ào€¿¼&¶\è¡DM x@\Ó%\0ö–\Ù\ÚC—f=M}@Q@Q@Q@Q@Q@Q@Q@Q@~MÁX~ø[ÆŸ­þ3[K\Ð<kðÑ¡²€\êz…½Œ~-ð\æ¥wûÿ\0\rÚ­\É_´\ë–W“6«¢Cn\é5\Ä_\Úöf+™nlþ\Í÷—\Çÿ\0\Ú\á\ç\ì\å\àk¿\Zø÷RX¾Ya\Ðôy#:Çˆµ%M\Éc§[»T¦\êòM¶\ÖQ2wE\åsö¢ý«~#~\Ô^1}o\ÅWa\á6y‡…|g4¿\Øú³¢Q*.µ)£ö­Ft7Ÿ•|˜vñT}<2\ã|÷Œrž9Ê±2\áük–+8«I\Ê9´T]<fI\Ã\ÉÁbã‹¡9á±µÜ•&\êsK\n4eþ}ý=|xð«„ü3\â/	¸ƒCŒ8ÏŒr¸\Ç\ÃXlDiÏ†\å\Ï\Zùg\æ\Ø\ÈF¬²\ÙeØºT±¹^\rE\âój´•Nž[SŠ¥ò\í\ÒøKÁ\Þ)ñ\æ¹i\á¯h:Ÿˆõ\Û\â\â\×K\Ò-&½¼›Ë\å}@Ž\í¶8\Ý\ÎùU@H\Æ\Ô4û\í*ö\çNÔ­\'±¾²žKk»K¨ž‹y\áb’\Ã4Rx\äÁWF•Wú”±w^xU^‹\ÅS¥\nõ0Ê¤xP«)Âi\ÑRö‘¥RtªBT\'*sŒ[p’_\à#Á\âã„§–\r\\E\\%,k¡Ua*b\èS£Z¾ž%\Ç\Ø\ÏF–\"…Z´#7V:ôg8\Æ5`\åNŠ(­Ž`¢Š(\0¢”H\0IÀ\0Iô\0u5ú?ûÁ=üuûC\ê\Úw‹¼wm©ø+\àÝ´\Ñ\Ü]\ê\ÒF-u¯G:g…a¹ÀŠ\çUÆ½</cew·Kû¤[Fùž.\ã\àl“\ÄO™P\Ër\ì,[\æ©$\ë\â«r¹C	‚Ã§\íqxº\Öj–Œe9k\'\Ë\Îqû¯|6\ãOø§/\à\î\Èñy\æw©\ì\èA¬.\çU\ÌsLd—\Õò\ì·\rÌ¥ˆ\Æbg\nPV„\\\êÎ9û7ü\ËöKºñß‹“öñ¾“*x\'Á·‚ ¿µ–8|M\â¸w\êV¾qX¯´a\ãšAö·\Z\Ã\Ço\r\Ê\Ü\é\Z„ýV†|3 x3\Ã\Ú7…<-¤\Ù\è~ðök¤\èºE„^U¦Ÿ§\ÙÄ°\Û\ÛÂ™f!Ay$gši\Ë4’J\î\í¹_\ãç‹ž&\æ~*ñ†3ˆñžN+‘\ån|ñ\Ërª3”¨Ò“^\ìñU\ç)\âqµc\î\ÏVq§j4\è\Âô©ôqð#\"ú=øk–ðNYVža›×¨ó^,\Ï\ãK\ÙK<\âM*p\Ä×„¿Kƒ¥N–+\Ã\Íó\ÒÁa\éÎ·>.¶&­RŠ(¯\ÌÞ‚Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( \ä¯þ-ø›¨x+þ	W\ài²˜\ÏÅ¿\Ú\çá§…5…2xCøyño\Ç7\0 Ê¿\Û~ðò²’nI*ª\Í\Çö1øD>?þ×Ÿ²÷Àù-£»ƒ\â\ß\íðƒ\á\Ýå´±´±Oa\â\ï\è:&¡±¨bñ5\åÇ˜ ¦\áŠþ\è?\à÷ŒV‘|4ýˆ¿gøgO·_ø\ëÇ¿µ`x-4þ­v^¡\ÚÞ»\Zž70q\Î\Þ?•oø7\ãÀ\Ó|@ÿ\0‚\Ê~À\ZDV²]&ñ\Æ\Ï\Ç7#2-¼?<;¯ø\án¥À\"8\á¸\Ð Ä€²4|\äŠ\0ÿ\0f;Khl­m¬­Eoio\r­¼j0±\Ão\Z\Å(\0‘¢¨€X¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+\ä\ßÚ¿ö»øwû+x9µ_HºïµhgÁ\Þ±¸E\Ôu‹\ÄB\ïQ“\æþ\É\Ð-e(oõ9QÜ¯ú=…½\å\ã¤\Ïÿ\0lŸÛ—Àß³‹q¡i²\ÚxŸ\âÎ£fÍ¤øbVXtA<g\ìÚ¯‰\Z6Í´<‰mt\í\Éw|¸ˆm	¸?Ë§ÄŸ‰^3øµ\ã\r_\Ç^<\Ö\îõ\ïkW\r5\Í\ÝÜ…\ÄQ\äùV–±ñµ²½´)1 h (þ¯ð\è\áñ®Šx¾Ž\'-\àªs\\6ß¡Ž\âguO\r-*a²¦Õ±øÚ¦\"7¡jR–/\rþx}/þ›\ÙGƒ”qþxkˆÁg¾)V¥:†9{<^SÀŠ¤ö¸\Øû\ÔqüE\Ë.l&O\'*8râ³„\á\Z9n?¨ø\ßñ\ß\â?\í\ãmC\Ç?µ©5û§t°\Óa2E£h:~öx4Ä»¥¥•¸l—¸¸}\×s\Ü\\\É$Í“ð‡\á¾9x\ëGøyð\çCŸZñ¯!$ŒÅ§\éV•7ºÎ³|\Ã\É\Óô«\Ø=\ÅÌ§.\í¥¬w\×6¶\Ów¿³\ì\Éñ+ö˜ñ”ð>š\Ñ\éÐºI¯ø¢ö9SD\Ð,w%\Å\åÊ©.\Ý\Â\Þ\Î\"nn\åT(q#\ÅýP~\Í³\Ã_Ù‡Ái\á\é\ë>¯¼¾*ñ}\ìQ¶¹\â[ø“\ï\ÜN6\Úm¼/ön“}–\É\Øù\×r\Ü\ÝOýk\â÷¼)\àžGC†8o	—\âxšž\n|Ÿ‡0‘<»#\Ã((\áñY¬0\î.…\ÅûJJ¬sW\ç¡Jr\ÅGü\èú7}<BúTq^/Žø\Û2\Îp\\[6«‹\â~6\ÌgR¾u\ÅXÿ\0kÍË¸z®25V/9^Ž/5«\Z¹~R<^&”2\éñ²_\ìqðóöYð¼P\é‘A\âˆ:²x\â\ê\Ù\åÄ²$f}?GVM;FI@¬g¸P¯w$„*F\Ï\Ú+öøûIu_ø~\rxÝ•|¿x2X4vržk,zÍ¼–\×Z>¿’H¢yõM:mY`-\ìu[¯±h¯ó>^\"ñÄ¸¦¿\ZÇ‰óz<O‰ª\êVÍ¨b\êP¯(¶ŸÕ¹)8\ÑúŒb•8\åþ\Ë\êQ£\ÑT=šQ?\ÝJ^	øQO\Ã\ì\'…r\à.\Äp„h\áøs—\Ò\Å\áaR)\ß\ê\×U1r\Î\'RS\ÄT\Î^#ûVx©\Ï,c¯\'Qÿ\05\à‘Ÿ<%=\Õ\ÏÃw@ø—¢Áf\×*I_\rkòN²\Ê\r”z=\å\ÍÝ´Î°]$‹Us3´ˆ!B‹\æ|Q¬~\È?µ&‰rö\×³\ï\Åùš3ƒ6™ðÿ\0\Ä\ÚÍ¦?¼/4:ö\Óo©ó°>•ý•\Ñ_\Ðù\Ó+ÄŒ·\Z\ÖW\Ã\ÜG(F1Xº¸z\Ù^2£[Ê·ö}H\à¥)Ó¬\äq‡\ì\ÇðC;\ÆT\Åð·q§Â¬\å/\ì\Ú\Ü.–Q\æwP\Ãÿ\0lP©š\Æ\Ö\Ë›be¯\Åd’þ0´Ÿ\ÙköÖ¯NŸeðK\âzÞÀ[\Þø\'\Ä:tŒS\ïú}¸m¤ƒØšúW\á§üÿ\0ö¯ø‚\ÖW\ZŸ…t¯‡\Z=\Èi$Ô¼{«Å§\ÝD‘\\f‹þ\Ý2=WÄ±\Þ2+\Íiþ“aip¾Yk\ècH?ªŠ+»8úiñö.„¨\äü7\Ã9=I«}j²\Çæ•©\é+Ê”jbp¸e;¸¸{l=hG•©B|\É\Ç\Ë\á¯\Ùu\á]‹§‰\â^8\ã¾%¡NNO/\Ã<Ÿ \Â×´ \ãORŽŽtùUH\ÔXlf¬¹\á(V¥\È\ÕO\Ì_\Ùûþ	mð?\á,öú\çg“\â÷‰\í\Ùdˆ\ëv\éþµ–)Œ±K‡’{Æ¸ua©_\ÞÛ³\Æ\\[®\í«úk0\ÛC½¼1[\Û\Û\Å0Ak0\ÃŠ(¢Œ*Ghª‘ÆŠ¨ˆ¡T\0\0©h¯\æ-\ãŽ,\ã¬\ÃûO‹3\Üvu‹2£õ™\Æ8l,fÓ•<\n„i`ðT\ä\Òr†…(É¤\ä›W?¼¼9ð£Ã¯	2o\ì¸K)\á|¾n\ÄýF”\êc³\n”\â\ãN¶iš\â\êb3LÒ¼\"\Üa[0\ÆbjB-\ÆŒ}Ð¢Š+\å\ÐÂŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( óÿ\0ƒ\Ô|cwªÿ\0ÁL¾x1n\é~ýŠ¼	¨-°$˜u¿|hø\ï&£#|\ÛG¥i^\n»bÌ¬<\çþ\ßø[a\ã\Ïø*÷Š|a©Y¥\Êüý”þ(x\ÛJš@\Øõ\ígÆŸþZ\ÏAý\é\Ò<a®Ä a¶;°8R\Èðs\Ç\ÆûŸŸðX\Ï\ÚQd¸I\í>\Ã\á_‚\Zb\Æ\á\Ò\Þ\ßÀ–\É{o\Ç\ë®k\Z´“\'UšI7|\Ä\×\íGü\rð³RŸ\ãO\íÁñ¶[4}3\á\Ãß…–:‘S†Ôµ\ß\Í\â\ÝV\Å\ÊZøwFžU8xI­\0¢eQ@Q@Q@Q@Q@Q@PN9<\É\'µ\0ù_ûwÿ\0ÁC4º‡\Âï„·6Z÷\Æ\È$·\Õ5Uh®ô‡J‹‰\î\ã\Û$:Š$\É\Óô‡ÿ\0GÓŽ\Ûý`:-¾™¨ù\í\Ïÿ\0+²ð\Ê\ë	?g­Z\rG\Ä\é:g‰þ\"\ÙH³X\è\î3\rÆŸ\á[„-\å\êñÏ­F\Ío‚škM 7?÷\××º\íÞ£¨\Ý\\_\ê\×]\Þ\Þ\Ý\Ê÷WwWdž\â\âyI,\Ò\È\Ì\î\îÅ™‰$\×÷\'\Ñÿ\0\è\Å[5–|IÀÎŽT½ž+&\álT%N¾d\î§GQ’S£—m:9tùj\ã½\Ù\â£\îqŸ\äÿ\0\Ó\é\åC‡\ãšø[\àvkO\Ä½\Ëø£\ÄHV\Â\ä{\Ó\Ä\å\\+ˆƒ•<NsñR\Å\ç”\ÜðùO¿K-•\\\Óý¯*¿\âk¾,Öµ/ø›V\Ô5\ÝwX¼žÿ\0TÕµK©¯o\ï\ïn\\\É=\Í\Õ\ÕÃ¼²\Ë+’\Ì\Î\Äö\è\0¯©ÿ\0d\Ø\ï\â\íS\â\ä¶Ò ŸAøy£\Ü\Åÿ\0	‡.\í\ß\ì\àIý•¤†\Ø5_]\ÆG“cì´‰\ÖóP–\Ú\Ü\ÄfõOØŸöñ_\í\'«A\â¿G¨x_\áp¦÷X0˜o¼I,.<\Í+\Ã\Âe\Ú\åˆ1\ÞjE\Þ\ÄnUÝ&?\é\ÓÀ^ð‡\Ã\ni	ð.…c\á\ß\rh–\ëoa¦\ØD#AÀ2\Ü\\IÌ·W·/™®\ï.K‹™™¤šFcšýsÇ¤v]\á\å\nüÀ\ï	\â\è\Ñú­|E8S©–pµ5\ÅÒŠö8ŒÒ”,¨`,ðø6£<ld °u¿œ>ˆ\ßBl\ïÆŒVÄ¿a˜\åž\ÔÄ¼~^­z\ïˆ_k:¯6±X<ƒW™\ã3Žx\ãs5)\ÓÊ§U\æxns\à\ïÁ¿|\nðF™\à‡š4ZV§¢´\Ó¯¨j×¥BÍ©j·aU\î\ïg#,Íˆ\â\\Co0\"F¾§Eþecñø\Ü\ÓŠ\Ìs,V#\Æ×©‰\Å\ã1Ug_‰\ÄU“JÕª\Ôrœ\ç96Ü¤\ß\Ü»¹>O•pþW—\äy]ƒ\Ê2|«	C–\å™~–Áá ©\Ð\Ãap\Ôc\nThÒ„TcE%\ê\Û\n(¢¹H(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(\'\0“À’x\0¤š+Ç¿h\Ûü*øñ\Ë\â…\Ü\Ëmkð\ß\à÷\Ä\Ï\Ü\Ü1\ÂÁo\àÿ\0k~!šf9X£Ó™\É\ÈÀ\\\æ€?Åƒþ\n«\âdñ—ü\ëþ\n%\âh/F£g«þ\ÜµMÆ—z³ý¦9´dø\á\ãˆ4_\"pÎ²[¦•œv\Æ6ò„	ˆÂýøÁ•¾\n]#þ	­ñÿ\0\ÆòÛ¤w~1ý³¼g§A?”Yô|ø%·\ïq¹\áMSV\ÖQqT‘f f\'ü\Ð|u\â‹\Ïø\ß\Æ>4\Ô$y¯ü_\â¯ø¢úi	2Ky¯\ê÷š­Ì’’]\æ»vbI%‰\Ï5þ·ðk¯À\ËÏÿ\0ðG?\Ù\íµ+wñ‡XñŸ\Ç2~[?\ßZG£±\È\Ãhº6œ\É!\Îø\Ê;v\Ðô-EPEPEPEPEPE\Ïø¯\Å~ð7‡5x¿Z°ð÷†´)ucY\Ô\ç[{+H°’H\Ù,ò;$6öñ,—W2\Ãkk\×E\éFlEjX|=*•\ë×©\n4(Q„ªÖ­Z¬”)Ò¥N\nS©R¤\åB‹”\ä\Ôb›i\âq8|¾3^Ž	…£WŠ\ÅbjÂ†\r‡¡	U¯^½z²*4hÒŒªU«RQ…8FSœ”Sf½\åå¦Ÿiss••œ\Ü\Ý\Ý\ÝJ–ö\Ö\Öð¡’i\çžVX\âŠ(ÕžI•QAf \nþz¿oø(ý\çŽ\äÖ¾\nü\Õg°ð0óô\Ï\ZüB³&ÿ\0\Æl£¹\Ñ<12þûOð 	²ÿ\0V\â¿ñ)y,\àžIŸ\Ä~CûoÁC<Kñþ\çQø{ð\Ö[ÿ\0|!‚y-\ç\É6\Ú×\Ä2ü—š\ÉF-i¦HcYm4To‘H“Py\îJGgùR\Ï,p\Ã\Ë,®±\ÇjY\Ý\Ø\áUTd’IÀ¿Ñ\0>Œt²‚\ão°”±\Ü}ž/&\áª\ê5p\Ù<´©K›EÞž#4†’¡ƒ|\Ô2\é%V¯µ\Ç*kþ\'ý0þžŽ0Y¯…¾	\æ5ð|)?m—ñ7aeSŽ\âh;\Ò\Äe|;QrVÁpýE\ÍK™.L^w*u‡\Ê]I\æ\ì\Ë3wf\'Ü’­~µ~Áÿ\0ðN­[\ãúoÅ7º\Â\È^+¿øvO6\ÏXñü±¸e²m;ÂªW^—z±&8\Å{ôö?\ØKþ	±-\ãh¿hM%\á²V·\Ôü-ð\Þþ“^\ãlÖºŸŠ\í\ä\à´\'d¶ú,Š³\\®QH£o²·\ï40\ÅoPApAi0Â‹P\Å\Z„Ž(£@©q¢„DE\nŠ¨\0\\?H¤\ì2\ï®ðW†¸øT\ÇÚ¦:\â¼,\Ô\é\à^°«\È\ê\Æñ©Œ\Þó89S\Â\ë–*Øœ/«ô9ú\Ô\Îÿ\0²üRñ\Ë)©C&ý\Î?…ü=\ÇÒ•:Ùº´j\á³^+\ÃMFt2·\î\Ô\Â\ä5c\ZÙ»<\Ò4ð\Ø}\rF\Ò|;¥Xhz›e¤húU¬6Zn™§[\Åieei†\Þ\Ú\ÞX\âŽ5\0U§$“ZtQ_\çœ\ç:³J“•J•%)Ô©99\Îs›r”\ç)7)JRnR“m¶\Ûm¶³´©R¡J\n©Ñ£Fœ)Q£J§J•*qP§N8%S„Œ!£¥¤’AETšQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@W\Æ·\í\íû7ÿ\0Á9g\Ïþ\Ñÿ\0´ÏŒ\Ã\ÞÐ£’\Ó@ð\æ“¶¡ã¯‰>,–\ÞYtŸ|=ðý\Å\å‚\ë~\'\Ödˆ\Ç¹½Ó´]&\Ø\\k^$\Ö4O\Øj:­ \Øw·¶zmÞ£¨\Ý\ÛXiö\Ó\Þ\ß\ß\Þ\Ï­•¬O=\Õ\Ý\Ý\Ô\ï\Ö\Ö\ÐFóO<Î‘C<’:¢’??k¿ø8³þ	7û^\ëžñ§\í+¦üNñþ‡¦’ü=ø\r¥^|U\×eÕ´©¢†oÏ«\è{|¡j³™\Ù7Š<U¡i—	Œ5%w§üoþý·?\à§~%\Õ<7ÿ\0	£û<þ\Ì6÷\Ðxgö{øi\âû{]SOž\ê)`\Ô~-xº\Ö=/Rø™\âO\"\Ö\Ò<]\Ûiž\Ò\n\\Ÿ\røSH›SÖ®u_ÁbI\äòO$žôþ¿\à÷_\Ù;L×¡·øWû~Ðž4ð»\ÃO«øû\Ç_¾\Zx‚‚H¸Š?\rø||V\Óf‚<ÁñlRN\ïm­HÁ\ì|\rÿ\0²~\ÂzµÍ­¿\Ä\ÙKö¨ð\\sÈ‘\Ü^øzo…~8´²V 4Ò­ÏŒü},QŒ³{)g`>HXñ_\æ“E\0´÷\ìyÿ\0»ÿ\0‚^~\Ýö\ÞøûYø\ç\Çw	¤\Æ>|GµñÁÿ\0Í©\ë,cµÐ´M#\â~‘\áX|k¬$\á­\ç·ð\ïŠ\âI²\ÜI‘K\'\ê\Õ€ýö—{k¨é·—Zv¡cqÝý\ÄÖ—¶wV\î²Áskunñ\ÏoqŠ²E4.’Fê®Œ_\Õ÷ü\Ëþ‘ý¤?b_\Â¿l\íC\Å´§ì¢‚=\rv\æe\Õ~8| ±K=6\ÃK¹ðÖ³©]@ž:ð¦’º{ý·\Â>!»ƒY#T¾\Õ4¿¼\Ö6\ÞÔ€?\ÔÂŠòŸ¾~\Ò\ß¼ñ\ã\àGt‰\ßþ(x~\Û\Äþñ¿†n^\ãKÖ´«‡–\ÞTx§Ž\Þÿ\0K\Õô­B\ÞóEñ‡u‹M?\Äñªxs\ÄZf—®\éz†Ÿm\êô\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\æ\çü#\Ç\Ú_\Ã_ø%OüGÄº­É´Yÿ\0c_\Ú\'\Â\Údª@c\â|+ñGƒ|5\Z\îeÿ\0Y¯kºz°S¿am€¾ý#¯\æwþ\Õø¡yð\ãþ\åñL°¸{yþ+|døCð½\Ê;!š\Îþÿ\0Yñv£n\ÅH,“i\Þ\rºWCòº\åXH òi<’x\0w¯öüÿ\0‚SxE¼ÿ\0\Äÿ\0‚yxNX>\Íw¤~\Å³z”%v\Ö.¾ø6ûYÜ§\ÇUº¼f\ÏÍ’s\ÎküW>xo‹>|,·P\×þ,ü9ð\n\Ù\ÃM\ã/h\Þˆp_QPp	\Ç@kýÚ¾x2\Ç\á\ÏÃ¯\0ü=\Ò\Ò8ô\ßø+\Â\ÞÓ£ˆm‰,|/¡Xh–‰\Z\àb5·±P`a@(µ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šðo\ÚöŒømû5x\ZüB\Õ9.>\Ñm\áŸ\rZ\Ék\Þ,Õ¡‰dþ\Ï\Ò-X–ò¡ó!}KS•E†•±Iw(’{H.}«*Ì³\Ì\Ç”døNe™\æ\á†Á`p”¥[ˆ­=¡NœSn\É9NNÐ§N2©RQ„e%\ãñ\ä|)’f|IÄ¹®$È²l%Lviš\æ5\á†Áà°´’\æ«Z­F’¼œiÓ„yªV«:th\ÂujB\î>\'üRð/Á\Ï\ê¾<ø‹\âOøoHˆ¼\×W%ž{©\Ø#O\Ól\âs¨\ê7l<»[+H\äžV\É\n]\×ùgý²m¿~Õž$ûý§Â¿	4+×—Âž‚\åÉ¼š#4PøŸ\Å\ÒFþN§\âI\à•\Ò\ÞLðõ¤a¥¬·3j\ÚÎµ\ç´\ç\íUñ+ö ñŒ¾ ñ…\ëXx~\ÊY“\Ã°¹œ\è~²fùDQ¿–/5	QP\Þ\ê·-\ÕÜ€q\r´vö¶þ\à¯x§\â\'‰ôx3D¿ñˆõ\Û\È\ì´\Ý/N\î.\'šCÔ…b†$\r5\Å\Ä\Í½´\Éqq,PE$‹þžxôy\Éü/\ÂG‹ø\Êx,o\Ã\r,K­Zt\ÞUÂ˜uIÊº\ÂÖ¨\Õ\ã¡Ocsiµ\n4Ô¨\à:>\ßŒÿ\0þ–Lþ&ñó1©á¿†Tó\\¯\ÃZ¸\êxapÔ±\âñ’¯\nxIfj	\âieu1\Í\å\\9N2­‰«*x¬\ÕVÅ¼&+\ÂÓ´\ëýZú\ÓL\Ó,\îu\rBþ\â+[;+8d¸ºº¹\Ö8`‚•\ä–YdeD™™‚¨$_\Ño\ìÿ\0\äÓ¾C¥|]ø\é¦\Ûj\ß\æH/ü5à«¨\ã¹\Ó<\nÙ ¾Õ‘·Ã¨ø¬$5ž€Gi\Õ6Í§ú\×\ìMÿ\0þð§\ì\écc\ã\Åaâ¯Œ70,Ÿk(—ZGƒ<\Õ\ìô21\çj)“Î¶Ê²1\Ìv+o\æ—ô’¿	ú@}&ªñ\Z\Æp_‡x\Ê\Ølº˜lãˆ¨¹Q\Ä\çqø*`ò\Ù{µp\ÙTµUñ\æ#1\î\ã\ì°N¤qŸÖ¿CŸ –‚žYâ‡9n\Å\éQ\Çp\Ïb£O‚\áZšU¡™ç¼ðø\î\"§\î\Ï‚j¦$¨½¼\Þ#4\å…Q_\Å\'ú–QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0q¿> xC\áG€|kñC\â·i\á¯ü;ð§ˆ<m\ã_š/†|/¥]kZÞ§p#W‘\ã²Ó¬®\'1Ä’M.Á1¼®ˆ\ÇþMÿ\0cø¥ÿ\0Yý«5ÿ\0\êzŽ¥£ü\0ø©jþýþ»ˆ\ìü1\áž8¥ñ­,b\Ô<a\â\Ói£¬jR*˜-þÇ¥\ÚEo£ù\ßÛ‡ü3ûo\ßüýƒþ~\É^\r\Ö\îtŸ\Z~\ØˆñjCg¼]|øB¶^$ñuŒZ˜M*ûSø©|&·\Ì$º–‰t¹D–7W‘¿ùƒPEPEPEPõ\'ÿ\0\ÈÁcüIûþÓº\'\ì³ñ\Æ\Øÿ\0ö–ñu–“¨\Ù\ëWÏ£ü$ø¹­-¶\áßˆú0&FÑ¬¼C4:_†|v–±›MF\Ähú®£	—\ÃÖ·–¿\ê\Å‰*$±:Iˆ²G$l$G‘\ÑÔ•de!•”À‚	¿À, AA‚\èA\èký‘ÿ\0\à\Þ\ïÛ“Rý¾\à–\0>(x¿V}g\â¿\ÃHõO\Ù÷\ã%\ì\Ò\Ü\\\Ý\Þøó\áJiövZ\î£y=½´wZ·~\ê~ñö¯ö(…Ž§â«½*Ý˜X1 \Û\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nþ-ÿ\0\àö/‹ú^‹û\r~\Ë_\Öx\×_øƒûQ\Ãñ)`\Ü|\çð\ï\Ã…¿¼?~B†\Émc\ân†\ÌÌ¤ùF›?\ÚEœ?ü\ïã»‹\ÏÚö%ød&?eð\çÀ?ø\í\í\Ãyþ4ø‡\'‡ã™—±òü\"#wù\Çj\0þf¿\àŸ\â?üCþ	\ã\áx¢i¢\Û#öv\×5\Ö3&\íÂ¿ü1\â`2€p¦h÷J\ì~TV,\Ü_\í»_\ä»ÿ\0›|)\Ñþ(Ác~\ßkVyÂŸ„ÿ\0>+Y*\à,\ZÆ‹§\é>Ñ®\äÜ­ò\Ûj>+·‘q†2ˆÀe\Îkýh¨\0¢Š(\0¢Š(\0¢Š(\0¢Šü÷ý¶?o/þ\Ì:\\þð\ÛXø¯\ã>§e\æXx}eI´ÿ\0Áu{]k\Å\Æ)‘4±È·:^†¥/uü»©Í¦›,7?GÂœ\'Ÿñ¶yƒ\á\Þ\ZË«fY¦6V…*k–\ZQk\Ú\âñu¥jx\\%%*ØŠÒ8\'\Ý\Îp„¾\'\Ä?8?Â¾\Ìø×Žsœ6GepN®\"»r­Š\Ä\ÍK\êù~]……\ë\ãó,d¢\á…Áa¡:\ÕZ”\í\ZT\êÔ‡ª~\Õßµ÷Ã¯\Ù[\Â-©k\îºÿ\0õKy?\áð\ÜP\êZ´ü¢^\ê2‘!\Òt%\Ç\Úõ)!–G\nð\Ø[^\\ƒÿ\0*\ß\Zþ7üGý <u¨üAø™®É¬k7Ÿ¸²´…^\ßEðö•³\Ú\è~\Ó²Ç¦i6›Ù’ ò\Ü\Ý\\I>¡©\Ý\ß\ê—w—\×\Ç\Äˆ~2ø¥\â\Í_\Æþ<×¯¼E\â]n\å®/µ+\çVv\É>\\\Ç\Z¤6Ö¶\éˆm­m\ãŠ\Þ\ÞH¡‰#UQ\éß³\ì\Ûñöšñ\Ü>ðŸ‹[_³\Ýx£\Ä÷ˆ\ë¡øSIšFAªN¸\ß4\æ9“M\Ó`&ûSž)R\Ý0^\\\Úÿ\0©žøAÁ¾ð\æ3ˆ³\Ìv®{­\Ä<Wµ,._†J2©€Ê½ª\ç\Ã`UNX9(¬nk_\ÙûXÿ\0º\à°ÿ\0\à\Ò\é%\âw\Ò\ãò\Þ\áL«7\Ãð\\\Ú^ðó+\æ\Äcó|sr…ßˆ>®ýž;6•/iYFRy_`ý¼hT\Ó1\Íq¼7Â„ž>ø\Ù\ãM+À_´½\Ä\Z¬Ê‹*R\Ò\Â\Ûr‰õ-Võ‡\Ùô\í6\Í	–\êò\å\Ò(\Ñp7H\Éÿ\0Sÿ\0±\ç\ìa\à_\ÙS\Âhcž&ø£­ZF<aã§¶*Ä¹¾…á¤|ý7Ã¶’\\‘\îµ4K¨jKzv›\è?³_\ì¿ð\Óöbðd~\ZðE€¹\Ö/\"¼Q\ãø¢:\ï‰/#‹\ÜJ£º|R3ý‹K·+kj„\çNdžO£\ëø\ÏÇŸ¤^e\âMZü5\Ã2\Ä\å\\F­ª\'\ÍG\Äs¥$\á_1IóQÀFqU0¹m\í)(\â1¼õ\ãB–ý9ú\"}\nrOðøN9\ãºx ñ[‡½VSÁ4±J®&”\ãË‰\Îe	:8üõE8A\ÔÁe~\Ï	<V\'2(¢Šþ\\?¿Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ó:ÿ\0ƒ\Ù|s«jðPo\Ùc\á¬\Ò¡xKö6\Ó<s¦Ã“¶=[\â\Æß‹úµ(^€\Ëgð\Ã@V=XB ý\Ñ_\Æe]ðz.§%ÿ\0ü_\á\r£\Û\Å\nh¿°\ÇÂ6)c¸i\Þ\ífø\ÙûF\ë\r4ñ›xEœ©&ª\Ö\Â\Õd»\r^…k³kmü‹\ÐEPEPEP_Ý¿ü\áû|~\Íÿ\0³Ÿ€?l‚Ÿ´—\í-ð\Ã\à¤^&ñ·\Ã_ü5\Ò>1üOð§\Ã\Ï_Ü®¯h.—\Â\Ç\Åú®“g{­\ê|65˜\ìg–\à\Ùhús\ÏŠqü$Q@\ïmðû\â\ßÂŸ‹ZTz\ïÂ¯‰¿~&\è“ –g\á÷<7\ã=*X\ÉÀ’=CÃš–¥h\èO\Öb¹\ï^…_\àc\á¿x\ßÁ·w\áø«Â·Hr—>ñ¯¡\Ü!\Îr³iw–²)\È†Šú\Ï\á¿ü»þ\nðŠ\îÏ‡?¶÷\íS\áf¶\Ù\ä\Ú\Ùüuø‘s¥¨Œ†EmQñ\r\æ‘\"‚\0)%“«/\ÊÀ¯þ\ãtWù|6ÿ\0ƒ£ÿ\0àµ¿4\Û]\'þ\Z³Nñí¡ÄŸƒ¿|Q©J\0mÖ¾<a\â Bò\Ó\ê²>I!Á$\×\Þÿ\0\àó\ßø)„e´O‹?¿fÏŒ0ºý¬\Ù\è(øo«\ÞD!o´}Y\Ó-§aÿ\0-SAx\ä[cŠ\0ÿ\0Oj+ø/ð‡ü\à[…³Ç¿ðNi¶\Ô.ü!ûKhþ#RøQq5žŸ¬üð±\n[{\Ãm>¦\ÅF\Ø\Þ\íˆ2Ÿ\Ñ?‚ðx‡ü³\â$\Ð[|T²ø\çû>¼Šžu\ïŠ~j<\ÒmÝ¾øi¾/Šuy3Õ¢\ÐÙ˜r©Ÿ–€?«\Ú+ðÿ\0ÁŸðr/ü/Ç·°iú\í\ç\àk[«–U„x·\á·\Ç‡ðbªª÷ž<øW\á»8‰,8–\á1\É<+úqðsö¸ý—ÿ\0hKX/>üøKñB+˜ü\Ø#ðwŽt\rbñ\Ónò\ß\Ùö÷¦ýv¯\ÌÁí”¨p4ôEQ@Q@Q@Q@Q@Q@Q@”ü\Íñ²\ç\â¯ü\Æ^2Ó¿gß‚~i\è¥HY57Røµ©±\Û\ÑÎ£ñ:x˜?\Î\n	\Úõ~¯ñxÿ\0‚óø\×þ\ïø,Gü#^[•¼Ž\×öˆñ/„b$\Æaøc¥x(\ãu,¥!O\rˆ—iÀ	@¹ðe\Ã­cöòý§¾.I§\Ï&™\à_\ÙV÷Áqj@²\Ú\ë>?ø©ð\ãS‚ÕO´\Ü\éž\Õ,\r\Ân@bú^Wðýÿ\0Cø2+?\Ù{ö\ßø†m#ø‡\ã\ß\Ãÿ\0%ñˆy\Íƒ¾É®Ih³»\ËGñ\ÔS<JB\î‘;þ\àh\0¢Š(\0¢Š(\0¢‚p	<\É\'€\0\êI¯\Ã/\Û\Çþ\nU“\ë_g]efºCq¥x\Ëâ†›+ ‘I†\ïFð=\äL¢Y‡†ó\Å3Ã\Ñ\èrH\êg\ï|:ð\ã‰üN\Ï\éd<7„u\Zä«˜\æ5”¡—e9K–X¼uuÊ´’£B\nXŒUD\éÐ§6¤\ãù^7p\'€üˆ\âþ8\ÌU(\Ë\ÚP\ÉrL,©\ÔÎ¸2Œ9£—\å8I\Î¤—4%‹\Å\ÔpÁ\à(\ÉV\ÅÖ§SU=»ö\ëÿ\0‚Š\èÿ\0mµo…Ÿo¬µÏ‹sE5–­\âXo´_‡fE\Ø\í±Ä–š¿Š\ÑY¶œ\âm?I˜-Æ²—\Z\é\ÍÎ³­jþ\"\Õõ-_Ô¯µoY¾¹\Ôõm[Sºš÷QÔµÙž{»\Û\ÛË‡’{›«‰\åši\ä‘Ø³1\'5Fyæ¹š[‹™dž\âyY§™\ÚIf–F/$²\È\ä³\É#’\î\ìK;\ÌI$\×\èo\ìGûø»ö˜\Õ ñ—Š\ã¿ð§Á2ómÖº\Ñyþ/¹´ŸmÖ\áDš(\Þ7¶\ÔõÂc§\Ë\æ[@nõg¶·ÿ\0Qx[„¼9ú8p6/0\Å\â\è\á\Ô)Sž{\Äx\ÈCûS<\Ç(¿eƒ\ÂQ‹•GOžnQ…s8óÕ«*µž+?ð+üFñ·\é¹\â¾]“\å\Ùn\'*•\ëS\á>	\Ë*\ÔY	\åNpŽ\'2\Ì15:\np¤\é\Ô\Ï8“09×’§‡¡\nh\åùe/*ý“?c¯ˆ¿µO‹\ÓFŠOøJº€x\ÃÇ·–\ìö:]»~ñ\ìt¨Y¢þ\Øñ\ÌJV\ÓN†EŽ\"\és¨\ÜZY5¿ªOƒ>üð.™ð÷á¦‡¢X-\ÝÔ‚)µŸjq\Ý\ë\Þ\"\ÔR[S\Ö/|´ó§1\Åoo\nCa§Z\Øé––vVýO<\á†~\Ñü\àm\n\ÇÃžÐ­R\ÓN\Òôø„qFªù¦s™n¯.3]\ÞÜ¼·WS³\Íq,’1c\×Wù\é\ãWŽ¹ÿ\0‹Y—\Õ\ã\írŽÀ\×sÊ²T»­8\Þ0\ÌsyÁòb±ò‹~Îš¾NNŽJ¤±¬Oû9ô\\ú%ð\Ñ\Ó$X\Ùý[ˆüI\Íp±§ŸñuJŽœ\ÔgS$\áºuc\íp=9\Å{j\ÍG›Õ„q\çNŒ0x	EW\áõ¸QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEüÁ\í²Æ§©xGöCý²´[	f\Ó|/«x«\àŽ®­\í4\Èm\ì›\Ä\Ñ/Œüq¨Þ´ñ\ê\×\Ó\ßK¢x¦\Ê\Â\Þ;{‹[­.Iak´Wÿ\0=ªÿ\0s¯\Û\×ö9øsû~~\Èÿ\0¿dÏŠ>e¯‡>.xB\ãJ°\×\íbIµ/x¿M¸ƒZðO4µg‹Ì¼ð¿Š´\í+Vk3<\ê\Öv÷z-\ì‡NÔ¯#ñBý¨¿f‹¿±\ç\Ç\ïŠ³g\ÇO\ÜøS\âw\Â_xk\Ä:|\É0µ½HH›Jñ‰s4PK\Ã~\'\Ò&²\×ü9ª¤k¥£j6Wj©\æ”P¢Š(\0¢Š(\0¢Š(\0¯ô\Úÿ\0ƒn¿\àŸ²\ïÿ\0\à“\Þñ¯\í“û(|ø³\â\Ú;Ç¾\"ø­\á½k\âƒ|;\âoAð®\â\ÃJ\Ñ<šO‰\Ôø‹\ÃV·«c­j\çO\Óu[/4jP\\\ÜF_\É+ü0Á\"\à›¿à¨¿¶\Ç\Ã/\Ù\Ë\Ã6šŸ\Ã\È/añ·\Ç\ß\Ù*¤¾x~öÑ¼Sª}©\Õ\Ò-w_y\ìü\à\Ø|›¯7Å¾\"\Ñåº·\ZM¶§wiþ\Ñþð\'„þø#\Â_|¡i¾ðg¼=¤xW\Âþ\Ñ\ì­ôý3H\ÐôK(tý:\Æ\Ê\Ê\Ò8m­\á‚\Ú\Ô$Q\"\ç-Œ“@‚_?\à\ÖOø\"—\Ä‰\ï!ý—u\ß\0]\Î]ŒŸþ4ü]\Ð\í\â.K#J\Ô<a¬\è±\'\äE\Óv UB|µðOÆŸø2óþ	\ã\ãGÁ?Ž´_ÁmY‘„Sëº‡†>,\è±\ÊI*Í¤\ßiž\Ô\äA\nb#\ØõÁ‰5ýˆ\Ñ@\ç£\ã_ø1\×\â³\Ìÿ\0\à¡þ\r\Öc,~\Ïk\ã_\Ù\Û[ðÓªö_\è_¼V¬Þ¬šrökó\ãüóÿ\0]øq¨y?	\àø+ûDi­¿mÿ\0„þ%h>¹P •ótÿ\0Š—¾UgÀP\"½U\ÌûAjÿ\0Tª(üp|mÿ\0\áÿ\0Ák¼\Ô\Ú\ç\ìñú\Þ\Ñ$’Yü!\ãÏ‚þ>VŠ0\Ä\É~ø•\â	\äT°E‡\ÍÁ\0\Æ_—¿f/\Ú+\àŽ§}£ü]øñO\áÖ¡¦»¥ô>,ð?ˆtx\í\Ú2Cïºº°KB ¾“²\Èb9¯÷…¢€?ÀŠÿ\0x¿Š?³W\ì÷ñ·K»Ñ¾.üøañM¿]\Ûø»Á>\ÖL\Ù$’\Ó\Ý\Ø\Ér,Nô™_\'9\Í~^x\ëþ\r\Îÿ\0‚+|F»»¾ñ\ìð\ê\Ú\îúYg¸›\Â5ø\Çðð¥%žH\áðÄ\r[\ÂwÁb…#S\Ñ1\Å\0—\ÃŸ¾\n\êqk?¾-üEøm©\Â\Èñ\Ýø/\Åúï‡œ2r…—M½·ŽM½„ˆÀt\Æ+õ\á¯ü7ÿ\0œøM§&•\à\ï\Û\Ç\â[\ØFP\ÇŒ¼)ð›\âc&\ÅÚ¡\'ø•ð÷Å·\n»@‚P¯€\\1\0\×÷kñ§þþÿ\0‚LüC°º‹\á~›ñ«\à£,r-µï„¾(ø‹\Ç¶²¶LrŠ7ž.y\Ö<\å½ò\ïUÁpÄµ~nø\×þvøqs\Ëü:ÿ\0‚†ø\ÛG˜+;_\Zþ\Ï:‰bgþ¹¾Ð¾+xQ\Ñq÷¤‹Ns\ÇsÀ\âŸÁ\ßø;·þ\nûðõ\á_ˆ\Þ7øIñ\î\Ý&1ñ·Áÿ\0xBúh·h>\ÑðŸDð%œjW\äºi\0	fl“úa\à\ßø>#\âÕ­¬~?ÿ\0‚z|<ñ=\Ú\"-\åß„¿hoø&+‡,6z·\Âo}Ü°®¦\0œÀù›\ãoümÿ\0ðt\Êÿ\0¾=þ\Î\ß,2w\ÏâŸ„:ÀP¤ƒ…Ý‡´·$\ápþ ˆ\ä¶?üAÿ\0ƒWÿ\0àµž†[›ÙÃž?¶Œ·\ï>|køG«\Í&\ÞñiÚ§‹t=Y·W6\0œ\ãPýP|\Zÿ\0ƒ\Õ?a=´??f¯\Ú\à\ì’l\Ô<)ñkN¶-þ°‰£ojÆ‡8eÒ•\Ýyò”üµú\àŸø:\ÏþŸ\ã‹;K\ï\ÚGÆžžñ\Ò56øñ’\Þ\Þ\Ý\ß^jð‰t\ÛdRpóKx \\e\Û\Í™/\Ä\Ïø%÷üs\à\î©y¤|Fý…ÿ\0j\ï\Ï`H¸¼ÿ\0…ñWÐˆRAko\è^\Õ<;{Áýå–©q0Û°\ÊO\È\Þ(øqñÁ\Ék\ãOø\Ï\Â11YmüQ\á}s@ž&S†Y!\Õlm$F‚Aƒ@\í{ð£þ\n\Çÿ\0\Îø\Ýkkuð\×ö\ëý—õ\ÃxŠöö7ÿ\0ü!\áMe÷tG\Ð|_©h:\Ü3ù\á6ŸÃ¼b¾\Ìð¯\Å?†>;E“Á¼\ã(\ÝC#øW\Åþñ\n:žŒ­¤j”ö {Wø!\×E\áox·À\ÚÍ¯ˆ¼\âx?\ÄMº\Ï]ð¶·©øY´`Cµ\Õ4››K\Ø \Å:€z@\ï­Eˆÿ\0€?\à¯_ðTŸ…öð\Ùø\'þ\n	û\\iv01i\×<¯é©´a\â]\â-kV± Œ5¹pAW\ß\ß\à\è\ßø,§Á†\Û{ûF\èÿ\0\Zl÷†[\Þ\0ð÷ŠU@\0y\Ú>\Â:\ë!\ÆO™«;\äœ8 õâ¢¿\Ì\ÃÁ\ßðz÷ü7LŽ\Ú/þÌ¿±\ç‹V%Už\ãC\Ñþ1ø:öèŽ²;\Ïñc\ÅVQH\ßô\ÇOH\Çh«ô›\à§ü\çðN\î\Îÿ\0h¿\Ø\ÃâŸ‡\ï\Äq‹¯‚ž)ð—Œ,\Ú_ùla°ñÖ¯\ài–0y‰_Rv?u\Ücq\0þ\êh¯\åÀ¿ðx÷üK\Å\×V–ºß‡ÿ\0k†\Æ\å\Ò9.¼kð‡À÷66Œ\ßy\ç›À¿|i/’‡9‘-Ùˆ\ç\ËÀýFø[ÿ\0\ãÿ\0‚B|Y\Ó,u-öûý<(\×è®ºo\Å/ˆZ\Â\ÍNÔ±Ç—}Ž\î´8­\\½\æ\\m\æÝ·š\0ýe\Ôõ}+N\Ô5K¶	k¦\Ù]\ßÜ¹8	og—1\'€8Ø’xÉ¯ðbø\ÙñRø½ñ\â¯\Å]b\âK½S\âG\Ä_\Zx\æþ\æVf’{¯ø‹QÖ¥‘\Ù\Éb\Ì×§;Žkýši¿ø(÷\ìU/\ì‰ûPx\ß\ág\í{û4|L\Ô|1û>|[\×t»/†_>x\ïUº¿·ð6´4¡cc\ájWW/.§%œI\ä#\Ò)\\œþ)þ®ðhoÁ›Ÿ…ÿ\0ðH_ø\Îö\ßÉ¸øõñ\ã\â\×\Åw1”i´2m\ámƒ\î\'÷Šeøuz\È\Ã‡\ÚA\'úˆ¯\Èø ‡‚§øÿ\0sÿ\0‚|ø~\æÝ­\'¸ø£x²H\Z7Fø­kž=\Ü\èÀ2¼ƒÄ¢V¹\Í~¼PEPTu=ONÑ´û\Ý[W¾´\Ó4½6\Úk\ÝCQ¿¸Š\Ò\Ê\Ê\Ò\Þ6–{›«™\Ù!‚cVy%‘\ÕA,@¬¿ø»\Ã>ð\æ­\â\ï\ëz‡|5¡Z=ö«¬j“‹{;;xð2\ÌròK+•†\Þ\Ú’\æ\ê\âH­í¢–yc¿™Û‹öüñ?\íª\ÞøÀW:†~X\\\ã±\rö]O\Æ\ÒÁ\'Éªø\Êb\ÉdYDº~†$6ö\ë²kß´^0~½\áƒœI\â\ÖuõLº2ÀdX*þ\Ú\â\Zô¥,.\n›´ž½ÕŒÌªÁÞ†*j®\"th{\ïù¿\éô™\à£§hgu!›ñniF¯ú­Á˜LE:yŽkZ7‡\×1’µIe¹­–/2«J|\ÒR\Ã\à¨\â±_¹^\ÅûvÁHµ‰\'YøEðQº\Ò~q¦øŸ\Æ\Ö\æ[M[Æ¨Ê¸±\Ñ\ä\'\Ó|+(²a/uøX¬¿gÒ\íµ\ÇnX÷fc\îI$þd“ùš\0,@$ŸÌŸó\É?S_»?°‡üP¼z?\Æ/\Ú;Cd5/ü,\Õ!’9Â†óm5\Ú>Æ‡\Í_.{_Î¢`…·£…Œ\ÚQÿ\0J1X¿¾\\FÁa#Ì°øj~Î·qVo\Zq\ç©)?g,V&Wƒ¯ˆŸ²À\å\Ô%N\ê\ØuB‹ÿ\0\r°9Žÿ\0N_\êÕYæ¹Œý›\Æcªª\Ø^ðû‡\'^^Ê” ½¬0\Zv©õ\\\'ˆÍ³¬\\+U“\Æ\â\åŠ\Ä\Ç\Ä?a_ø\'&­ñŠ}+\â¯\Æ\Û\í\áLR¥Þ\ái>Õ§k¿Œd˜\ËÈow£xQ¤\í\Z„E5\rböú;\ÚG \Ö-ÿ\0£\Í#HÒ¼?¥i\Ú…¦Xh\Ú.‘em§iZN•i†›¦\éöq,–VV±\Åmiim\n$P[Á\ZEj¨Šª\0«±EGG0Æ‘CH±\ÅQ¨H\ãŽ44@@UP@\0\n’¿Ì¯<Z\â3Ç™\çu~­—aeR.C‡©7—\åXyµ~T\íõŒut¢ñ˜ú±Uk\Ê1„#GK†£þ\î}¾Ž\Üôx\á8\ä<-†X\Ü\ï\n58£‹±”i\Ç8\âm8»s\É9ýK*\ÃNSYnOB£\Ã`\á)Õ©<V>¾3Š(¢Šü¸ýô(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0+ù\Ôÿ\0‚ûÿ\0Á	|ÿ\0aøSmñ\'\ách>ý¶¾h3\Ùü6ñ¦¥‹\râ‡…\à–\ãPo„_o ‚Y¢°–\î\â\ê\ïÁ>)x®%ð†¹yuÑ¾ƒ­kŸ\Ñ]þŸ´7\ì\áñ\ÏöOø¯âÿ\0´_\Ã|$ø§\à\ë³k­øK\Å\Úk\ØÝˆØ“kªiwJeÓµ\íTˆ½\Äzæ£¡kV/î—¨]\Ú\Ë\Í\âUþ\â?·\'ü{ö:ÿ\0‚‹|>ÿ\0…{ûUü\Ð|wœ7Qøg\ÆV\ÑG¤|Eð<÷\ÒX½\å\ïƒ<gmjš%\Í\Òé¶\\ª´ö—6Ñ˜.-eŠ\×ñkûZÿ\0Á“?#×ŸUý‡?k/‡:§‡õ\rSRžO~\Óv-ðeÏ…ô©%ß¦Xiþ7øk\á‰\Ï\â\É\à‰Œ\Ü\êðÁo-$ý\ãHû\0?ƒŠ+úµñGü\Åÿ\0tðú»i:\Ç\ì‘ã‚€•Oügñe£KŽ~xAn\Þk\Æ?¼Eyw…¿\à\Ò/ø-ˆ<g§x_WøMðoÀúô¦+Ÿˆþ\'øûðþóÁš:‚\0¸\Ô\ì|{\â\ïˆr@A-ÀzµÀ\0ÿ\0£\îÀ \Ì\Ý}¹ûÁ=?jø(÷Æ7\à§\ì¿ð\ßTñv¨g±—\Æ>0ž	\ìüð\Ï@»¸0¿‰|{â‡ˆ\éúœŠ“µ«\É&«­M\Ùh¶÷Ÿ¹\Ú\ß\ì]ÿ\0Sø@ŸDñO\í\çûN^xþ\á-\í®5o„¿³\æ›y\á\Ç}³U‚ûM¸ø£\â˜\á(ñ›û\ÍP°\Ôt\ßxù&‚ò\Î\ê\Îh%Iöyû3~\Ê³—\ìoð\Ò\Ë\á\ì\ÅðÁ¾Y\Ïö\Ù4/\éihú®¦`†\ÕõŸj\Ó5Æ³\â]nKk{{i5{P\Ôukomh.µ¼\ÆñŸüSþ	Gðþ	;û7\Ù|\"øekg\âO‰\Þ,]3[ø\ëñž\çNŠ\ß\Ä|]io*Cœ\Ê\×v>ðÉ»¾´ðo†¼\ãk¦Cw¨jOö¾·«\Ü\Üþ¨\ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0\Åø\Ó\á¿Ã¿‰:lº7\ÄO\0ø/\Ç\ÚDÑ˜¦Ò¼i\ám\Å:l±6G-Ž¹c}k$d€J<ENEv”Pæ¿?\àŽðJOˆ7—¾(ÿ\0‚wþ\Çó\ß_\Èó^\ß\é?>ø_P¹šO¿4·\Þ\Ñtk¶™º™|\ï3<\î\Í~y|hÿ\0ƒU\àŽ\Ú\î]3\àþ\n\Ý]\n\Üüø•«hkh\Òg\ÓOñu§ôx\Äg˜\ã“M–!À1²ñ_Ñ­übx\Ëþ™ý€\ï,n—\á÷\íUû`øwRh\Û\ìSx\Êÿ\0à¿Œ\ìc—ø~\Õm¢|%ðóFy\"»·aÀœmo\ÌßŒ\ßðd‡\í)c+\Éû<þØ¿¼S	’\×\ã6\ã\ßJ±\î8ß¨x#Â¿œ&\Zj)l”ôm¢€?Ê·\âGü\ãÿ\0rðž÷ú%÷\ì¯ñ`\Æ$&\Ã\á¿\Å\Ï. B.\á²ˆ_\n~\Ç!“‘I˜\îp™\\þ\\|Mÿ\0‚Á]~js\éš\ßü\ëöŸñ\'’\ì‚ÿ\0\á—Â¯üT\Ó\'\Û\Õ\à»ø}§øˆ2\áfD\Ý\Ðx¯ö™¢€?\Âg\âg\ìiû_ü\ß?e?\ÚK\á*§.\ß>|OðA€r\ç\Å>Ò‚ðA\ç{\×\ÎG$N\ÑÊˆJ¼r+#£¡•€e#¸ \Zÿ\0~\r_B\ÐüAjö:ö¥kvR²Y\êúuž¥k\"žªö÷\Í\Ü2k\å¯ÿ\0Á?`Ïˆ—R\ß|Aý‰?d_^\Ü¯¼ñ\ì\Ûðk\Ä÷Su?½¸\Öü},œ±?;·S\êhü1â¹¸·\ß\äO4>dmžT¯™Œ<O±—tn8dl«5.Ÿeq©_\ÙiÖ¨dº¿»¶²¶Œ—ž\êd‚¹i$Prký~4ÁºðG\Ó\Ý\Ý\ë±_ÃŸ\0\Þ]¬§ø.u„0Bd\êöšOn´\nÕ”ó‡JTNŠx¯ƒ§ÿ\0ƒ=¿\à”6\Þ%\Ñ<U\áO~\Ö>\Ô<=\â\r\ÄZ}†ŸñgÁzÎ‰%ÆªZ\ê\Ø_\Úø«\áN»¨]i·-l-.\ãMV\Þñ\íd“Ê½†}³(ô“û=ü.³ø!ð\à\ÇÁ½>(¡³øWð·À_ Š\Z_øcLÐ›\Êa\Ã!{ea÷\ÝÞ½‚Š(\0¯3ø·ñÀ?üªxû\â6»o¡\è:j»¿{©Þ²“m¥iJDÚ†¥v\ãdÐŽ9–gŠ\ä•9\ÚöŽømû5ø\"\ã\Æ^?Ô€šE–/xj\ÊH›]ñ6¢‰”²\Óm²©*ou‚\ÚX\ÄÁ¥f•\à‚o\åcöšý©>$~\Óþ5—Äž2½kM\ÆY\ÓÂ¾²–A¢ør\ÆF!R˜´\êE´_js©¹º`@ò \Û\Çý\à€Y\çŠ\Ø\êyž=b2Ž	\ÂW\å\Çfüœ•ó)Ó—\ï2ü•T‹Z\îÜ˜Œd£<6\n\ï™V®£†Ÿñ—Ò³\éÂ¿G¼¦®E”<x§˜\áò®U=¦#§Z¹\Îx¢Tg\Z˜|*MUÁå‘<vj\ÒPxl§Ž§\è¶\í­\ã\ïÚ—Äl\Ò]xgáŽ“u!ðß‚m\îI…ö3¤ZÆ¾ñS\Öå‰\ÎÀ\Ú\Ø#µµ‚i\înþ7\ÒtO^\Ô\ìtm\Â\ïTÕµ;¨l´ý:\Æ	.o/.\îdX ¶¶·‰^Y¦šFTŽ4Vgf\n ’møÀ¾.ø•\âÁ^\Ð5x£_¼Ž\ÇJ\ÑôÈ„—3É’YžFŽ\Þ\Ö\Ú\ÖK‹\Ë\ëÉ­\ìl,\ážöú\æ\Ú\Î\Þy\ãþžb_\Ø#\Â³F“i\ã¥‡Š¾3\ê6joõuQs¤xAgŒy\ÚG…|øQ\Úu\Ü\Ð_kòG\Õ\ê\îŠ\Ò++7š;Ÿ\ïn:ñ\Ãï£¿\à²|·…†*8iC‡xOQCŒ’¼g\Ì+?iVŽU“–34\Å{ZøªÊ¤i,N!N1ÿ\0 ü%ðk\ÆO¦—‰y¯gy¶>¶_SN¯\Zø‹›Ò•\\Y¡:y>O…‹£C˜C(C,\È2÷C	—\á]\Z˜™`pr¥:¾;ûÿ\0Á94Ï„ƒIø¹ñ\ÃO´\Ö~\'÷†|#9†÷Gð€‰`Ô¯‚\ï·\Ôü[\í‰i¬<? \Û}£XKk\Í3õÖŠ+ü¶\ã®<\â_süOq>:X¼eo\Ý\á\èCšž-\Â)JT°v\Êk…¥\Ì\Ú\\Ò«Z¤§ˆ\ÄÕ­‰«V´ÿ\0\ß\Ï	|\"\ào8;Á\\•G/\ËpÖ­\ÆVä­›g™”¡b3|\ë\Zt\å\Ì1‘N\\”ðøj1¥ƒÀ\Ð\Â\à¨P\ÃR(¢Šø\ÓôÐ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯‘k\Û\á\ç\ì³\á7»\Ö\'ƒ\\ñö­k3xGÀ\Ö\×\0^\ê\0QuQ“{\éš\r¼¤‹\ÙÌ¸ \ÛX\Ç5\Ë_?ý·¿m\ïþ\Êú$>\Ò-]ø·\âm\ê~\Ñ\îO\ì\Í#Kž\æ÷O‡\ÄzËž|ö\Âö-:——“y\ÒAo2ÿ\0.¿>!x\Çâ—‹5ø\ï]¾ñ‰5»–¸¾\Ôo\å29\äùVð\'Z\Ù\Û!ò­m-\Ò;{x€Ž\Ñx¯\ë/\0~Ž\Ï%„\â\Þ/§[ÁP©\í0˜D\åGÄ®”Ú”hµi\áržxÊ|bq­ˆ´¨\à¹o,Uó³\é…ô\Ý\Ë<†a\á×†Õ°\ÙÇŠU(û\Ë0”!‰Ê¸8ŠJqž&½,Ãˆ*«„\Ë\Zž\ÍOšs¥O/\Åôÿ\0\Z~7|Bøù\ã}C\Çu¹õmVñ™--†b\Ó4k\0\ì\ÐizEˆc\r¸b$Ë»š\âY\î$–iðg\àŸ\ÄO^6Ó¼	ð\ãB¹\Ö5k\ÇF»¹\é¦h–b$ú¶µ}´\Ãa§[oS$Ò]\Ù %¸–_±ý›¿f?‰Ÿ´\çað·4Ö‹K´š\ÙüU\âû\Øe\Z…tÙœîº¿@\Þ\Ë\ZL4½\"š¥\Äl‘ù6°\Þ\ßYÿ\0Uß³¯\ì\Ûð\Ûöhð=·ƒü¦¡»š8$ñ/Š®\âŒ\ë\Þ*Ô£B\Z÷R¸\\˜\àFi>Ã¦@\Ëea°‰\Zi..\'þ±ñ‹\ÇðW&¡\Ã5„Ë±\\O:O\á#\nynC„T\Ôpø¬Òž\Ã\ØRŒ-<._OŒV›•\Zú\Ãÿ\0;þE>>úQñ>+8\ã1Î°W4­‹\â.3\Ì\'R¾y\Åù¶r\Æ\åù|ljýo*ŠT±ù\Íh\ÖÀåš”a‹\ÆRú”|\çöFý~þÊ¾TÓ£ƒ\Ä_5‹$‡Å¾<¸¶sr‰\ßGÐ£“tšN«0#Nkxo5\'v†\Î\Ú\Ç\ìj(¯òßˆ¸;\â\Ì\ãŸñcˆ\Í3lÂ««Š\Å\âeyK¤)R„Ti\Ð\ÃÑ‚T°øj§CJ1¥Fœ)\Æ1_\ï\×ðWxy\ÃYWðfK‚\È8w&Ã¬>.À\Ó\å„Võk×«\'*ø¼n*£•|n;R¶/‰LF&µZ\Õ\'6QE\âRQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\ç\íeÿ\0pÿ\0‚rþÄª\éß´G\íeðŸÂ¾/\Ñ\Þ\î\Þ÷á¾‰\â<kñ*\ÛQ´±Q\ZN¡\àl\ëº¡yk4XG\â[]Á24W72ÿ\01ÿ\0µ\Çü³ð\ÂCXðÿ\0\ìYû/ø\×\ã®‚\ê\×Løƒñ«Y‡áŸ‘\æ\Ò-§\Óu«	h‰\â\Zx‚^i\ìu_j>š\î6š\Ã\ÄP¤ð\Ê\0?¸\ÊùOöŒý¹ÿ\0c¯\ÙD¸\×ÿ\0io\Ú_\à\ÏÁ›+x¯\Ý-¼q\ã\ÍK\×ut\Ëµ]\éú†~\×/ˆüA¬¬?4\Z‡¥j\Z\Å\ãb+;\å`‡ü¥ÿ\0k\Ïø9;þ\n\Ûû`&³¤k´;|ð&µ£k7\Ã\ÏÙ¿H…ºZf¯¦>•©\è\Òø†;ýg\âF·¥][K3-·Š<s¯Im4†[Y\áp¤~ø›\Å^\'ñ®·}\â_x^ñoˆõIÚ—ˆ<M«\ê\Zö·¨\Ê –ûU\Õ..¯\î\äª¡\î\'‘‚€ \à@\ë\åû)Á\Ç\ßðM/\ÛSö\Èð\ç\ìYû>x“\âß‰üg\ãK?O\à‰º\×Ã˜|ð—\Å÷\Þ\Z\Ñ_\ÄZ‹/‹<G¤|P\Z\Õ\æ—kª\\\éöÚ§\Â\í6	#Ñµ).n­!Kin¿z+ü(?c\Ú7\Ä?²\ícû;~\Ó~7Ï©üø½\àˆ\éúv t«@\Ñ5\ÛI|W\á6\Ô@cgi\ã6³\ámFlº~¯t¿\Ü\ëÁž0ð\ß\Ä/øO\Ç\Þ\r\Õ\íuÿ\0x\ã\ÃZŒ<+¯X1{o\Ã~%\Ò\íu­W³v\0µ®¥¥\Þ\Ú\Þ[±\0´3! @-~Ù¿²…ÿ\0j¿‡\Ïb~É¢üKð\Ü7>ñsÅ*\à«H\Þ\×$Ž7ž\ãÃš¤¸*‰&\Ò\î™5;$‘–\ê\Îÿ\0ù<ñÇ‚<Sð\ßÅš\ïük£]\è\'ðÞ¡6›«\éWª\Ö\×0r®Œð\Ü[\ÏGqiwo$¶·–²\Ãuk4\ÖóE+ÿ\0qµù\ÛûzþÄšO\í/\ác\ã\Û\Ûi¿<+§ÊºMÚ¬pE\ã2\0Ò¯†µ™H\0\Ï2¶…¨9\Ýiq+\ÚN\Æ\Ê\ä›ë£o³\àLm\â\Ü\\¥Á¹…v°\ÚÒ”¿Õœ}y\Ý\Î\î\ídøº’¾.’÷pu\åõ\êj1ž1Uÿ\09>œ_C\ê~-å˜Ÿ|9\Ë\árl\"y¾U†„iÿ\0¯YFšŒi¨«)q.[B\n9mg\ï\æXH,ª³Jyd°ÿ\0…±_\í\â_\ÙO\â\Úfz\×\Âÿ\0\\ZA\ã\ï\nBcy\Þ„‘[ø‹\Ãþ|‘Eo\â\r%fwXžXm5«@ú]ü1°\Ôô¿\ëÁ¾2ð\Ï\Ä/h^5ðn³g\âø—O‡TÑµ{	<\Ë{»Y‚\\\ÛÊ²Z\ßY\\$Wv°\\Y^AÝ¼Ð§ñ­hÚ§‡umGB\Ö\ìn´\Í_I¼¸\Óõ>ö-\î\ì\ï-%x.-® ”,‘M¨ñº0YH¯\Ñø\'\çíµ¨~\Î^+Ox\âú\ê÷\àÏ‹57\Ð9’\áü­\Ý4p\éQ\0\ïöY‚¤zö\îŽú\ÝZú\Ña¼þƒúHø\rGp8óƒpô\åÅ¸<,*ã°˜U)\Ëh\Ò^\ÎTù=Ú¹¶¬X\ÞX\ì,c‚“œ¡‚öÆ¿B¥\æ#\ÂÞ‡„ž&\ãkSð\ç3\Ì*PÊ³Á\Î3ðÿ\0;\Ä\×j´+ûT§C†ñø¹M\æ”\'\Ë£R¦kÒ§W5u©:*ž¨\Øjöz¦—ym¨iº…´7–7\ÖsGqiwiq\Z\ËÅ¼ñ3G,2\Æ\ÊñÈŒU”‚\r\\¯ó\ZQ”%(N2„\á\'FI\ÆQ”]¥E\Ù\ÆQi¦šM5f¼p©\n°…ZSJu#Ó©	)\ÂpšR„\á8·FQjQ”[RM4\ÚaET”QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Q\\Ï‹¼k\à\ï‡þ\Õ<Y\ã\ÏxkÁ>\Ð\ì§Ôµ¿ø»]\Òü7\áýNµ]÷:†«¬\ë7VzvŸcl€½\Å\Ý\Ý\Ì6ð -$Š š\0é¨¯\ç“öµÿ\0ƒ \à’²\ã\ë\Z.ñ\Ò\ÚW\Æ\ÚS\Þ\Úÿ\0\Â;û;i2ø\ßB}B/¬\ã?g};\á\íö™©ˆ\àƒZð¾¿\â{(nh®LR@\è?˜\ß\ÚóþPý¨<nšß‡?b\ï\Ù\Ï\á\ßÀ\Í\"\éu-;\â7\ÅË«Š¿­\í/t¨a´Õ´¯\nX¾…\à\Äz.¬\×7V‡^<;vÉ¨\è2+\Ïn\0?\Ñÿ\0S\Ôô\ÝN¾\ÕõB\ÇI\Òt»KCS\Õ5;¸,4\í:\Â\Ò\'ž\îöúö\êH­­--`æ¸¹¸–8a‰IQIßµ·ü\ßþ	CûcKø£ûXø3\Å^8\Ñÿ\0´\í\äøgð^+ßŒ9—W\Ó!†\ì;»OE¨\èž¿¿Y‘tÛ¿k¾Ð®_pmb%VqþQ?µ?üþ\nûj\êW·ÿ\0´\Ç\í]ñ\âU¥\ì÷ÓŸK\âI<5\à©\Ù\r;SƒFøu\àøôhV:˜0^\é\Ú7‡\ìtûˆ\ÞE’Ø«°?P÷¿û]Á\ìšõû\êz\ì=û&[\èV%µ{‰´^¼š–»5¼Ö‘®›¨Áð\×À\×?\Ø\Ú¡c{\ç=Í÷Žüac}o\å\"µ«\ïcü\È~\Ö\ßð]?ø*wí ºž›ñkö·ø ø/Uk\äºøoðƒP“\á\æ±\Ô\ìþÃ¨hÚ•‡ŸJ\Õ<K¡]Û–\è¾.\Ö<A§ov‘-\Ñ\È#ò‡GÑµjvZ\'‡ôK\\\Öu;„´Ó´\Â\ëS\Ôõ©N#¶²°²Š{»»‰	I#žM~\ÍþÈŸðoWü“ö\Ì:^¥\à\Ùo\Ä|©.\à|Løùu\ÂÇ¥\ê\ßmX5›(¼K\Zø»\ÅV\ÒX\É¥¼+\âSOim¾Ó§\"\ÜFXñU\äy¼Žò9\ÆYØ³³Nž”\Ð	\è	\êx€\É?€ŸA\Í¡·\ìÿ\0NøEm\Ä¶\ß\íc¬x\âñF“y«|6ýŸ¼=ÿ\0¯†¢ž)\ï·¢\Ëñ\Æ+\â?i\×vÿ\0`m;Y±ðwo\íeK>›:˜ˆþœÿ\0dOø\"§üö\"mTøû&ü69ðú\é2\Ù|Qø‡¦‰\ß\"Õ´P¿bñŸ\âO\Z_þŸoQ4Ú—ƒlü6ò\Î<Òù òŽý‘ÿ\0\à¿ðR¿\Ûut=K\à\'\ìñCRðWˆM¹\Óþ\'x\ËF—\á\ç\ÃK\'VV{-OñwŒ†‘c\âEBÍ¨øUu\è‘J–\005úcûhÿ\0Á¯ÿ\0µ\Ï\ìû|Eý´¾6|Oøs¬kŸ/|&·ðáµ¾¥\âY´/x›]O\ëºç‰¼m¨¾ƒ¤\Û\'‡\ï\ï´H­¡ðõ‡‰WU}KcK§ˆK¿úÆªª\rª¡Wž\09\äð09<šù÷ö²ýŸ¼/ûVþ\Ìf\Ï%¨ðÿ\0\Æÿ\0„ž;øms}u¤iº\é\Ðo<S\á\Ûý7FñVŸ¦jö÷Z|\Ú\ç„5©´ÿ\0xzi\àf²\×t:úŽ\â\Ú)Pü\"«ý{ÿ\0\à\Ù\Ú\Ùj¿ø$ŸÀ{mS[mc\Ç³Ìº\Ç\ìõ\ãµjËª\ê¶ñøh\çðOö€[ka§F\Þ\Õ<7o¤\é­\ç5¾g`Lò,Škü~!ø\Å_\nüãŸ†:Ò¦Ð¼mð\ã\Æ>&ðŒt;‡I\'Ñ¼U\àýj÷\Ã\Þ!Ò¦’\"\Ñ<\Úv­§]\ÚHñ±FxX¡*A¯\í#þ¬ý°‡‚¿i\ÚOö%ñ>¼¶\Ú\'\Æ\ï\Ø|eø_¦_\ê¶\ÖÖ¯ñ\'\álË¦x\ÓH\Ðt§E¸Ô¼A\âÏ‡z\Ü^!¾’)\\Y\è?\îd0ª™d\0\èÿ\0EP\äwüköO‹º]ÿ\0\ÆÏ„\ÚR/\Ä\í\Ì\Í\âŸYDþ½&\Ò<½\å¬I€|S§Û©\Ø³\ëv±­©\ÍôV\Æo\æòhe‚Y ž7Šh£–)£\Æ\êJ²:0YH ‚2+û´¯Ã¯ø)/\ìý¶¯ûA|\Ñ+ø|\íC\â?„ô»uT¹™n¼Y¥Z@€\ß.»m\Z\å‰}R0I½ý\Ùôcú@ÿ\0g\Ë\á¯c_\ÔjN^\ÎñU4ÁT›Q¥‘\ã\ëMéƒ©+C,\ÄMÿ\0²Ô’ÁTV–\ê¿\ä§\Ó\Ç\èpóxf\Þ9xW•ÿ\0Â­\Zuqþ!p®Ž¹¥\ZkŸÅ™F\Z”uÌ¨ÁJ®}ƒ¥øP£	f”cõúxÕ˜x§ü‡öð?\r/ô\ï_u–uK‘o\àŸ\êe<«^N¸\Ó5K©\\|+4Ž\Â\é\ÉMöO:bšd÷S\Øÿ\0E\áƒ\0\ÊC+\0U\È Œ‚\à‚9pE	D21e?B¬\èA¯Þø&¿\í\åö¸´\Ù\ß\ã.°>\Ñ\nÁ¦ü/ñ~¡(S,*\nC\à\ív\îR’,$^\Ô&r\Ò#.‹1S›\æûI\ï£ÿ\0Ö–;Ä¾	À\ß<W\ä˜Jz\â`—5\\ÿ\0Fš\×y\æô ¿l\Â)V†.X”úý1³¥”ø\âžklº£¥€ð\çŠs\n\Ú`*IªxnÍ±5eþ\åVN4¸sV_\ì•2Y\Ë\ê³\ËcƒýÎ¢Š+üø?\Ù`¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šù3ö–ý¼?cO\Ø\ç\Ãòx—öŸý¦>|°j\Ù\Ùx\ÓÆºE§‰uÃ¥ª¶¡i\áo\Ú\Ïw\âÿ\0j–¡\Ó\Ì\Ñü/¡\êú±,¡,˜(\ë:+ø\âý¬ÿ\0\àó/\ØS\á\Öt/\ÙO\á/\Åo\Ú__´}J\ÏOñf»hŸ	>^Oµ¬\ÚV«du\è\ï|y¨h·³M=½\ÌZ„¼-¬\Ú=£\æÁ\ÒX\ä?\Ìg\íÿ\0`ÿ\0ÁV¿ixõ¿ü1ñ¿„d_\0\ê¿Ú–‹§|\r\Ð\ãoˆM£j–p\ÛÏ‹+\ZÇˆ´\íGO•&¹\ÒüKðö\Ó\á\æ½e$ÿ\0%\ë<I%\0©WÆ¯\Ú/\à/\ì\áá‹¯||ø\Çð\Û\àÿ\0†m,5\rMõ_ˆ~0\Ðü/öZTi\Ôe\Ó\á\Õom\îµF³€y³Á¦ÁwpªG\îŽ@?Î¯\íwÿ\0pÿ\0Á-g_\í\á¡ñö¼ñÕ‡ö¥¥—\Â-\n=\á\ØÕ¬\Ä\Äj\ß<o&‘§¾ª‰eòµ\ß\èŸ&¶00ŸG\Ë–ÿ\0\Äÿ\0Œþ6xŸSñ¯\Æ?‰ÿ\0>+x\ÃZ¾›S\ÕüQñ\Æ ñž¿©\êW8ûEýþ­\âCP¾º½¸\Ægºšwšc–‘Ù‰\'\Í\èú\Þý­¿\àñ/ø(\Ï\Æ\Æ\Õ4_\Ù\ÛÁÿ\0?d\ï]ÿ\0i[\ÚO¡\ØKñ3\âJ\Ø_Avÿ\0mñ¯‹ ƒEMSK•%ž\ÏSð\ï‚|6¦)ui:¢ü\Úþ\Ñ¶?\íWû\\kƒ\Ä?´\Ç\íñg\ãeüz…Æ«eüi¬\ëZ¨]Ä°]]x\ÃÜ¯†ü9%\ÌH±\Î4\'NY”~ñ[\'8¿f\Ú/öñ>ýž~üOøË¯\Í}i¦›‡ž\×<L–·\×ÁÍ¾¥}¦\ÙÍ§\éMt\Ì\r©\ÝZ$k\ZþŽÿ\0d/ø4\'þ\nqû@¶—®|t»øeû x\ì\éw7S|DÕ¤ñ¿\Ä\É4\Ëô¼7o£ü3ð<—1.¯¤Kmo\î\ã¯ü>2-ô2\Ø\Þ\Ý,s¬`\Ê}v¿þ\ZüFø±\â#Àÿ\0<\ã_‰^5ñ\ìzn\á\0xW\\ñŠ5\ÍF`LZ~ xv\ÇQÕµ;\Ù@&+K+I\ç“$f¿\ÔöGÿ\0ƒ?\àšŸN®ü{Ö¾(þ\Ö\Þ1°:M\Ý\ì^3\Õcð\ÃYµz5³ð‚\ÞA´-e\'µóôø¿\Å76f\Z\×Vk\×ô…û?~\Ê?³O\ì§\áˆ|û7ü\nø[ðWA‹N\Òô©\àø{\à\Ý\Ã\×úµž‹l¶šXñ¹ihº\ï‰\î­-\ÔG¡\â-KT\Ôni.Ù˜€–\ì…ÿ\0²ÿ\0ÁY?j4\Ðu\ßü&\Ñÿ\0e¿k1é·§_ý u…ðÿ\0Š!Òµ+Yn\ïþŽ“«\ã‹+\ëGH\íõ\Å:o…µ\Ë¥\Ûqd þœÿ\0doø2\çö>ø~ú\'ˆ¿l_?ÿ\0hMj\Î]6ûQðÃ¿#\á\ÃKÉ¡YF§¢jú\ÌXø®hw¥\ã1]ø\\øq®[˜²—€;-i”P\Å?³üöýŒô›m\'öfý–~|(6ñi\ÑI®\è¾°¾ñ–¢úK;i·š\çŽu\Õ\Õ|c¯\êv#˜µmk\\¿\Ô÷\Ív\Í\Í}­E\0QE\0QEþFðtg\ì“ÿ\0·ÿ\0iøÅ®i\Z\Zh\Þý¥4}ö€ð¯\Ùl4}+K¸¿ñ42hþ;\ZnŸ¤\È]<s¡\ë“\ß\Þ\êö\×z¦¯w¨j%óÌ‡ówþ	OûU\Þ~\Å_ðP\ß\ÙCöU}#Gð?Å¿Zx\Ò\çûZ\Ö_‡¾-™¼#\ã\Ë]WV¹W‚\ËE¸ð¶·ª.³4 Eýš.VVXÙsðzg\ì\'ÿ\0d\Ù\ëö\ÇðÞ%Öµû=üO¹økñö\Î\Ê\Ð4?>0\ÛFš&µ­\êRÈ—F\Ã\Ã_ô\r\Ã\ÚFŸl“o\Ô>(\Þ\Ý:$P\Ë\"ÿ\0š\í\0¿uõž§cg©i\×0\Þ\éú…­½õå»¬¶÷vwp¥Åµ\Ì©+$3\Ã\"KŠJº:°85j¿ ÿ\0\àƒÿ\0¶ý¶ÿ\0\à•Ÿ²g\Å\í[X}g\â‡üÁÏ‹S]ê«¬k\'\â?Áù\ÛÀú¶¯¯Ü­½²Áªx\ãI\Ó4?‰\"ÀF\ßa\Ó|i§\Ûed27\ë\å\0\×D•)QdŽEd’7P\è\èà«££¬¬¤«+ Ó¨¡6µZ5ªk 5t\ÓWOFšºi\îš?œ¿ø(\ï\ì#?\Ã]ORø\çð‹F’o‡šµ\Ë\Ýx\ÏÃšt\r!ðN¥s&\é5KH\"RW\Â÷Ò¿\Î\Ñn_\Ë8\Ó\åˆ\Ú~@A<\Ö\ÓEqo,O‹,3D\Å$ŠD;‘\ÑÔ†VR29ý\Ó\ê\Z}Ž­ay¥\êvvÚ†¨[Oe}cy\n\\Z\Ý\Ú\\\Æ\Ð\Ü[\\A*´r\Ã4N\Ñ\É©VV Œ\Zþbÿ\0à ¿°õ\ç\ìý\âI¾\"ü>°¸ºøC\âk\çeŽ%’s\à½Z\åšC£Þ¿\ÎË§\ÌÛ›I»…’0m$cs	kôƒ\è\Íô€\\EG\á\×\Z\ã\Ïpô–‡sŒUMs¼=(¥¯Ro\Þ\ÍhSV\ÃV“o1¡I\ßO›þ!};>‡O‚q9—^e¯ýP\Æbe‹\ã^\ZÀQv\áLn\"¥\çŸe”i/w‡q•\ç|v\ZQ\ÈñUZIeU\Ü2¿ÑŸø\'G\í\Ó\Æ\Ã\à\Ç\Å=V8þ)h–b\r\ë7Žþ­\Êˆe•\Î\Ä\Ú}¼lgV>f«i»M÷Q]\îýg¯\ákEÖµ_\ê\Úv»¡\ß\ÝizÆ‘yo¨iº”\Ïowe{i*\Íoso4edŠXeEtt`\Ê\Ê Œ\×õûþ\Ü\Zo\í-\á¡\à\ï\Z\Íg¥ücðÍ’B\Ù\nÁo\ã2HÏˆ´˜IÚ·*JgO‹þ=§asig<k\æI£ü¸g‹ñ‚ð_ñâªº\ÜA”a¡¦CŠ­4¥Ž\ÂR‚÷rŒUI^­(®\\»+C—Vœ0¿¼ý>˜\Ñ\ã¬&]\à×Š§üf\Ø\n\Ãpo\ãªû\Ü]—\á©{™>cˆ¨ýþ$ÀQƒX|EIs\çx8\'Q\Ï4\ÃÖ«˜~QEü\\¨EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEQ\ÔõM3E°º\ÕuF\ÇI\Ò\ìb3\Þ\êZÝ½……œ\n@i®¯.¤Š\Þ\Þ HI¤D€O\"¿k\Ïø8þ	Aû®©¦üJý«¼\ãŸi©Z¿\ÂßK\'\Æ?ÿ\0j\éL«u¢jø=®ü5\à\ÍM‹©¶Oˆ~&ð}¥Ú’\Ö\×r(b\0?f(¯ó\ãý­\àö?_ÿ\0l\è?±7\ì™g Û–\Ô\í4ˆß´ˆF­ª\É\Åjt}gþ×ƒ\r3L¼†cxº†‹u\ã?ZÈ«n\Öú°\Ü\à0ß¶üþ\n‡ûpÇ¯\è¿\Z¿kˆz\Ã\ß.«ið“\á]ó|)øgq¢kP}C\Ã:Æƒ\à¶\Ó/<i\á\Ùb«¦|A\Õ|\\‘‰$ \r€þ®µ—ü\ãþ	\Åû.µiûAþ\Ö?\n|7\â­	u”½øw\áýz|GMGA\Ú5-\n_xCûgYÓµø\Ö(ôf\r2\îi³Q³«ü\Åþ×¿ðz\ßÁ	g\Ã±\'\ìµ\âÏ‹ºªj\Ø\é¿~9k\Ëð\ßÀ–÷\Ëiý¯Xx\Ã\Ð\ëž7ñ†•{	¾[\íW\Öþ\ê–R-«\Ç}r­,kþtS\Ï=Ì¯=\Ì\Ò\ÜO+n–i\äye‘ºny$,\î\Ø\0e‰<TTû½û[Á\È\ßðV¯\Ú\ä\ê\Úf³ûG_|ðN©ý§ð\ìû¦\Åð\ËI‡L\Õ\ÝeÒ¥\×le»ñ¾­olmÕ¬.µ¿\êZ¥“I1†ý|\×\Ï\á÷‰|Q\â_\ZkºŸŠ|c\âwÅž&Ö®Z÷Yñ‰umC]\×uk\Ç\0=Þ§«\ê—Z…ýË…P\Ó\Ý\\K+\0¹\0W\é?\ì™ÿ\0`ÿ\0‚š~Ú£N¿øû%|O»ðž§&ž¶\ß|s¤Ÿ†¾{mV\ÖK\Í?S·ñ/Î‹mªh÷PD\Í­¢¦§§†(pŽ\èô\×û!Á“ÿ\0<C&•\â/Û‡ö­ð÷Ã¶›u}ð\Ëö}\ÐO|iyk=½\×ö¦•}ñ\Æ\éžð~«§\Ý/²\ßi^ø£¦j0=Ò°°’8À?…\nû3ö]ÿ\0‚wþ\Ü_¶ž³‰û.þËŸ¾14·v–W\Z\ï‡<%{i\à}kût»±o|D×¿²<\á;k\ËY#¸¶¾ñ7‰4›)\âtx\î2\çý[?d¯ø7[þ	1û Uð—\ìÅ üRñÆý—pŸ~=^\\|VñÚ¶™\Ö\í¬E¦\ëÀøCH¹Ô„\îú•Žƒ\á+E™\ÂùZd6Ú½B\Ñ</£i^ðÖ¥xw\Ã\Ú…¦•¢h:i¤\è\Ú>—a\n[X\éºV—a\r½ŽŸagopZY\ÚA\r½¼(‘C\Z\"ª€óWýÿ\0\à\Ì?\Û/\âR\èž ý¯>6ü5ýœtµ°»\Ô|\à°ÿ\0¾$\Ú\Ú]\Ø\Ï%Í…\åÕœºWt\ÍsK¿û4\Ø\ë¾(\Ò.b3½¦¬øô\åû#ÁªŸðIÙ–m\Ä>:ø[\âÚ·\ÇzD–£Xøÿ\0¯Ï«x(j¶°\ÉÄ±|\'ðÿ\0ö/µm&ü\È^m\Çö>=°\Ò\'F$¯\é.Š\0\á~ü/økð—Ãšw„>|?ð_Ã\nhöVún•\á¿ø_Eð¦…¦\éö€­­–•¡\ÙX\Ù[Z[+2\Û\Û\Ã\nE\n’±¢Ž+º¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0øcþ\naû/X~Ù¿°_\íQû7]\ØBÿ\0\âOÁ\ïYøZ(´\ÛmZö/i:tš÷‚nt»;·Ž«\Ã\â3J:d\ì\êÖ·†˜É’%ü?5M6ÿ\0EÔµT¶’\ÏS\Òo®ô\ÍF\Î]¾m¥õ…Ä–·v\ÒlfO2ˆ¤‰ö³.\å;XŒ\Zÿ\0~ªÿ\0\Z?ø8öBØ»þ\n\ÃûVü8\Ót\Ï\ì\ß\0øû\Æñ\ë\áP‡LƒH\ÓÀŸcoeh–0\\\\„\Ò<\â\ë|8µ¸•¢—PoK¨5¼+tˆ\0?¦?ø2sö¹\Ä_µ—\ìC¯\êÏƒ6ûCü7\ÓnµX$‘£ƒÁ?\â\Ò4Af.\'¸¸Ž\Þ\êÚ‘¾)6:}·Ù˜²\'÷ó_\ã!ÿ\0ý¯\ìYÿ\0Yý“~(j\ÚÄš?€<a\ã˜þüT™¯\íô\Í4x\ã¯ƒ%\Ôõ\ëÛˆ\äXôxšû\Ãu4M’\Ï„|„y¤7û7\ÐEP\\ßŒ<#\á\Ïøc[ðw‹´«]o\Ã~!°ŸMÕ´\Ë\Ä\ßÕ¬\ë‚;4r\ÆÁf·ž2³[\Ïs\Â\é,hÃ¤¢µ¡^¶\ZµN\Z­JŒ=Zu¨W£9R­Fµ))Ó«J¤\Z:”\ç\Î‹RŒ’”Zi3V\rŽ\Â\â0X\Ü=^B¶…\ÄÒ…|6\'\rˆ§*UðøŠ5c*u¨Ö¥9S«J¤e\n”£(¸¶\ä“ö\Úý<Gû+ø\ì5¨º\Ö>xª\ê\æ_x£-\ä8/4žÖ¤EÁ®ið22vEªØ©¾²¡\Ô-l>Oð/Ž|Oð\ßÅš¼ª\Ü\è¾#ð\íü:Ž™¨Z¹I\"žÊ¸û²Á2‚\â	á¸·’X&I\"‘Ñ¿´ŠŸ|ñ›Àš÷Ã¿i0\êþñ«A<Nª.l®W\æ³\Õ4Û†Vk=OOœ%Í\Ôctr &’7þJ¿j\ß\Ù{\Æ_²\ï\Ä{¿	\ë©.£\á½A¦¾ðgŠ’K={GóHB\Ç \Ô\ì÷$\ZŽö{ið\Ê\Ò\ÛMksqþ¤}üsÁø£“Ïƒx¾Xiñ~RxbaIá¸¯*T½•lJ£5ì§\ãš\à¹*\ÓoF„ñpŸ\à\'\Ó3èŸ™ø\ÄÔ¼Lð\Þ\ê~fY­N®¥uðóˆ]x\×\Â\à\'Š§/¬R\Ë*\âc\Zœ;šºŠ¦²ŽWŠ«]<\'2þ•?co\Ú\×\Ãµ?\Ã\Øõk]+\â‡ ·¶ñÇ…\Ö@\Z‚i­\éq¹óe\Ñu)´móµ\Ék†$A5\ÇØ•üKüøÁã¯\Þ:Ñ¾ ü>\Ön4oIY‚\Öz•“2ý¯K\Ô\í[0\Þ\é÷\Ñ\rÍ¼\ÊAR$Œ\Ç<qKõ­û/~\Ó	ý§þYx\Ó\Ã\Ãe­Z,6~0ð«\Ü$—þÖ¼¼\É‹‘$ºu\ÑWŸK¾(«uoÁ\Û<SFŸÊŸHŸqfU8›‡(T¯ÀÙ¦%¨\Â*u*p\æ2³ºË±Rw”°5¦\Ú\Ë1sm¤¾¥‰“¯\n5±\èOÐ¯\éyƒñ\Ã$£ÀœmŠ£„ñ_‡ð)Î¬\Ý:4x\Û+\Â\ÅFY\Î\åŒs|4^y—ÓŒb\Ûþ\ÔÀÁa*bp\Ùo\ÒTQE.Ÿ\ß!EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE|ŸûGþ\Ý±\Ç\ì…k\Ï\í1ûJüø.÷Á¾\ãŸhšN·<·V—7Ö‹„\×O¬•¼¶³¸’\Òcb ¸1\ìŠVvEo\É-cþ¡ÿ\0‚$i7_b‡öªñµt·2\ÚÎº?ÀoŽ²\ÚÛ˜¤h\Ì\ßÚ·¿¬4k»f+º)ô\íFö9c*\èYNhú¢¿&¿g?ø.gü—ö¨ñ\à\ï„_¶g\Âû¿xšcm£ø+\Å\Ç\\ø}\âKË¡\ËöXm|k¤hv·8Ù„v·—\Æ\ÐKµú»kwk}m\å•Í½\å\ÌI5µÕ¬\Ñ\Ü[\\C \r°O<R\Ä\êC$‘³#$PŠ(¢€\n(¢€\n+\Åþ4~\Ñ\ß\0g/]x¯\ã\×\Æ†_ü?ic6§6¥ñÆš…bm>\Þh\àž\î\Þ-^ú\Ú\æòfš8\å{8g³€ø¯\ç;ö¾ÿ\0ƒº?\à—³º\êzÁ[¿ˆÿ\0¶lÿ\0´\íb´øW ¿…>\ZZ\êšuÀ‚;}gâŸ\"\Ò\àº\Óu4&\ãM\×~ø_\â^$J~\Ð\Ö\ÎUHõ3\\ŸŽ<}\à_†^Ö¼qñ\'Æžø{\à¯\r\ØËªx‹\Æ8ñ\á?\è\ZdtúŽµ\â\rzò\ÃIÒ¬a\0™n\ï®à·Œ¼€Wù†þ\Ö\ßðxwüs\ãbjú\ìñ\á_…¿²…\ïV·°Ô¼=¦Iñ\âD\Zu\Û[2IüQ\ã(\åÐ£\×4‘\êu\r+\Â\Zm÷\Ú	›IA\Z-6_´O\í}ûR~\Ö\Þ&“\Åß´¿\Çÿ\0Šÿ\0u¯\í\rGR³ÿ\0…ƒ\ãMo]\Ò4;YÌš‚ø[\Ãw_ðŽxF\Ê\å˜\î\Ó|1¤\é\Zj)\Ù¢\'\Ë@\ê—û]ÿ\0Á\ÐðI\ÙYõ\ÝGøÏ¨~\Ò~:\Ñ_W³ÿ\0„cö{\Ñ\Û\Å\ÚLÚ¾u¬ºqøƒ}6•\àY\"½\Ý$\Úfµ¥kZ¾‡&X5\Ç#0ßµ\çü›ûWx\ìjþýŒg†Ÿ\0ô;•Ô¬­~\"üUš\ç\â\ç\ÄÄ\î-e\Ñõ­\ÃÐ¾ð\ã\ÂÚ½¼1][\ê:ˆô¿Š\ÚM\Ú]¶û\Ð$§ø ®\ÏÀ?~!|Wñ^\à?…¾ñŸÄŸx†g¶\Ð<\à\ë~1ñ^¹qm4°hþðíŽ£«\êSG´¯•œî‘«;(PM\0}uûQÿ\0ÁMÿ\0oŸ\Û;Q¼½ý¤jŸ‹ÿ\0¬\ïPÏ†.<W}¢x\"\Ö\rQ¢kû\r?Á>m\'\Â\Ö\Z\\\íLt\Ëm*;(<»t¯„«ú@ý’¿\à\Õ\ïø+/\í6šNµâ¿…¾ý˜ü©µ”¿\Û\ß<Go¤ë‰§_\Ù=\ä:‚øÃ«¯x¶1*\Ú\Þiú¥†“«\Ù]H©q§ \Ëý9þ\Èðe\ç\ìqð\å´\ßþ\Ù?>\'þ\Ò:ôX]M\à‡\å>\r|,$Z\Ï©¤kz•Œº\Ï\Ä\ß\Ú=\Ó\Û\Üiº®âŸ†7v\ëEyaz“ù¯\è\Ú&³\â-N\ÓEðþ‘©\ëº\Åü†+\'F°»\Õ5;\ÙB³˜\í,,¢ž\ê\â@Š\ÎR‚«60	¯Ú\Ùþ\r\Úÿ\0‚µ~\ÙGD\Õ<û/k\ß\n<­Å¥\Þ\ÃñKö‰»¼º>·¥E¬\èþ °Óµ\Ûiþ ø·B\Ôl®-Œ\Z—€|\r\â\Øc’t[Ÿ!VWýZÿ\0f?ø\'O\ì7û\év:o\ì\Õû.üøW5„Zb¯ˆ4?iW1»¸\Ò,\Ú\Æ\ÏS\ÔüiªC\âKY6\î\ëu¬^\ê\ÓjW\Î\ï-\å\Ìò±zûJ€?„/\Ùþ øq£®¯~\Û?µ_ˆ|iz¥Ö­ðó\à‰„ô$3isG£¿<[¯­j\ËV’+‹n\Ï\ÃZ\Û-­„w:<{„þ¿doø\"\ßüö#mTøû#|,ƒ\ÇZ–wv?¾ h±|Oø£k«YÚ›?\í½\Æ^:\Z\Ý÷„5¸Y\Åðð*ø^\Æ\ä»\î±\nv\Ôz(8¢Š\ÒcŽ£P±\Å,q¢ŽŠˆ€*¨\ì\0*J( Š( Š( Š( Š( Š( Š( Š( Š( ¿ÿ\0ø=öJk¿þÉŸ¶Î£’ú5ÿ\0ˆgßˆº­¦ƒýUI<gðñõ½w\íA\ÊÁyg\ã=Lû¯õ[‘> þø+ògþû\Ûþ	sûYüÒ´\×þ \é\ß\ï>+|#¶‡HYÖ\Ä\ï„\Çþ}Kð\Ì\Ïm®ø\Ò\ÏJ\Õ~A{n¢\â/_„t1 ñu³»¸°»µ¾´\ÃweqÝ¬\ÊŒWÒ¬\Ð\ÊÕ‘Œr\"°¬¤Œ2‘‘_\í\åÿ\0³ýª`ý´ÿ\0\àŸ_²—\í\ZÚ¡\Õõ\ïü!ð´^9»›P²Ô¯\Û\â†\ì“\Ã>9}Z}>kHµk¯\é:Ž¡}e¼B\Æk\Ãk´ù[›üAký#ÿ\0\à\Êÿ\0\Û|wû/þÑ¿±g‰u´—\Ä\0þ \Ø|Xøo¥\Þ_iq\\Ið\Ã\â\ÜsÁ\âk\rI†uK«	|HÐ¯µj÷owŸ|?§¬\ÐFm` í¦Š( Š( ¼3ö…ýŸüûH|9\Ôþx\â\Ô*\Ëu\áýz‘µ?k¢	\"´\Õôöb…\Äl\áolZDƒQµ\ßm+#¦‡\Ü\è¯C*\Ís2ÁfùF2¾_™\åØšX¼7\r7N¾FJP©	.\ÍZQ’pœ¡8\Ê”_\Ä?’ñ^Išp\ß\å˜L\ç\"\ÎðUò\ì\×+\ÇRU°¸\Ü\"hÕƒ\×Tù¡88Ô¥R0«Jp«N?\ÅG\Ç_‚9ýŸ>#k\rü{§µ¶¥¦I\çiúŒI)\Ó<A£Nò\r?]Ñ®dDZ}ôq¶%­\Ìw6‘ÁguoCû5þ\Ñ>5ýš~%iž=ð\Ã\Ëj^+?xzY]tÿ\0h-(k­6ñUfU/.Ÿ{±å°¼\Ù<a\Ð\Í\ß\Ô\íyû\'x7ö«øzú¨¶úGŽ´\î®ü\ã/\'7\Z>¡*«K¦ß´jf¹ð\î°\Ð\Ã©h†K}J\Ú\'¼²‰$þL¾#|;ñwÂ\ZkþñÎ‘q¢x›Ã—\ÒX\ê67ø”†\â\ÞU&;›;¸+«+¸Yà»µš˜$’cvÿ\0W¼ñW‡|w\à\ÜvE\Ä8Ló\ê8©q_ÖŠú¾a…ª•\íl6ùž7u	{l¯\Z\ãM\É)`±8ù\ãúJ}x\×\è‘\ânUÅœ˜f´¸G›ÿ\0jx{\Æ8i\É\ãr|\Ã\'‰ÿ\0W³zñ‡³Žk¦¦©J´^?Ê£:ñ„\å\Û‚þ\Êþ|eð?ÇŸ‡\Ú\'\Äo\0\êI}¤jÐª\ÝZ;\Çý£¡\ê±\Ç_hz\Ä\Ìmu+‘VD9Žx^\Ëg–\Ò\æ	¤õjþ@ÿ\0c\ß\Ú\×Å¿²¯\Ä$Ö¬¾Õ¬x\ÄZZx÷Á\ë\"Õ´øZA£§‰™!¶ñ\'žm.\è¼i ’\ãO»±\ÞLWú\Êø\ãÿ\0	üPðvƒ\ã\Ïjöúß†|Ia¡¦\ßÛ²œ¤ƒ\Û\\\Æš\Úú\Î`ö·Ö’\â[[¨¥†@\rø\ë\à¦e\á.Ï†Uñ\Ü›V©,‹5’\æ	YÔžQ˜\Ê)Fü,o\ìª{°\Çá¢±4”jG‡\Ã¯D¿¥&GôŠ\áex\\«Ä®\ÃQ‡ðý9rS\ÅBñ£O‰2HM¹\Õ\Ê1\Õ9Uz	Î®QŽ›À\â%:50\ÌweEW\à\çõ\ÈQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\Ó\Ãm·\Åooo“O<Î±C1!ye–Y\n¤qFŠ\Ï$ŽÊˆŠYˆ\0šÿ\0?¯ø.·üU\ã+\Åþ;ý?\à˜ž\"µÐ¬<>ú¿ƒ¾)þ\×VñC{®j\ZÒ‘c«\è?³\áy%³\Ñ,tô\Ý2û\â­\í¥Æ¹w«n~E\áøôm+Æºÿ\0\èü£ÿ\0Tñ\ì‡û8øWö0ø)\âyü=ñ«ö©\Ðõ=G\Ç\ZÞ‘yw§ø‡ÁŸ-¯g\Ñn§\Ò\î\à‰^\Ú\ë\â·e¬xj\ë;\ëk\ë[Ù´\Æ\Õþ`\×x\ë\Çþ9øŸ\â_\Æÿ\0üa\âoø\Ã_½¹\Ôu¿x»[\Ô|A®\ê—×“\Éuuu}ªj—W—\Ïq4³;I)Ì’3`d\×#E\0W\ïü«þýº?\à™&ðÿ\0†\ãñž±ûB~Ë‘6§kÿ\0³—\ÅOj:®—£h6³\éñ´Ÿ<Y|u\ro\á6µa¥Z\Ý\Ø\èö\ZI¾øt\Ò\ê7\Þ ø¯_A§\Ü\ØþQ@\îuû~Ü¿³\Ïü3ö}ð§\í#û5ø­üE\à	,õ+SŠ\Þ\Ã\Å\Þñ-¢FuOø\ÛD‚\îôhþ\"\Ò\ÚX\Ì\Ð\Çuwewo,úeõöŸsou#ÿ\0iÿ\0\Û\çö.ý‹ü?7ˆÿ\0jO\Úg\áÁ‹T±»Ô¬ôø¿O>4\×m,\Çz|\'ð÷J}KÇž1ž\ÕÔ¤ö~ðÞ³y­n\Å‹ÀŸ\Ûcö¶ý˜|ñÀ?³\Ç\í\rñW\àÇ„~,Å§\ÅñGøw\â\ÍG\Ã	\â#¥4‡N¹’\ïM’CO¿³\Ë:–“wa¨,2I¹0»F~xñ‰<C\âýwVñO‹u\ík\Å&\×\ï\î5Mw\Ä^\"\Õ/µ½wZ\Ô\ï$2\Ý\ê:¶¯©Os¨j7÷R³Kqyyq5\Äò1ydf$\Ðú_~\×ðy—\ì9ð­õ\ÍöTøAñCö™ñ‹jvzoŠ5Á\Â†——¶\Z…¼—q]\ê\Ñj¾3»\Ðu‹uwgx|+§\êV\ìG{¤B\Ò2§óû^Á×ŸðV?\Úa5ü:ø…\á\Ù+\áþ¦º…Ÿö/À_[Á\ã™ôË›\Ë[½<_ü\\ñgöÿ\0t\ÍkJû/‘·ð\Þ\ã\á»^Ásw¡eq\Âÿ\0š\ZûKö\\ÿ\0‚t~\Ý¶¦©›û.þ\Êÿ\0¾0@\×\í¦]xŸ\Ãþ¿±ø{£\ê+mö±e\â?‰ž \Z?\Ã\Ï]Ko‰m\àñ‰ô\É.U¶Y•H\Î¾.|Sø\Ë\â;\ïüZøã‰ž)\Ô\ïo5ÿ\0x\ë\Å\Z×Šuk«ýB_>ú\î[\Ýjòòs=\Üß½¸p\à\Êÿ\03\ä×žWöû%ÿ\0Á˜¶O\Äq¦kµ§\Ç_†?³¾‡pöò\Þx_Áp]üYñü6wr²¤ð÷„m5;;ò¶7–c\\¿µ)¾\æ\ÓQ¹UT\é\ëöAÿ\0ƒW\à’¿²\ãiº\ïŒ~\ëßµw\ìdµ»\"ý£5\Ó\â?\n[]¥“\Ú\ßAað›AƒAøq}£_J\æò;\è~<\Ô4û„‰¬µ¨öÀ\å}ð3ö\\ý£ÿ\0i­z\ß\Ã³\ßÀßŠu»›³a—Ã¿\ëþ\'U½ý£\ì“\Ý\é–3\ÙZ\Ü•bº¹…\Ù\n²‚sý!þ\È?ðhü\Ó\ã\ëi:\ï\í©ü1ýŽü	\ä¯\ãY>$|T“N\Ôô˜µK­;á€\ïŸN¶º¶žtÓµ­Çž?ø\â\r\"\ê;”}.\âH-þ þøkð\ï\áW‡\ì|\'ð\ËÀžø}\á6\Î\ÃN°\Ð<\á\Í#\Ã:E­Ž—kŽ›k†igl°\Ø\Ù\Å­ªùdC,i…®Ú€?”?\Ù/þ\rÿ\0‚füm+[øññ;ö²ñM¢E-í§µ\×ðG\Ã\é\î\ä\Òg°\Ô ‹\Â~}/R“Kk»ƒ©\é±j>%¾\Ôlnm\íw\êW)£ÿ\0HŸ?e\Ï\Ù\ÃöZðÁðo\ì\åð7\ágÁOKœw¶\rü øZMeôø„—~!\Ô4»(5/jQD6ÿ\0jk×šŽ¥!%\åºwfc\ïPEPEPEPEPEPEPEPEPEPEPEPEPP\\\ÛAymqguOkw¶\×0H7G4\Æ\ÑM‹\Ý$™wREOE\0‰ü¿öN›ö&ÿ\0‚Œþ\Ö³\ÄZ3h~ð·\Å}{[ð’iP\è–#\áÏ¥0ðGö6™o,\ÑZ\èpxZ³±\Ñ\ÕUôûH$X\ãW>ôÿ\0ƒaÿ\0kû+ÿ\0Á\\>Áª\ê\é¤x/ö„°ñ\ìñ\ã¹Ô´­Mš?Eo\á#ª\ê:´\Ã¥§´^\Åm«s¨jYXÛ¬“O\Z\×\ë÷üµû |zý—¿m¯\rh\Æ=#\ãƒu¿‚?µ-3Ë¶ƒ\Çÿ\0¤‹]ð&£®j\Íp\Íu«x\ÇÀšö«¢\é61\ÛG¦—ð–\êg‘¤¹þ\'|	\ãoü5ñÇƒ~#x/R—Eñ€<W\á\ïxOX…Q\æ\Ò|K\á]^\Ï]Ðµ8’Eh\Ú[\rR\Â\Ö\ê5‘Y¢”©\"€?\ß6Šù¿ö<ý¡¼7ûYþÊ¿³\Ç\í/\á2©¢|pø=\àˆñ\Øý¾\×T¸\Ðõøv\Âÿ\0]ðÆ¥{dM¬ºß…5\Ù5/\rk\Ë\rkJ¿·!Z\"\Ò\0QE\0QE\0WÀ·w\ì_¤~\Ô	:ß†\à³\Ó~1øJ\Æc\ámZM–ðøŠ\Æ3%Äž\Ö\î1³\ÜH\ÒI£\ßM»û+Q•þhì¯µ\r\ß~Q_EÂœUðV—q/c\'‚\Í2\Ê\ê­\ZŠò§VÝ­…\ÅRº|&*“•M	{µ)NJñ—,—\Åø…\áÿ\0\nø£Áù\×q¦YO5\áü÷,>*„­\nô*E©\á±øEœð™Ž\Zx¬.Ÿ¿CN´£\Í	ºî…¬xcY\Õ<;\â\r6óG\Öô[\ë3U\Òõy-ol/\ì\åx.mnm\æT–¡•C+¯¼`ÿ\0\Û[Wý˜¼`¾ñU\Å\î§ðk\ÅW©ÿ\0	–›®&ðÎ£1†ñf‹\Ì\å\í\ã@º¾›\ß\íK5\r\Zµõ­ \Õ_ø(Ÿ\ì$Ÿ4›¿Œ\nt´O‹º\r†u\Ý\Î=‡\â6‹c\î\â†%\Â?Œ4\È#òô¹p%Ö¬•ty\ÚY\íôqóSqö³\Íms\\[\Ë$3Á24r\Ã4Nc–)cp¯‘º²:8Œ¥X¯õƒ„8«þ‘\Þ\âðy†•O¬P§ƒ\â\\†u\"ñ¹&g\Ê\åGƒª\â\êF¤%Š\Éó(B\ÓP•:‰W£‹\ÃSÿ\0ž|=ñ[\èK\ã^[™dÙŽ&“Á\â«f|\r\Å\Ô\èIe|S‘©Æž\'/\Ìpñ’£:ªX\à8“#©;\ÓuaZŒ¥„\Åe\Ø\ê\ß\Üö‰­\é$\Ñô\Ïh\Z•ž±¢kV6Úž“ª\éó\Çuc¨X^D³\Ú\Ý\Ú\ÜDZ9aš\'WGS\È<\à\äV¥5_ðN¯Ûº_‚Ú½—ÁŸŠú¤’|%×¯\Ùt\rröIe?õ\Ëù\Ô\îgb\ÞW„uK™$—Wˆ+H¾—ûj/\"	5Ÿ´ÿ\0JQKñG42$\ÐÌ‰,R\Ä\ë$R\Å\"‡ŽH\äBQ\ÑÔ†GRU”‚¤‚\rš-øUžxO\Äõr\\\ÉO–bLFAF›†5ÀFI]\Úñ¥Ž\ÂóÂ–?	\Ì\åB«H:˜Zøjõ\ÝO£Ÿ\Ò…>ü‡âŒ\ÓÀg\ØC\Æ/:Ê¦3‡ó‰Sri_–xœ§\ÉV¾O™(Fª©F¬h\ãð˜\ì&ôQE~X~þQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\ïü\åñ§Yø\Éÿ\0£ý®¢¼Ö®uO|(½øuðwÁ¶33›\éžøa\áñ&•b\Ìp\Íñÿ\0Æš\Ì\à|¯{ª\ÝH™FZü	¯Õ¿ø.tw‘ÿ\0Á_¿\à¢?m¶»µ‘ÿ\0j?‰rB—ˆ\é$¶mªŸ±\\\ÄÖ—V‚‹\'\\£\Ú\É	RF\r~RPEPEP_\ÙOüþ\rH\Óÿ\0oŸ\Ù\Ç\àÿ\0\í‘ñ\çö·ÿ\0„;\à\ç\Å\í?[\Ö<;ð\×à§ƒ¥¿ø‹s¦i:·ˆ<#tšç¾ [[xwÁ\ÚÎ•\âýò;?NøñLÕ´¨7\Úkö\ÝG,Æµ²—ü»\áMWÁ¿ðF?\Ø7J\Õb’¾øO{\â»¤Ò¼s\ãOx\Î\ÂU	ÈŽ\ê-{í‘—ù\Ù.\Ï\Ê\Ë@ß²wü¯ÿ\0—ý‘¿²µ/~Ë¾ø­\ã1Uÿ\0\á5øù,Ÿµ+‹\É4‰4}B\ãûÄ«?„-\á\Ôaž\âyt\Ø<:ºuµ\Ü\ßh²··–(]?k´#I\Ð4½?C\Ðt½;D\Ñt›H4ý+H\Ò,­´\Ý/L°µaµ±\Óôû8¡´³´¶…(-­¢ŽcUH\ÑTZ4PEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP\àü³û%\Ú\Çþ	%ûCZišCj¾5ø“ûBx [irjÚœ7Ÿ¥šOG¦E±›Yo¼¨øž\Æòü‰¦—=ôŒ…\×øû\×û\ìx³Â¾ñ×…|M\ài6º÷„üc\áýgÂ¾\'\Ðïƒµ–³\á\ï\é\×:Fµ¤\Þ,o†\×Q\Óo.l\îr#˜¦p®­†\á™ûnþÍž\"ýk\ß\ÚCöañG›.§ðK\ãü	o¨I§¾’šÿ\0‡ô½j\äøO\ÅVzl’\Ìözg‹¼+6\â}&–F]/W´\ÜÄœ\Ðú6Áµ£ücÿ\0‚ux\Çöm\×57ºñ\ì©ñWWÓ´+[›­4I\Ã‰\Í74x4ý>\Ö8¯WO±ñdþ1i\ï\ïŒ\Í=ö¥$)(ŽAýs\×ùSÿ\0Á¢?µ\Ä³ÿ\0ü\Z‚^ \Õ^\ÃÁŸµ÷\Ã?ü4X\äž\Â\ÓM|ÿ\0>^jw7`N\Æ\ê\×KñŸ‚ô[)Ú‰<m¢ÀRL(_õX Š( Š( Š( ¿?à¥¿°—öô:\Ï\íð{GÛ,Ú—\Å?	i\Ðü\Ú\Ô +\Üx\ßH¶ŒcûV\ÝC\Í\âk8—:¤;õ¸”jQjGUý»¤e¥YC+¬¬VR0A‚\àƒÁ\Zû¿|BÏ¼3\âŒd5Ÿ´¢\Õ\ÃRRXL\Û-œ\ã,N_ŒŒw§UEN•K9\á±¥‰¥û\ÊQ?$ñ³ÁžñÛ€³>\âü7\î±\ëY6qFœ%˜ð\îwFœ\ã‚\Î2\Ù\ÎÖ­E\ÎT±£K‚«‰À\â?sˆ¿„Šý\Ãÿ\0‚j~\Þ\Ø\ï¢þ\Î5…]\Ì:o\Â\ßjS\Ç\Zi±ò\í|­]L\ëÿ\0¹Ù’\Þ>N›9]g:t¶\Ù|üƒö?o5O4—>Ô®\Þ\ï\Ç~°‰œx?R¼›/­\é\ÖñF|¯_\Ï&.bE¢^Hˆ4\ëˆR\Ïñ½\âut,ŽŒXd2²œ‚=\"¿\Ô\Úôx\é)\ášq—´Á\ã£\ÍF·-7›ð¯P¦®¥þ\ï…u9j\Ó\æX|\Ã[IO\rŠ…Cþð˜Ÿ>ƒ~:\Ê5!\ìs<®qŽ\'\ÍYp\çˆŠ¯t\á>_\ßeù„h9P¯\É,^M›aý\èS\Ç`*\Ñ?»Z+ñÿ\0þ	Áûv\Åñ?M\Ó~ü[\Ö~#i6«m\àŸ\ê7\n$ñÎ™k°\Ñ\ï%püM¥Z\ÂL³<šÞŸ2\çS´–mOö¿Ê®>\àLÿ\0Ãž&\Çp\Ç\á\Ý,V^\Ó\rŠ„eõL\ÏRRXl\ÇRI{\\6!E¯\ç¡Zp\Õ\ãOB­8\Ð_ƒþ.p¼”ñ\ïc=¾cÀV”c\æôaNX\ì“6£ý†;*wW£‹\ÃT\Ãcð“­‚\Åa\ëT(¢Šø\Ãõ\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(ü¾¿\àñ?Ø§Xø/ÿ\0ð\Ï\íy¡i¿ð®?k\0\è)­\ê©m;Lø\Íð«H±ð^½¤ÿ\0£\Ú\Çk¦Ç®xNð7ˆlbº¹’ÿ\0[Ö—\Æú‚©†\ÎF_\ä2¿\Ûwþ\n¥ÿ\0\êøoÿ\0@ýŽ~\"~\Ì^:’\ÃD\×õ\ãñ7\Â\Ýi\âö\ç\á\ß\Å\r)\ß\Ã^#£_·G§\ÎòÍ£xŽ\Þ\ÆE–ÿ\0\ÃÚ–£h\ÑÜ«‹y?\Æ\×ö¶ý’~<~\Ä?<uû9þÑžÕ¼ñ#Àz­ÅÕ­ý­\Êi^!\Ò\Öyc\Ó<[\á\rVXbµñ\'„<Co¿\Ð|A¦´\Ö\Z…¤£J’\ÅÍ”QE\0QOŽ9&’8a\å–WX\âŠ4g’I‚¤q¢‚\Î\î\Ä*ª‚\Ì\Ä\0	4\ê_>ü@ý£>2ü.øð«G:ÿ\0ÄŒ;ð¿Ã¯ij\Û\Åy\â?\ëš.–·wr~\æ\Æ\Æ;«\Èå¿¿¸+mcg÷w\Â\ì?\Ýö|ø\'\à\ßÙ¯\àWÁÿ\0\Ùó\á\â]§~	ü6ðg\Â\ïBDšý¼?\à\Ã\Ã\Ú\\·óF‘G-\ìÖ–\Íw*F‹%\Ã\È\êŠñ\éÿ\0µÿ\0Á\n<Eû6Z\éÿ\0ðQ?\Ú\ãÁóh¼U\áû«O\Ù\ï\á‰,&¶Ö¾ø[\ÄŸg¾ø‰\âš\'\Óü_\â\Z\æ\çL\Ñô‹ø$¸\Ñ4+û‹«˜,õ{ˆ>\Ëýµ\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP_\æÿ\0“þ\É#\á7\íûð\Ûö¢\ÐtU³ð\ß\íCðª\Â\ÛÄš…¦•}\rµ\ç\Äß…/†u­KY¸¼¸µ¿Ö¯¼?ƒm–\Ê\Î\Ú\Ål4Á¤Žg¹iúyWóÿ\0h~\ÇOûJÿ\0Á+¼Kñs\Ãzk¿c\ïhŸ\ìd±Òµ\r[\\?µGÁ\ßllVÌ´V\ZV£\êš/Ä¯ê·´øg{+Moš\\ü¹ÿ\0goŒž$ýþ=üøó\à\ë\Ùt\ïüø¡\ào‰zôö\×sZ\êžñ¯\ÚM\rµêµ¤ò¤– \ÇÊ˜]ð²|¤\×û¨|\"ø—\á\ïŒ\ß\nþ|\\ð”\Ñ\\xg\âoü-\ã½\ráº·¾U\Ó|S¢\Ù\ëV°5Õ£=¼\Ó[Gx-®\Z&(\'ŠEÀ þ	uþ´\ßðjW\ímÿ\0\r3ÿ\0•øo\àcS[\Ïþ\Ê>0ñ/\ìõ®Á\'ö]½\Èð¾,üYð\Âö\r:Á\"4xü\â+Â¶Ú¥üF\ãW\Öü!\âI\Z{‰m§e\0þ”¨¢Š\0(¢Š\0(¢Š\0(¢Š\0­ygi¨\Ù\Ýiú…¥µõ…õ´öw\Ö7EugyguAskum:¼7\×»\Ã<#\Å,N\ÑÈ¬ŒAþaÿ\0\à¡°õ\ß\ìõ\âY~#|;\Ó\î.~\rx¢ÿ\0Áu/€õ«£$‡B¾‘¼\É‹p\Ê\Ç@Ô®¶\Óý‘}+\Þ\ÃmuªP5\Ïø¯Â¾ñÇ‡5Ÿ	x¯I³\×<;¯\ØO¦\ê\Ú]üK5µÝ¥\Ê‘0\Èx¥\\Iª’\Ä\Ë\"+\Öüñk:ð—‰¡š`ý¦3%\Ç:X~!\É}£,\Ã>Z´¹¯\nYŽšu0X›^.U(Toˆ­9ý%¾Ž¼1ôŠ\àJ¼?™û·Šr¥_ÁœS\ìyñ6g8GŸˆpµ\\FK™û:T3\\•§P\ÆQŠ\Æà°µ!ü9X_\ßiW\Özž™yw§jZuÕ½öŸ¨X\\Mg}c{k*Okygwnñ\ÜZ\Ý[O\ZMoq‘\Í¨’D\ê\ê¬?¨Oø\'\ß\í¿gûGxZ?‡þ?¾¶´ø\Õ\áM=>\Ö\í\å\ÛE\ãý\Ùv\ÂG§B»bMf\Ú5A\â]6\0¨ec¬i\Ð\Ça=Í–ø¯ûo~\Æþ ý—<t\×:j]j\ß\n¼Suq7ƒµ÷\r$–L3,¾\Öd\nu;9†S¨YªÜ®dK•\äø\ËÄŸ¼S¡ø\Ï\Â:­Ö‰\â?\êúž•©Y¿—=µÕ»‡V]f9b‘^)¢wŠTxÑ¿\Ò.<\à®úEøy\Ç\å8\Ü<«\Õ\Ã\ÏÂ¼C\'[.\ÆIr\×À\ã¡ÕŽ­Zk	›`e\ïÑ«J5¡¬a¨³ü@ð‹\Å/¾…>3\æ¹?\åx\ÚxJ\ÚYGˆ<R­°\Ù\ÖY	{L.m”Õ°ó\Æ\Ð\Ã\Öy‡\æ\Ô\íG‡\ÄO\rVR\ÇbbrW\Æ?±—\í{\áoÚ›À1\\4¶ºWÄ¿\Û[\Ûø\Û\ÂþbG!˜*\Æ<A¤ÀX¼š.¥\'Ïµw¶›r\æ\Êveû-\Å\×\Ù\ÕþOq\'g<#\æ<;Ÿ\àª\åù®Yˆ–‡ªº­iÖ£5\î\Ö\Ãb)¸\Ö\Ãb)·N½Â­98\É3þ‡øøc\Ä~\ÉxÓƒ³Z\Ï\ç\Ø8c0\Ú[;Æ¶EþóŽÁ×L.;^0\Äa1Tª\á\ëB5)\É\"Š(¯úÀ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¯\Ï\ßø(Oüö?ÿ\0‚›ü,‹\á—\íOð\Ê\ÇÄ—ZZ¤Ÿ>%h\ÄhŸþ\êÚ¥›[Ë¨ø7\ÆŠº½”·eªøZý\ï¼#\âK­+JohZ Ó¬ü\Ð*(ü\ÈmOø3wö\âøS®_\êÿ\0±—Ž¼ûPx\ëS\Õ_Jðçˆµ½\áw\ÄýC`“M]ro_i^ñ¥r$¸‰\äÐµg¶\Þ4ø<ø£¯\Æý_þ\rýÿ\0‚\ÈhºÄš%\×\ì	ñ®k”\Æ.\ìcð­þ(iš\äë–¾$“H\ï\\”[\Ï1c)3\"\Â\è\íþ\Í\ÔPùþ\Ï_ðj\×üã–³kg\âo\Þ\Zýžô3ª&ªx—\ãg|=¦A¤Á-\Í\Ìz·ö\'„n|]\â=cNA”\ÇB\Òõ+\È..a2Yˆ„’\'ö‹ÿ\0¢ÿ\0ƒ]?cø\'Îµ |iøÙªÿ\0\Ã\\þ\Ó:PÓµ\r\Ä/ðõž—ð‹á†³l\Æó\í>\Ï&§.£¯\Ù]¼p\Å\ã¿\Z\êz¥û\r/O\Õ<3\á\ß]\\ê¶—Ÿ\Ó\í\0€\0\0\0\0\0\0€\0\à\0\0\ÐR\ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0\åŸ¾øk\ã\ÇÁ‹üe§\Ùj¾ø·ð\ç\Æ<E¦\êQ¼\Ú}\î\ã/j¿·½†6W–\ÖK{÷Y\âS™\"Üœ† úþþø“\à/\ÆŠ¿<_kg\âo…¼]ðÿ\0Y‡S\Ón´{\æ½ð¦¹{£=\Ìú]\àV?m[E¼Ž\ÞlºC<3ÿ\0Y¿ðfW\íf>~ÜŸÿ\0efø[xwöøW·£\Ã#\èÖ¶\Ò|Dø9u{ª\è­5\åýÝ¶¥q<\Þñ/Œ\ì4ý#H†ö[Ë›\Ós<	\r‰™>Tÿ\0ƒ³ÿ\0dQû6ÿ\0ÁV¼Qñ;BÒ’\ËÀŸµÇ€<9ñ\ÇLš\ÏN»¶Ó¡ñ\Ü\\ø\'âž“.£q,±j~ ¸ñ‡­þ keòâ±³ø‰¢[ùI•\Ï\âOüÿ\0öŸ¿ý‹ÿ\0moÙö£²û{[üøÁ\áøŠ\ÛI¶µ¼Õµ›õÒ¾!i\ZM½\ì\Ööoª\ë>Ô¼E¥i¦\æ\âc½¼‚Y%EBÀý\Î(¬\íV\Ó5ý\'K\×t]B\ËVÑµ­:\ËV\ÒuM2\îý7R\Ó5+h¯,5\r>ú\Õåµ½²¼µš+‹K»id‚\æ	#šx\ÝX\è\ÐEPEPEPEPŸüPøc\àÏŒ^\×~ø÷H‹Xðßˆ-Z\Þ\æ\Â\\\Ù\Ü(&\ÓS\ÓnJ³Y\êz|\Ûn,\î’.\ÉX$š?’\ßÚ¿öYñ¯\ì»ñ\ï\Ãz\ä3j>Ô¦¸ºðW‹¢…–\Ë^\ÒDŸ»\ã)i«Y«G§§—cÿ\0</5¤\Ö\×bU\âŸ~ø\'öˆøs«ü<ñµ k{´kW…\ê>\ÖcFz¶+‚VH™¶\\BO•yjóZ\Î\Z)XW\ïþxÝ˜xOžýW*ø\Þ\Í\ë\ÓY\Ö]\ç<W\ËMg9u6\ì±t ¢±4ch\ãð\ÐT§û\êXZ´Ž¾—ElŸ\é\Â\ÚL0¹g‰ü7„¬øc9š*Y®sV—guTy§—âª¹KŠŸ4òŒuYb)_\r‰\Ì0ø¯\ã\ï\á/ÅŸüñÞ‰ñ\á\î³.\â\ådC†’\ÇR³f_¶i\Z½žôK\í+Q„5½\å³21Fómå·ºŽˆ¿­\ï\Ùwö˜ðW\íAð\Ö\Ç\Æ\Þ’=?[µXø\Ë\ÂRÜ¤Ú†5Ád\Î\Ø\Þ\ëK½\Ú\×\Z>¨°¤W¶Û£‘-\ï\ío\ì­?”Ÿ|sû<|F\Ö>x\æÅ¢º²•¦\Òuh£i¾!Ñ¤‘Å–±¦L\ã\ÌkûØ·4–—5¬\Ä\Éf\Ùý›?h¯~\Í?t\ßøBá¥¶\ÊYx—@šG\Zwˆô)%\î´\Û\Ø×¿\È%´¹Pf²ºH\îa;«ÿ\0sø\Õ\áE\ã	à¸†qñ&/Ž3†óª3‡Õ³¬¾¬^\"N2¼~,=w\',jžö_‹œ¯\ÉJ¶.ÿ\0\'>‹Hþ-ú*x‡™ðW`óZ\\Œ\Îe–ñ\Ï\â©\Ôúÿ\0\ç\'%N!\Ë0Ž\î8\ìiÂžg…¡\îg9m:j>\×†\Ë*\ÒþÍ¨¯$ø%ñ§Á?þ\è¿<\r~—Zv§\Û’6¿\ÐõEE7šF¥1ò\îm°¯\Ì;˜IŠU5\ëuþR\æ9~;)\Ç\âò\Ì\Ï_˜`1p˜\Ì&œ©\×\Ãb(MÓ«J¬%¬e	&ŸGºm4\ßý\n\ä¹\ÖS\ÄyF[Ÿ\ä9†6É³Œ1\Êó,\rh\×\Âc°XºQ­‡\Ä\á\ëA¸ÎZrŒ“\Ýk%$\Ò(¢Š\ã=0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(øüÿ\0ƒ\Éÿ\0d\ßø[ß°\Ã\ÚcD\ÒbºñG\ìµñ^%\Õo¢\Óõ\íN/†\ßm­ü;\â;X¥µ\Ýk§ii\â/Á:¾«}z‚<iV°,Šò­˜Uºo\í\Ëû4\èß¶7\ì{ûI~\Ì\Z\Úi¾OÆ¯„4ðV“u¬¶\Òô\Þ\é3\Üx\ÄW\Ñ\Ø\Ë\r\Ô\Öþñ®ƒ\â·ŠAö¦y²G#\Æ\ß\á™\âOk^ñ¿\á?i—º/ˆ¼/­j¾×´}J\ÞKMGIÖ´[\éô\ÝSL¿´”	-ol/­§µº·†x¤\Æ\å4þÁ¿ðn\'\í`?k/ø$\ìÁ«\êZ£j~2ø1\á\éÿ\0g¯™£\Óí§Šo„\îš…1gc+´vƒÀC\ÂÖ¶÷w‘\Ãu©Iguy2¼’<¯û£_\çuÿ\0M~\ÖK¢|Sý­?bmwQ[x\ï\Â\Ú\íð\ê\Éâ±‚5\ï]Yx\âM¿\Û$e¿½\Ôõ^ðö›¥A\æG›\áŸj,Š±J\ãýh\0¢ŠkºÆ¥Ý•FYÜ…U¥˜€¹4\0\ê+ÿ\0Ä¾\Ò\ãYµ-wH°‰\É%Þ£idŽNIUx\ï\Ïë‹½ø\Íð\Ê\Æao\'‹ô¹¦bÁ\ÎF½T!\Õ%\Î9\\ƒ\ë@ŸE|ý¨~\Ò\ß¬DŠ.µK™£l¢\Ó\'M\ã$e^a\Z‘\ÇlðA\î3\Å^þ\Ö~EÎ\á\ÍJ\à† ‹›«K|Ð¨\ÞÇ‘\ê\ã\Ü\ëj+\á«ÿ\0\Ú\çS\Ît\ÏiÀ÷o.\î¤*y\Æ\ï)!Ž8V ’~|žJ\ïö©ñü\î\Æ\Þ\ßE²³…K\'¸d\Ï@³! „¶Gp\Ü`ôJŠüÀ½ý¢>*]«¢xŒ\Û#\ç‹[A\'8“È’\à\ÑJÎ¸A 5r·þ$_+%×Œµ÷RI\n—\ïR\Ü¸RGaÁ\ë@aþ\Ö²Ï‚ÿ\0jo‡“xc[\é^,\ÒR{¿ø½-\ÖK½Rt­\î\0\Û%Ö‹¨”Hµ+-\ã\î\Åw[«hš¿ôø#\ß\í\rw=\ÌZÇ‹~\Z\é1#ks­¬\ß\Å:\ã“\"E ¬ð\àð“&G\ÌvŸý{y\â¯\ê*«¯\ëWF\íZ­ý\Æž\ËpÈ dŒ*¨\äñ’s\ïŸ¾5O\áøü3\âK©fðÖ¡:¬;Ht{©\ß03­¤\ÌW\Ï^B·\ïß²ð^$xs’\×\áþ\Í0\ß\Ùu1‡¡™`©\æ\Ùõf\ï_û?\Û\Ê\Ô)be\ïÖ¡(Ô¡\í\\\ëS§NµZ\Õ*1ø»ôBðC\Æ\Þ)\Âñ—d9‡öõp8\ÌVGš\×\É¶°ôRŽ\r\ç|U|£†\ÅS©Cõ~L-z\Õð\Ø|-*yû~Â¿¿eŸ]\ë÷Ÿ<)?„µ8¼¿x#Mðþ³«\éº\ì1+nRûQ¿ð÷ö§d\ì\Ïo©Ee¨,\Ëö²\Å3mý¹ø¿ð\Ê\Ò³M\ãM\Î2y!!¸{Ò–#W¶ŽhÙ‹ +œžk\Ñc–9£Ibu–)QdŽD!’H\ÜWV¬¤G\Zø{ö„ø-ö6»ñÇ†-H´•š}oO·‹iX–{øbAþ¢C\Í\Ê(ùù\Ê>ú¿\Äq¯\çþ gs\â%«‚\Äf•(\Ò\ÃÔ¯ƒ\Ë0oµ§E8\Òu\Ö…‰«¿g\Zø§Zº¥\ZtUOcJ•8~«\ág…<\à\ß\n\Ò\à\Î\Ã\æx<‚†/£„Ì³\Ì\ß;öñrS\Ä}RY®/°4*\ÔN´ð˜á°’\ÄÔ¯Št\'ˆ­W\ß/¿h…\Ús”¹×¦\à‘˜´½Fp@\êWÊ¶bG¦[°\'Š\æ\çý§þD\áaþÚ¹RÁVXôóg\'\0±žHü±ÝšMª£– Í¿ó\ëúŽ×½ò\'\è\ç\è]÷\íY\à\ÛWa«\Þ ?+C-€\'œghlzûc©\Ís÷?µÎ–2m<%x\ëü\"}F\Ùò:\íg×žzWÂ”PÚ·Ÿµ\Ì\ëƒe\ákG\È\åf¾¹8$-¡\èz\áˆ\ëŒñœi¿koJ?s\á\ÝÛ¯ÞšöV<ñ\Ô2Ž8\Îs\Ûü‡E\0}Q\'\ícã’Œ±\éFþ<›\ÉSŸ½sŒc÷MŸnA\Ë?µ/Ä’ùÎ‰\Zz\r1d9\Éþ,|úé‘Žù5ó]ô<ß´\ß\Å$Å¨i±“\é¤[m=B\Ë%Àö\ÇNŸ	?iŠ\Ó\0$\×mÐ€A0\é6g$ùd‘r0@$ öðz(Û¿\á¢~-©>_ŠB©\ÏH\Ñ\ä\Æ}\î,\î\0ÿ\0k Œƒ\É\ÍFøùñY\ÎO‹n\Ô\ã%½¢€s\ÛV%\\ú|¸\ÇŠñ\Ê(\Ù\Ç\ï‹^[Gÿ\0	…\æ?a\Ñ÷ps•\é\Æt=3¶qŸ¡\"ª·\Ç?Š\ÌÅ¿\á2\ÔÔœ•mñ‘\ÆBùA\0#ª…\nO8\Ï5\ä´P°\Åñ÷\âô@\ãK¶\Ú\ê\Ã\Ì\Ót9~\ãP\Æm.I\0ui\nH¹GVBT\ß´w\Æ!Œø®#Œÿ\0Ì¿\áÌŸL\ãJ`:t¯¢€=\Ò\ÛöøÁÅ¼òøš\Þò8gŠim.4\r-®\ãŽEwµ¸kM6\Ö\í`A†VµºµºXÙŒ0Ë¶U\ë\Ç\íkñø´O~\Zvº?Ÿˆ\Í|¹E\0}Soû[xùn­\Þ\ëAð„öK<Mwooi­Z\ÝOl$S<V÷’k—‘Z\Ï$A’+‰,/#†B²=´\ê¦&\ì\í†\Þøw§‹sÿ\0ºÈ¯‰¨ ·\íÿ\0lvº·K¿\0K\r“O\Ý\Ü[xn®¡¶iO-½œºœ7S\ÇgŠ\Þ[\ë8\æuX\Þ\æc*öö´øp\æ\r\ãUú\é\Úôñ¯\Ï\n(ôV\ßö¯øm5Õ½¼ºo‹\í!žx¢–ú\ãM\Ò^\Ö\Î9$T{›„´\×n¯šŒ²­¥\ÕÉAo4›cnÀ~\Ñ?§Œ??ø¤=W\å\Õú—oûA|¹º·³\Æ1$·S\Åo\Ü\è\Þ\"³µY&‘cF¸¾»\Ò ±³€3-\Í\Ý\Ä\Ð&\ég–8Õœv\âWÃ£\Ó\Ç\Þ\n?OhGù_\×\ä%#¥\0~À[üCð\r\ÝÕ½§Ž<u{y<VÖ–vþ%\Ñfºº¹\Ö(-\í\í\â½i§ži]cŠ(‘¤‘\ÙQ±\0öø¡“\êh¯\Ý8úP\í}ø±kywcuõ•\ÍÅí´±Mmyk4–÷VóA – ¸…’XeŠEY#’7WGP\ÊÀ€k³‹\â—Ä¨H)\ã\ïœy\â-N~ž¢\æ\â`s\Üƒ\ß<\Ð\ë¥ùmaûA|Z°*G‹f»Uÿ\0–z†Ÿ¥]†\0c\r!²IH\Îw\î\È\åˆ$W i_µŽmB®§£\è\Z°Ê†“eÍ„\Ø\è\Äy\Zž¸1œŽ0úE|…£~\Ö\Ú¥F¿\áJ\Èm¥\Ò\î,\ï€l\â‹‹7Û\Ý·\nsÇ§è¿´7\Â\Ýd…þ\Ý})Û¢\ë\Íh3Œ\í2F\×‚zÉ†<hÛ¨¬m\'\ÄZº†MW\Óõ$M\ÔS\È\æTbÃ‚ u­š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¨¥ž¤žh¡~ô’È‘¢\ç¦\ærg\Ír:¯\ÄOè¡¿´¼S¢Û².\âŸn†W#Žai7#\åoj\0\ì\è¯\Õi?…ºhV§ª“¸¦i\ÒÈ»”‘ƒ%\ÓZ¡†7F\Ò\0s\Üb¼\×Tý®t¸Ã\Âw—¬p÷÷ðÛ£®8;#\äS\ëÃ\ïÖ€>Å¢¿=5O\Ú\Ã\Çw>bizW‡´\È\ß;$0\Ý\ß\ÝE\é¶I§ŠÙ»\ç}“v\Åy\æ£ñóâ¾¦\á\æñUÅ¸û­\r…µ­”/0U\Ö\Þ$ž\î¥vl\ä\Ð\êT’\ÅÌ²G=Ž¨O,GA\ÏÒ¹}G\Ç~\r\Ò|Á¨x›F¶hÁ/_À\Òs÷Ù³\íŠüœ\ÔüY\âmevjšö¯}s Š\ëQ»ž5f\ÆJ¬³>À;~\è9 œ\â}¢mÛ„®­·n\å;¯pYpXù\'=\èõSý þi€ñ^ƒ»N³¸ºRT\á”8TBÃ¸q\ß\"¿Žß¿ðjÀ\Ï\Û\Ãö\Ïý ?jŸ~\Ù^!øYð\ç\â\ç\Å}W\âG‰¾hŸ–÷\ÄZ&«\ãH\×Wñ]Î—ñW\Ä5¨o.|M\ã\'\×üW,×Ÿ\r’\ÒÁµ–\Òm,#µ´·þ\æ’I$’I\êNI?S_Iþ\Ë\Þ%\ZG\Ä&\Ñ\æuX<I¦\ÜZ bÄ›\ËB·pt3¤r¨\'?(q\ÆE\0~]þÁðm¯\ì‰ÿ\0±ø½cû_|(øñ¿\â\ß\Æß†Z‹“ÁoñYð\æŸ\áˆ!ño„µŸø•5]Âº’º²6¯jO§‡¹·k;Ô¶¹f¸h€¯\Ó\ÍCöø™v`ºÒ´õc‘ö]69Yzý\Ù&“p_L\ï$u<G®`Ž\ê\Þ{i•^+ˆd†Ee¬’¡F§‚cz\×\ä/tðÏ‹5½Ä€\Øj0)‘3\È^Ü¢¡?»û+Àˆˆlƒ\Ì\Ñ\ê>)\êG3x\×Z€\çþ\\&‹Mwd/üK\â¶b\0\ã.\î\Ýr\Ø8®*÷\Å>%\Ôdio¼A­\Ý;ÿ\0¬iµ[\æó9\'\çýøßœœ†Ýœ\Ù\Í`\Ñ@fc’\ÌIfbY˜ž¤³Äž‡$\äS‹¹K1_\î–$qÓŒ\â›E\0QE\0QE\0QE\0Ÿÿ\0]P\Ùß³\Ï\ÆÕµ6¾ñm\æ-Øˆ¼=«\\¿\Ë³`iW“9\Â\Æ\Ì\Ã\ì3¹\0m\ä ˆ\Þ_·¥Š9\âxf%†Td’9<r#Œ2º°*\ÊÀ\à‚\"¿ ‚	A‚\äG ƒ\È#k\ï¯\Ùó\ãP\×\á·ðG‰\î‰\Öm¡	£\ê“©[\ÄV\Òiü\×q/ú¶<\Ë	’\ár\ã¿~I\à»\é|W\á\È¼+¨LZ\î\Ö5\'ûòV\Î\Þ9ûÃ’aÿ\0ªraÝ¼Ÿ3W\í&£§\Ù\ê¶7Zv¡oÕ•\ä/oso2ŽX¤R¬¬­x<z_™¿\Z>]ü9\ÕZ\î\Í%Ÿ\ÃZ„\Ìtû²	\îäŸ°\\6[l©ÿ\0,YŽ\'ŒÄ£\0xmQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@(f\0Q\ØýGÆ’Š\0µ\rõÝ±\rmq-»{vòdt\"H¶¸ÿ\0¾ºW¥hþ#xxE§Š5	-bÀ·ö\Øpd²8\à€\Ã \0z\nòº(\ì¯~\Öz„$\'‰tkØ—jùúl’Y\Ý?@Y\à”\\[\äs\Â\Î3\×\0ƒÞ¼/ñÿ\0\áÇ‰Œ0X\è÷²>Ë«§\ÙB±\è\Ó£0>¢A\ÏùwOI3”vBF	V*H=AÁ¸<P\í-µÝ­\ìI=\ÌP¸\ÊK©,l?\Ùt,\çV+ò\Ãÿ\0|c\ái]^½\Ó\Ìj8£pöŠ\ÎM„¬dcÐ´¶\î\ä¼R¿Lx;ö²¿€Ci\ã};\Õ#:®Šzk›^H\åsý\ÛS\0\ã„\'\0€}\ÍEq~ø…\á[¬þÖ­od(^K\"\â-BLöR<cý¢›f85\ÚPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE! I\0’O\0Ô’z\\v¯ñÀú©\â\ÙØ•H¾\ß²¼ƒ?ºX\áy\Íb\n¤dfùT@•óf·ûQ|<\ÓKG§Ç«kRË‹{Ci¸\Æ\Éz`%~üh\êGLó$\Ök=no—E\Ð4û`\êZ\êY¯.#\å‚Èª©H\Úvy„œ’F\Ú\0ûºª\\\ß\ÙY)kË»kU\n\\›‰\â‡\å[÷Œ¼Zü¿\Öþ=üOÖ‰\r\âK›Ž\å1\éq\Å`¬¼•.~Sƒ¾W\É\ä’+\Ë\ïµ\Í_SbÚ†¥}zÅ·uw<\ã>›$‘£Ç°@(õGWø\Ãð\ÏCmš‡Œtq.	ò­%}FPF~WM>;“ñ²\ì\ç¯,\ÕjÏ‡¶D®c¯\êì¥ƒ­!´ò”’\æp62†>\é8ù\ÚI=}Ï·<œÀ\É\ëŠJ\0úÿ\0Wý®µù·&‡\á=2\ÄBÏ©^\Ï~Î¤ð\Æ\Þ\Ù,\Ö6\Îß´\Ê	\ã Ÿ0Õ¿h_‰Ú¯œ­®½ŒrÑ®—ooda\'9š;—‘G8#–\Îk\Ã\è “Uñ‰õ¹\Z]O]\Õn\Ëý\å–þ\í¢cý\ãLc\Ü{£\Ð`qXt¹{\0€\à\áðz‚\ã\ç9\ï’sÞ¢¢€’NNI=I\ä\ÒQE\0QE\0QE\0µ\á½^}\Ä\Z.·o»\ÎÒµ;K\åU`†E‚Uia.AÚ“Å¾xÝ— X´ \àƒ\ÇFG£¸ \Ú2þ\rSN±Ô­œIo}iow‹÷^9\âY‡±\r_~\Õ\Þþ\Íñ^‘\âHcÅ¿ˆ,ž\Þ\å\Õ8\Z†›±A‘û4ö³\'–þ\Í+v¯¢¿gO¶½ð\î\Ê\Òi\Ü\è3>˜\ÛÊ‡6ª¶O°cj˜BöÀ\ÇPiŸ´†ÿ\0\á øg¨\\\Ç™u\á\ë»]j\ßyV&6\×[Wy{k‰n@\0—\ÎTù—E¨\ì}Gcøõ¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n±kuqeq\rÝ¤\Ò\Û\\\ÛÊ“A<.c–c`\Ñ\Éº\èÀ2œ‘†¤ƒ^Š\0ý.øñ–\Û\âšš6±4pø»N€„8DÕ­\Ó\åûu¨\ã2\0\Ú\àhœ\ï\ães\ìþ\"ðö‘\â­÷C\×-#¼Ó¯\áh¦‰ÀÜ„–h\\‚bž&\Ã\Å \åX‚¹Søó¥\ê—ú5ý®©¥\ÝMeg*\Íms”–)\äAºœ«_§¾-Y|J\Ñ|»–Š\ß\Ä\Úlhº­!D\Ë÷Vú\Ý3\ÌR|\ÄQˆ¤8)\\\0|ñGá¦­ð\Ó\Ä3i·~eÖ—r\Ï>ª\ì\Äwv›¸IùR\î„¸û\Øu%IóJý€ñ¿‚tOhW\Z·n$Ž@^\Ö\åp·W!HŽ\â	0YYI”|®¹V\Zü¶ñÿ\0u‡\Þ ¸\ÐõxŽ74–HƒP´\É\Ùq afA\ÌRp~VR@8Š(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€-\Ú_\Þ\Ø\\Eweu=¥\Ô.‹y^£e\åJÊ…\\`ó\Ûs\É¾ªøoûN\ëš[A¦x\Þ6\Ö\ì2±¦©ª[§@\Óv¾Á9v}\×\å8\éòUû\'\á\ï\èž*Ó¡\ÕtF\ßQ²˜ed\Ã2\é*gtn:`9õ­\Úü‡ð?\Ä/|?\Õc\Õ4Âª]>\Ûa1g²\Ôa^\Z+˜·¸®U.lñ\áv\Èv\×\ég\Ã?Š:\Ä\Í_i­öMN\ÙUu]\ZgSse1yÇŸi!\æ…Q‘òÈ© +@™EPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEAsumgš\î\æXAÁ–\æh\àˆN’² 8©\ìk\Ëuÿ\0Žü=½.¼Imwp¡À¶\Ó[ù™\Ó8÷\n\ÈB±pœXš\0õš+\ã~\×:\\A\âðÏ…¯.\ß\ïX¹Š\Ö%um¼\ÙZ™\ä’62·\Û!|c1òq\â\Ú\ç\í+ñ;XÜ¶÷\ÖZFDtJ´MÊ \æHš\â\ìO3\Ç ÂŸ»\"\Åd\É\0~’\Ý\ß\ÙX\Ä\Ó^\Ý\ÛZDŠ]¤¸š8”(äœ»>•\æ:\ç\Æ\ï†\Úx\æñ·¬\ßg\Ò\Ñ\ï\åm€\É>Py%€	¯\Ì]_\Ä\Þ ×§yõ}cR\ÔÜ¸K»Û›ˆ£\'´QO,‰\Zú*\0£Ò±¹,\ÄH\\ ž¤€œö÷‡ˆ?k]\ÛÌ‹\Ã\Þ¼¿\0c¸\Ô.b·€\äg\æ‚6Lû‘‡ñ\0x¯\Z\×?ißˆú˜•tû?BF`Ñ‹\ç–1Ž‚{\Ï4\ä¡\â•Xÿ\0?9Q@f¹\ã¯øŒŸ\í¯kz„{üÅ‚}F\ã\ìñ¹\ÆZh\Þ;xsŽ‘DƒÚ¹B\ÌrX–,Û˜±$–é¸“’N\0¤¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€>¯ý”¼Mö\ê~žB°\ë–kd$\í7\Ú\ï9\àµ3 nYc\01<}\åªiðj\Ún¡¥\Ý\Ûj6WV3\àdùWP¼.Wý ®Jž¡€#‘_‘^\×\äð¿‹|?¯#ùcM\Õ-\'˜’v›s*\Çp¬ \Ë\å9f^2õ\è`!™\'†)\ã9Žh\ã–3\ê’(u<gª‘\Ü\Ð\ãV¿¤\Üh:Þ­¢\Ý)Yô½B\ê\ÆP\Ýw[J\Ñþ …A5‘_H~\Ó~\Z\Z7¤\Ô\âe¿ˆ-b¿RR3u\Z­µ\Ø\\r\î\Æ8dc\Ç>cc\ï\Zù¾€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n\èü)\â[ÁºÝž¿£Lb½³}\Ê2\Ç2o·Tþò	—\ä–6w.\Ùy\Ê(õ«\áŸÄ\âN©§²\Ã}o²[Lg{­¹!—‚\ÐË‚ðJI¡\È ~\é¼;6‘~©ü!\ç\Ñõ@¹—O½\nB6W\çky~\å\Ì@\á\Ð\î\0º­~fx\Çz\Ï\Ã\ï[kšL§j²\Çf\Äùöe‡›ª2	#&7Áh\ß¤šýOðgŒ4ø~\Ç\Ä:,\ÂKk¤X‰uÒ\ç\ÚN£•–%z\rË‡\0€ùŸaðW\â&£\âK\Ï[\èS%Ý„\æ+»ûœÁ¥B›ö¥É»!„Ê¿¼Œ[¬ò²ó\å\à>Ð¿dk%…$ñŠî¤¸8f·\Ò-\"†\Ý2¿4f{––yJœ*ˆ•€\Ý\ä¡<}™€	 \0N2q\É\ÇLžøíž”´òüß²wÃ·ˆˆµ_C>\Â¢ûL–?3\ÐÍ¤;\Î	A2’2Ž£Ç¼_û*xŸK†K\Ï\n\ê\Öþ\"‰79\Ó\î![\rDF “\å8‘­®d#\î\ÆfùGQ_ 4P\âÞ¡§\ß\éWs\ØjVw7¶\Îc¸µº‰¡žU\ãp ñ\ÜÄŽj~£ü]ø=¤|HÒ¦š\á°ñE´,\Úv¨±¨id³½lfKi[\å\Ürð–Þ?˜Úž›{£\êº^£\Û_X\\\Ëkuƒ\rÐ¹GSØŽ2¬¤«)¤‚\r\0Q¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0®ŸÁþ-\Õü¯YxƒF˜\Åsk\"™c\Ë®\íò|\Ë[„€Ÿ¼ca—œç˜¢€?a<\â\í;\Ç\Z\Ó|E¦81^D\Ä9\Ë\Ú^F\0¹µ”vxŸ§÷‘‘\Ç+¬¯‚?e/Mg\â\rWÁ÷3i¬ZF\ÅøP±gX\Ãd\îžÕ·Lnò™›;{\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE÷[F\Ò\Ü\Í¼K÷¥šDŠ5ú»•Qøš\0–Šñ\ßüwøm\á¡$rk±ê—‘—_±\é\noeóå»§\î¢\']ð:ž+\ç\ß~\Öwò\ï\Âú½¢;.µYM\Ì\Æ#m­\ÊÄ’ól–a\Ør(\îJ\ãµÿ\0ˆ>\nð\Â3\ë¾&\Ò,DR^D÷Sª%¼M$\Ï&xq<_™¾$ø\Ãñ\Å^bjž\'¿[i6v4\ëL)\ÊfO-K/MÍ¹\ÎNX\æ¼\Õ\äy]¥‘šI\å¤vg‘Ž1–‘\Ë9üX\Ð\è/ˆ¿j\ïXaðî›ªx‚T+²\æHÿ\0²ôùû\Û^\è}´•ô6JŒ:Iƒšð¯~Ó¾=ÕŒ±\é\Æ\ËC·p\è\Æ6pŒ>Gwa\ØJ¤üØ¶\n@ùH\'#\æ\Ê(¡\Ö|Y\â_\Ì\ÓkZæ©¨»ý\áq{;\ÆN1Ÿ(8ˆ`|¨X˜Œg\å\ã\å.G\Ú03\ïŒ\Óh Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ?\ç\Ç\â8¯\Õ?ž%ÿ\0„£á—†\î\ä—Í»°·mü’K‹-Íº´„“û\É\í­\Û\×À¯Êºû?öLñ/“u¯xZWm—‘¦«h®\à ¹·\Û\ÚC\îð=´²³rY@ò\0¤~\Ô^“YðE¶·k’\ï\Ã÷\È\î#Œ¼¯ezV\Þ`0­„‰\ÊL\Ä\à*‡9\æ¿:+öO\Äú,#ðö³¡\Ü\"\É©§]Y”ºZhYSq\ì7•$öŠüyÔ­e±\Ô/l\ç]“Z\ÝOo2„1ª\Ë¡¾eA\"°@y\Ú \nTQE\0QE\0QE\0QE\0QE\0QE\0QE\0*Œœ}O\×\0œ~8\Å~¯üð‚x/\áþƒ¥²2_\\[&¥ªû\çP¾D–d\ä	\Û\n!\Î\ÅL\nü°\Ò!:¶™n\ÛvÏ¨Y\ÂÁ¸R$¸9õ\ïœW\ìø\ã€0\0\Ô\0QE\0QE\0WÁµgƒ\âÓµ\Ý/\ÅÖ±$që°µöÀv¡` ¤¬\0\É2\Û:¡bF\æQ\ÉÙŠûÞ¾ký©­\"¸øq¥¸¶\×ôó\ã,‰2\ÏÀ{8)»\Óh#‘@œtQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0zÁ{Ù¬>*xx3¾Mv\ÞÅ€I$\Ó\æ\ÈôX®]óØ¨>õú\Ã_•Ÿ´\éuŠžX\×r\ÚjGP›¾È¬­\æ›y\àð$ò—9fú§@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@T3\ÜAmMs4Vð ,ò\Í\"\Å\Z*‚K3¹UP\0$’@\0x5\áþ+ý¡~\Zx`½¼Z\Çü$\Z‚–O²hAn\âG^¨ŽÁSw\È\æ)\ç’6ûñŠù¯ÅŸµ?Šu/2\rYZhVì«¶c›\Ûü?\ßV’TŠeWŠÐ³’¨€}ñ}¨\Øi5Ö£{kcn€–š\îx\à\å 4¬ ¶:*\å@	5\â^\'ý£~øx\É\rµüþ »N<$!ˆùw\ÞLb·U\ÏC¹8V¯ÎoÅž$ñ\Ã\Ü\ëšÖ£©\Ë#?j¹‘\ã\ç;aB£œac«Ÿ,ÍŒ’p02IÀ\ì ôŠ\0ú³\Äÿ\0µ‹µ2i:w‡\á<%\Å\ÏüMoº\ã;¤X¬\Ô0\çh´fSŒJkÀ5\ßø\Ã\Ä\Ì\í¯x‡R\ÔÄŠÑ´W\Öþ[>ð‚\Øn¸\Â-ë“†\ä\×#E\0þƒð\0~\íEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP^ð£\Ä\ßðŠxóÃº«¹Ku\Ô!·»*2M­\Ñû<¨NF\ØÏ˜²?PLI‘Àeóš\ê<)\á/x¿T‡Mð\æŸ=õ\áuf1\îHmTD\×7\ä·E8l» dhöX0¤2°¬§!Ár\àŠü\Éý¡<#6‡ñ?Y–\Ò\Ý\Ú\Û^†/[„]Åš\ä2_@Ü·\Ð\Ü…s ‹\Êm­»qýðÕ®£c\áý\Z\ËWx¤Ô­4\ëKkÇ„\æ6š–2U¿‹…o\â9nõ£-…Œ\×\Ý\Ígk-\Ô*R+™ ‰\ç‰NIX\åe.€’xV“\ë@v~ñN 	±ðÞ»v¡K·\Òo\åEU gH\n\"\å”nb#žEU\Ô4\rkJ\ÔôÛ»	\Å\ÜFÀ\êvÉµ¸\ï\Å~Ë…Uûª«Û…ùaùUK\Ý7NÔÇ¨XY\ßFAR—v\Ð\Ü)SWl\È\ã\èrs@‹€\ç‘\È<‚;\Ñ_¨^+ýŸ¾ø™f’\"=P‘XGw£*ZÆŽ\ìU~\Å1\ë“$$òX\ØañoÄ¯¾(ð|±j\èJ\ß.¥d’7’\Û`;ä…±\ËH¥¢,pª€P‡\ÑE\0QE\0QE\0QE\0QEf\Î\ê[+«{¸x–\Ö\â˜ÿ\0ß¶š9\Ðt=Z0:w¯\Ù\rTƒ[\Ðô^\Ö_>\ßS\Ól¯¡›ó\æ\Þ9C•þwr§•9‘_Œ\Õ÷g\ì¿ñ*4|=\Õn6\ÝØ™§ðü’Å£»Mq§«–š\ÚGyaRw4U!\Å\0}‰EPEP_$þ\Ö\Z\äx{@\Ð»n\ï5Ôš1œýž\Î7X\É\0Œ‰\'\Ìy9‚\Ø$\nú¶öò\×N´¹¿¾ž+[;8d¸¹¸™\ÄqCJ^I$v *ª‚I5ùQñwÇ¯ñ\ÆW\Ú\Ì{\×L‡ýG…ó”\Ó\à;c‚\Çk\Ý0k©\0—¡ /¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š\Ýð×‡µ\ëZ~…¥\Â\Ó^\ê7	 U#ÍžB1¶+xÉ’F\Ï\0(<\Z\0ú\ÃöJð„­}\â\ÜÅ¶mW\Ãúk²dK,òC{¨¼lxV·H,\ã%y\"\é d¸\ë”ðO…,|\á+Ãšz…¸Iš\â\îOž\æ\á\ÏVi%\'’B\\\áEut\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QYz¶¹¤h6¯{¬\êVzeª\Í5\äñÂ¸v‡!œŒý\Ô\Þ\Õó‡Œ?j_	hû\íü3cq\âK Y\Ë9°\Ó”•\'\Ïh\åž}¤«m†\Ü\î\å\ãj\0ú8\ë\Åy¿Šþ,øÁ\Ë0Õµ\Ëy.¡G\éö\í×¤#a\äÀ[f\Ö`¬\\ª©?1ùó\ãŽÿ\0üd%‚\çXþ\È\Ó$c+CCcnc \×šþ\å[hr·R\"¾Lh€‘^E$\Ò\ÊKK#¹f\ÞÅ˜¶\ç )v\Éù‚¨g9vÀ\ÜI ¯¼]ûXj·-%·ƒ´xt\ØyP\Ô\Ê\Ý]78\Ý²ƒo#¤aý\á_5ø—\Ç~,ñtŒúþ»¨\ê\n\ÌÈ–\å\Ö\ÑI\Úc´ˆ¥º\àp#¸Á®BŠ\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢­\Ø\Ù\ÜjvöV±´\×2\Ç1 \Ë<³H±F zu’3ŒPuð\Ï\áÎ­ñ\'\Ä0\èö­¬¢\Û>­©˜÷Eaf\ç<\âoõV\Ñó™;ƒ\Z5~ øCÁ~ð6“\á\ë\í-\ãQ\æ\Ì@{»\É@§¼¹a\æ\Ï+‘¹™Ø€I\Ús	þ\Ùü<ð¦˜ˆ©Ý¬wz\Å\ÐPk·Aû¼õò­\Ôùq©\'qþ*ô\ê\0(¢Š\0(¢Š\0*)¡†\æ) ¸Š9\à•r\Å*,‘ÈŒ0\È\èÀ«)AT´PÁÿ\0¾&‹\r×|m#iª\Í6·¢\Ä79\îmBË\Ïd¤·\Ú`9{^&Vx‚\ß\ãúý¬š(\î\"–	‘d†h\Þ)cq¹$ŽE(\èÀðU”A\ê\r~]üpøyÿ\0‹\ç†\Ò2š.©¾ûH;p©?\ï­g“j\ìy8\É\n€\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0«6w·z}\Ì¶73Z]\ÛJ“[\Ü\Û\È\ÑMÑœ¤‘ºASøH<\Z­E\0}\åð\Ãö›\Ó/m­ôˆ\rö\rB%Ž(õ\èÐ›;À6 {\è”nµ›¼’F7bp‹\É?U\é\ÚÖ‘«[\Çu¦jVW\Öò¨xå¶¹ŠP\Êz+F\0ûW\ãkXkš®˜\á\ìo®­Xcg¹¸¶)$¶\ÒÂ¬À“ó0-\ï€(ög#®F=k†ñWÄŸø:Ý§\Öõ\Ë8¤\0ì³·•nofaÀH\í¡,û‹`|Áq‘ž+ò\Ú\ë\Ç~1¼\Ü\'ñ&²\È\Ø\Ê\rJð/hÿ\0–Å¾\ï\Ë÷º{ó\\\Ì\×3\Ü;\Ë4²K$„—y¤‘\ËN\é´Œ	Pp\ÌF@=¨\Þ~.üw\Ö>\"	4]294o\n‰5¦\àou3e$\Ô%PDKH‰Ppew óýPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPE$QK<‰1\É4²º\ÇQ!y$‘\Î#E\åÝ\n£“@1Kq4VðFò\Í3¬QE\Z³\É$Žp¨ˆ ³±\'T{\ný ø	ð<	¥\rZ„7Š5XƒuÒ¬d’\ÍpX‡¦V8a\å«2Š\æ¾ü	\Z[x¾\Ù_]–5“LÒ¦@Ë££¬÷\ÙPe9\nGú6qÄ \íúÆ€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n+\Ëüoñ{Á>\ÓS\Ô\Ò\ëRU,šNžV\æõŽ\Ò\Ë\æ*¶\È\ã¥e\Ç\\b¾7ñ¿\í3\ã	¬ü?·\Ã:s\îPö¬²j’!\Èù\ï2A‘‚~Ì¾`92œ÷/‹> ø?Á04\Þ#\×,\ì¥	¾; ›QŸ*YV1œù›H\ÝR\"\Ø`\Í|•\ã_Ú²þ\äMi\à­6;›r¦¥©¸ºe\ãEjŒ!‡z’WÍ‘\å‰\×k\ÂA\Í|wyuq-\Ý\í\Ä÷w3\È\Ò\Íqq+\Í4²Hw<’K#3»»r\ì\ÌKI&«Pþ½\âŸøž\é\ïuý^ûT¸‘‹n»™\Ñc‹ˆcU\ì5\Å`’I\É$“\Üòi( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ¾ý™¼(ž ñ\çö\ÌBKO\rÛG$t¾vhlù\ì 4\ì\ÊFX„ €­Ÿœ«\ï\ï\ÙGHKOxƒT\ãÌ¿»±‹ ÈŽ5õ?<\ìq\Ðg¥\0}eEPEPEPEP^ûGxI<Eðò÷RŠ2ÿ\0\Ã-ý­(þ\ÇÛ¨©n«\ZÚ—™ŽY­{ýd\ë\Öp\ê:&¯ap†H/4\Û\Ûy£Hå·‘3þÚ’§\Ø\Ð\ã.h§\ËÁ$\È\0’$‰Àù\âv¸\íó)\éÇ§\Ê\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢½K\á\ï\Â?|B¼\é\Ömi¦E K\Ý^ñ;K`1½\r\Å\È\ÉQ;™Ygò\Ê\à€p:6©øƒQ¶\Òt‹+‹ûû¹Com’F\É\å°0¨å™Š¢€K0\×\èoÁÏ€šwD:ÿ\0ˆD\ZŸŠY@6‰,ômÀ¶¡‡\ïn\ÇI.\Ø˜%cP}\á\ÏÂ¿ü7°\éV\â\ãSš5ú\Å\Â!¼¹l|\Ë›{|ý\Ø\ã.\Î\Ü×¥\ÐEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEr~-ñ¿†|`Ú‡ˆõK{*M½±o2öñ\Æq¥¤{§™†ÜªlS÷\Ýk\á\ïˆß´·ˆ<C\ç\é¾ø{K%\Ó\íjGö­\Ì|¨c Ü–Š\ë†)ù0J;FÂ€>¿ñ\×\Å\ßx\']_S[Ki1hú~.¯Ý°v‰U	KU$\0MÃ£a••y¯Š<{ûIx\Ï\Å~}Ž‰\è\î\Å@³‘Ž©<D‹‹\àA€A)iå²¶Gœ\êq_=Oq=Ì²Oq4“\Í+–Y]¤’G=YÝ‰f\'Ô“P\Ð’M,\ÎòM,’\É#’I]¤yœ—wrYØ’If$’rMGE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\è\ì©uöŸjJqº\×Zk|\Î\Ñgl\È[Ôp=…~wWÚŸ²Vº‰?ˆü>ò9{ˆmµ(#\ÚDj\Ö\ä\ÛNªÅŽ÷ò\Ì6\0\ÚA ·(¢Š\0(¢Š\0(¢Š\0(¢Š\0)ÀAA\ê<G\\\Ò\×ñ]ÿ\0„kÀþ\'Ö•¶\Íg¤^Pc½Ü‘4V±\ÆAdy…ù»Ž”ù}0¸½¼œ\0\×wS``\ßO$¼À?\0tVN½\0\ç9\à\Îy\Ï×š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šz#\ÈpŠX\ä\0O\'8Sƒ€988P*å†Ÿ}ª]Ee§\Ú\Ïyw;Š\Þ\Ú\'ši	8ùc@X€zœ`w#\"½\Ë\á\Ç\ìù\â\ï<7º¤røkAfFk»¸Û®b8$YY¸RB\Ïq¶48a\ÊHwø\áwƒ¾\Û,z™\ÛJ\â\ãVº\ãR¸o\âfÁò”óû¸Q€v…Û@1ü.ý˜¤‘­uÏˆD\Å²\Í†\á|Jøù—ûNuûŠ[i6\Ñ0r,¬¹\0}¥§\é\Ö:Mœ\Zm¤Vv\è#†\Ú\Ú%Š(\Ô\0¨€©\êj\í\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEp^=ø‘á‡zi¿×¯ž\ê~Å¥\Û“Q¾tX!,6¦xi¤+¬O·¹¹·³‚[«©¢··\ZY§™\Ö8¢fwv!UTI&¾Dø›ûOY\é\Í>‘\àŽþ\íw\Å6»p›\ì¡~Wýqt\è\Ùý\ì£\Ép’ù\Ë\âOÆŸ|Ežhfv\Òô!\'ú.‹k3y^Zœ¬—².\Ów;q¼0\ê\Ñ\É5\ãÄ“\É\æ€5õ½Yñ&¡6©®j7zôä—¸»•¥p	Ï—\ãˆ\â^\ÇTP\0\n\0E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0Wð\Ë\Æ2ø\Æz&¼2\Ö\Ð]/£\Éù\ìn\Ê\Ãvr»\Âm1—œf¸\n2G#ƒ@µ6·0^\Û[\ÞZÊ“\Û]CÅ¼Ñ\Ñ\Ë\È$ŽD<e]08\rO_þÍŸ¡š\Ö/‡¾\"ºX®m\Éÿ\0„nòw#\í01,ú\\Ž\Çt.Y\ízoš<’¨+\ì\Ê\0(¢Š\0(¢Š\0(¢Š\0+\ãÚ«Ç°¥¶\à;)VI¤‘u]d#²´+eÓ¢-–\Í;\Ä\ÙVÅ½H+Ÿ£¾$üA\Ò~øv\ãW¿‘^òExt«+\ç^\Þò*©#FHyœðª1ÔŠüªñ»¨x—X¿Öµ9\Å\íýÄ—\ÈKm,\ç…Ecò\Ç\ZŠ0ü‘©*¶@1h¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢œª\ÌB¨$±\n I$(\0u\',£\'‘\Å\06”+6p¤\àd\à\êq\Ð{×´x\àOŽüjb¹]<\èúKòu-QZeÿ\0¦\Çe\Å\ÎpFP*A/Œ\ã\íü\0ðW„W–\ã\Ä\Z¬[_\í:’#\Ú\Å(P7\Û\Ø\íû:·mò$’\ÌXf€>%ðÁxð\Çsm§\'F|¬j\Ë%½¼‰\Ç6‘\çÝœg$1d–<\ä}\Ã\à€¾ðH†\ê{\íýe6·\Ûõ\Ð\Ã€.M¥ˆFA ¿›!\Î]Ù†\ã\íÀT\0\0\0\00\0\0\0\à\08\0t¥ \0(@\0\0\0 \0p-PEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEò_\ÇOk\á\ïµxCÁ·*ú\ã+Cªjña\ÓJ¸k{G©\Ô82á…°\É_\Þ\íd\0\ë~.|y\Ò<·\Z.ˆ\Ð\ê~(	‡_õ–zS6@k²¤	®F2¶ŠÀƒƒ3Fˆü\î×µý_\ÄÚ¥Î±®_\Üj:…Ó–’yÝ›jä•Š$$¬QFÔ0ª z\Öd\ÓMq,“O,“M+´’\Ë+´’I#œ¼’;\Î\îyf\'$þ¢ Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( 	aš[ycž)bu’9#b¡®Œ9VRW\Û_¿iV¾ø?–\è©\r¯ˆ\Ûý[ù5@c`\â\ë”r@s¼> £4ûQiwk}oÕ•\Ä7V\Ó\"\ÉðH²\Ä\è\êJº§*A\ëÞ¬W\ä_„>%ø\ÓÀ\Î‡µ«›kp\Ù6µiÍŸ¼M”û\àGñ\"£\çø±_Fè¿µÖ£C½\áH/Š\"‰¯4\ëß²K+c\æag4rÂ‡=6\Ü\0F\0U4÷=òt_µ¿ƒ	“Ãž ‰À\ÈR\ÖL	ô\Ìs9õÁ¬Oö¼\Ò\Ö\èþ¿šp\Ä2\êWð\ÚÇŒp\È\Öñ\\±\ç9ªx\é\Í\0}‘^9ñ\ã_„¾[K\\&³®\ì&\ßF±•ƒv{Ëº;XA 1;\å9\n‘3\Zø›\Åß´/\Ä?,–\ë}…`û\Ô\Úh\êÐ»\ÆI*\'º‘¤šB\ÚþY…\\ò\Þ#=\Ä\×<³\Èò\È\ì\Î\ì\î\Î\Ì\ÌI,\Î\åÛœnvf\Æ$@_¼w\â/\ë2\ë> »i_.–vQ[-:Ùö±ò®>û¶^F\Ë9f$ž:Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š\ì|/\àx\Îx\áð\æƒ}¨+•\ìG\äXF\í\ß-\ì\Û XÕ¸v\ÜBž	ô\0\ãªí¦}4vöv—3\ÊUb†d–iKGj\ÒI’06+sÖ¾\Êðg\ìŸ*´W~5\Ö\Õp\Ê\çKÑ²NÍ¶kùPm`p¬-ÑÁ\Û.\r}Q\á\0xCÁðˆ¼?¡\ÙY0\05Ï”²\ÝÉ\â{™JI\êp\Ã9>´ð§ÿ\0f?\ZxEy\â¢ð¦˜\à7—q¹\Ö%R,Õ’+p\ÊH\ßq7˜Ž9¶q_^ø+\à\Ãÿ\0¬R\Ú\éIª\êQóý©¬„½¸ßŒŠ\'_³Až\Ä\n¸¤0\Ízý\0€\0€\0À\0t\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEy\Ç\Å?\Û|<ðö¶û$¿qöM\"Õˆ\æþPDci9h\âÿ\0[.:(#p4\ä¿þ3	Z\Ë\á/]\â;\Ø½»…²\ÚE¬£\åTe\ÈK\ë…ÉŒ1TA¤\å¶+~y\É#\Ë#\Ë+¼’H\Å\ä’F,\î\ìr\Î\ìygc\Ë1\äžM\\\Õ5;\ÝcQ¼\Õ5‰.¯o\î%ººžF,\ÒM+ns\ÏE*\"¨<‚j…\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QV!´º¹‘a··šy•Rby%r\Ù\Ú$\í¸ð¤)°3’\0W¢½\ÃÂŸ³\ßÄˆ¦}-t+0~Õ­9¶.öF\Ûb»2!„r\Çº\çÁúW\Â²Ÿ„ô\Ï&\ã\Å:çˆ®«=¬û;N,¼\"2\×R\ÆÃœù°È¬~W\ã$\à?K\Ôu[„µ\Ól®on$;RX$žVl\0H•›œpHž¬+ß¼#û4x\ë\Ä>\\Úª\Å\á«\'\Ã52^e±…ÁWSD“\Ó r+ôBð¯†ü1n¶º‰§iP¨Qþ‰m\ZJûF–r\ZyŸdšGsÝ‰®‚€<Áÿ\0³Ÿ\Ã\ÏùwvrøP]¬\×\Z»	-ƒ©WýÞŸK@©*‰\"2G,¨B\æF*÷k{{{H’X!¶‚1„†’z,qª¢þ\0T\ÔPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP_œ´\çŒf\×|}/‡¡$\Òü+6ˆ°L³C&¥sWZ„¯°²¥Í³\Ì4\Ù\Óph¤³x¤E•¿G\ëò\âj…ø\ã\ìgŸ\Zx¡ŽI<¶·|{“À\è@\0Š\0\áè¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¥\0œ\à’{\0:’{Üžl\é^\×5¹–\ßHÒ¯µ™‚³¶šq¸\ãx\Ð\Ç\Üg\ç\È\ÏJ\0Å¢¾Žð¿\ì\Í\ãýglºµ½®ƒn\ÅHûu\Æû€3—Y,\à@qÀ\ÌñHo›iSô/†ÿ\0e¯\é¥%\×\î¯|A*õ·\Ýö#\È`-È¸—k©’|\ã\0\ç­\0~z\ÚY\Ý\ßÎ–¶V\×w2#·µ‚[‰œŽ\Ë(ò\Ã!p	ä“^\É\á\Ù÷\â_‰|¹?±Ž‹f\å»\ÖeKQ\å°Ï˜¶\à½Ë\È\Â\ÆXq•úI¡xW\Ã~·¾\Ðô\Í&”°±²‚Ý¤dD“I\Z	&—zYY\äbIf$“[ôòW…?e-Nò®<O­\Ýj\×µ\Ú\ÛNO°\Ú,€œ¨·]K^8\ç=AÀ¯¡¼9\à/xN%‹A\Ð4û£rÀ²\\·»\\HR\à\\tW_E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0øÿ\0ñ\n\ê\Þû\Ç\Þ7½³¸‚\î\Î\ï\Åþ$¹´»µ–9\í®m§\Öod·¸·ž&x¦‚h™$ŠXÙ£’6WF*ÀŸ\Ø\nü€øƒá¹¼%\ã?\è2\Ã\äGgª]5š\à…m>\âV¸³t\'ï¯“ xKFq@uQ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@R•aŒ«Œ´äŒ1’2@\ã¹½\0%\Ý\è?¼}\âM¤xOZ¸‚UWŽ\êK7´³•	å¢»»ò`(û\ÞSHGM¹¯j\Ð?e?ß•}rÿ\0I\Ð\áÊ–Q3\êE$•HC½F2’I\'Ž2@>Z©£·¸•\ÄQC,’–U\"3JY\ÆTÀ.KF‘_¢>ý–ü¥}^óU×¦\nV@ò>\ÖPy\Ã[Ú’çž»\ç|”ü¼l\Ðü	\àÿ\0*®\á\Ý*É”(óc´‰§;Fi¤W·©3@šø3ñ\Å-²ðõõµ¼¡±w¨Eötq¢_µ´…r8x\ã—’;Wº\è²>£1Ž_xž\Þ\Æ2¨\Ïk¥Ûµ\í\Æ\ï\ã‰\çŸ\ìð\'¬‘¬Àp\n·5÷0\0p\0\ÐR\Ðˆxwöyø_\áÿ\0-Î‹&µs\Ï\Ú5Ë–½\É\ã\èÈ°Y\r§%H¶\Þ3Ë·Zö3N\Ò\âi¶–€—ioº£\"$]\Ä\í“\ïW¨ Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( ¾Uý¥>\Ë\âM6?\Zh°5m\ÜÃª[Æ¹’óKB\Ò,Èª2óY19.ð6ý^\ÖúªšÊ®¬Ž¡\ÑÁVV••†\n°9Á‚(ñI•”•a‚;~ úG Ž Ž\r%}™ñ\Ãö}¸\ï<]\à[S5³.um&hN\ZI¯4\åæ‹«Mj1·™\"þ ~4!”•`U”\ÊÀ†R \à‚x4\0”QE\0QWô«\ÕuM7KŽD†MJþ\ÎÁ%1Hžò\â;u‘\Â\åŠ!3ˆh…õ\çü2‰\èo\Ðÿ\0ð\nþød?ÿ\0\Ðß¡ÿ\0\àý.e\Ý_\×õ¨!\Ñ_^\Ã!ø—þ†ýÿ\0\0¯\èÿ\0†Cñ/ý\rúþ_\ÑÌ»ÿ\0_\×õ¸!\Ñ_\\Mû#ø’e™¼]¡•Š7”eÈKß¨òdÑ˜f–C¥’2\Ã8c$gœdf„\ï°QEÀ(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢½\Ã\á\×À¯|H\Ð\å\×t½[J²·Šö[#\r\è¹ó‹Ä¨\Ì\ãÊ\Óa\0\ç9\ÏP‡\Ñ_W\Ã$ø\Ïþ†þW\ßüfødŸÿ\0\Ð\Ã\áÿ\0\Êûÿ\0ŒÒºþ¾_\æ¾ð>Q¢¾µ‡öHñ^\åóüG¡\í9\ÞoM¤Û¸l÷W¦º]\'öCM\È\Ú\ï‹Ù7\Ï‘¦ˆ\ÞD=v\Ý^\ÜÊ±H1…&\ÎTù‰dlE\×õòÿ\05÷ñ0\ç\0œrp3\êi\é²°H£y\\\ã´ŒI\è0Ž}ºú\×éŽ‰û6ü-\Ò<¶ŸI½Ö¥ò%\Öun¨\0’\Þ\ØZY™f[Tf\'“Œ\ë:?„</\áõA¢øIÓŒd”’\Ú\Æ\Ý\'R}.6ÿ\03Œœu4Àü¸\Ñ>|A\×\Â6Ÿ\ám]£‘CE<ö­ilë‘“\ç]x\0“º4—¡À#šö-öRñ•ù¬\êz^‰\nÁ>¡s\ÏT\"hÃ¯\'ƒòœõ¯\Ðz(\æ}ö\\ð6–#}N÷U\Öfƒ†i\Ê=\Ø\Ã)ª²I\èI7s^Í ü<ðO†DgDðÎ‘g,O\æGt,\âšñû\Éy:\Ër„Ÿ›	*\Ü\ã5\ÙPN(\0¢“>\Ç\ëJs\Øgô¢ÿ\0\×\ÝþhŠ@O÷qøŠZ\\Ë¿õ§õý0\n(¢Že\ßúþ¿­À(¢Š9—\ëúþ·\0¢Š(\æ]ÿ\0¯\ëú\ÜŠ(£™wþ¿¯\ëp\n(¢„\ï°™úõ\Å-@Sr\ß\ÝýE:‹®ÿ\0ÖŸ\æ€(¢Š9—\ëúþ·\0¢Š(\æ]ÿ\0¯\ëú\ÜŠ(£™wþ¿¯\ëp\n(¢Že\ßúþ¿­À(¢Ši\ß`\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nù\Ó\â—\ì÷\áÿ\04úÆ…\ä\è>\"1\åx\ãÿ\0‰~£#ó]\ÛÇ·d¹@Q™‰2‰5ô]ù\âÿ\0x—Á7­g¯i—6Ÿ6È®\Z6kKƒ‚\Ä\ÛÝ¨0J¸e£—¦\èP_³º¶¥k¶rXk\Z}®£g*•x.¡YW©RF\è\Ûý¨\ÙXv5òßŽ?e]R3_x/S}\Z\é·8\Ò\ï\Ô\Ü\é¯!<,Wíº´@?¼—œ\à\à\ä\àj\è¼!ÿ\0#g…ÿ\0\ìb\Ñ?ô\åm]\'‹~ø÷ÁM#k~ºH\åS±ÿ\0N\Ó\å ý\å–\æF¤a‡ŸG‘\\\ç„A-ðÀ#x‹E\ÜNÚ€?\'?\à\íÛŸö¹ý‡¾þ\Æ^ ý“>=x\ç\à^¯\ã\ï‰_to\Þø&m2|E¦\è\Þð…\î“k¨GM\Ô	Nº¼¼–\ÜC\äü\×S<\Ï\Ýù\Ã\çü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿­Oø>þH/\ì	ÿ\0ew\ãgþ¡¾¯ó¦¥—¢öþÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9Gü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿¨¦ú¿Á­¿µ÷\í5ûgþÀ¿¾%þ\Ô\ß¼añ·\Ç:O\ÇOøgJñŒ\äÓ¥\Ô4\ï\ÚøG\Ã÷Pi6Ï¦\éúz}‘.\înn@™&”Kq&%\ì>Ô¾ÿ\0\Û\Ïúú¸ÿ\0Ñ¯_“ðfü£3\ãoýœ‡‹õð\Í~²_\Ç\í\çý}\\\è×¤·~¿¢­QLŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š)H#‚\ï\Ït\Ï=½\è(­k\rZ\ÕF\í7H\Ô\ï\Ô³\Ó\î\îp3$q”À,\ã=«\Ð4Ÿ‚?µ’¿fð~©n®,šˆƒM‰”Œ†^Mÿ\0dö€<¦ŠúJý•¼}wå¶£s¢\éh\Ü:Iu%\ä\Ñó\Ë¶DŒ€:šLžø\é\é\ZOì§¦[ñ]\Ä\ÅX+N±Ž4q\ßt³¾ñ\Û\0F{\äš\0ødH\0O@$ý)GiR!v‘†\Ëch ò3‘Ž9È¯\Ó]+öpøe¦¦Ù´û\íW\æF¡3Ç¼`\î\Ã\ä\Ä0\Ù*6as€8ô­\'À\Ð\Ê6—\á­\"\ÒD]‚T²…¥#\ÞGVb{\äœçž¼\Ð\åV•\à_\ën‰¥øwW¼2G\æBð\Ø]<3pp‘\Ü,F!\Æ6´‹·«•×¥hÿ\0³\Å][\Ëg\Ñ-ô˜]¶™u}B\Ú\ØÇŒd\Éo\\^…\çªÚ¾pvƒ\ÆM\ãŽ8”$Q¤h¼*F¡@ª\0\Ø\n}\0|1¢þÈº«\ß_ñfŸ%‡I²ž\è‘\Ý\Ò\âôÀ¤\ç\î«Z/xö¯pŸ\ÂKðs\à¿\Ä8ü5ª\ÞI¥øK\Æ^ ²\Ô\çHDöú®}si<q\0\Ñ/\Ùæ·‰\Ñd%9\\+\Ý\ë\Î>1\É\"ø§ÿ\0d\ã\ÇúŒê”¥·\Í~hò$ñ7üYÿ\0˜\ÓüK\â+_Û‡\âv\Öz\î±ko\Ð|V( \ÔncŠ5\Ý\áfm‘Æªˆ˜…P\É\Äÿ\0ˆÿ\0\à³ÿ\0ô|Ÿÿ\0ðC\à/þekñ§\Æò8x³þ\Æ]wÿ\0N—U\ÍS·—\áýv_p·ñ¿üþ“\âþ|ÿ\0Ì­~¢Áÿ\0\à¸?ðT¿\Úgþ\n•û\Z|ø\Ýû[ø\ß\Ç\n~\"|K\Ôô\Zx?P\Ò<ma¯\éø\Åú”vWsiþ´½X’þ\Æ\Ò\éM½\Ì/\æ\Û\ÄKü€W\íü¿ÿ\0)¥ý€?\ì®\ëú­|sJË²û¿®\ÈöW¢Š([/Eù\0QEÀ+ù\Ãÿ\0‚ªÁ\Ë±Oüg\ÄÚ¿ÁŸZ\ê?´\Ï\í!¤#\Û\ëŸ>j\Ö¾ø¨<<Ÿüo8¹³°\Õ#³Kw\á­\ÛSÖ¡‚t7‰§»q÷wüö\Ï\Õ?`Ÿø&\Ç\í1ûCøWQM3\â.Ÿ\áðgÂ»\ÇS›ˆ¾=»‹\Ã^¿„ôK//5ûVp\È\×\ZLh\ÈûöŸñi\Öõ½_ÄºÎ­\â/jw\ÚÖ½¯jW\ÚÆµ¬jw2\Þj:®«©\Ü\Ëy¨j7÷s³\Íuy{w4·77»I4\Ò<ŽÅ˜š[úio=ÿ\0¯ø`þ³>5Á\ä\ßðSj\Ó\Íð‡Àÿ\0³\ßÀ\Í\nXü¸´¸|!¨|H\Ô\àù6y¿\Û~*\Ô`‰\ç?}›û\"\ß\ÌpÄ˜AðŸ?\à\æÿ\0ø,÷Œ§3\Ú\Î\ë\Ây¹{Ÿ#Á~ð6‰\0ÞŠŸg¾‡xE²\íÞ‘nù\\±\Ý\Î+ð.Š,»~\×`?l/ÿ\0\à\â\Ïø,õýÅ›~ÝŸ­V\áU\rÅ†“\àkKÈ‚È’f\Þ\æ/	!f\Ùå³¡\rå»¨ ¶G)ÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ¯Çª)ûÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ£þÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9_TP\ì/ü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ærøÿ\0ü[þ’ñ\çÿ\0¼5ÿ\0\Ì\å~=Q@°¿ðÿ\0ÿ\0ø,·ý$\ã\Ïþxkÿ\0™\Ê?\áÿ\0ÿ\0ðYoúH?ÇŸüð\×ÿ\03•øõE\0~\Âÿ\0\Ãÿ\0ÿ\0\à²\ßô?ø\á¯þg(ÿ\0‡ÿ\0ÿ\0Áe¿\é ÿ\0ð;\Ã_ü\ÎW\ã\ÕþÁÿ\0ðm—\í-ñ\çöµÿ\0‚Uü/ø\ÕûHüOñ/\Åÿ\0Šš\×\ÄÏŒúN§\ã_Ig.±w¦x\ÇZ†™£X\Êö6vP4ûc·ƒ÷\Â3¶>\Ìÿ\0‚‹ÿ\0ÁTÿ\0c¿ø%\ïÃ‹~\ÔŸ®x–;Á\à…\Þ·]w\âOnlÂ¤§Cð\äsG%¾‘ms$j\"\Õ$³\Ñ\ì‡}Ì“!€þYÁ§Ú¥†‰ÿ\0Fø[­j·1\Ù\éšG\Ä\ï\Ú3T\Ôn\å8Š\Ö\ÃOøƒ¬\Ý\Þ\\\Ê{G¼RJç²©5þo¿ðU\Ûc\â\íýûsü|ý¡üy«\Þ\Þ\Ùjþ8\Öü;ð\ëCžòK­;Á¿¼3©\Ý\é~\rðÆ‹\Û½•®™\n^\\\ÑZóS½¾¿¸i.n¥‘¥_™öýl€þ˜?joø=Kö¡ñn¥ªé¿²\'\ì\áð\Û\á†„\ßñ%ñ7\Å{›ßˆþ4– \Ôt]:\ãFðµ¬·2Eo-ú®Fù\äiü´ñ\çü5ÿ\0œñÐ¸	ûFxsÁbx¥ˆü-ð^„mÄ²	Û´ú~¢\ë, yqH\í#\É\\\Õü\ïQM$º_\Òö\ìÁ\ÇðYñø\ÎOˆg\ë x\ç¿ñJþuÅ¿üÿ\0—wgoø(7\Çp]™\ÈK¿Æ€±$…Ž?\r,h¹?*\"ª(Âª…\0W\ã\ÅÀý…ÿ\0‡ÿ\0ÿ\0Áe¿\é ÿ\0ð;\Ã_ü\ÎQÿ\0ÿ\0ÿ\0‚\Ë\ÒAþ<ÿ\0\àw†¿ùœ¯Çª(öþÿ\0ÿ\0–ÿ\0¤ƒüyÿ\0À\ï\ró9Gü?ÿ\0þ-ÿ\0Iøóÿ\0\Þ\Zÿ\0\ær¿¨ \Ø_øÿ\0ü[þ’ñ\çÿ\0¼5ÿ\0\Ì\åðÿ\0ÿ\0ø,·ý$\ã\Ïþxkÿ\0™\Êüz¢€?a\áÿ\0ÿ\0ðYoúH?ÇŸüð\×ÿ\03”\Ãÿ\0ÿ\0\à²\ßô?ø\á¯þg+ñ\êŠ\0ÿ\0g_ø \Ï\Ç_Œ´§ü\Çö`ø\Ïñ\ã\â¿ñGâ—Œô_]øŸ\Æ\Þ&{I5bko\ë6v¦\í\ìm,­›\ì\ÖpAm[uo*$ó\ZI7;~Á\×\á\'üSÿ\0(cýŽ\ì\\ñ_þ¦ºõ~\í\Ò]}DES\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(UÕ•”2°*\ÊÀ2²‘‚¬AF\à×™jÿ\0~\ë\Z•¦±\'‡l\ìuK+\È/ »\Ò\Óû8››y’xä¸†\ÓÊ‚\ë÷‘©aq™\æ½:Š\0þ?\àø?ù ¿°\'ý•ßŸú†ø\"¿Îš¿\Ñgþƒÿ\0’û\Ù]ø\Ùÿ\0¨o‚+ü\é©-—¢ü€(¢Š`§ü™Kÿ\0\Ðø\Õc|Ÿ´ŸŠ\ã\\ð7?ƒ<0«“\ØdŽköOYð¥ÿ\0†üzž\×\á€\Ül\Ø-\Ô0N\'…\í\ï\îa/›>ü\0\àa”’¯\Ç?ø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¢‰ÿ\0¼{®|P>.\Ñô¸oôyu\r\Z\á5n#Š\Ï\ì¢v6÷7\È\ÅDNB¯\Ì\Øw%»õý´Wÿ\0`ÿ\0\Ù@ð\ïŠ?i¯ü2ø#\áÿ\0jsh~\Ö>!x–]\n\ÇZ\Ö-mE\åÆŸa4ó•ž\êR.$yý+\äŸøy—üþGö[ÿ\0Ã™ÿ\0¯\Ã_ø=µGü2/\ìa•—ö€ñž	©ÿ\0…~€\àö\È\à\ãµ›$“»\èÿ\0/òü@ÿ\0eoøy—üþGö[ÿ\0Ã™ÿ\0£þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh§g\Ýÿ\0Vÿ\0\'÷þ\âÿ\0³×‹ÿ\0a\Ï\Ú\×\ÂzÇÿ\0f|7ø\Ó\á=X—\Ãz·ˆü\â)µ\Ý/L\×\Ò\Ò\Æ\Ó.® Ÿdw‰kuora Ÿ*XÛÕ‘ñ\Óö1ýœ\ì\ï\ÇÏ?ü\ÅÊŸˆ¿¼=\á	%¶¸ŸÊ†KM\ïP³¼¸„HDK,N8%˜mb?‚¿ø#\ÇüŸÁ\ßðIÿ\0ø!÷\í?\ã½:}[ý£þ*~\Ô\Zÿ\0„?g¿\0]\Ï³\ÜxŠO†Žó\â½¦\r\à\ß¡[Ë¹,:¶®¶\ZRn¹¹{\ä«\ã_\ÇOŒ´g\Ä_üXø\åñÅŸ>!ø¯R½\Õu¯x\ÃY½\Öu	\îo\îd»š+cw,‘iö\Ë+M2\Â;m>\Ê-°Z[C\n*”¯¿o\Âßž·ûÀÿ\0`k¯ø)Gü.\Â\æ{+¯\Û;ö\\Ž\æ\ÒW·¸ŒüN·r’\Äv:—Ž\å£bY”õŠƒþeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh§g\Ýÿ\0Vÿ\0\'÷þ\Ê\ãþ\neÿ\0D%@ý´?e²K\0ü,È¹$€úþ\ä×ªøöšÿ\0‚Sø\êö-\Ã?µo\ì\ç}¨\ÝÆ“A\r§\Æ\ï\ÚL\Ñ\ÊQc1\Éy­C,\ÓFn\Éo¿\ÅNŠ,û¿\ê\ß\äþð?Ü–?\Ù\ß\áwŽô¦Ö¾üB³\Õl_+m¥k\ZW‹4I%\Ú+j\ZT\ÒÁ\rˆ\æf\ÚG\ÊA¼?RýŸ~%Xx’\ÛÃ±\éz/Lk¬[J\Ð\Äy-\Å\Ë\0mLjUžKó¨Ešÿ\0Ù§ö\äý®ÿ\0c\ßi^3ý›?hOŠ?	õmÉ·µðßŠõ4ð\í\Ä.TOi©xV\î{Ÿjvw1¯‘<º\\\Êð¼‘¡\Í£\ì“ÿ\0C|+ñWü/\â\íûB	§\ígð\â\ßá—ˆ>h·Qhƒ\â\ç\Å\r~\ÆWøo\âh\Æg½Ó¼+\â\ÑÆ¡\â™,\Ö{?¶\âX\';4\Ø\çZ¯5\çò\ë\ç¯\Ï\ä€þ„¡ýœ~x\'FoüWñíŽ•§[ûu\íî©§øc@´f•e\Ö5i¢U8Vù¤xCfU\Æqó‡Œÿ\0l\Ïø$7\Â+™t\Ï~\×?³^•y\Ék,z‡\Æ=U•\'u2*4­R\î2\ÅA$†*\0Á ñ_\ä\×ûpÁNmOø(O\Ä=wÇŸ´Ÿ\Æ\ïøŽ\ÇTººm\'á¾“«j\Z\'\Â\ï\éS\\I=¾…\á\Ï\Ù]&‘\r˜¤w\Ñ_js’ò\Ý\ßO$Ž\Ç\à:v}û~Ÿ?\Ïp?\Ù[þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\èÿ\0‡™Á?\èôe¿ü9‘ñúÿ\0\Zš(³\îÿ\0«“ûÀÿ\0gýö\íÿ\0‚8ø\Ò´øwöÀý™o!K•°f·ø¹¤Ùƒu!R‘²^\ê±c½@/–aƒ^ÿ\0\á«_Ø\â‚c\á¿\Ço†~%¸˜\ì‰<!ñƒÁ\Þ\"•_\Ìò¶ý†\×V¼˜3?È¨È¥‰R \îÿ\0ˆ\rjhú\æµ\á\ë\Øõ=W\Õ4=J/õZ†¨]é—±a•Ç—we4¦þYÌŠ\ÝT¬û¿\ê\ß\äþð?\Ûû\Å²MôI?„|Góª³-†±µ–V\Ï\ËWpn„q\Æ\é£@O%‡”¼E\á­wÂš”ºGˆ4Û2þ.L7	$g\î\Íƒ1\ÍŽVHÙ”ô\È9ü\Îÿ\0`\ïø/Ÿü¯öñ.‹7‚þ=x£\â\Ç\Ã;\å›[ø1ñ³W\Ôü}\à\Íj\Ê[‹i/ ³¾\Õ\î®<I\á«\é­`kK=KD\Õ`R\â\Î\ácH«ý<?a\Ûo\à?üCö.ð÷\íð²Ñ¼=\â›v¹ðÿ\0Œ¼¨OÏˆ~|O\Ò\í\â—Vð¦£u ¾Ñµ’ýQ	Z¶‡}c¨ù6÷K-¼U¾ºþvK·\Ì\ïösð‡‡<e\â½WOñ.™©iŒ\×\Ã+ÊŠ“ý¢4ó†HØ¬F	#œ\ãŠ\äþ/~\ÚðI_€_¼AðŸ\ãG\í-û?|4ø“\áIm\áñ‚ü[\ã\Ï\ì½F–\î\Ý.í£¿²–}ð¼\Ö\Ò\Ç2rcun„W¬~Ê¶óZxÿ\0\ÄV·´S\Ûh\ÓA4l0\É,W±\Ç\"ue\"¿Ë‹þW\0Ágl|\03\â?	\Ôÿ\0\Â ŸS€}©jÝ¿­9_ùý\à£\ßü<\Ëþ‰ÿ\0G£û-ÿ\0\áÌ‹ÿ\0\Ñÿ\02ÿ\0‚\"\Ñ\èþ\Ëøs\"ÿ\0\ãõþ54S³\îÿ\0«“ûÀÿ\0eoøy—üþGö[ÿ\0Ã™ÿ\0£þeÿ\0Dÿ\0£\Ñý–ÿ\0ð\æEÿ\0\Ç\ëüjh¢Ï»þ­þO\ïý•¿\á\æ_ðDOú=\Ùoÿ\0d_ü~øy—üþGö[ÿ\0Ã™ÿ\0¯ñ©¢‹>\ïú·ù?¼öVÿ\0‡™Á?\èôe¿ü9‘ñú?\á\æ_ðDOú=\Ùoÿ\0d_ü~¿Æ¦Š,û¿\ê\ß\äþð?\ÙXÿ\0ÁLÿ\0\àˆ`m\Ùo“ÿ\02>ƒ¯ü·¯N\ÐjŸø$\ï\î!±ð\ç\ícû8^\\\ÞZB\Ý-¾6xj\É\Ú\ÕDldG¾\Ö`DP%÷n\ÂC»I\rñ[¢•Ÿ\ëO?\'÷þ\ãú\Â\Ù\ß\âm¼“|-ø©¡øB\ïûG„<i\á¿\ZÁ\ZŒ\Íý™yt\n`Œ“(À#\æƒ^s\ã_Ù—\Æþ\ZŠk\í\àñNŸ¼Ž¶J\ÐjQF§Œ\ÙHOžBe\ß\ì\Ò9\0|¨I\Å‹g\ÃßŒ?~jvú\Ï\ÂÏ‰¾?øqª\ÚÜ¥\äþñ~¿\ák”¹•–S.‰d]¾E$Ü®£c†BV¿¬ø$ŸüwûT~\Ï^>ðŸ\Â\Û\ç\Äz‡\íû<\ëz­Ž}ñ#XŽ\Ü|aø[o}4Vc\ÄZ·†%ñ·†ôhü™µ\rUµd\Óà»—LÔ¤¼u·™\ë\ë\ëò_\æöûDtx\ã‘9#fI#u(\è\êJ²:0¬¤\Ê@ ‚\Í2¾\Ãø\ë\á?\nx\ÇÁ\Ú\Ç‡WV\Z®…\â=;I\Ö_T\Ñ\Ý&\Óu\Ý^µ‚\ïFñ¬ƒ¥\Ä7g	bšo\\ŸøQ\à)~\"x\ËO\ÐYž-=\ßj÷ý\è´\ëb¦Uº	n’\Þ#œ†¸\Î\Â(N\êÿ\0\×ü8ð\Â\ÏüD†§c…¹\Õ\ï	·\Ó`9N\Ê|ùÀ\É@®ÿ\0/Í°s_L\Ùþ\Ë^\Ð4Ùµoø\Ü[ZY\Ç\æ\ßÜ£\Ù\èúE¤@®eŸQ\Ôd\ÄH3³|¦$‚rHð·þ\éÿ\0üð÷üwG\Ñe\ÙwÃ¾ñW\ík\âo\n\Ûk¾f³W\Þ\nø\áMDHš6»\â]9_x³^\É}¡øz\æH-M‚cXšX.¬\í®ÿ\0\Îö—ÿ\0‚þ\Ý?µÿ\0ˆõþÐ¿µ\ÆÍ¨‹ˆ›EŸ\Æ:®‘\á+K)\çyÆ›c\á\n}7\Ã\Ööoò­\áþ\ÎwHU\å““\ëø\ë°\ëóâ¿‰ŸðM\ï…q¼ž=ý¥¾\è\0a4z÷\Ç‹”>`„™,`\Ö\Å\Â/\È0\á\Æ	VÇˆjŸðQø\"¯‡oe\Ñõo\Û+ö_·¿´\Û\ç\Å/\Å+K‰\Í]\éºk{¹a|©\È\Ø\çƒƒ_\ã6\îò;I#3\È\ì\Î\î\ìY\ÝØ–ffbK31%˜’I$“šm+>\ïò\í\éøþ\Ê\ßðó/ø\"\'ý\ì·ÿ\0‡2/þ?Gü<\Ëþ‰ÿ\0G£û-ÿ\0\áÌ‹ÿ\0\×ø\Ô\ÑNÏ»þ­þO\ïý•¿\á\æ_ðDOú=\Ùoÿ\0d_ü~øy—üþGö[ÿ\0Ã™ÿ\0¯ñ©¢‹>\ïú·ù?¼öVÿ\0‡™Á?\èôe¿ü9‘ñú?\á\æ_ðDOú=\Ùoÿ\0d_ü~¿Æ¦Š,û¿\ê\ß\äþð?\ÚK\Ã?¶Oü#\â0µ>ý®f»ñªy±Ù›OŒºŸ½­x˜\Çý¡ª\ÛyL»N\ã.\Ðü\í\Ý\Å}	\áÿ\0‡?²\ç\ÅCð»\âÿ\0…|LóÇ¾ðg\ÄO\nø\ÉY_\î<q\é·\×\Ì\ë\Ï;\Ó5þ5\ÖøO\Ç\Þ;ð\r\çö|i\â\ß\ê\Õþ\ß\á?\ë¼Þ„µh÷–s\ïBVß• F+>ý¿~vü@ÿ\0oŸ\ÙT¼?bñl\Ø1\0\Í:U¼ˆ`‚Û­\îD08!Lj:ƒ¸u\è4¿\Ù+Ã±l}WÄºÛ¦—iokm÷\Ã\ïIdô\èG\ät¯ò\çÿ\0‚yÿ\0Á\Ì\ßðR?Ø\Ä\Þ\Òüwñ3Uýª>Z\Íce­|0øÍ¨Ï­k6š-:\Ü\ÂñQ\'‰4\rT†¹µgL¹¸‚\î\ìLo,•þ£ß±\íŸðSöÿ\0ýš~~\Ô\0õ™5?üBÓ¤’M>ùc^ðŸ‰4\é\Z\Ë\Ä~\rñ-¬N\ëi¯xwTŠk\ÄVxn\"¼´y-. •\Ýõµ»¯—õ\Ö\àz\Z|øC\à\íT\Ô5\"\Ëû\'K²¾\ÕuSZ¹\í\í´\ë+V»¿º¹Ì¢­-­\á’y\0Œ,q£À¯€,¿\à¬ÿ\0ðFmm–_¶‡\ì‘aug3\Ç\æ/‹twÐ¹\Ô\\=»\\#F\èW‰8+\Å~ˆþ\Ð\\üø\á\Ü„_¿ø¢õšÿ\0\Í|®\ë@\0\0Õµ \0\0É°\0\0¥«o^«O¹ÿ\0Àùþ\Óiÿ\0¦ÿ\0‚K\ÆIöýý™·\Þ)ñLR\Ø\é’gôÿ\0ø}_üoþ’û4ÿ\0\á\ÆÓ¿øšÿ\0º)\Ù÷Õ¿\Éý\à·\Ï\Âoø*üŸ\ã¿\ÄO|%ø;ûeü\nøñ/Æ—“\ØxSÁ^ñ½–§\â\r~ö\Ú\Æ\ëR¸¶\Ólb]÷Eaewvè¼ˆm\å~Šk\î/x›Ãž\Ñ\ï|E\â\ï\è~ðöœ‹.¡®øU°\Ñ4{‰$½\Õ5;‹[+Tg šhÔ±95þ8_ðoF·£xkþûx—\Äz†‰\áÿ\0x\ÛÇšþ¹­j·0\Ùiº>£üø©\êw÷—\Ú\Ú\ÙYA=\ÄóH\ê4nI ^ÿ\0‚õÁf¾#ÿ\0ÁN¿j_\é?üi\âö;øi{y\àÿ\0ƒþ\0³\Ô\ï´\Í\Æ6zu\Û%ÿ\0\Ä\ï\èöóEoª\ë^-¼…o4ÈµHî¿°ô8´\Ëa\âòYÕþ\'ý[ó·ç¾ §_\à­ðL¯‡ºœš?ŒnÙ«EÔ¡¸¹µ’Ù¾(øvô¬öŒ\â?7Mº¼„ùl@\Ü$(\ßÀ\Ì+Œÿ\0‡\Õÿ\0Á&ÿ\0\é ?³Oþm;ÿ\0‰¯ñK¢Ÿwý[üŸ\ÞûZ\Ã\êÿ\0\à“ôÙ§ÿ\06ÿ\0\Ä\Ñÿ\0«ÿ\0‚Mÿ\0\Ò@fŸü8\Úwÿ\0_\â—E}\ßõoòx\îƒû9~\Ýÿ\0±¿\íy­x›ÃŸ³\í#ð³ã†»\à\Í.\Ã[ñV—ð÷\Äö\ÚõÞƒ¤\êwsX\é÷úŒp(ò-®\ï-æ·…\Øü\Ò\ÆË\Æ}\Ã\ãü’/ŠöN<qÿ\0¨Î©_\ç­ÿ\0Aÿ\0\É\Ì~\Ý?öBþÿ\0\ê«\×úübÿ\0’EñOþ\ÉÇŽ?õ\Õ)k®·\Ö+ÿ\0IüÀÿ\0?ÿ\0\È\á\â\Ïûu\ßý:]W5]/Œÿ\0\äpñgýŒº\ïþ.«šª\0¯\Öø!—\Åo†ÿ\0ÿ\0à¬Ÿ±G\Å‹þ5ðÿ\0ÃŸ†\Þ\nø«jž,ñ¯Š¯—Mðþa\'€<ca\rÖ§|\ê\Ém\×\×v–i#ž}\ÌJÌªÅ‡\äõþÖ§þYÿ\0›?óÙ }>\"\é\ßüM>/ø-7ü~yb‚\Ûûök’i\åŽcOˆºqy%™\Ö8£Q·–weU\Éþ(õµ\á ˆ´\0@ \ëZP Œ‚\rô \Ô\Ù÷\íø[üŸ\Þû\éX^\ÚjVVZ–Ÿså†£mo}ew‡†\ê\Î\î¸¶¸…\ÇðÈ’\Æ\ÝXÖ®Wžü%ÿ\0’Uð\Çþ\Éÿ\0ƒ?õ\ZÓ«Ð¨‹\Ó\îÿ\0\ÒP\Êü7­\Íaÿ\0™Ñ´xƒ„×¿j/„\Ép\Ê\ÛTÁ¦\è~:½Xd_\ãW¸ò\Ð<Ý…–©üUÿ\0(²ðGýÃ¯ýF|q_\å½Dvû¿ô”EU\ê_¾	|Zý¢þ&xS\à\ßÀß‡þ&øŸñC\Æú‚\é~ð_„´\é5-gV»*\Ò8Š$\Ûöñ+\Ïw{w-½•º=\Å\Ý\Ä0£8þ¯¾Á˜_ðP_ˆ~±\×þ0ünøðU¼ó?„.\äñ\'\Ä]r\Î\ÚuY¼¸ð½­¾‰ô¶\Ù\ì\ÓS•c¸p\Ê\ZQõ§ü!ð[Àú¯ÿ\0lÿ\0z¦“g¨xû\ÂZ\Ã\ï‡^Ô®­!–\çÃº7ˆ\æ\Ö5I¥\\º™mg\×\r†›g~\Ñi-,R\Þ\\²«¡˜\Ï~¤ðÿ\0\ZW\è·ÿ\0†ý—ùù\Úø2\ãNN?nÿ\0…ø\ÏøM\â\Ì\ã¶q\â´ŸñÆ¯ú>ÿ\0…\ßøi¼Yÿ\0\Í\r¢f\Ñ\è?*0=\åK\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò£\Þòþ­\å\äþÿ\0 ?do\ØÅŸðJ\ßø\"¯\Ç\Ï\Ùg\\ø—£|Oñ\'€þ~\×\Þ7ƒ\Æþ\Ñoô\r>fño…üm\â}6´\ÝB\ê\ê\î)ôÕ–§\Ü–dg‹jüyÙ™Ù™‰fbY™‰ff\'%˜œ’I9$òO&¿\ÝWö\àýŠÿ\0küùµßÿ\0ú©üY_\áSDo­÷¿\è€(¢Š 44\'T\×õ]7C\Ðô\ë\Ý_Z\Öo\ìô­#I\Ómf½\Ôu=OP¸Ž\Ò\ÇO°³·I..\ï/.¥Š\Þ\Ú\Ú\Þi\æ‘#\Øýb~\Ë?ðgŸüc\ã¿\Ã\í\Ç\ßüyð‡ö^\é\Ðj¶	ñññŠ<weiu2\Û\Ã\â-Â¶’Zh:¡?\Út»­NK›?,%\ÈIÙ \ãø5÷\à\ï…þ1Ádfø<Ya§gð\ßKøñkM²ºŽ­\Ä>\rð\Í\Çö\Äöó¤‘\Ît\ëýF-J\Ôm\ß\rý¥\ÔdIšÿ\0^¾ùÏ¶?\ÏzM»\ÙVjúz>\àŠÿ\0Á?6&ÿ\0Û¿\áfý‰\æmøO\âÒžfÑ¿f|@\ÍùÙ¸nÛŒóšwüAñ«þ¿\áwþ\ZoóC_è™\è?*0=\åK\Þ\î¾ÿ\0O/\êþ€ŸüAñ«þ¿\áwþ\ZoóCGüAñ«þ¿\áwþ\ZoóC_è™\è?*0=\åE\å\Ý}þž]ö\ï@?\Î\Ïþ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡£þ ø\Õÿ\0G\ßð»ÿ\0\r7‹?ù¡¯ôLÀô•ƒò¢ò\î¾ÿ\0O.¿ûw \çgÿ\0@üjÿ\0£\ïø]ÿ\0†›ÅŸü\Ð\Ñÿ\0@üjÿ\0£\ïø]ÿ\0†›ÅŸü\Ð\×ú&`zÊŒAùQyw_§—_ý»\Ð\Ï\ïø%\×\ì]­ÿ\0Á>?aÿ\0‚²Wˆ|q¦|G\Õþéš½…\çŒ4m.\ëE\Óuw\Õ5\ÝCXW¶\Óof¸¹·HVôA‰fvcló_ T˜Ÿ—´\Õþÿ\0òK²\0¢Š)€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEü0ÁðòA`Oû+¿?õ\rðE5¢\Ïüÿ\0$öÿ\0²»ñ³ÿ\0P\ßWù\ÓR[/Eù\0QEÀÿ\0Oø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¯\ï\àÿ\0€ÿ\0Jþ@\à\Ì?ùF\Ï\Æû9¯ÿ\0\ê!\ájþ¿¿ƒþý)-ß¯\è€þ&?\àöÿ\0ù4o\Ø\Ïþ\ÎÆŸú€%›…¤ü\ßÿ\0&ûÿ\0\ÙÀø\Óÿ\0P¯óp¡l½\äESWži#Š–WŠ\r\âÝ£‡\ÌmòyHIXü\ÇùŸ`\Û\ælžj*þ³?\à\Ùø!ÿ\0ÁŸø)~·ñcöŒýªF©®|ø!\â]#Á\Z7\ÃM#Rº\Ñ\Ä/ˆwšm·ˆ\î¿\á$\Õl\Ìw\ÑøO@\Ñ\îtóqa§O\Ú\Å\î¤-§¹‚\Ú\Öh\î?ºeÿ\0ƒÿ\0\à\n ø\'\ÏÀr\0\0e\âf$–oc\ê\ÌI\'’I¥_\ê\ß\çp?\Æ6Šÿ\0g?øpü§þ‘ñðÿ\0\0|Kÿ\0\Í|¯ûVÿ\0Á®ŸðI\Ú\áÞ³\áÏ‡-¿f_¶™xžø‡ð{V\×,\ßH\Ö\Ú[ýg\Ã:Æ©©\è¾#\Ó\à•—\íZe\ÄV\Æ\â,˜\î`¸X§BýÕ¿¥ú»|˜\äiE}ûZ~\Í\Þ7ý¿i_Ÿ³\Äyl®|iðG\âˆ|®_iŒÏ¦\êr\è·m®¯§³|\Æ\ËW°k]J\Ô6YaºDbYM|ñLœÂ²`ŽTº‚B±\\\í,¹\Ã\ÉÛq“Ž´\Ú(\0¢¿Ô“þ	1ÿ\0\Â~À_?e…¾=ý°¾\é´‡\íñOÀ^ñ—\ÇZ¦­?‚</‰¬­u\Û/x?\Ã\ÚEþ™l²h¶WqX\ß\ë—\ïu{©]}¥ö[B¶ð\ÇúŸÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¥~\Úÿ\0Ã¯óü\ãE³Ÿü8þ\Óÿ\0Høø\rÿ\0€>%ÿ\0æŽ¿\àº_ðm?\ìL?cÏŠÿ\0´·\ìMðº\×ö}ø\ÃðÁ—þ>ºðoƒou)|ñ\ÂŽK\ïišŽ‰¬_j\Ù:ý®ö­[O\ÖôÛ˜G\Ó…å¬±\Ý\á/\ÝZÿ\0\ä¿\ÏðüÔ¨¢Š`ý¬Á•?´.³\á\Úûö–ýšg\Ôn¥ð\×\ÅoƒVl4wºYYø—á®¿i§\Þjööy1}®÷Gñ\\V7s\0à´³R\ÅaU¯âž¿ªø3È‘ÿ\0ŒþË¿AÁ##ûGÀG\Ôdƒ\Ü\Ô\nOošü\Ð\ék\àmè¿´7\Ä?.#¶½\Ò\ÓP¼§X·_½­Ëª>ÁÝ¾PÄ‚yþP¿ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\èþ\Ã\"(Ä†Q\Z	Xm2_0¯)|n#Á8\àzWøóÁ\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T­þ_¤\0ü#¢Š*À(¢¿\Ø_öÿ\0‚ÁüUð\à—Š5ÿ\0\Ø\à^¥®ø“\á\Ãm{Z\Ôg²ñ+O«k\rÑµ\rJöfÿ\0„™n¯.&žC\Ý\ä&“vþ¼\Òý@ÿ\0Š+ýœÿ\0\áÀðFŸúG\ÇÀoüñ/ÿ\04tÃ€?\à?ô€\ßø\â_þh\è»\ìÿ\0«yy¿¸ñŒ¢¿\Ù\Ïþÿ\0iÿ\0¤||ÿ\0Àÿ\0óGTõø7\ÏþÏ¨\Ø^X?\ìðJ\Ño-\æ¶7Zt^*²¿¶ó§Ÿgw‰[{˜‰\ß¨~GPHeÊ•~\é¯\é›û˜\ã1EEðq—üóÀŸðJO\ÚgÀð¢µ=Pýž>>økTñ7´¯]6©¬x_\Ð/\Ò\ÃÄž\nŸ]‘R]n\Æ$¸°\Õôk\ë¤ûrY_µ•\ä—Ù‹™ÿ\0z \n(¢€?\×þ\r•ø\Ñ{ûJÁ?g›/Io®\Üü4¹ñ¿ÀÛ¸.X\Ü<š\Ã\ßOi\áh¯‹9‘\ä_Ï¥*»\ÛbM¤\ì¿|ôø[\Â\ÆVðö…§i/:,sKi\0Y¥YcyX´¬¡˜¶\Ò\ädŽ8þ[ÿ\0\à\Î\ÏùD\í\çh¯ŠY÷ù4:þ¬¥?º“þ¹¿þ‚j{ÿ\0‰}\ÞîŸ \âÿ\0Dý¡µÿ\0ÚŸþ\nû\\üoñõ\Õô\Þ-ø\ã\ã»})n¦–a§økÃº\Ý×‡<7¤Ù‰YŒ:~›£iVv¶V\à…†U\0s_×¨|n$ühø¼I$ŸŠ?$’I$ø¯V\É$òI\îO&¼¾¨Š+Ö¾ü\Zñ\íñ¯\áOÀ\0\Ã\Þ2ø»\ãÿ\0|>ð\ï\Ú7ý’\ßRñN±k¤\Å}|c\r\"\Øi\Â\å¯\ï\Þ5gK;i\Ý™B%¢¿\×öBÿ\0ƒ]?\à”¿³¯\Â\í\Ã_>\éßµÄ§Ò´ÿ\0øM>#|ZÔµË¸µ/-¼cRŸ\Ã>\Z\Òõ=3JðÖ%Àag`‘]\\$*¯qw-Ä“;}cÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¥~Éµ\ß\æ¿\Ïð`Œeþ\Îð\àø#Oý#\ã\à7þ\0ø—ÿ\0š:?\áÀðFŸúG\ÇÀoüñ/ÿ\04t]öÕ¼¼\ß\Üø\ÆQ_\ì\çÿ\0\0ÿ\0‚4ÿ\0\Ò>>\à‰ù£¯\å{þ\\ÿ\0ƒ|ÿ\0e\ÏÙŸön»ýºÿ\0bOÿ\0Â¡³ðˆt\r\ãÁý*úþûÀ÷^ñ\Ñ\èö1ð´\Z­\Í\í\ç‡õ#Z6Vú¶Ü¶\Z•¾¬\×QCi5‘Y\Îm¯¥öû—ùþ\0´QE0\nÿ\0A/ø2/ö€×¯´\Ûcö_¿ºi¼=\áë¯‡Ÿ|;÷Hm/¼F5xŽ\ÊAm\"\èZ\Í\ÒÂŠ¯s2\ÊÙ‘Ý›üûkûiÿ\0ƒ$?\ä\î¿l³ŽG\ìý\à¿ýOÞ“\Û\æ¿4ú~\Ð9ÿ\0…	ñ¿#ñh~%t\è\âŒÖ‡—N\Õþ¾ ÿ\0ö·ÿ\0a}Kÿ\0K&¯÷‚ý ¿\ä‚üpÿ\0²Eñ+ÿ\0P½f¿Á÷\Äò\Öÿ\0\ì/©\éd\Ô\'{¾\í\é(Š(¢˜ô\ÝWS\Ñ\îMæ‘¨\ßiw†›_µ\é\×S\Ù\\ýšò	-o-\ÅÅ³\Ç(†\î\ÖYm®c{ie‚PñH\è\Ô+\êOØ›ö]ñ?\í«ûY|ý•|¨A£\ë¿þ#h¾‹Y¹Pð\èºm\ÃK{¯\ëM2‹†\Ò4-ORŽØº}¦[T·Þžf\áþ­ÿ\0¿\àÚ¯ø#\×Á†\Þð³û&xO\ãNµ¥\Ú\Â5ˆ\ßõ\r^ñ‰53I{u%ž¯§\éº}µ\Å\ÊKqm¥i\ÖP\ÚX$\ßfˆÈ‘«R¿õý_€\ã\ÙE³Ÿü8þ\Óÿ\0Høø\rÿ\0€>%ÿ\0æŽøpü§þ‘ñðÿ\0\0|Kÿ\0\Í}Ÿõo/7÷þ1”Wû9ÿ\0Ã€?\à?ô€\ßø\â_þh\èÿ\0‡\0Á\Z\é¿ðÄ¿ü\Ñ\Ñw\Ùÿ\0VòópÈ§üÿ\0\'1ûtÿ\0\Ùø_ÿ\0©þ¯_\èSñ‹þI\Å?û\'8ÿ\0\ÔgT¯›?e_ø\'\ì7ûkþ,ñG\ìû5ü:ø\â\é:‹u_[j\Ý\ëº6›zúŽŸzÚ†§~¦\Þ\Úõ\Ú\å%Œ™Y˜\0\Ò¿\ä‘|Sÿ\0²q\ãýFuJZë¥µ‹ÿ\0\Ò ?Á\Ï\Æò8x³þ\Æ]wÿ\0N—U\ÍWK\ã?ù<Yÿ\0c.»ÿ\0§Kªæª€(¢¿Tÿ\0\àˆ¿>þ\Ðÿ\0ðU_\Ø\Ç\à·\Æ\ß\è¿~ü@ø•«h\Þ3ðGˆ’\éô_i±ø\ÅúŒ6·\égsgr\ÑÃ¨YY\ÞF#¸÷ö\Ño\ßø\Øò²¶ü5ÿ\0#‡ÿ\0\ì7¥\é|þ\Ëð\àø#Oý#\ã\à7þ\0ø—ÿ\0š:|ð@?ø#\\R$‰ÿ\0ùø\n7WBtÿ\0°„2’­\â&V\0•`Tô Ž*So£þ­\å\æþ\à?P>\É+øcÿ\0dÿ\0ÁŸú\é\Õ\èUGNÓ¬´};O\Òt\Ëh\ì´\Ý*\Î\×N\Ó\ì\áCicen–¶–\ÑIÁq\Å$ª2OZ½Dvû¿ô”òQÿ\0•\Ê,¼ÿ\0gGð\ëÿ\0QŸWùoWúÿ\0Á\å_ò‹/\Ù\Ñü:ÿ\0\Ôg\Çþ[\ÔGo»ÿ\0I@QEP\è?ÿ\0@ÿ\0È£ûwÿ\0\Ø\Çð›ÿ\0Mž!¯\ïf¿‚oø2þEÛ¿þ\Æ?„\ßúlñ\r{5+\â?\Ê\0QEPQ@Q@Q@.þ\Ü?òeµ÷ýš\ï\Çÿ\0ýTþ-¯ð©¯÷Vý¸\ä\Êÿ\0k\ïû5ßÿ\0ú©ü[_\áSInýDESújÿ\0ƒH?\å2\ì‰ümÿ\0\Ó…¬u“ü\ZAÿ\0)“øsÿ\0dO\ãoþ˜,+ýcªW\Äþ”\0ü¿ÿ\0‚·ÿ\0ÁKü;ÿ\0£ý•mj/|,\×>/i—?|!ð\Ïþ_\ë\Ú‡/¢ŸÅšˆµõf\Ô5+k¸\r½¢øzH^\Ý id’\î&cI2Ÿñ÷Á_ú1Š?øv|\'ÿ\0\Ìõ}óÿ\0Œÿ\0\Ê#4\ßû:Ïƒú|G¯ò¹¥š\ëÓ«\í\ßúùþ‰¿ñ÷Á_ú1Š?øv|\'ÿ\0\Ìõñ÷Á_ú1Š?øv|\'ÿ\0\Ìõ•\\«\Ï\ï\ç\ä¾\à?\Ñ7þ#~ø+ÿ\0F!ñGÿ\0Ï„ÿ\0ùž£þ#~ø+ÿ\0F!ñGÿ\0Ï„ÿ\0ùž¯ó²¢ŽU\ç÷¿óò_p\è›ÿ\0¿|ÿ\0£ø£ÿ\0‡g\Âü\ÏQÿ\0¿|ÿ\0£ø£ÿ\0‡g\Âü\ÏWù\ÙQG*óû\ßùù/¸÷ÿ\0‚tþ\ÚZGüö@øIûZ\è^\Õ>\é¬5[\ë_k:­žµ¨i+¥\ëWú;,ú•„0[\\†±7”†6H\åTu¬+\í\Úü$ÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯Ýº—]Ÿ\è€(¢Š`QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0ð|ü_\Øþ\Ê\ï\Æ\ÏýC|_\çM_\è³ÿ\0Áÿ\0\Éý?\ì®ülÿ\0\Ô7ÁþtÔ–\Ë\Ñ~@QE0?\Ó\ãþ\Ãÿ\0”lüaÿ\0³šñ/þ¢¯\ëûø?\à?Ò¿ø3þQ³ñ‡þ\ÎkÄ¿úˆxZ¿¯\ï\àÿ\0€ÿ\0JKw\ëú ?‰ø=¿þMö3ÿ\0³ñ§þ 	_\æ\á_\éÿ\0·ÿ\0É£~\Æöp>4ÿ\0\Ô+ü\Ü([/Eù\0QEÀÿ\0M_ø2´\çþ	ñûE\Óþ\ZŽûû§ž¯\ìˆtAü«ø\Ýÿ\0ƒ+?\å´Wý÷þ«¿\×öD: þU+\â—\Ëòi;¡þkKI\Ü}óKeþ(\éHñšÿ\0ƒ‚\É?ðY?\Û\ç?ô[.\ÇþP4:üm¯\Ù/ø8/þS\'û|ÿ\0\Ùl»ÿ\0\Ó‰_µ@$?\ëbÿ\0®‰ÿ\0¡\nŽ¤‡ýl_õ\Ñ?ô!@\ïGðLŸøS_=þxŸü%4šõ\Zò\ï‚_òF¾\Ù0ðþ¢zMzLvû¿ô”_%~\ß@\Ø[ö\Î?\á”ÿ\0hNqð—Å§¡\È\ë\ÏÖ¾µ¯’ÿ\0oŸù1\Û;þ\ÍOö…ÿ\0\ÕK\â\Úoošü\Ð\áwES\0¯\êƒþòÿ\0”ÀEÿ\0f»ñ·ÿ\0N¯\å~¿ªø3\ËþSýš\ï\Æ\ßý8x“\Û\æ¿4ú¬Wøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê WûWøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T\Çu\éú@\Â:(¢¬¿\Þö^ÿ\0“gýÿ\0\ì…ü$ÿ\0\Ô\ÃõþuþðŸ²÷ü›?\ì\ïÿ\0d/\á\'þ ¥\Õz?\Í\î”QE0\n(¢€?€_ø>üŸ°Oû\ßÿ\0—„«ø¯\ïûþûŸ°Oû\ßÿ\0—„«ø¤¶^‹ò\0¢Š)þ¨_ðgoü¢vóþ\Î+\â—þ¢Wõe7ú©\ë›ÿ\0\è&¿”\ßø3·þQ;yÿ\0gñKÿ\0@\Ñ+ú²›ýT¿õ\Íÿ\0ôS\ßüQÿ\0\Û@ÿ\0¯\ßòYþ.ÿ\0\ÙOñ÷þ¥zµy…z\Æ\ïù,ÿ\0\ì§øûÿ\0R½Z¼Â¨¿Q\à‰\àø+\ì\ÃEx/‚=\Ñ\èr:óõ¯ËªýFÿ\0‚\'\ÊX¿`û8¯ÿ\0\èwTþ\ÖTQE%²ô_QL¿	ÿ\0\à\åb\á\Ë_¶—¿†|?ó%øB¿v+ðŸþVÿ\0”-~\Ú_ö,øÿ\0V_„*^\ëúûQüwè¢Š \nþ\Ú\à\Éù;Ÿ\Û3þ\ÍûÁúŸ½\Õý´ÿ\0Á’òw?¶gý›÷‚ÿ\0õ?zOošü\Ð\èaûA\Éø\áÿ\0d‹\âWþ¡z\Íƒ\ïˆ?\ä=­ÿ\0\Ø_Rÿ\0\ÒÉ«ý\à¿h/ù ¿?\ì‘|Jÿ\0\Ô/Y¯ð}ñü‡µ¿û\ê_úY5(\í÷\é(Š(¢¨\Û/ø70ÿ\0ªý‚r\Ç\Ä\ÏøS\ãò\Ïpy¨<Žký‘\Þo\ÃùWø\ÞÁ¹òš¯\Ø\'þ\Ê_Šÿ\0õTxþ¿\Ù}\æü?•.«\ÑþhQEÀ(¢Š\0+\Î>1\É\"ø§ÿ\0d\ã\ÇúŒ\ê•\èõ\ç¿\ä‘|Sÿ\0²q\ãýFuJOošü\Ð\à\ç\ã?ù<Yÿ\0c.»ÿ\0§Kªæ«¥ñŸüŽ,ÿ\0±—]ÿ\0Ó¥\ÕsTÀ+ö‡þ\r\ßÿ\0”\ÒþÀöWuýV¾9¯\Å\êý¡ÿ\0ƒwÿ\0\å4¿°ý•\Ýcÿ\0U·Žhý•è¢ŠKe\è¿ \n(¢˜\ÉGüUÿ\0(²ðGýÃ¯ýF|q_\å½_\êCÿ\0•\Ê,¼ÿ\0gGð\ëÿ\0QŸWùoT\Ço»ÿ\0I@QEP\è?ÿ\0@ÿ\0È£ûwÿ\0\Ø\Çð›ÿ\0Mž!¯\ïf¿‚Oø2\ÓþOÛ¾=\é\æü&sõó7\Ä*Ç\á¡ö\í,\nƒE{y©_ùþP\0¢Š*€(¢Š\0(¢Š\0(¢Š\0ùwö\áÿ\0“+ý¯¿\ì\×~?ÿ\0\ê§ñm…Mº·\í\Ãÿ\0&Wû_Ù®üÿ\0\ÕO\â\Úÿ\0\nšKw\ëú \n(¢˜\ÓWü\ZAÿ\0)“øsÿ\0dO\ãoþ˜,+ýc«üš¿\à\Ò{›{oø,§\Ã1q4p›Ÿƒ_\Z­­Ãœy\×\á\ë7Hc\ã™#‘€\ã!ž+ýej~\×\ßùD\æþºø!ñƒö€ÿ\0‚\\\é\Þø!ð\Ó\Æ¼f?iŸ„\Ú\ÓøcÀº÷ˆµ´\Ñ\ì4?\Ã{©¶Ÿ§\Ç5È²µšò\Ò\ç”ŠK¨C#ü\Ø?\á\ÖðQÿ\0ú2?\ÚWÿ\0\rGŠ¿ù__\íÿ\0E™t\íÿ\0¶¯\Êÿ\00?\Äþaÿ\0ÿ\0£#ý¥ð\Ôx«ÿ\0•ôÃ¬?\à£ÿ\0ôd´¯þ\Zò¾¿\ÛþŠ=\î\ßÖž~ ƒwÆ¿\Ù\×\ã·\ìß®i>ø÷ð“Ç¿|C¯iG\\\Ñtoˆ\Ô|5¨\êš8»ž\Ä\êvVº”0Kqf/m®-Lñ©ŒO‘\çr<b¿´Ÿø=¤“ûsþ\É ’@ý”\îp2p3ñk\Ç\àv\É\ä\×ñmTžˆŠ( öÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯Ýºü$ÿ\0ƒj\å±\Ïý‹ž+ÿ\0\Ô\×^¯ÝºKw\ëú \n(¢˜Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@\Ãüÿ\0$öÿ\0²»ñ³ÿ\0P\ßWù\ÓWú,ÿ\0ÁðòA`Oû+¿?õ\rðE5%²ô_QLôøÿ\0ƒ0ÿ\0\å?\ì\æ¼Kÿ\0¨‡…«úþþøô¯\äþ\Ãÿ\0”lüaÿ\0³šñ/þ¢¯\ëûø?\à?Ò’\Ýúþˆ\âcþoÿ\0“FýŒÿ\0\ì\à|iÿ\0¨Wù¸WúGÿ\0Á\íÿ\0òhß±Ÿýœ?õ\0Jÿ\07\n\Ë\Ñ~@QE0?\ÓWþ¬ÿ\0”|~\Ñ_ötw\ßú®ü_\Ù\è>ƒùWñ»ÿ\0V\Ê>?h¯û:;\ïýW~¯\ìˆtAüªW\Å/—\ä\ÒwCü\Å-\'qô?\ÌQ-—ø¡ÿ\0¥\Äñšÿ\0ƒ‚ÿ\0\å2·\Ïý–Ë¿ý0h•ø\Û_²_ðp_ü¦Oöùÿ\0²\Ùwÿ\0¦\r¿j€*H\Ö\Åÿ\0]ÿ\0BIúØ¿\ë¢\èB€?Þ\à—ü‘¯„öL<ÿ\0¨ž“^£^]ðKþH\×\Âû&ÿ\0\ÔOI¯Q©Ž\ßwþ’€+\ä¿\Û\çþL_ö\Îÿ\0³Sý¡õRø¶¾´¯’ÿ\0oŸù1\Û;þ\ÍOö…ÿ\0\ÕK\â\Úoošü\Ð\áwES\0¯\êƒþòÿ\0”ÀEÿ\0f»ñ·ÿ\0N¯\å~¿ªø3\ËþSýš\ï\Æ\ßý8x“\Û\æ¿4ú¬Wøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê WûWøñÿ\0Á\Êÿ\0ò™\ß\Ûþ\Æ/	\ê T\Çu\éú@\Â:(¢¬¿\Úsösÿ\0‚œÁ<´?\Ù\ï\à>«þ\Ú³–Ÿª\é¾éš•…\ß\Å/Áuea\à\Öò\Ò\æ	o–Xg¶¸ŠHfŠEWŽTdu¤Wø±\ÑI«\Ûú\êŸ\èû€ÿ\0\Ã\Ó?\àœ_ô{³Wþ\nòÂøzgü‹þoöjÿ\0Ã±\áOþXWøQEŸwý[üŸ\Þû€ÿ\0\Ã\Ó?\àœ_ô{³Wþ\nòÂ¼\êûþCÿ\0£\Ó.n\ì\ï¿o\ßÙ¦›	%Š\î#ñK“Ê’ùªZ?1n1³©þküP\è¥g\Ýÿ\0Vóòx\Õ\×üSÿ\0Lýÿ\0à ¿´/Àÿ\0‡?²ÏŒ¬þ&ü.ýŸ<)\â«üJÒ­\çÃ¾\'ñÇ.\ì®o-ü+wu\Z–£i\Z}…¬ú‡\Ùã·¸\Õ$»Ž\Ô\Ë\r°šO\åŠ*–‰.ÀQE\0ªü\Ø\ãS·Ÿöq_¿ô\r¿«)¿\ÕKÿ\0\\\ßÿ\0A5ü\ìÁ¬?uÏƒ_ðF\ï€w^\"\ÓV\ÃSø·\â_ˆ\ßm¹\ï<7\â\ïO…/¸:›gpŠÀ&\Ê\îFF?\ÑW±\èGO\çü\ÅOñ/ý·_N¾€‚¿\Æ\ßù,ÿ\0\ì§øûÿ\0R½Z¼Â¾\Ðÿ\0‚‹ü\Öÿ\0g/Û»ö¶ø-\âZ-GÀ~&i£(È“X\\ø£P\Ôô«˜*‰-®t\Ë\ëI­\æA²h$Cµ…|_T_J~\Ç¦ý•ÿ\0j¿\Ù\ïöŒŠ\Â]U>\r|ZðWo´¸R\çR\Òt-j\Ö\ãZ\Ó\í]Ê¢]\Þim¶µy.$‰¤ùW\ÍtPûN|ÿ\0‚\ßÿ\0Á,h\0\è\Þ?ð\í›ðgCƒR\Ó\ìn\ïü1\ã\ï\Ùx\Æ^\Zº½g:Gˆ¼=\â³º²\Ô\íN\è§HMÍ¾\å-\rÄ±•s\ì¿ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°¯ðþ¢•»7n\Úù“ûÀÿ\0pøzgü‹þoöjÿ\0Ã±\áOþXQÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\nÿ\0\ê(³\îÿ\0«“ûÀÿ\0o‹\Ïø*\Çüf\Â\Ò\æú\ïö\àýš¡µ´…ç¸—þ¯…\ßË†1¹\ßdw\Î\í´s„Fc\Ø\ZþY\à\åø.÷\ì)ñ{öñ¯\ìmû)|e\Ðÿ\0h‰\Z5ŸZø›Zð\n^_øÁžð\î»»ª¶¥\ây µ²¼\×oot½:\ÓO\Ó4\Ãx<¹gººšƒË“ü\èh¢\Ý\Ûvÿ\0ú«€QEÀ+ûiÿ\0ƒ$üe\Ï\í—ÿ\0fý\à¿ýOÞ¿‰jþú?\à\È_‚ºúk_·\'\ísfW\Â÷\ZW\Ã?ƒzEó)Mz\ÒóUñ¦½dñ\'•§\Þh\å?Õ™B±ý\à=¾kó@v?´ü_ŽöH¾%\ê¬\×ø>øƒþC\Ú\ßý…õ/ý,š¿\Þö\Ïü(Où\ÆO\Â‰]:È™­Wø>øƒþC\Ú\ßý…õ/ý,š”zü¿ô”EQT\íŸü—ÿ\0)ªý‚\ì¥ø¯ÿ\0UG\ëý\Ç\Þo\ÃùWø\ÞÁ¹òš¯\Ø\'þ\Ê_Šÿ\0õTxþ¿\Ù}\æü?•.«\ÑþhQEÀ(¢Š\0+Î¾0+?\Â_Š(Š\Î\ïð\ë\ÆÊŠ ³37†µ0ª rX’\0’Nz-Q\Ôôûm_M\Ô4«\Ä/g©\Ø\Ý\é÷H	\í¯`’\ÚurE#ö\ÏŸ\ê¿4øø\Ô2ø\ËÅªÀ«/‰µ\å`AªÝ‚=<\\\Í}û`|%ñ7ÀÚ«öŠø9\ã	4\Ï|9ø\Ïñ\ÂÚ”ª\ÊñI¦ø§SŽ\ÚÜ…ž\Ð\Û\ÜGœ\æ9T‚A\ÉùÊ˜}‹ÿ\0ùý¨\ìWûkþ\Ìÿ\0µC\érkv_>+øs\ÅúÎ“\Å\Íÿ\0‡Y4\Ï[Ù‚U\Zùü?¨jaŽFXd¼G3™\Èø\êŠ\0ÿ\0jŸƒ?ð[/ø%\Ç_i^<ðg\í«ðKO±Ô¬\ì\î.t/\Zø¶\ÇÁ^,\Ð.o-\ã¹:Wˆ|;\â³½Óµ[UGu\0Â’)\\MY\Ö?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE+y¿\ê\ß\äþð?\Ü¿\à©\ßðNVfý·?f ª1ÿ\0…¯\áN\0\'C<Jû·O¿²\Õl,µM6\ê\í;R´¶¿°½¶‘f¶¼²¼….-n­\åBRX. ’9b‘IWÕ”E€•¼\ß\ìú1ð\àˆ\0|\"øl\0\0\à\Í\0\nZ§{\Þÿ\0‚_\å˜\ÌGüSÿ\0¯ð\\‹´qþÔŸ\rÄ’%¿†|s°;…/µ¶\ç¶œt¯òÛ¯õ»ÿ\0ƒ«¾\n\ë¿ÿ\0\àŽ?ot+i®\î~xÿ\0\á\Æ[ø­\Ð\É Ñ¼;«^xwW›\Ê\\³\Çog\â\É.&\Ú“RNØŽ#ü‘(Ž\ßwþ’€(¢Š ?r¿\àƒ_ðWË¯ø$o\íM­ø\×Åž\Ô|mð\ãF…¥ø#\ãW‡tCñ.›e¥\ê2\ßøs\ÇK—Ž\Ú\ïUðµ\Í\æ¡ö\"Y ]gI\Ô/­c¸Šò;&\éð;þÿ\0 ý </a\â~\Ú\ßô–»°†þ\ï\Ã>?\×\×\áÿ\0‹ôAp_m¾·\áÿ\0&Ÿsiv\n6ô®#\Î@•ˆ ‹u­òz~ÿ\0+þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þ\à?ðô\Ïø\'ý\ß\ì\Õÿ\0‡cÂŸü°£þ™ÿ\0\âÿ\0£\Ûýš¿ð\ìxSÿ\0–þ\ÔQg\Ýÿ\0Vÿ\0\'÷þáŸ´?\ÆO…??\àžÿ\0µŸ\Äoƒ¼\'ñ?Àz‡\ì\ÕûH\é\Ö>.ðVµg¯\èW\ÚG\Ã/Xê–jVKm$ö‘Imu\Z¹1LŒ‚+ü<\ëýSÿ\0\à\ÙOŠðo­¿\Ãh\ão‰\Z‡\í{\àA$²5o\ëþ*ððyj/ö€,\Äª3‚+ü¸~!ø7Tøu\ã\ïx\\µ¹²\Ö<\â\ßxOT´¼‰àº·¿ðö¯w¤\ÝE<R*¼r,ÖŽYA\ÏlRŽ—[\ë¿\É\ÇQE@}›ÿ\0øý²|aû\0~ØŸk?\éË®\ßü%ñtZž­\á‰n¤³·ñ_…u[\Å>žt?º:ž‰x–sH¯¶¢–Wo‹}§ý`¿e\ïø8;þ	?ûQø/\Ã\Þ%Ñ¿k‡\ß¼O«\Ù$ºŸ\Ã/Œz’ø\Æ\Þ¾H\Ó\í¶7–ú¸M¾†\Úå¤†OK\Ô.¬¯cE¸…\ÄSFø\ØQJ\×ù_\×ü0\îÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\n?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE}\ßõoòx\îÿ\0Lÿ\0‚q\Ñ\íþ\Í_øv<)ÿ\0\Ë\n?\á\éŸðN/ú=¿Ù«ÿ\0Ç…?ùa_\áýE}\ßõoòx\×üÿ\0ûD|	ý£¿l¿\Ù\Ä\ß~-ø\â÷‡ô/Ù¢\ãCÖµ‡þ$\ÓüK§\éZÁøŸ\ãõ\Ó/®´Ù¦†Ö²¹·º3\ïò&ŽL\0Â¿‘\Ê(¦€(¢Š\0ÿ\0a\ßø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¯\ÂOø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¤·~¿¢\0¢Š)€QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEü0ÁðòA`Oû+¿?õ\rðE5¹o\í‰ÿ\0ûýo½À\Ú\íoð_@øÉ¤|7\Õ5gÁvz\í\î·bš£\âK+b\â\Ýô]OM–C{m§YG*Nò\Æ>\Í*«OÁÿ\0ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUJvIY\ÝY~_\æ€ÿ\0*+ý\âø#ý\ß\Ã\Ïüx÷ÿ\0šª?\âø#ý\ß\Ã\Ïüx÷ÿ\0šª|Þ¿Õ¿\Íùuÿ\0aÿ\0\Ê6~0ÿ\0\Ù\Íx—ÿ\0QWõýüð\é_+þ\É_±7\ìÁûxYø_û*|\'\Ñ>ø_ñÇ‹u}CºÕ¯-\ï¼Csgka6¥,º\Åþ£tf{;+[}«0ŒG\nA\Î~¨\çn?\Ù\Ç\éBw»óý\Ä\Çü\ßÿ\0&ûÿ\0\ÙÀø\Óÿ\0P¯óp¯÷8ý°?`Ÿ\Ù/ö÷ðÇ„|ûZü\Ð~1øsÀz\í\ç‰<\'¦\ë×šÍœz6·¨X2òþ\ÚMQ\Óf2\\X³:\Ë$‘\ì\è€ó_\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T“\Ñ&ŸEÿ\0¤ÿ\0˜\ã…E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUO›\×ú·ù ?%ÿ\0\à\Ê\ÏùG\Ç\íÿ\0gG}ÿ\0ª\ïÁõý‘ƒ\è?•|Ÿû\"þÃŸ²\Ï\ì!\àü8ý”>\è¼\â¯·Œ<A¢hWZ½\ä\ZŸˆ\ßO³ÒŽ§<ºÆ¡¨\Üù\ß\Ùöv¡ReŒE\0™\É?Xƒ\è)GW\'m\íù\0´\Ç\Ðÿ\01KI\Ü}ô¢WkþÞ‹û¤›üf¿\à\à¿ùLŸ\íóÿ\0e²\ïÿ\0L\Z%~6\×ûI|pÿ\0‚\ZÁ+ÿ\0hÿ\0‹8ø\ãñ£öFð?Ž>)|H\Ö_\Ä>5ñmþ¯\ãk\Ý{Y’m¤¿º‡Oñ\r¥š\Ìð[\Ãy6ñ)¯Ëœ“\å_ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8U$?\ëbÿ\0®‰ÿ\0¡\nÿ\0cŸø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªø‡þÁ\Çü`\ß\Ã\Î?òñ\á\ès\È>*Á õù½«šõ«\à—ü‘¯„öL<ÿ\0¨ž“^£Yš>‘§øI\Ò4-\Õ,´M²\Ò4»8\Ë\í4\í:\Ö+;hË–b[AJY™ˆQ’NMiÒŽ\ßwþ’€+\ä¿\Û\çþL_ö\Îÿ\0³Sý¡õRø¶¾´®_\Çð\ÏÄø»\á\çt˜5\ïø\ï\Ã\Z÷ƒ|Y¡\ÝV\×Yð×‰´»­\\Ò®\ZŠeƒP\Ó/n­&1I‚9˜£«aƒ–\ß5ù ?À¾Šÿ\0c\Ñÿ\0\ãÿ\0Á\0þo\á\é\Ç:ÿ\0r~¿ñUu£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\n¿ªø3\ËþSýš\ï\Æ\ßý8x¿¹\ßø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æª¾‘ý•¿\à?ðNØŸ\âª|lý˜fo	|(øžž\Ö|$¾+ÑµO^^\ë\ïe&­§u}sP´ò\ïN´\Þÿ\0góTE„u\ÙM\Ýu\Ý~q¨¥Uþ<ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\èþÃ•þ<ðr¿ü¦wö\Æÿ\0±‹\Â_ú„\è£¿\Ëô€„tQEXWúñüÿ\0ƒz?\àŽþ.øðS\Å^ ý‰þ\ê:÷‰¾|7ñ·¨K®ø\åe¿\ÕõŸhÚŽ¥{2\Å\âx\â\Ý\Þ\Ü\Í<‚8\ãŒ<„\"\"\áBn\ß×š_¨\ä9E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@ŽþÇ¿ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8TWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05U\Ý\è?ð@ø#†þ\È\Úüû\àD\ÓZAöx\î5m3^\Ö\æ2yo-Á\Õõ\ÛÔšw‹M\"R\ÄFQp Nýÿ\0«˜\ã7£hš×ˆõ+m\Ã\ÚF©®\ê÷¯\åY\éZ6ŸwªjWr\Ï;k(§ºÿ\0ØŠ\'ojþ–¿\à‘ÿ\0ðl\ï\í‘ûtøûÁ?¿h¿ø£öký’­\ïô\Ío\Ä\Þ$ñÕ…Ç‡~!|E\Ðc¸ó¥ð÷Ã\ß\Ç±šº[\\i÷^(\Õ\í¬tý	\\\ÜE¡w\äZ¿úzü&ýd¿	f>~\Í>O§\É\æ\Ù_øOáŸ„t­^\Ú@ˆŠñkP\éCVR4þšvX`³ô¦	\ï\íþ=Gœû\Ñw¥—\ß\ÓnŸð\Û\Çü>ð„~xÁÿ\0\r<¡\ÙxkÁðÞ\á/\nh\Zt)Ž‘ x~\Â\r7J\Ó\í¢@ª#·´·‰7cs²³¹.\ìO`}}?\É\ç¾)h¡+-u{¿_\ë`?\ßø9þ\r\åñ·\í\å\â!ûl~\Æ:U\ß\í¦xr\ÛFø±ð¢\î\ê\ßHôo\Ú,\Z»\á}Få¢°·ñþ‘¦\Ãý“&Ÿ%½¿‰la\Ó\áK¨u+Uû_ù\Ãüdøñ¿öxñf¥\à_ŽŸ	¾ |&ñn‘s¦_h~=ð®¯á»´¾´fKˆ`mJ\Ö/Dl­û\ë)® p7$¬¼\×û\Ì\ã¸\ãùv\Ï¸¶kÌ¾%üø?ñŸK:\'\Å\ï…_þ\'\é>D\Ö\ëc\ã\ïø{\Å\ÖðE8e•m“]Ó¯¾\Ê\Ìˆ’\ÛÊ‘—WW\ÃQ¶?­?\àöüCüh¯ö˜ñ?ü¿þ	\ã-B]S\ÄðOÿ\0\Ù\æ\æúyæ¹š{O]h\Þd\×,Vh´]KO„†a‘dg>Z&N|®\çþ\r\Îÿ\0‚0\\\ÜMpao†°\äiL6\Ú×Žá·ˆ±\ÉHa_Š1ü(¼(\àq\Å.o&¿¥\éÕþ7tWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05Tù½«šüp¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\nŠÿ\0eþ\r\äÿ\0‚2h\Âq\ìð†ü\ÎP“¬\\ø\ËT1bu\â‡Xƒg/°\ÄœWÓŸ	¿\à”¿ðM¯·‰¨|,ýˆÿ\0g/_Å°\Åv¿ü?¬\\F\Ñ\Ã\äG$Rø‚\ÛUd•c\àJ¥e<\Í\Þf—7“\×þùþ\0’ÿ\0\ìÿ\0cý¿ÿ\0\à¢þ2\Ñôo‚üQ¡ü?¹\Ôl\íüGñ³\â&“©xC\áo…t\ÙÇŸ6¥6¹ªZÀúô\Ée\Äö:W‡aÔ¯µ9\áp*Hû—ýj\àš?ðOß…_ðL\ï\Ù\á\Ï\ì±ð®yu¨ü5\rÆµ\ã\Þ\Ú\Åkªü@ø…­ùw(ñf¡E¾\Ï\å\Ú-¶“§¦]+Gµ±\Ó\ã’E·go»tý:\ÃI±µ\Ó4«=/M±…-\ì´ý:\Ö;+;x\Æ[Khã··…	Qª(ûª*\ïOñõ§«\ß\É\Û\î\ß\Ñþ€y\íÿ\0$\ã‡ý’/‰?ú…\ë5þ¾ ÿ\0ö·ÿ\0a}Kÿ\0K&¯÷\Ë\×tM/\Ä\Ú&µ\á½r\Î=CEñ—¨hš½„¥\ÄWº^«e-†¡i!FW\Ü\ÚO4.Q•‚¹\ÚÀ\à\Å\Ù?\àÜ¿ø#²I+þÃŸ\Ë\Ë#\È\äk¾;Q¹Ø³aW\Å!Tdœ*€ p\0‹Ù¿7ÿ\0È¯\Ìñ¿¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Í\×þ\r\Ëÿ\0”\Õ~Á?öRüWÿ\0ª£\Çõþ\Èc\ï7\áü«ò\à7üûþ	oû2|]ðO\Çß²_‚¼ñ_\áÎ£s«x3\Åún¯\âû›\íQ»\Óot{‹«h5\ÞY<’iÚ\í©ó\í¥\'r 8V«£«{\â„\î\ÓòüùXES\0¢Š(\0¤>¼ñ\éþy¥¢÷øšÿ\0ƒŽ¿\à\Üþ\×þ>Ö¿n\Ï\Ø[I°\Ö>6\êšT#\ãÀÖ¸´Ò®~\'\\h¶^EŽ<}töö\r\ãYt\ëh4\Ío\Ãú„ö\ë\â‚\Æú\Â\íuw\Ïù\á|[øñ£\à\'‰õ|køU\ãÿ\0…~(\Ò\ï\î´\Ë\ÝÇž\Ö|3v—\ÖR4w0\Â5K;h\î\Äl‰m$ž	y‘\Èñ\Çý\èq\ßüH\í\Û\×üó^oñ\à\ß\Â?‹ö	¥üXø[ðó\âfŸR\ÃŸ|\á\ß[\Û\Ç2ºÈ¶\Ñ\ëúuø¶\Þ$š-Ô±`ÁŽ\êJ\ë\ÏÏ¯õ\ç\à¡Eµ‹¿\à‡_ðHÿ\0\ßI©xŸöýž//¤¸š\æK‹O	M¢3\Í0A+\Ð\ïô\Ø\Ê8Eý\Ö\Ï(¨šñù\àÜ¿ø#³K/ü0\ÇÃˆ¼\Ùd—Ê‹]ñ\êC˜Å¼¸“þ³²$\Î\Ø\×\'j€2qš/¶_øõüo¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¯÷›ýŸ¿\ä‚üÿ\0²Eð\Ûÿ\0P\Ý¿(üÿ\0` øaÏ‡£ ŒÇ Œ÷þ®¾•ûO¡hš_†´MÃš¤z~‹\áý+O\Ñ4‹‹˜¬´½*\Ò\r>\Ò\"\ì\Îc¶´‚P»3A¹‰É¥{¸Û¥ÿ\0¿\Ì{\âG\Ã\Ï|[ø}\ã…¿4koø\â/…uÿ\0x·C»]\Öú§‡¼M¦]i\Z½”‡“ž\Ê\îdŽd\Û,”šYQ”—ü\Ëþ\r±ý±ÿ\0`oˆ0ñ\ßÀŸx¯öý’®õ+ýSÂž5ð.—q\â/øEšt–\ß\Ãÿ\0ü%¥Gq«[\Ü\éks„%Ó­.´m`k¦6[Hÿ\0ÖŽóþ\Ïjv³Ó®ÿ\0\ç\ßm-\é°\à-©\ézž‰u¥k:uþ‘ªX\Ê`¾\Óu;;‹û9\Ô\Ð\ÝY\ÝGÅ¼ª&9£G\0‚G5B¿\Ý#\ã\ì%û~\Ð+t~4þ\Ë?~#\\_;½\æ¡\âO†~º\Ön\ÚN®5¸ô\Øuy‹d“\æ^¶	f$“ñ&½ÿ\0þÁ<D/\r\ï\ìðB\Ök\é¼ù®4{oè“¤¥÷³Aý—\âX\às¾8£X˜1%	 ÐŸ“_\Òÿ\0?ó°\ã%E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@ŽþÇ¿ñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUñ?üƒþŒo\á\çþ¼{ÿ\0\ÍUÞ¿Õ¿\Íþ8TWûÿ\0\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05T\Ä8ÿ\0ðFú1¿‡Ÿø>ñ\ïÿ\05Tszÿ\0Vÿ\04ø\áQ_\ì{ÿ\0\ãÿ\0Á?\è\Æþ\àûÇ¿ü\ÕQÿ\0\ãÿ\0Á?\è\Æþ\àûÇ¿ü\ÕQ\Í\ëý[ü\Ð\ã…E±\ïüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUGüCÿ\0`ÿ\0£øyÿ\0ƒ\ïÿ\0óUG7¯õoó@|¿ÿ\0”ÿ\0\Ê¾\rÿ\0\Ù]ý ?õejµø\Éÿ\0ÿ\0Áµÿ\0\Z~*|jñ\ç\í\ßû\0xM~!\Íñ\"\âo|rø¤\Ë¿‹\ãñœÌƒUñ\×\ÃkI\äŽA\âGe¿\×|/‘jVš¼\Ô4¸®\í®^\Ú\Ûûrý˜?eo€±Ÿ\ÂM+\àW\ì\Õð\ïKø]ð«EÕµ\ÝsLðŽs©]\ÙZ\êž$\Ô$\Õ5«µŸU¼¿½g½¾•\æp÷,©±ª _A\ã¦8ö\Ç\×\éþ·J•«r[\é¿k\'÷ý\àÿ\0¾\Z|EøU¯\\ø[\âo€üað÷Ä–’\ÏÆ‡\ãOjþ\Õc’\Ö_&qö-b\Ò\ÎwX¥ù\ZDF%HbI\â+ý\æ>(~Ï¿>6\ÛKgñ‹\à\Ç\Â\ïŠKhöL|{\à?xªdµ•J<÷ZÖ™yuj»¶š&\\\åH¯ÏŸÿ\0Á	¿\à^.½“P\×\àŸß³\Ô÷’™L“\ÙxnûF.fb\îYt]WOŒ\Ì\Å\Ü\ÄIò¶fª\ï³þ­ý|ž€‹mþ\Ç\Íÿ\0\äÁ™¿á†¾\Ì[¯xô(\É\'\n?\á*8Qœž\0“þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù ?\Ç\nŠÿ\0c\ßø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªø‡þÁÿ\0F7ðóÿ\0\Þ=ÿ\0æªŽo_\ê\ß\æ€ÿ\0*+ý\âø#ý\ß\Ã\Ïüx÷ÿ\0šª?\âø#ý\ß\Ã\Ïüx÷ÿ\0šª9½«šüp¨¯ö=ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨ÿ\0ˆqÿ\0\àŒôc?ð}\ã\ßþj¨\æõþ­þhñÂ¢¿\Ø÷þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£þ!\Çÿ\0‚0Ñü<ÿ\0Á÷ùª£›\×ú·ù 9ÿ\0ø6§þP\Çûÿ\0Ø¹\â¿ýMu\êýÛ¯ýžÿ\0gƒŸ²·\Â_\n|ø\à;\á\×Â¯\Ãwo\á\éS^\ÜX\éQ_^Ï¨Ý¬Sj77—’\ïng¸vš\âF/#\ãŠöš{o¯\à€(¢Š`QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0W\Ì?¶\Ç\ÍSöiøâ‹z7‡\ì|M©hwz-¥¶“©\\\Ïie1\Õu;{\'’ym‡Ÿˆc•\ÝR2¥Ÿn[\0ƒø\Åÿ\0ºø£ÿ\0DKÀŸø=\×ÿ\0Æ¿eðûÀ/üQ\Ékñd˜\\\Ç*\Ãf5²ªµ\ë\ç9V_5\Ã\Ð\Âbj\ÓT1¸ºœcKFJ¢‡$›iI¸\Ê\ßÎ¾*})üðg‰ip—gYž;­•\ásˆaðYg™RúŽ2¾+Br\Äa(NŠœª`\ëÞŸ3”c)$¤\è\îŠþq?\á÷_\è‰xÿ\0ºÿ\0øÔ°ÿ\0Ánþ%‰¢7<ðS2C\âr)š<\ëŽ“$nW!]¢‘T\à”`0~\éýü}I¿õS/vW²\â~»\ÛE|\Å+\ê÷ii«]?6\í\0ú3¶“\âŒö)´œ¥\Â9õ£v•Ý°\Ù^\îÉ»\'dÚ±ýQ_žÿ\0‚\àØ¾£~*ýŸ¯-ô©%…f¼Ð¼w\Õõ¤%È¸•,/|9o\rü‚2Vÿ\0o\Ó\Ã:•k…¹?iþü[ðW\Ç/‡~\ZøŸðûP“Qð¿Š,\ÍÕ“\ÜÂ¶\×Ö“E,–÷ºn¥j²\Ì-u>\ê)mo-\ÄÒ¢K1M4M¯ù‡x1\âg†|&7¸[“\à1õþ«…\Ç\Ç–fX*˜¯e:\Ë\r,NU\ÆÓ¡ˆ•*ugNŽ%ÑXR«*Jq§6¿ið»\é\àÿ\0Œ¸\ÜnY\á\ç\áó¬\×.Â¼v3*­—\æ\ÙNaO«Bƒ\Å\Ó\Ã\æ\Ø±XxU«Fj\à\Þ\"8yW¡C¥*\Ô\ã/L¢Š+òóö ¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Šü¬ý½\à \Þ0ý¾\"x+Á^ø}\á\Ï\Ûx§Ásx¦\â÷Y\Ôu+9\ígMvÿ\0H[Xc²!\Z/.\ÈL\Îùbò0Ÿ¯\àn\â_¸‹\rÂ¼\'‚¥Î±t1xš8zØ¼.œ¨\à¨\Ëˆ“\Äc*Ñ¡\nQrQ”Ó›÷b›gÀx—\âg	øI\Âx¾5\ãl^\'`±X,|Fˆ\Ì+F¾aˆŽ\r†\Â\Âu¥UšR’ ½\éh~©\Ñ_ß±—ü\ß\Ç´÷\Ç]\á&½ð\Ë\Â\ÞÓµ=Äš»j\ÚN«ª\Ý^E6‰d—qD°\Ý\æŽrJHNFO\Ù\Z\é\ãÿ\0¸³\ÃòŸq––]›U\Ëðù¤(Q\Ç`ó<*®\"…\Zž\ßZ½\'W^.›šœyqJQ¿…^-ðWŒü5[‹x‹\Ì2Z®+%«_—\â²Ú«ƒ\Ã\àñU\é¬>.\ê¸FŽ;\ÕEI9J)\ÞH¯ñ\ãÿ\0ƒ•ÿ\0\å3¿¶7ýŒ^ÿ\0\Ô\'@¯ö¯ò\Øÿ\0‚ûÿ\0Á.?\à¢_´üsö©ø­ðcö8ø\ïñ#á¿‰õÿ\0\Í\á¿\ZxSÁwZ®®Am\á\r\Öyô\ë\ÛyfŠ+¨¦¶}Áf†@ShVo…¿½÷þP?K?’\ê+õþ¥ÿ\0dÿ\0£\0ý¦?ð\Ý\ê?\ãGü9Kþ\n\Éÿ\0FûL\á»\ÔÆªÿ\0\×õ\ê¾ð?/ký\á?e\ïù6\Ù\ßþ\È_\ÂOý@<?_\ãz\àŠðV0	?°\í1\Éÿ\0‹w¨öüký\\þ-~\Õ:÷\ì9û%þ\ËwzŸ\Ãi|I¯\ßø\áÏ‚5ŸjzÁðõÏ‡µ-\áÆŽÚ•½\Þ\Í?Rg¼·¼·–\Îh0‚)b“\ç~{¼/\Ã9\ßñU\Âü7ƒY†wœÖ©†\ËðX\ÃaUz´\èU\ÅN/Œ­‡\ÃRJ…\n³\æ«Z	òò¦\ä\ãòœq\Æ\Ü7\á\Ï\n\æüi\Åøùeœ9‘R\Ã\Ö\Ìñ\Ð\ÂbñÒ¡^7\r—\á\Üp¸\ZŒUWS‹\ÃÒµ*3\å\ç\çŸ-8\ÊKõŠü(øaÿ\0“\Õ~!|Hð€\æøg¦\Å\ã?ø\Ãj1ø\êK‰,W\\\Ô\í´\ãx7‡#Y¿\Ú<\ß(ÈžfÍ›\Ó;‡îª’@Ï¿ó¯¤ñ\Â\Þ9ð·–\àx\ç%Y6\'6\ÃW\Å\à!\Ç+\ÌUzz£ZNyf3\ZN*F<µ\\%+\Þ)«µò>x\ßá·X\\\ç\á\Î{W<¡b0xl\ÖUr¬\Û+xj\Øúu\ê\áb£š`°n²«5wz>\ÑC’\Õ9y¡\Ì\ê(¢¿>?Y\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¯‘¿m\ÚCYý•þ\ÜüU\Ð|7¦ø«P‡\Åðú\éZ­\ÕÍŸ•¬½\à–å¥´ýñ’µ4)g\Ë³Ã¹i\ÅY\îQ\Ãy%\âs|ó‡\Ër\ì<\ëR\ÃB¶/QS£	×¯:tiFRzÎ¤\ã\î\ÚG\Îq\ä\Ü\r\Ã\ïqz¸l‡2\ÜNkšW£‡«Š«K…‡=i\Ó\ÃÑŒªÖš\ÃNœ\\¤ôHú\æŠþvt/ø-W\Ä\Ý[]\Ñ4©~\nø(µMcK\Óe’=w]2Gýý½¤’G¼•ó&,›]Ànd\è†	<\èb—|\Ø\ÖM¹\Î\Ý\à63œgÀÏ¥}§ˆþq\ï„õ2Š|q•P\Ë\'žCS-öž_˜ª\Ñ\Ë\Þbùž_\Ù:o‡IU\å\ç\æ|—å•¿9ðƒ\Çÿ\0\r<sŽ}/óL~b¸nYtsUŽ\Ê1ù[¥ý¨±\ìþ»Jš­\ÏõG?³m\Óq2\\È–Š(¯Ì\ÚBŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š+ñ“ö—ÿ\0‚¯\ê_³ÿ\0\Æ\ß|\"¶ø/k\âX¼wchº\ä\Þ2}9\ï\ÍÖ›k|\Ò}‰4¡\0V¸1ªyò&Ks_sÀ>ñ—‰Ù¶\'$\àœ¥gž<\Ï‡–?.\Ë\Õ<<F:\Þ\×2\Å\á(ÍªØºöpœª>w.^X\ÊKó¼aðÿ\0ÁœŸ/Ï¼CÎªd™fi™,£^–Y™\ær­–ŒT,³	‹«M}_Z~Ò¤!NñQ\æ\æ”Sý›¢¿9¿ao\Û\Âóö\Ç\Ôþ!\é·!ð!ð5Ÿ‡\ïRh<F\Ú\à\ÔFµ>£DÑ¾•§›s±<¡ÃUp	ý¯3Œ8?ˆ¸ˆq\Ü-\ÅYz\Ë3Ü¶8Yc0KƒÆªQ\Æ\à\èc°\Íb0ñ8jž\Ó\r‰£SÜ­\'.I¨\Í8¯g\Ã\ß¸O\Å.Àq¯\æSÍ¸s3«Ž£ƒ\Æ\ÔÁcrùÔ©—ck\åø¸¼.a‡\Ãb¡\ì±Xj\ÔÓ\Æj*tÜ¡(É”QE|\Éö¡EPEPEPEùoû{þ\ß\Þ.ýüm\à?\nøsÀñ|>.ð½ÿ\0ˆ.nõ­KQ³’\Ò[]^]5- Ž\Ë\nÑ”ˆ\È\î\ä±f\0\0\'\ëx#‚8“\ÄN#\Âp§\n`\écó¬m,]|>\Z¶/\r§*X,<ñX‰<F.­\Zp£NRQ”Ó“\\±»gÀø—\â_	øK\ÂX\Î6\ã\\^\'`q8&#„Ábs\nñ­˜\â©\á0±Ž	Ö’•j‘R’,#yI\Ù©W\ã\ì{ÿ\0@ñ\Ï\í+ñ\ßÃŸõß†ðÞ®i^!¾}_IÕµ[›\Ëytm2KøUa¼\Ý\Ç+G\å\ÈeX`\çör»<@ð\ç‹|/\Î\èð\ï\åôr\ìÖ¾]C5¥B†;˜BX,MlN•Oo‚­^”d\ê\á+\ÅÓ”•H¨©8¨\Î-ùþx¿Àþ4ð\î+Šx‹\Ì2|m_%\ÄU\ÆeØ¼²¬1øl.Vš¡Œ§N¤ ¨c°òUbœ”£~h4QE|1úpQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEù\Éÿ\0Xÿ\0“.ø…ÿ\0aÿ\0\éþÒ¿’.\ãý\å™¿­\ßø*\Çü™w\Ä/ûøGÿ\0Oö•ü‘ˆüû~9\é_\ëw\ÐSþMsÿ\0e\æmÿ\0ª^?\Â?\ÚAÿ\0)€ÿ\0³wÃŸú´\âú\ÖðŸü+ö+Ô¼-\á\ÍB÷\áw} \è÷—S7Œüt†[‹­:\Úy\å\Û‰#w\Ë#6\Ø\ÑPg\n \0ý_þ	oû\\iZ”ü/—G’k¨\ã\Õ\í¼k\ã_´inð8MFw\â)\í\Z[&\"\å\î	­Y£q—Fþ~l~1ÁDa±²‡Oñg\íLš|V¶ñ\Ø-´?²Ù¬(-E±Kr†\Ü@#òJ†=¥\Ò\rAª|Rÿ\0‚‡kZ}Þ•ªx£ö¬»\Óuk‹+û&O‰o{gw[\ÝZ]F*\Ïmq\Ð\È7e#\×\çñ|wú\ëªþ”J/­:¶qeYR§\íy\ÔV¦>4f\á=”Ú§+r\Ë\Ým?Ñ©ý\"þŒñË¡‡—Ð·/­‰Ž\n4]wÀ\ÜO\Ú\×T#jñ²o¬\Óö•“¯Mûxs{H^¢Wø\çY³‡N\Öu:\ÞVž\ßO\Õõ;y˜©i­\ìï§¶†V(KIJ\ìUB’\Ç\0+ú«ÿ\0‚DH\ïûøuY‰x÷\âq\î¡\ÖüÂ£þ#·ü\n¿šötý |K¡üø­¨\Þ\Í$I²?x™#®$G%\Õ\Ôúlv¶p´†¹»š\æi%UV#ú\Èý‚>ø£öxý™|ðóÆ©,koÄ¾ °·’)\ÓJ\Ô<I©M¨d½Õ¼\Ó[\ÝM§[´\Ó\Ïo#@ó$‚&tP\íõŸM\Þ(\áÊ¾\ä\Ü?G=\Êñ\Ù\Þ#‹²Œ],†\Äce…Àå™¼qX\éÐ¡Rs¥B3\ÄP¦\ê\ÍF¦\"8¶\åeóÿ\0³£„øžŸ\Ù\ïT\á\Ì\ß\Ãø^\Îð•³F‡Ë©bs\ß%–/Ž/J:ØŠ‘\Ãb\'NŒe*ŽžµYE*rk\á\Ûsþ\nañ£ögý üCð“Á~øa­\è\ZFƒ\á]V\ßQñE§‹&\Ö$Ÿ]\ÒRþ\ê9ŸIñF•e\åE+€GfŽ#Ç˜ò7\Í^\'\à?ø-\'\Ä\Ò|y}ñ#\á\ï\ÃÅ¿°ðü?ð€\é>·ñUœšÇŠ®®ü¤]j\ïVñ­\r¾ƒaj²]_há¾•Œö\Î¯$?*ÁZ\äõümÿ\0boÃ¿ýG\"­\ßø%Áo†~<ø®\ß\â…4¿\éžð#kšV‡®\ÛE¢Iª\\\ëZw\Ú5.\á^\×QX-¦”Á\ÜrÛ¬¬%h™•q†Y\á7™O\Ñ\Ï ñŠ¼?¡˜W\Ãð\rqsŠ\Ë*\â(\ç–*­¶­xS­<m*4§˜\â**š‹\Ù8a\ë×•\'\nŠ\ro\Ä>7ý#ó¿¥WxQÁ^(b²œ>3\Ä\Þ%\ál‡šR\Â\Ö\Érœq\Øü5	T£jõ!–\á`\ëa`\Õg*ô(ª‘©h\Ë\ÑOü¿ö‘\É\Ç\Ã?ø\É\Ætÿ\0\ç³c8\ê{žkôþ	\åû|üTý®¼}\ãÿ\0\nxÿ\0\Â¼=c\á?\Øx‚\Â\ãÁ\Ö\Þ$‚\î\â\î\ëXM=\á»:ßˆu˜Z\Ùab\ê!ŠD˜&B¿-}µÿ\0}û)ÿ\0Ñ¸|ÿ\0\Ãc\à\ßþS\×y\à/‚>\ß_j\r>|?ð£ªZ¥Ž¥}\á\è^»¾²ŠQ<v—w\ZU¬\×\é8,2»F$\Â\î\0\×ò·ø¡ôz\Ï8K;\ÊxCÁ\Zü3Ä˜\Ü5*yV}<m\Z‘Ë«\Ç†«R³„1\Õe.|=*\Ôt§-j\Þ\Ú]løm\à\×Ò§‡8ã‡³®9úB\áx·„òü]J¹\×Cˆ§<\×\r,-zP ªO/¥¸\â*Q­wR7öM_U/ý­¿jo	~\É_\â\'‰4«¿__j¶º†|-ayŸu®kI,\æ7¾ž+‘cagio5\Å\í\ê\ÙÞ¼_¸‰m™®—ñQÿ\0‚\Øþ\Ð^NúGÂŸƒÖš{J\æ\Ú\ßSÆ·÷±BX˜’{»O\é°O\"¡I#²·GpYbHQô\Çüù˜|8ø ­\ãŸ›nƒ§\í\È\ï·\'™>¦¿>\0xCEøñ\Ã\á/‚<I³ø\Å_</¡\ëVðLöò\Üi—ú¥¼7–\é<dI	žñc+\"+–•Â°þ‡ú4ø%\á6o\à\Êñ¸^—fU\êñ&3S_8ar\ì‹‹\ÃCÁR\Åá°¼ò§©^UjG\ÛU­]Ó•hÒ…8\Ãù3\éôñÃ‡þ8¿øŒñ)“å”¸[—\áò\ê8*_\\\Ì8‹+Ë±õq¹ž2¶‹«\æQ\ÃB”fð\Ô0\ØhT¥‡XŠ˜‰\Öý,ÿ\0‡\×þ\Ò_ôLþ\à¿\Ç\ßü\ÝQÿ\0¯ý¤¿\è™üÿ\0Á¿ùº¯\Ýk\Ø\ÏöN°²µ²‡ötø7,V–ñ[\Ç%\ï\Ã\ßj7’$H^\æúÿ\0M¸½»€Ì—S\Í<®K\É#1&¼\Ë\ã·\ìcû,^üø›ö_€ÿ\04\Û/ø£UÓµŸx;BðÞ·§j:N‰}¨\Ø]Y\êº5\ì&+«hŒ‘	¼›ˆ÷C<rD\ì§ó,¿Å¿¢Ž;1À\àŸ\Ñ\ïBŽ3†\ÂýfX¬<\åJŠô\èª\Ò\Ã\Ç6\\\Î\nJr¥\Zº\Ù\ÅOf~Íšøô\Û\Êò\\\Ç5I\ì¿_/\Ë1xù`£…\ÅÓ…j˜L,ñ\ÃC,‘ò©\Êœk\Ëm§*I{§\åGƒ?\à¶\ß­õ{fø‰ðsÀZ®‚\\-\ì~\n¿ñƒ«$d\í2\ÛM®\ê~%´–H”ùŸg’\Þ%¸+\åý¢\r\Þj@Ÿþ!øo\âÏ€<#ñ+\Â\Íq\áŸ\ZhV\Zþ-\Ì^EÈ´¾„I\ä\ÝC¹\Ä7V²ù–\×Qq\Ä2*»¨ƒ\å\ÎÑžN:ú\ãŒþ5ý‹ÿ\0Á7Ù›ö+ø¹™±\á½AF\âN|C¬Q\èpa\Å}?\ÓÁ?|?\á>\âž\È)ðö7\Äk%\ÇPÁbq“Ác0µò\Ì~6%…\Åb+Ó£ˆ\Ã\ÕÀ%\n˜uG\ÚS­R5\ÕW\Z.Ÿ\Æý~‘+ø™Ç¼WÁ~ qF#Š²\Ú<)[ˆòúùŽv„Í²¬Jt±x\\6µ\\&&†c\'<>\"UcJ­\ns\Ãûz\ê¯\Í?¶¿ü\Ù\Ç\â£ð‡\áÇ€\ì|e\ã]\×M¸ñ¹\â-F{\è÷\ZŒ	zšTZv˜\Ð\ê:­à²š¸ŸûSLŽ\Êwh7EK‚ü»ö’\Ïü“/\àgŒ\éþ>\é\Û?ñ\\œuõ¯Œo†fý±¿hÄœxúùFI8ol\0\ì\0\0€p+\îø$G\ìÿ\0ð‹\ã¥ñ‹\\ø¥\à}\Ço\áeð•ž‡§øš\ÆSJ²:‘\Õ\î/.³\îU\íg¸—\ìpEº\â)UcR¡~v\Ï\é´|%ð\Ã/ò8«\Ã\èñez|1\Âù¾mZ¦#[2\Ìs ŽWIª¯˜aðXJ\Å\æ1\å¥IR¥K\rùjÖ»©ø´¼wúLøÁôŽÍ¼2\à\ß\êpm<ÃŒ8«\"\Èð°¡„\Ã\ä¹FWÃ•3ŒD=·\Õò\ÌN7]\àrÉ©\â*ªØŒN*pŒ\êS£gK3þ_ûI\Ñ3øÿ\0‚ÿ\0óu_\nþ\Õµ?kxsÆž?\Ð|%\áýG\ÃX\Úø>\rblŸSº\ÕL\×+­jú\Å\Ã\\ù÷r(1\Ï^^\ß\ÝoËŸ\ë/þûöSÿ\0£pø#ÿ\0†\ÇÁ¿ü§¯\ç\ßþ\n\íð¿\á\ÇÂ¿?4†¾ðŸ€´½O\á„úž£§xGA\Ó|?e{¨jö‹ysk¥\Û\ÛA-È¶‚(\Íq*gj€<¯£\çˆþq\'‰™nUÀ~\Ö\à\Þ#«–\çp\Ù\ìñtkFŽ†s\Å\Ðp†2´¿\ÚhFT“TÝœµij¾£\éG\á\'\Ò[„¼!Í³¿üv\Ãq\ç	\Ð\Ír:X¾¥ƒ\ÄPž#ˆ\ÇÓ¥‚¯\Ï<\r\Û^QªÓ¨¯Ë¢z\'\Åÿ\0Á$ÿ\0\äô|\'ÿ\0bO¿ôÎ•ý!~\Ö¼Aðözøñw\Â\Úv«kþ	\Ñlµ-7N\×ã¾“Gºš\ç]\Òt·K\äÓ¯4û\æ`¿–D÷¶\í\æ¤{œ¦\åo\æ÷þ	\'ÿ\0\'£\á?û|}ÿ\0¦t¯\Þ\Ïø)ü™\'\íÿ\0b®•ÿ\0©†\ëóÏ¥_‚\Íþ”þ\ZeY–¼»3£\á\Þ_\ÂU\æöX¬7Œs6+S•\Æ\\•¨U©N|²Œ¹d\ì\Ó\Ôý_\ècšf\'Ð¿\Å\ì\ë)\ÅTÀ\æ™F/\Å,\Ó-\Æ\Ñ\åö\Ø<\ÃÀyN/Š¥\Ï\Ã\Úañ©Õ‡<eh.hµtÿ\0_þ_ûIª;Â²øò«7üƒ¼\Øÿ\0C\ÕI~\Ön|G\àÿ\0\nx†ò(!¼×¼5¡k7P\Û	´7:¦—i{<V\âg–Qr\Î\ë’G“\Ë½Ý²\Çø(›ýT¿õ\Íÿ\0ô_\Þ\Â\Ïù&??\ìCð‡þ£úusý3¼.ðÿ\0\ÃÌ·\Ã\ê\Ü\Â\Ùw\Õ\Í1üEK0ž\ëØªx<6Q,4jûzõ•¨Ê½iG•GZ’½ô·O\ìüñ“\Ä\ï3¨xƒ\Æ9§\ÑÉ²\Þ­–S\Ì~­Ëƒ«\ÅgP\ÅN—\Õðô]\ëG\rF2\ærV¦¬–§vz¡¯\ç§\ã¿ü\Ç\ãÿ\0\Âßþ\è>\ßhþñÏˆ|1¦^\ê¶>6“Sº²\Ò/äµ·žý\ìücgj\×RF¦6ö¶ð\ï\'dH¸ý‡\è•ÿ\0¶ü_\íÿ\0ewÆ¿úwž¾C\èm\á÷xÅ¼c\ã>ÀñÃ˜<^†;\Ûòañ2\Í)Q•Z~Æµ\Í*MÁó6¬ö¾§\Ü}?¼Rñ\Â\Þ\à\Ã\Ãþ(\Ìx_šq&gƒ\Ì+\åÿ\0W\ç\Åa¨å­J•O¬P¬¹aVó\\ª.\ïV\Ï\éƒþ	\ãû[xûö»ð\Äü@ð÷„<=\á?\Ûxr\Â\ßÁ\ÐkpZ\\YÍ¡X\ê5\Ú\ëzÎ³3\\‰\îž50\Í^R¨1\Ï\Ê\ßð[_ù#ÿ\0ÿ\0\ì£j_úŽ\ÉNÿ\0‚#\Éø\Ñÿ\0eR\Ãÿ\0P\í›ÿ\0µÿ\0’?ð{þ\Ê6¥ÿ\0¨\ì•\éð÷\ä\Ü-ô\ÝË²\Ë\èeY6WÅ“£€\Ëð\Þ\Ó\ØaiOƒjÖœ)ûIÔ¥V­I¾i\ËÞ›µ•‘óük\Äùÿ\0þ\ÎlwñFgˆ\Îsüß…òŒFe™â½Ÿ\Ö1u¡\â^]‡…J¾\Ê\éóF\ZT\×,\"¹`ºÝ¿\ç‹Àþ-\Ô<\ã?\nx\ãI‚\Ò\çTð‡ˆti\Ö÷\ë3YO{£_Cm\Ú\Û\Ë\ínòÀ«0†xe(N\É°\Ãú4ýƒ?\à£?j—üq\àß†ºo\à½kÄ‰}\á+_Aª\Í6óK·†}c\ÄÚµ§Ùo¤i@µ–T\Ù*Á¿Ÿ\ï€\ZN™¯|sø=¡\ëVš¦‘«üKðV›ªi·ðGuea{\â{»;»i•¢ž\Ú\â)¡‘Y$™XH¯\ì÷À\ß\0>|4\Õ\Û\Ä?>ü7ð>½%œ\Ús\ë>ðg‡ôQ¬\'xž{6¿\Ótûk¦¶™\à…\å„\Êc‘£B\êJ‚?xúiq?‡\ÙV‘ñO=\â\Ü\ï†s˜p§F´)Ç†\ê,NœªJ­	\Ô\æ¯(U´i\Ôø~Gó7\ìú\àÿ\03\Üó6Ï¸?\ép\Ïp\çp¥~9\á‰Ð©R|[ƒq\ÇÖŽ\ZH\á\êÂ›ŽŽ+\Ü\ê\ÑO\ë	\ßF×¯“šü>ýª?\à¯_~$øŸ\áÁ¿‡z‰®<¬\Ü\èzß‹üa¨_I£\ßj–$Ã¨Z\èú>‡s§Ü›k;\ÅhF¥>²\Âð#ùv0\r®ß·\ï÷O\áü\Å	\äø§ñ)Ý™\Ýü{\â\ÖwbY™Ž»|K1<’O$šþsúøSÁ~\'q/\Õ\ã\\¯ûk\ÃYVSW–\Õ\Äb°øJ˜¼\×Œ¦ñ•„¯‡©_\êô°…:&\èI\â%:”\å*tù­>Ÿž7x…\áð\Ã\Ü\ê|;‹\âüËˆ^g›\á°øJÙ„0™šT°xY\ã0ø˜a£Š­œ*µñ#Ol%:0«\Z5«Â§\êYÿ\0‚\×~\Ò}þ|÷ñðÿ\0\Ý\ê“þ_ûI\Ñ3øÿ\0‚ÿ\0óu^\Ûÿ\0ý›>üPøY\ã\ïüIøm\áxŠ\Û\ÇSxf\ÊO\é–\Þ Ó¬4›}I¿X\í4J;2;‡¹¼\ä¼6­vT¬k2Æ»kõ\ÓþûöSÿ\0£pø#ÿ\0†\ÇÁ¿ü§¯\Ñ<D\ã?¢ß‡¼iŸpf#ÀIæ˜®\ÅC‹\Æ\áñ°øjØ‡‡¡ˆŸ\Õ\áW4•WJ\n¬ §QS”¤¦ýœc\Ê\ß\åžp\'\Ó3ÅŸxw\Ä<\ÒNŽM€\âZœV/\Å\á«b±tpø|v\'\0ž*t2xQ…Z•0µg\ì\éJ´cM\Ã÷®M\Æ?„1ÿ\0Ákÿ\0hýÀ\Éð\Ç\à“GŸœGa\ã\År=›\Çª\Þ\åX{\Zý!ý‡ÿ\0\à¥:W\íQ\âÉ¾ø»Á	\àoˆq\è·ZÞ›q¥jO¨øoÄi¬­ªCi\ÜI¤^\ÚA,W\ÚOu©­\Ü	s\"\Ü\Â\ÐyR~Zÿ\0Á[¾	|.ø;ñw\áÌŸü¢ø\Z\Ó\Å\Þ½¿Ö´ZG¦h’\ß\éÚ¼–0^Z\é6\Â;\r>Gµ	\éc¼3²	¤§i$!ÿ\0‚]3/\í«ð³k2\î²ñ’¶\ÒF\å>\Ôò§T\àd~‡\Ä^øÇŸG\ì\Û\Ä\Þ\à8ðž)ð~w\Äy=Z8œ]v’SÆ¹\áñT\é\ãñe\n˜Œ¾­	ª°©\á\ê*\Ô\Õ\nüŽ—\ä|3\ã\ß\ÒC\ÃO¤\æI\áO\Zø—W0”8÷ \à\ìÿ\0W„¯•fXû—Rú\Æuò\Ì6;Š§†\Ìh\â!V‹¥R–\"œ¨JxŒ;¨ªÿ\0UŸ~\'øs\à¿\Ã_|Rñi¹ðV‰q­j)g›w:\Ä\ÑÁmgl„…7×“\ÛYÀ\\¬i$\ë$¬±£‘üÿ\0ø¯þmñ‚\ãV¹“À\ß~\é:‘…¥¯‹o<O¯\ê\ÂŠnot]_\ÃVFVûÌ±\é\áS;U\Ûn\ãû\'ûs|7ñÅ¿\Ù[\â÷€¼¥¶µ\â\ÍoC°mHŽx-\å\Ôf\Óu\í\'Tš\Òne†q%¥•Ç’H¢iU!Rd‘þ;|Wð\ß\â\ïdÒ¼e\à_xORV’1i\â\r\êúEÁt˜£¾´„Ê `ñ\îFR¬¬Tƒ_˜}|*ðx‰3.6\Ëò¼ÿ\0‰p¹óÀ\àòŒ\Ç3«M\á2xe¸M<m<«‹\ÃÊ²\Åb\ë\ã)<ejU£©û*¥(W\çý§\é\ï\ã\Þq	\å\\œ\ç)\ÂŽ†g‹\Îrì®ƒ£\Ïjæ™–®¾u‰Áb!©\à\è\àf²\ÚU\éJø¸\âq\êª\ØW\Õø}\í\'ÿ\0D\Ë\à‡þ¼~—Žhÿ\0‡\×þ\ÒôL¾\à·\âÿ\075\í\ß\nÿ\0n\ï\Ø\Âÿ\0<\á\ß~\Ëþ%°×´i¶\Z\Ô\Zg\ÂxŠÅµKkhá½ºƒ[\Õ<A§\ê:˜½ž6»{«\Û8.]\æe”1]\í\ß7ü7þ	Ø ³~Íž3UPY™¾|:@$“\â\Ì\0$ž\0¯´\Æpÿ\0\áq¸¼5¡6Š¥‡\ÅW¡KÖ‡&&\Z¾Îx{,Ez|µ£Ô³­Z’\ä«R.2™e\Üm\Ç\ØÜ¿Œ­ûBx#[ƒ\Â\âj\à\ê\á1j®¦\"*³\ÃUl·YT¡*Ž”\ãWB¢œ\Z*r¼\Ì:_ü—ö¾\Ôô\Û)>üX\ïu+I4\ïT¹¹Šd-\ãvPÁd%K+( ¬8?Ò¶Ÿp÷V6w2Y.-`\Õ3±ZX–F¸“´!rI\Æ2I¯ÅÁC\àšº–¥gÿ\0¯|,¿h…—WÖ¾ø8ZÙ²È¬—Nt_Z¿T…€5½œÒ‚„¬d…õ\ï\á\ß\ÄoüVð–•ã‡$\ÒüW\á-f&}7X\Òdv·“\Êm“[\Ë\ÑÁucwlÿ\0»¹°¾·¶½µ“÷s\Û\Ä\Øü\Ëô‚Ê°˜hp\Þ\'*ð=ðo	BY~/0XŒF;\Äb£‚–„qž\Ë\ê´ñ8a1²m\íªB¼\çrÓ“_\ÙE<ÿ\04\Çcx¿\ÄInñ\×[•\Ö\Ë2Ì¦¥,>?!\Ã\àç‹Žex:ªŽ.¾<v]Fxšt\'‡£R*s«\n•¡	vôQE4Ÿ\ÙÁ_–¿ðXù3»ÿ\0û)ÿ\0\ÐõjýJ¯\Ë_ø,ü™\Ýÿ\0ý”ÿ\0\èzµ~·\à\'üžŸ¿\ìµÈ¿õ2\à¿J?ùG¿\ìƒ\ÏõŸË¯ƒ?\äqð‡ý^ÿ\0\ÓÍ•y6ñ\åmÿ\0^\Ñ\è±_Á·ƒ?\äqð‡ý^ÿ\0\ÓÍ•y6ñ\ãmÿ\0^\Ñ\è±_\×´ý\ï\Â\ßû\ãý9\Ãgð\ìºþŒ\ßõóÿ\0ôž)?ÿ\0iø*÷Ç‚ÿ\0>\'ü+ðß€>jz‚<Ms¢i·úå—Œ\äÕ®­ Ž\'Yož\Ã\Åö6m;;½¤ð0\Ï\á¿ø-G\ÄEðW\ï|_ð\ç\á\ä¾9I4[_‡šW‡\àñU–+\Ï%\Ëkº—Šf\Ô<E©\ÜKgcn¶«ce¦\Íaqwq<›\î¢HF\ï\Î\ß\Û\ßþOö‚ÿ\0±þÿ\0ÿ\0D[W\Ú_ðHo?	~/ø·\âö¯ñCÀú\ÂZO…\à\Ðt\ßiöúÆ‹h\Ú\ìú\Ê\êRh÷\ÑÍ§\ÝÝ²X[¥¼\×vó5¨\ÖþTŽ^¿H\Î<)ð„|\nÉ¼D\â?\rðùƒÁp¯g›\Êj\â(f™ž7ý…Suª\ã©Q§KŽ\ÅFŒ“¦þ§[©Znüg ñ¿\é7ÇŸHl\ÇÂ¾ñs•K5\ãN9\È2§œQ\Â\×\Êr\Ìq¹\Ý*9mzó«—\å\Ø:•2\ÏvMf0r©8\ÅN¤Yÿ\0®ý¤³\Ç\Ã?þ\ßñ/ñöõ:¯LøQÿ\0«ñ\ÍÇŒt{Œ¿<\ro\à\Ëû\ë[-OYð4¾%°\Ôô{›˜\â›Y’\×X\Õ<Fš­¶Ÿ½\Ìú}¼v—W\Æ\Éop%Øö\×\í\Éûþ\Ìúo\ì\Ëñk\Å\Þø1\à?xŸ\Â»\×4oÁ\Þ°ðµ\å­õ”ð2¿°á±†ú\äŠX/¢¸‰‘ò:F\Éü§d\í\Ï|gô§\á\'ý¼{\áLó2É¼\'\\7õ,Â®GŠUq5\è\ã\èb\'‚\Ãb\ébòün2­vž&œ¡*‡-jrJ5)5\Ï\Ñã‰ŸK_£gd9x\Ù>(­Œ\Êð|O‚–\rB¾[‰Á¼\Ç–4À\æM\ï\â2\ìD*Ò§:°ž\Zt\ç\Zô\ê\ÉÆ—\î\Å?ø-o\áñž³iðwá—%ð=\äöšF¥\ã\ßøI/5\Íj\Ú	8õi-ôMwB¶\Ò\ã¿UY\áÓž;¹\ícq\×rÉ¸×ž/ü»ö‘\È\'\á—Á¹‚\éþ=\ÉÀ\'\Ç$\ÇBA\0\à\â¿Qÿ\0c¿\Øûöe¸ýš¾k:\çÁ?‡+×¼M\àm\Ä\Ú\î½\â\ß	\èþ&Õ¯õmkO†òòF½\Ö\ío® ·9X,­\äŠ\Î\Ý!71o\Ìø+\×À?„ŸüEð‡^ø_\àÀ’xº\ËÄ–:\î—\á}>\×F\Ðî¿±?³d±¼H±Š+k\Ü_Kó[\Å\Úc2«HŸð÷ô]\â¯høI‚ðg±´1Y\ÖO†\â\ßñ_^\Äp\í]LF#Éš\Ëc!—b*F¢Œ¿y*qt©BO\Ù~•\ât>™\á<v\Ì<}\Â\Õ\ÊóL\'gØŽ\É0¿Tž]„\âú˜9`ðø/k“\Ã\nãžg…¥<:•5\nQª\éÕª\éG\Û}\ïûÿ\0ÁO\ìÿ\0iOZ|$ø‡\à‹x\ëT±¾¼ðö­¡\ês\\øk\Ä\éñ5\ÕÖ”,u-ú†“~¶I%Í±mGTŽ÷Éž<Z2G\çý\×ûTüZ\×þ~\Ï>-ø_O\Ò5]Àú:®™§\ë\É{&u<š¶`Rù4\ë\ËÖˆEw#oynþb¦\\®\å?\Êÿ\0ü¥™mO€»I¼K«)\Çu>×²±À¯\é7þ\n)ÿ\0&OûAÿ\0Ø™kÿ\0©‡_—ø\é\á7ð?\Ò\Ãn\á\ì¡axkŠñ<‹\Ìò:˜œV\'¿´8º¾Q˜a¨OZ®*ž…\ÃGž‡·q¥*•UN›…:µý¼pñ#\ÄO¢\çŒU\ÅYôñüUÀøN7Ád¼E6\r˜ò\å\Ü\r†\Îò\ÜF)a\èR\ÃW\Æ`q¸©8b¥C\ÚV…:O\íª\Æu*~3\Ã\ëi?ú&_ÿ\0ð_\ãÿ\0þn©?\áõÿ\0´—ý?\ßø/ñ÷ÿ\07Uø\ç!!ŽF Ž\Ü\ZþÊ¾þ\É²þ¥ð¯á®¥¨þ\Ï¯õ\rGÀ^¿¿½½øq\á;«»»\Û\ÍO¸º¹¹¸¸\Ò\åši§žG’Y$‘Ý‹“_\Ñ>7ð\ï\Ñ\ÇÀücso°9\äx‡˜ahS\ËkÔ¡,<²\ê8J\Õ\'Y\â±ñREˆ‚‚…\Úq•ú\ËG^+úXý\"ó\'Ë²/±\Ü;>Áe\Ø\ÜM\\\ßKL3\ZøŠ\áE`²\é\Ê2¦ðÓ”\Ü\ìšiF\î\ç\ãü>¿ö’ÿ\0¢gð;ÿ\0þ>ÿ\0\æ\êº\rÿ\0Ám>5Áª\Ú\É\âÿ\0„?õMfS{iá«hZ¤°\Z\Ú\ê\Z®¹\â;H&?\Âò\éw;¡\Í~\Êx\ïö\'ý”5\Ïx—Ko€?\nôƒu£j+§\á\ßø{@Ö¬&’˜nô\íWJ\Ó\ío-nm\ä,L’\ì. J’FYñ™Z\ß\ß\Ú\ÆX\Çk}yks—1\Û\Ü\Ë\n \0Xª\Ç\'\'¥rø+}\Z|v\Âñ,2Ÿ©d5r—\Ò\Å\Ã‰\Ä)Õ¥š\Ã°õp˜¼»4UiÔ„°\ãQ~\êtß³9Ë™û=¾\ÜQôºú7f<\'O=ñ\ë\ÄTø––?€¯•\á\è(Q­“VÁ,Mv2\Ê:”ä±¸iA^½*ñu©Ö§\Å{O\î;\à7ÆŸ\n~\Ð\n¼\'ñcÁŸi‹FñM“\Ìl/•ÿ\0I\Ôm&’\ÏU\Ò/|¦hš\ãN¿†{v–1Nˆ“ U*ü‘ût~\ßú7\ì€\Þð¶™\àöñ¿\ÄO\é7zÎcu¨fhZ.•Ì–jz¼\Ð\Ãqyxn/¡št\Ë_±\É\"C$\Í’cÁ$I?±gƒ³“|E<\à\ÂSyÀöö¯ÉŸø,ƒ»~\ÕzB³³,<<±«1+mGVv\n\Éf\0±$òM4ø[\àÿ\0gŸI\Î&ð\ß7\Ãbs\áŒ×Œý†®/J®3‘ce…Ë°Ø¼^\Ztq2„=­\Z•\åN­9\â=‡$\å\ÉV¢\×~6øû\â}x\Å,“†\Ëx\ãò\Î¡‹\Íð¸,4©\à1<A”T\Ìó\\fŒ¥Š\ÂÓ©Y`\ëP¢¥Nk	õ§[\ãR)G«“þ]ûG\ïc\Ã‚K~A-@½ƒºx\Þ4fõeD²Ž•ü>¿ö’ÿ\0¢gð;ÿ\0þ>ÿ\0\æ\ê¼þ	ðw\á\çÆ¯\Úf/üMðí§Šü9£x#\Ä%‹B\ÔL­¦]\ê–7zM­›\ê6ñ¼k{m\n^\Î\æ\Î}ö\Ó9O>9\×ô¸?c\ß\ÙHqÿ\0\ãðG_†>?©\Ñò\Zý¿\Æ\Ç\è\Ã\à\ïS\àü\ÃÀ\Ø\çxõ•\àóJØŒ\ruCN–6u£B”eŠ\Í=µZ¼¸iN«t\áó\Å)NN\\¿\ÏeLOø+\ÆùG\Ò)ðþYG;\Å\äT°Ù\â±\Õq>ˆ­8\árcJ“X\ê1¥jõgQÆ£œi\Ú*ƒ\ßðú\ï\ÚHôøgð;ÿ\0þ>ÿ\0\æ\ê½\ï\à_üR×¼a¡øk\ão\ÂýI\ÑõýV\ÃJ>+ð.¡©A‚÷\Ó-¬wš†‰¯\Ýjb—\Ân^\rb\Æ[Ko6\ác»x\ÄzOüöaø\àÙŽ÷\Ç^øM\àø«\Ãþ,ð\Üz¯ƒ<=¦xbI­u{¶³¾´\Ôc\Ñ\í­!\Ô`xÂ¼Ky\Ím*·h‹Ë¿ù··$\\[‘Á\ÂA¿z•÷¾\Zxcôtñß€q\ÙþK\ár\áh¼~a‘¹,f*†g\ÇapøZ\Ð\Æaq8,Ê¥\Z°<f\Z¬#^”\êF¥F\Z­û\Ï\Êü`ñ“\é[ôoñ?\Â\Ù÷Œ•8·ƒË²¾ ŠŽ	_&\ÌpùW§,;Ê©Ô„¥<&*…GJN¥:nž\'\r‰¥]\Ç\Øÿ\0y¾,\Ö\æ\Ðü#\â?i\â\Þ\æ}#\Ã\ÚÆ³f³{K‰tý2\æú\Ýe0º;\Û\Ìð *Dv‰Ž\ÇRC\æ\åÿ\0àµŸ´’»¨øeð@…wPN\ãì¬Tc8û\×ô­1oz³1%Â«òI\ä’|)$ž\äžI5ü3\Éþ¶_ú\ë/þ†\Õøo\Ð\Û\Â\Þ\ã\ì?ˆ\ß\ë¯\å\ÜIS&\Çðõº¦=b\ÃCO9x•IP¯I%^Xj2š—7À­n¿\Ñ\ßOo|Pð\ß1ðø\Åù§	\Ð\â.Ï±ù¦-xgMz5òO«J£\Äa«Iº\ÅV„\\SS“j\çî‡‰?à´Ÿlü\à6ð\ï\Ã\ï‡Wÿ\0uu{\Ï\È|VžÑ£]FXt-7F²\Ä1j“\ßO§$wÚ\åÆµ<\É/\Ùc´R¥\ë\Í\áõÿ\0´—ý?\ßø/ñ÷ÿ\07Uö\ßü3öVýžü]û-x[Çž7øK\à_x¯Åš·‰f\Õ5xwMñ4\É—¯_\év6¶\ëP^Á§[\Åkn›\Ò\Â;qq!2\Üy²a‡\è7ü1÷\ì§ÿ\0F\áðGÿ\0\rƒùOXq/ýx‰¸—„jø\Î\ë\äCeØœÊ¶>Œc[‡Ì±\ÄS\ÂÓže\ÍK/\ÃVŒ°¹}9F3X*4]XûiTo¯<9úhx™ÁÇ´>’YvG…\âžÈ³l[º¼ªQÁbr\Ü3\ÂU\ÆN–R©\Ï2\Å\á\Õ<fg(sA\ã\ë\â}œ\çO‘¼O\Ø\Çã§‰ÿ\0hÿ\0\ÙûÁ\ßüa¥\è:6½\â+Aw§xj=F-\Z\Ò5\Ûý.¶T¿\Ô\ïCI\rª<\Þm\ä \Ê[`D\Â\æGþ\nAÿ\0\'£ñ·þ\ÂúGþ˜4\Úþ¼<!\à¿ü?Ð­</\ào\è^ðÝœ\Ø\èÒ¬t]Ñ®§’\ê\å\í´\í:{XZ\â\âY&™£‰L’»;å˜“ü‡ÿ\0ÁH?\äô~6ÿ\0\Ø_Hÿ\0\Ó›]ŸC<nS™x\í\âa\å%\Èñ\Ü5Ÿ\âò|¢RUW–b8§%«À9\ÆSRxL4©\ÐrS’|—R{žO\Óÿ\0,\â—\è\ç\à\ÞQÅ™\Ìx‹‰²\Î\'\Ê09þ}JœsŒ\ß\r\Â\Å,~eJ\å\ã11©]EÓƒJvq‹\Ñr¿²—\í“ñöA\Ô|c©|?ð\ç‚üC/¬ô›-N/[\ë“\Ãm5\Üö\ÒXZÑdv½•e3¼\ë´.\ÅC’¨¿Ø“\ã÷Š¿i\Ùÿ\0ÃŸ¼g¤øD×µ_\Ä\ÚuÆŸ\áˆõ(´ˆ¢\Ñ5«6\Ù\áV\ÔuKÁ,‘B¯9{\ÇS!;?\à\ß	>|Uñ\'\Æ\è~&|<ðg\áÑ´É¤\Ã\ãi>\"‹M–ö÷[K©,¢\Õmn£¶’\á ‰ex•Y\Ö4HQ_Ñ·ƒ|\r\àß‡z¿†<\áoø7\Ãv’\\Mk øcH°\Ðô{y¯\'{›¹¡Ó´\Ø-­c–\æwyg‘\"\r,Œ]\ÉbMy¿Lþ&\àG\ç/\à¹\á|CÀ\æ|9Œ\Íø\ÝÕ¦\á˜\åR\á¨NžZ¨ªÎ¤\\)bò\Ú|Î„Sú‹÷½\å\Íô?³ÛƒüP\Ãð^G\Æx\Þ>¥Šð¯€\âÜ¿(ðõQ©\ír\Ü\îP\áW6•w‡T\ÜjVÁ\æ•#ˆ“__W†—™ø\Ù\ã}O\á¯\Â/‰4k[\Ý[Ážñ‰4\ë=MnNº¼\Ò4Ë›\Ûx/V\Ò{k¦¶’H•f÷\ÊP’#a‡ó¾¿ð[\ÚM•Oü+‚€\äñ¸\Ïý5ý|gø«ðû\à·\ÃüCøŸ‡ƒ´K<jJö\ÂúmE¯Z[\é:qÿ\0\î¥4\Ëm\rŸ\á\ÞI\Þ+h¦–?\É;\ïø*ÿ\0\ìY\Ë\Çað#\Å÷–¨%\Äþð\rœŽqó\æ\ÜkwaHùžK/\ÌUOð?Gì––?%Ï«â¾Ž¸ÿ\0!,ÖŒ0ù\Ý,\Í\åXl©\Ñ\ÂQuò\ÈÕ«BT+Ö“«GR0«\í)Â­7(%8·úgÒ›‰1yWðýÒ§,ð&Q\Èù±\\5[&©\ã3W[ŠöÌ©aj<FŒ£N¦­Òœ°²\ä¨\ä\Ú_\'\Ã\ëÿ\0i?ú&_?ð[ñÿ\0›š?\áõÿ\0´Ÿý/‚ø.ñøþ~9¯³aÿ\0‚—~Í—\Åqoû(üPž	\Ñe†x~øZXf\ÆRH¤I\Ù$F«£a\È&¼—\ã\Ç\íÁû0üXøM\ã\ß~\Éÿ\0\íg\Õ|=ª¦«\\ü;\Ðt¥\Ðu\Ñe1\Òuµ\Ô\ì\ævO½\Ï<ð2±µY¡}\ÑH\è\ß\Ðyoð¦+2À\á1ÿ\0B\ê¹~Œ\Ã\áñx\Øñ†]Šž\n…J´©\Õ\ÄýU\Õ\Ã{w‡‹uoEÏ’PS‹iŸ\Éù·qž)\Ìq\Ù_\Óÿ\0š\ãð\ØN+—O‚3¼\r<\ÃF„ª\Ñ\Â}u`±k±3Š¥\Z\ï\rZ0rŒ¥Û€ðGü\Û\â„\ZÕ©ø‘ð{ÀzŸ‡šEK\åðE\ïˆtMbY‚¼ö¯¯jž#´¸’&AjðÛ‹‚¢/µA¿\Í_\è+\á\ïŽü;ñ?Áø…\á+©/|5\ãOñ‹s4/o4–\Zº\\D³Àü\Ãq\ã\r\ÄYp“F\ê®\ê\Ûø6\\\í\\NÑ’:ŽHö\'šþ\Îÿ\0`?ù3?\Ù\Ûþ\ÉÆ—ÿ\0£\î\ë\å>˜\Þxu\á\ï\rð·ðVCO‡±˜\î ©“cðø,N.x^¦[‹\ÆÓ«,6*½x\Ñ\ÄP©ƒ\å„ð\Þ\ÅT§^¢¯\Z®4?\Ò~€ŸH¼P\ã5\á/8¢¿e\Ø‡\åøŒ\Ç\r„Ža‚\ÆSÍ°uJ4qxZi\ÔÁ\â(\ã\\\êPÄª\êZ¥†t±¯ò\Ï\í¿ÿ\07¶ý˜üs7\ÂOø\Û\Æ^=²\Ót\ÝO\\\Ôõûù\í<5¡&«\ÞXØ‹=?f¡«_Obñ\ÜJRÿ\0M†\ËÌŽ6ûK³ˆ¿=ü»ö’\É\Ç\Ã/\àd\ã:³Ž\Ùÿ\0Š\ä\ã©\îy¯–?\à¤L\Íûhük,\Ì\Äjº2Äœ*øM\n£=G\n\0tô\çü3\àO\ÂoŒ¾5ø¹{ñOÁ\ZŽ“\ÂZ…[AÓ¼GjºŽ“i>­ª­\íÌšdå¬®\çt±·Ž6»†e…A\Z6Lþ•xK\àG‡~\0d\Þ%qg‡ñ\â\ÌD8O†s\ì\æµLF*¶c\Çñ\Ë)òa¡[0\Ã`°˜zx¼Êœ#J’¥\nXjr›U«ó:¿ˆf~<}%<WúK\ç^ðW‰\Õx2†7øŸ†r*£„¡“\åyo\r\Ö\Í\ê)be†Ê±X\Ü^&X,®´\ç^¬j\Ö\Ä\â§\nr©C\É\ì-\Ã\ëÿ\0i/ú&¿ð_\ã\ïþn«\á\ÏÚ«ö·ñ÷\íw\âø«\Çú„<=}\á=\n\ã@°¶ðt\Z\Ôs\Ú\Ý_Ë¨\É5\Ú\ëZÆ³;\\ùÒ²)†h£òÂƒl±þ±?á¿e?ú7‚?øl|ÿ\0\Êzüÿ\0‚½|+økð«\â§\Â];á§€¼#\à?Vð«}©\ØøC\Ãú_‡¬\ï\ï!ñÍ¼WWV\ÚUµ¬3\Ü$\0D²ÈŒ\â0 \nòü\0ñ\'Àn#ñ;\'\ÊxÁ\Ê\ÜÄ•ðY\Äð™\ìñtkG\rF†[^®.“„1µ¤þ³†„\è/Ý»9\ßM\×\Ò}(|$úKð—ƒù\Îw\â_Žøn;\á:žEKÃ”°XŠ3\Ä\âq\nX\Z\ê¥L\r¯ªbe\n\í{E~F’z_\É\à•òzÿ\0\ì]ñ\Ïþ£\×ýU|Høá¿…^ñ_\Ä_]½—†¼¢\Þëš¼ð\Å\ç\\}–\Î\"\âX šò\îS¥œM$I%\Ôð£\Ë\Z1uþU\à•òzÿ\0\ì]ñ\Ïþ£\×ýÁE\ä\Ê?hOûm¿õ#\Ð\ëó¥¾O‡\â/¤‡\Ü?ŒZXL÷*\àœ›RƒQ¯6gÅ¹®:2’”cV4«\ÍÓ”£%¨·%gú¿\Ð[=\Æð¿\Ñ;\Å\Î&Ë£By‡\ç|{ž\à!Š„ªa¥\Ê8%\Ì0±\ÄS…JS©BUððUa\n´\å*nQH6¤¿%<gÿ\0¶ø©q¬\Ü?Ã¯ƒ¾\0\Òü<­œ^5½ñ»¬I$	®gÐµo\r\Ù\Ã$«‡6ñ\ÛJ $\Çö‰ö‰ÿ\0®ý¤¿\è™üÿ\0Á¿ùº¯\ÇG$#\Ô+õ\0šþÁ¿g¿Ø›öX\Ò>|6û_Á‡~)\ÔuOxk[\Õu\ßøSEñF·¨jZ¶e}{<ú†³gy:#\\N\æ+h\Z+hSK\É?²ø\ÉÂŸFŸ²^\Äf\Þ\Ó\Ï\çb±8\r,.\'Wl¾\nØœF7˜\æ¼ò•«QQþ5J³œ\ÛpŒn~\à\Zý.þ’|C\Äø,‡\ÇJ\Ü;‹	C5Ì±9†O¥™bjQ\Â\árü¿+\É\Ü!*U\ä\ãaCNšŒTœ¡òþ_ûI\Ñ3øÿ\0‚ÿ\0óuZZ_ü\Ë\ã\ìW>·ðŸ\áîž²\Æn-ô•ñž›{$ þõ!¼½ñ>­22\ãË‘\ì§Da–Á\Å~\åOûþ\Ê3C4/û8ü	,RD\Æ/†\Þ‚P²!V1O•ð\È%%†Hå°ñº¸?\ß\ÚoÁ\Z\Ã_\Ú\ãO€<)o-§†¼ñÄº‡k4\Ïq-¶›ez\ÉmNÿ\0<¾RŠ\ÍóU¥xž\ná¾Œ¾8\æY\îG–x)O!\ÅeeÆ¤ñØš“…|-lL0sö5ð9§¶£^•Y\Ñk\ÝWŒ\å(ÔŒ¡gôH|G\Ó\è\ë“ð\îý «q>\Íket\ÖUF+\áq˜|7×©ª\Ô1\ÙJ§[Z•:É¸\Ôv•?gR”¡U3ú\àý’?jŸ~\Ö\ß›\Çþ\Ò\ï¼;¨\éz¬\ÚŠü/¨N·³\è:\ÌPCvÃ©Com§cweqÕ\ê\Û\Ú\È\ê\ïÖIˆý¶m/þ\Ç^ð\æ©uá›\Zx¯Æ—\×ö\Zð\ì\Z”:U²¦™m\×ú®«|\Ö÷³Cej\×V‰Ù´—ò<¥Í¯”Ò‡¿\àˆ_òJ¾9ÿ\0\ÙG\Ðõ†«ÿ\0Áa?gß‹¿\ág\Ä/‡žÖ¼o¢øKO×´_i\Þ\Z³¸\Õõ½.]B\ê\Öö\ÏRþÅ³Io\î\ì&Hå·–\æ\Æ\Þ\ã\ìm\ë\ß\"!wþt¡\áo‡Ò³\á®yY`¼?\Â\çxˆÂ†c›U\Â)Â§,\ã/\É\êfÓ¯GT\ÌkQÁR©,R\Æb)F\"xš\Þ\Ò_\Õy‡>.fB\\·Å¾¥<\Ç\Ä\ì~Iƒú\Æ?)É¨b\ç‡T¸¦y&gŸ\Ó\Éc†\Åa%VžY†«Œ\Ä\Â?©aªÔ­‹††‚¥O\åËø-\íeskð¿\à´Vû‰.m<u<\ê¤ð$š/\ÛF\ä\r\Ë`õ\Ú3Šƒþ_ûIÿ\0\Ñ2ø!ÿ\0‚ßˆü\Ü\×\çgÀ\Ý[CøSñ³Àž)ø·ð\ÛTñg„|1¯%ßŠ|¨h…ç¾´6\×®ý/V†;[©l®%†þ++\ß.™mR)$Œ7˜¿¸ðð\Ïø\'wý_?ð\Æü:ÿ\0æ®¿­¼Cð\Û\Ã\r\Ì2\ì\r}\êø‰ƒ\Æ`.¦m\æ>\Ï…­\í\åE`ªª\Ø\Êõ\ç_\ÙS§‰u%R:ðT\çVjª§ü%\áo.ñ\æYšbøŸé–øaŽ\Ës§“ñ^\ÏŽ ðôªý~Œðù|h{Vup²§\í%ˆ…juiÓ…J«ò—ü>¿ö“ÿ\0¢eðCÿ\0¿?ù¹¯°¿aø)O\Æ_Úƒ\ã\í‡ÂŸx+áž…¡]øS\Ä\Úó\ßøZ\ÏÅj\Ëu¢\Åi%´HúÇ‰õ[?\"Sp\âp\ÖfBùrFAÝ‹/üOþ	\Ï‡Ÿöqñ|(HP\Ó|øq\Z–=\çñjŒŸL×´|ý¿?\àžz¿‹m\Ã:FŸðwÄ—at½;Xñ7Ã­#Â‹9\Ôe†±mÃ’k6š|36Ï´Kª^\Øi\ê±nž\áB©?Šñ¶A’\Ö\á!¥”ý\r¸§‡³*ùN2†_\Ä+V\Ì^M‹©C–Žcõ\\$+Uª°s\å­%5\Ë)5Wô/‡<eÄ¸~;\á,N{ôó\à>(\É(g¸\nù§Tq\Ë\égx\Z5\á<VVñ\Ø\Ê8|.\ZXºJTc:\Õ\é§)F1—4¢\Õú)‘K\Ñ\Ç42$±J‰$R\Æ\ë$rG\"‡I#t%Heu%YHe$iõüªÑ¦š\èÕšõ]þ©¦¤”¢\ÓM&šwM=SMh\ÓZ¦·\n(¢…Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@œŸðUù2\ïˆ_öðþŸ\í+ù\"\î?\Þ_ýW÷eñW\á?€þ6x+Rø{ñ+COxGW’\Ò[ý)¯5\r?Î–\Æ\æ+»G[½2\ê\ÊöŠx‘ó\ÂnVÊ’ÈŸð\ë\ÏØþˆ\èÿ\0\Â\×\Ç\ßü\Ó\×÷Ñ·\é3À\Þð.a\ÂüK”q^;Š\âlvsN¾Iƒ\Ê1E…\ÅeùV”ñ\Ù\Ö]YWLiN*ƒ‚ƒƒI6\ãóC\éqô;ñK\Ço°¼kÁ™·`²š<\'”\äu(ñmž`1ÿ\0\\À\ã³\\EYÂŽ]\ÃY½	a\åKG\Ù\Ôx¨\ÔsHÊŒRŒ§ö§?\á	ð€Ú¸ðø(\à\r&\Ïº½‹ý\Õÿ\0¾GøUkm2\Æ\ÓN³ŒCicm¬!™„V\Ö\Ñ$DÙ„qFˆÙ±–bI5n¿ˆ+\Ê«Ö¬¡eVµJ©IG™)\Í\Í)Z\ë™]^Í«­\Üÿ\0Hðg…À\à°\ÕL>\rBn\nñs£F\ä\â\Üb\Ü\\¡x·Úµ\Òz\rÚ£¢¨ü:Š+$’\Ù%\è­ù›h•‘ü—ÿ\0ÁZ\äõümÿ\0boÃ¿ýG\"¯oÿ\0‚)\É{ø¥ÿ\0dºýIô\êý«ø·û\r~\Ìüm}ñ\âwÃ‘\â?\ê6zvŸyªÿ\0\ÂK\â\Í3Í´\Òm…¥„_d\Òu\Ë+$ò-\ÕcÞ–\êòct…˜“[¿¿cÿ\0\Ùóöv\×uoü\"ð\ZøWZ\Öô´Ñµ+\ß\í\ïj\í>š—QÞ‹u‹[\Õõ!ÿ\0HŠ72C\ZJv\í.S*º3¤\ï\ãþŽ”¼\"£“ñdxŽ‘ð\Ó\Æ\ÔÁ\å&úöZ²\å^ª\ÄG;ž7\ê²ú¥Oe?¨{Y^\Ôawoó;\'úx§úW\ÖñÂ¾mÀ¯ƒ\êx“žq|pt³|ò|Cý™˜b1Õ°\Ô^\\3O/X\ä±4\ãZ—ö³¡§É‰¨”yþ™¢Š+ø`ÿ\0LO\Åoø-‡†5K\à\ÇÂŸZZ¼\ÚG…þ _\Û\ë	‚,\Û\Ä\Z2Á§<«\Â)fÓ§ˆ\È\Ôs\Z±E\Ïó¿ðûÆº¯ÃøC\â‡¬ú¿ƒ<E¤ø“M†õ\ZK9\îô›È®\â†\å#x\äh%1ùrùrG V%$G‡÷a\â\è>,\Ñ\ïü=\â}KñƒªÀÖº–­X[jzeý³\ãt–7‘Mmq ’\Æ\ë2¯Šuoø&‡\ìU¬\ê\Z\ÇÁM6\Ö[—.ði>!ñva\';mô\í/^´±¶A’Aj\0\0?¹üúSð‡>/ø×†3\ì\Ë‡\Äg\Ã’G.\Å\Ó\Æ`3¬E\\V#	Ž\Â\ãó±Ò”*b±Tý¥\ZÕ£V„©\ÅÂœ\á\'?ó3\éCô(ñ\Å1)xu\Å|1\Ä\æt27ŒÀq.+6\Ê\ê\å¸ü‹†Ë°ø¬·•\äùÒ¯N¥¿³­GRŽ%\×j¥Jnœaùb¿ð[ŸŠAT7Á?–\n¡Š\ëšú©l\r\ÅT»•RsµK1\0±\Æk•ñ\çüWâ¿Œü\âŸÁð“ÀzCxŸAÕ¼?&§ý¥¯^½•¶³aq§]\\Aln-\Ñ\îc‚\å\Ú\Ü\È\í\Ê¤ŠU\ë7ü:óö#ÿ\0¢8?ðµñ÷ÿ\04ôÃ¯?b?ú#ƒÿ\0_óOZa¼Rúa11T<\ãV\ÃV¥ˆ£\'\n5#\n´g\n”\ä\é\Ô\ã\éÓšŒ\árN„¬Ô£(»>Wÿ\0´?…\Ä`±^;ð5L6/Wˆ§ý·™AÔ¡^Ÿ²«z~B¤y\é\Îqr„\ã5v\ã$\ì\×ò0 z§©÷úŸoÂ¿³O\Ø\ÃZ¿…?cÏZF¹gq§\êGÁ‘\ê2\Ø\ÝÁ%µÕ¼ZÆ¡ªY¬ð\ÊH\Ý\ì\î\í\å\Ã*²@\ÍC\àø\'\Ï\ìðûW·\×4‚~\Z›R´™.m&ñú·‹bµ¹Œ£Eqok\â}CWµŠx]HeHC\Ã ó#*\äµ}”ª¨ªŠ¡U@UU\0\0\0À\0\0\0\è\0À¯›úL}%²ò<‹†¸g \Îr\ì[œ<\ïŽ\ÏŽ*µx`±8\Z\\>Š\ÇÓ…%n\"­Z\Ó\Æs9F”!E.y}ô=ú ño€\\M\Ä<g\ÆüCÃ¹Žišd2\á\ìW\ÃU3,f‡¯˜`³V3\ÌpMIUr\Ëðôh\á\é\à%Õœ«¦£üsÁF¼/¬xWö\Êø\Ó±l\Öÿ\0\Ûúí·Š4§?\ê\îôsOµ¹³¸‰þ\ë\ã\ç†P¤˜§ŠHŸk©QOö=ýµ¼oûj3Ÿ\Ã\Ð<]¦ø\Þ\ßKMKM\×\'¿´kk½®Í•\å•Õ„\ÈT²^\Í\ÌSE2ÈžYŒ\Ä\ÊKX_ÿ\0g¿‚ÿ\0l¢²ø¯ð\ç\Ã>36°\Éoa¨jv52˜<±\éšå·“«\é\É#\r\Ò-\ä*\Íó[|\Çÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=~•ý-|(\Í|.\Ê<<ñ;8›5£ƒ\Èò\\4\Ãe\ËqY^e’–le:\Õs¼›…œ\ê\à¨b½Œ\"\åBª\äŽ&¬W4¿â ¯Ž¹ŒÏ‰~øƒÁ¹d±\\EžqI˜g8\ì\ã,\Ï2‰g\Õñ³\Ä`j\Ð\Âð\Æ}€ÅªXl\Ãƒx—R1\ÅRnr\ÂÐ”ù#ù‹ÿ\0ºø£ÿ\0DKÀŸø=\×ÿ\0Æ¿=k\ß\Ú\Ï\Äµ\ïü1\ã_xSFð•Ç…ü0þµ±\Ñn¯nà¸¶“U»Õ\Ä\Ò^³H&Ý¼xM©°·9¯\éþyûÿ\0\ÑøZøûÿ\0šz?\á×Ÿ±ýÁÿ\0…¯¿ù§¬xG\ÇÏ¢w\çTx‹„¼*\ãl›:\Ã\Ñ\Äa\è\ã\éQÁb*S£‹¥\ì1P\Æq\Æ&\ïi7	7M\É+ò´\ìÍ¸\Û\è¿ô\êñ ¯\Âüm\ã‡¼Abk\á±8Œ³žfô\èU¯ƒ©\Z\Øj’–\Ãl=kÑª½¤R¨¢\åtÕ’ü6ÿ\0‚Iÿ\0\É\èøOþÄŸ\é+úý¿ü?«x£ö8øû£h–7:Ž¥/‚~\Û¤O4òC£\ëZF³|\É\ZfXi÷W#‰\ÈV‡\Â?\Øwöeø\ãK_ˆ_þ¯‡<]ec¦\Ûj§\Ä~+\Õ|«=R!ôB\ÓW\×/¬Éž³\Ìh‘õ”\ç?Y2«©V\0«FA¨ ðAx x¯\Âüjñ¿%\ã¿øW\Ä\Þ\ÊóJ8^\Ãð¼\é\àsúxL&#Ž\á\ìóœ8?\ìüngNj\ê­\ZJ¯µuö\Ø\Ú1sþŸú;}8§\Ão£ÿ\0ø?\Ç®Gý£\Æ8¾1¦ó.\Äc³\\/\âŽÀdP­ÿ\0\nyvIZ®/\r:Š\Ò\ÃûÑ”U$±7œýŸðòº‘Ù”‚;\àŒŽÇžõû%\à?ø,·\Å\ßx/\Âþ¿øU\ào\\øoD\Ót3­I¨k:|ºŒ:]¤6V\×3\Ù\Û\ÈðCpð@ž’V\'“.±¦\â£ö{\ÇðO¿\Øÿ\0\â©.±¯üð½¾¡q4—SxrMS\Â+uq3´“\\]A\á}CH·žy]\Ë\É,±3»’\ÌÄ’Oÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=FñÒ£\è\ë\âf_•aüCðÏŒ³ye•j\âp¸gK+<\'S\Äý_…âœ«ZXS¦§\í(ÓOgNR¢§[ù‚¾…?K	3\\\ã\ágŠ¼‘\Ó\Íi\Ñ\Âbñ”ó|ûW2\ÂaªJ®\ë™v#‚3|5*”gR«¦\á^´\é*•c\nüµf¥ù7ü\×\â\Üñ´6_|—r”Kbú·ˆn”\Ê\Ò Tkx\æ†I¼\Þb\Ç4r\ãc†\Å~Fü_\Ö<a\âŠ^?ñ\Ä8ô\ï\ë¾)\ÕuŸXE\ZEž¯ªNo®-\âŠ7•#Ž!:\" ‘\Ù@\Ø\È\×õ¥\á?ø\'\'\ìs\à¯h\Þ,\Ð~\é\ë­x~þ\ßT\Ò\äÔµÿ\0\ëvp_\Ú8–\Ö\âM3X\×/´Û—·™RxEÍ¬\Ë\Ñ\Ç\"®\äŸ\ãø\'O\ìƒ\ã\ßxƒÆ¾)øRº‰<Sª\Ý\ëz\åúø³Æ¶bóR¾\Ëup-l¼Eoio\æHIò­\àŠèˆ£Šóx\é1ôqð\ß:\Æb8#\Â\Þ*\È0Y–V¨f8ú4°¬\×Š¥Š£<.R\Çqf&•¾¬V«8b½¥lL¨G\ØF4}¤ýO~‡K\ß²,ü]\à¾(Ì²œ\ÚU2¼¯œg42\\\n¾Q\Æc\Þ#À\Øzµ³Jµ\ã‡\ÃÒ£,³£……yýrr®¨Sø³þÿ\0$g\ãGý•KýC´z\è¿\à´~\Ö5\ÙûÀ~%°¶’\ãMðŸ\Äh[Zx‘­-õ­\"ò\Ê\Ö\êP ùv\Ëu\n\Ã,\Ìi$ð+02(?¤??go„_³ž‹­x{\àÿ\0…G…4ê©­\êö¿\Ú\ÚÖ®nµ(\ì\à°K;[\Ôu¡\Ûko~T.‘»\Êo%¬\ëz\âM&ÿ\0Bñ•§kš.©m%ž¥¤\ê\ÖVú†›k0\Û-µ\å•\Ür\Û\ÜÀ\ã\ïE4n‡# WóŽi\ã>_¤MO\ZrL«[+‡\ásj9NdðøLÂ¶	e42œn¬°Õ±øjŠ”~²ðó\\D#7JSûQ_\×ùG\Ñ\ë8\Å}pÿ\0G\Î$\Íò\Ü{.«•W\Î2‰b³ª†gCˆjq[^”±X\\·‰Á\ÇK\\e…\ÃU•?¬B’¿$\ßðƒ\à¯\ê>ñ…|m£¥¼º¯„<E£x—NŠ\í]\í%½\Ñ5}F\Þ¤ã‘­\å’\Ýc˜G$rÙ¶:6~\Í\Ùÿ\0Ám~(I5œ3|ð!ó&¶Šf‹\\×“>cÆ“4A\ÞM™\ËÃ´›x\Ü_Ÿ\Ôýwþ	±ûø†þ]F\ï\à–g4­#´:³\âØ©‘ÌŒ#Ó´Mj\Â\Æ%\ÄF±ÛªÆ˜¢…¬¨¿\à˜±,2\Å2|]ðÈ’¦\ïøñ\×|lw#x˜«\r\Ê2¬\n°\à‚	ý/\Æ\ßI£7‰r\Ëq\\w\á\Z\çX\ì¯^†\nu(å´¾©T©Ô¯Jl`%Z©JN­+Å¦\áó>o\ãNúý2¼%þ\Ø\Âøgâ·‡œ9‚\Î1j¸\ç‡\Î3®l|°Q«zø|g‡ùŒiT¥Mt©Ó­(\ÚmJS÷Zû¯K¼:–•a¨òõ•¥ç•»—ö˜#Ÿ\Ë…Ý³~\Ð\Ä\Ø\É5ü=~Ð¾\Ö<ñ\×\â\ï…uûW³\Õtˆ^)†\â1ó$Úµ\ÍÍ´ñ0ùe‚\æ\Úh§‚X\ËG$r+#s_Ü…µ¼6vð\ÚÛ Žx£‚\Æv\ÇH±\Ç\Zä“„EU$\àrI¯øÁû*þÏ¿\'K\ïŠ¼3\âm^8’\Ý5ö¶—Lñ¶Œ0ŽÕµý&[]\í£\Þ]»\Þ4Q“û´^süñôlñ\Ï,ðGˆ¸‹›\ä¸ü\Ó$\â\\	ˆYdðÿ\0\ÚX\Z¹n&½|%ZT±u¨añT\åO‰¥^”±T%\Ì\éTV¡(Oú\Ï\ésôi\Ïþü)Á\Ø|‡ˆ2¬«Šx7™V¢³•Š§“æ”³œ._K1§[\ÂbñX:\Ë•`\ê\á«Cˆ§\ì\Þ\"œ\è\'8NŸó!û!ÁB<wû\"ø?Äž	\Ð<	\ái ñü$‚mb\ïS±¾²¿{M>x’K)¼™­d†\Î\'Tx©.\ã\ç20Eú\ãþuñGþˆ—?ð{¯ÿ\0~Ã¯?b?ú#ƒÿ\0_óOGü:óö#ÿ\0¢8?ðµñ÷ÿ\04õû_x\ÛôB\â\Ì\ï0\â. ð‹3\ë5­FaŽ,-	\âkF*J¤\é\áx\ê…/gJn(ór¹;É¶ÿ\0›xS\è\ßôö\àŽ\ËxW…|g\à›‡òzU(\å¹f;\ÍjQ\ÂR­ˆ©Š©Nœñ>\ZÖ¬\ã*õ\ëT´\ê\Ê\ÎmF\Ñ\åKù¾ý¯?k¿~\×\Þ0ð×Š¼S\á\Âi\á=\n}K\Ótu…’«\é5‹«Û‹ù\åin\ZY<´ò#·‰!ES¾donÿ\0‚PøcWñ\í\àýONµ–[	øs\Å\ÚÞ·v±;[\ÙZM£Í¤Ú‰\æQ\å\Ä÷w\×ðAn²2™X>À\Ûº©ÿ\0¾ý‰\Õ\ÇÁ\Ä%Xñ—	R\âb®¤™aÀ‚E}Yð³\à—\Â‚ZDº\'Â¿xoÁ67>S_bi\Ð\Û\ÞjrBE6«¨•kýRx\Ã0I¯\în$E;U€âº¸\Ã\ée\á}?	ó\r<4\àŽ%Ê°øüƒ1\áÌ¾Žm·	–\å8<Úzx¼B\ç9\Æb\ëEb±5aJ§\'´\ÄMJ¥uk\å\áÿ\0\ÐkÆ¼G9Š\Þ1q\ç\æ•r\Þ&\Êx¯5\Åd˜\Ì\ß3\Î3¼~K[\r‰\Âa¥Opö	N¬ðXjk\ÂsöXx\Ë\Ù\á\ç.Tðhÿ\0V¿³\ÇÁŸ\Züa¼\Ð.|Oo\à\ÛK§Ð­/¢\Ó\'\Ô>Ý«iúRÆ·óZ\Þ\Çl#7\âvsk1aÀ¹|\ÈY¿\à¶\Þ¹`\×?³n¯9\0\Í\ã\í.B>…ü\Øß­~\×üLøi\àÏ‹þ	\×~|A\Ñ\×^ð‡‰ ‚\ßY\ÒZ\îú\Ç\íp\Û^[\ßÀ¢\ïM¹³½€\Çwi¡ ¸ŽÂ„•f\ã¯øu\ç\ìGÿ\0Dp\ák\ã\ïþi\ëù\ÇÂœó\èó•\äXú>.pOñ\'\Ï7«W/\Çpöa_	ƒ£“K…,-Jt¸¯\"Ol1\Õg\'…¨\Ý:´—·••:\Õþ;ð¯\Ò\Ó=âœ»\àGˆ|	Âœ#O#\Ã\ÑÌ²\Þ(À\à1X\Ê\Ùü1ø\é\×\ÆR–3€8®Vž¦”qô ªQ«l$$\Ýj\ßÿ\0\Ã\ë<ÿ\0FË¨ÿ\0\áu£ÿ\0óHàµž \ãöd\Ôƒ\ã­#\Ðÿ\0QÀ\'©Á\Ç\\•÷ü:óö#ÿ\0¢8?ðµñ÷ÿ\04ôÃ¯?b?ú#ƒÿ\0_óO_¨®B_ú5>(\á\ï\åÿ\0Wú·¡ø‡üC\Ú=ÿ\0GŸÁ\îŸó\'\Èÿ\0»ÿ\0Vc\ËðóGòyñ#\Å\Öþ>ø\ã?[xJð·‹<Iª\ëðxkD\Ê\Ò48µ+§¸M6Á0»m\í\Ã\íU·2¢HŸðF^\Óÿ\0f\ß\êzŒ0hú\ï\ÄýV\çÃ­;·“sme£\é\Z~¡=œD\á!þÒ‚h]\Ô–xe<”&¾–\Ðÿ\0\àš¿±f¨Á©\Ú|\Ò/&·eeƒZ\×<U¯iïµƒb}3Y\×/l.‘†Y\í¤VV+\íMB\Ñ|1¤iú‡47B\Ðô«X¬´\ÍH²·Ó´\Í>\Ò¶+k+Hâ¶¶‚1÷b†4A’q’k\Õñÿ\0\éC\Â%xy‡ð÷ƒxk?ÀaV3\'­W\Ä2ÁR–	’û\Ø|6Ž1\Íj\â+Ô”(BxœN*\rQe(Ö©Wž¿EÏ¡ˆ^x«/¼D\â®\Å\â°ø<\îž+\áJ™Ž.8\ìvyBXzøœu|vM‘Q\Â\á\è\Ó\Äb§.	QKõwÑ¥NT\ç­EWðùþ”…~Zÿ\0Á`\ä\Î\ïÿ\0\ì¤xÿ\0CÕ«õ*¼³\ãÁ‡?¼\'€~)ø|x—Â’\êV\Z´ša\ÔuM,CM2µ•À»\Ñ\ïl/\Äg—1‹ð\êÀ_q\áŸ`x3\Ä.\r\â\ÌÎŽ/—p÷å¹¶6Žjc*\á°u\ãV¬0\Ôñð\ÔgY\Å5\Õ\ÄQƒ{\Î+Só/ø75ñÂž?\à|Ž¶›ñG\æy6][3«^†_KŒ¢\áJx\Ê\Øl63J‚—ñ\'G	ˆ©¬iM\è\Þÿ\0‘\Ç\Âö5xsÿ\0O6Uý\ä\Ùÿ\0Ç·ý{Eÿ\0¢\Å|\'cÿ\0\ÉýŠô\Û\ë-F\Ó\àú\Çw§\Ý\Û_Z\È|e\ã¹w6“%\Ä\äñ3F\á%£«#ck©RAû\ÑQQj\0U]ª\0(\à×€8û§Ò‡\Ç^ñ²¿T\á|·ˆrøð\íþž7û{\r—aYf“\Ê%‡ú²Àf™—:‚ÀVö®«£\Ê\åO“žò\åþgúý\Zøû\èõO\Äñ\ÎcÂ˜\éqTømå«†3\×0T–Q\éb¾¸ó<%öNO1 ¨*+\Ï\ËU\Í\Òå‚Ÿñ‹û{ÿ\0\É\âþ\Ð_ö?\ßÿ\0\è‹jý-ÿ\0‚ÿ\0\È_öƒÿ\0¯‡ÿ\0úQ\âZý@øÿ\0ùý“~(x\Ë\Ä?ñ¿\Â\ä\ÕüY\â‹\ã©kššø§\Æ6öõ£H\Þsi§ø‚\Ö\ÎuK,F…²\ÛrI¯Løû,üýœ_\Ä2|ðZxNO=u\Ù±¯j\ï|š_ÚŠn\×5=DÀµ\å\Ãm·òƒ—\Ë\î\Â\ãô>”\Å~/\nòü›‹(ñú·Á\Ù3\Æc0yE<¡bx‘\Ö\Æ\Ôöôsºø\ÇB¤r\Ú\ë\r/¨ûI\ÊT•Jt”¤\áù…Bÿ\0¸\'\é3„ñ‡7\Î8·\na¸Ç8\árü\ß=¯ž\Ë\Ä>!\Ã\à)¬#†0˜‰Œól3\ÅA\æžÎ”aYÒ­]\Æ\n§!ûuÿ\0É¡þ\ÐöNµýÚ¿‹\àÿ\0€ÿ\0Jþóüs\à\r|Hð–¿\àoi«¬x_\Å\ZmÆ‘®io=Í²\Þ\Ø\\€%‡\ís[\Ý@N\Õ+-¼ñJŒ+‚+\âŸøu\ß\ìGŒÂœ\éÿ\0#¯¿ù§¯\è\Çô\à¿¸gˆò^\'\ÊxŸ‰\ÍøŠ¾\Z®E„Ê±!‡Yf\áZXü\ã-©\Z\Þ\×\r9rÂ•Hr8¾~fâ¾«\é‹ôKñ/\Ç\î>\áž)\àœÓ‚ð8Ÿ„h\äº<Mšg8\\±”³¬\ß1u(C-\á\Ü\æ”ð\î†aJ*s­J¢©\n‘ö\\¼³—·þÇŸòk_\0?\ì“ø\'ÿ\0L–µùÿ\0\Âÿ\0[û>½\ã¿ý W\îÿ\0„<\' ø\Ã\Zƒ|-`º_‡<1¤\Ø\èzš’\Ï2X\éšmºZ\Ù\Û,\×2\Íq/•j¦Y\æ’W9gvbMy\Ç/\Ù{\à\í<<>1x5|Yÿ\0³_¶„¶5\í¬Ž¦¶\Ëz7hšžœgY…¤-Á”FP˜Â–bð\Ã\ÄÜ‚¼o\Ãø—š`ó\\FGO<\â¼\ÊxL%L\×\Øg¸L\æŽ*Ž#†\Â:´\ç˜Pú\Ä~¸£Æ£§:®1Œÿ\0uñ‡Á^+\ãß£5òLnCGŠ(p\ç\å\\\Ìñxü>G,O\Ö\È\å˜Mb°\Ùf7¨ÕŽ[ˆxIf¹\Ôr¤ªÓ¡\Í\'\åoþ	\×ÿ\0\'©ðþ\ÆmWÿ\0Q]z¿¤ÿ\0ø(§ü™?\íÿ\0be¯þ¤ZYøuÿ\0ÿ\0ý”¾ø\×@ø‡\à/†#Dñw†.f¼\Ñ5_øJ|cö+™\í.,d—\ìzŽ¿ue96\×S [‹yP\Þ\0uV¿à¢¼~\Äÿ\0´ ðm¯þ¤z~©\â7‹\Ü;\ã7\Ò\Â#\áœu€ÁeÙ§\äµ\ég”08|LñT¸Ú¦:S¥a˜\Ót=–:”T§Vu#Q{5\Ïñ\ï¼\ã?\0>Œ^=ð\Çcxs˜\ç7\çøZœ5Ž\Ìqø8`ªx{K.Œ+\ÕÌ²Œš¬1>\ß]ºp\ÃÕ§\ì9{g)Jþ6\ØnR¿\Þ~cû5\à\ïø,¿\Ä\ßxK\Ã>‹\à\ï‚/¢ðÖ¤h\ÞK¬\ë°\És‘a„3IH\è’Iº4\Ý\ä\àŠücv‚\n\ÄŽ \Zþ°>ÿ\0Á4ÿ\0cO|5ø¯\êÿ\0	Mæ«®x+\ÂúÆ¥t\Þ1ñ\ÄF\âÿ\0S\Ñ,¯n\æò­üG‰.\'‘‚EF€…U\0_ÛŸI®#ðs‡²\ÞŸ‹ü›q~\Íc‘Q\ÊR\çÀ\âh\áðR\ÇU¬\Þ{‘\Ú5©OÚ¦\"\î÷!ñKü\èú$p‡\Ò‹s~3¥\à\'d¼Áe¹LøŽ¾sŒ¯„§Á\Ö\Åb£€¥C\Øð\ßûIÐ­O9sR\ÃrÆ§»R|\Î1ü\ê\×?\àµu]V\Ó->øNº\Ôt\ë\Ë}@\êº\í\×Ø¥º\à[¡l\ÒÄ³µ¾ÿ\05#wÎªrnSø·<\ïq<÷03\\\Ï5Ä¤\0 \Ë<,„(À\0»¶\0\à;Wõ\çÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=u~ÿ\0‚v~\Æ\Þ¿Q\Òþxfö\â<\Ø\×Ä—:Ï‹-VM¡U¾\Å\â]OU³m˜ª\ÐWùÀÝ’\0\àß¥Ñ¿\Ã,>j¼>ðÏ2jÙ·Õ§§\Z9g.6x(ÖŽ5ñX\Î,\Ì\êÑ§K\ëù}•)E:³“§&\Ñý3\ÇBÿ\0¥\ï‹xìš§Š*x}Ÿ\Ñ\É\Ö\"Ž[8\Ïk\ÔË¨\ãeBx\Éa°xn\Ê\èÖg‡¢\å\í+BRö0Š©ž{ÿ\0ªðþ±\á\ïØ»\á\ÜzÅÅƒ\ë\ZÇŒüC`—1˜\Þ}\'Wñ%\ìúu\â«|\ÞM\Ü\0M¾dL’((\êO\åü\Âú®™ûEø\'\Å3\Û\Ëý\â_†öv¶¢·Û´]_QŠö\Ä\Ü\å5\ÔqOmtÐ†,9]¬\rMÖ¶\ÖöV\ÐY\ÙÁ\r­¥¬1\Û\Û[[Ä\Û\Û\ÛÂ‹0Aj±\Å1ª\ÇhªˆŠª (¸ˆ¿>|\\\Ð\Âÿ\0ü\á\ßhM!™4ÿ\0ivº”V\×&7ˆ^X½\Äm-…\ê$Œ#¼³’˜óòJ+ù—€|u	ø\éœx¿ÈªbpœC™q6#2\Épx˜}g\r„\â<ELJ†^¥Z¾¢Ã¿\ÞÆ„1Q¥RXj¥\ì\Ï¾ŒÕ¸\ë\è\Û\Ã^\à8’×ƒò\î¥”gøü%X`±¹`?³¥<n:µ°øl~¶.+\Ù<Tð“©FnŸd\ã?\ãSöYý¤üMû+|Sâ‡…ô-Ä—M \ê~½\Ñõ·»Š\Ò\çO\Õ\Òi)ì¥Šh.¡š\Ê†C\æÅ1$…\Ã\r¿¥\ßðû¯Š?ôD¼	ÿ\0ƒ\Ýükôú_ø&\ìK4²J\ß\ãV‘Ë²\Å\ãC,rBE‰R8\ÔvDUQ\ØTð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó\×ôOý þŠ~ \æñ\Ïø\ÇÂ¾5\Îs•„¡xÚ´0z†œ\çBŒ–ð´\æ©JµNIÊ›©\Ë.W+(E#ð\'\Ñ[\é\Å\áŽK>\à?|=\áÜŠxúù“\Ëð™\æqR‹\Æ\âi\á\éW\Äÿ\0µøqŠ«Õ¥†£F5y²\\ª\í\Éþ\Zþ\Ô\ßðSˆµ\ÂÙ¾j\ßü#\á-÷Y\Ó5}CP\Ó/ukýFc¤H\Ó\ÚZÁö¹\Ö\Þ\Þw\ßp\í\Ò:¢,mÏ¿ó³\Ãz6£\âO\è\Ñí¤½Õµ\ÝkK\Ò4\Û8Q¤–\âûQ½‚\Ö\ÖE‰yePx\àdœ\0M[¿ð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó×³ü&ýŽ?fŸ‚:œZ\çÃ„žÑµûf-g\â¸n5\íz\ÇtoýƒX\×\î5=F\Ç\ÌIdû%\Ì>bœW±‘ý.üð\ï…ñ™†^ñn[\Õ\Åc°¹n.9n/©™\âhÓ¤ñ\Ìtø‹:\ÇF2ö#S\ÙÐ¬ý%\ZpŽ‡‡žý>’¾)ñŽˆ<_ñ7s)JŽ/\Ì3¼&?:\ÌózYVs”0ø,¹ðŽA©8*ø‡ET\Å\á\á\íj9T›Rg¤øª\Æm3\àÏˆôë¾}‡\Ã]b\Êm¤2ù¶¾¹‚L0$¾6Á‚+ø[“ýl¿õ\Ö_ý\r«û\èÔ´\ëM[O½Ò¯\á[‹\rF\Ò\æ\ÂöÝ‹*\Ïiy–\×01FGU–	FV²¤ðkÁ/¿bGfsðqr\ì\Î\Øñ§@\Ë\Ç\0xŸ\0dž ¯\ÄþŒ_HðbCŠò¾\"\Ì*q./%\Ä\á%ar\ÜD)ÿ\0g\Ó\Í#‰X…˜f¹l©¹KI\Ñöj²”cS™Á\Æ*\Ñ?L_¢¿ˆ=c¼:­ÀyŸ	`p\Ü!”g9f6<S™\æø\n\Õ6¶U,$ð¯+\È3˜VJžª®\ê¼3Œù9#QMòfÁ+ÿ\0\ä\Êþÿ\0\×÷õ/\Õ\ëôJ¼\ï\ágÂ¯üðV“ðóá¾ˆžð†ˆoM\ÒR\îþü@÷÷“\ßÝ»]\êwW—³<\×W\Ê\Í5Ä„nÚ¸P\0ôJþq\ãþ \Âq_q\åô±40<C\Äù\îuƒ£Œ(b\éas<\ÏŒ¡O\n±a^4«EU*õ©\ÆjJ5&’“þ¼ð‹„³.ð³\Ã\Î	\Î+`ñ¯	ðoðþe_.©Z¶®7)\Êð\Ø,ML\\F^¦\ZU¨\ÍÑ©[\r‡©:|²\Zrn(¯\äþ\n{\á½_ÃŸ¶o\Åµ[I-\íüG‡¼A£\\2H°_\é·Z”>u¼®Š’ù0Okp#,!¹†H˜\îS_\×\Íy\'\Å_þ7X\Ú\Ø|Uøy\áEa\ægO­iO¨i¾k+\Ëý›©¨MFÀLÈ¾r\Ú\\Â³c÷«ô£×Œ_ø\æ¿f9N\'8\Êó“‘\ãðø\Z´ic¨S¯ŒÀci\âð«\áB´\éUÀFœðõjÐŒ\éÕ”•h\ÊŒÿ\0%úWxúBøwáŒ›:Ády\æI\Ä~ \Ê\ë\ætñ\Ë1S§\ÇeõðX\Ù\ái\Ö\Ä\á£VŽ9Õ¥Š£C\éÔ¢¡,<\ãUÔ¥ü”~Ç¿¶WŒ?c\Ý{\Æ:¿†<) xº\Û\Æ\Úf™§\êv\Z\ä÷ö¦\ÞM\"\â\ê\â\Ê\ê\Ê\æ\Æd*Ù¼ž;ˆ\æŠe‘\nò\Ýw\Û\ÏØƒþ\nG\ã?Ú³\ã\ï\Ãü6ðß…l\àðv¯\âXµ]UÔ®®~Ñ¦^\é–\ëlðÞ†¢•/œ–]®¬ŠA#*}Ý¿\à—ß±#31ø8 ³!|g\ã\ÕPX’Bªø˜*¨\Ï\n *Œ\0\0\0W«üý‹?fÿ\0€+Ÿ\Æÿ\0\n>/†<Mq¤\Ýhrjg\Ä(Õ›û2òki\îm\Ö\ßYÖ¯\íP\Ë%¤Ê°‰€Bª\áYý§\Æ/\ZþŽ%e\ÜU›aü9\â\Èø‹œe1\Â\åœI£ƒ\ÃR¡\Ãa\è\árüF*..­E\Ã\rB:\\\ë.\ÄNP§:u,\æ\ß¾ŽK\ï	3®\n\Éñ\'ð=?\nò> §\ÎøW)Í³L\\ñYV\'ñ¹\Æ	OÀxiÊ®6uk\ÍByž*­YN5©·s\çø+G‡µö8ñLºE”·‹\áÿ\0ø?\Ä:±‡­t{;Û›K›¶\\\îx\áŸPµU\\\ÈF\Ôb?”ÿ\0\ê\Ñ\è^!\Ð5\Ù,-uh´MsH\Ö$\Ò\ï\ë=N=/P¶¾}:\ì\0sk|kƒ˜e~Jþõo¬lµK;­;R´¶¿\Ó\ï­æ´½²¼‚;›K»[ˆ\Ú+‹k›y•\âž	\âvŽXeFŽDb®¥IñO‰\àœ±‡ŠµIµmC\àŽƒes;3\É‡µ/øcN\Üí¹Œz_‡µ}3N‡,I+TU\Î\Ås}þ“¼1\á7f|Å¼;žf<NqŽ\Íp¹†@ðUk8f8L&„\Åa±¸ü·‘Ó–Î–\'Š”œ+r:P•R§¯ô´úqÏ~!e~\"ðð\ÆG%\Ë2ŒvU\Å53\Zur¬^3‡\Ç`ñ™vSœªÑ«OU\ÂbppQ©A\ÍW«\nþÊÁö?ðZ„q\Ø\Ù\Ç?À/\ÛO´)5µŽ³\áógˆZBlacma\Ì1‘U(1Š\å~#ÿ\0Áa~ø\Ó\á\ïŽ|aðGÅ–Wž+ð‡‰<7m{s«h/œú\æ{¦Ew*Gjdt¶’\éf(…Y¶aYN\r}õÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=ð\ë\ÏØþˆ\àÿ\0\Â\×\Ç\ßü\Ó\×Œ¾…øLe}\r¼W†#\rŠ¥‹¢\Þk\Â¨Õ…jm\Â|q%(\ÆqM\Æ\\\ÊI5+\ÝóF+\Ã_\Ú#ŒÀb2\ÜOŠþO‹Á\ÕÀ\â\"²ü4%<=zW«:~\ÂP”©\ÊiJ..\Î6´müƒ\"\íD^»UW>¸\0Wöwûÿ\0É™þ\Î\ßöN4¿ýw^{ÿ\0¼ýˆÿ\0\èŽü-|}ÿ\0\Í=}£\àø[á‡ƒ<;ðÿ\0Á:`Ñ¼\'\áM6-#A\Ò\Å\Í\åà²°€»GÚ¯\î.¯\'!‰’\âyd$œ¹\ã_I¯¤x\ÑÂ™E\Ã9O`1yW,\ßW<\ÂeX|<ð\ë,\Ç\àù(\Ëœf5%[\Ú\â¡.YR„9#7\í.£t}~‰\Þ&x\Ç<QÄ¼o™ð^;p¤²<%>\Ísœ~.Ç›å™‡>\"žeÃ¹5(aýŽ¬y\é×«S\Ú8/e\Ë\'8ÿ\0\'?ðTjþ\Zý³~\'Oª[I\r·‰`ðçˆ´k–ŽD‚÷Oº\Ñ,\àg·•\Ô$\Æ\Ú\ê\Ú{Kƒ0Ž\â\'°ÀŠ\à¿cÿ\0\Û+\Æ?±\î¿\ã\rc\Âþðÿ\0‹m¼k¦\éš~«§\ë³j\Æ\Ò..®,®lnl\'Ë›\É\ãg†\á$M›n»\Ïõ­ñg\à/Á\ïŽZl:g\Åo‡¾\Zñ¤6‰2i÷:¾ŸjšXœ©˜\éZ¼>V§¦J)\Ø\ÝÁ¼€[$_-ÿ\0Ã¯?b?ú#ƒðñ¯¿ù§ËŽ\Õ÷</ô³ð¯\áNOá·‰œÄ¹µC“ðþe‡\Ê\éå¸¬³4¡’S\ÂC	ŠU+gY67VSÁa±.”\"\Ý\Zðjž\"qI¿Ë¸\Ï\è1\ã†W\ã6wâƒ|{Á¹Tñ\ÜIq6MÎ±¹\Æ[d¸Œú¶.®/\éaøkˆp8¸S§˜bð«*±ú\ÆWž”¦\á\Ì_ø}\×\Åú\"^ÿ\0Á\î¿þ5ùýû`~\×~#ý¯üY\á/ø\ÂZ7„\'ð—‡\î¼?mi¢\Þ^\ÞCuÖ¥.¢\×=ó3¬ªòùaSTŒæ¿£¿øu\ç\ìGÿ\0Dp\ák\ã\ïþi\èÿ\0‡^~\ÄôGþ¾>ÿ\0æž£„¼zú&p.w‡\â>ð§²|\ë	KG¥K^¥*Xº\rˆŠ§‹\ãœEªÑœ¡\'*M¤Û‹R\åb\ã_£Ó«\Än\Äp·xÁ\á\î\Ãøº\Ø\\F\',\Å\çyµ:5k`\ëC†©)a|6\ÃÖ½\Z\ÐU\"£Q\'(\ÚI§cðƒþ	Qÿ\0\'§ðÿ\0þ\Å\ßÿ\0\ê=q_\Ñ7\í\é\á\íc\Å_±÷\Ç\ÝA±ŸR\Ô\î|qs²\'–-+QÓµk\Ój9†\Â\Æ\êr\Û\0i~þ\Âÿ\0³Á\Z\ØüBøið\Ý|=\â\í6\Öþ\Î\ÇU>$ñf©\ä[\êv\íix«i«k—¶L\ÒÀ\íw·g%£enk\ë†PÀ«\0\ÊAA Ž„kð\ï|p\É8ÿ\0\Åþñ+…2¼ÖŽ†0¼5(\àsúX<%|V; Ï±¹Ë¦ÿ\0³ñÙ•8\ákÆµ\Z>\×Úª©ûW\ì­¹ÿ\0L}>üWá}\á7f\Ùöcx®+1\á|F;4\Â\àrþ#áŒ¿ k\æ™fKR¦3\rR†\"»¡\ì=Œ¢¨¯¬79ªÀ7¤vaƒØ€Gq\ØýzWì‡€?\à²_<\à\nx>\ã\áGõ\É</ \é~MZMKZ±’ú\ßH³†\Â\Öy­a•\áŠf·‚?4DV6pYQAÀýžñ\Ïü\ëö?ø…«Í®øƒ\àŸ†¡\Ôî¦’\â\êoÏ«xJ;»‰‰i®.m|/¨\é³\Ï+’òK$,\ï!i³±c\ÅÃ¯?b?ú#ƒÿ\0_óO_Ñœ_ô©ú;x™—\åXoü4\ã<\ÞYeZ˜¬6\Ùå“¥\Åb)Â–#\êø\Ü/\åXŠÐ©B2u(ÒOg	:1”co\äž\nú}-ü%Í³Œ_…ž)ø‘C4§OŠ\Æ\Ó\Íó\ì-|\Ç‡ª\ëa¾·—\â8#7\ÃQ©Js©({<Ei\Ó\ç©\×q©$ÿ\01þsñH«ø\'\à0\ÅX)ms_eT\í,¡Ð²†Áe¤Œ€\ÊNG\ã\ç\Ä\ïˆ\Z\×\Åoˆž5ø—\â8\ì\à\×|u\âMO\ÄÚ¬6´60\Þê“´ò\Ãi’J\éy	y°2\Ì\Ç&¿«\ïøu\ç\ìGÿ\0Dp\ák\ã\ïþi\ëOHÿ\0‚hþ\ÅZ-ü:·Á]2\êXƒVñ‹u›\Ã+b};U×®\ìgRT³[¸*YH\Ú\Ì\'}%>Œ>\Z\â3øaÆ¹&?1\ÂC	Š­O–Öž&…)ª\Ôðò«Ž\ã,s£I\ÖQœ\Ý\ZkšQŒ¥òA.\Î<ú!}4|W\Ã\åyo‰,ø}\ÄY^YŒ–/	Gžgœ˜:õ©ª±Tðø?°¯]Qs„=µOv.p„éª³o\äoø\"n‡«X|øµ®^X\Ü\Û\é~ ø•fº5\ä\Ð\É:ˆ\Ò<9gm¨Ik#¨Iâ¶º˜[I$Lê³¤‘6¯§ÿ\0m\Û\ãHýŽµ\ß\èz\ÃmO\Çsx\ÓK\Õ5X\æ±ñ®ƒŸ›w§”\ë>ª½\Ë\Ìò\ÈòV5\\|Å¾_»|;\á¿øCEÓ¼7\á]Kð\ï‡ô‹u´\Òô]\Â\ÛL\ÒôûU%–;8¡¶¶ˆ33lŠ4™˜‚Ä“\á\ß?dÿ\0€ÿ\0´mö…©|`ðBx®÷\ÃV\×vz-\Çö×ˆtw´µ¾•\'¹„ÿ\0bjºrÎ¯,j\ã\í)C…C0?\Ëÿ\0øŽ|m\Íü@ñ\'†3|W\ç˜\Ìf#Ã¹66K4…:Y<r\ì}n–a’óÔ§_\rƒ\Ä\ã=–2„ö±‚«M(Tþ\×\ÂøQâ¿‡Gð»Áþ2\Èp#p\î/\Ã\áx§;À\ÓY4ý®y<\Ó>Œp¸¬›‰£\nu(bñ˜\\«exŠ’Š¥9<-Y¹\Òüœoø-dbò~\Ìú“¹\ä³x\ëH$ýIðY?­7þY\à/ú6]Gÿ\0­ÿ\0˜ªû\Ãþyûÿ\0\ÑøZøûÿ\0šz?\á×Ÿ±ýÁÿ\0…¯¿ù§¯\Ö?\×¡/ý\ZŸ?ð÷òÿ\0«ý[\Ðüþ!\Ç\íz¿\Z<¾·“\äoùwÿ\01®ßƒ\îÊ¿\Úþ\n·\àß?<yðº\Ëöv\Z=ßŒ´f\ÒmõW\Å:f©k¤I%\Äi-Œ±š{«aûAå±Ž\ãË˜\ÈV3þ.,RLR\Þ$yæ˜¬0\Ã\Z´“M,„GqÆ ¼’H\åQAfr‚H¯\ë\ßþyûÿ\0\ÑøZøûÿ\0šzô¿†¿°¯\ì£ð›Z´ñƒ>\rxb\ß]\Ó\æK7U\Ö´<Q{¦\ÝG –;½:\Þj\Ícw\å\\\ÛyS\Ä>X\äU¯Ô¸+\éOôð£!Ì²¯\rü>\ãü$1Ø¹\ærÀ\æX¼-l>\'1xj8hÊ®?\Å9\æ\'	I\Ò\ÃÑ„–\rR+–STg7\ï~E\Æÿ\0B¯¥_Œ¼O”g^-ø‘\á~:¦_¥”,\×,§Š£‹\ÂeTñUñžÊŽS”p`1\Õc_‰œ%‰\ÄÑ«.uNX˜Ò5_ø¥kZÁ_„\Ú?ˆ\Ì\Ç^\Ó>x6\ÇWòN—ö\Þ\Óá¹Šg“e†Th¤\ÞB\â½^\Å-Ù†2yŽaŽ\Ì*B\êcñ¸¬mJt•©Óž.½Jò…5\Ò•G/\åHÿ\0Z2L®–G“e-\nµk\Ñ\Ê2\ÌWF½ysW­K/\Â\Ò\ÂS«Z_j­HQS©.³m…Q\\g¦QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0ƒ\âøoÆº§\áo\è:G‰ü7¬À-um^Ó­5m#R¶Yc`¾Ó¯¢ž\Ò\ê!4QJhD‘£€T\ê+JUjÐ«N½\nµ(Ö£R¨Ö£9Ò­F­))Ó«J­7Ó©NqŒ\á8J2„’”Zi3*ô(\â¨V\Ãbh\Ò\Äa±ªP\Äa\ëÓ…j\èVƒ§VjU#*uiU§)B¥9\ÆPœ$\ã(¸¶œO\ì{û)\ì\áðDƒÁá‡ƒyÿ\0\Ê=}	ace¥\Ø\Ù\éºm¥½†§\Ú\Û\Ø\ØX\Ù\Ãµ¥¬Iµ­­¼*‘Aooi0Ä‹q¢¢(U\0Z¢½\Ç<\ÎóxÒŽmœ\æÙ¬hJr¡\Ë2\Æ\ã\ãFUT\åF8ªõU)MF*n\n.J1Rm$y9Oð\ÞA:\Õ2.\ÈòZ˜˜\Â‰\åN-xSm\Â5¥ƒ\ÃÑ•XÁ\ÊN¨\ä¢\å&’m¶QE\åž\ØQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEÿ\Ù');
/*!40000 ALTER TABLE `produtoImagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retirada`
--

DROP TABLE IF EXISTS `retirada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retirada` (
  `idRetirada` int(11) NOT NULL AUTO_INCREMENT,
  `idCaixa` int(11) NOT NULL,
  `descricao` varchar(400) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `data` datetime NOT NULL,
  `idTramite` bigint(20) NOT NULL,
  PRIMARY KEY (`idRetirada`),
  UNIQUE KEY `idRetirada_UNIQUE` (`idRetirada`),
  KEY `FK1ae050xs5eoqkdlmwc62rk3xo` (`idCaixa`),
  CONSTRAINT `FK1ae050xs5eoqkdlmwc62rk3xo` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retirada`
--

LOCK TABLES `retirada` WRITE;
/*!40000 ALTER TABLE `retirada` DISABLE KEYS */;
/*!40000 ALTER TABLE `retirada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_access`
--

DROP TABLE IF EXISTS `tb_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_authorization_role` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_profile`,`id_authorization_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_access`
--

LOCK TABLES `tb_access` WRITE;
/*!40000 ALTER TABLE `tb_access` DISABLE KEYS */;
INSERT INTO `tb_access` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287),(1,288),(1,289),(1,290),(1,291),(1,292),(1,293),(1,294),(1,295),(1,296),(1,297),(1,298),(1,299),(1,300),(1,301),(1,302),(1,303),(1,304),(1,305),(1,306),(1,307),(1,308),(1,309),(1,310),(1,311),(1,312),(1,313),(1,314),(1,315),(1,316),(1,317),(1,318),(1,319),(1,320),(1,321),(1,322),(1,323),(1,324),(1,325),(1,326),(1,327),(1,328),(1,329),(1,330),(1,331),(1,332),(1,333),(1,334),(1,335),(1,336),(1,337),(1,338),(1,339),(1,340),(1,341),(1,342),(1,343),(1,344),(1,345),(1,346),(1,347),(1,348),(1,349),(1,350),(1,351),(1,352),(1,353),(1,354),(1,355),(1,356),(1,357),(1,358),(1,359),(1,360),(1,361),(1,362),(1,363),(1,364),(1,365),(1,366),(1,367),(1,368),(1,369),(1,370),(1,371),(1,372),(1,373),(1,374),(1,375),(1,376),(1,377),(1,378),(1,379),(1,380),(1,381),(1,382),(1,383),(1,384),(1,385),(1,386),(1,387),(1,388),(1,389),(1,390),(1,391),(1,392),(1,393),(1,394),(1,395),(1,396),(1,397),(1,398),(1,399),(1,400),(1,401),(1,402),(1,403),(1,404),(1,405),(1,406),(1,407),(1,408),(1,409),(1,410),(1,411),(1,412),(1,413),(1,414),(1,415),(1,416),(1,417),(1,418),(1,419),(1,420),(1,421),(1,422),(1,423),(1,424),(1,425),(1,426),(1,427),(1,428),(1,429),(1,430),(1,431),(1,432),(1,433),(1,434),(1,435),(1,436),(1,437),(1,438),(1,439),(1,440),(1,441),(1,442),(1,443),(1,444),(1,445),(1,446),(1,447),(1,448),(1,449),(1,450),(1,451),(1,452),(1,461),(1,462),(1,463),(1,464),(1,661),(1,662),(1,663),(1,664),(1,665),(1,666),(1,667),(1,668),(1,677),(1,678),(1,679),(1,680),(2,9),(2,10),(2,11),(2,12),(2,33),(2,34),(2,35),(2,36),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,85),(2,86),(2,87),(2,88),(2,129),(2,130),(2,131),(2,132),(2,181),(2,182),(2,183),(2,184),(2,201),(2,202),(2,203),(2,204),(2,209),(2,210),(2,211),(2,212),(2,221),(2,222),(2,223),(2,224),(2,234),(2,235),(2,241),(2,242),(2,243),(2,244),(2,261),(2,262),(2,263),(2,264),(2,265),(2,266),(2,267),(2,268),(2,301),(2,302),(2,303),(2,304),(2,317),(2,318),(2,319),(2,320),(2,329),(2,330),(2,331),(2,332),(2,341),(2,342),(2,343),(2,344),(2,365),(2,366),(2,367),(2,368),(2,381),(2,382),(2,383),(2,384),(2,389),(2,390),(2,391),(2,392),(2,393),(2,394),(2,395),(2,396),(2,417),(2,418),(2,419),(2,420),(2,425),(2,426),(2,427),(2,428),(2,441),(2,442),(2,443),(2,444),(2,445),(2,446),(2,447),(2,448),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,125),(3,126),(3,127),(3,128),(3,141),(3,142),(3,143),(3,144),(3,217),(3,218),(3,219),(3,220),(3,257),(3,258),(3,259),(3,260),(3,301),(3,302),(3,303),(3,304),(3,321),(3,322),(3,323),(3,324),(3,421),(3,422),(3,423),(3,424),(3,437),(3,438),(3,439),(3,440),(3,441),(3,442),(3,443),(3,444),(3,445),(3,446),(3,447),(3,448),(3,449),(3,450),(3,451),(3,452),(4,0),(4,9),(4,10),(4,11),(4,12),(4,17),(4,18),(4,19),(4,20),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,129),(4,130),(4,131),(4,132),(4,154),(4,173),(4,174),(4,175),(4,176),(4,181),(4,182),(4,183),(4,184),(4,201),(4,202),(4,203),(4,204),(4,209),(4,210),(4,211),(4,212),(4,221),(4,222),(4,223),(4,224),(4,229),(4,230),(4,231),(4,232),(4,234),(4,235),(4,241),(4,242),(4,243),(4,244),(4,258),(4,301),(4,302),(4,303),(4,304),(4,309),(4,310),(4,311),(4,312),(4,322),(4,341),(4,342),(4,343),(4,344),(4,393),(4,394),(4,395),(4,396),(4,429),(4,430),(4,431),(4,432),(4,437),(4,438),(4,439),(4,440),(4,445),(4,446),(4,447),(4,448),(4,449),(4,450),(4,451),(4,452);
/*!40000 ALTER TABLE `tb_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_accessory`
--

DROP TABLE IF EXISTS `tb_accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_accessory` (
  `id_product_1` int(10) unsigned NOT NULL,
  `id_product_2` int(10) unsigned NOT NULL,
  KEY `accessory_product` (`id_product_1`,`id_product_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_accessory`
--

LOCK TABLES `tb_accessory` WRITE;
/*!40000 ALTER TABLE `tb_accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_address`
--

DROP TABLE IF EXISTS `tb_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_manufacturer` int(10) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(10) unsigned NOT NULL DEFAULT '0',
  `id_warehouse` int(10) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(32) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `other` text,
  `phone` varchar(32) DEFAULT NULL,
  `phone_mobile` varchar(32) DEFAULT NULL,
  `vat_number` varchar(32) DEFAULT NULL,
  `dni` varchar(16) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_address`),
  KEY `address_customer` (`id_customer`),
  KEY `id_country` (`id_country`),
  KEY `id_state` (`id_state`),
  KEY `id_manufacturer` (`id_manufacturer`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address`
--

LOCK TABLES `tb_address` WRITE;
/*!40000 ALTER TABLE `tb_address` DISABLE KEYS */;
INSERT INTO `tb_address` VALUES (1,8,0,1,0,0,0,'Mon adresse','My Company','DOE','John','16, Main street','2nd floor','75002','Paris ','','0102030405','','','','2018-01-17 09:46:02','2018-01-17 09:46:02',1,0),(2,21,35,0,0,1,0,'supplier','Fashion','supplier','supplier','767 Fifth Ave.','','10153','New York','','(212) 336-1440','','','','2018-01-17 09:46:02','2018-01-17 11:01:26',1,1),(3,21,35,0,1,0,0,'manufacturer','Fashion','manufacturer','manufacturer','767 Fifth Ave.','','10154','New York','','(212) 336-1666','','','','2018-01-17 09:46:02','2018-01-17 11:01:18',1,1),(4,21,12,1,0,0,0,'My address','My Company','DOE','John','16, Main street','2nd floor','33133','Miami','','0102030405','','','','2018-01-17 09:46:02','2018-01-17 09:46:02',1,0);
/*!40000 ALTER TABLE `tb_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_address_format`
--

DROP TABLE IF EXISTS `tb_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_address_format` (
  `id_country` int(10) unsigned NOT NULL,
  `format` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address_format`
--

LOCK TABLES `tb_address_format` WRITE;
/*!40000 ALTER TABLE `tb_address_format` DISABLE KEYS */;
INSERT INTO `tb_address_format` VALUES (1,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(2,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(3,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(4,'firstname lastname\ncompany\naddress1\naddress2\ncity State:name postcode\nCountry:name\nphone'),(5,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(6,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(7,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(8,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(9,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(10,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(11,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(12,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(13,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(14,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(15,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(16,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(17,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity\npostcode\nCountry:name\nphone'),(18,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(19,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(20,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(21,'firstname lastname\ncompany\naddress1 address2\ncity, State:name postcode\nCountry:name\nphone'),(22,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(23,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(24,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity State:iso_code postcode\nCountry:name\nphone'),(25,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(26,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(27,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(28,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(29,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(30,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(31,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(32,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(33,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(34,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(35,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(36,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(37,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(38,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(39,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(40,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(41,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(42,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(43,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(44,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(45,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(46,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(47,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(48,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(49,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(50,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(51,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(52,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(53,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(54,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(55,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(56,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(57,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(58,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(59,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(60,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(61,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(62,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(63,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(64,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(65,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(66,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(67,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(68,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(69,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(70,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(71,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(72,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(73,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(74,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(75,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(76,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(77,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(78,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(79,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(80,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(81,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(82,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(83,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(84,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(85,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(86,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(87,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(88,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(89,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(90,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(91,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(92,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(93,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(94,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(95,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(96,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(97,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(98,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(99,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(100,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(101,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(102,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(103,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(104,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(105,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(106,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(107,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(108,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(109,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(110,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\ncity\npostcode\nState:name\nCountry:name\nphone'),(111,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(112,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(113,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(114,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(115,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(116,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(117,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(118,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(119,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(120,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(121,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(122,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(123,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(124,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(125,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(126,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(127,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(128,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(129,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(130,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(131,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(132,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(133,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(134,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(135,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(136,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(137,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(138,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(139,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(140,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(141,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(142,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(143,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(144,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(145,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nState:name\nCountry:name\nphone'),(146,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(147,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(148,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(149,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(150,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(151,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(152,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(153,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(154,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(155,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(156,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(157,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(158,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(159,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(160,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(161,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(162,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(163,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(164,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(165,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(166,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(167,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(168,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(169,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(170,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(171,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(172,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(173,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(174,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(175,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(176,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(177,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(178,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(179,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(180,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(181,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(182,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(183,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(184,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(185,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(186,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(187,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(188,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(189,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(190,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(191,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(192,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(193,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(194,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(195,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(196,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(197,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(198,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(199,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(200,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(201,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(202,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(203,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(204,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(205,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(206,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(207,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(208,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(209,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(210,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(211,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(212,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(213,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(214,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(215,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(216,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(217,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(218,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(219,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(220,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(221,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(222,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(223,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(224,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(225,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(226,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(227,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(228,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(229,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(230,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(231,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(232,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(233,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(234,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(235,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(236,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(237,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(238,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(239,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(240,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(241,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(242,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(243,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone'),(244,'firstname lastname\ncompany\nvat_number\naddress1\naddress2\npostcode city\nCountry:name\nphone');
/*!40000 ALTER TABLE `tb_address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_admin_filter`
--

DROP TABLE IF EXISTS `tb_admin_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `controller` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filter` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_filter_search_idx` (`employee`,`shop`,`controller`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin_filter`
--

LOCK TABLES `tb_admin_filter` WRITE;
/*!40000 ALTER TABLE `tb_admin_filter` DISABLE KEYS */;
INSERT INTO `tb_admin_filter` VALUES (1,1,1,'ProductController','catalogAction','{\"filter_category\":\"\",\"filter_column_id_product\":\"\",\"filter_column_name\":\"\",\"filter_column_reference\":\"\",\"filter_column_name_category\":\"\",\"filter_column_price\":\"\",\"filter_column_sav_quantity\":\"\",\"filter_column_active\":\"\",\"last_offset\":\"0\",\"last_limit\":\"20\",\"last_orderBy\":\"id_product\",\"last_sortOrder\":\"desc\"}');
/*!40000 ALTER TABLE `tb_admin_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_advice`
--

DROP TABLE IF EXISTS `tb_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_advice` (
  `id_advice` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_advice` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `ids_tab` text,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `location` enum('after','before') NOT NULL,
  `selector` varchar(255) DEFAULT NULL,
  `start_day` int(11) NOT NULL DEFAULT '0',
  `stop_day` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) DEFAULT '1',
  PRIMARY KEY (`id_advice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_advice`
--

LOCK TABLES `tb_advice` WRITE;
/*!40000 ALTER TABLE `tb_advice` DISABLE KEYS */;
INSERT INTO `tb_advice` VALUES (1,353,72,NULL,1,0,'before','#typeTranslationForm',0,0,1),(2,389,0,NULL,1,0,'before','#upgradeButtonBlock',0,0,1);
/*!40000 ALTER TABLE `tb_advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_advice_lang`
--

DROP TABLE IF EXISTS `tb_advice_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_advice_lang` (
  `id_advice` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `html` text,
  PRIMARY KEY (`id_advice`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_advice_lang`
--

LOCK TABLES `tb_advice_lang` WRITE;
/*!40000 ALTER TABLE `tb_advice_lang` DISABLE KEYS */;
INSERT INTO `tb_advice_lang` VALUES (1,1,'<div id=\"wrap_id_advice_353\" ><style>\r\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url(\"https://gamification.prestashop.com/images/interface/gamification-tip-bg.png\") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url(\"https://gamification.prestashop.com/images/interface/gamification-cta-bg.png\") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url(\"https://gamification.prestashop.com/images/interface/gamification-popin.png\") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:170px;height:200px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png\") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:370px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-bullet-check.png\") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-close.png\") no-repeat}\r\n</style>\r\n<hr class=\"clear\"/>\r\n<div id=\"advice-16\">\r\n<div class=\"gamification-tip\">\r\n	<div class=\"gamification-tip-title\">Advice</div>\r\n	<span class=\"gamification-tip-cta\"><a class=\"\" href=\"https://gamification.prestashop.com/get_advice_link.php?id_advice=353&url=http%3A%2F%2Fcrowdin.net%2Fproject%2Fprestashop-official%2F\">Join</a><a class=\"gamification_close\" style=\"display:none\"  id=\"353\" href=\"#advice_content_353\">close</a></span>\r\n	<div class=\"gamification-tip-description-container\">\r\n		<span class=\"gamification-tip-description\">\r\n			Help us translate PrestaShop 1.6 into your language by <a href=\"https://gamification.prestashop.com/get_advice_link.php?id_advice=353&url=http%3A%2F%2Fcrowdin.net%2Fproject%2Fprestashop-official%2F\">joining us on Crowdin</a>!\r\n		</span>\r\n<div style=\"display:none\"><img src=\"https://gamification.prestashop.com/api/getAdviceImg/353.png\" /></div>\r\n	</div>\r\n</div>\r\n</div>\r\n</div>'),(1,2,'<div id=\"wrap_id_advice_353\" ><style>\r\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url(\"https://gamification.prestashop.com/images/interface/gamification-tip-bg.png\") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url(\"https://gamification.prestashop.com/images/interface/gamification-cta-bg.png\") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url(\"https://gamification.prestashop.com/images/interface/gamification-popin.png\") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:170px;height:200px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png\") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:370px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-bullet-check.png\") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-close.png\") no-repeat}\r\n</style>\r\n<hr class=\"clear\"/>\r\n<div id=\"advice-16\">\r\n<div class=\"gamification-tip\">\r\n	<div class=\"gamification-tip-title\">Advice</div>\r\n	<span class=\"gamification-tip-cta\"><a class=\"\" href=\"https://gamification.prestashop.com/get_advice_link.php?id_advice=353&url=http%3A%2F%2Fcrowdin.net%2Fproject%2Fprestashop-official%2F\">Join</a><a class=\"gamification_close\" style=\"display:none\"  id=\"353\" href=\"#advice_content_353\">close</a></span>\r\n	<div class=\"gamification-tip-description-container\">\r\n		<span class=\"gamification-tip-description\">\r\n			Help us translate PrestaShop 1.6 into your language by <a href=\"https://gamification.prestashop.com/get_advice_link.php?id_advice=353&url=http%3A%2F%2Fcrowdin.net%2Fproject%2Fprestashop-official%2F\">joining us on Crowdin</a>!\r\n		</span>\r\n<div style=\"display:none\"><img src=\"https://gamification.prestashop.com/api/getAdviceImg/353.png\" /></div>\r\n	</div>\r\n</div>\r\n</div>\r\n</div>'),(2,1,'<div id=\"wrap_id_advice_389\" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url(\"https://gamification.prestashop.com/images/interface/gamification-tip-bg.png\") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url(\"https://gamification.prestashop.com/images/interface/gamification-cta-bg.png\") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url(\"https://gamification.prestashop.com/images/interface/gamification-popin.png\") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png\") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-bullet-check.png\") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-close.png\") no-repeat}\n</style>\n<hr class=\"clear\"/>\n<div id=\"advice-16\">\n<div class=\"gamification-tip\">\n	<img style=\"display:none\" src=\"https://gamification.prestashop.com/api/getAdviceImg/389.png\" />\n	<div class=\"gamification-tip-title\">Advice</div>\n	<span class=\"gamification-tip-cta\"><a class=\"gamification_fancybox\"  id=\"389\" href=\"http://www.prestashop.com/club/?utm_source=back-office&utm_medium=gamification\" target=\"_blank\">Learn more</a><a class=\"gamification_close\" style=\"display:none\"  id=\"389\" href=\"#advice_content_389\">Close</a></span>\n	<div class=\"gamification-tip-description-container\">\n		<span class=\"gamification-tip-description\">\n			About to upgrade? How about giving your opinion on future releases before anyone else?		</span>\n	</div>\n</div>\n</div></div>'),(2,2,'<div id=\"wrap_id_advice_389\" ><style>\n.hide{display:none}.text-right{text-align:right}.text-left{text-align:left}.text-center{text-align:center}hr.clear{visibility:hidden;margin-bottom:20px}.gamification-tip{width:100%;height:40px;margin:0 0 20px 0;position:relative;line-height:43px;background-color:#f8f8f8;border-bottom:solid 5px #d2d2d2}.gamification-tip div.gamification-tip-title{position:absolute;top:0;left:0;height:40px;width:90px;padding:0 0 0 40px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") 10px 5px no-repeat;color:#556e26;font-size:14px;font-weight:bold}.gamification-tip div.gamification-tip-description-container{height:40px;padding:0 130px 0 130px;display:table-cell;vertical-align:middle;font-size:13px;color:#666666;background:url(\"https://gamification.prestashop.com/images/interface/gamification-tip-bg.png\") 100px top no-repeat}.gamification-tip div.gamification-tip-description-container span.gamification-tip-description{display:inline-block;line-height:15px;max-height:30px;overflow:hidden}.gamification-tip span.gamification-tip-cta{position:absolute;line-height:43px;height:40px;width:70px;top:0;right:0;padding:0 10px 0 30px;border-bottom:solid 5px #739334;background:url(\"https://gamification.prestashop.com/images/interface/gamification-cta-bg.png\") left top no-repeat #a6c964}.gamification-tip span.gamification-tip-cta a{display:inline-block;width:100%;font-size:14px;text-transform:uppercase;font-weight:bold;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;color:#556e26;background:url(\"https://gamification.prestashop.com/images/interface/gamification-popin.png\") right 10px no-repeat}.gamification-tip-infobox{padding:0 20px 20px 20px;position:relative}.gamification-tip-infobox .gamification-tip-infobox-title{display:inline-block;margin:0 0 20px -20px;width:100%;padding:10px 20px 5px;border-bottom:solid 3px #739334;font:800 18px/20px arial;text-transform:uppercase;color:#556e26;background-color:#e7f0d6}.gamification-tip-infobox .gamification-tip-infobox-title span.gamification-tip-infobox-title-prefix{display:inline-block;height:40px;padding-left:30px;line-height:40px;text-transform:none;font-size:16px;font-weight:500;margin-right:10px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-lightbulb.png\") left top no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content{display:block;width:100%}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-image{float:left;width:120px;height:200px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-separator.png\") no-repeat right center}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description{float:left;width:430px;padding:0 0 25px 25px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description p{line-height:20px}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-description ul li{padding:0 0 0 20px;line-height:25px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-bullet-check.png\") left center no-repeat}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls{padding:20px 0 0 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button{display:inline-block;height:30px;padding:0 20px;margin-right:10px;border:none;border-bottom:solid 3px #ababab;line-height:33px;text-transform:uppercase;font-weight:bold;color:#929292;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0;border-radius:3px;background:#d2d2d2}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button.success{color:#384819;background:#a6c964;border-color:#739334;text-shadow:rgba(255, 255, 255, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:hover{color:#f8f8f8;background:#5f5f5f;border-color:#2c2c2c;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox .gamification-tip-infobox-content .gamification-tip-infobox-content-controls a.button:active{color:white;background:#2c2c2c;border-color:black;text-shadow:rgba(0, 0, 0, 0.5) 0 1px 0}.gamification-tip-infobox a.infobox-close{display:inline-block;width:14px;height:14px;position:absolute;top:20px;right:20px;text-indent:-9999px;background:url(\"https://gamification.prestashop.com/images/interface/gamification-infobox-close.png\") no-repeat}\n</style>\n<hr class=\"clear\"/>\n<div id=\"advice-16\">\n<div class=\"gamification-tip\">\n	<img style=\"display:none\" src=\"https://gamification.prestashop.com/api/getAdviceImg/389.png\" />\n	<div class=\"gamification-tip-title\">Advice</div>\n	<span class=\"gamification-tip-cta\"><a class=\"gamification_fancybox\"  id=\"389\" href=\"http://www.prestashop.com/club/?utm_source=back-office&utm_medium=gamification\" target=\"_blank\">Learn more</a><a class=\"gamification_close\" style=\"display:none\"  id=\"389\" href=\"#advice_content_389\">Close</a></span>\n	<div class=\"gamification-tip-description-container\">\n		<span class=\"gamification-tip-description\">\n			About to upgrade? How about giving your opinion on future releases before anyone else?		</span>\n	</div>\n</div>\n</div></div>');
/*!40000 ALTER TABLE `tb_advice_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_alias`
--

DROP TABLE IF EXISTS `tb_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alias` (
  `id_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alias`
--

LOCK TABLES `tb_alias` WRITE;
/*!40000 ALTER TABLE `tb_alias` DISABLE KEYS */;
INSERT INTO `tb_alias` VALUES (1,'bloose','blouse',1),(2,'blues','blouse',1);
/*!40000 ALTER TABLE `tb_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attachment`
--

DROP TABLE IF EXISTS `tb_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(40) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `file_size` bigint(10) unsigned NOT NULL DEFAULT '0',
  `mime` varchar(128) NOT NULL,
  PRIMARY KEY (`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attachment`
--

LOCK TABLES `tb_attachment` WRITE;
/*!40000 ALTER TABLE `tb_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attachment_lang`
--

DROP TABLE IF EXISTS `tb_attachment_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attachment_lang` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id_attachment`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attachment_lang`
--

LOCK TABLES `tb_attachment_lang` WRITE;
/*!40000 ALTER TABLE `tb_attachment_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_attachment_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute`
--

DROP TABLE IF EXISTS `tb_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute` (
  `id_attribute` int(11) NOT NULL AUTO_INCREMENT,
  `id_attribute_group` int(11) NOT NULL,
  `color` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute`),
  KEY `attribute_group` (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute`
--

LOCK TABLES `tb_attribute` WRITE;
/*!40000 ALTER TABLE `tb_attribute` DISABLE KEYS */;
INSERT INTO `tb_attribute` VALUES (1,1,'',0),(2,1,'',1),(3,1,'',2),(4,1,'',3),(5,3,'#AAB2BD',0),(6,3,'#CFC4A6',1),(7,3,'#f5f5dc',2),(8,3,'#ffffff',3),(9,3,'#faebd7',4),(10,3,'#E84C3D',5),(11,3,'#434A54',6),(12,3,'#C19A6B',7),(13,3,'#F39C11',8),(14,3,'#5D9CEC',9),(15,3,'#A0D468',10),(16,3,'#F1C40F',11),(17,3,'#964B00',12),(18,2,'',0),(19,2,'',1),(20,2,'',2),(21,2,'',3),(22,2,'',4),(23,2,'',5),(24,3,'#FCCACD',13);
/*!40000 ALTER TABLE `tb_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute_group`
--

DROP TABLE IF EXISTS `tb_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute_group` (
  `id_attribute_group` int(11) NOT NULL AUTO_INCREMENT,
  `is_color_group` tinyint(1) NOT NULL,
  `group_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute_group`
--

LOCK TABLES `tb_attribute_group` WRITE;
/*!40000 ALTER TABLE `tb_attribute_group` DISABLE KEYS */;
INSERT INTO `tb_attribute_group` VALUES (1,0,'select',0),(2,0,'select',1),(3,1,'color',2);
/*!40000 ALTER TABLE `tb_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute_group_lang`
--

DROP TABLE IF EXISTS `tb_attribute_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute_group_lang` (
  `id_attribute_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `public_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`),
  KEY `IDX_F8D0FD7E67A664FB` (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute_group_lang`
--

LOCK TABLES `tb_attribute_group_lang` WRITE;
/*!40000 ALTER TABLE `tb_attribute_group_lang` DISABLE KEYS */;
INSERT INTO `tb_attribute_group_lang` VALUES (1,1,'Tamanho','Tamanho'),(1,2,'Tamanho','Tamanho'),(2,1,'Shoe Size','Tamanho'),(2,2,'Shoe Size','Tamanho'),(3,1,'Cor','Cor'),(3,2,'Cor','Cor');
/*!40000 ALTER TABLE `tb_attribute_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute_group_shop`
--

DROP TABLE IF EXISTS `tb_attribute_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute_group_shop` (
  `id_attribute_group` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_shop`),
  KEY `IDX_65B335BE67A664FB` (`id_attribute_group`),
  KEY `IDX_65B335BE274A50A0` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute_group_shop`
--

LOCK TABLES `tb_attribute_group_shop` WRITE;
/*!40000 ALTER TABLE `tb_attribute_group_shop` DISABLE KEYS */;
INSERT INTO `tb_attribute_group_shop` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `tb_attribute_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute_impact`
--

DROP TABLE IF EXISTS `tb_attribute_impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute_impact` (
  `id_attribute_impact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_attribute` int(11) unsigned NOT NULL,
  `weight` decimal(20,6) NOT NULL,
  `price` decimal(17,2) NOT NULL,
  PRIMARY KEY (`id_attribute_impact`),
  UNIQUE KEY `id_product` (`id_product`,`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute_impact`
--

LOCK TABLES `tb_attribute_impact` WRITE;
/*!40000 ALTER TABLE `tb_attribute_impact` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_attribute_impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute_lang`
--

DROP TABLE IF EXISTS `tb_attribute_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute_lang` (
  `id_attribute` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`),
  KEY `IDX_1F9CE677A4F53DC` (`id_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute_lang`
--

LOCK TABLES `tb_attribute_lang` WRITE;
/*!40000 ALTER TABLE `tb_attribute_lang` DISABLE KEYS */;
INSERT INTO `tb_attribute_lang` VALUES (1,1,'S'),(1,2,'S'),(2,1,'M'),(2,2,'M'),(3,1,'L'),(3,2,'L'),(4,1,'Um tamanho'),(4,2,'Um tamanho'),(5,1,'Cinzento'),(5,2,'Cinzento'),(6,1,' Cinzento-acastanhado'),(6,2,' Cinzento-acastanhado'),(7,1,'Bege'),(7,2,'Bege'),(8,1,'Branco'),(8,2,'Branco'),(9,1,'Branco sujo'),(9,2,'Branco sujo'),(10,1,'Vermelho'),(10,2,'Vermelho'),(11,1,'Preto'),(11,2,'Preto'),(12,1,'Camelo'),(12,2,'Camelo'),(13,1,'Laranja'),(13,2,'Laranja'),(14,1,'Azul'),(14,2,'Azul'),(15,1,'Verde'),(15,2,'Verde'),(16,1,'Amarelo'),(16,2,'Amarelo'),(17,1,'Castanho'),(17,2,'Castanho'),(18,1,'35'),(18,2,'35'),(19,1,'36'),(19,2,'36'),(20,1,'37'),(20,2,'37'),(21,1,'38'),(21,2,'38'),(22,1,'39'),(22,2,'39'),(23,1,'40'),(23,2,'40'),(24,1,'Rosa'),(24,2,'Rosa');
/*!40000 ALTER TABLE `tb_attribute_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_attribute_shop`
--

DROP TABLE IF EXISTS `tb_attribute_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_attribute_shop` (
  `id_attribute` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_shop`),
  KEY `IDX_9C9A06A77A4F53DC` (`id_attribute`),
  KEY `IDX_9C9A06A7274A50A0` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_attribute_shop`
--

LOCK TABLES `tb_attribute_shop` WRITE;
/*!40000 ALTER TABLE `tb_attribute_shop` DISABLE KEYS */;
INSERT INTO `tb_attribute_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1);
/*!40000 ALTER TABLE `tb_attribute_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_authorization_role`
--

DROP TABLE IF EXISTS `tb_authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_authorization_role` (
  `id_authorization_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id_authorization_role`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_authorization_role`
--

LOCK TABLES `tb_authorization_role` WRITE;
/*!40000 ALTER TABLE `tb_authorization_role` DISABLE KEYS */;
INSERT INTO `tb_authorization_role` VALUES (685,'ROLE_MOD_MODULE_BLOCKREASSURANCE_CREATE'),(688,'ROLE_MOD_MODULE_BLOCKREASSURANCE_DELETE'),(686,'ROLE_MOD_MODULE_BLOCKREASSURANCE_READ'),(687,'ROLE_MOD_MODULE_BLOCKREASSURANCE_UPDATE'),(673,'ROLE_MOD_MODULE_CRONJOBS_CREATE'),(676,'ROLE_MOD_MODULE_CRONJOBS_DELETE'),(674,'ROLE_MOD_MODULE_CRONJOBS_READ'),(675,'ROLE_MOD_MODULE_CRONJOBS_UPDATE'),(453,'ROLE_MOD_MODULE_DASHACTIVITY_CREATE'),(456,'ROLE_MOD_MODULE_DASHACTIVITY_DELETE'),(454,'ROLE_MOD_MODULE_DASHACTIVITY_READ'),(455,'ROLE_MOD_MODULE_DASHACTIVITY_UPDATE'),(465,'ROLE_MOD_MODULE_DASHGOALS_CREATE'),(468,'ROLE_MOD_MODULE_DASHGOALS_DELETE'),(466,'ROLE_MOD_MODULE_DASHGOALS_READ'),(467,'ROLE_MOD_MODULE_DASHGOALS_UPDATE'),(469,'ROLE_MOD_MODULE_DASHPRODUCTS_CREATE'),(472,'ROLE_MOD_MODULE_DASHPRODUCTS_DELETE'),(470,'ROLE_MOD_MODULE_DASHPRODUCTS_READ'),(471,'ROLE_MOD_MODULE_DASHPRODUCTS_UPDATE'),(457,'ROLE_MOD_MODULE_DASHTRENDS_CREATE'),(460,'ROLE_MOD_MODULE_DASHTRENDS_DELETE'),(458,'ROLE_MOD_MODULE_DASHTRENDS_READ'),(459,'ROLE_MOD_MODULE_DASHTRENDS_UPDATE'),(669,'ROLE_MOD_MODULE_GAMIFICATION_CREATE'),(672,'ROLE_MOD_MODULE_GAMIFICATION_DELETE'),(670,'ROLE_MOD_MODULE_GAMIFICATION_READ'),(671,'ROLE_MOD_MODULE_GAMIFICATION_UPDATE'),(473,'ROLE_MOD_MODULE_GRAPHNVD3_CREATE'),(476,'ROLE_MOD_MODULE_GRAPHNVD3_DELETE'),(474,'ROLE_MOD_MODULE_GRAPHNVD3_READ'),(475,'ROLE_MOD_MODULE_GRAPHNVD3_UPDATE'),(477,'ROLE_MOD_MODULE_GRIDHTML_CREATE'),(480,'ROLE_MOD_MODULE_GRIDHTML_DELETE'),(478,'ROLE_MOD_MODULE_GRIDHTML_READ'),(479,'ROLE_MOD_MODULE_GRIDHTML_UPDATE'),(565,'ROLE_MOD_MODULE_PAGESNOTFOUND_CREATE'),(568,'ROLE_MOD_MODULE_PAGESNOTFOUND_DELETE'),(566,'ROLE_MOD_MODULE_PAGESNOTFOUND_READ'),(567,'ROLE_MOD_MODULE_PAGESNOTFOUND_UPDATE'),(681,'ROLE_MOD_MODULE_PSADDONSCONNECT_CREATE'),(684,'ROLE_MOD_MODULE_PSADDONSCONNECT_DELETE'),(682,'ROLE_MOD_MODULE_PSADDONSCONNECT_READ'),(683,'ROLE_MOD_MODULE_PSADDONSCONNECT_UPDATE'),(481,'ROLE_MOD_MODULE_PS_BANNER_CREATE'),(484,'ROLE_MOD_MODULE_PS_BANNER_DELETE'),(482,'ROLE_MOD_MODULE_PS_BANNER_READ'),(483,'ROLE_MOD_MODULE_PS_BANNER_UPDATE'),(485,'ROLE_MOD_MODULE_PS_CATEGORYTREE_CREATE'),(488,'ROLE_MOD_MODULE_PS_CATEGORYTREE_DELETE'),(486,'ROLE_MOD_MODULE_PS_CATEGORYTREE_READ'),(487,'ROLE_MOD_MODULE_PS_CATEGORYTREE_UPDATE'),(489,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_CREATE'),(492,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_DELETE'),(490,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_READ'),(491,'ROLE_MOD_MODULE_PS_CHECKPAYMENT_UPDATE'),(493,'ROLE_MOD_MODULE_PS_CONTACTINFO_CREATE'),(496,'ROLE_MOD_MODULE_PS_CONTACTINFO_DELETE'),(494,'ROLE_MOD_MODULE_PS_CONTACTINFO_READ'),(495,'ROLE_MOD_MODULE_PS_CONTACTINFO_UPDATE'),(497,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_CREATE'),(500,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_DELETE'),(498,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_READ'),(499,'ROLE_MOD_MODULE_PS_CURRENCYSELECTOR_UPDATE'),(501,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_CREATE'),(504,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_DELETE'),(502,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_READ'),(503,'ROLE_MOD_MODULE_PS_CUSTOMERACCOUNTLINKS_UPDATE'),(505,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_CREATE'),(508,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_DELETE'),(506,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_READ'),(507,'ROLE_MOD_MODULE_PS_CUSTOMERSIGNIN_UPDATE'),(509,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_CREATE'),(512,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_DELETE'),(510,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_READ'),(511,'ROLE_MOD_MODULE_PS_CUSTOMTEXT_UPDATE'),(513,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_CREATE'),(516,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_DELETE'),(514,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_READ'),(515,'ROLE_MOD_MODULE_PS_EMAILSUBSCRIPTION_UPDATE'),(517,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_CREATE'),(520,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_DELETE'),(518,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_READ'),(519,'ROLE_MOD_MODULE_PS_FACETEDSEARCH_UPDATE'),(521,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_CREATE'),(524,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_DELETE'),(522,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_READ'),(523,'ROLE_MOD_MODULE_PS_FEATUREDPRODUCTS_UPDATE'),(525,'ROLE_MOD_MODULE_PS_IMAGESLIDER_CREATE'),(528,'ROLE_MOD_MODULE_PS_IMAGESLIDER_DELETE'),(526,'ROLE_MOD_MODULE_PS_IMAGESLIDER_READ'),(527,'ROLE_MOD_MODULE_PS_IMAGESLIDER_UPDATE'),(529,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_CREATE'),(532,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_DELETE'),(530,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_READ'),(531,'ROLE_MOD_MODULE_PS_LANGUAGESELECTOR_UPDATE'),(533,'ROLE_MOD_MODULE_PS_LINKLIST_CREATE'),(536,'ROLE_MOD_MODULE_PS_LINKLIST_DELETE'),(534,'ROLE_MOD_MODULE_PS_LINKLIST_READ'),(535,'ROLE_MOD_MODULE_PS_LINKLIST_UPDATE'),(541,'ROLE_MOD_MODULE_PS_MAINMENU_CREATE'),(544,'ROLE_MOD_MODULE_PS_MAINMENU_DELETE'),(542,'ROLE_MOD_MODULE_PS_MAINMENU_READ'),(543,'ROLE_MOD_MODULE_PS_MAINMENU_UPDATE'),(545,'ROLE_MOD_MODULE_PS_SEARCHBAR_CREATE'),(548,'ROLE_MOD_MODULE_PS_SEARCHBAR_DELETE'),(546,'ROLE_MOD_MODULE_PS_SEARCHBAR_READ'),(547,'ROLE_MOD_MODULE_PS_SEARCHBAR_UPDATE'),(549,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_CREATE'),(552,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_DELETE'),(550,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_READ'),(551,'ROLE_MOD_MODULE_PS_SHAREBUTTONS_UPDATE'),(553,'ROLE_MOD_MODULE_PS_SHOPPINGCART_CREATE'),(556,'ROLE_MOD_MODULE_PS_SHOPPINGCART_DELETE'),(554,'ROLE_MOD_MODULE_PS_SHOPPINGCART_READ'),(555,'ROLE_MOD_MODULE_PS_SHOPPINGCART_UPDATE'),(557,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_CREATE'),(560,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_DELETE'),(558,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_READ'),(559,'ROLE_MOD_MODULE_PS_SOCIALFOLLOW_UPDATE'),(561,'ROLE_MOD_MODULE_PS_WIREPAYMENT_CREATE'),(564,'ROLE_MOD_MODULE_PS_WIREPAYMENT_DELETE'),(562,'ROLE_MOD_MODULE_PS_WIREPAYMENT_READ'),(563,'ROLE_MOD_MODULE_PS_WIREPAYMENT_UPDATE'),(569,'ROLE_MOD_MODULE_SEKEYWORDS_CREATE'),(572,'ROLE_MOD_MODULE_SEKEYWORDS_DELETE'),(570,'ROLE_MOD_MODULE_SEKEYWORDS_READ'),(571,'ROLE_MOD_MODULE_SEKEYWORDS_UPDATE'),(573,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_CREATE'),(576,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_DELETE'),(574,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_READ'),(575,'ROLE_MOD_MODULE_STATSBESTCATEGORIES_UPDATE'),(577,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_CREATE'),(580,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_DELETE'),(578,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_READ'),(579,'ROLE_MOD_MODULE_STATSBESTCUSTOMERS_UPDATE'),(581,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_CREATE'),(584,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_DELETE'),(582,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_READ'),(583,'ROLE_MOD_MODULE_STATSBESTPRODUCTS_UPDATE'),(585,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_CREATE'),(588,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_DELETE'),(586,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_READ'),(587,'ROLE_MOD_MODULE_STATSBESTSUPPLIERS_UPDATE'),(589,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_CREATE'),(592,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_DELETE'),(590,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_READ'),(591,'ROLE_MOD_MODULE_STATSBESTVOUCHERS_UPDATE'),(593,'ROLE_MOD_MODULE_STATSCARRIER_CREATE'),(596,'ROLE_MOD_MODULE_STATSCARRIER_DELETE'),(594,'ROLE_MOD_MODULE_STATSCARRIER_READ'),(595,'ROLE_MOD_MODULE_STATSCARRIER_UPDATE'),(597,'ROLE_MOD_MODULE_STATSCATALOG_CREATE'),(600,'ROLE_MOD_MODULE_STATSCATALOG_DELETE'),(598,'ROLE_MOD_MODULE_STATSCATALOG_READ'),(599,'ROLE_MOD_MODULE_STATSCATALOG_UPDATE'),(601,'ROLE_MOD_MODULE_STATSCHECKUP_CREATE'),(604,'ROLE_MOD_MODULE_STATSCHECKUP_DELETE'),(602,'ROLE_MOD_MODULE_STATSCHECKUP_READ'),(603,'ROLE_MOD_MODULE_STATSCHECKUP_UPDATE'),(605,'ROLE_MOD_MODULE_STATSDATA_CREATE'),(608,'ROLE_MOD_MODULE_STATSDATA_DELETE'),(606,'ROLE_MOD_MODULE_STATSDATA_READ'),(607,'ROLE_MOD_MODULE_STATSDATA_UPDATE'),(609,'ROLE_MOD_MODULE_STATSEQUIPMENT_CREATE'),(612,'ROLE_MOD_MODULE_STATSEQUIPMENT_DELETE'),(610,'ROLE_MOD_MODULE_STATSEQUIPMENT_READ'),(611,'ROLE_MOD_MODULE_STATSEQUIPMENT_UPDATE'),(613,'ROLE_MOD_MODULE_STATSFORECAST_CREATE'),(616,'ROLE_MOD_MODULE_STATSFORECAST_DELETE'),(614,'ROLE_MOD_MODULE_STATSFORECAST_READ'),(615,'ROLE_MOD_MODULE_STATSFORECAST_UPDATE'),(617,'ROLE_MOD_MODULE_STATSLIVE_CREATE'),(620,'ROLE_MOD_MODULE_STATSLIVE_DELETE'),(618,'ROLE_MOD_MODULE_STATSLIVE_READ'),(619,'ROLE_MOD_MODULE_STATSLIVE_UPDATE'),(621,'ROLE_MOD_MODULE_STATSNEWSLETTER_CREATE'),(624,'ROLE_MOD_MODULE_STATSNEWSLETTER_DELETE'),(622,'ROLE_MOD_MODULE_STATSNEWSLETTER_READ'),(623,'ROLE_MOD_MODULE_STATSNEWSLETTER_UPDATE'),(625,'ROLE_MOD_MODULE_STATSORIGIN_CREATE'),(628,'ROLE_MOD_MODULE_STATSORIGIN_DELETE'),(626,'ROLE_MOD_MODULE_STATSORIGIN_READ'),(627,'ROLE_MOD_MODULE_STATSORIGIN_UPDATE'),(629,'ROLE_MOD_MODULE_STATSPERSONALINFOS_CREATE'),(632,'ROLE_MOD_MODULE_STATSPERSONALINFOS_DELETE'),(630,'ROLE_MOD_MODULE_STATSPERSONALINFOS_READ'),(631,'ROLE_MOD_MODULE_STATSPERSONALINFOS_UPDATE'),(633,'ROLE_MOD_MODULE_STATSPRODUCT_CREATE'),(636,'ROLE_MOD_MODULE_STATSPRODUCT_DELETE'),(634,'ROLE_MOD_MODULE_STATSPRODUCT_READ'),(635,'ROLE_MOD_MODULE_STATSPRODUCT_UPDATE'),(637,'ROLE_MOD_MODULE_STATSREGISTRATIONS_CREATE'),(640,'ROLE_MOD_MODULE_STATSREGISTRATIONS_DELETE'),(638,'ROLE_MOD_MODULE_STATSREGISTRATIONS_READ'),(639,'ROLE_MOD_MODULE_STATSREGISTRATIONS_UPDATE'),(641,'ROLE_MOD_MODULE_STATSSALES_CREATE'),(644,'ROLE_MOD_MODULE_STATSSALES_DELETE'),(642,'ROLE_MOD_MODULE_STATSSALES_READ'),(643,'ROLE_MOD_MODULE_STATSSALES_UPDATE'),(645,'ROLE_MOD_MODULE_STATSSEARCH_CREATE'),(648,'ROLE_MOD_MODULE_STATSSEARCH_DELETE'),(646,'ROLE_MOD_MODULE_STATSSEARCH_READ'),(647,'ROLE_MOD_MODULE_STATSSEARCH_UPDATE'),(649,'ROLE_MOD_MODULE_STATSSTOCK_CREATE'),(652,'ROLE_MOD_MODULE_STATSSTOCK_DELETE'),(650,'ROLE_MOD_MODULE_STATSSTOCK_READ'),(651,'ROLE_MOD_MODULE_STATSSTOCK_UPDATE'),(653,'ROLE_MOD_MODULE_STATSVISITS_CREATE'),(656,'ROLE_MOD_MODULE_STATSVISITS_DELETE'),(654,'ROLE_MOD_MODULE_STATSVISITS_READ'),(655,'ROLE_MOD_MODULE_STATSVISITS_UPDATE'),(657,'ROLE_MOD_MODULE_WELCOME_CREATE'),(660,'ROLE_MOD_MODULE_WELCOME_DELETE'),(658,'ROLE_MOD_MODULE_WELCOME_READ'),(659,'ROLE_MOD_MODULE_WELCOME_UPDATE'),(1,'ROLE_MOD_TAB_ADMINACCESS_CREATE'),(4,'ROLE_MOD_TAB_ADMINACCESS_DELETE'),(2,'ROLE_MOD_TAB_ADMINACCESS_READ'),(3,'ROLE_MOD_TAB_ADMINACCESS_UPDATE'),(5,'ROLE_MOD_TAB_ADMINADDONSCATALOG_CREATE'),(8,'ROLE_MOD_TAB_ADMINADDONSCATALOG_DELETE'),(6,'ROLE_MOD_TAB_ADMINADDONSCATALOG_READ'),(7,'ROLE_MOD_TAB_ADMINADDONSCATALOG_UPDATE'),(9,'ROLE_MOD_TAB_ADMINADDRESSES_CREATE'),(12,'ROLE_MOD_TAB_ADMINADDRESSES_DELETE'),(10,'ROLE_MOD_TAB_ADMINADDRESSES_READ'),(11,'ROLE_MOD_TAB_ADMINADDRESSES_UPDATE'),(13,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_CREATE'),(16,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_DELETE'),(14,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_READ'),(15,'ROLE_MOD_TAB_ADMINADMINPREFERENCES_UPDATE'),(17,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_CREATE'),(20,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_DELETE'),(18,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_READ'),(19,'ROLE_MOD_TAB_ADMINADVANCEDPARAMETERS_UPDATE'),(21,'ROLE_MOD_TAB_ADMINATTACHMENTS_CREATE'),(24,'ROLE_MOD_TAB_ADMINATTACHMENTS_DELETE'),(22,'ROLE_MOD_TAB_ADMINATTACHMENTS_READ'),(23,'ROLE_MOD_TAB_ADMINATTACHMENTS_UPDATE'),(25,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_CREATE'),(28,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_DELETE'),(26,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_READ'),(27,'ROLE_MOD_TAB_ADMINATTRIBUTESGROUPS_UPDATE'),(29,'ROLE_MOD_TAB_ADMINBACKUP_CREATE'),(32,'ROLE_MOD_TAB_ADMINBACKUP_DELETE'),(30,'ROLE_MOD_TAB_ADMINBACKUP_READ'),(31,'ROLE_MOD_TAB_ADMINBACKUP_UPDATE'),(33,'ROLE_MOD_TAB_ADMINCARRIERS_CREATE'),(36,'ROLE_MOD_TAB_ADMINCARRIERS_DELETE'),(34,'ROLE_MOD_TAB_ADMINCARRIERS_READ'),(35,'ROLE_MOD_TAB_ADMINCARRIERS_UPDATE'),(37,'ROLE_MOD_TAB_ADMINCARTRULES_CREATE'),(40,'ROLE_MOD_TAB_ADMINCARTRULES_DELETE'),(38,'ROLE_MOD_TAB_ADMINCARTRULES_READ'),(39,'ROLE_MOD_TAB_ADMINCARTRULES_UPDATE'),(41,'ROLE_MOD_TAB_ADMINCARTS_CREATE'),(44,'ROLE_MOD_TAB_ADMINCARTS_DELETE'),(42,'ROLE_MOD_TAB_ADMINCARTS_READ'),(43,'ROLE_MOD_TAB_ADMINCARTS_UPDATE'),(45,'ROLE_MOD_TAB_ADMINCATALOG_CREATE'),(48,'ROLE_MOD_TAB_ADMINCATALOG_DELETE'),(46,'ROLE_MOD_TAB_ADMINCATALOG_READ'),(47,'ROLE_MOD_TAB_ADMINCATALOG_UPDATE'),(49,'ROLE_MOD_TAB_ADMINCATEGORIES_CREATE'),(52,'ROLE_MOD_TAB_ADMINCATEGORIES_DELETE'),(50,'ROLE_MOD_TAB_ADMINCATEGORIES_READ'),(51,'ROLE_MOD_TAB_ADMINCATEGORIES_UPDATE'),(53,'ROLE_MOD_TAB_ADMINCMSCONTENT_CREATE'),(56,'ROLE_MOD_TAB_ADMINCMSCONTENT_DELETE'),(54,'ROLE_MOD_TAB_ADMINCMSCONTENT_READ'),(55,'ROLE_MOD_TAB_ADMINCMSCONTENT_UPDATE'),(57,'ROLE_MOD_TAB_ADMINCONTACTS_CREATE'),(60,'ROLE_MOD_TAB_ADMINCONTACTS_DELETE'),(58,'ROLE_MOD_TAB_ADMINCONTACTS_READ'),(59,'ROLE_MOD_TAB_ADMINCONTACTS_UPDATE'),(61,'ROLE_MOD_TAB_ADMINCOUNTRIES_CREATE'),(64,'ROLE_MOD_TAB_ADMINCOUNTRIES_DELETE'),(62,'ROLE_MOD_TAB_ADMINCOUNTRIES_READ'),(63,'ROLE_MOD_TAB_ADMINCOUNTRIES_UPDATE'),(677,'ROLE_MOD_TAB_ADMINCRONJOBS_CREATE'),(680,'ROLE_MOD_TAB_ADMINCRONJOBS_DELETE'),(678,'ROLE_MOD_TAB_ADMINCRONJOBS_READ'),(679,'ROLE_MOD_TAB_ADMINCRONJOBS_UPDATE'),(65,'ROLE_MOD_TAB_ADMINCURRENCIES_CREATE'),(68,'ROLE_MOD_TAB_ADMINCURRENCIES_DELETE'),(66,'ROLE_MOD_TAB_ADMINCURRENCIES_READ'),(67,'ROLE_MOD_TAB_ADMINCURRENCIES_UPDATE'),(69,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_CREATE'),(72,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_DELETE'),(70,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_READ'),(71,'ROLE_MOD_TAB_ADMINCUSTOMERPREFERENCES_UPDATE'),(73,'ROLE_MOD_TAB_ADMINCUSTOMERS_CREATE'),(76,'ROLE_MOD_TAB_ADMINCUSTOMERS_DELETE'),(74,'ROLE_MOD_TAB_ADMINCUSTOMERS_READ'),(75,'ROLE_MOD_TAB_ADMINCUSTOMERS_UPDATE'),(77,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_CREATE'),(80,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_DELETE'),(78,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_READ'),(79,'ROLE_MOD_TAB_ADMINCUSTOMERTHREADS_UPDATE'),(81,'ROLE_MOD_TAB_ADMINDASHBOARD_CREATE'),(84,'ROLE_MOD_TAB_ADMINDASHBOARD_DELETE'),(82,'ROLE_MOD_TAB_ADMINDASHBOARD_READ'),(83,'ROLE_MOD_TAB_ADMINDASHBOARD_UPDATE'),(461,'ROLE_MOD_TAB_ADMINDASHGOALS_CREATE'),(464,'ROLE_MOD_TAB_ADMINDASHGOALS_DELETE'),(462,'ROLE_MOD_TAB_ADMINDASHGOALS_READ'),(463,'ROLE_MOD_TAB_ADMINDASHGOALS_UPDATE'),(85,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_CREATE'),(88,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_DELETE'),(86,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_READ'),(87,'ROLE_MOD_TAB_ADMINDELIVERYSLIP_UPDATE'),(89,'ROLE_MOD_TAB_ADMINEMAILS_CREATE'),(92,'ROLE_MOD_TAB_ADMINEMAILS_DELETE'),(90,'ROLE_MOD_TAB_ADMINEMAILS_READ'),(91,'ROLE_MOD_TAB_ADMINEMAILS_UPDATE'),(93,'ROLE_MOD_TAB_ADMINEMPLOYEES_CREATE'),(96,'ROLE_MOD_TAB_ADMINEMPLOYEES_DELETE'),(94,'ROLE_MOD_TAB_ADMINEMPLOYEES_READ'),(95,'ROLE_MOD_TAB_ADMINEMPLOYEES_UPDATE'),(97,'ROLE_MOD_TAB_ADMINFEATURES_CREATE'),(100,'ROLE_MOD_TAB_ADMINFEATURES_DELETE'),(98,'ROLE_MOD_TAB_ADMINFEATURES_READ'),(99,'ROLE_MOD_TAB_ADMINFEATURES_UPDATE'),(665,'ROLE_MOD_TAB_ADMINGAMIFICATION_CREATE'),(668,'ROLE_MOD_TAB_ADMINGAMIFICATION_DELETE'),(666,'ROLE_MOD_TAB_ADMINGAMIFICATION_READ'),(667,'ROLE_MOD_TAB_ADMINGAMIFICATION_UPDATE'),(101,'ROLE_MOD_TAB_ADMINGENDERS_CREATE'),(104,'ROLE_MOD_TAB_ADMINGENDERS_DELETE'),(102,'ROLE_MOD_TAB_ADMINGENDERS_READ'),(103,'ROLE_MOD_TAB_ADMINGENDERS_UPDATE'),(105,'ROLE_MOD_TAB_ADMINGEOLOCATION_CREATE'),(108,'ROLE_MOD_TAB_ADMINGEOLOCATION_DELETE'),(106,'ROLE_MOD_TAB_ADMINGEOLOCATION_READ'),(107,'ROLE_MOD_TAB_ADMINGEOLOCATION_UPDATE'),(109,'ROLE_MOD_TAB_ADMINGROUPS_CREATE'),(112,'ROLE_MOD_TAB_ADMINGROUPS_DELETE'),(110,'ROLE_MOD_TAB_ADMINGROUPS_READ'),(111,'ROLE_MOD_TAB_ADMINGROUPS_UPDATE'),(113,'ROLE_MOD_TAB_ADMINIMAGES_CREATE'),(116,'ROLE_MOD_TAB_ADMINIMAGES_DELETE'),(114,'ROLE_MOD_TAB_ADMINIMAGES_READ'),(115,'ROLE_MOD_TAB_ADMINIMAGES_UPDATE'),(117,'ROLE_MOD_TAB_ADMINIMPORT_CREATE'),(120,'ROLE_MOD_TAB_ADMINIMPORT_DELETE'),(118,'ROLE_MOD_TAB_ADMINIMPORT_READ'),(119,'ROLE_MOD_TAB_ADMINIMPORT_UPDATE'),(121,'ROLE_MOD_TAB_ADMININFORMATION_CREATE'),(124,'ROLE_MOD_TAB_ADMININFORMATION_DELETE'),(122,'ROLE_MOD_TAB_ADMININFORMATION_READ'),(123,'ROLE_MOD_TAB_ADMININFORMATION_UPDATE'),(125,'ROLE_MOD_TAB_ADMININTERNATIONAL_CREATE'),(128,'ROLE_MOD_TAB_ADMININTERNATIONAL_DELETE'),(126,'ROLE_MOD_TAB_ADMININTERNATIONAL_READ'),(127,'ROLE_MOD_TAB_ADMININTERNATIONAL_UPDATE'),(129,'ROLE_MOD_TAB_ADMININVOICES_CREATE'),(132,'ROLE_MOD_TAB_ADMININVOICES_DELETE'),(130,'ROLE_MOD_TAB_ADMININVOICES_READ'),(131,'ROLE_MOD_TAB_ADMININVOICES_UPDATE'),(133,'ROLE_MOD_TAB_ADMINLANGUAGES_CREATE'),(136,'ROLE_MOD_TAB_ADMINLANGUAGES_DELETE'),(134,'ROLE_MOD_TAB_ADMINLANGUAGES_READ'),(135,'ROLE_MOD_TAB_ADMINLANGUAGES_UPDATE'),(137,'ROLE_MOD_TAB_ADMINLINKWIDGET_CREATE'),(140,'ROLE_MOD_TAB_ADMINLINKWIDGET_DELETE'),(138,'ROLE_MOD_TAB_ADMINLINKWIDGET_READ'),(139,'ROLE_MOD_TAB_ADMINLINKWIDGET_UPDATE'),(141,'ROLE_MOD_TAB_ADMINLOCALIZATION_CREATE'),(144,'ROLE_MOD_TAB_ADMINLOCALIZATION_DELETE'),(142,'ROLE_MOD_TAB_ADMINLOCALIZATION_READ'),(143,'ROLE_MOD_TAB_ADMINLOCALIZATION_UPDATE'),(145,'ROLE_MOD_TAB_ADMINLOGS_CREATE'),(148,'ROLE_MOD_TAB_ADMINLOGS_DELETE'),(146,'ROLE_MOD_TAB_ADMINLOGS_READ'),(147,'ROLE_MOD_TAB_ADMINLOGS_UPDATE'),(149,'ROLE_MOD_TAB_ADMINMAINTENANCE_CREATE'),(152,'ROLE_MOD_TAB_ADMINMAINTENANCE_DELETE'),(150,'ROLE_MOD_TAB_ADMINMAINTENANCE_READ'),(151,'ROLE_MOD_TAB_ADMINMAINTENANCE_UPDATE'),(153,'ROLE_MOD_TAB_ADMINMANUFACTURERS_CREATE'),(156,'ROLE_MOD_TAB_ADMINMANUFACTURERS_DELETE'),(154,'ROLE_MOD_TAB_ADMINMANUFACTURERS_READ'),(155,'ROLE_MOD_TAB_ADMINMANUFACTURERS_UPDATE'),(157,'ROLE_MOD_TAB_ADMINMETA_CREATE'),(160,'ROLE_MOD_TAB_ADMINMETA_DELETE'),(158,'ROLE_MOD_TAB_ADMINMETA_READ'),(159,'ROLE_MOD_TAB_ADMINMETA_UPDATE'),(165,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_CREATE'),(168,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_DELETE'),(166,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_READ'),(167,'ROLE_MOD_TAB_ADMINMODULESPOSITIONS_UPDATE'),(169,'ROLE_MOD_TAB_ADMINMODULESSF_CREATE'),(172,'ROLE_MOD_TAB_ADMINMODULESSF_DELETE'),(170,'ROLE_MOD_TAB_ADMINMODULESSF_READ'),(171,'ROLE_MOD_TAB_ADMINMODULESSF_UPDATE'),(161,'ROLE_MOD_TAB_ADMINMODULES_CREATE'),(164,'ROLE_MOD_TAB_ADMINMODULES_DELETE'),(162,'ROLE_MOD_TAB_ADMINMODULES_READ'),(163,'ROLE_MOD_TAB_ADMINMODULES_UPDATE'),(173,'ROLE_MOD_TAB_ADMINORDERMESSAGE_CREATE'),(176,'ROLE_MOD_TAB_ADMINORDERMESSAGE_DELETE'),(174,'ROLE_MOD_TAB_ADMINORDERMESSAGE_READ'),(175,'ROLE_MOD_TAB_ADMINORDERMESSAGE_UPDATE'),(177,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_CREATE'),(180,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_DELETE'),(178,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_READ'),(179,'ROLE_MOD_TAB_ADMINORDERPREFERENCES_UPDATE'),(181,'ROLE_MOD_TAB_ADMINORDERS_CREATE'),(184,'ROLE_MOD_TAB_ADMINORDERS_DELETE'),(182,'ROLE_MOD_TAB_ADMINORDERS_READ'),(183,'ROLE_MOD_TAB_ADMINORDERS_UPDATE'),(185,'ROLE_MOD_TAB_ADMINOUTSTANDING_CREATE'),(188,'ROLE_MOD_TAB_ADMINOUTSTANDING_DELETE'),(186,'ROLE_MOD_TAB_ADMINOUTSTANDING_READ'),(187,'ROLE_MOD_TAB_ADMINOUTSTANDING_UPDATE'),(189,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_CREATE'),(192,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_DELETE'),(190,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_READ'),(191,'ROLE_MOD_TAB_ADMINPARENTATTRIBUTESGROUPS_UPDATE'),(193,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_CREATE'),(196,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_DELETE'),(194,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_READ'),(195,'ROLE_MOD_TAB_ADMINPARENTCARTRULES_UPDATE'),(197,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_CREATE'),(200,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_DELETE'),(198,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_READ'),(199,'ROLE_MOD_TAB_ADMINPARENTCOUNTRIES_UPDATE'),(205,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_CREATE'),(208,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_DELETE'),(206,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_READ'),(207,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERPREFERENCES_UPDATE'),(209,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_CREATE'),(212,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_DELETE'),(210,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_READ'),(211,'ROLE_MOD_TAB_ADMINPARENTCUSTOMERTHREADS_UPDATE'),(201,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_CREATE'),(204,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_DELETE'),(202,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_READ'),(203,'ROLE_MOD_TAB_ADMINPARENTCUSTOMER_UPDATE'),(213,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_CREATE'),(216,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_DELETE'),(214,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_READ'),(215,'ROLE_MOD_TAB_ADMINPARENTEMPLOYEES_UPDATE'),(217,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_CREATE'),(220,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_DELETE'),(218,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_READ'),(219,'ROLE_MOD_TAB_ADMINPARENTLOCALIZATION_UPDATE'),(221,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_CREATE'),(224,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_DELETE'),(222,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_READ'),(223,'ROLE_MOD_TAB_ADMINPARENTMANUFACTURERS_UPDATE'),(229,'ROLE_MOD_TAB_ADMINPARENTMETA_CREATE'),(232,'ROLE_MOD_TAB_ADMINPARENTMETA_DELETE'),(230,'ROLE_MOD_TAB_ADMINPARENTMETA_READ'),(231,'ROLE_MOD_TAB_ADMINPARENTMETA_UPDATE'),(225,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_CREATE'),(228,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_DELETE'),(226,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_READ'),(227,'ROLE_MOD_TAB_ADMINPARENTMODULESSF_UPDATE'),(233,'ROLE_MOD_TAB_ADMINPARENTMODULES_CREATE'),(236,'ROLE_MOD_TAB_ADMINPARENTMODULES_DELETE'),(234,'ROLE_MOD_TAB_ADMINPARENTMODULES_READ'),(235,'ROLE_MOD_TAB_ADMINPARENTMODULES_UPDATE'),(237,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_CREATE'),(240,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_DELETE'),(238,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_READ'),(239,'ROLE_MOD_TAB_ADMINPARENTORDERPREFERENCES_UPDATE'),(241,'ROLE_MOD_TAB_ADMINPARENTORDERS_CREATE'),(244,'ROLE_MOD_TAB_ADMINPARENTORDERS_DELETE'),(242,'ROLE_MOD_TAB_ADMINPARENTORDERS_READ'),(243,'ROLE_MOD_TAB_ADMINPARENTORDERS_UPDATE'),(245,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_CREATE'),(248,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_DELETE'),(246,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_READ'),(247,'ROLE_MOD_TAB_ADMINPARENTPAYMENT_UPDATE'),(249,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_CREATE'),(252,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_DELETE'),(250,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_READ'),(251,'ROLE_MOD_TAB_ADMINPARENTPREFERENCES_UPDATE'),(253,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_CREATE'),(256,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_DELETE'),(254,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_READ'),(255,'ROLE_MOD_TAB_ADMINPARENTREQUESTSQL_UPDATE'),(257,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_CREATE'),(260,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_DELETE'),(258,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_READ'),(259,'ROLE_MOD_TAB_ADMINPARENTSEARCHCONF_UPDATE'),(261,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_CREATE'),(264,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_DELETE'),(262,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_READ'),(263,'ROLE_MOD_TAB_ADMINPARENTSHIPPING_UPDATE'),(265,'ROLE_MOD_TAB_ADMINPARENTSTOCKMANAGEMENT_CREATE'),(268,'ROLE_MOD_TAB_ADMINPARENTSTOCKMANAGEMENT_DELETE'),(266,'ROLE_MOD_TAB_ADMINPARENTSTOCKMANAGEMENT_READ'),(267,'ROLE_MOD_TAB_ADMINPARENTSTOCKMANAGEMENT_UPDATE'),(269,'ROLE_MOD_TAB_ADMINPARENTSTORES_CREATE'),(272,'ROLE_MOD_TAB_ADMINPARENTSTORES_DELETE'),(270,'ROLE_MOD_TAB_ADMINPARENTSTORES_READ'),(271,'ROLE_MOD_TAB_ADMINPARENTSTORES_UPDATE'),(273,'ROLE_MOD_TAB_ADMINPARENTTAXES_CREATE'),(276,'ROLE_MOD_TAB_ADMINPARENTTAXES_DELETE'),(274,'ROLE_MOD_TAB_ADMINPARENTTAXES_READ'),(275,'ROLE_MOD_TAB_ADMINPARENTTAXES_UPDATE'),(277,'ROLE_MOD_TAB_ADMINPARENTTHEMES_CREATE'),(280,'ROLE_MOD_TAB_ADMINPARENTTHEMES_DELETE'),(278,'ROLE_MOD_TAB_ADMINPARENTTHEMES_READ'),(279,'ROLE_MOD_TAB_ADMINPARENTTHEMES_UPDATE'),(285,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_CREATE'),(288,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_DELETE'),(286,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_READ'),(287,'ROLE_MOD_TAB_ADMINPAYMENTPREFERENCES_UPDATE'),(281,'ROLE_MOD_TAB_ADMINPAYMENT_CREATE'),(284,'ROLE_MOD_TAB_ADMINPAYMENT_DELETE'),(282,'ROLE_MOD_TAB_ADMINPAYMENT_READ'),(283,'ROLE_MOD_TAB_ADMINPAYMENT_UPDATE'),(289,'ROLE_MOD_TAB_ADMINPERFORMANCE_CREATE'),(292,'ROLE_MOD_TAB_ADMINPERFORMANCE_DELETE'),(290,'ROLE_MOD_TAB_ADMINPERFORMANCE_READ'),(291,'ROLE_MOD_TAB_ADMINPERFORMANCE_UPDATE'),(293,'ROLE_MOD_TAB_ADMINPPREFERENCES_CREATE'),(296,'ROLE_MOD_TAB_ADMINPPREFERENCES_DELETE'),(294,'ROLE_MOD_TAB_ADMINPPREFERENCES_READ'),(295,'ROLE_MOD_TAB_ADMINPPREFERENCES_UPDATE'),(297,'ROLE_MOD_TAB_ADMINPREFERENCES_CREATE'),(300,'ROLE_MOD_TAB_ADMINPREFERENCES_DELETE'),(298,'ROLE_MOD_TAB_ADMINPREFERENCES_READ'),(299,'ROLE_MOD_TAB_ADMINPREFERENCES_UPDATE'),(301,'ROLE_MOD_TAB_ADMINPRODUCTS_CREATE'),(304,'ROLE_MOD_TAB_ADMINPRODUCTS_DELETE'),(302,'ROLE_MOD_TAB_ADMINPRODUCTS_READ'),(303,'ROLE_MOD_TAB_ADMINPRODUCTS_UPDATE'),(305,'ROLE_MOD_TAB_ADMINPROFILES_CREATE'),(308,'ROLE_MOD_TAB_ADMINPROFILES_DELETE'),(306,'ROLE_MOD_TAB_ADMINPROFILES_READ'),(307,'ROLE_MOD_TAB_ADMINPROFILES_UPDATE'),(309,'ROLE_MOD_TAB_ADMINREFERRERS_CREATE'),(312,'ROLE_MOD_TAB_ADMINREFERRERS_DELETE'),(310,'ROLE_MOD_TAB_ADMINREFERRERS_READ'),(311,'ROLE_MOD_TAB_ADMINREFERRERS_UPDATE'),(313,'ROLE_MOD_TAB_ADMINREQUESTSQL_CREATE'),(316,'ROLE_MOD_TAB_ADMINREQUESTSQL_DELETE'),(314,'ROLE_MOD_TAB_ADMINREQUESTSQL_READ'),(315,'ROLE_MOD_TAB_ADMINREQUESTSQL_UPDATE'),(317,'ROLE_MOD_TAB_ADMINRETURN_CREATE'),(320,'ROLE_MOD_TAB_ADMINRETURN_DELETE'),(318,'ROLE_MOD_TAB_ADMINRETURN_READ'),(319,'ROLE_MOD_TAB_ADMINRETURN_UPDATE'),(321,'ROLE_MOD_TAB_ADMINSEARCHCONF_CREATE'),(324,'ROLE_MOD_TAB_ADMINSEARCHCONF_DELETE'),(322,'ROLE_MOD_TAB_ADMINSEARCHCONF_READ'),(323,'ROLE_MOD_TAB_ADMINSEARCHCONF_UPDATE'),(325,'ROLE_MOD_TAB_ADMINSEARCHENGINES_CREATE'),(328,'ROLE_MOD_TAB_ADMINSEARCHENGINES_DELETE'),(326,'ROLE_MOD_TAB_ADMINSEARCHENGINES_READ'),(327,'ROLE_MOD_TAB_ADMINSEARCHENGINES_UPDATE'),(329,'ROLE_MOD_TAB_ADMINSHIPPING_CREATE'),(332,'ROLE_MOD_TAB_ADMINSHIPPING_DELETE'),(330,'ROLE_MOD_TAB_ADMINSHIPPING_READ'),(331,'ROLE_MOD_TAB_ADMINSHIPPING_UPDATE'),(333,'ROLE_MOD_TAB_ADMINSHOPGROUP_CREATE'),(336,'ROLE_MOD_TAB_ADMINSHOPGROUP_DELETE'),(334,'ROLE_MOD_TAB_ADMINSHOPGROUP_READ'),(335,'ROLE_MOD_TAB_ADMINSHOPGROUP_UPDATE'),(337,'ROLE_MOD_TAB_ADMINSHOPURL_CREATE'),(340,'ROLE_MOD_TAB_ADMINSHOPURL_DELETE'),(338,'ROLE_MOD_TAB_ADMINSHOPURL_READ'),(339,'ROLE_MOD_TAB_ADMINSHOPURL_UPDATE'),(341,'ROLE_MOD_TAB_ADMINSLIP_CREATE'),(344,'ROLE_MOD_TAB_ADMINSLIP_DELETE'),(342,'ROLE_MOD_TAB_ADMINSLIP_READ'),(343,'ROLE_MOD_TAB_ADMINSLIP_UPDATE'),(345,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_CREATE'),(348,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_DELETE'),(346,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_READ'),(347,'ROLE_MOD_TAB_ADMINSPECIFICPRICERULE_UPDATE'),(349,'ROLE_MOD_TAB_ADMINSTATES_CREATE'),(352,'ROLE_MOD_TAB_ADMINSTATES_DELETE'),(350,'ROLE_MOD_TAB_ADMINSTATES_READ'),(351,'ROLE_MOD_TAB_ADMINSTATES_UPDATE'),(353,'ROLE_MOD_TAB_ADMINSTATS_CREATE'),(356,'ROLE_MOD_TAB_ADMINSTATS_DELETE'),(354,'ROLE_MOD_TAB_ADMINSTATS_READ'),(355,'ROLE_MOD_TAB_ADMINSTATS_UPDATE'),(357,'ROLE_MOD_TAB_ADMINSTATUSES_CREATE'),(360,'ROLE_MOD_TAB_ADMINSTATUSES_DELETE'),(358,'ROLE_MOD_TAB_ADMINSTATUSES_READ'),(359,'ROLE_MOD_TAB_ADMINSTATUSES_UPDATE'),(365,'ROLE_MOD_TAB_ADMINSTOCKCONFIGURATION_CREATE'),(368,'ROLE_MOD_TAB_ADMINSTOCKCONFIGURATION_DELETE'),(366,'ROLE_MOD_TAB_ADMINSTOCKCONFIGURATION_READ'),(367,'ROLE_MOD_TAB_ADMINSTOCKCONFIGURATION_UPDATE'),(369,'ROLE_MOD_TAB_ADMINSTOCKCOVER_CREATE'),(372,'ROLE_MOD_TAB_ADMINSTOCKCOVER_DELETE'),(370,'ROLE_MOD_TAB_ADMINSTOCKCOVER_READ'),(371,'ROLE_MOD_TAB_ADMINSTOCKCOVER_UPDATE'),(373,'ROLE_MOD_TAB_ADMINSTOCKINSTANTSTATE_CREATE'),(376,'ROLE_MOD_TAB_ADMINSTOCKINSTANTSTATE_DELETE'),(374,'ROLE_MOD_TAB_ADMINSTOCKINSTANTSTATE_READ'),(375,'ROLE_MOD_TAB_ADMINSTOCKINSTANTSTATE_UPDATE'),(377,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_CREATE'),(380,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_DELETE'),(378,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_READ'),(379,'ROLE_MOD_TAB_ADMINSTOCKMANAGEMENT_UPDATE'),(381,'ROLE_MOD_TAB_ADMINSTOCKMVT_CREATE'),(384,'ROLE_MOD_TAB_ADMINSTOCKMVT_DELETE'),(382,'ROLE_MOD_TAB_ADMINSTOCKMVT_READ'),(383,'ROLE_MOD_TAB_ADMINSTOCKMVT_UPDATE'),(361,'ROLE_MOD_TAB_ADMINSTOCK_CREATE'),(364,'ROLE_MOD_TAB_ADMINSTOCK_DELETE'),(362,'ROLE_MOD_TAB_ADMINSTOCK_READ'),(363,'ROLE_MOD_TAB_ADMINSTOCK_UPDATE'),(385,'ROLE_MOD_TAB_ADMINSTORES_CREATE'),(388,'ROLE_MOD_TAB_ADMINSTORES_DELETE'),(386,'ROLE_MOD_TAB_ADMINSTORES_READ'),(387,'ROLE_MOD_TAB_ADMINSTORES_UPDATE'),(389,'ROLE_MOD_TAB_ADMINSUPPLIERS_CREATE'),(392,'ROLE_MOD_TAB_ADMINSUPPLIERS_DELETE'),(390,'ROLE_MOD_TAB_ADMINSUPPLIERS_READ'),(391,'ROLE_MOD_TAB_ADMINSUPPLIERS_UPDATE'),(393,'ROLE_MOD_TAB_ADMINSUPPLYORDERS_CREATE'),(396,'ROLE_MOD_TAB_ADMINSUPPLYORDERS_DELETE'),(394,'ROLE_MOD_TAB_ADMINSUPPLYORDERS_READ'),(395,'ROLE_MOD_TAB_ADMINSUPPLYORDERS_UPDATE'),(397,'ROLE_MOD_TAB_ADMINTAGS_CREATE'),(400,'ROLE_MOD_TAB_ADMINTAGS_DELETE'),(398,'ROLE_MOD_TAB_ADMINTAGS_READ'),(399,'ROLE_MOD_TAB_ADMINTAGS_UPDATE'),(401,'ROLE_MOD_TAB_ADMINTAXES_CREATE'),(404,'ROLE_MOD_TAB_ADMINTAXES_DELETE'),(402,'ROLE_MOD_TAB_ADMINTAXES_READ'),(403,'ROLE_MOD_TAB_ADMINTAXES_UPDATE'),(405,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_CREATE'),(408,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_DELETE'),(406,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_READ'),(407,'ROLE_MOD_TAB_ADMINTAXRULESGROUP_UPDATE'),(413,'ROLE_MOD_TAB_ADMINTHEMESCATALOG_CREATE'),(416,'ROLE_MOD_TAB_ADMINTHEMESCATALOG_DELETE'),(414,'ROLE_MOD_TAB_ADMINTHEMESCATALOG_READ'),(415,'ROLE_MOD_TAB_ADMINTHEMESCATALOG_UPDATE'),(409,'ROLE_MOD_TAB_ADMINTHEMES_CREATE'),(412,'ROLE_MOD_TAB_ADMINTHEMES_DELETE'),(410,'ROLE_MOD_TAB_ADMINTHEMES_READ'),(411,'ROLE_MOD_TAB_ADMINTHEMES_UPDATE'),(417,'ROLE_MOD_TAB_ADMINTRACKING_CREATE'),(420,'ROLE_MOD_TAB_ADMINTRACKING_DELETE'),(418,'ROLE_MOD_TAB_ADMINTRACKING_READ'),(419,'ROLE_MOD_TAB_ADMINTRACKING_UPDATE'),(421,'ROLE_MOD_TAB_ADMINTRANSLATIONS_CREATE'),(424,'ROLE_MOD_TAB_ADMINTRANSLATIONS_DELETE'),(422,'ROLE_MOD_TAB_ADMINTRANSLATIONS_READ'),(423,'ROLE_MOD_TAB_ADMINTRANSLATIONS_UPDATE'),(425,'ROLE_MOD_TAB_ADMINWAREHOUSES_CREATE'),(428,'ROLE_MOD_TAB_ADMINWAREHOUSES_DELETE'),(426,'ROLE_MOD_TAB_ADMINWAREHOUSES_READ'),(427,'ROLE_MOD_TAB_ADMINWAREHOUSES_UPDATE'),(429,'ROLE_MOD_TAB_ADMINWEBSERVICE_CREATE'),(432,'ROLE_MOD_TAB_ADMINWEBSERVICE_DELETE'),(430,'ROLE_MOD_TAB_ADMINWEBSERVICE_READ'),(431,'ROLE_MOD_TAB_ADMINWEBSERVICE_UPDATE'),(661,'ROLE_MOD_TAB_ADMINWELCOME_CREATE'),(664,'ROLE_MOD_TAB_ADMINWELCOME_DELETE'),(662,'ROLE_MOD_TAB_ADMINWELCOME_READ'),(663,'ROLE_MOD_TAB_ADMINWELCOME_UPDATE'),(433,'ROLE_MOD_TAB_ADMINZONES_CREATE'),(436,'ROLE_MOD_TAB_ADMINZONES_DELETE'),(434,'ROLE_MOD_TAB_ADMINZONES_READ'),(435,'ROLE_MOD_TAB_ADMINZONES_UPDATE'),(437,'ROLE_MOD_TAB_CONFIGURE_CREATE'),(440,'ROLE_MOD_TAB_CONFIGURE_DELETE'),(438,'ROLE_MOD_TAB_CONFIGURE_READ'),(439,'ROLE_MOD_TAB_CONFIGURE_UPDATE'),(441,'ROLE_MOD_TAB_IMPROVE_CREATE'),(444,'ROLE_MOD_TAB_IMPROVE_DELETE'),(442,'ROLE_MOD_TAB_IMPROVE_READ'),(443,'ROLE_MOD_TAB_IMPROVE_UPDATE'),(445,'ROLE_MOD_TAB_SELL_CREATE'),(448,'ROLE_MOD_TAB_SELL_DELETE'),(446,'ROLE_MOD_TAB_SELL_READ'),(447,'ROLE_MOD_TAB_SELL_UPDATE'),(449,'ROLE_MOD_TAB_SHOPPARAMETERS_CREATE'),(452,'ROLE_MOD_TAB_SHOPPARAMETERS_DELETE'),(450,'ROLE_MOD_TAB_SHOPPARAMETERS_READ'),(451,'ROLE_MOD_TAB_SHOPPARAMETERS_UPDATE');
/*!40000 ALTER TABLE `tb_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_badge`
--

DROP TABLE IF EXISTS `tb_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_badge` (
  `id_badge` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_badge` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `id_group` int(11) NOT NULL,
  `group_position` int(11) NOT NULL,
  `scoring` int(11) NOT NULL,
  `awb` int(11) DEFAULT '0',
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_badge`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_badge`
--

LOCK TABLES `tb_badge` WRITE;
/*!40000 ALTER TABLE `tb_badge` DISABLE KEYS */;
INSERT INTO `tb_badge` VALUES (1,159,'feature',41,1,5,1,0),(2,160,'feature',41,2,10,1,0),(3,161,'feature',41,3,15,1,0),(4,162,'feature',41,4,20,1,0),(5,163,'feature',41,1,5,1,0),(6,164,'feature',41,2,10,1,0),(7,165,'feature',41,3,15,1,0),(8,166,'feature',41,4,20,1,0),(9,233,'feature',41,1,5,1,0),(10,234,'feature',41,2,10,1,0),(11,235,'feature',41,3,15,1,0),(12,236,'feature',41,4,20,1,0),(13,249,'feature',41,1,5,1,0),(14,250,'feature',41,2,10,1,0),(15,251,'feature',41,3,15,1,0),(16,252,'feature',41,4,20,1,0),(17,253,'feature',41,1,5,1,0),(18,254,'feature',41,2,10,1,0),(19,255,'feature',41,3,15,1,0),(20,256,'feature',41,4,20,1,0),(21,261,'feature',41,1,5,1,0),(22,262,'feature',41,2,10,1,0),(23,269,'feature',41,1,5,1,0),(24,270,'feature',41,2,10,1,0),(25,271,'feature',41,3,15,1,0),(26,272,'feature',41,4,20,1,0),(27,273,'feature',41,1,5,1,0),(28,274,'feature',41,2,10,1,0),(29,275,'feature',41,3,15,1,0),(30,276,'feature',41,4,20,1,0),(31,277,'feature',41,1,5,1,0),(32,278,'feature',41,2,10,1,0),(33,279,'feature',41,3,15,1,0),(34,280,'feature',41,4,20,1,0),(35,281,'feature',41,1,5,1,0),(36,282,'feature',41,2,10,1,0),(37,283,'feature',41,3,15,1,0),(38,284,'feature',41,4,20,1,0),(39,285,'feature',41,1,5,1,0),(40,286,'feature',41,2,10,1,0),(41,287,'feature',41,3,15,1,0),(42,288,'feature',41,4,20,1,0),(43,289,'feature',41,1,5,1,0),(44,290,'feature',41,2,10,1,0),(45,291,'feature',41,3,15,1,0),(46,292,'feature',41,4,20,1,0),(47,293,'feature',41,1,5,1,0),(48,294,'feature',41,2,10,1,0),(49,295,'feature',41,3,15,1,0),(50,296,'feature',41,4,20,1,0),(51,297,'feature',41,1,5,1,0),(52,298,'feature',41,2,10,1,0),(53,299,'feature',41,3,15,1,0),(54,300,'feature',41,4,20,1,0),(55,301,'feature',41,1,5,1,0),(56,302,'feature',41,2,10,1,0),(57,303,'feature',41,3,15,1,0),(58,304,'feature',41,4,20,1,0),(59,305,'feature',41,1,5,1,0),(60,306,'feature',41,2,10,1,0),(61,307,'feature',41,3,15,1,0),(62,308,'feature',41,4,20,1,0),(63,309,'feature',41,1,5,1,0),(64,310,'feature',41,2,10,1,0),(65,311,'feature',41,3,15,1,0),(66,312,'feature',41,4,20,1,0),(67,313,'feature',41,1,5,1,0),(68,314,'feature',41,2,10,1,0),(69,315,'feature',41,3,15,1,0),(70,316,'feature',41,4,20,1,0),(71,317,'feature',41,1,5,1,0),(72,318,'feature',41,2,10,1,0),(73,319,'feature',41,3,15,1,0),(74,320,'feature',41,4,20,1,0),(75,321,'feature',41,1,5,1,0),(76,322,'feature',41,2,10,1,0),(77,323,'feature',41,3,15,1,0),(78,324,'feature',41,4,20,1,0),(79,325,'feature',41,1,5,1,0),(80,326,'feature',41,2,10,1,0),(81,327,'feature',41,3,15,1,0),(82,328,'feature',41,4,20,1,0),(83,329,'feature',41,1,5,1,0),(84,330,'feature',41,2,10,1,0),(85,331,'feature',41,3,15,1,0),(86,332,'feature',41,4,20,1,0),(87,333,'feature',41,1,5,1,0),(88,334,'feature',41,2,10,1,0),(89,335,'feature',41,3,15,1,0),(90,336,'feature',41,4,20,1,0),(91,337,'feature',41,1,5,1,0),(92,338,'feature',41,2,10,1,0),(93,339,'feature',41,3,15,1,0),(94,340,'feature',41,4,20,1,0),(95,341,'feature',41,1,5,1,0),(96,342,'feature',41,2,10,1,0),(97,343,'feature',41,3,15,1,0),(98,344,'feature',41,4,20,1,0),(99,345,'feature',41,1,5,1,0),(100,346,'feature',41,2,10,1,0),(101,347,'feature',41,3,15,1,0),(102,348,'feature',41,4,20,1,0),(103,349,'feature',41,1,5,1,0),(104,350,'feature',41,2,10,1,0),(105,351,'feature',41,3,15,1,0),(106,352,'feature',41,4,20,1,0),(107,353,'feature',41,1,5,1,0),(108,354,'feature',41,2,10,1,0),(109,355,'feature',41,3,15,1,0),(110,356,'feature',41,4,20,1,0),(111,357,'feature',41,1,5,1,0),(112,358,'feature',41,2,10,1,0),(113,359,'feature',41,3,15,1,0),(114,360,'feature',41,4,20,1,0),(115,1,'feature',1,1,10,0,0),(116,2,'feature',2,1,10,0,0),(117,3,'feature',2,2,15,0,0),(118,4,'feature',3,1,15,0,0),(119,5,'feature',3,2,15,0,0),(120,6,'feature',4,1,15,0,0),(121,7,'feature',4,2,15,0,0),(122,8,'feature',5,1,5,0,1),(123,9,'feature',5,2,10,0,0),(124,10,'feature',6,1,15,0,0),(125,11,'feature',6,2,10,0,0),(126,12,'feature',6,3,10,0,0),(127,13,'feature',5,3,10,0,0),(128,14,'feature',5,4,15,0,0),(129,15,'feature',5,5,20,0,0),(130,16,'feature',5,6,20,0,0),(131,17,'achievement',7,1,5,0,1),(132,18,'achievement',7,2,10,0,0),(133,19,'feature',8,1,15,0,1),(134,20,'feature',8,2,15,0,0),(135,21,'feature',9,1,15,0,0),(136,22,'feature',10,1,10,0,0),(137,23,'feature',10,2,10,0,0),(138,24,'feature',10,3,10,0,0),(139,25,'feature',10,4,10,0,0),(140,26,'feature',10,5,10,0,0),(141,27,'feature',4,3,10,0,0),(142,28,'feature',3,3,10,0,0),(143,29,'achievement',11,1,5,0,0),(144,30,'achievement',11,2,10,0,0),(145,31,'achievement',11,3,15,0,0),(146,32,'achievement',11,4,20,0,0),(147,33,'achievement',11,5,25,0,0),(148,34,'achievement',11,6,30,0,0),(149,35,'achievement',7,3,15,0,0),(150,36,'achievement',7,4,20,0,0),(151,37,'achievement',7,5,25,0,0),(152,38,'achievement',7,6,30,0,0),(153,39,'achievement',12,1,5,0,0),(154,40,'achievement',12,2,10,0,0),(155,41,'achievement',12,3,15,0,0),(156,42,'achievement',12,4,20,0,0),(157,43,'achievement',12,5,25,0,0),(158,44,'achievement',12,6,30,0,0),(159,45,'achievement',13,1,5,0,0),(160,46,'achievement',13,2,10,0,0),(161,47,'achievement',13,3,15,0,0),(162,48,'achievement',13,4,20,0,0),(163,49,'achievement',13,5,25,0,0),(164,50,'achievement',13,6,30,0,0),(165,51,'achievement',14,1,5,0,0),(166,52,'achievement',14,2,10,0,0),(167,53,'achievement',14,3,15,0,0),(168,54,'achievement',14,4,20,0,0),(169,55,'achievement',14,5,25,0,0),(170,56,'achievement',14,6,30,0,0),(171,57,'achievement',15,1,5,0,0),(172,58,'achievement',15,2,10,0,0),(173,59,'achievement',15,3,15,0,0),(174,60,'achievement',15,4,20,0,0),(175,61,'achievement',15,5,25,0,0),(176,62,'achievement',15,6,30,0,0),(177,63,'achievement',16,1,5,0,0),(178,64,'achievement',16,2,10,0,0),(179,65,'achievement',16,3,15,0,0),(180,66,'achievement',16,4,20,0,0),(181,67,'achievement',16,5,25,0,0),(182,68,'achievement',16,6,30,0,0),(183,74,'international',22,1,10,0,0),(184,75,'international',23,1,10,0,0),(185,76,'international',24,1,10,0,0),(186,77,'international',25,1,10,0,0),(187,83,'international',31,1,10,0,0),(188,85,'international',32,1,10,0,0),(189,86,'international',33,1,10,0,0),(190,87,'international',34,1,10,0,0),(191,88,'feature',35,1,5,0,0),(192,89,'feature',35,2,10,0,0),(193,90,'feature',35,3,10,0,0),(194,91,'feature',35,4,10,0,0),(195,92,'feature',35,5,10,0,0),(196,93,'feature',35,6,10,0,0),(197,94,'feature',36,1,5,0,0),(198,95,'feature',36,2,5,0,0),(199,96,'feature',36,3,10,0,0),(200,97,'feature',36,4,10,0,0),(201,98,'feature',36,5,20,0,0),(202,99,'feature',36,6,20,0,0),(203,100,'feature',8,3,15,0,0),(204,101,'achievement',37,1,5,0,0),(205,102,'achievement',37,2,5,0,0),(206,103,'achievement',37,3,10,0,0),(207,104,'achievement',37,4,10,0,0),(208,105,'achievement',37,5,15,0,0),(209,106,'achievement',37,6,15,0,0),(210,107,'achievement',38,1,10,0,0),(211,108,'achievement',38,2,10,0,0),(212,109,'achievement',38,3,15,0,0),(213,110,'achievement',38,4,20,0,0),(214,111,'achievement',38,5,25,0,0),(215,112,'achievement',38,6,30,0,0),(216,113,'achievement',39,1,10,0,0),(217,114,'achievement',39,2,20,0,0),(218,115,'achievement',39,3,30,0,0),(219,116,'achievement',39,4,40,0,0),(220,117,'achievement',39,5,50,0,0),(221,118,'achievement',39,6,50,0,0),(222,119,'feature',40,1,10,0,0),(223,120,'feature',40,2,15,0,0),(224,121,'feature',40,3,20,0,0),(225,122,'feature',40,4,25,0,0);
/*!40000 ALTER TABLE `tb_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_badge_lang`
--

DROP TABLE IF EXISTS `tb_badge_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_badge_lang` (
  `id_badge` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_badge`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_badge_lang`
--

LOCK TABLES `tb_badge_lang` WRITE;
/*!40000 ALTER TABLE `tb_badge_lang` DISABLE KEYS */;
INSERT INTO `tb_badge_lang` VALUES (1,1,'Shopgate installed','You have installed the Shopgate module','Partners'),(2,1,'Shopgate configured','You have configured the Shopgate module','Partners'),(3,1,'Shopgate active','Your Shopgate module is active','Partners'),(4,1,'Shopgate very active','Your Shopgate module is very active','Partners'),(5,1,'Skrill installed','You have installed the Skrill module','Partners'),(6,1,'Skrill configured','You have configured the Skrill module','Partners'),(7,1,'Skrill active','Your Skrill module is active','Partners'),(8,1,'Skrill very active','Your Skrill module is very active','Partners'),(9,1,'Authorize Aim installed','You have installed the Authorize Aim module','Partners'),(10,1,'Authorize Aim configured','You have configured the Authorize Aim module','Partners'),(11,1,'Authorize Aim active','Your Authorize Aim module is active','Partners'),(12,1,'Authorize Aim very active','Your Authorize Aim module is very active','Partners'),(13,1,'Ebay installed','You have installed the Ebay module','Partners'),(14,1,'Ebay configured','You have configured the Ebay module','Partners'),(15,1,'Ebay active','Your Ebay module is active','Partners'),(16,1,'Ebay very active','Your Ebay module is very active','Partners'),(17,1,'PayPlug installed','You have installed the PayPlug module','Partners'),(18,1,'PayPlug configured','You have configured the PayPlug module','Partners'),(19,1,'PayPlug active','Your PayPlug module is active','Partners'),(20,1,'PayPlug very active','Your PayPlug module is very active','Partners'),(21,1,'Affinity Items installed','You have installed the Affinity Items module','Partners'),(22,1,'Affinity Items configured','You have configured the Affinity Items module','Partners'),(23,1,'DPD Poland installed','You have installed the DPD Poland module','Partners'),(24,1,'DPD Poland configured','You have configured the DPD Poland module','Partners'),(25,1,'DPD Poland active','Your DPD Poland module is active','Partners'),(26,1,'DPD Poland very active','Your DPD Poland module is very active','Partners'),(27,1,'Envoimoinscher installed','You have installed the Envoimoinscher module','Partners'),(28,1,'Envoimoinscher configured','You have configured the Envoimoinscher module','Partners'),(29,1,'Envoimoinscher active','Your Envoimoinscher module is active','Partners'),(30,1,'Envoimoinscher very active','Your Envoimoinscher module is very active','Partners'),(31,1,'Klik&Pay installed','You have installed the Klik&Pay module','Partners'),(32,1,'Klik&Pay configured','You have configured the Klik&Pay module','Partners'),(33,1,'Klik&Pay active','Your Klik&Pay module is active','Partners'),(34,1,'Klik&Pay very active','Your Klik&Pay module is very active','Partners'),(35,1,'Clickline installed','You have installed the Clickline module','Partners'),(36,1,'Clickline configured','You have configured the Clickline module','Partners'),(37,1,'Clickline active','Your Clickline module is active','Partners'),(38,1,'Clickline very active','Your Clickline module is very active','Partners'),(39,1,'CDiscount installed','You have installed the CDiscount module','Partners'),(40,1,'CDiscount configured','You have configured the CDiscount module','Partners'),(41,1,'CDiscount active','Your CDiscount module is active','Partners'),(42,1,'CDiscount very active','Your CDiscount module is very active','Partners'),(43,1,'illicoPresta installed','You have installed the illicoPresta module','Partners'),(44,1,'illicoPresta configured','You have configured the illicoPresta module','Partners'),(45,1,'illicoPresta active','Your illicoPresta module is active','Partners'),(46,1,'illicoPresta very active','Your illicoPresta module is very active','Partners'),(47,1,'NetReviews installed','You have installed the NetReviews module','Partners'),(48,1,'NetReviews configured','You have configured the NetReviews module','Partners'),(49,1,'NetReviews active','Your NetReviews module is active','Partners'),(50,1,'NetReviews very active','Your NetReviews module is very active','Partners'),(51,1,'Bluesnap installed','You have installed the Bluesnap module','Partners'),(52,1,'Bluesnap configured','You have configured the Bluesnap module','Partners'),(53,1,'Bluesnap active','Your Bluesnap module is active','Partners'),(54,1,'Bluesnap very active','Your Bluesnap module is very active','Partners'),(55,1,'Desjardins installed','You have installed the Desjardins module','Partners'),(56,1,'Desjardins configured','You have configured the Desjardins module','Partners'),(57,1,'Desjardins active','Your Desjardins module is active','Partners'),(58,1,'Desjardins very active','Your Desjardins module is very active','Partners'),(59,1,'First Data installed','You have installed the First Data module','Partners'),(60,1,'First Data configured','You have configured the First Data module','Partners'),(61,1,'First Data active','Your First Data module is active','Partners'),(62,1,'First Data very active','Your First Data module is very active','Partners'),(63,1,'Give.it installed','You have installed the Give.it module','Partners'),(64,1,'Give.it configured','You have configured the Give.it module','Partners'),(65,1,'Give.it active','Your Give.it module is active','Partners'),(66,1,'Give.it very active','Your Give.it module is very active','Partners'),(67,1,'Google Analytics installed','You have installed the Google Analytics module','Partners'),(68,1,'Google Analytics configured','You have configured the Google Analytics module','Partners'),(69,1,'Google Analytics active','Your Google Analytics module is active','Partners'),(70,1,'Google Analytics very active','Your Google Analytics module is very active','Partners'),(71,1,'PagSeguro installed','You have installed the PagSeguro module','Partners'),(72,1,'PagSeguro configured','You have configured the PagSeguro module','Partners'),(73,1,'PagSeguro active','Your PagSeguro module is active','Partners'),(74,1,'PagSeguro very active','Your PagSeguro module is very active','Partners'),(75,1,'Paypal MX installed','You have installed the Paypal MX module','Partners'),(76,1,'Paypal MX configured','You have configured the Paypal MX module','Partners'),(77,1,'Paypal MX active','Your Paypal MX module is active','Partners'),(78,1,'Paypal MX very active','Your Paypal MX module is very active','Partners'),(79,1,'Paypal USA installed','You have installed the Paypal USA module','Partners'),(80,1,'Paypal USA configured','You have configured the Paypal USA module','Partners'),(81,1,'Paypal USA active','Your Paypal USA module is active','Partners'),(82,1,'Paypal USA very active','Your Paypal USA module is very active','Partners'),(83,1,'PayULatam installed','You have installed the PayULatam module','Partners'),(84,1,'PayULatam configured','You have configured the PayULatam module','Partners'),(85,1,'PayULatam active','Your PayULatam module is active','Partners'),(86,1,'PayULatam very active','Your PayULatam module is very active','Partners'),(87,1,'PrestaStats installed','You have installed the PrestaStats module','Partners'),(88,1,'PrestaStats configured','You have configured the PrestaStats module','Partners'),(89,1,'PrestaStats active','Your PrestaStats module is active','Partners'),(90,1,'PrestaStats very active','Your PrestaStats module is very active','Partners'),(91,1,'Riskified installed','You have installed the Riskified module','Partners'),(92,1,'Riskified configured','You have configured the Riskified module','Partners'),(93,1,'Riskified active','Your Riskified module is active','Partners'),(94,1,'Riskified very active','Your Riskified module is very active','Partners'),(95,1,'Simplify installed','You have installed the Simplify module','Partners'),(96,1,'Simplify configured','You have configured the Simplify module','Partners'),(97,1,'Simplify active','Your Simplify module is active','Partners'),(98,1,'Simplify very active','Your Simplify module is very active','Partners'),(99,1,'VTPayment installed','You have installed the VTPayment module','Partners'),(100,1,'VTPayment configured','You have configured the VTPayment module','Partners'),(101,1,'VTPayment active','Your VTPayment module is active','Partners'),(102,1,'VTPayment very active','Your VTPayment module is very active','Partners'),(103,1,'Yotpo installed','You have installed the Yotpo module','Partners'),(104,1,'Yotpo configured','You have configured the Yotpo module','Partners'),(105,1,'Yotpo active','Your Yotpo module is active','Partners'),(106,1,'Yotpo very active','Your Yotpo module is very active','Partners'),(107,1,'Youstice installed','You have installed the Youstice module','Partners'),(108,1,'Youstice configured','You have configured the Youstice module','Partners'),(109,1,'Youstice active','Your Youstice module is active','Partners'),(110,1,'Youstice very active','Your Youstice module is very active','Partners'),(111,1,'Loyalty Lion installed','You have installed the Loyalty Lion module','Partners'),(112,1,'Loyalty Lion configured','You have configured the Loyalty Lion module','Partners'),(113,1,'Loyalty Lion active','Your Loyalty Lion module is active','Partners'),(114,1,'Loyalty Lion very active','Your Loyalty Lion module is very active','Partners'),(115,1,'SEO','You enabled the URL rewriting through the tab \"Preferences > SEO and URLs\".','SEO'),(116,1,'Site Performance','You enabled CCC (Combine, Compress and Cache), Rijndael and Smarty through the tab \r\nAdvanced Parameters > Performance.','Site Performance'),(117,1,'Site Performance','You enabled media servers through the tab \"Advanced parameters > Performance\".','Site Performance'),(118,1,'Payment','You configured a payment solution on your shop.','Payment'),(119,1,'Payment','You offer two different payment methods to your customers.','Payment'),(120,1,'Shipping','You configured a carrier on your shop.','Shipping'),(121,1,'Shipping','You offer two shipping solutions (carriers) to your customers.','Shipping'),(122,1,'Catalog Size','You added your first product to your catalog!','Catalog Size'),(122,2,'Catalog Size','',''),(123,1,'Catalog Size','You have 10 products within your catalog.','Catalog Size'),(124,1,'Contact information','You configured your phone number so your customers can reach you!','Contact information'),(125,1,'Contact information','You added a third email address to your contact form.','Contact information'),(126,1,'Contact information','You suggest a total of 5 departments to be reached by your customers via your contact form.','Contact information'),(127,1,'Catalog Size','You have 100 products within your catalog.','Catalog Size'),(128,1,'Catalog Size','You have 1,000 products within your catalog.','Catalog Size'),(129,1,'Catalog Size','You have 10,000 products within your catalog.','Catalog Size'),(130,1,'Catalog Size','You have 100,000 products within your catalog.','Catalog Size'),(131,1,'Days of Experience','You just installed PrestaShop!','Days of Experience'),(131,2,'Days of Experience','',''),(132,1,'Days of Experience','You installed PrestaShop a week ago!','Days of Experience'),(133,1,'Customization','You uploaded your own logo.','Customization'),(133,2,'Customization','',''),(134,1,'Customization','You installed a new template.','Customization'),(135,1,'Addons','You connected your back-office to the Addons platform using your PrestaShop Addons account.','Addons'),(136,1,'Multistores','You enabled the Multistores feature.','Multistores'),(137,1,'Multistores','You manage two shops with the Multistores feature.','Multistores'),(138,1,'Multistores','You manage two different groups of shops using the Multistores feature.','Multistores'),(139,1,'Multistores','You manage five shops with the Multistores feature.','Multistores'),(140,1,'Multistores','You manage five different groups of shops using the Multistores feature.','Multistores'),(141,1,'Shipping','You offer three different shipping solutions (carriers) to your customers.','Shipping'),(142,1,'Payment','You offer three different payment methods to your customers.','Payment'),(143,1,'Revenue','You get this badge when you reach 300 BRL in sales.','Revenue'),(144,1,'Revenue','You get this badge when you reach 1000 BRL in sales.','Revenue'),(145,1,'Revenue','You get this badge when you reach 1000 BRL in sales.','Revenue'),(146,1,'Revenue','You get this badge when you reach 300 BRL in sales.','Revenue'),(147,1,'Revenue','You get this badge when you reach 1000 BRL in sales.','Revenue'),(148,1,'Revenue','You get this badge when you reach 1000 BRL in sales.','Revenue'),(149,1,'Days of Experience','You installed PrestaShop a month ago!','Days of Experience'),(150,1,'Days of Experience','You installed PrestaShop six months ago!','Days of Experience'),(151,1,'Days of Experience','You installed PrestaShop a year ago!','Days of Experience'),(152,1,'Days of Experience','You installed PrestaShop two years ago!','Days of Experience'),(153,1,'Visitors','You reached 10 visitors!','Visitors'),(154,1,'Visitors','You reached 100 visitors!','Visitors'),(155,1,'Visitors','You reached 1,000 visitors!','Visitors'),(156,1,'Visitors','You reached 10,000 visitors!','Visitors'),(157,1,'Visitors','You reached 100,000 visitors!','Visitors'),(158,1,'Visitors','You reached 1,000,000 visitors!','Visitors'),(159,1,'Customer Carts','Two carts have been created by visitors','Customer Carts'),(160,1,'Customer Carts','Ten carts have been created by visitors.','Customer Carts'),(161,1,'Customer Carts','A hundred carts have been created by visitors on your shop.','Customer Carts'),(162,1,'Customer Carts','A thousand carts have been created by visitors on your shop.','Customer Carts'),(163,1,'Customer Carts','10,000 carts have been created by visitors.','Customer Carts'),(164,1,'Customer Carts','100,000 carts have been created by visitors.','Customer Carts'),(165,1,'Orders','You received your first order.','Orders'),(166,1,'Orders','10 orders have been placed through your online shop.','Orders'),(167,1,'Orders','You received 100 orders through your online shop!','Orders'),(168,1,'Orders','You received 1,000 orders through your online shop, congrats!','Orders'),(169,1,'Orders','You received 10,000 orders through your online shop, cheers!','Orders'),(170,1,'Orders','You received 100,000 orders through your online shop!','Orders'),(171,1,'Customer Service Threads','You received  your first customer\'s message.','Customer Service Threads'),(172,1,'Customer Service Threads','You received 10 messages from your customers.','Customer Service Threads'),(173,1,'Customer Service Threads','You received 100 messages from your customers.','Customer Service Threads'),(174,1,'Customer Service Threads','You received 1,000 messages from your customers.','Customer Service Threads'),(175,1,'Customer Service Threads','You received 10,000 messages from your customers.','Customer Service Threads'),(176,1,'Customer Service Threads','You received 100,000 messages from your customers.','Customer Service Threads'),(177,1,'Customers','You got the first customer registered on your shop!','Customers'),(178,1,'Customers','You have over 10 customers registered on your shop.','Customers'),(179,1,'Customers','You have over 100 customers registered on your shop.','Customers'),(180,1,'Customers','You have over 1,000 customers registered on your shop.','Customers'),(181,1,'Customers','You have over 10,000 customers registered on your shop.','Customers'),(182,1,'Customers','You have over 100,000 customers registered on your shop.','Customers'),(183,1,'North America','You got your first sale in North America','North America'),(184,1,'Oceania','You got your first sale in Oceania','Oceania'),(185,1,'Central America','You got your first sale in Central America','Central America'),(186,1,'South America','You got your first sale in South America','South America'),(187,1,'Asia','You got your first sale in Asia','Asia'),(188,1,'Europe','You got your first sale in  Europe!','Europe'),(189,1,'Africa','You got your first sale in Africa','Africa'),(190,1,'Maghreb','You got your first sale in Maghreb','Maghreb'),(191,1,'Your Team\'s Employees','First employee account added to your shop','Your Team\'s Employees'),(192,1,'Your Team\'s Employees','3 employee accounts added to your shop','Your Team\'s Employees'),(193,1,'Your Team\'s Employees','5 employee accounts added to your shop','Your Team\'s Employees'),(194,1,'Your Team\'s Employees','10 employee accounts added to your shop','Your Team\'s Employees'),(195,1,'Your Team\'s Employees','20 employee accounts added to your shop','Your Team\'s Employees'),(196,1,'Your Team\'s Employees','40 employee accounts added to your shop','Your Team\'s Employees'),(197,1,'Product Pictures','First photo added to your catalog','Product Pictures'),(198,1,'Product Pictures','50 photos added to your catalog','Product Pictures'),(199,1,'Product Pictures','100 photos added to your catalog','Product Pictures'),(200,1,'Product Pictures','1,000 photos added to your catalog','Product Pictures'),(201,1,'Product Pictures','10,000 photos added to your catalog','Product Pictures'),(202,1,'Product Pictures','50,000 photos added to your catalog','Product Pictures'),(203,1,'Customization','First CMS page added to your catalog','Customization'),(204,1,'Cart Rules','First cart rules configured on your shop','Cart Rules'),(205,1,'Cart Rules','You have 10 cart rules configured on your shop','Cart Rules'),(206,1,'Cart Rules','You have 100 cart rules configured on your shop','Cart Rules'),(207,1,'Cart Rules','You have 500 cart rules configured on your shop','Cart Rules'),(208,1,'Cart Rules','You have 1,000 cart rules configured on your shop','Cart Rules'),(209,1,'Cart Rules','You have 5,000 cart rules configured on your shop','Cart Rules'),(210,1,'International Orders','First international order placed on your shop.','International Orders'),(211,1,'International Orders','10 international orders placed on your shop.','International Orders'),(212,1,'International Orders','100 international orders placed on your shop!','International Orders'),(213,1,'International Orders','1,000 international orders placed on your shop!','International Orders'),(214,1,'International Orders','5,000 international orders placed on your shop!','International Orders'),(215,1,'International Orders','10,000 international orders placed on your shop!','International Orders'),(216,1,'Store','First store configured on your shop!','Store'),(217,1,'Store','You have 2 stores configured on your shop','Store'),(218,1,'Store','You have 5 stores configured on your shop','Store'),(219,1,'Store','You have 10 stores configured on your shop','Store'),(220,1,'Store','You have 20 stores configured on your shop','Store'),(221,1,'Store','You have 50 stores configured on your shop','Store'),(222,1,'Webservice x1','First webservice account added to your shop','WebService'),(223,1,'Webservice x2','2 webservice accounts added to your shop','WebService'),(224,1,'Webservice x3','3 webservice accounts added to your shop','WebService'),(225,1,'Webservice x4','4 webservice accounts added to your shop','WebService');
/*!40000 ALTER TABLE `tb_badge_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrier`
--

DROP TABLE IF EXISTS `tb_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carrier` (
  `id_carrier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_reference` int(10) unsigned NOT NULL,
  `id_tax_rules_group` int(10) unsigned DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_handling` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `range_behavior` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_module` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_free` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_external` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `need_range` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_module_name` varchar(64) DEFAULT NULL,
  `shipping_method` int(2) NOT NULL DEFAULT '0',
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `max_width` int(10) DEFAULT '0',
  `max_height` int(10) DEFAULT '0',
  `max_depth` int(10) DEFAULT '0',
  `max_weight` decimal(20,6) DEFAULT '0.000000',
  `grade` int(10) DEFAULT '0',
  PRIMARY KEY (`id_carrier`),
  KEY `deleted` (`deleted`,`active`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `reference` (`id_reference`,`deleted`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrier`
--

LOCK TABLES `tb_carrier` WRITE;
/*!40000 ALTER TABLE `tb_carrier` DISABLE KEYS */;
INSERT INTO `tb_carrier` VALUES (1,1,0,'0','',1,0,0,0,0,1,0,0,'',0,0,0,0,0,0.000000,0),(2,2,0,'My carrier','',1,0,1,0,0,0,0,0,'',0,1,0,0,0,0.000000,0);
/*!40000 ALTER TABLE `tb_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrier_group`
--

DROP TABLE IF EXISTS `tb_carrier_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carrier_group` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrier_group`
--

LOCK TABLES `tb_carrier_group` WRITE;
/*!40000 ALTER TABLE `tb_carrier_group` DISABLE KEYS */;
INSERT INTO `tb_carrier_group` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3);
/*!40000 ALTER TABLE `tb_carrier_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrier_lang`
--

DROP TABLE IF EXISTS `tb_carrier_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carrier_lang` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `delay` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrier_lang`
--

LOCK TABLES `tb_carrier_lang` WRITE;
/*!40000 ALTER TABLE `tb_carrier_lang` DISABLE KEYS */;
INSERT INTO `tb_carrier_lang` VALUES (1,1,1,'Levantar na loja'),(2,1,1,'Entrega no dia seguinte!'),(1,1,2,'Levantar na loja'),(2,1,2,'Entrega no dia seguinte!');
/*!40000 ALTER TABLE `tb_carrier_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrier_shop`
--

DROP TABLE IF EXISTS `tb_carrier_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carrier_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrier_shop`
--

LOCK TABLES `tb_carrier_shop` WRITE;
/*!40000 ALTER TABLE `tb_carrier_shop` DISABLE KEYS */;
INSERT INTO `tb_carrier_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `tb_carrier_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrier_tax_rules_group_shop`
--

DROP TABLE IF EXISTS `tb_carrier_tax_rules_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carrier_tax_rules_group_shop` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_tax_rules_group`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrier_tax_rules_group_shop`
--

LOCK TABLES `tb_carrier_tax_rules_group_shop` WRITE;
/*!40000 ALTER TABLE `tb_carrier_tax_rules_group_shop` DISABLE KEYS */;
INSERT INTO `tb_carrier_tax_rules_group_shop` VALUES (1,1,1),(2,1,1);
/*!40000 ALTER TABLE `tb_carrier_tax_rules_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_carrier_zone`
--

DROP TABLE IF EXISTS `tb_carrier_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_carrier_zone` (
  `id_carrier` int(10) unsigned NOT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_carrier`,`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carrier_zone`
--

LOCK TABLES `tb_carrier_zone` WRITE;
/*!40000 ALTER TABLE `tb_carrier_zone` DISABLE KEYS */;
INSERT INTO `tb_carrier_zone` VALUES (1,1),(2,1),(2,2);
/*!40000 ALTER TABLE `tb_carrier_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart`
--

DROP TABLE IF EXISTS `tb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart` (
  `id_cart` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_carrier` int(10) unsigned NOT NULL,
  `delivery_option` text NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_guest` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  `allow_seperated_package` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `checkout_session_data` mediumtext,
  PRIMARY KEY (`id_cart`),
  KEY `cart_customer` (`id_customer`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_guest` (`id_guest`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop_2` (`id_shop`,`date_upd`),
  KEY `id_shop` (`id_shop`,`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart`
--

LOCK TABLES `tb_cart` WRITE;
/*!40000 ALTER TABLE `tb_cart` DISABLE KEYS */;
INSERT INTO `tb_cart` VALUES (1,1,1,2,'a:1:{i:3;s:2:\"2,\";}',1,4,4,1,1,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2018-01-17 09:46:02','2018-01-17 09:46:02',NULL),(2,1,1,2,'a:1:{i:3;s:2:\"2,\";}',1,4,4,1,1,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2018-01-17 09:46:02','2018-01-17 09:46:02',NULL),(3,1,1,2,'a:1:{i:3;s:2:\"2,\";}',1,4,4,1,1,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2018-01-17 09:46:02','2018-01-17 09:46:02',NULL),(4,1,1,2,'a:1:{i:3;s:2:\"2,\";}',1,4,4,1,1,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2018-01-17 09:46:02','2018-01-17 09:46:02',NULL),(5,1,1,2,'a:1:{i:3;s:2:\"2,\";}',1,4,4,1,1,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1',0,0,'',0,0,'2018-01-17 09:46:02','2018-01-17 09:46:02',NULL);
/*!40000 ALTER TABLE `tb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_cart_rule`
--

DROP TABLE IF EXISTS `tb_cart_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_cart_rule` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart`,`id_cart_rule`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_cart_rule`
--

LOCK TABLES `tb_cart_cart_rule` WRITE;
/*!40000 ALTER TABLE `tb_cart_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_product`
--

DROP TABLE IF EXISTS `tb_cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_product` (
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL DEFAULT '0',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_cart`,`id_product`,`id_product_attribute`,`id_customization`,`id_address_delivery`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_cart_order` (`id_cart`,`date_add`,`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_product`
--

LOCK TABLES `tb_cart_product` WRITE;
/*!40000 ALTER TABLE `tb_cart_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule`
--

DROP TABLE IF EXISTS `tb_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule` (
  `id_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  `description` text,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `quantity_per_user` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '1',
  `partial_use` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `code` varchar(254) NOT NULL,
  `minimum_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `minimum_amount_tax` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_amount_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `minimum_amount_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `country_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `carrier_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cart_rule_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `product_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shop_restriction` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `reduction_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `reduction_tax` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reduction_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `reduction_product` int(10) NOT NULL DEFAULT '0',
  `reduction_exclude_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_product` int(10) unsigned NOT NULL DEFAULT '0',
  `gift_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `highlight` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_cart_rule`),
  KEY `id_customer` (`id_customer`,`active`,`date_to`),
  KEY `group_restriction` (`group_restriction`,`active`,`date_to`),
  KEY `id_customer_2` (`id_customer`,`active`,`highlight`,`date_to`),
  KEY `group_restriction_2` (`group_restriction`,`active`,`highlight`,`date_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule`
--

LOCK TABLES `tb_cart_rule` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_carrier`
--

DROP TABLE IF EXISTS `tb_cart_rule_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_carrier` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_carrier`
--

LOCK TABLES `tb_cart_rule_carrier` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_combination`
--

DROP TABLE IF EXISTS `tb_cart_rule_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_combination` (
  `id_cart_rule_1` int(10) unsigned NOT NULL,
  `id_cart_rule_2` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule_1`,`id_cart_rule_2`),
  KEY `id_cart_rule_1` (`id_cart_rule_1`),
  KEY `id_cart_rule_2` (`id_cart_rule_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_combination`
--

LOCK TABLES `tb_cart_rule_combination` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_country`
--

DROP TABLE IF EXISTS `tb_cart_rule_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_country` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_country`
--

LOCK TABLES `tb_cart_rule_country` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_group`
--

DROP TABLE IF EXISTS `tb_cart_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_group` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_group`
--

LOCK TABLES `tb_cart_rule_group` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_lang`
--

DROP TABLE IF EXISTS `tb_cart_rule_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_lang` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(254) NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_lang`
--

LOCK TABLES `tb_cart_rule_lang` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_product_rule`
--

DROP TABLE IF EXISTS `tb_cart_rule_product_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_product_rule` (
  `id_product_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_rule_group` int(10) unsigned NOT NULL,
  `type` enum('products','categories','attributes','manufacturers','suppliers') NOT NULL,
  PRIMARY KEY (`id_product_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_product_rule`
--

LOCK TABLES `tb_cart_rule_product_rule` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_product_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_product_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_product_rule_group`
--

DROP TABLE IF EXISTS `tb_cart_rule_product_rule_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_product_rule_group` (
  `id_product_rule_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_product_rule_group`
--

LOCK TABLES `tb_cart_rule_product_rule_group` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_product_rule_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_product_rule_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_product_rule_value`
--

DROP TABLE IF EXISTS `tb_cart_rule_product_rule_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_product_rule_value` (
  `id_product_rule` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_rule`,`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_product_rule_value`
--

LOCK TABLES `tb_cart_rule_product_rule_value` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_product_rule_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_product_rule_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cart_rule_shop`
--

DROP TABLE IF EXISTS `tb_cart_rule_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cart_rule_shop` (
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cart_rule`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cart_rule_shop`
--

LOCK TABLES `tb_cart_rule_shop` WRITE;
/*!40000 ALTER TABLE `tb_cart_rule_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cart_rule_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nleft` int(10) unsigned NOT NULL DEFAULT '0',
  `nright` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `is_root_category` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`),
  KEY `category_parent` (`id_parent`),
  KEY `nleftrightactive` (`nleft`,`nright`,`active`),
  KEY `level_depth` (`level_depth`),
  KEY `nright` (`nright`),
  KEY `activenleft` (`active`,`nleft`),
  KEY `activenright` (`active`,`nright`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES (1,0,1,0,1,6,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0,0),(2,1,1,1,2,5,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0,1),(12,2,1,2,3,4,1,'2018-01-17 10:16:57','2018-01-17 10:16:57',0,0);
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category_group`
--

DROP TABLE IF EXISTS `tb_category_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category_group` (
  `id_category` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_category`,`id_group`),
  KEY `id_category` (`id_category`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category_group`
--

LOCK TABLES `tb_category_group` WRITE;
/*!40000 ALTER TABLE `tb_category_group` DISABLE KEYS */;
INSERT INTO `tb_category_group` VALUES (2,0),(2,1),(2,2),(2,3),(12,1),(12,2),(12,3);
/*!40000 ALTER TABLE `tb_category_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category_lang`
--

DROP TABLE IF EXISTS `tb_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category_lang` (
  `id_category` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category_lang`
--

LOCK TABLES `tb_category_lang` WRITE;
/*!40000 ALTER TABLE `tb_category_lang` DISABLE KEYS */;
INSERT INTO `tb_category_lang` VALUES (1,1,1,'Raiz','','raiz','','',''),(1,1,2,'Raiz','','raiz','','',''),(2,1,1,'InÃ­cio','','inicio','','',''),(2,1,2,'InÃ­cio','','inicio','','',''),(12,1,1,'EletrÃ´nicos','','eletronicos','','',''),(12,1,2,'EletrÃ´nicos','','eletronicos','','','');
/*!40000 ALTER TABLE `tb_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category_product`
--

DROP TABLE IF EXISTS `tb_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category_product` (
  `id_category` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_product`),
  KEY `id_product` (`id_product`),
  KEY `id_category` (`id_category`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category_product`
--

LOCK TABLES `tb_category_product` WRITE;
/*!40000 ALTER TABLE `tb_category_product` DISABLE KEYS */;
INSERT INTO `tb_category_product` VALUES (2,8,0),(12,8,0);
/*!40000 ALTER TABLE `tb_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category_shop`
--

DROP TABLE IF EXISTS `tb_category_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category_shop` (
  `id_category` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category_shop`
--

LOCK TABLES `tb_category_shop` WRITE;
/*!40000 ALTER TABLE `tb_category_shop` DISABLE KEYS */;
INSERT INTO `tb_category_shop` VALUES (1,1,0),(2,1,0),(12,1,0);
/*!40000 ALTER TABLE `tb_category_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms`
--

DROP TABLE IF EXISTS `tb_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms` (
  `id_cms` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_category` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `indexation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_cms`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms`
--

LOCK TABLES `tb_cms` WRITE;
/*!40000 ALTER TABLE `tb_cms` DISABLE KEYS */;
INSERT INTO `tb_cms` VALUES (1,1,0,1,0),(2,1,1,1,0),(3,1,2,1,0),(4,1,3,1,0),(5,1,4,1,0);
/*!40000 ALTER TABLE `tb_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_category`
--

DROP TABLE IF EXISTS `tb_cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_category` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL,
  `level_depth` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cms_category`),
  KEY `category_parent` (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_category`
--

LOCK TABLES `tb_cms_category` WRITE;
/*!40000 ALTER TABLE `tb_cms_category` DISABLE KEYS */;
INSERT INTO `tb_cms_category` VALUES (1,0,1,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0);
/*!40000 ALTER TABLE `tb_cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_category_lang`
--

DROP TABLE IF EXISTS `tb_cms_category_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_category_lang` (
  `id_cms_category` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(128) NOT NULL,
  `description` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cms_category`,`id_shop`,`id_lang`),
  KEY `category_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_category_lang`
--

LOCK TABLES `tb_cms_category_lang` WRITE;
/*!40000 ALTER TABLE `tb_cms_category_lang` DISABLE KEYS */;
INSERT INTO `tb_cms_category_lang` VALUES (1,1,1,'InÃ­cio','','inicio','','',''),(1,2,1,'InÃ­cio','','inicio','','','');
/*!40000 ALTER TABLE `tb_cms_category_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_category_shop`
--

DROP TABLE IF EXISTS `tb_cms_category_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_category_shop` (
  `id_cms_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_category`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_category_shop`
--

LOCK TABLES `tb_cms_category_shop` WRITE;
/*!40000 ALTER TABLE `tb_cms_category_shop` DISABLE KEYS */;
INSERT INTO `tb_cms_category_shop` VALUES (1,1);
/*!40000 ALTER TABLE `tb_cms_category_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_lang`
--

DROP TABLE IF EXISTS `tb_cms_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_lang` (
  `id_cms` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `meta_title` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content` longtext,
  `link_rewrite` varchar(128) NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_lang`
--

LOCK TABLES `tb_cms_lang` WRITE;
/*!40000 ALTER TABLE `tb_cms_lang` DISABLE KEYS */;
INSERT INTO `tb_cms_lang` VALUES (1,1,1,'Entrega','Our terms and conditions of delivery','conditions, delivery, delay, shipment, pack','<h2>Shipments and returns</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','entrega'),(1,2,1,'Entrega','Nossos termos e condiÃ§Ãµes de entrega','condiÃ§Ãµes, entrega, atraso, envio, pacote','<h2>Envios e retornos</h2><h3>O envio do seu pedido</h3><p>Geralmente os envios sÃ£o efetuados dentro de 2 dias apÃ³s o recebimento do pagamento, via UPS com rastreamento, e entregues sem necessidade de assinatura. Se preferir a entrega por UPS Extra com assinatura exigida, serÃ¡ aplicado um custo adicional, por isso, entre em contato conosco antes de escolher este meio. Seja qual for a escolha que fizer, iremos fornecer-lhe um link que permite o rastreamento da sua encomenda on-line.</p><p>As taxas de envio incluem o manuseio, o empacotamento e os custos de postagem. As taxas de manuseio sÃ£o fixas, jÃ¡ as de transporte variam de acordo com o peso total da encomenda. Aconselhamos que faÃ§a um sÃ³ pedido com todos os seus produtos. NÃ£o podemos reunir dois pedidos diferentes efetuados separadamente, e as taxas de envio serÃ£o aplicadas para cada um. Sua encomenda serÃ¡ enviada a seu prÃ³prio risco, mas um cuidado especial serÃ¡ tomado para proteger os objetos frÃ¡geis.<br /><br />As caixas sÃ£o espaÃ§osas e sua mercadoria Ã© bem protegida.</p>','entrega'),(2,1,1,'InformaÃ§Ã£o legal','Legal notice','notice, legal, credits','<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>','informacao-legal'),(2,2,1,'AdvertÃªncia Legal','AdvertÃªncia legal','advertÃªncia, legal, crÃ©ditos','<h2>CrÃ©ditos</h2><h3>Legais</h3><p>Conceito e produÃ§Ã£o:</p><p>Esta loja on-line foi criada por meio do Software de carrinho de compras da PrestaShop<a href=\"http://www.prestashop.com\"></a>. Confira o blog de comÃ©rcio eletrÃ´nico da PrestaShop <a href=\"http://www.prestashop.com/blog/en/\"></a> para obter novidades e conselhos sobre como vender on-line e operar seu site de comÃ©rcio eletrÃ´nico.</p>','advertencia-legal'),(3,1,1,'Termos e condiÃ§Ãµes de uso','Our terms and conditions of use','conditions, terms, use, sell','<h2>Your terms and conditions of use</h2><h3>Rule 1</h3><p>Here is the rule 1 content</p>\r\n<h3>Rule 2</h3><p>Here is the rule 2 content</p>\r\n<h3>Rule 3</h3><p>Here is the rule 3 content</p>','termos-e-condicoes-de-uso'),(3,2,1,'Termos e condiÃ§Ãµes de utilizaÃ§Ã£o','Nossos termos e condiÃ§Ãµes de utilizaÃ§Ã£o','condiÃ§Ãµes, termos, utilizaÃ§Ã£o, venda','<h1 class=\"page-heading\">Termos e condiÃ§Ãµes de utilizaÃ§Ã£o</h1>\n<h3 class=\"page-subheading\">Regra n.Â° 1</h3>\n<p class=\"bottom-indent\">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<h3 class=\"page-subheading\">Regra n.Â° 2</h3>\n<p class=\"bottom-indent\">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>\n<h3 class=\"page-subheading\">Regra n.Â° 3</h3>\n<p class=\"bottom-indent\">Tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>','termos-e-condicoes-de-utilizacao'),(4,1,1,'Sobre NÃ³s','Learn more about us','about us, informations','<h2>About us</h2>\r\n<h3>Our company</h3><p>Our company</p>\r\n<h3>Our team</h3><p>Our team</p>\r\n<h3>Informations</h3><p>Informations</p>','sobre-nos'),(4,2,1,'Quem somos','Saiba mais sobre nÃ³s','quem somos, informaÃ§Ãµes','<h1 class=\"page-heading bottom-indent\">Quem somos</h1>\n<div class=\"row\">\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-block\">\n<h3 class=\"page-subheading\">Nossa empresa</h3>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididun.</strong></p>\n<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet conse ctetur adipisicing elit.</p>\n<ul class=\"list-1\">\n<li><em class=\"icon-ok\"></em>Produtos de alta qualidade</li>\n<li><em class=\"icon-ok\"></em>Melhor serviÃ§o ao cliente</li>\n<li><em class=\"icon-ok\"></em>Garantia de devoluÃ§Ã£o de dinheiro em 30 dias</li>\n</ul>\n</div>\n</div>\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-box\">\n<h3 class=\"page-subheading\">Nossa equipe</h3>\n<img title=\"cms-img\" src=\"../img/cms/cms-img.jpg\" alt=\"cms-img\" width=\"370\" height=\"192\" />\n<p><strong class=\"dark\">Lorem set sint occaecat cupidatat non </strong></p>\n<p>Eiusmod tempor incididunt ut labore et dolore magna aliqua.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>\n</div>\n</div>\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-box\">\n<h3 class=\"page-subheading\">Depoimentos</h3>\n<div class=\"testimonials\">\n<div class=\"inner\"><span class=\"before\">â€œ</span>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.<span class=\"after\">â€</span></div>\n</div>\n<p><strong class=\"dark\">Lorem ipsum dolor sit</strong></p>\n<div class=\"testimonials\">\n<div class=\"inner\"><span class=\"before\">â€œ</span>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod.<span class=\"after\">â€</span></div>\n</div>\n<p><strong class=\"dark\">Ipsum dolor sit</strong></p>\n</div>\n</div>\n</div>','quem-somos'),(5,1,1,'Pagamento seguro','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','pagamento-seguro'),(5,2,1,'Pagamento seguro','Nosso meio de pagamento seguro','pagamento seguro, ssl, visa, mastercard, paypal','<h2>Pagamento seguro</h2>\n<h3>Nosso pagamento seguro</h3><p>Com o SSL</p>\n<h3>Pagar com Visa/Mastercard/Paypal</h3><p>Sobre este serviÃ§o</p>','pagamento-seguro');
/*!40000 ALTER TABLE `tb_cms_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_role`
--

DROP TABLE IF EXISTS `tb_cms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_role` (
  `id_cms_role` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_cms` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms_role`,`id_cms`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_role`
--

LOCK TABLES `tb_cms_role` WRITE;
/*!40000 ALTER TABLE `tb_cms_role` DISABLE KEYS */;
INSERT INTO `tb_cms_role` VALUES (1,'LEGAL_CONDITIONS',3),(2,'LEGAL_NOTICE',2);
/*!40000 ALTER TABLE `tb_cms_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_role_lang`
--

DROP TABLE IF EXISTS `tb_cms_role_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_role_lang` (
  `id_cms_role` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_cms_role`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_role_lang`
--

LOCK TABLES `tb_cms_role_lang` WRITE;
/*!40000 ALTER TABLE `tb_cms_role_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cms_role_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cms_shop`
--

DROP TABLE IF EXISTS `tb_cms_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cms_shop` (
  `id_cms` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_cms`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cms_shop`
--

LOCK TABLES `tb_cms_shop` WRITE;
/*!40000 ALTER TABLE `tb_cms_shop` DISABLE KEYS */;
INSERT INTO `tb_cms_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `tb_cms_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_condition`
--

DROP TABLE IF EXISTS `tb_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_condition` (
  `id_condition` int(11) NOT NULL AUTO_INCREMENT,
  `id_ps_condition` int(11) NOT NULL,
  `type` enum('configuration','install','sql') NOT NULL,
  `request` text,
  `operator` varchar(32) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `result` varchar(64) DEFAULT NULL,
  `calculation_type` enum('hook','time') DEFAULT NULL,
  `calculation_detail` varchar(64) DEFAULT NULL,
  `validated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_condition`,`id_ps_condition`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_condition`
--

LOCK TABLES `tb_condition` WRITE;
/*!40000 ALTER TABLE `tb_condition` DISABLE KEYS */;
INSERT INTO `tb_condition` VALUES (1,19,'install','','>','0','1','time','1',1,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(2,40,'install','','>=','730','','time','2',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(3,1,'configuration','PS_REWRITING_SETTINGS','==','1','','hook','actionAdminMetaControllerUpdate_optionsAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(4,2,'configuration','PS_SMARTY_FORCE_COMPILE','!=','2','1','hook','actionAdminPerformanceControllerSaveAfter',1,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(5,3,'configuration','PS_CSS_THEME_CACHE','==','1','','hook','actionAdminPerformanceControllerSaveAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(6,4,'configuration','PS_CIPHER_ALGORITHM','==','1','1','hook','actionAdminPerformanceControllerSaveAfter',1,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(7,5,'configuration','PS_MEDIA_SERVERS','==','1','','hook','actionAdminPerformanceControllerSaveAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(8,6,'sql','SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = \"displayPayment\" OR h.name = \"payment\") AND m.name NOT IN (\"bankwire\", \"cheque\", \"cashondelivery\")','>','0','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(9,7,'sql','SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = \"displayPayment\" OR h.name = \"payment\") AND m.name NOT IN (\"bankwire\", \"cheque\", \"cashondelivery\")','>','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(10,8,'sql','SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN (\"0\", \"My carrier\")','>','0','0','hook','actionObjectCarrierAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(11,9,'sql','SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN (\"0\", \"My carrier\")','>','1','0','hook','actionObjectCarrierAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(12,10,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','0','1','hook','actionObjectProductAddAfter',1,'2018-01-17 09:54:55','2018-01-17 10:08:50'),(13,11,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','9','1','hook','actionObjectProductAddAfter',0,'2018-01-17 09:54:55','2018-01-17 10:08:52'),(14,16,'configuration','PS_SHOP_PHONE','!=','0','','hook','actionAdminStoresControllerUpdate_optionsAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(15,17,'sql','SELECT COUNT(*) FROM PREFIX_contact','>','2','2','hook','actionObjectContactAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(16,18,'sql','SELECT COUNT(*) FROM PREFIX_contact','>','4','2','hook','actionObjectContactAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(17,12,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','99','1','hook','actionObjectProductAddAfter',0,'2018-01-17 09:54:55','2018-01-17 10:08:52'),(18,13,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','999','1','hook','actionObjectProductAddAfter',0,'2018-01-17 09:54:55','2018-01-17 10:08:52'),(19,14,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','9999','1','hook','actionObjectProductAddAfter',0,'2018-01-17 09:54:55','2018-01-17 10:08:52'),(20,15,'sql','SELECT COUNT(*) FROM PREFIX_product WHERE reference NOT LIKE \"demo_%\"','>','99999','1','hook','actionObjectProductAddAfter',0,'2018-01-17 09:54:55','2018-01-17 10:08:52'),(21,20,'install','','>=','7','','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(22,21,'configuration','PS_LOGO','!=','logo.jpg','1','hook','actionAdminThemesControllerUpdate_optionsAfter',1,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(23,22,'sql','SELECT COUNT(*) FROM PREFIX_theme WHERE directory != \"default\" AND directory != \"prestashop\" AND directory ! \"default-bootstrap\"','>','0','0','hook','actionObjectShopUpdateAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(24,23,'configuration','PS_LOGGED_ON_ADDONS','==','1','','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(25,24,'configuration','PS_MULTISHOP_FEATURE_ACTIVE','==','1','','hook','actionAdminPreferencesControllerUpdate_optionsAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(26,25,'sql','SELECT COUNT(*) FROM PREFIX_shop','>','1','1','hook','actionObjectShopAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(27,28,'sql','SELECT COUNT(*) FROM PREFIX_shop_group','>','1','1','hook','actionObjectShopGroupAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(28,26,'sql','SELECT COUNT(*) FROM PREFIX_shop','>','4','1','hook','actionObjectShopAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(29,27,'sql','SELECT COUNT(*) FROM PREFIX_shop_group','>','5','1','hook','actionObjectShopGroupAddAfter 	',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(30,30,'sql','SELECT COUNT(*) FROM PREFIX_carrier WHERE name NOT IN (\"0\", \"My carrier\")','>','2','0','hook','actionObjectCarrierAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(31,29,'sql','SELECT COUNT(distinct m.id_module) FROM PREFIX_hook h LEFT JOIN PREFIX_hook_module hm ON h.id_hook = hm.id_hook LEFT JOIN PREFIX_module m ON hm.id_module = m.id_module\r\nWHERE (h.name = \"displayPayment\" OR h.name = \"payment\") AND m.name NOT IN (\"bankwire\", \"cheque\", \"cashondelivery\")','>','2','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(32,31,'sql','SELECT SUM(total_paid_tax_excl / c.conversion_rate)\r\nFROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != \"XKBKNABJK\"','>=','300','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(33,32,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != \"XKBKNABJK\"','>=','3000','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(34,33,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1 AND reference != \"XKBKNABJK\"','>=','30000','0','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(35,34,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1','>=','300000','0','time','7',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(36,35,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1','>=','3000000','0','time','7',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(37,36,'sql',' 	SELECT SUM(total_paid_tax_excl / c.conversion_rate) FROM PREFIX_orders o INNER JOIN PREFIX_currency c ON c.id_currency = o.id_currency WHERE valid = 1','>=','30000000','0','time','7',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(38,37,'install','','>=','30','','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(39,38,'install','','>=','182','','time','2',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(40,39,'install','','>=','365','','time','2',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(41,41,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','10','2','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(42,42,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','100','2','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(43,43,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','1000','2','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(44,44,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','10000','2','time','2',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(45,45,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','100000','2','time','3',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(46,46,'sql','SELECT COUNT(*) FROM PREFIX_guest','>=','1000000','2','time','4',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(47,47,'sql','SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != \"b44a6d9efd7a0076a0fbce6b15eaf3b1\"','>=','2','0','hook','actionObjectCartAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(48,48,'sql','SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != \"b44a6d9efd7a0076a0fbce6b15eaf3b1\"','>=','10','0','hook','actionObjectCartAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(49,49,'sql','SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != \"b44a6d9efd7a0076a0fbce6b15eaf3b1\"','>=','100','0','hook','actionObjectCartAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(50,50,'sql','SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != \"b44a6d9efd7a0076a0fbce6b15eaf3b1\"','>=','1000','0','time','1',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(51,51,'sql','SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != \"b44a6d9efd7a0076a0fbce6b15eaf3b1\"','>=','10000','0','time','4',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(52,52,'sql','SELECT COUNT(*) FROM PREFIX_cart WHERE secure_key != \"b44a6d9efd7a0076a0fbce6b15eaf3b1\"','>=','100000','0','time','8',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(53,53,'sql','SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\")','>=','1','0','hook','actionObjectOrderAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(54,54,'sql','SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\")','>=','10','0','hook','actionObjectOrderAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(55,55,'sql','SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\")','>=','100','0','hook','actionObjectOrderAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(56,56,'sql','SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\")','>=','1000','0','time','2',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(57,57,'sql','SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\")','>=','10000','0','time','4',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(58,58,'sql','SELECT COUNT(*) FROM ps_orders WHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\")','>=','100000','0','time','8',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(59,65,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','1','0','hook','actionObjectCustomerThreadAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:57'),(60,66,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','10','0','hook','actionObjectCustomerThreadAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(61,67,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','100','0','hook','actionObjectCustomerThreadAddAfter',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(62,68,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','1000','0','time','2',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(63,69,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','10000','0','time','4',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(64,70,'sql','SELECT COUNT(*) FROM PREFIX_customer_thread','>=','100000','0','time','8',0,'2018-01-17 09:54:55','2018-01-17 09:54:58'),(65,59,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','1','0','hook','actionObjectCustomerAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(66,60,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','10','0','hook','actionObjectCustomerAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(67,61,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','100','0','hook','actionObjectCustomerAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(68,62,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','1000','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(69,63,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','10000','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(70,64,'sql','SELECT COUNT(*) FROM PREFIX_customer WHERE email != \"pub@prestashop.com\"','>=','100000','0','time','4',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(71,76,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"CA\",\r\n\"GL\",\r\n\"PM\",\r\n\"US\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(72,79,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"UM\",\r\n\"AS\",\r\n\"AU\",\r\n\"CK\",\r\n\"FJ\",\r\n\"FM\",\r\n\"GU\",\r\n\"KI\",\r\n\"MH,\"\r\n\"MP\",\r\n\"NC\",\r\n\"NF\",\r\n\"NR\",\r\n\"NU\",\r\n\"NZ\",\r\n\"PF\",\r\n\"PG\",\r\n\"PN\",\r\n\"PW\",\r\n\"SB\",\r\n\"TK\",\r\n\"TO\",\r\n\"TV\",\r\n\"VU\",\r\n\"WF\",\r\n\"WS\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(73,77,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"BZ\",\r\n\"CR\",\r\n\"GT\",\r\n\"HN\",\r\n\"MX\",\r\n\"NI\",\r\n\"PA\",\r\n\"SV\",\r\n\"AG\",\r\n\"AI\",\r\n\"AN\",\r\n\"AW\",\r\n\"BB\",\r\n\"BM\",\r\n\"BS\",\r\n\"CU\",\r\n\"DM\",\r\n\"DO\",\r\n\"GD\",\r\n\"GP\",\r\n\"HT\",\r\n\"JM\",\r\n\"KN\",\r\n\"KY\",\r\n\"LC\",\r\n\"MQ\",\r\n\"MS\",\r\n\"PR\",\r\n\"TC\",\r\n\"TT\",\r\n\"VC\",\r\n\"VG\",\r\n\"VI\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(74,78,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"AR\",\r\n\"BO\",\r\n\"BR\",\r\n\"CL\",\r\n\"CO\",\r\n\"EC\",\r\n\"FK\",\r\n\"GF\",\r\n\"GY\",\r\n\"PE\",\r\n\"PY\",\r\n\"SR\",\r\n\"UY\",\r\n\"VE\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(75,85,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"KG\",\r\n\"KZ\",\r\n\"TJ\",\r\n\"TM\",\r\n\"UZ\",\r\n\"AE\",\r\n\"AM\",\r\n\"AZ\",\r\n\"BH\",\r\n\"CY\",\r\n\"GE\",\r\n\"IL\",\r\n\"IQ\",\r\n\"IR\",\r\n\"JO\",\r\n\"KW\",\r\n\"LB\",\r\n\"OM\",\r\n\"QA\",\r\n\"SA\",\r\n\"SY\",\r\n\"TR\",\r\n\"YE\",\r\n\"AF\",\r\n\"BD\",\r\n\"BT\",\r\n\"IN\",\r\n\"IO\",\r\n\"LK\",\r\n\"MV\",\r\n\"NP\",\r\n\"PK\",\r\n\"CN\",\r\n\"HK\",\r\n\"JP\",\r\n\"KP\",\r\n\"KR\",\r\n\"MO\",\r\n\"TW\",\r\n\"MN\",\r\n\"BN\",\r\n\"CC\",\r\n\"CX\",\r\n\"ID\",\r\n\"KH\",\r\n\"LA\",\r\n\"MM\",\r\n\"MY\",\r\n\"PH\",\r\n\"SG\",\r\n\"TH\",\r\n\"TP\",\r\n\"VN\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(76,87,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"BE\",\r\n\"DE\",\r\n\"FR\",\r\n\"FX\",\r\n\"GB\",\r\n\"IE\",\r\n\"LU\",\r\n\"MC\",\r\n\"NL\",\r\n\"IT\",\r\n\"MT\",\r\n\"SM\",\r\n\"VA\",\r\n\"AD\",\r\n\"ES\",\r\n\"GI\",\r\n\"PT\",\r\n\"BY\",\r\n\"EE\",\r\n\"LT\",\r\n\"LV\",\r\n\"MD\",\r\n\"PL\",\r\n\"UA\",\r\n\"AL\",\r\n\"BA\",\r\n\"BG\",\r\n\"GR\",\r\n\"HR\",\r\n\"MK\",\r\n\"RO\",\r\n\"SI\",\r\n\"YU\",\r\n\"RU\",\r\n\"AT\",\r\n\"CH\",\r\n\"CZ\",\r\n\"HU\",\r\n\"LI\",\r\n\"SK\",\r\n\"DK\",\r\n\"FI\",\r\n\"FO\",\r\n\"IS\",\r\n\"NO\",\r\n\"SE\",\r\n\"SJ\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(77,88,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"BI\",\r\n\"CF\",\r\n\"CG\",\r\n\"RW\",\r\n\"TD\",\r\n\"ZR\",\r\n\"DJ\",\r\n\"ER\",\r\n\"ET\",\r\n\"KE\",\r\n\"SO\",\r\n\"TZ\",\r\n\"UG\",\r\n\"KM\",\r\n\"MG\",\r\n\"MU\",\r\n\"RE\",\r\n\"SC\",\r\n\"YT\",\r\n\"AO\",\r\n\"BW\",\r\n\"LS\",\r\n\"MW\",\r\n\"MZ\",\r\n\"NA\",\r\n\"SZ\",\r\n\"ZA\",\r\n\"ZM\",\r\n\"ZW\",\r\n\"BF\",\r\n\"BJ\",\r\n\"CI\",\r\n\"CM\",\r\n\"CV\",\r\n\"GA\",\r\n\"GH\",\r\n\"GM\",\r\n\"GN\",\r\n\"GQ\",\r\n\"GW\",\r\n\"LR\",\r\n\"ML\",\r\n\"MR\",\r\n\"NE\",\r\n\"NG\",\r\n\"SL\",\r\n\"SN\",\r\n\"ST\",\r\n\"TG\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(78,89,'sql','SELECT IFNULL(id_order, 0) FROM PREFIX_orders o LEFT JOIN PREFIX_address a ON o.id_address_delivery = a.id_address LEFT JOIN PREFIX_country c ON c.id_country = a.id_country WHERE o.valid = 1 AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\" AND c.iso_code IN (\r\n\"DZ\",\r\n\"EG\",\r\n\"EH\",\r\n\"LY\",\r\n\"MA\",\r\n\"SD\",\r\n\"TN\"\r\n)','!=','0','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(79,90,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','2','1','hook','actionObjectEmployeeAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(80,91,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','3','1','hook','actionObjectEmployeeAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(81,92,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','5','1','hook','actionObjectEmployeeAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(82,93,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','10','1','hook','actionObjectEmployeeAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(83,94,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','20','1','hook','actionObjectEmployeeAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(84,95,'sql','SELECT COUNT(*) FROM PREFIX_employee','>=','40','1','hook','actionObjectEmployeeAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(85,96,'sql','SELECT id_image FROM PREFIX_image WHERE id_image > 26','>','0','0','hook','actionObjectImageAddAfter',0,'2018-01-17 09:54:56','2018-01-17 10:11:21'),(86,97,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','50','2','hook','actionObjectImageAddAfter',0,'2018-01-17 09:54:56','2018-01-17 10:11:21'),(87,98,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','100','2','hook','actionObjectImageAddAfter',0,'2018-01-17 09:54:56','2018-01-17 10:11:21'),(88,99,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','1000','23','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(89,100,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','10000','23','time','4',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(90,101,'sql','SELECT COUNT(*) FROM PREFIX_image','>=','50000','23','time','8',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(91,102,'sql','SELECT id_cms FROM PREFIX_cms WHERE id_cms > 5','>','0','0','hook','actionObjectCMSAddAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(92,103,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','1','0','hook','actionObjectCartRuleAddAfter 	',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(93,104,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','10','0','hook','actionObjectCartRuleAddAfter 	',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(94,105,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','100','0','hook','actionObjectCartRuleAddAfter 	',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(95,107,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','500','0','hook','actionObjectCartRuleAddAfter 	',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(96,106,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','1000','0','hook','actionObjectCartRuleAddAfter 	',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(97,108,'sql','SELECT COUNT(*) FROM PREFIX_cart_rule','>=','5000','0','hook','actionObjectCartRuleAddAfter 	',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(98,109,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\") AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','1','0','hook','newOrder',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(99,110,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\") AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','10','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(100,111,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\") AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','100','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(101,113,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\") AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','1000','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(102,114,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\") AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','5000','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(103,112,'sql','SELECT COUNT(*) FROM PREFIX_orders o INNER JOIN PREFIX_address a ON a.id_address = o.id_address_delivery\r\nWHERE reference NOT IN (\"XKBKNABJK\", \"OHSATSERP\", \"FFATNOMMJ\", \"UOYEVOLI\", \"KHWLILZLL\") AND a.id_country != \"{config}PS_COUNTRY_DEFAULT{/config}\"','>=','10000','0','hook','actionOrderStatusUpdate',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(104,165,'sql','SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (\'25.76500500\', \'26.13793600\', \'26.00998700\', \'25.73629600\', \'25.88674000\') AND `longitude` NOT IN (\'-80.24379700\', \'-80.13943500\', \'-80.29447200\', \'-80.24479700\', \'-80.16329200\')','>','0','0','hook','actionAdminStoresControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(105,166,'sql','SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (\'25.76500500\', \'26.13793600\', \'26.00998700\', \'25.73629600\', \'25.88674000\') AND `longitude` NOT IN (\'-80.24379700\', \'-80.13943500\', \'-80.29447200\', \'-80.24479700\', \'-80.16329200\')','>','1','0','hook','actionAdminStoresControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(106,167,'sql','SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (\'25.76500500\', \'26.13793600\', \'26.00998700\', \'25.73629600\', \'25.88674000\') AND `longitude` NOT IN (\'-80.24379700\', \'-80.13943500\', \'-80.29447200\', \'-80.24479700\', \'-80.16329200\')','>','4','0','hook','actionAdminStoresControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(107,168,'sql','SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (\'25.76500500\', \'26.13793600\', \'26.00998700\', \'25.73629600\', \'25.88674000\') AND `longitude` NOT IN (\'-80.24379700\', \'-80.13943500\', \'-80.29447200\', \'-80.24479700\', \'-80.16329200\')','>','9','0','hook','actionAdminStoresControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(108,169,'sql','SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (\'25.76500500\', \'26.13793600\', \'26.00998700\', \'25.73629600\', \'25.88674000\') AND `longitude` NOT IN (\'-80.24379700\', \'-80.13943500\', \'-80.29447200\', \'-80.24479700\', \'-80.16329200\')','>','19','0','hook','actionAdminStoresControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(109,170,'sql','SELECT COUNT(s.`id_store`) FROM PREFIX_store s WHERE `latitude` NOT IN (\'25.76500500\', \'26.13793600\', \'26.00998700\', \'25.73629600\', \'25.88674000\') AND `longitude` NOT IN (\'-80.24379700\', \'-80.13943500\', \'-80.29447200\', \'-80.24479700\', \'-80.16329200\')','>','49','0','hook','actionAdminStoresControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(110,171,'sql','SELECT COUNT(*) FROM PREFIX_webservice_account','>=','1','0','hook','actionAdminWebserviceControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(111,172,'sql','SELECT COUNT(*) FROM PREFIX_webservice_account','>=','2','0','hook','actionAdminWebserviceControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(112,173,'sql','SELECT COUNT(*) FROM PREFIX_webservice_account','>=','3','0','hook','actionAdminWebserviceControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(113,174,'sql','SELECT COUNT(*) FROM PREFIX_webservice_account','>=','4','0','hook','actionAdminWebserviceControllerSaveAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(114,320,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%shopgate%\" ','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(115,322,'configuration','SHOPGATE_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(116,375,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%shopgate%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','1','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(117,376,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%shopgate%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(118,140,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%moneybookers%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(119,326,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'MONEYBOOKERS_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'MB_PAY_TO_EMAIL \') AND ( value != \'testaccount2@moneybookers.com \'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(120,377,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%moneybookers%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','1','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(121,394,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%sofortbanking%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(122,428,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%authorizeaim%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:57'),(123,429,'configuration','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'AUTHORIZEAIM_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'AUTHORIZE_AIM_SANDBOX\') AND ( value = \'0\'))','==','2','','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(124,430,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%authorizeaim%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(125,431,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%authorizeaim%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(126,136,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%ebay%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(127,209,'configuration','EBAY_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(128,358,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%ebay%\" AND os.logable = 1','>=','1','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(129,359,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%ebay%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(130,438,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%payplug%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(131,439,'configuration','PAYPLUG_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(132,440,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%payplug%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(133,441,'sql','SELECT SUM(o.total_paid) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%payplug%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','10000','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(134,442,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%affinityitems%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(135,443,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE name LIKE \'AFFINITYITEMS_CONFIGURATION_OK\' AND value = \'1\'','==','1','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(136,446,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%dpdpoland%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(137,447,'configuration','DPDPOLAND_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(138,448,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like \"%dpdpoland%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(139,449,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like \"%dpdpoland%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','100','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(140,450,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%envoimoinscher%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(141,451,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'ENVOIMOINSCHER_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'EMC_ENV \') AND ( value != \'TEST\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(142,452,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like \"%envoimoinscher%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(143,453,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like \"%envoimoinscher%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','100','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(144,454,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%klikandpay%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(145,455,'configuration','KLIKANDPAY_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(146,456,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%klikandpay%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(147,457,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%klikandpay%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(148,458,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%clickline%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(149,459,'configuration','CLICKLINE_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(150,460,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like \"%clickline%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(151,461,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state LEFT JOIN PREFIX_carrier c ON c.id_carrier = o.id_carrier WHERE c.name like \"%clickline%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','100','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(152,462,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%cdiscount%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(153,463,'sql','SELECT 1','!=','1','1','time','100',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(154,464,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%cdiscount%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(155,465,'sql','SELECT SUM(o.total_paid) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%cdiscount%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 365 DAY)','>=','500','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(156,467,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%erpillicopresta%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(157,468,'configuration','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'ERPILLICOPRESTA_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'ERP_LICENCE_VALIDITY \') AND ( value == \'1\')) OR (( name LIKE \'ERP_MONTH_FREE_ACTIVE \') AND ( value == \'0\'))','==','3','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(158,469,'sql','SELECT 1','!=','1','1','time','100',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(159,470,'sql','SELECT 1','!=','1','1','time','100',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(160,471,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%netreviews%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(161,472,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'NETREVIEWS_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'AVISVERIFIES_URLCERTIFICAT \') AND ( value IS NOT LIKE \'%preprod%\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(162,473,'sql','SELECT 1','!=','1','1','time','100',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(163,474,'sql','SELECT 1','!=','1','1','time','100',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(164,475,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%bluesnap%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(165,476,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'BLUESNAP_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'BLUESNAP_SANDBOX \') AND ( value NOT LIKE \'%sandbox%\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(166,477,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%bluesnap%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(167,478,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%bluesnap%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(168,479,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%desjardins%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(169,480,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'DESJARDINS_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'DESJARDINS_MODE \') AND ( value NOT LIKE \'%test%\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(170,481,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%desjardins%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(171,482,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%desjardins%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(172,483,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%firstdata%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(173,484,'configuration','FIRSTDATA_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(174,485,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%firstdata%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(175,486,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%firstdata%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(176,487,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%giveit%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(177,488,'sql','GIVEIT_CONFIGURATION_OK','>=','1','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(178,489,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(179,490,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(180,491,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%ganalytics%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(181,492,'configuration','GANALYTICS_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(182,493,'sql','SELECT 1','!=','1','1','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(183,494,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(184,496,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%pagseguro%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(185,497,'configuration','PAGSEGURO_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(186,498,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%pagseguro%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(187,499,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%pagseguro%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(188,500,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%paypalmx%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(189,501,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'PAYPALMX_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'PAYPAL_MX_SANDBOX\') AND ( value = \'0\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(190,502,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%paypalmx%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(191,503,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%paypalmx%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(192,505,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%paypalusa%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(193,506,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'PAYPALUSA_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'PAYPAL_USA_SANDBOX\') AND ( value = \'0\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(194,507,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%paypalusa%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(195,508,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%paypalmx%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(196,509,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%payulatam%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(197,510,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'PAYULATAM_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'PAYU_LATAM_TEST\') AND ( value = \'1\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(198,511,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%payulatam%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(199,512,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%payulatam%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(200,513,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%prestastats%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(201,514,'configuration','PRESTASTATS_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(202,515,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(203,516,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(204,517,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%riskified%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(205,518,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'RISKIFIED_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'RISKIFIED_MODE\') AND ( value = \'1\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(206,519,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%riskified%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(207,520,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%riskified%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(208,521,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%simplifycommerce%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(209,522,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'SIMPLIFY_CONFIGURATION_OK\') AND ( value = \'1\')) OR (( name LIKE \'SIMPLIFY_MODE\') AND ( value = \'1\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(210,523,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%simplifycommerce%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(211,524,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%simplifycommerce%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(212,525,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%vtpayment%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(213,526,'configuration','VTPAYMENT_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(214,527,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%vtpayment%\" AND os.logable = 1','>=','1','0','time','2',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(215,528,'sql','SELECT COUNT(*) FROM PREFIX_orders o LEFT JOIN PREFIX_order_state os ON os.id_order_state = o.current_state WHERE o.module like \"%vtpayment%\" AND os.logable = 1 AND o.date_add > DATE_SUB(NOW(), INTERVAL 90 DAY)','>=','30','0','time','7',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(216,529,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%yotpo%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(217,530,'configuration','YOTPO_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(218,531,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(219,532,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(220,533,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%yotpo%\"','==','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(221,534,'sql','SELECT COUNT(*) FROM PREFIX_configuration WHERE (( name LIKE \'YOUSTICERESOLUTIONSYSTEM_CONF_OK\') AND ( value = \'1\')) OR (( name LIKE \'YRS_SANDBOX\') AND ( value = \'0\'))','==','2','0','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(222,535,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(223,536,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(224,537,'sql','SELECT COUNT( id_module ) FROM PREFIX_module WHERE `name` like \"%loyaltylion%\"','>=','1','0','hook','actionModuleInstallAfter',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(225,538,'configuration','LOYALTYLION_CONFIGURATION_OK','==','1','','time','1',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(226,539,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58'),(227,540,'sql','SELECT 1','!=','1','1','time','365',0,'2018-01-17 09:54:56','2018-01-17 09:54:58');
/*!40000 ALTER TABLE `tb_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_condition_advice`
--

DROP TABLE IF EXISTS `tb_condition_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_condition_advice` (
  `id_condition` int(11) NOT NULL,
  `id_advice` int(11) NOT NULL,
  `display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_condition`,`id_advice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_condition_advice`
--

LOCK TABLES `tb_condition_advice` WRITE;
/*!40000 ALTER TABLE `tb_condition_advice` DISABLE KEYS */;
INSERT INTO `tb_condition_advice` VALUES (1,1,1),(1,2,1),(2,1,0);
/*!40000 ALTER TABLE `tb_condition_advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_condition_badge`
--

DROP TABLE IF EXISTS `tb_condition_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_condition_badge` (
  `id_condition` int(11) NOT NULL,
  `id_badge` int(11) NOT NULL,
  PRIMARY KEY (`id_condition`,`id_badge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_condition_badge`
--

LOCK TABLES `tb_condition_badge` WRITE;
/*!40000 ALTER TABLE `tb_condition_badge` DISABLE KEYS */;
INSERT INTO `tb_condition_badge` VALUES (1,131),(2,152),(3,115),(4,116),(5,116),(6,116),(7,117),(8,118),(9,119),(10,120),(11,121),(12,122),(13,123),(14,124),(15,125),(16,126),(17,127),(18,128),(19,129),(20,130),(21,132),(22,133),(23,134),(24,135),(25,136),(26,137),(27,138),(28,139),(29,140),(30,141),(31,142),(32,143),(33,144),(34,145),(35,146),(36,147),(37,148),(38,149),(39,150),(40,151),(41,153),(42,154),(43,155),(44,156),(45,157),(46,158),(47,159),(48,160),(49,161),(50,162),(51,163),(52,164),(53,165),(54,166),(55,167),(56,168),(57,169),(58,170),(59,171),(60,172),(61,173),(62,174),(63,175),(64,176),(65,177),(66,178),(67,179),(68,180),(69,181),(70,182),(71,183),(72,184),(73,185),(74,186),(75,187),(76,188),(77,189),(78,190),(79,191),(80,192),(81,193),(82,194),(83,195),(84,196),(85,197),(86,198),(87,199),(88,200),(89,201),(90,202),(91,203),(92,204),(93,205),(94,206),(95,207),(96,208),(97,209),(98,210),(99,211),(100,212),(101,213),(102,214),(103,215),(104,216),(105,217),(106,218),(107,219),(108,220),(109,221),(110,222),(111,223),(112,224),(113,225),(114,1),(115,2),(116,3),(117,4),(118,5),(119,6),(120,7),(121,8),(122,9),(123,10),(124,11),(125,12),(126,13),(127,14),(128,15),(129,16),(130,17),(131,18),(132,19),(133,20),(134,21),(135,22),(136,23),(137,24),(138,25),(139,26),(140,27),(141,28),(142,29),(143,30),(144,31),(145,32),(146,33),(147,34),(148,35),(149,36),(150,37),(151,38),(152,39),(153,40),(154,41),(155,42),(156,43),(157,44),(158,45),(159,46),(160,47),(161,48),(162,49),(163,50),(164,51),(165,52),(166,53),(167,54),(168,55),(169,56),(170,57),(171,58),(172,59),(173,60),(174,61),(175,62),(176,63),(177,64),(178,65),(179,66),(180,67),(181,68),(182,69),(183,70),(184,71),(185,72),(186,73),(187,74),(188,75),(189,76),(190,77),(191,78),(192,79),(193,80),(194,81),(195,82),(196,83),(197,84),(198,85),(199,86),(200,87),(201,88),(202,89),(203,90),(204,91),(205,92),(206,93),(207,94),(208,95),(209,96),(210,97),(211,98),(212,99),(213,100),(214,101),(215,102),(216,103),(217,104),(218,105),(219,106),(220,107),(221,108),(222,109),(223,110),(224,111),(225,112),(226,113),(227,114);
/*!40000 ALTER TABLE `tb_condition_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_configuration`
--

DROP TABLE IF EXISTS `tb_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_configuration` (
  `id_configuration` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(254) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_configuration`
--

LOCK TABLES `tb_configuration` WRITE;
/*!40000 ALTER TABLE `tb_configuration` DISABLE KEYS */;
INSERT INTO `tb_configuration` VALUES (1,NULL,NULL,'PS_LANG_DEFAULT','1','2018-01-17 09:45:56','2018-01-17 09:45:56'),(2,NULL,NULL,'PS_VERSION_DB','1.7.2.4','2018-01-17 09:45:56','2018-01-17 09:45:56'),(3,NULL,NULL,'PS_INSTALL_VERSION','1.7.2.4','2018-01-17 09:45:56','2018-01-17 09:45:56'),(4,NULL,NULL,'PS_SEARCH_INDEXATION','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,NULL,NULL,'PS_CARRIER_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,NULL,NULL,'PS_GROUP_FEATURE_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,NULL,NULL,'PS_CURRENCY_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,NULL,NULL,'PS_COUNTRY_DEFAULT','58','0000-00-00 00:00:00','2018-01-17 09:46:00'),(9,NULL,NULL,'PS_REWRITING_SETTINGS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,NULL,NULL,'PS_ORDER_OUT_OF_STOCK','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,NULL,NULL,'PS_LAST_QTIES','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,NULL,NULL,'PS_CONDITIONS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,NULL,NULL,'PS_RECYCLABLE_PACK','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,NULL,NULL,'PS_GIFT_WRAPPING','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,NULL,NULL,'PS_GIFT_WRAPPING_PRICE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,NULL,NULL,'PS_STOCK_MANAGEMENT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,NULL,NULL,'PS_NAVIGATION_PIPE','>','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,NULL,NULL,'PS_PRODUCTS_PER_PAGE','12','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,NULL,NULL,'PS_PURCHASE_MINIMUM','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,NULL,NULL,'PS_PRODUCTS_ORDER_WAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,NULL,NULL,'PS_PRODUCTS_ORDER_BY','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,NULL,NULL,'PS_DISPLAY_QTIES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,NULL,NULL,'PS_SHIPPING_HANDLING','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,NULL,NULL,'PS_SHIPPING_FREE_PRICE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,NULL,NULL,'PS_SHIPPING_FREE_WEIGHT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,NULL,NULL,'PS_SHIPPING_METHOD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,NULL,NULL,'PS_TAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,NULL,NULL,'PS_SHOP_ENABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,NULL,NULL,'PS_NB_DAYS_NEW_PRODUCT','20','0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,NULL,NULL,'PS_SSL_ENABLED','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,NULL,NULL,'PS_WEIGHT_UNIT','kg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,NULL,NULL,'PS_BLOCK_CART_AJAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,NULL,NULL,'PS_ORDER_RETURN','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,NULL,NULL,'PS_ORDER_RETURN_NB_DAYS','14','0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,NULL,NULL,'PS_MAIL_TYPE','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,NULL,NULL,'PS_PRODUCT_PICTURE_MAX_SIZE','8388608','0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,NULL,NULL,'PS_PRODUCT_PICTURE_WIDTH','64','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,NULL,NULL,'PS_PRODUCT_PICTURE_HEIGHT','64','0000-00-00 00:00:00','0000-00-00 00:00:00'),(39,NULL,NULL,'PS_INVOICE_PREFIX','#IN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,NULL,NULL,'PS_INVCE_INVOICE_ADDR_RULES','{\"avoid\":[]}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,NULL,NULL,'PS_INVCE_DELIVERY_ADDR_RULES','{\"avoid\":[]}','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,NULL,NULL,'PS_DELIVERY_PREFIX','#DE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,NULL,NULL,'PS_DELIVERY_NUMBER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,NULL,NULL,'PS_RETURN_PREFIX','#RE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,NULL,NULL,'PS_INVOICE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,NULL,NULL,'PS_PASSWD_TIME_BACK','360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,NULL,NULL,'PS_PASSWD_TIME_FRONT','360','0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,NULL,NULL,'PS_PASSWD_RESET_VALIDITY','1440','0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,NULL,NULL,'PS_DISP_UNAVAILABLE_ATTR','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,NULL,NULL,'PS_SEARCH_MINWORDLEN','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,NULL,NULL,'PS_SEARCH_BLACKLIST','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,NULL,NULL,'PS_SEARCH_WEIGHT_PNAME','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,NULL,NULL,'PS_SEARCH_WEIGHT_REF','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,NULL,NULL,'PS_SEARCH_WEIGHT_SHORTDESC','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,NULL,NULL,'PS_SEARCH_WEIGHT_DESC','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,NULL,NULL,'PS_SEARCH_WEIGHT_CNAME','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,NULL,NULL,'PS_SEARCH_WEIGHT_MNAME','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,NULL,NULL,'PS_SEARCH_WEIGHT_TAG','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,NULL,NULL,'PS_SEARCH_WEIGHT_ATTRIBUTE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,NULL,NULL,'PS_SEARCH_WEIGHT_FEATURE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,NULL,NULL,'PS_SEARCH_AJAX','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,NULL,NULL,'PS_TIMEZONE','America/Manaus','0000-00-00 00:00:00','2018-01-17 09:46:00'),(63,NULL,NULL,'PS_THEME_V11','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,NULL,NULL,'PRESTASTORE_LIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,NULL,NULL,'PS_TIN_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,NULL,NULL,'PS_SHOW_ALL_MODULES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,NULL,NULL,'PS_BACKUP_ALL','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,NULL,NULL,'PS_1_3_UPDATE_DATE','2011-12-27 10:20:42','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,NULL,NULL,'PS_PRICE_ROUND_MODE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,NULL,NULL,'PS_1_3_2_UPDATE_DATE','2011-12-27 10:20:42','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,NULL,NULL,'PS_CONDITIONS_CMS_ID','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,NULL,NULL,'TRACKING_DIRECT_TRAFFIC','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,NULL,NULL,'PS_VOLUME_UNIT','cl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,NULL,NULL,'PS_CIPHER_ALGORITHM','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,NULL,NULL,'PS_ATTRIBUTE_CATEGORY_DISPLAY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,NULL,NULL,'PS_CUSTOMER_SERVICE_FILE_UPLOAD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,NULL,NULL,'PS_CUSTOMER_SERVICE_SIGNATURE','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,NULL,NULL,'PS_BLOCK_BESTSELLERS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,NULL,NULL,'PS_BLOCK_NEWPRODUCTS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,NULL,NULL,'PS_BLOCK_SPECIALS_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,NULL,NULL,'PS_STOCK_MVT_REASON_DEFAULT','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,NULL,NULL,'PS_SPECIFIC_PRICE_PRIORITIES','id_shop;id_currency;id_country;id_group','0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,NULL,NULL,'PS_TAX_DISPLAY','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,NULL,NULL,'PS_SMARTY_FORCE_COMPILE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,NULL,NULL,'PS_DISTANCE_UNIT','km','0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,NULL,NULL,'PS_STORES_DISPLAY_CMS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,NULL,NULL,'SHOP_LOGO_WIDTH','200','0000-00-00 00:00:00','2018-01-17 10:46:20'),(88,NULL,NULL,'SHOP_LOGO_HEIGHT','40','0000-00-00 00:00:00','2018-01-17 10:46:20'),(89,NULL,NULL,'EDITORIAL_IMAGE_WIDTH','530','0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,NULL,NULL,'EDITORIAL_IMAGE_HEIGHT','228','0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,NULL,NULL,'PS_STATSDATA_CUSTOMER_PAGESVIEWS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,NULL,NULL,'PS_STATSDATA_PAGESVIEWS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,NULL,NULL,'PS_STATSDATA_PLUGINS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,NULL,NULL,'PS_GEOLOCATION_ENABLED','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,NULL,NULL,'PS_ALLOWED_COUNTRIES','AF;ZA;AX;AL;DZ;DE;AD;AO;AI;AQ;AG;AN;SA;AR;AM;AW;AU;AT;AZ;BS;BH;BD;BB;BY;BE;BZ;BJ;BM;BT;BO;BA;BW;BV;BR;BN;BG;BF;MM;BI;KY;KH;CM;CA;CV;CF;CL;CN;CX;CY;CC;CO;KM;CG;CD;CK;KR;KP;CR;CI;HR;CU;DK;DJ;DM;EG;IE;SV;AE;EC;ER;ES;EE;ET;FK;FO;FJ;FI;FR;GA;GM;GE;GS;GH;GI;GR;GD;GL;GP;GU;GT;GG;GN;GQ;GW;GY;GF;HT;HM;HN;HK;HU;IM;MU;VG;VI;IN;ID;IR;IQ;IS;IL;IT;JM;JP;JE;JO;KZ;KE;KG;KI;KW;LA;LS;LV;LB;LR;LY;LI;LT;LU;MO;MK;MG;MY;MW;MV;ML;MT;MP;MA;MH;MQ;MR;YT;MX;FM;MD;MC;MN;ME;MS;MZ;NA;NR;NP;NI;NE;NG;NU;NF;NO;NC;NZ;IO;OM;UG;UZ;PK;PW;PS;PA;PG;PY;NL;PE;PH;PN;PL;PF;PR;PT;QA;DO;CZ;RE;RO;GB;RU;RW;EH;BL;KN;SM;MF;PM;VA;VC;LC;SB;WS;AS;ST;SN;RS;SC;SL;SG;SK;SI;SO;SD;LK;SE;CH;SR;SJ;SZ;SY;TJ;TW;TZ;TD;TF;TH;TL;TG;TK;TO;TT;TN;TM;TC;TR;TV;UA;UY;US;VU;VE;VN;WF;YE;ZM;ZW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,NULL,NULL,'PS_GEOLOCATION_BEHAVIOR','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,NULL,NULL,'PS_LOCALE_LANGUAGE','pt','0000-00-00 00:00:00','2018-01-17 09:46:00'),(98,NULL,NULL,'PS_LOCALE_COUNTRY','br','0000-00-00 00:00:00','2018-01-17 09:46:00'),(99,NULL,NULL,'PS_ATTACHMENT_MAXIMUM_SIZE','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,NULL,NULL,'PS_SMARTY_CACHE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,NULL,NULL,'PS_DIMENSION_UNIT','cm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,NULL,NULL,'PS_GUEST_CHECKOUT_ENABLED','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(103,NULL,NULL,'PS_DISPLAY_SUPPLIERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,NULL,NULL,'PS_DISPLAY_BEST_SELLERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(105,NULL,NULL,'PS_CATALOG_MODE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,NULL,NULL,'PS_GEOLOCATION_WHITELIST','127;209.185.108;209.185.253;209.85.238;209.85.238.11;209.85.238.4;216.239.33.96;216.239.33.97;216.239.33.98;216.239.33.99;216.239.37.98;216.239.37.99;216.239.39.98;216.239.39.99;216.239.41.96;216.239.41.97;216.239.41.98;216.239.41.99;216.239.45.4;216.239.46;216.239.51.96;216.239.51.97;216.239.51.98;216.239.51.99;216.239.53.98;216.239.53.99;216.239.57.96;91.240.109;216.239.57.97;216.239.57.98;216.239.57.99;216.239.59.98;216.239.59.99;216.33.229.163;64.233.173.193;64.233.173.194;64.233.173.195;64.233.173.196;64.233.173.197;64.233.173.198;64.233.173.199;64.233.173.200;64.233.173.201;64.233.173.202;64.233.173.203;64.233.173.204;64.233.173.205;64.233.173.206;64.233.173.207;64.233.173.208;64.233.173.209;64.233.173.210;64.233.173.211;64.233.173.212;64.233.173.213;64.233.173.214;64.233.173.215;64.233.173.216;64.233.173.217;64.233.173.218;64.233.173.219;64.233.173.220;64.233.173.221;64.233.173.222;64.233.173.223;64.233.173.224;64.233.173.225;64.233.173.226;64.233.173.227;64.233.173.228;64.233.173.229;64.233.173.230;64.233.173.231;64.233.173.232;64.233.173.233;64.233.173.234;64.233.173.235;64.233.173.236;64.233.173.237;64.233.173.238;64.233.173.239;64.233.173.240;64.233.173.241;64.233.173.242;64.233.173.243;64.233.173.244;64.233.173.245;64.233.173.246;64.233.173.247;64.233.173.248;64.233.173.249;64.233.173.250;64.233.173.251;64.233.173.252;64.233.173.253;64.233.173.254;64.233.173.255;64.68.80;64.68.81;64.68.82;64.68.83;64.68.84;64.68.85;64.68.86;64.68.87;64.68.88;64.68.89;64.68.90.1;64.68.90.10;64.68.90.11;64.68.90.12;64.68.90.129;64.68.90.13;64.68.90.130;64.68.90.131;64.68.90.132;64.68.90.133;64.68.90.134;64.68.90.135;64.68.90.136;64.68.90.137;64.68.90.138;64.68.90.139;64.68.90.14;64.68.90.140;64.68.90.141;64.68.90.142;64.68.90.143;64.68.90.144;64.68.90.145;64.68.90.146;64.68.90.147;64.68.90.148;64.68.90.149;64.68.90.15;64.68.90.150;64.68.90.151;64.68.90.152;64.68.90.153;64.68.90.154;64.68.90.155;64.68.90.156;64.68.90.157;64.68.90.158;64.68.90.159;64.68.90.16;64.68.90.160;64.68.90.161;64.68.90.162;64.68.90.163;64.68.90.164;64.68.90.165;64.68.90.166;64.68.90.167;64.68.90.168;64.68.90.169;64.68.90.17;64.68.90.170;64.68.90.171;64.68.90.172;64.68.90.173;64.68.90.174;64.68.90.175;64.68.90.176;64.68.90.177;64.68.90.178;64.68.90.179;64.68.90.18;64.68.90.180;64.68.90.181;64.68.90.182;64.68.90.183;64.68.90.184;64.68.90.185;64.68.90.186;64.68.90.187;64.68.90.188;64.68.90.189;64.68.90.19;64.68.90.190;64.68.90.191;64.68.90.192;64.68.90.193;64.68.90.194;64.68.90.195;64.68.90.196;64.68.90.197;64.68.90.198;64.68.90.199;64.68.90.2;64.68.90.20;64.68.90.200;64.68.90.201;64.68.90.202;64.68.90.203;64.68.90.204;64.68.90.205;64.68.90.206;64.68.90.207;64.68.90.208;64.68.90.21;64.68.90.22;64.68.90.23;64.68.90.24;64.68.90.25;64.68.90.26;64.68.90.27;64.68.90.28;64.68.90.29;64.68.90.3;64.68.90.30;64.68.90.31;64.68.90.32;64.68.90.33;64.68.90.34;64.68.90.35;64.68.90.36;64.68.90.37;64.68.90.38;64.68.90.39;64.68.90.4;64.68.90.40;64.68.90.41;64.68.90.42;64.68.90.43;64.68.90.44;64.68.90.45;64.68.90.46;64.68.90.47;64.68.90.48;64.68.90.49;64.68.90.5;64.68.90.50;64.68.90.51;64.68.90.52;64.68.90.53;64.68.90.54;64.68.90.55;64.68.90.56;64.68.90.57;64.68.90.58;64.68.90.59;64.68.90.6;64.68.90.60;64.68.90.61;64.68.90.62;64.68.90.63;64.68.90.64;64.68.90.65;64.68.90.66;64.68.90.67;64.68.90.68;64.68.90.69;64.68.90.7;64.68.90.70;64.68.90.71;64.68.90.72;64.68.90.73;64.68.90.74;64.68.90.75;64.68.90.76;64.68.90.77;64.68.90.78;64.68.90.79;64.68.90.8;64.68.90.80;64.68.90.9;64.68.91;64.68.92;66.249.64;66.249.65;66.249.66;66.249.67;66.249.68;66.249.69;66.249.70;66.249.71;66.249.72;66.249.73;66.249.78;66.249.79;72.14.199;8.6.48','0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,NULL,NULL,'PS_LOGS_BY_EMAIL','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,NULL,NULL,'PS_COOKIE_CHECKIP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,NULL,NULL,'PS_USE_ECOTAX','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,NULL,NULL,'PS_CANONICAL_REDIRECT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,NULL,NULL,'PS_IMG_UPDATE_TIME','1516200380','0000-00-00 00:00:00','2018-01-17 10:46:20'),(112,NULL,NULL,'PS_BACKUP_DROP_TABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,NULL,NULL,'PS_OS_CHEQUE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,NULL,NULL,'PS_OS_PAYMENT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,NULL,NULL,'PS_OS_PREPARATION','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,NULL,NULL,'PS_OS_SHIPPING','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,NULL,NULL,'PS_OS_DELIVERED','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,NULL,NULL,'PS_OS_CANCELED','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,NULL,NULL,'PS_OS_REFUND','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,NULL,NULL,'PS_OS_ERROR','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,NULL,NULL,'PS_OS_OUTOFSTOCK','9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,NULL,NULL,'PS_OS_BANKWIRE','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,NULL,NULL,'PS_OS_WS_PAYMENT','11','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,NULL,NULL,'PS_OS_OUTOFSTOCK_PAID','9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,NULL,NULL,'PS_OS_OUTOFSTOCK_UNPAID','12','0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,NULL,NULL,'PS_OS_COD_VALIDATION','13','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,NULL,NULL,'PS_LEGACY_IMAGES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,NULL,NULL,'PS_IMAGE_QUALITY','png','0000-00-00 00:00:00','2018-01-17 09:46:29'),(129,NULL,NULL,'PS_PNG_QUALITY','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,NULL,NULL,'PS_JPEG_QUALITY','90','0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,NULL,NULL,'PS_COOKIE_LIFETIME_FO','480','0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,NULL,NULL,'PS_COOKIE_LIFETIME_BO','480','0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,NULL,NULL,'PS_RESTRICT_DELIVERED_COUNTRIES','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,NULL,NULL,'PS_SHOW_NEW_ORDERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,NULL,NULL,'PS_SHOW_NEW_CUSTOMERS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,NULL,NULL,'PS_SHOW_NEW_MESSAGES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,NULL,NULL,'PS_FEATURE_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(138,NULL,NULL,'PS_COMBINATION_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,NULL,NULL,'PS_SPECIFIC_PRICE_FEATURE_ACTIVE',NULL,'0000-00-00 00:00:00','2018-01-17 10:08:47'),(140,NULL,NULL,'PS_VIRTUAL_PROD_FEATURE_ACTIVE','1','0000-00-00 00:00:00','2018-01-17 10:08:50'),(141,NULL,NULL,'PS_CUSTOMIZATION_FEATURE_ACTIVE','1','0000-00-00 00:00:00','2018-01-17 10:19:50'),(142,NULL,NULL,'PS_CART_RULE_FEATURE_ACTIVE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,NULL,NULL,'PS_PACK_FEATURE_ACTIVE',NULL,'0000-00-00 00:00:00','2018-01-17 11:03:21'),(144,NULL,NULL,'PS_ALIAS_FEATURE_ACTIVE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,NULL,NULL,'PS_TAX_ADDRESS_TYPE','id_address_delivery','0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,NULL,NULL,'PS_SHOP_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,NULL,NULL,'PS_CARRIER_DEFAULT_SORT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(148,NULL,NULL,'PS_STOCK_MVT_INC_REASON_DEFAULT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,NULL,NULL,'PS_STOCK_MVT_DEC_REASON_DEFAULT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,NULL,NULL,'PS_ADVANCED_STOCK_MANAGEMENT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,NULL,NULL,'PS_STOCK_MVT_TRANSFER_TO','7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,NULL,NULL,'PS_STOCK_MVT_TRANSFER_FROM','6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(153,NULL,NULL,'PS_CARRIER_DEFAULT_ORDER','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,NULL,NULL,'PS_STOCK_MVT_SUPPLY_ORDER','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,NULL,NULL,'PS_STOCK_CUSTOMER_ORDER_CANCEL_REASON','9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,NULL,NULL,'PS_STOCK_CUSTOMER_RETURN_REASON','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,NULL,NULL,'PS_STOCK_MVT_INC_EMPLOYEE_EDITION','11','0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,NULL,NULL,'PS_STOCK_MVT_DEC_EMPLOYEE_EDITION','12','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,NULL,NULL,'PS_STOCK_CUSTOMER_ORDER_REASON','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,NULL,NULL,'PS_UNIDENTIFIED_GROUP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,NULL,NULL,'PS_GUEST_GROUP','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,NULL,NULL,'PS_CUSTOMER_GROUP','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,NULL,NULL,'PS_SMARTY_CONSOLE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,NULL,NULL,'PS_INVOICE_MODEL','invoice','0000-00-00 00:00:00','0000-00-00 00:00:00'),(165,NULL,NULL,'PS_LIMIT_UPLOAD_IMAGE_VALUE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,NULL,NULL,'PS_LIMIT_UPLOAD_FILE_VALUE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(167,NULL,NULL,'MB_PAY_TO_EMAIL','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(168,NULL,NULL,'MB_SECRET_WORD','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(169,NULL,NULL,'MB_HIDE_LOGIN','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,NULL,NULL,'MB_ID_LOGO','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,NULL,NULL,'MB_ID_LOGO_WALLET','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,NULL,NULL,'MB_PARAMETERS','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,NULL,NULL,'MB_PARAMETERS_2','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,NULL,NULL,'MB_DISPLAY_MODE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,NULL,NULL,'MB_CANCEL_URL','http://www.yoursite.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,NULL,NULL,'MB_LOCAL_METHODS','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,NULL,NULL,'MB_INTER_METHODS','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,NULL,NULL,'BANK_WIRE_CURRENCIES','2,1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,NULL,NULL,'CHEQUE_CURRENCIES','2,1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,NULL,NULL,'PRODUCTS_VIEWED_NBR','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(181,NULL,NULL,'BLOCK_CATEG_DHTML','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(182,NULL,NULL,'BLOCK_CATEG_MAX_DEPTH','4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(183,NULL,NULL,'MANUFACTURER_DISPLAY_FORM','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(184,NULL,NULL,'MANUFACTURER_DISPLAY_TEXT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(185,NULL,NULL,'MANUFACTURER_DISPLAY_TEXT_NB','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(186,NULL,NULL,'NEW_PRODUCTS_NBR','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(187,NULL,NULL,'PS_TOKEN_ENABLE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(188,NULL,NULL,'PS_STATS_RENDER','graphnvd3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(189,NULL,NULL,'PS_STATS_OLD_CONNECT_AUTO_CLEAN','never','0000-00-00 00:00:00','0000-00-00 00:00:00'),(190,NULL,NULL,'PS_STATS_GRID_RENDER','gridhtml','0000-00-00 00:00:00','0000-00-00 00:00:00'),(191,NULL,NULL,'BLOCKTAGS_NBR','10','0000-00-00 00:00:00','0000-00-00 00:00:00'),(192,NULL,NULL,'CHECKUP_DESCRIPTIONS_LT','100','0000-00-00 00:00:00','0000-00-00 00:00:00'),(193,NULL,NULL,'CHECKUP_DESCRIPTIONS_GT','400','0000-00-00 00:00:00','0000-00-00 00:00:00'),(194,NULL,NULL,'CHECKUP_IMAGES_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(195,NULL,NULL,'CHECKUP_IMAGES_GT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(196,NULL,NULL,'CHECKUP_SALES_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(197,NULL,NULL,'CHECKUP_SALES_GT','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(198,NULL,NULL,'CHECKUP_STOCK_LT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(199,NULL,NULL,'CHECKUP_STOCK_GT','3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(200,NULL,NULL,'FOOTER_CMS','0_3|0_4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,NULL,NULL,'FOOTER_BLOCK_ACTIVATION','0_3|0_4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(202,NULL,NULL,'FOOTER_POWEREDBY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(203,NULL,NULL,'BLOCKADVERT_LINK','http://www.prestashop.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(204,NULL,NULL,'BLOCKSTORE_IMG','store.jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(205,NULL,NULL,'BLOCKADVERT_IMG_EXT','jpg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(206,NULL,NULL,'MOD_BLOCKTOPMENU_ITEMS','CAT3,CAT26','0000-00-00 00:00:00','2018-01-17 09:46:17'),(207,NULL,NULL,'MOD_BLOCKTOPMENU_SEARCH','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(208,NULL,NULL,'BLOCKSOCIAL_FACEBOOK',NULL,'0000-00-00 00:00:00','2018-01-17 09:46:17'),(209,NULL,NULL,'BLOCKSOCIAL_TWITTER',NULL,'0000-00-00 00:00:00','2018-01-17 09:46:17'),(210,NULL,NULL,'BLOCKSOCIAL_RSS',NULL,'0000-00-00 00:00:00','2018-01-17 09:46:17'),(211,NULL,NULL,'BLOCKCONTACTINFOS_COMPANY','Your company','0000-00-00 00:00:00','0000-00-00 00:00:00'),(212,NULL,NULL,'BLOCKCONTACTINFOS_ADDRESS','Address line 1\nCity\nCountry','0000-00-00 00:00:00','0000-00-00 00:00:00'),(213,NULL,NULL,'BLOCKCONTACTINFOS_PHONE','0123-456-789','0000-00-00 00:00:00','0000-00-00 00:00:00'),(214,NULL,NULL,'BLOCKCONTACTINFOS_EMAIL','pub@prestashop.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(215,NULL,NULL,'BLOCKCONTACT_TELNUMBER','0123-456-789','0000-00-00 00:00:00','0000-00-00 00:00:00'),(216,NULL,NULL,'BLOCKCONTACT_EMAIL','pub@prestashop.com','0000-00-00 00:00:00','0000-00-00 00:00:00'),(217,NULL,NULL,'SUPPLIER_DISPLAY_TEXT','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(218,NULL,NULL,'SUPPLIER_DISPLAY_TEXT_NB','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(219,NULL,NULL,'SUPPLIER_DISPLAY_FORM','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(220,NULL,NULL,'BLOCK_CATEG_NBR_COLUMN_FOOTER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(221,NULL,NULL,'UPGRADER_BACKUPDB_FILENAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(222,NULL,NULL,'UPGRADER_BACKUPFILES_FILENAME','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(223,NULL,NULL,'BLOCKREINSURANCE_NBBLOCKS','5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(224,NULL,NULL,'HOMESLIDER_WIDTH','535','0000-00-00 00:00:00','0000-00-00 00:00:00'),(225,NULL,NULL,'HOMESLIDER_SPEED','5000','0000-00-00 00:00:00','2018-01-17 09:46:16'),(226,NULL,NULL,'HOMESLIDER_PAUSE','7700','0000-00-00 00:00:00','0000-00-00 00:00:00'),(227,NULL,NULL,'HOMESLIDER_LOOP','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(228,NULL,NULL,'PS_BASE_DISTANCE_UNIT','m','0000-00-00 00:00:00','0000-00-00 00:00:00'),(229,NULL,NULL,'PS_SHOP_DOMAIN','localhost','0000-00-00 00:00:00','0000-00-00 00:00:00'),(230,NULL,NULL,'PS_SHOP_DOMAIN_SSL','localhost','0000-00-00 00:00:00','0000-00-00 00:00:00'),(231,NULL,NULL,'PS_SHOP_NAME','ImportCG','0000-00-00 00:00:00','2018-01-17 09:46:00'),(232,NULL,NULL,'PS_SHOP_EMAIL','thiagoaraujoberbet@gmail.com','0000-00-00 00:00:00','2018-01-17 09:46:01'),(233,NULL,NULL,'PS_MAIL_METHOD','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(234,NULL,NULL,'PS_SHOP_ACTIVITY','0','0000-00-00 00:00:00','2018-01-17 09:46:00'),(235,NULL,NULL,'PS_LOGO','importcg-logo-1516200380.jpg','0000-00-00 00:00:00','2018-01-17 10:46:20'),(236,NULL,NULL,'PS_FAVICON','favicon.ico','0000-00-00 00:00:00','0000-00-00 00:00:00'),(237,NULL,NULL,'PS_STORES_ICON','logo_stores.png','0000-00-00 00:00:00','0000-00-00 00:00:00'),(238,NULL,NULL,'PS_ROOT_CATEGORY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(239,NULL,NULL,'PS_HOME_CATEGORY','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(240,NULL,NULL,'PS_CONFIGURATION_AGREMENT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(241,NULL,NULL,'PS_MAIL_SERVER','smtp.','0000-00-00 00:00:00','0000-00-00 00:00:00'),(242,NULL,NULL,'PS_MAIL_USER','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(243,NULL,NULL,'PS_MAIL_PASSWD','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(244,NULL,NULL,'PS_MAIL_SMTP_ENCRYPTION','off','0000-00-00 00:00:00','0000-00-00 00:00:00'),(245,NULL,NULL,'PS_MAIL_SMTP_PORT','25','0000-00-00 00:00:00','0000-00-00 00:00:00'),(246,NULL,NULL,'PS_MAIL_COLOR','#db3484','0000-00-00 00:00:00','0000-00-00 00:00:00'),(247,NULL,NULL,'NW_SALT','PYfHTCFyzuHPBeiW','0000-00-00 00:00:00','2018-01-17 09:46:16'),(248,NULL,NULL,'PS_PAYMENT_LOGO_CMS_ID','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(249,NULL,NULL,'HOME_FEATURED_NBR','8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(250,NULL,NULL,'SEK_MIN_OCCURENCES','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(251,NULL,NULL,'SEK_FILTER_KW','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(252,NULL,NULL,'PS_ALLOW_MOBILE_DEVICE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(253,NULL,NULL,'PS_CUSTOMER_CREATION_EMAIL','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(254,NULL,NULL,'PS_SMARTY_CONSOLE_KEY','SMARTY_DEBUG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(255,NULL,NULL,'PS_DASHBOARD_USE_PUSH','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(256,NULL,NULL,'PS_ATTRIBUTE_ANCHOR_SEPARATOR','-','0000-00-00 00:00:00','0000-00-00 00:00:00'),(257,NULL,NULL,'CONF_AVERAGE_PRODUCT_MARGIN','40','0000-00-00 00:00:00','0000-00-00 00:00:00'),(258,NULL,NULL,'PS_DASHBOARD_SIMULATION','0','0000-00-00 00:00:00','2018-01-17 13:40:15'),(259,NULL,NULL,'PS_USE_HTMLPURIFIER','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(260,NULL,NULL,'PS_SMARTY_CACHING_TYPE','filesystem','0000-00-00 00:00:00','0000-00-00 00:00:00'),(261,NULL,NULL,'PS_SMARTY_LOCAL','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(262,NULL,NULL,'PS_SMARTY_CLEAR_CACHE','everytime','0000-00-00 00:00:00','0000-00-00 00:00:00'),(263,NULL,NULL,'PS_DETECT_LANG','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(264,NULL,NULL,'PS_DETECT_COUNTRY','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(265,NULL,NULL,'PS_ROUND_TYPE','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(266,NULL,NULL,'PS_PRICE_DISPLAY_PRECISION','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(267,NULL,NULL,'PS_LOG_EMAILS','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(268,NULL,NULL,'PS_CUSTOMER_OPTIN','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(269,NULL,NULL,'PS_CUSTOMER_BIRTHDATE','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(270,NULL,NULL,'PS_PACK_STOCK_TYPE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(271,NULL,NULL,'PS_LOG_MODULE_PERFS_MODULO','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(272,NULL,NULL,'PS_DISALLOW_HISTORY_REORDERING','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(273,NULL,NULL,'PS_DISPLAY_PRODUCT_WEIGHT','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(274,NULL,NULL,'PS_PRODUCT_WEIGHT_PRECISION','2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(275,NULL,NULL,'PS_ACTIVE_CRONJOB_EXCHANGE_RATE','0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(276,NULL,NULL,'PS_ORDER_RECALCULATE_SHIPPING','1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(277,NULL,NULL,'PS_MAINTENANCE_TEXT','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(278,NULL,NULL,'PS_PRODUCT_SHORT_DESC_LIMIT','800','0000-00-00 00:00:00','0000-00-00 00:00:00'),(279,NULL,NULL,'DASHACTIVITY_CART_ACTIVE','30','2018-01-17 09:46:14','2018-01-17 09:46:14'),(280,NULL,NULL,'DASHACTIVITY_CART_ABANDONED_MIN','24','2018-01-17 09:46:14','2018-01-17 09:46:14'),(281,NULL,NULL,'DASHACTIVITY_CART_ABANDONED_MAX','48','2018-01-17 09:46:15','2018-01-17 09:46:15'),(282,NULL,NULL,'DASHACTIVITY_VISITOR_ONLINE','30','2018-01-17 09:46:15','2018-01-17 09:46:15'),(283,NULL,NULL,'PS_DASHGOALS_CURRENT_YEAR','2018','2018-01-17 09:46:15','2018-01-17 09:46:15'),(284,NULL,NULL,'DASHPRODUCT_NBR_SHOW_LAST_ORDER','10','2018-01-17 09:46:15','2018-01-17 09:46:15'),(285,NULL,NULL,'DASHPRODUCT_NBR_SHOW_BEST_SELLER','10','2018-01-17 09:46:15','2018-01-17 09:46:15'),(286,NULL,NULL,'DASHPRODUCT_NBR_SHOW_MOST_VIEWED','10','2018-01-17 09:46:15','2018-01-17 09:46:15'),(287,NULL,NULL,'DASHPRODUCT_NBR_SHOW_TOP_SEARCH','10','2018-01-17 09:46:15','2018-01-17 09:46:15'),(288,NULL,NULL,'BANNER_IMG',NULL,'2018-01-17 09:46:15','2018-01-17 09:46:15'),(289,NULL,NULL,'BANNER_LINK',NULL,'2018-01-17 09:46:15','2018-01-17 09:46:15'),(290,NULL,NULL,'BANNER_DESC',NULL,'2018-01-17 09:46:15','2018-01-17 09:46:15'),(291,NULL,NULL,'BLOCK_CATEG_ROOT_CATEGORY','1','2018-01-17 09:46:15','2018-01-17 09:46:15'),(292,NULL,NULL,'CONF_PS_CHECKPAYMENT_FIXED','0.2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(293,NULL,NULL,'CONF_PS_CHECKPAYMENT_VAR','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(294,NULL,NULL,'CONF_PS_CHECKPAYMENT_FIXED_FOREIGN','0.2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(295,NULL,NULL,'CONF_PS_CHECKPAYMENT_VAR_FOREIGN','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(296,NULL,NULL,'PS_NEWSLETTER_RAND','9442669531091135535','2018-01-17 09:46:16','2018-01-17 09:46:16'),(297,NULL,NULL,'NW_CONDITIONS',NULL,'2018-01-17 09:46:16','2018-01-17 09:46:16'),(298,NULL,NULL,'PS_LAYERED_SHOW_QTIES','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(299,NULL,NULL,'PS_LAYERED_FULL_TREE','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(300,NULL,NULL,'PS_LAYERED_FILTER_PRICE_USETAX','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(301,NULL,NULL,'PS_LAYERED_FILTER_CATEGORY_DEPTH','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(302,NULL,NULL,'PS_LAYERED_FILTER_PRICE_ROUNDING','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(303,NULL,NULL,'PS_LAYERED_INDEXED','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(304,NULL,NULL,'HOME_FEATURED_CAT','2','2018-01-17 09:46:16','2018-01-17 09:46:16'),(305,NULL,NULL,'HOMESLIDER_PAUSE_ON_HOVER','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(306,NULL,NULL,'HOMESLIDER_WRAP','1','2018-01-17 09:46:16','2018-01-17 09:46:16'),(307,NULL,NULL,'PS_SC_TWITTER','1','2018-01-17 09:46:17','2018-01-17 09:46:17'),(308,NULL,NULL,'PS_SC_FACEBOOK','1','2018-01-17 09:46:17','2018-01-17 09:46:17'),(309,NULL,NULL,'PS_SC_GOOGLE','1','2018-01-17 09:46:17','2018-01-17 09:46:17'),(310,NULL,NULL,'PS_SC_PINTEREST','1','2018-01-17 09:46:17','2018-01-17 09:46:17'),(311,NULL,NULL,'BLOCKSOCIAL_YOUTUBE',NULL,'2018-01-17 09:46:17','2018-01-17 09:46:17'),(312,NULL,NULL,'BLOCKSOCIAL_GOOGLE_PLUS',NULL,'2018-01-17 09:46:17','2018-01-17 09:46:17'),(313,NULL,NULL,'BLOCKSOCIAL_PINTEREST',NULL,'2018-01-17 09:46:17','2018-01-17 09:46:17'),(314,NULL,NULL,'BLOCKSOCIAL_VIMEO',NULL,'2018-01-17 09:46:17','2018-01-17 09:46:17'),(315,NULL,NULL,'BLOCKSOCIAL_INSTAGRAM',NULL,'2018-01-17 09:46:17','2018-01-17 09:46:17'),(316,NULL,NULL,'BANK_WIRE_PAYMENT_INVITE','1','2018-01-17 09:46:17','2018-01-17 09:46:17'),(317,NULL,NULL,'CONF_PS_WIREPAYMENT_FIXED','0.2','2018-01-17 09:46:17','2018-01-17 09:46:17'),(318,NULL,NULL,'CONF_PS_WIREPAYMENT_VAR','2','2018-01-17 09:46:17','2018-01-17 09:46:17'),(319,NULL,NULL,'CONF_PS_WIREPAYMENT_FIXED_FOREIGN','0.2','2018-01-17 09:46:17','2018-01-17 09:46:17'),(320,NULL,NULL,'CONF_PS_WIREPAYMENT_VAR_FOREIGN','2','2018-01-17 09:46:17','2018-01-17 09:46:17'),(321,NULL,NULL,'GF_INSTALL_CALC','1','2018-01-17 09:46:27','2018-01-17 09:54:58'),(322,NULL,NULL,'GF_CURRENT_LEVEL','1','2018-01-17 09:46:27','2018-01-17 09:46:27'),(323,NULL,NULL,'GF_CURRENT_LEVEL_PERCENT','25','2018-01-17 09:46:27','2018-01-17 10:08:52'),(324,NULL,NULL,'GF_NOTIFICATION','3','2018-01-17 09:46:27','2018-01-17 10:08:52'),(325,NULL,NULL,'CRONJOBS_ADMIN_DIR','028d6828877a5dc0a9bc817b44447fae','2018-01-17 09:46:27','2018-01-17 09:54:45'),(326,NULL,NULL,'CRONJOBS_MODE','webservice','2018-01-17 09:46:27','2018-01-17 09:46:27'),(327,NULL,NULL,'CRONJOBS_MODULE_VERSION','1.4.0','2018-01-17 09:46:27','2018-01-17 09:46:27'),(328,NULL,NULL,'CRONJOBS_WEBSERVICE_ID','0','2018-01-17 09:46:27','2018-01-17 09:46:27'),(329,NULL,NULL,'CRONJOBS_EXECUTION_TOKEN','10ccf6c7b45172eca32424dfd746f700','2018-01-17 09:46:27','2018-01-17 09:46:27'),(330,NULL,NULL,'BLOCKREASSURANCE_NBBLOCKS','5','2018-01-17 09:46:29','2018-01-17 09:46:29'),(331,NULL,NULL,'ONBOARDINGV2_SHUT_DOWN','1','2018-01-17 09:54:54','2018-01-17 09:54:54'),(332,NULL,NULL,'GF_NOT_VIEWED_BADGE','122','2018-01-17 09:54:58','2018-01-17 10:08:52'),(333,NULL,NULL,'PS_REFERRERS_CACHE_LIKE',' \'2017-12-17 00:00:00\' AND \'2018-01-17 23:59:59\' ','2018-01-17 16:33:28','2018-01-17 16:33:28'),(334,NULL,NULL,'PS_REFERRERS_CACHE_DATE','2018-01-17 16:33:28','2018-01-17 16:33:28','2018-01-17 16:33:28');
/*!40000 ALTER TABLE `tb_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_configuration_kpi`
--

DROP TABLE IF EXISTS `tb_configuration_kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_configuration_kpi` (
  `id_configuration_kpi` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned DEFAULT NULL,
  `id_shop` int(11) unsigned DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `value` text,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_configuration_kpi`),
  KEY `name` (`name`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_configuration_kpi`
--

LOCK TABLES `tb_configuration_kpi` WRITE;
/*!40000 ALTER TABLE `tb_configuration_kpi` DISABLE KEYS */;
INSERT INTO `tb_configuration_kpi` VALUES (1,NULL,NULL,'DASHGOALS_TRAFFIC_01_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(2,NULL,NULL,'DASHGOALS_CONVERSION_01_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(3,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_01_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(4,NULL,NULL,'DASHGOALS_TRAFFIC_02_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(5,NULL,NULL,'DASHGOALS_CONVERSION_02_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(6,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_02_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(7,NULL,NULL,'DASHGOALS_TRAFFIC_03_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(8,NULL,NULL,'DASHGOALS_CONVERSION_03_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(9,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_03_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(10,NULL,NULL,'DASHGOALS_TRAFFIC_04_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(11,NULL,NULL,'DASHGOALS_CONVERSION_04_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(12,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_04_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(13,NULL,NULL,'DASHGOALS_TRAFFIC_05_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(14,NULL,NULL,'DASHGOALS_CONVERSION_05_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(15,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_05_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(16,NULL,NULL,'DASHGOALS_TRAFFIC_06_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(17,NULL,NULL,'DASHGOALS_CONVERSION_06_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(18,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_06_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(19,NULL,NULL,'DASHGOALS_TRAFFIC_07_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(20,NULL,NULL,'DASHGOALS_CONVERSION_07_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(21,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_07_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(22,NULL,NULL,'DASHGOALS_TRAFFIC_08_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(23,NULL,NULL,'DASHGOALS_CONVERSION_08_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(24,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_08_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(25,NULL,NULL,'DASHGOALS_TRAFFIC_09_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(26,NULL,NULL,'DASHGOALS_CONVERSION_09_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(27,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_09_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(28,NULL,NULL,'DASHGOALS_TRAFFIC_10_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(29,NULL,NULL,'DASHGOALS_CONVERSION_10_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(30,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_10_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(31,NULL,NULL,'DASHGOALS_TRAFFIC_11_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(32,NULL,NULL,'DASHGOALS_CONVERSION_11_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(33,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_11_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(34,NULL,NULL,'DASHGOALS_TRAFFIC_12_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(35,NULL,NULL,'DASHGOALS_CONVERSION_12_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(36,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_12_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(37,NULL,NULL,'DISABLED_CATEGORIES','1','2018-01-17 10:13:45','2018-01-17 10:13:45'),(38,NULL,NULL,'DISABLED_CATEGORIES_EXPIRE','1516205625','2018-01-17 10:13:45','2018-01-17 10:13:45'),(39,NULL,NULL,'EMPTY_CATEGORIES','5','2018-01-17 10:13:45','2018-01-17 10:13:45'),(40,NULL,NULL,'EMPTY_CATEGORIES_EXPIRE','1516205625','2018-01-17 10:13:45','2018-01-17 10:13:45'),(41,NULL,NULL,'TOP_CATEGORY',NULL,'2018-01-17 10:13:45','2018-01-17 10:13:45'),(42,NULL,NULL,'TOP_CATEGORY_EXPIRE',NULL,'2018-01-17 10:13:45','2018-01-17 10:13:45'),(43,NULL,NULL,'PRODUCTS_PER_CATEGORY','0','2018-01-17 10:13:45','2018-01-17 10:13:45'),(44,NULL,NULL,'PRODUCTS_PER_CATEGORY_EXPIRE','1516202025','2018-01-17 10:13:45','2018-01-17 10:13:45'),(45,NULL,NULL,'CONVERSION_RATE','0%','2018-01-17 10:59:08','2018-01-17 10:59:08'),(46,NULL,NULL,'CONVERSION_RATE_EXPIRE','1516248000','2018-01-17 10:59:08','2018-01-17 10:59:08'),(47,NULL,NULL,'ABANDONED_CARTS','0','2018-01-17 10:59:08','2018-01-17 10:59:08'),(48,NULL,NULL,'ABANDONED_CARTS_EXPIRE','1516204748','2018-01-17 10:59:08','2018-01-17 10:59:08'),(49,NULL,NULL,'NETPROFIT_VISIT','0,00Â R$','2018-01-17 10:59:08','2018-01-17 10:59:08'),(50,NULL,NULL,'NETPROFIT_VISIT_EXPIRE','1516248000','2018-01-17 10:59:08','2018-01-17 10:59:08'),(51,NULL,NULL,'AVG_ORDER_VALUE','0,00Â R$','2018-01-17 10:59:08','2018-01-17 10:59:08'),(52,NULL,NULL,'AVG_ORDER_VALUE_EXPIRE','1516248000','2018-01-17 10:59:08','2018-01-17 10:59:08');
/*!40000 ALTER TABLE `tb_configuration_kpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_configuration_kpi_lang`
--

DROP TABLE IF EXISTS `tb_configuration_kpi_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_configuration_kpi_lang` (
  `id_configuration_kpi` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration_kpi`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_configuration_kpi_lang`
--

LOCK TABLES `tb_configuration_kpi_lang` WRITE;
/*!40000 ALTER TABLE `tb_configuration_kpi_lang` DISABLE KEYS */;
INSERT INTO `tb_configuration_kpi_lang` VALUES (41,1,'Blouses','2018-01-17 10:13:45'),(42,1,'1516284825','2018-01-17 10:13:45');
/*!40000 ALTER TABLE `tb_configuration_kpi_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_configuration_lang`
--

DROP TABLE IF EXISTS `tb_configuration_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_configuration_lang` (
  `id_configuration` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` text,
  `date_upd` datetime DEFAULT NULL,
  PRIMARY KEY (`id_configuration`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_configuration_lang`
--

LOCK TABLES `tb_configuration_lang` WRITE;
/*!40000 ALTER TABLE `tb_configuration_lang` DISABLE KEYS */;
INSERT INTO `tb_configuration_lang` VALUES (39,1,'#IN',NULL),(39,2,'#IN',NULL),(42,1,'#DE',NULL),(42,2,'#DE',NULL),(44,1,'#RE',NULL),(44,2,'#RE',NULL),(51,1,'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves',NULL),(51,2,'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves',NULL),(77,1,'Dear Customer,\n\nRegards,\nCustomer service',NULL),(77,2,'Dear Customer,\n\nRegards,\nCustomer service',NULL),(277,1,'We are currently updating our shop and will be back really soon.\nThanks for your patience.',NULL),(277,2,'We are currently updating our shop and will be back really soon.\nThanks for your patience.',NULL),(288,1,'sale70.png','2018-01-17 09:46:15'),(288,2,'sale70.png','2018-01-17 09:46:15'),(289,1,'','2018-01-17 09:46:15'),(289,2,'','2018-01-17 09:46:15'),(290,1,'','2018-01-17 09:46:15'),(290,2,'','2018-01-17 09:46:15'),(297,1,'Pode cancelar a subscriÃ§Ã£o a qualquer momento. Para tal, consulte a nossa informaÃ§Ã£o de contacto na declaraÃ§Ã£o legal.','2018-01-17 09:46:16'),(297,2,'You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.','2018-01-17 09:46:16');
/*!40000 ALTER TABLE `tb_configuration_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_connections`
--

DROP TABLE IF EXISTS `tb_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_connections` (
  `id_connections` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_guest` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `ip_address` bigint(20) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_connections`),
  KEY `id_guest` (`id_guest`),
  KEY `date_add` (`date_add`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_connections`
--

LOCK TABLES `tb_connections` WRITE;
/*!40000 ALTER TABLE `tb_connections` DISABLE KEYS */;
INSERT INTO `tb_connections` VALUES (1,1,1,1,1,2130706433,'2018-01-17 09:46:04','http://www.prestashop.com'),(2,1,1,2,1,2130706433,'2018-01-17 09:52:37',''),(3,1,1,2,1,2130706433,'2018-01-17 10:23:54','');
/*!40000 ALTER TABLE `tb_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_connections_page`
--

DROP TABLE IF EXISTS `tb_connections_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_connections_page` (
  `id_connections` int(10) unsigned NOT NULL,
  `id_page` int(10) unsigned NOT NULL,
  `time_start` datetime NOT NULL,
  `time_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id_connections`,`id_page`,`time_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_connections_page`
--

LOCK TABLES `tb_connections_page` WRITE;
/*!40000 ALTER TABLE `tb_connections_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_connections_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_connections_source`
--

DROP TABLE IF EXISTS `tb_connections_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_connections_source` (
  `id_connections_source` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_connections` int(10) unsigned NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `request_uri` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_connections_source`),
  KEY `connections` (`id_connections`),
  KEY `orderby` (`date_add`),
  KEY `http_referer` (`http_referer`),
  KEY `request_uri` (`request_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_connections_source`
--

LOCK TABLES `tb_connections_source` WRITE;
/*!40000 ALTER TABLE `tb_connections_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_connections_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contact`
--

DROP TABLE IF EXISTS `tb_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `customer_service` tinyint(1) NOT NULL DEFAULT '0',
  `position` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contact`
--

LOCK TABLES `tb_contact` WRITE;
/*!40000 ALTER TABLE `tb_contact` DISABLE KEYS */;
INSERT INTO `tb_contact` VALUES (1,'thiagoaraujoberbet@gmail.com',1,0),(2,'thiagoaraujoberbet@gmail.com',1,0);
/*!40000 ALTER TABLE `tb_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contact_lang`
--

DROP TABLE IF EXISTS `tb_contact_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_contact_lang` (
  `id_contact` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text,
  PRIMARY KEY (`id_contact`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contact_lang`
--

LOCK TABLES `tb_contact_lang` WRITE;
/*!40000 ALTER TABLE `tb_contact_lang` DISABLE KEYS */;
INSERT INTO `tb_contact_lang` VALUES (1,1,'Webmaster','Se ocorreu um problema tÃ©cnico no nosso website'),(1,2,'Webmaster','Se ocorreu um problema tÃ©cnico no nosso website'),(2,1,'ServiÃ§o de apoio a clientes','Para qualquer pergunta sobre um Produto ou uma Encomenda'),(2,2,'Atendimento ao Cliente','Para qualquer pergunta sobre um Produto ou uma Encomenda');
/*!40000 ALTER TABLE `tb_contact_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contact_shop`
--

DROP TABLE IF EXISTS `tb_contact_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_contact_shop` (
  `id_contact` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_contact`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contact_shop`
--

LOCK TABLES `tb_contact_shop` WRITE;
/*!40000 ALTER TABLE `tb_contact_shop` DISABLE KEYS */;
INSERT INTO `tb_contact_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `tb_contact_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_country`
--

DROP TABLE IF EXISTS `tb_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_country` (
  `id_country` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_zone` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL DEFAULT '0',
  `iso_code` varchar(3) NOT NULL,
  `call_prefix` int(10) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `contains_states` tinyint(1) NOT NULL DEFAULT '0',
  `need_identification_number` tinyint(1) NOT NULL DEFAULT '0',
  `need_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `zip_code_format` varchar(12) NOT NULL DEFAULT '',
  `display_tax_label` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_country`),
  KEY `country_iso_code` (`iso_code`),
  KEY `country_` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_country`
--

LOCK TABLES `tb_country` WRITE;
/*!40000 ALTER TABLE `tb_country` DISABLE KEYS */;
INSERT INTO `tb_country` VALUES (1,1,0,'DE',49,0,0,0,1,'NNNNN',1),(2,1,0,'AT',43,0,0,0,1,'NNNN',1),(3,1,0,'BE',32,0,0,0,1,'NNNN',1),(4,2,0,'CA',1,0,1,0,1,'LNL NLN',0),(5,3,0,'CN',86,0,0,0,1,'NNNNNN',1),(6,1,0,'ES',34,0,0,1,1,'NNNNN',1),(7,1,0,'FI',358,0,0,0,1,'NNNNN',1),(8,1,0,'FR',33,0,0,0,1,'NNNNN',1),(9,1,0,'GR',30,0,0,0,1,'NNNNN',1),(10,1,0,'IT',39,0,1,0,1,'NNNNN',1),(11,3,0,'JP',81,0,1,0,1,'NNN-NNNN',1),(12,1,0,'LU',352,0,0,0,1,'NNNN',1),(13,1,0,'NL',31,0,0,0,1,'NNNN LL',1),(14,1,0,'PL',48,0,0,0,1,'NN-NNN',1),(15,1,0,'PT',351,0,0,0,1,'NNNN-NNN',1),(16,1,0,'CZ',420,0,0,0,1,'NNN NN',1),(17,1,0,'GB',44,0,0,0,1,'',1),(18,1,0,'SE',46,0,0,0,1,'NNN NN',1),(19,7,0,'CH',41,0,0,0,1,'NNNN',1),(20,1,0,'DK',45,0,0,0,1,'NNNN',1),(21,2,0,'US',1,0,1,0,1,'NNNNN',0),(22,3,0,'HK',852,0,0,0,0,'',1),(23,7,0,'NO',47,0,0,0,1,'NNNN',1),(24,5,0,'AU',61,0,1,0,1,'NNNN',1),(25,3,0,'SG',65,0,0,0,1,'NNNNNN',1),(26,1,0,'IE',353,0,0,0,0,'',1),(27,5,0,'NZ',64,0,0,0,1,'NNNN',1),(28,3,0,'KR',82,0,0,0,1,'NNN-NNN',1),(29,3,0,'IL',972,0,0,0,1,'NNNNNNN',1),(30,4,0,'ZA',27,0,0,0,1,'NNNN',1),(31,4,0,'NG',234,0,0,0,1,'',1),(32,4,0,'CI',225,0,0,0,1,'',1),(33,4,0,'TG',228,0,0,0,1,'',1),(34,6,0,'BO',591,0,0,0,1,'',1),(35,4,0,'MU',230,0,0,0,1,'',1),(36,1,0,'RO',40,0,0,0,1,'NNNNNN',1),(37,1,0,'SK',421,0,0,0,1,'NNN NN',1),(38,4,0,'DZ',213,0,0,0,1,'NNNNN',1),(39,2,0,'AS',0,0,0,0,1,'',1),(40,7,0,'AD',376,0,0,0,1,'CNNN',1),(41,4,0,'AO',244,0,0,0,0,'',1),(42,8,0,'AI',0,0,0,0,1,'',1),(43,2,0,'AG',0,0,0,0,1,'',1),(44,6,0,'AR',54,0,1,0,1,'LNNNNLLL',1),(45,3,0,'AM',374,0,0,0,1,'NNNN',1),(46,8,0,'AW',297,0,0,0,1,'',1),(47,3,0,'AZ',994,0,0,0,1,'CNNNN',1),(48,2,0,'BS',0,0,0,0,1,'',1),(49,3,0,'BH',973,0,0,0,1,'',1),(50,3,0,'BD',880,0,0,0,1,'NNNN',1),(51,2,0,'BB',0,0,0,0,1,'CNNNNN',1),(52,7,0,'BY',0,0,0,0,1,'NNNNNN',1),(53,8,0,'BZ',501,0,0,0,0,'',1),(54,4,0,'BJ',229,0,0,0,0,'',1),(55,2,0,'BM',0,0,0,0,1,'',1),(56,3,0,'BT',975,0,0,0,1,'',1),(57,4,0,'BW',267,0,0,0,1,'',1),(58,6,0,'BR',55,1,1,0,1,'NNNNN-NNN',1),(59,3,0,'BN',673,0,0,0,1,'LLNNNN',1),(60,4,0,'BF',226,0,0,0,1,'',1),(61,3,0,'MM',95,0,0,0,1,'',1),(62,4,0,'BI',257,0,0,0,1,'',1),(63,3,0,'KH',855,0,0,0,1,'NNNNN',1),(64,4,0,'CM',237,0,0,0,1,'',1),(65,4,0,'CV',238,0,0,0,1,'NNNN',1),(66,4,0,'CF',236,0,0,0,1,'',1),(67,4,0,'TD',235,0,0,0,1,'',1),(68,6,0,'CL',56,0,0,0,1,'NNN-NNNN',1),(69,6,0,'CO',57,0,0,0,1,'NNNNNN',1),(70,4,0,'KM',269,0,0,0,1,'',1),(71,4,0,'CD',242,0,0,0,1,'',1),(72,4,0,'CG',243,0,0,0,1,'',1),(73,8,0,'CR',506,0,0,0,1,'NNNNN',1),(74,7,0,'HR',385,0,0,0,1,'NNNNN',1),(75,8,0,'CU',53,0,0,0,1,'',1),(76,1,0,'CY',357,0,0,0,1,'NNNN',1),(77,4,0,'DJ',253,0,0,0,1,'',1),(78,8,0,'DM',0,0,0,0,1,'',1),(79,8,0,'DO',0,0,0,0,1,'',1),(80,3,0,'TL',670,0,0,0,1,'',1),(81,6,0,'EC',593,0,0,0,1,'CNNNNNN',1),(82,4,0,'EG',20,0,0,0,1,'NNNNN',1),(83,8,0,'SV',503,0,0,0,1,'',1),(84,4,0,'GQ',240,0,0,0,1,'',1),(85,4,0,'ER',291,0,0,0,1,'',1),(86,1,0,'EE',372,0,0,0,1,'NNNNN',1),(87,4,0,'ET',251,0,0,0,1,'',1),(88,8,0,'FK',0,0,0,0,1,'LLLL NLL',1),(89,7,0,'FO',298,0,0,0,1,'',1),(90,5,0,'FJ',679,0,0,0,1,'',1),(91,4,0,'GA',241,0,0,0,1,'',1),(92,4,0,'GM',220,0,0,0,1,'',1),(93,3,0,'GE',995,0,0,0,1,'NNNN',1),(94,4,0,'GH',233,0,0,0,1,'',1),(95,8,0,'GD',0,0,0,0,1,'',1),(96,7,0,'GL',299,0,0,0,1,'',1),(97,7,0,'GI',350,0,0,0,1,'',1),(98,8,0,'GP',590,0,0,0,1,'',1),(99,5,0,'GU',0,0,0,0,1,'',1),(100,8,0,'GT',502,0,0,0,1,'',1),(101,7,0,'GG',0,0,0,0,1,'LLN NLL',1),(102,4,0,'GN',224,0,0,0,1,'',1),(103,4,0,'GW',245,0,0,0,1,'',1),(104,6,0,'GY',592,0,0,0,1,'',1),(105,8,0,'HT',509,0,0,0,1,'',1),(106,5,0,'HM',0,0,0,0,1,'',1),(107,7,0,'VA',379,0,0,0,1,'NNNNN',1),(108,8,0,'HN',504,0,0,0,1,'',1),(109,7,0,'IS',354,0,0,0,1,'NNN',1),(110,3,0,'IN',91,0,0,0,1,'NNN NNN',1),(111,3,0,'ID',62,0,1,0,1,'NNNNN',1),(112,3,0,'IR',98,0,0,0,1,'NNNNN-NNNNN',1),(113,3,0,'IQ',964,0,0,0,1,'NNNNN',1),(114,7,0,'IM',0,0,0,0,1,'CN NLL',1),(115,8,0,'JM',0,0,0,0,1,'',1),(116,7,0,'JE',0,0,0,0,1,'CN NLL',1),(117,3,0,'JO',962,0,0,0,1,'',1),(118,3,0,'KZ',7,0,0,0,1,'NNNNNN',1),(119,4,0,'KE',254,0,0,0,1,'',1),(120,5,0,'KI',686,0,0,0,1,'',1),(121,3,0,'KP',850,0,0,0,1,'',1),(122,3,0,'KW',965,0,0,0,1,'',1),(123,3,0,'KG',996,0,0,0,1,'',1),(124,3,0,'LA',856,0,0,0,1,'',1),(125,1,0,'LV',371,0,0,0,1,'C-NNNN',1),(126,3,0,'LB',961,0,0,0,1,'',1),(127,4,0,'LS',266,0,0,0,1,'',1),(128,4,0,'LR',231,0,0,0,1,'',1),(129,4,0,'LY',218,0,0,0,1,'',1),(130,1,0,'LI',423,0,0,0,1,'NNNN',1),(131,1,0,'LT',370,0,0,0,1,'NNNNN',1),(132,3,0,'MO',853,0,0,0,0,'',1),(133,7,0,'MK',389,0,0,0,1,'',1),(134,4,0,'MG',261,0,0,0,1,'',1),(135,4,0,'MW',265,0,0,0,1,'',1),(136,3,0,'MY',60,0,0,0,1,'NNNNN',1),(137,3,0,'MV',960,0,0,0,1,'',1),(138,4,0,'ML',223,0,0,0,1,'',1),(139,1,0,'MT',356,0,0,0,1,'LLL NNNN',1),(140,5,0,'MH',692,0,0,0,1,'',1),(141,8,0,'MQ',596,0,0,0,1,'',1),(142,4,0,'MR',222,0,0,0,1,'',1),(143,1,0,'HU',36,0,0,0,1,'NNNN',1),(144,4,0,'YT',262,0,0,0,1,'',1),(145,2,0,'MX',52,0,1,1,1,'NNNNN',1),(146,5,0,'FM',691,0,0,0,1,'',1),(147,7,0,'MD',373,0,0,0,1,'C-NNNN',1),(148,7,0,'MC',377,0,0,0,1,'980NN',1),(149,3,0,'MN',976,0,0,0,1,'',1),(150,7,0,'ME',382,0,0,0,1,'NNNNN',1),(151,8,0,'MS',0,0,0,0,1,'',1),(152,4,0,'MA',212,0,0,0,1,'NNNNN',1),(153,4,0,'MZ',258,0,0,0,1,'',1),(154,4,0,'NA',264,0,0,0,1,'',1),(155,5,0,'NR',674,0,0,0,1,'',1),(156,3,0,'NP',977,0,0,0,1,'',1),(157,8,0,'AN',599,0,0,0,1,'',1),(158,5,0,'NC',687,0,0,0,1,'',1),(159,8,0,'NI',505,0,0,0,1,'NNNNNN',1),(160,4,0,'NE',227,0,0,0,1,'',1),(161,5,0,'NU',683,0,0,0,1,'',1),(162,5,0,'NF',0,0,0,0,1,'',1),(163,5,0,'MP',0,0,0,0,1,'',1),(164,3,0,'OM',968,0,0,0,1,'',1),(165,3,0,'PK',92,0,0,0,1,'',1),(166,5,0,'PW',680,0,0,0,1,'',1),(167,3,0,'PS',0,0,0,0,1,'',1),(168,8,0,'PA',507,0,0,0,1,'NNNNNN',1),(169,5,0,'PG',675,0,0,0,1,'',1),(170,6,0,'PY',595,0,0,0,1,'',1),(171,6,0,'PE',51,0,0,0,1,'',1),(172,3,0,'PH',63,0,0,0,1,'NNNN',1),(173,5,0,'PN',0,0,0,0,1,'LLLL NLL',1),(174,8,0,'PR',0,0,0,0,1,'NNNNN',1),(175,3,0,'QA',974,0,0,0,1,'',1),(176,4,0,'RE',262,0,0,0,1,'',1),(177,7,0,'RU',7,0,0,0,1,'NNNNNN',1),(178,4,0,'RW',250,0,0,0,1,'',1),(179,8,0,'BL',0,0,0,0,1,'',1),(180,8,0,'KN',0,0,0,0,1,'',1),(181,8,0,'LC',0,0,0,0,1,'',1),(182,8,0,'MF',0,0,0,0,1,'',1),(183,8,0,'PM',508,0,0,0,1,'',1),(184,8,0,'VC',0,0,0,0,1,'',1),(185,5,0,'WS',685,0,0,0,1,'',1),(186,7,0,'SM',378,0,0,0,1,'NNNNN',1),(187,4,0,'ST',239,0,0,0,1,'',1),(188,3,0,'SA',966,0,0,0,1,'',1),(189,4,0,'SN',221,0,0,0,1,'',1),(190,7,0,'RS',381,0,0,0,1,'NNNNN',1),(191,4,0,'SC',248,0,0,0,1,'',1),(192,4,0,'SL',232,0,0,0,1,'',1),(193,1,0,'SI',386,0,0,0,1,'C-NNNN',1),(194,5,0,'SB',677,0,0,0,1,'',1),(195,4,0,'SO',252,0,0,0,1,'',1),(196,8,0,'GS',0,0,0,0,1,'LLLL NLL',1),(197,3,0,'LK',94,0,0,0,1,'NNNNN',1),(198,4,0,'SD',249,0,0,0,1,'',1),(199,8,0,'SR',597,0,0,0,1,'',1),(200,7,0,'SJ',0,0,0,0,1,'',1),(201,4,0,'SZ',268,0,0,0,1,'',1),(202,3,0,'SY',963,0,0,0,1,'',1),(203,3,0,'TW',886,0,0,0,1,'NNNNN',1),(204,3,0,'TJ',992,0,0,0,1,'',1),(205,4,0,'TZ',255,0,0,0,1,'',1),(206,3,0,'TH',66,0,0,0,1,'NNNNN',1),(207,5,0,'TK',690,0,0,0,1,'',1),(208,5,0,'TO',676,0,0,0,1,'',1),(209,6,0,'TT',0,0,0,0,1,'',1),(210,4,0,'TN',216,0,0,0,1,'',1),(211,7,0,'TR',90,0,0,0,1,'NNNNN',1),(212,3,0,'TM',993,0,0,0,1,'',1),(213,8,0,'TC',0,0,0,0,1,'LLLL NLL',1),(214,5,0,'TV',688,0,0,0,1,'',1),(215,4,0,'UG',256,0,0,0,1,'',1),(216,1,0,'UA',380,0,0,0,1,'NNNNN',1),(217,3,0,'AE',971,0,0,0,1,'',1),(218,6,0,'UY',598,0,0,0,1,'',1),(219,3,0,'UZ',998,0,0,0,1,'',1),(220,5,0,'VU',678,0,0,0,1,'',1),(221,6,0,'VE',58,0,0,0,1,'',1),(222,3,0,'VN',84,0,0,0,1,'NNNNNN',1),(223,2,0,'VG',0,0,0,0,1,'CNNNN',1),(224,2,0,'VI',0,0,0,0,1,'',1),(225,5,0,'WF',681,0,0,0,1,'',1),(226,4,0,'EH',0,0,0,0,1,'',1),(227,3,0,'YE',967,0,0,0,1,'',1),(228,4,0,'ZM',260,0,0,0,1,'',1),(229,4,0,'ZW',263,0,0,0,1,'',1),(230,7,0,'AL',355,0,0,0,1,'NNNN',1),(231,3,0,'AF',93,0,0,0,1,'NNNN',1),(232,5,0,'AQ',0,0,0,0,1,'',1),(233,1,0,'BA',387,0,0,0,1,'',1),(234,5,0,'BV',0,0,0,0,1,'',1),(235,5,0,'IO',0,0,0,0,1,'LLLL NLL',1),(236,1,0,'BG',359,0,0,0,1,'NNNN',1),(237,8,0,'KY',0,0,0,0,1,'',1),(238,3,0,'CX',0,0,0,0,1,'',1),(239,3,0,'CC',0,0,0,0,1,'',1),(240,5,0,'CK',682,0,0,0,1,'',1),(241,6,0,'GF',594,0,0,0,1,'',1),(242,5,0,'PF',689,0,0,0,1,'',1),(243,5,0,'TF',0,0,0,0,1,'',1),(244,7,0,'AX',0,0,0,0,1,'NNNNN',1);
/*!40000 ALTER TABLE `tb_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_country_lang`
--

DROP TABLE IF EXISTS `tb_country_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_country_lang` (
  `id_country` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_country`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_country_lang`
--

LOCK TABLES `tb_country_lang` WRITE;
/*!40000 ALTER TABLE `tb_country_lang` DISABLE KEYS */;
INSERT INTO `tb_country_lang` VALUES (1,1,'Alemanha'),(1,2,'Alemanha'),(2,1,'Ãustria'),(2,2,'Ãustria'),(3,1,'BÃ©lgica'),(3,2,'BÃ©lgica'),(4,1,'CanadÃ¡'),(4,2,'CanadÃ¡'),(5,1,'China'),(5,2,'China'),(6,1,'Espanha'),(6,2,'Espanha'),(7,1,'FinlÃ¢ndia'),(7,2,'FinlÃ¢ndia'),(8,1,'FranÃ§a'),(8,2,'FranÃ§a'),(9,1,'GrÃ©cia'),(9,2,'GrÃ©cia'),(10,1,'ItÃ¡lia'),(10,2,'ItÃ¡lia'),(11,1,'JapÃ£o'),(11,2,'JapÃ£o'),(12,1,'Luxemburgo'),(12,2,'Luxemburgo'),(13,1,'PaÃ­ses Baixos'),(13,2,'Holanda'),(14,1,'PolÃ³nia'),(14,2,'PolÃ´nia'),(15,1,'Portugal'),(15,2,'Portugal'),(16,1,'RepÃºblica Checa'),(16,2,'RepÃºblica Tcheca'),(17,1,'Reino Unido'),(17,2,'Reino Unido'),(18,1,'SuÃ©cia'),(18,2,'SuÃ©cia'),(19,1,'SuÃ­Ã§a'),(19,2,'SuÃ­Ã§a'),(20,1,'Dinamarca'),(20,2,'Dinamarca'),(21,1,'Estados Unidos'),(21,2,'Estados Unidos'),(22,1,'Hong Kong, RAE Da China'),(22,2,'Hong Kong, RAE Da China'),(23,1,'Noruega'),(23,2,'Noruega'),(24,1,'AustrÃ¡lia'),(24,2,'AustrÃ¡lia'),(25,1,'Singapura'),(25,2,'Cingapura'),(26,1,'Irlanda'),(26,2,'Irlanda'),(27,1,'Nova ZelÃ¢ndia'),(27,2,'Nova ZelÃ¢ndia'),(28,1,'Coreia Do Sul'),(28,2,'Coreia Do Sul'),(29,1,'Israel'),(29,2,'Israel'),(30,1,'Ãfrica Do Sul'),(30,2,'Ãfrica Do Sul'),(31,1,'NigÃ©ria'),(31,2,'NigÃ©ria'),(32,1,'Costa Do Marfim'),(32,2,'Costa Do Marfim'),(33,1,'Togo'),(33,2,'Togo'),(34,1,'BolÃ­via'),(34,2,'BolÃ­via'),(35,1,'MaurÃ­cia'),(35,2,'MaurÃ­cio'),(36,1,'RomÃ©nia'),(36,2,'RomÃªnia'),(37,1,'EslovÃ¡quia'),(37,2,'EslovÃ¡quia'),(38,1,'ArgÃ©lia'),(38,2,'ArgÃ©lia'),(39,1,'Samoa Americana'),(39,2,'Samoa Americana'),(40,1,'Andorra'),(40,2,'Andorra'),(41,1,'Angola'),(41,2,'Angola'),(42,1,'Anguila'),(42,2,'Anguilla'),(43,1,'AntÃ­gua E Barbuda'),(43,2,'AntÃ­gua E Barbuda'),(44,1,'Argentina'),(44,2,'Argentina'),(45,1,'ArmÃ©nia'),(45,2,'ArmÃªnia'),(46,1,'Aruba'),(46,2,'Aruba'),(47,1,'AzerbaijÃ£o'),(47,2,'AzerbaijÃ£o'),(48,1,'Bahamas'),(48,2,'Bahamas'),(49,1,'BarÃ©m'),(49,2,'Bahrein'),(50,1,'Bangladesh'),(50,2,'Bangladesh'),(51,1,'Barbados'),(51,2,'Barbados'),(52,1,'BielorrÃºssia'),(52,2,'BielorrÃºssia'),(53,1,'Belize'),(53,2,'Belize'),(54,1,'Benim'),(54,2,'Benin'),(55,1,'Bermudas'),(55,2,'Bermudas'),(56,1,'ButÃ£o'),(56,2,'ButÃ£o'),(57,1,'Botswana'),(57,2,'Botsuana'),(58,1,'Brasil'),(58,2,'Brasil'),(59,1,'Brunei'),(59,2,'Brunei'),(60,1,'Burquina Faso'),(60,2,'Burquina Faso'),(61,1,'Mianmar (BirmÃ¢nia)'),(61,2,'Mianmar (BirmÃ¢nia)'),(62,1,'Burundi'),(62,2,'Burundi'),(63,1,'Camboja'),(63,2,'Camboja'),(64,1,'CamarÃµes'),(64,2,'RepÃºblica Dos CamarÃµes'),(65,1,'Cabo Verde'),(65,2,'Cabo Verde'),(66,1,'RepÃºblica Centro-Africana'),(66,2,'RepÃºblica Centro-Africana'),(67,1,'Chade'),(67,2,'Chade'),(68,1,'Chile'),(68,2,'Chile'),(69,1,'ColÃ´mbia'),(69,2,'ColÃ´mbia'),(70,1,'Comores'),(70,2,'Comores'),(71,1,'Congo-Kinshasa'),(71,2,'Congo - Kinshasa'),(72,1,'Congo-Brazzaville'),(72,2,'Congo - Brazzaville'),(73,1,'Costa Rica'),(73,2,'Costa Rica'),(74,1,'CroÃ¡cia'),(74,2,'CroÃ¡cia'),(75,1,'Cuba'),(75,2,'Cuba'),(76,1,'Chipre'),(76,2,'Chipre'),(77,1,'Jibuti'),(77,2,'Djibuti'),(78,1,'DomÃ­nica'),(78,2,'Dominica'),(79,1,'RepÃºblica Dominicana'),(79,2,'RepÃºblica Dominicana'),(80,1,'Timor-Leste'),(80,2,'Timor-Leste'),(81,1,'Equador'),(81,2,'Equador'),(82,1,'Egipto'),(82,2,'Egito'),(83,1,'El Salvador'),(83,2,'El Salvador'),(84,1,'GuinÃ© Equatorial'),(84,2,'GuinÃ© Equatorial'),(85,1,'Eritreia'),(85,2,'Eritreia'),(86,1,'EstÃ³nia'),(86,2,'EstÃ´nia'),(87,1,'EtiÃ³pia'),(87,2,'EtiÃ³pia'),(88,1,'Ilhas Falkland'),(88,2,'Ilhas Malvinas'),(89,1,'Ilhas FaroÃ©'),(89,2,'Ilhas Faroe'),(90,1,'Fiji'),(90,2,'Fiji'),(91,1,'GabÃ£o'),(91,2,'GabÃ£o'),(92,1,'GÃ¢mbia'),(92,2,'GÃ¢mbia'),(93,1,'GeÃ³rgia'),(93,2,'GeÃ³rgia'),(94,1,'Gana'),(94,2,'Gana'),(95,1,'Granada'),(95,2,'Granada'),(96,1,'GronelÃ¢ndia'),(96,2,'GroenlÃ¢ndia'),(97,1,'Gibraltar'),(97,2,'Gibraltar'),(98,1,'Guadalupe'),(98,2,'Guadalupe'),(99,1,'Guame'),(99,2,'Guam'),(100,1,'Guatemala'),(100,2,'Guatemala'),(101,1,'Guernsey'),(101,2,'Guernsey'),(102,1,'GuinÃ©'),(102,2,'GuinÃ©'),(103,1,'GuinÃ©-Bissau'),(103,2,'GuinÃ© Bissau'),(104,1,'Guiana'),(104,2,'Guiana'),(105,1,'Haiti'),(105,2,'Haiti'),(106,1,'Ilhas Heard E McDonald'),(106,2,'Ilhas Heard E McDonald'),(107,1,'Cidade Do Vaticano'),(107,2,'Cidade Do Vaticano'),(108,1,'Honduras'),(108,2,'Honduras'),(109,1,'IslÃ¢ndia'),(109,2,'IslÃ¢ndia'),(110,1,'Ãndia'),(110,2,'Ãndia'),(111,1,'IndonÃ©sia'),(111,2,'IndonÃ©sia'),(112,1,'IrÃ£o'),(112,2,'IrÃ£'),(113,1,'Iraque'),(113,2,'Iraque'),(114,1,'Ilha De Man'),(114,2,'Ilha De Man'),(115,1,'Jamaica'),(115,2,'Jamaica'),(116,1,'Jersey'),(116,2,'Jersey'),(117,1,'JordÃ¢nia'),(117,2,'JordÃ¢nia'),(118,1,'CazaquistÃ£o'),(118,2,'CazaquistÃ£o'),(119,1,'QuÃ©nia'),(119,2,'QuÃªnia'),(120,1,'Quiribati'),(120,2,'Quiribati'),(121,1,'Coreia Do Norte'),(121,2,'Coreia Do Norte'),(122,1,'Kuwait'),(122,2,'Kuwait'),(123,1,'QuirguistÃ£o'),(123,2,'QuirguistÃ£o'),(124,1,'Laos'),(124,2,'Laos'),(125,1,'LetÃ³nia'),(125,2,'LetÃ´nia'),(126,1,'LÃ­bano'),(126,2,'LÃ­bano'),(127,1,'Lesoto'),(127,2,'Lesoto'),(128,1,'LibÃ©ria'),(128,2,'LibÃ©ria'),(129,1,'LÃ­bia'),(129,2,'LÃ­bia'),(130,1,'Liechtenstein'),(130,2,'Liechtenstein'),(131,1,'LituÃ¢nia'),(131,2,'LituÃ¢nia'),(132,1,'Macau, RAE Da China'),(132,2,'Macau, RAE Da China'),(133,1,'MacedÃ³nia'),(133,2,'MacedÃ´nia'),(134,1,'MadagÃ¡scar'),(134,2,'Madagascar'),(135,1,'Malawi'),(135,2,'Malawi'),(136,1,'MalÃ¡sia'),(136,2,'MalÃ¡sia'),(137,1,'Maldivas'),(137,2,'Maldivas'),(138,1,'Mali'),(138,2,'Mali'),(139,1,'Malta'),(139,2,'Malta'),(140,1,'Ilhas Marshall'),(140,2,'Ilhas Marshall'),(141,1,'Martinica'),(141,2,'Martinica'),(142,1,'MauritÃ¢nia'),(142,2,'MauritÃ¢nia'),(143,1,'Hungria'),(143,2,'Hungria'),(144,1,'Maiote'),(144,2,'Mayotte'),(145,1,'MÃ©xico'),(145,2,'MÃ©xico'),(146,1,'MicronÃ©sia'),(146,2,'MicronÃ©sia'),(147,1,'MoldÃ¡via'),(147,2,'MoldÃ¡via'),(148,1,'MÃ³naco'),(148,2,'MÃ´naco'),(149,1,'MongÃ³lia'),(149,2,'MongÃ³lia'),(150,1,'Montenegro'),(150,2,'Montenegro'),(151,1,'Monserrate'),(151,2,'Montserrat'),(152,1,'Marrocos'),(152,2,'Marrocos'),(153,1,'MoÃ§ambique'),(153,2,'MoÃ§ambique'),(154,1,'NamÃ­bia'),(154,2,'NamÃ­bia'),(155,1,'Nauru'),(155,2,'Nauru'),(156,1,'Nepal'),(156,2,'Nepal'),(157,1,'Antilhas Holandesas'),(157,2,'Antilhas Holandesas'),(158,1,'Nova CaledÃ³nia'),(158,2,'Nova CaledÃ´nia'),(159,1,'NicarÃ¡gua'),(159,2,'NicarÃ¡gua'),(160,1,'NÃ­ger'),(160,2,'NÃ­ger'),(161,1,'Niue'),(161,2,'Niue'),(162,1,'Ilha Norfolk'),(162,2,'Ilha Norfolk'),(163,1,'Ilhas Marianas Do Norte'),(163,2,'Ilhas Marianas Do Norte'),(164,1,'OmÃ£'),(164,2,'OmÃ£'),(165,1,'PaquistÃ£o'),(165,2,'PaquistÃ£o'),(166,1,'Palau'),(166,2,'Palau'),(167,1,'TerritÃ³rio Palestiniano'),(167,2,'TerritÃ³rios Palestinos'),(168,1,'PanamÃ¡'),(168,2,'PanamÃ¡'),(169,1,'Papua-Nova GuinÃ©'),(169,2,'Papua-Nova GuinÃ©'),(170,1,'Paraguai'),(170,2,'Paraguai'),(171,1,'Peru'),(171,2,'Peru'),(172,1,'Filipinas'),(172,2,'Filipinas'),(173,1,'Pitcairn'),(173,2,'Ilhas Pitcairn'),(174,1,'Porto Rico'),(174,2,'Porto Rico'),(175,1,'Catar'),(175,2,'Catar'),(176,1,'ReuniÃ£o'),(176,2,'ReuniÃ£o'),(177,1,'RÃºssia'),(177,2,'RÃºssia'),(178,1,'Ruanda'),(178,2,'Ruanda'),(179,1,'SÃ£o Bartolomeu'),(179,2,'SÃ£o Bartolomeu'),(180,1,'SÃ£o CristÃ³vÃ£o E Nevis'),(180,2,'SÃ£o CristÃ³vÃ£o E Nevis'),(181,1,'Santa LÃºcia'),(181,2,'Santa LÃºcia'),(182,1,'SÃ£o Martinho'),(182,2,'SÃ£o Martinho'),(183,1,'Saint Pierre E Miquelon'),(183,2,'Saint Pierre E Miquelon'),(184,1,'SÃ£o Vicente E Granadinas'),(184,2,'SÃ£o Vicente E Granadinas'),(185,1,'Samoa'),(185,2,'Samoa'),(186,1,'SÃ£o Marino'),(186,2,'San Marino'),(187,1,'SÃ£o TomÃ© E PrÃ­ncipe'),(187,2,'SÃ£o TomÃ© E PrÃ­ncipe'),(188,1,'ArÃ¡bia Saudita'),(188,2,'ArÃ¡bia Saudita'),(189,1,'Senegal'),(189,2,'Senegal'),(190,1,'SÃ©rvia'),(190,2,'SÃ©rvia'),(191,1,'Seicheles'),(191,2,'Seychelles'),(192,1,'Serra Leoa'),(192,2,'Serra Leoa'),(193,1,'EslovÃ©nia'),(193,2,'EslovÃªnia'),(194,1,'Ilhas SalomÃ£o'),(194,2,'Ilhas SalomÃ£o'),(195,1,'SomÃ¡lia'),(195,2,'SomÃ¡lia'),(196,1,'Ilhas GeÃ³rgia Do Sul E Sandwich Do Sul'),(196,2,'GeÃ³rgia Do Sul E Ilhas Sandwich Do Sul'),(197,1,'Sri Lanka'),(197,2,'Sri Lanka'),(198,1,'SudÃ£o'),(198,2,'SudÃ£o'),(199,1,'Suriname'),(199,2,'Suriname'),(200,1,'Svalbard E Jan Mayen'),(200,2,'Svalbard E Jan Mayen'),(201,1,'SuazilÃ¢ndia'),(201,2,'SuazilÃ¢ndia'),(202,1,'SÃ­ria'),(202,2,'SÃ­ria'),(203,1,'Taiwan'),(203,2,'Taiwan'),(204,1,'TajiquistÃ£o'),(204,2,'TajiquistÃ£o'),(205,1,'TanzÃ¢nia'),(205,2,'TanzÃ¢nia'),(206,1,'TailÃ¢ndia'),(206,2,'TailÃ¢ndia'),(207,1,'Toquelau'),(207,2,'Tokelau'),(208,1,'Tonga'),(208,2,'Tonga'),(209,1,'Trindade E Tobago'),(209,2,'Trinidad E Tobago'),(210,1,'TunÃ­sia'),(210,2,'TunÃ­sia'),(211,1,'Turquia'),(211,2,'Turquia'),(212,1,'TurquemenistÃ£o'),(212,2,'TurcomenistÃ£o'),(213,1,'Ilhas Turcas E Caicos'),(213,2,'Ilhas Turks E Caicos'),(214,1,'Tuvalu'),(214,2,'Tuvalu'),(215,1,'Uganda'),(215,2,'Uganda'),(216,1,'UcrÃ¢nia'),(216,2,'UcrÃ¢nia'),(217,1,'Emirados Ãrabes Unidos'),(217,2,'Emirados Ãrabes Unidos'),(218,1,'Uruguai'),(218,2,'Uruguai'),(219,1,'UzbequistÃ£o'),(219,2,'UzbequistÃ£o'),(220,1,'Vanuatu'),(220,2,'Vanuatu'),(221,1,'Venezuela'),(221,2,'Venezuela'),(222,1,'Vietname'),(222,2,'VietnÃ£'),(223,1,'Ilhas Virgens BritÃ¢nicas'),(223,2,'Ilhas Virgens BritÃ¢nicas'),(224,1,'Ilhas Virgens Dos EUA'),(224,2,'Ilhas Virgens Dos EUA'),(225,1,'Wallis E Futuna'),(225,2,'Wallis E Futuna'),(226,1,'Saara Ocidental'),(226,2,'Saara Ocidental'),(227,1,'IÃ©men'),(227,2,'IÃªmen'),(228,1,'ZÃ¢mbia'),(228,2,'ZÃ¢mbia'),(229,1,'ZimbabuÃ©'),(229,2,'ZimbÃ¡bue'),(230,1,'AlbÃ¢nia'),(230,2,'AlbÃ¢nia'),(231,1,'AfeganistÃ£o'),(231,2,'AfeganistÃ£o'),(232,1,'AntÃ¡rtida'),(232,2,'AntÃ¡rtida'),(233,1,'BÃ³snia E Herzegovina'),(233,2,'BÃ³snia E Herzegovina'),(234,1,'Ilha Bouvet'),(234,2,'Ilha Bouvet'),(235,1,'TerritÃ³rio BritÃ¢nico Do Oceano Ãndico'),(235,2,'TerritÃ³rio BritÃ¢nico Do Oceano Ãndico'),(236,1,'BulgÃ¡ria'),(236,2,'BulgÃ¡ria'),(237,1,'Ilhas CaimÃ£o'),(237,2,'Ilhas Caiman'),(238,1,'Ilha Do Natal'),(238,2,'Ilha Christmas'),(239,1,'Ilhas Cocos'),(239,2,'Ilhas Cocos (Keeling)'),(240,1,'Ilhas Cook'),(240,2,'Ilhas Cook'),(241,1,'Guiana Francesa'),(241,2,'Guiana Francesa'),(242,1,'PolinÃ©sia Francesa'),(242,2,'PolinÃ©sia Francesa'),(243,1,'TerritÃ³rios Franceses Do Sul'),(243,2,'TerritÃ³rios Franceses Do Sul'),(244,1,'Ilhas Ã…land'),(244,2,'Ilhas Ã…land');
/*!40000 ALTER TABLE `tb_country_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_country_shop`
--

DROP TABLE IF EXISTS `tb_country_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_country_shop` (
  `id_country` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_country`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_country_shop`
--

LOCK TABLES `tb_country_shop` WRITE;
/*!40000 ALTER TABLE `tb_country_shop` DISABLE KEYS */;
INSERT INTO `tb_country_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1);
/*!40000 ALTER TABLE `tb_country_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cronjobs`
--

DROP TABLE IF EXISTS `tb_cronjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cronjobs` (
  `id_cronjob` int(10) NOT NULL AUTO_INCREMENT,
  `id_module` int(10) DEFAULT NULL,
  `description` text,
  `task` text,
  `hour` int(11) DEFAULT '-1',
  `day` int(11) DEFAULT '-1',
  `month` int(11) DEFAULT '-1',
  `day_of_week` int(11) DEFAULT '-1',
  `updated_at` datetime DEFAULT NULL,
  `one_shot` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `id_shop` int(11) DEFAULT '0',
  `id_shop_group` int(11) DEFAULT '0',
  PRIMARY KEY (`id_cronjob`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cronjobs`
--

LOCK TABLES `tb_cronjobs` WRITE;
/*!40000 ALTER TABLE `tb_cronjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cronjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_currency`
--

DROP TABLE IF EXISTS `tb_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_currency` (
  `id_currency` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(3) NOT NULL DEFAULT '0',
  `conversion_rate` decimal(13,6) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_currency`
--

LOCK TABLES `tb_currency` WRITE;
/*!40000 ALTER TABLE `tb_currency` DISABLE KEYS */;
INSERT INTO `tb_currency` VALUES (1,'Real brasileiro','BRL',1.000000,0,1);
/*!40000 ALTER TABLE `tb_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_currency_shop`
--

DROP TABLE IF EXISTS `tb_currency_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_currency_shop` (
  `id_currency` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL,
  PRIMARY KEY (`id_currency`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_currency_shop`
--

LOCK TABLES `tb_currency_shop` WRITE;
/*!40000 ALTER TABLE `tb_currency_shop` DISABLE KEYS */;
INSERT INTO `tb_currency_shop` VALUES (1,1,1.000000);
/*!40000 ALTER TABLE `tb_currency_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_gender` int(10) unsigned NOT NULL,
  `id_default_group` int(10) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned DEFAULT NULL,
  `id_risk` int(10) unsigned NOT NULL DEFAULT '1',
  `company` varchar(64) DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `ape` varchar(5) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(60) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `birthday` date DEFAULT NULL,
  `newsletter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip_registration_newsletter` varchar(15) DEFAULT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `website` varchar(128) DEFAULT NULL,
  `outstanding_allow_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `show_public_prices` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_payment_days` int(10) unsigned NOT NULL DEFAULT '60',
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `reset_password_token` varchar(40) DEFAULT NULL,
  `reset_password_validity` datetime DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `customer_email` (`email`),
  KEY `customer_login` (`email`,`passwd`),
  KEY `id_customer_passwd` (`id_customer`,`passwd`),
  KEY `id_gender` (`id_gender`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_shop` (`id_shop`,`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer`
--

LOCK TABLES `tb_customer` WRITE;
/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` VALUES (1,1,1,1,3,1,0,'','','','John','DOE','pub@prestashop.com','144b3b9e427a31a5cb646572419835b9','2018-01-17 06:46:02','1970-01-15',1,'','2013-12-13 08:19:15',1,'',0.000000,0,0,'e4d3cf22a145a1b73dff66d5fab63c2e','',1,0,0,'2018-01-17 09:46:02','2018-01-17 09:46:02','','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer_group`
--

DROP TABLE IF EXISTS `tb_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer_group` (
  `id_customer` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_customer`,`id_group`),
  KEY `customer_login` (`id_group`),
  KEY `id_customer` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer_group`
--

LOCK TABLES `tb_customer_group` WRITE;
/*!40000 ALTER TABLE `tb_customer_group` DISABLE KEYS */;
INSERT INTO `tb_customer_group` VALUES (1,3);
/*!40000 ALTER TABLE `tb_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer_message`
--

DROP TABLE IF EXISTS `tb_customer_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer_message` (
  `id_customer_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer_thread` int(11) DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `message` mediumtext NOT NULL,
  `file_name` varchar(18) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customer_message`),
  KEY `id_customer_thread` (`id_customer_thread`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer_message`
--

LOCK TABLES `tb_customer_message` WRITE;
/*!40000 ALTER TABLE `tb_customer_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customer_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer_message_sync_imap`
--

DROP TABLE IF EXISTS `tb_customer_message_sync_imap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer_message_sync_imap` (
  `md5_header` varbinary(32) NOT NULL,
  KEY `md5_header_index` (`md5_header`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer_message_sync_imap`
--

LOCK TABLES `tb_customer_message_sync_imap` WRITE;
/*!40000 ALTER TABLE `tb_customer_message_sync_imap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customer_message_sync_imap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer_thread`
--

DROP TABLE IF EXISTS `tb_customer_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer_thread` (
  `id_customer_thread` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `id_contact` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned DEFAULT NULL,
  `status` enum('open','closed','pending1','pending2') NOT NULL DEFAULT 'open',
  `email` varchar(128) NOT NULL,
  `token` varchar(12) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_customer_thread`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`),
  KEY `id_contact` (`id_contact`),
  KEY `id_customer` (`id_customer`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer_thread`
--

LOCK TABLES `tb_customer_thread` WRITE;
/*!40000 ALTER TABLE `tb_customer_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customer_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customization`
--

DROP TABLE IF EXISTS `tb_customization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customization` (
  `id_customization` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product_attribute` int(10) unsigned NOT NULL DEFAULT '0',
  `id_address_delivery` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cart` int(10) unsigned NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `quantity_refunded` int(11) NOT NULL DEFAULT '0',
  `quantity_returned` int(11) NOT NULL DEFAULT '0',
  `in_cart` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization`,`id_cart`,`id_product`,`id_address_delivery`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_cart_product` (`id_cart`,`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customization`
--

LOCK TABLES `tb_customization` WRITE;
/*!40000 ALTER TABLE `tb_customization` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customization_field`
--

DROP TABLE IF EXISTS `tb_customization_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customization_field` (
  `id_customization_field` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `is_module` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_customization_field`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customization_field`
--

LOCK TABLES `tb_customization_field` WRITE;
/*!40000 ALTER TABLE `tb_customization_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customization_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customization_field_lang`
--

DROP TABLE IF EXISTS `tb_customization_field_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customization_field_lang` (
  `id_customization_field` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_customization_field`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customization_field_lang`
--

LOCK TABLES `tb_customization_field_lang` WRITE;
/*!40000 ALTER TABLE `tb_customization_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customization_field_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customized_data`
--

DROP TABLE IF EXISTS `tb_customized_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customized_data` (
  `id_customization` int(10) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL,
  `index` int(3) NOT NULL,
  `value` varchar(255) NOT NULL,
  `id_module` int(10) NOT NULL DEFAULT '0',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id_customization`,`type`,`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customized_data`
--

LOCK TABLES `tb_customized_data` WRITE;
/*!40000 ALTER TABLE `tb_customized_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customized_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_date_range`
--

DROP TABLE IF EXISTS `tb_date_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_date_range` (
  `id_date_range` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_start` datetime NOT NULL,
  `time_end` datetime NOT NULL,
  PRIMARY KEY (`id_date_range`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_date_range`
--

LOCK TABLES `tb_date_range` WRITE;
/*!40000 ALTER TABLE `tb_date_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_date_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_delivery`
--

DROP TABLE IF EXISTS `tb_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_delivery` (
  `id_delivery` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned DEFAULT NULL,
  `id_shop_group` int(10) unsigned DEFAULT NULL,
  `id_carrier` int(10) unsigned NOT NULL,
  `id_range_price` int(10) unsigned DEFAULT NULL,
  `id_range_weight` int(10) unsigned DEFAULT NULL,
  `id_zone` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_delivery`),
  KEY `id_zone` (`id_zone`),
  KEY `id_carrier` (`id_carrier`,`id_zone`),
  KEY `id_range_price` (`id_range_price`),
  KEY `id_range_weight` (`id_range_weight`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_delivery`
--

LOCK TABLES `tb_delivery` WRITE;
/*!40000 ALTER TABLE `tb_delivery` DISABLE KEYS */;
INSERT INTO `tb_delivery` VALUES (1,NULL,NULL,2,0,1,1,5.000000),(2,NULL,NULL,2,0,1,2,5.000000),(3,NULL,NULL,2,1,0,1,5.000000),(4,NULL,NULL,2,1,0,2,5.000000);
/*!40000 ALTER TABLE `tb_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_emailsubscription`
--

DROP TABLE IF EXISTS `tb_emailsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_emailsubscription` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `email` varchar(255) NOT NULL,
  `newsletter_date_add` datetime DEFAULT NULL,
  `ip_registration_newsletter` varchar(15) NOT NULL,
  `http_referer` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_emailsubscription`
--

LOCK TABLES `tb_emailsubscription` WRITE;
/*!40000 ALTER TABLE `tb_emailsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_emailsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee` (
  `id_employee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_profile` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `lastname` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `passwd` varchar(60) NOT NULL,
  `last_passwd_gen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stats_date_from` date DEFAULT NULL,
  `stats_date_to` date DEFAULT NULL,
  `stats_compare_from` date DEFAULT NULL,
  `stats_compare_to` date DEFAULT NULL,
  `stats_compare_option` int(1) unsigned NOT NULL DEFAULT '1',
  `preselect_date_range` varchar(32) DEFAULT NULL,
  `bo_color` varchar(32) DEFAULT NULL,
  `bo_theme` varchar(32) DEFAULT NULL,
  `bo_css` varchar(64) DEFAULT NULL,
  `default_tab` int(10) unsigned NOT NULL DEFAULT '0',
  `bo_width` int(10) unsigned NOT NULL DEFAULT '0',
  `bo_menu` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `optin` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `id_last_order` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_customer_message` int(10) unsigned NOT NULL DEFAULT '0',
  `id_last_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `last_connection_date` date DEFAULT NULL,
  `reset_password_token` varchar(40) DEFAULT NULL,
  `reset_password_validity` datetime DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `employee_login` (`email`,`passwd`),
  KEY `id_employee_passwd` (`id_employee`,`passwd`),
  KEY `id_profile` (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee`
--

LOCK TABLES `tb_employee` WRITE;
/*!40000 ALTER TABLE `tb_employee` DISABLE KEYS */;
INSERT INTO `tb_employee` VALUES (1,1,1,'Araujo Berbet','Thiago','thiagoaraujoberbet@gmail.com','$2y$10$2DN1wW3z14.A8u3kK3y/G.DRuvMyn8eukx.Wkw.U9VKikqBWyB.s6','2018-01-17 06:46:01','2017-12-17','2018-01-17','0000-00-00','0000-00-00',1,NULL,NULL,'default','admin-theme.css',1,0,1,1,1,5,0,0,NULL,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_shop`
--

DROP TABLE IF EXISTS `tb_employee_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_shop` (
  `id_employee` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_employee`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_shop`
--

LOCK TABLES `tb_employee_shop` WRITE;
/*!40000 ALTER TABLE `tb_employee_shop` DISABLE KEYS */;
INSERT INTO `tb_employee_shop` VALUES (1,1);
/*!40000 ALTER TABLE `tb_employee_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_feature`
--

DROP TABLE IF EXISTS `tb_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_feature` (
  `id_feature` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_feature`
--

LOCK TABLES `tb_feature` WRITE;
/*!40000 ALTER TABLE `tb_feature` DISABLE KEYS */;
INSERT INTO `tb_feature` VALUES (1,0),(2,1),(3,2),(4,3),(5,4),(6,5),(7,6);
/*!40000 ALTER TABLE `tb_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_feature_lang`
--

DROP TABLE IF EXISTS `tb_feature_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_feature_lang` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`),
  KEY `id_lang` (`id_lang`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_feature_lang`
--

LOCK TABLES `tb_feature_lang` WRITE;
/*!40000 ALTER TABLE `tb_feature_lang` DISABLE KEYS */;
INSERT INTO `tb_feature_lang` VALUES (1,1,'Altura'),(5,1,'ComposiÃ§Ã£o'),(6,1,'Estilos'),(2,1,'Largura'),(4,1,'Peso'),(3,1,'Profundidade'),(7,1,'Propriedades'),(1,2,'Altura'),(5,2,'ComposiÃ§Ã£o'),(6,2,'Estilos'),(2,2,'Largura'),(4,2,'Peso'),(3,2,'Profundidade'),(7,2,'Propriedades');
/*!40000 ALTER TABLE `tb_feature_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_feature_product`
--

DROP TABLE IF EXISTS `tb_feature_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_feature_product` (
  `id_feature` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_feature_value` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_product`),
  KEY `id_feature_value` (`id_feature_value`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_feature_product`
--

LOCK TABLES `tb_feature_product` WRITE;
/*!40000 ALTER TABLE `tb_feature_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_feature_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_feature_shop`
--

DROP TABLE IF EXISTS `tb_feature_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_feature_shop` (
  `id_feature` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_feature`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_feature_shop`
--

LOCK TABLES `tb_feature_shop` WRITE;
/*!40000 ALTER TABLE `tb_feature_shop` DISABLE KEYS */;
INSERT INTO `tb_feature_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `tb_feature_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_feature_value`
--

DROP TABLE IF EXISTS `tb_feature_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_feature_value` (
  `id_feature_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_feature` int(10) unsigned NOT NULL,
  `custom` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`),
  KEY `feature` (`id_feature`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_feature_value`
--

LOCK TABLES `tb_feature_value` WRITE;
/*!40000 ALTER TABLE `tb_feature_value` DISABLE KEYS */;
INSERT INTO `tb_feature_value` VALUES (1,5,0),(2,5,0),(3,5,0),(4,5,0),(5,5,0),(6,5,0),(7,5,0),(8,5,0),(9,5,0),(10,6,0),(11,6,0),(12,6,0),(13,6,0),(14,6,0),(15,6,0),(16,6,0),(17,7,0),(18,7,0),(19,7,0),(20,7,0),(21,7,0),(22,1,1),(23,2,1),(24,4,1),(25,3,1),(26,1,1),(27,2,1),(28,4,1),(29,3,1),(30,1,1),(31,2,1),(32,4,1),(33,3,1);
/*!40000 ALTER TABLE `tb_feature_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_feature_value_lang`
--

DROP TABLE IF EXISTS `tb_feature_value_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_feature_value_lang` (
  `id_feature_value` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_feature_value_lang`
--

LOCK TABLES `tb_feature_value_lang` WRITE;
/*!40000 ALTER TABLE `tb_feature_value_lang` DISABLE KEYS */;
INSERT INTO `tb_feature_value_lang` VALUES (1,1,'PoliÃ©ster'),(1,2,'PoliÃ©ster'),(2,1,'LÃ£'),(2,2,'LÃ£'),(3,1,'Viscose'),(3,2,'Viscose'),(4,1,'Elastano'),(4,2,'Elastano'),(5,1,'AlgodÃ£o'),(5,2,'AlgodÃ£o'),(6,1,'Seda'),(6,2,'Seda'),(7,1,'CamurÃ§a'),(7,2,'CamurÃ§a'),(8,1,'Palha'),(8,2,'Palha'),(9,1,'Couro'),(9,2,'Couro'),(10,1,'ClÃ¡ssico'),(10,2,'ClÃ¡ssico'),(11,1,'Casual'),(11,2,'Casual'),(12,1,'Militar'),(12,2,'Militar'),(13,1,'Ameninado'),(13,2,'Ameninado'),(14,1,'Pedra'),(14,2,'Pedra'),(15,1,'BÃ¡sico'),(15,2,'BÃ¡sico'),(16,1,'Vistoso'),(16,2,'Vistoso'),(17,1,'Manga curta'),(17,2,'Manga curta'),(18,1,'Vestido colorido'),(18,2,'Vestido colorido'),(19,1,'Vestido curto'),(19,2,'Vestido curto'),(20,1,'Vestido mÃ©dio'),(20,2,'Vestido mÃ©dio'),(21,1,'Vestido comprido'),(21,2,'Vestido comprido'),(22,1,'2.75 in'),(22,2,'2.75 in'),(23,1,'2.06 in'),(23,2,'2.06 in'),(24,1,'49.2 g'),(24,2,'49.2 g'),(25,1,'0.26 in'),(25,2,'0.26 in'),(26,1,'1.07 in'),(26,2,'1.07 in'),(27,1,'1.62 in'),(27,2,'1.62 in'),(28,1,'15.5 g'),(28,2,'15.5 g'),(29,1,'0.41 in (clip included)'),(29,2,'0.41 in (clip included)'),(30,1,'4.33 in'),(30,2,'4.33 in'),(31,1,'2.76 in'),(31,2,'2.76 in'),(32,1,'120g'),(32,2,'120g'),(33,1,'0.31 in'),(33,2,'0.31 in');
/*!40000 ALTER TABLE `tb_feature_value_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gender`
--

DROP TABLE IF EXISTS `tb_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gender` (
  `id_gender` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gender`
--

LOCK TABLES `tb_gender` WRITE;
/*!40000 ALTER TABLE `tb_gender` DISABLE KEYS */;
INSERT INTO `tb_gender` VALUES (1,0),(2,1);
/*!40000 ALTER TABLE `tb_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gender_lang`
--

DROP TABLE IF EXISTS `tb_gender_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gender_lang` (
  `id_gender` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_gender`,`id_lang`),
  KEY `id_gender` (`id_gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gender_lang`
--

LOCK TABLES `tb_gender_lang` WRITE;
/*!40000 ALTER TABLE `tb_gender_lang` DISABLE KEYS */;
INSERT INTO `tb_gender_lang` VALUES (1,1,'Sr.'),(1,2,'Sr.'),(2,1,'Sra.'),(2,2,'Sra.');
/*!40000 ALTER TABLE `tb_gender_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_group`
--

DROP TABLE IF EXISTS `tb_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reduction` decimal(17,2) NOT NULL DEFAULT '0.00',
  `price_display_method` tinyint(4) NOT NULL DEFAULT '0',
  `show_prices` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_group`
--

LOCK TABLES `tb_group` WRITE;
/*!40000 ALTER TABLE `tb_group` DISABLE KEYS */;
INSERT INTO `tb_group` VALUES (1,0.00,0,1,'2018-01-17 09:45:59','2018-01-17 09:45:59'),(2,0.00,0,1,'2018-01-17 09:45:59','2018-01-17 09:45:59'),(3,0.00,0,1,'2018-01-17 09:45:59','2018-01-17 09:45:59');
/*!40000 ALTER TABLE `tb_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_group_lang`
--

DROP TABLE IF EXISTS `tb_group_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_group_lang` (
  `id_group` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_group_lang`
--

LOCK TABLES `tb_group_lang` WRITE;
/*!40000 ALTER TABLE `tb_group_lang` DISABLE KEYS */;
INSERT INTO `tb_group_lang` VALUES (1,1,'Visitante'),(1,2,'Visitante'),(2,1,'Cliente nÃ£o registado'),(2,2,'Cliente nÃ£o registado'),(3,1,'Cliente'),(3,2,'Cliente');
/*!40000 ALTER TABLE `tb_group_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_group_reduction`
--

DROP TABLE IF EXISTS `tb_group_reduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_group_reduction` (
  `id_group_reduction` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_group_reduction`),
  UNIQUE KEY `id_group` (`id_group`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_group_reduction`
--

LOCK TABLES `tb_group_reduction` WRITE;
/*!40000 ALTER TABLE `tb_group_reduction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_group_reduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_group_shop`
--

DROP TABLE IF EXISTS `tb_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_group_shop` (
  `id_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_group_shop`
--

LOCK TABLES `tb_group_shop` WRITE;
/*!40000 ALTER TABLE `tb_group_shop` DISABLE KEYS */;
INSERT INTO `tb_group_shop` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `tb_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_guest`
--

DROP TABLE IF EXISTS `tb_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_guest` (
  `id_guest` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_operating_system` int(10) unsigned DEFAULT NULL,
  `id_web_browser` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT '0',
  `screen_resolution_x` smallint(5) unsigned DEFAULT NULL,
  `screen_resolution_y` smallint(5) unsigned DEFAULT NULL,
  `screen_color` tinyint(3) unsigned DEFAULT NULL,
  `sun_java` tinyint(1) DEFAULT NULL,
  `adobe_flash` tinyint(1) DEFAULT NULL,
  `adobe_director` tinyint(1) DEFAULT NULL,
  `apple_quicktime` tinyint(1) DEFAULT NULL,
  `real_player` tinyint(1) DEFAULT NULL,
  `windows_media` tinyint(1) DEFAULT NULL,
  `accept_language` varchar(8) DEFAULT NULL,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_guest`),
  KEY `id_customer` (`id_customer`),
  KEY `id_operating_system` (`id_operating_system`),
  KEY `id_web_browser` (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_guest`
--

LOCK TABLES `tb_guest` WRITE;
/*!40000 ALTER TABLE `tb_guest` DISABLE KEYS */;
INSERT INTO `tb_guest` VALUES (1,0,0,1,0,0,0,0,0,0,0,0,0,0,'',0),(2,8,3,0,0,0,0,0,0,0,0,0,0,0,'pt',0);
/*!40000 ALTER TABLE `tb_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_homeslider`
--

DROP TABLE IF EXISTS `tb_homeslider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_homeslider` (
  `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_homeslider_slides`,`id_shop`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_homeslider`
--

LOCK TABLES `tb_homeslider` WRITE;
/*!40000 ALTER TABLE `tb_homeslider` DISABLE KEYS */;
INSERT INTO `tb_homeslider` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `tb_homeslider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_homeslider_slides`
--

DROP TABLE IF EXISTS `tb_homeslider_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_homeslider_slides` (
  `id_homeslider_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_homeslider_slides`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_homeslider_slides`
--

LOCK TABLES `tb_homeslider_slides` WRITE;
/*!40000 ALTER TABLE `tb_homeslider_slides` DISABLE KEYS */;
INSERT INTO `tb_homeslider_slides` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `tb_homeslider_slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_homeslider_slides_lang`
--

DROP TABLE IF EXISTS `tb_homeslider_slides_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_homeslider_slides_lang` (
  `id_homeslider_slides` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `legend` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_homeslider_slides`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_homeslider_slides_lang`
--

LOCK TABLES `tb_homeslider_slides_lang` WRITE;
/*!40000 ALTER TABLE `tb_homeslider_slides_lang` DISABLE KEYS */;
INSERT INTO `tb_homeslider_slides_lang` VALUES (1,1,'Sample 1','<h2>EXCEPTEUR OCCAECAT</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-1','http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_homeslider&utm_campaign=back-office-PT&utm_content=download','sample-1.jpg'),(1,2,'Sample 1','<h2>EXCEPTEUR OCCAECAT</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-1','http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_homeslider&utm_campaign=back-office-PT&utm_content=download','sample-1.jpg'),(2,1,'Sample 2','<h2>EXCEPTEUR OCCAECAT</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-2','http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_homeslider&utm_campaign=back-office-PT&utm_content=download','sample-2.jpg'),(2,2,'Sample 2','<h2>EXCEPTEUR OCCAECAT</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-2','http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_homeslider&utm_campaign=back-office-PT&utm_content=download','sample-2.jpg'),(3,1,'Sample 3','<h2>EXCEPTEUR OCCAECAT</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-3','http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_homeslider&utm_campaign=back-office-PT&utm_content=download','sample-3.jpg'),(3,2,'Sample 3','<h2>EXCEPTEUR OCCAECAT</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin tristique in tortor et dignissim. Quisque non tempor leo. Maecenas egestas sem elit</p>','sample-3','http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_homeslider&utm_campaign=back-office-PT&utm_content=download','sample-3.jpg');
/*!40000 ALTER TABLE `tb_homeslider_slides_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook`
--

DROP TABLE IF EXISTS `tb_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hook` (
  `id_hook` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text,
  `position` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_hook`),
  UNIQUE KEY `hook_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hook`
--

LOCK TABLES `tb_hook` WRITE;
/*!40000 ALTER TABLE `tb_hook` DISABLE KEYS */;
INSERT INTO `tb_hook` VALUES (1,'actionValidateOrder','New orders','',1),(2,'displayMaintenance','Maintenance Page','This hook displays new elements on the maintenance page',1),(3,'displayProductPageDrawer','Product Page Drawer','This hook displays content in the right sidebar of the product page',1),(4,'actionPaymentConfirmation','Payment confirmation','This hook displays new elements after the payment is validated',1),(5,'displayPaymentReturn','Payment return','',1),(6,'actionUpdateQuantity','Quantity update','Quantity is updated only when a customer effectively places their order',1),(7,'displayRightColumn','Right column blocks','This hook displays new elements in the right-hand column',1),(8,'displayWrapperTop','Main wrapper section (top)','This hook displays new elements in the top of the main wrapper',1),(9,'displayWrapperBottom','Main wrapper section (bottom)','This hook displays new elements in the bottom of the main wrapper',1),(10,'displayContentWrapperTop','Content wrapper section (top)','This hook displays new elements in the top of the content wrapper',1),(11,'displayContentWrapperBottom','Content wrapper section (bottom)','This hook displays new elements in the bottom of the content wrapper',1),(12,'displayLeftColumn','Left column blocks','This hook displays new elements in the left-hand column',1),(13,'displayHome','Homepage content','This hook displays new elements on the homepage',1),(14,'Header','Pages html head section','This hook adds additional elements in the head section of your pages (head section of html)',1),(15,'actionCartSave','Cart creation and update','This hook is displayed when a product is added to the cart or if the cart\'s content is modified',1),(16,'actionAuthentication','Successful customer authentication','This hook is displayed after a customer successfully signs in',1),(17,'actionProductAdd','Product creation','This hook is displayed after a product is created',1),(18,'actionProductUpdate','Product update','This hook is displayed after a product has been updated',1),(19,'displayAfterBodyOpeningTag','Very top of pages','Use this hook for advertisement or modals you want to load first',1),(20,'displayBeforeBodyClosingTag','Very bottom of pages','Use this hook for your modals or any content you want to load at the very end',1),(21,'displayTop','Top of pages','This hook displays additional elements at the top of your pages',1),(22,'displayNavFullWidth','Navigation','This hook displays full width navigation menu at the top of your pages',1),(23,'displayRightColumnProduct','New elements on the product page (right column)','This hook displays new elements in the right-hand column of the product page',1),(24,'actionProductDelete','Product deletion','This hook is called when a product is deleted',1),(25,'actionObjectProductInCartDeleteBefore','Cart product removal','This hook is called before a product is removed from a cart',1),(26,'actionObjectProductInCartDeleteAfter','Cart product removal','This hook is called after a product is removed from a cart',1),(27,'displayFooterProduct','Product footer','This hook adds new blocks under the product\'s description',1),(28,'displayInvoice','Invoice','This hook displays new blocks on the invoice (order)',1),(29,'actionOrderStatusUpdate','Order status update - Event','This hook launches modules when the status of an order changes',1),(30,'displayAdminOrder','Display new elements in the Back Office, tab AdminOrder','This hook launches modules when the AdminOrder tab is displayed in the Back Office',1),(31,'displayAdminOrderTabOrder','Display new elements in Back Office, AdminOrder, panel Order','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel tabs',1),(32,'displayAdminOrderTabShip','Display new elements in Back Office, AdminOrder, panel Shipping','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel tabs',1),(33,'displayAdminOrderContentOrder','Display new elements in Back Office, AdminOrder, panel Order','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Order panel content',1),(34,'displayAdminOrderContentShip','Display new elements in Back Office, AdminOrder, panel Shipping','This hook launches modules when the AdminOrder tab is displayed in the Back Office and extends / override Shipping panel content',1),(35,'displayFooter','Footer','This hook displays new blocks in the footer',1),(36,'displayPDFInvoice','PDF Invoice','This hook allows you to display additional information on PDF invoices',1),(37,'displayInvoiceLegalFreeText','PDF Invoice - Legal Free Text','This hook allows you to modify the legal free text on PDF invoices',1),(38,'displayAdminCustomers','Display new elements in the Back Office, tab AdminCustomers','This hook launches modules when the AdminCustomers tab is displayed in the Back Office',1),(39,'displayOrderConfirmation','Order confirmation page','This hook is called within an order\'s confirmation page',1),(40,'actionCustomerAccountAdd','Successful customer account creation','This hook is called when a new customer creates an account successfully',1),(41,'actionCustomerAccountUpdate','Successful customer account update','This hook is called when a customer updates its account successfully',1),(42,'displayCustomerAccount','Customer account displayed in Front Office','This hook displays new elements on the customer account page',1),(43,'actionOrderSlipAdd','Order slip creation','This hook is called when a new credit slip is added regarding client order',1),(44,'displayShoppingCartFooter','Shopping cart footer','This hook displays some specific information on the shopping cart\'s page',1),(45,'displayCreateAccountEmailFormBottom','Customer authentication form','This hook displays some information on the bottom of the email form',1),(46,'displayAuthenticateFormBottom','Customer authentication form','This hook displays some information on the bottom of the authentication form',1),(47,'displayCustomerAccountForm','Customer account creation form','This hook displays some information on the form to create a customer account',1),(48,'displayAdminStatsModules','Stats - Modules','',1),(49,'displayAdminStatsGraphEngine','Graph engines','',1),(50,'actionOrderReturn','Returned product','This hook is displayed when a customer returns a product ',1),(51,'displayProductAdditionalInfo','Product page additional info','This hook adds additional information on the product page',1),(52,'displayBackOfficeHome','Administration panel homepage','This hook is displayed on the admin panel\'s homepage',1),(53,'displayAdminStatsGridEngine','Grid engines','',1),(54,'actionWatermark','Watermark','',1),(55,'actionProductCancel','Product cancelled','This hook is called when you cancel a product in an order',1),(56,'displayLeftColumnProduct','New elements on the product page (left column)','This hook displays new elements in the left-hand column of the product page',1),(57,'actionProductOutOfStock','Out-of-stock product','This hook displays new action buttons if a product is out of stock',1),(58,'actionProductAttributeUpdate','Product attribute update','This hook is displayed when a product\'s attribute is updated',1),(59,'displayCarrierList','Extra carrier (module mode)','',1),(60,'displayShoppingCart','Shopping cart - Additional button','This hook displays new action buttons within the shopping cart',1),(61,'actionCarrierUpdate','Carrier Update','This hook is called when a carrier is updated',1),(62,'actionOrderStatusPostUpdate','Post update of order status','',1),(63,'displayCustomerAccountFormTop','Block above the form for create an account','This hook is displayed above the customer\'s account creation form',1),(64,'displayBackOfficeHeader','Administration panel header','This hook is displayed in the header of the admin panel',1),(65,'displayBackOfficeTop','Administration panel hover the tabs','This hook is displayed on the roll hover of the tabs within the admin panel',1),(66,'displayBackOfficeFooter','Administration panel footer','This hook is displayed within the admin panel\'s footer',1),(67,'actionProductAttributeDelete','Product attribute deletion','This hook is displayed when a product\'s attribute is deleted',1),(68,'actionCarrierProcess','Carrier process','',1),(69,'displayBeforeCarrier','Before carriers list','This hook is displayed before the carrier list in Front Office',1),(70,'displayAfterCarrier','After carriers list','This hook is displayed after the carrier list in Front Office',1),(71,'displayOrderDetail','Order detail','This hook is displayed within the order\'s details in Front Office',1),(72,'actionPaymentCCAdd','Payment CC added','',1),(73,'actionCategoryAdd','Category creation','This hook is displayed when a category is created',1),(74,'actionCategoryUpdate','Category modification','This hook is displayed when a category is modified',1),(75,'actionCategoryDelete','Category deletion','This hook is displayed when a category is deleted',1),(76,'displayPaymentTop','Top of payment page','This hook is displayed at the top of the payment page',1),(77,'actionHtaccessCreate','After htaccess creation','This hook is displayed after the htaccess creation',1),(78,'actionAdminMetaSave','After saving the configuration in AdminMeta','This hook is displayed after saving the configuration in AdminMeta',1),(79,'displayAttributeGroupForm','Add fields to the form \'attribute group\'','This hook adds fields to the form \'attribute group\'',1),(80,'actionAttributeGroupSave','Saving an attribute group','This hook is called while saving an attributes group',1),(81,'actionAttributeGroupDelete','Deleting attribute group','This hook is called while deleting an attributes  group',1),(82,'displayFeatureForm','Add fields to the form \'feature\'','This hook adds fields to the form \'feature\'',1),(83,'actionFeatureSave','Saving attributes\' features','This hook is called while saving an attributes features',1),(84,'actionFeatureDelete','Deleting attributes\' features','This hook is called while deleting an attributes features',1),(85,'actionProductSave','Saving products','This hook is called while saving products',1),(86,'displayAttributeGroupPostProcess','On post-process in admin attribute group','This hook is called on post-process in admin attribute group',1),(87,'displayFeaturePostProcess','On post-process in admin feature','This hook is called on post-process in admin feature',1),(88,'displayFeatureValueForm','Add fields to the form \'feature value\'','This hook adds fields to the form \'feature value\'',1),(89,'displayFeatureValuePostProcess','On post-process in admin feature value','This hook is called on post-process in admin feature value',1),(90,'actionFeatureValueDelete','Deleting attributes\' features\' values','This hook is called while deleting an attributes features value',1),(91,'actionFeatureValueSave','Saving an attributes features value','This hook is called while saving an attributes features value',1),(92,'displayAttributeForm','Add fields to the form \'attribute value\'','This hook adds fields to the form \'attribute value\'',1),(93,'actionAttributePostProcess','On post-process in admin feature value','This hook is called on post-process in admin feature value',1),(94,'actionAttributeDelete','Deleting an attributes features value','This hook is called while deleting an attributes features value',1),(95,'actionAttributeSave','Saving an attributes features value','This hook is called while saving an attributes features value',1),(96,'actionTaxManager','Tax Manager Factory','',1),(97,'displayMyAccountBlock','My account block','This hook displays extra information within the \'my account\' block\"',1),(98,'actionModuleInstallBefore','actionModuleInstallBefore','',1),(99,'actionModuleInstallAfter','actionModuleInstallAfter','',1),(100,'displayTopColumn','Top column blocks','This hook displays new elements in the top of columns',1),(101,'displayBackOfficeCategory','Display new elements in the Back Office, tab AdminCategories','This hook launches modules when the AdminCategories tab is displayed in the Back Office',1),(102,'displayProductListFunctionalButtons','Display new elements in the Front Office, products list','This hook launches modules when the products list is displayed in the Front Office',1),(103,'displayNav','Navigation','',1),(104,'displayOverrideTemplate','Change the default template of current controller','',1),(105,'actionAdminLoginControllerSetMedia','Set media on admin login page header','This hook is called after adding media to admin login page header',1),(106,'actionOrderEdited','Order edited','This hook is called when an order is edited',1),(107,'actionEmailAddBeforeContent','Add extra content before mail content','This hook is called just before fetching mail template',1),(108,'actionEmailAddAfterContent','Add extra content after mail content','This hook is called just after fetching mail template',1),(109,'sendMailAlterTemplateVars','Alter template vars on the fly','This hook is called when Mail::send() is called',1),(110,'displayCartExtraProductActions','Extra buttons in shopping cart','This hook adds extra buttons to the product lines, in the shopping cart',1),(111,'displayPaymentByBinaries','Payment form generated by binaries','This hook displays form generated by binaries during the checkout',1),(112,'additionalCustomerFormFields','Add fields to the Customer form','This hook returns an array of FormFields to add them to the customer registration form',1),(113,'addWebserviceResources','Add extra webservice resource','This hook is called when webservice resources list in webservice controller',1),(114,'displayCustomerLoginFormAfter','Display elements after login form','This hook displays new elements after the login form',1),(115,'actionClearCache','Clear smarty cache','This hook is called when smarty\'s cache is cleared',1),(116,'actionClearCompileCache','Clear smarty compile cache','This hook is called when smarty\'s compile cache is cleared',1),(117,'actionClearSf2Cache','Clear Sf2 cache','This hook is called when the Symfony cache is cleared',1),(118,'actionValidateCustomerAddressForm','Customer address form validation','This hook is called when a customer submit its address form',1),(119,'displayCarrierExtraContent','Display additional content for a carrier (e.g pickup points)','This hook calls only the module related to the carrier, in order to add options when needed',1),(120,'validateCustomerFormFields','Customer registration form validation','This hook is called to a module when it has sent additional fields with additionalCustomerFormFields',1),(121,'displayProductExtraContent','Display extra content on the product page','This hook expects ProductExtraContent instances, which will be properly displayed by the template on the product page',1),(122,'filterCmsContent','Filter the content page','This hook is called just before fetching content page',1),(123,'filterCmsCategoryContent','Filter the content page category','This hook is called just before fetching content page category',1),(124,'filterProductContent','Filter the content page product','This hook is called just before fetching content page product',1),(125,'filterCategoryContent','Filter the content page category','This hook is called just before fetching content page category',1),(126,'filterManufacturerContent','Filter the content page manufacturer','This hook is called just before fetching content page manufacturer',1),(127,'filterSupplierContent','Filter the content page supplier','This hook is called just before fetching content page supplier',1),(128,'filterHtmlContent','Filter HTML field before rending a page','This hook is called just before fetching a page on HTML field',1),(129,'displayDashboardTop','Dashboard Top','Displays the content in the dashboard\'s top area',1),(130,'actionUpdateLangAfter','Update \"lang\" tables','Update \"lang\" tables after adding or updating a language',1),(131,'actionOutputHTMLBefore','Before HTML output','This hook is used to filter the whole HTML page before it is rendered (only front)',1),(132,'displayAfterProductThumbs','Display extra content below product thumbs','This hook displays new elements below product images ex. additional media',1),(133,'actionDispatcherBefore','Before dispatch','This hook is called at the beginning of the dispatch method of the Dispatcher',1),(134,'actionDispatcherAfter','After dispatch','This hook is called at the end of the dispatch method of the Dispatcher',1),(135,'filterProductSearch','Filter search products result','This hook is called in order to allow to modify search product result',1),(136,'actionProductSearchAfter','Event triggered after search product completed','This hook is called after the product search. Parameters are already filter',1),(137,'actionEmailSendBefore','Before sending an email','This hook is used to filter the content or the metadata of an email before sending it or even prevent its sending',1),(138,'displayAdminProductsMainStepLeftColumnMiddle','Display new elements in back office product page, left column of','This hook launches modules when the back office product page is displayed',1),(139,'displayAdminProductsMainStepLeftColumnBottom','Display new elements in back office product page, left column of','This hook launches modules when the back office product page is displayed',1),(140,'displayAdminProductsMainStepRightColumnBottom','Display new elements in back office product page, right column o','This hook launches modules when the back office product page is displayed',1),(141,'displayAdminProductsQuantitiesStepBottom','Display new elements in back office product page, Quantities/Com','This hook launches modules when the back office product page is displayed',1),(142,'displayAdminProductsPriceStepBottom','Display new elements in back office product page, Price tab','This hook launches modules when the back office product page is displayed',1),(143,'displayAdminProductsOptionsStepTop','Display new elements in back office product page, Options tab','This hook launches modules when the back office product page is displayed',1),(144,'displayAdminProductsOptionsStepBottom','Display new elements in back office product page, Options tab','This hook launches modules when the back office product page is displayed',1),(145,'displayAdminProductsSeoStepBottom','Display new elements in back office product page, SEO tab','This hook launches modules when the back office product page is displayed',1),(146,'displayAdminProductsShippingStepBottom','Display new elements in back office product page, Shipping tab','This hook launches modules when the back office product page is displayed',1),(147,'displayAdminProductsCombinationBottom','Display new elements in back office product page, Combination ta','This hook launches modules when the back office product page is displayed',1),(148,'dashboardZoneOne','dashboardZoneOne','',1),(149,'dashboardData','dashboardData','',1),(150,'actionObjectOrderAddAfter','actionObjectOrderAddAfter','',1),(151,'actionObjectCustomerAddAfter','actionObjectCustomerAddAfter','',1),(152,'actionObjectCustomerMessageAddAfter','actionObjectCustomerMessageAddAfter','',1),(153,'actionObjectCustomerThreadAddAfter','actionObjectCustomerThreadAddAfter','',1),(154,'actionObjectOrderReturnAddAfter','actionObjectOrderReturnAddAfter','',1),(155,'actionAdminControllerSetMedia','actionAdminControllerSetMedia','',1),(156,'dashboardZoneTwo','dashboardZoneTwo','',1),(157,'actionSearch','actionSearch','',1),(158,'actionObjectLanguageAddAfter','actionObjectLanguageAddAfter','',1),(159,'paymentOptions','paymentOptions','',1),(160,'displayNav1','displayNav1','',1),(161,'actionAdminStoresControllerUpdate_optionsAfter','actionAdminStoresControllerUpdate_optionsAfter','',1),(162,'actionAdminCurrenciesControllerSaveAfter','actionAdminCurrenciesControllerSaveAfter','',1),(163,'actionModuleRegisterHookAfter','actionModuleRegisterHookAfter','',1),(164,'actionModuleUnRegisterHookAfter','actionModuleUnRegisterHookAfter','',1),(165,'displayFooterBefore','displayFooterBefore','',1),(166,'productSearchProvider','productSearchProvider','',1),(167,'displayOrderConfirmation2','displayOrderConfirmation2','',1),(168,'displayCrossSellingShoppingCart','displayCrossSellingShoppingCart','',1),(169,'actionAdminGroupsControllerSaveAfter','actionAdminGroupsControllerSaveAfter','',1),(170,'actionShopDataDuplication','actionShopDataDuplication','',1),(171,'actionObjectCategoryUpdateAfter','actionObjectCategoryUpdateAfter','',1),(172,'actionObjectCategoryDeleteAfter','actionObjectCategoryDeleteAfter','',1),(173,'actionObjectCategoryAddAfter','actionObjectCategoryAddAfter','',1),(174,'actionObjectCmsUpdateAfter','actionObjectCmsUpdateAfter','',1),(175,'actionObjectCmsDeleteAfter','actionObjectCmsDeleteAfter','',1),(176,'actionObjectCmsAddAfter','actionObjectCmsAddAfter','',1),(177,'actionObjectSupplierUpdateAfter','actionObjectSupplierUpdateAfter','',1),(178,'actionObjectSupplierDeleteAfter','actionObjectSupplierDeleteAfter','',1),(179,'actionObjectSupplierAddAfter','actionObjectSupplierAddAfter','',1),(180,'actionObjectManufacturerUpdateAfter','actionObjectManufacturerUpdateAfter','',1),(181,'actionObjectManufacturerDeleteAfter','actionObjectManufacturerDeleteAfter','',1),(182,'actionObjectManufacturerAddAfter','actionObjectManufacturerAddAfter','',1),(183,'actionObjectProductUpdateAfter','actionObjectProductUpdateAfter','',1),(184,'actionObjectProductDeleteAfter','actionObjectProductDeleteAfter','',1),(185,'actionObjectProductAddAfter','actionObjectProductAddAfter','',1),(186,'displaySearch','displaySearch','',1),(187,'search','search','',1),(188,'displayAdminNavBarBeforeEnd','displayAdminNavBarBeforeEnd','',1),(189,'displayAdminAfterHeader','displayAdminAfterHeader','',1),(190,'displayNav2','','',1),(191,'displayReassurance','','',1),(192,'actionAdminMetaControllerUpdate_optionsAfter','actionAdminMetaControllerUpdate_optionsAfter','',1),(193,'actionAdminPerformanceControllerSaveAfter','actionAdminPerformanceControllerSaveAfter','',1),(194,'actionObjectCarrierAddAfter','actionObjectCarrierAddAfter','',1),(195,'actionObjectContactAddAfter','actionObjectContactAddAfter','',1),(196,'actionAdminThemesControllerUpdate_optionsAfter','actionAdminThemesControllerUpdate_optionsAfter','',1),(197,'actionObjectShopUpdateAfter','actionObjectShopUpdateAfter','',1),(198,'actionAdminPreferencesControllerUpdate_optionsAfter','actionAdminPreferencesControllerUpdate_optionsAfter','',1),(199,'actionObjectShopAddAfter','actionObjectShopAddAfter','',1),(200,'actionObjectShopGroupAddAfter','actionObjectShopGroupAddAfter','',1),(201,'actionObjectCartAddAfter','actionObjectCartAddAfter','',1),(202,'actionObjectEmployeeAddAfter','actionObjectEmployeeAddAfter','',1),(203,'actionObjectImageAddAfter','actionObjectImageAddAfter','',1),(204,'actionObjectCartRuleAddAfter','actionObjectCartRuleAddAfter','',1),(205,'actionAdminStoresControllerSaveAfter','actionAdminStoresControllerSaveAfter','',1),(206,'actionAdminWebserviceControllerSaveAfter','actionAdminWebserviceControllerSaveAfter','',1);
/*!40000 ALTER TABLE `tb_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook_alias`
--

DROP TABLE IF EXISTS `tb_hook_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hook_alias` (
  `id_hook_alias` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_hook_alias`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hook_alias`
--

LOCK TABLES `tb_hook_alias` WRITE;
/*!40000 ALTER TABLE `tb_hook_alias` DISABLE KEYS */;
INSERT INTO `tb_hook_alias` VALUES (1,'newOrder','actionValidateOrder'),(2,'paymentConfirm','actionPaymentConfirmation'),(3,'paymentReturn','displayPaymentReturn'),(4,'updateQuantity','actionUpdateQuantity'),(5,'rightColumn','displayRightColumn'),(6,'leftColumn','displayLeftColumn'),(7,'home','displayHome'),(8,'displayHeader','Header'),(9,'cart','actionCartSave'),(10,'authentication','actionAuthentication'),(11,'addproduct','actionProductAdd'),(12,'updateproduct','actionProductUpdate'),(13,'top','displayTop'),(14,'extraRight','displayRightColumnProduct'),(15,'deleteproduct','actionProductDelete'),(16,'productfooter','displayFooterProduct'),(17,'invoice','displayInvoice'),(18,'updateOrderStatus','actionOrderStatusUpdate'),(19,'adminOrder','displayAdminOrder'),(20,'footer','displayFooter'),(21,'PDFInvoice','displayPDFInvoice'),(22,'adminCustomers','displayAdminCustomers'),(23,'orderConfirmation','displayOrderConfirmation'),(24,'createAccount','actionCustomerAccountAdd'),(25,'customerAccount','displayCustomerAccount'),(26,'orderSlip','actionOrderSlipAdd'),(27,'shoppingCart','displayShoppingCartFooter'),(28,'createAccountForm','displayCustomerAccountForm'),(29,'AdminStatsModules','displayAdminStatsModules'),(30,'GraphEngine','displayAdminStatsGraphEngine'),(31,'orderReturn','actionOrderReturn'),(32,'productActions','displayProductAdditionalInfo'),(33,'displayProductButtons','displayProductAdditionalInfo'),(34,'backOfficeHome','displayBackOfficeHome'),(35,'GridEngine','displayAdminStatsGridEngine'),(36,'watermark','actionWatermark'),(37,'cancelProduct','actionProductCancel'),(38,'extraLeft','displayLeftColumnProduct'),(39,'productOutOfStock','actionProductOutOfStock'),(40,'updateProductAttribute','actionProductAttributeUpdate'),(41,'extraCarrier','displayCarrierList'),(42,'shoppingCartExtra','displayShoppingCart'),(43,'updateCarrier','actionCarrierUpdate'),(44,'postUpdateOrderStatus','actionOrderStatusPostUpdate'),(45,'createAccountTop','displayCustomerAccountFormTop'),(46,'backOfficeHeader','displayBackOfficeHeader'),(47,'backOfficeTop','displayBackOfficeTop'),(48,'backOfficeFooter','displayBackOfficeFooter'),(49,'deleteProductAttribute','actionProductAttributeDelete'),(50,'processCarrier','actionCarrierProcess'),(51,'beforeCarrier','displayBeforeCarrier'),(52,'orderDetailDisplayed','displayOrderDetail'),(53,'paymentCCAdded','actionPaymentCCAdd'),(54,'categoryAddition','actionCategoryAdd'),(55,'categoryUpdate','actionCategoryUpdate'),(56,'categoryDeletion','actionCategoryDelete'),(57,'paymentTop','displayPaymentTop'),(58,'afterCreateHtaccess','actionHtaccessCreate'),(59,'afterSaveAdminMeta','actionAdminMetaSave'),(60,'attributeGroupForm','displayAttributeGroupForm'),(61,'afterSaveAttributeGroup','actionAttributeGroupSave'),(62,'afterDeleteAttributeGroup','actionAttributeGroupDelete'),(63,'featureForm','displayFeatureForm'),(64,'afterSaveFeature','actionFeatureSave'),(65,'afterDeleteFeature','actionFeatureDelete'),(66,'afterSaveProduct','actionProductSave'),(67,'postProcessAttributeGroup','displayAttributeGroupPostProcess'),(68,'postProcessFeature','displayFeaturePostProcess'),(69,'featureValueForm','displayFeatureValueForm'),(70,'postProcessFeatureValue','displayFeatureValuePostProcess'),(71,'afterDeleteFeatureValue','actionFeatureValueDelete'),(72,'afterSaveFeatureValue','actionFeatureValueSave'),(73,'attributeForm','displayAttributeForm'),(74,'postProcessAttribute','actionAttributePostProcess'),(75,'afterDeleteAttribute','actionAttributeDelete'),(76,'afterSaveAttribute','actionAttributeSave'),(77,'taxManager','actionTaxManager'),(78,'myAccountBlock','displayMyAccountBlock'),(79,'actionBeforeCartUpdateQty','actionCartUpdateQuantityBefore'),(80,'actionBeforeAjaxDie','actionAjaxDieBefore'),(81,'actionBeforeAuthentication','actionAuthenticationBefore'),(82,'actionBeforeSubmitAccount','actionSubmitAccountBefore'),(83,'actionAfterDeleteProductInCart','actionDeleteProductInCartAfter');
/*!40000 ALTER TABLE `tb_hook_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook_module`
--

DROP TABLE IF EXISTS `tb_hook_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hook_module` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_hook` int(10) unsigned NOT NULL,
  `position` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_hook`,`id_shop`),
  KEY `id_hook` (`id_hook`),
  KEY `id_module` (`id_module`),
  KEY `position` (`id_shop`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hook_module`
--

LOCK TABLES `tb_hook_module` WRITE;
/*!40000 ALTER TABLE `tb_hook_module` DISABLE KEYS */;
INSERT INTO `tb_hook_module` VALUES (1,1,149,1),(1,1,150,1),(1,1,151,1),(1,1,152,1),(1,1,153,1),(1,1,154,1),(1,1,155,1),(2,1,62,1),(2,1,156,1),(4,1,157,1),(5,1,49,1),(6,1,53,1),(7,1,158,1),(8,1,12,1),(9,1,5,1),(9,1,159,1),(10,1,160,1),(10,1,161,1),(11,1,162,1),(12,1,163,1),(12,1,164,1),(15,1,40,1),(15,1,112,1),(15,1,165,1),(16,1,73,1),(16,1,74,1),(16,1,75,1),(16,1,80,1),(16,1,81,1),(16,1,83,1),(16,1,84,1),(16,1,85,1),(16,1,90,1),(16,1,91,1),(16,1,93,1),(16,1,94,1),(16,1,95,1),(16,1,166,1),(17,1,17,1),(17,1,18,1),(17,1,24,1),(17,1,167,1),(17,1,168,1),(17,1,169,1),(18,1,13,1),(18,1,14,1),(18,1,170,1),(19,1,190,1),(20,1,35,1),(20,1,130,1),(21,1,21,1),(21,1,171,1),(21,1,172,1),(21,1,173,1),(21,1,174,1),(21,1,175,1),(21,1,176,1),(21,1,177,1),(21,1,178,1),(21,1,179,1),(21,1,180,1),(21,1,181,1),(21,1,182,1),(21,1,183,1),(21,1,184,1),(21,1,185,1),(22,1,186,1),(23,1,51,1),(27,1,48,1),(37,1,16,1),(37,1,20,1),(47,1,187,1),(50,1,64,1),(50,1,188,1),(50,1,189,1),(51,1,1,1),(51,1,29,1),(51,1,99,1),(51,1,192,1),(51,1,193,1),(51,1,194,1),(51,1,195,1),(51,1,196,1),(51,1,197,1),(51,1,198,1),(51,1,199,1),(51,1,200,1),(51,1,201,1),(51,1,202,1),(51,1,203,1),(51,1,204,1),(51,1,205,1),(51,1,206,1),(53,1,148,1),(54,1,191,1),(1,1,148,2),(2,1,149,2),(2,1,155,2),(3,1,156,2),(4,1,150,2),(11,1,190,2),(12,1,35,2),(16,1,12,2),(17,1,13,2),(17,1,74,2),(21,1,170,2),(22,1,14,2),(22,1,21,2),(25,1,165,2),(26,1,5,2),(26,1,159,2),(28,1,48,2),(37,1,40,2),(51,1,64,2),(51,1,151,2),(51,1,153,2),(51,1,161,2),(51,1,176,2),(51,1,185,2),(52,1,163,2),(52,1,164,2),(54,1,130,2),(3,1,149,3),(3,1,155,3),(4,1,156,3),(7,1,13,3),(10,1,35,3),(13,1,190,3),(21,1,74,3),(24,1,14,3),(29,1,48,3),(51,1,150,3),(52,1,64,3),(4,1,149,4),(5,1,155,4),(14,1,13,4),(24,1,190,4),(30,1,48,4),(31,1,48,5),(32,1,48,6),(33,1,48,7),(34,1,48,8),(35,1,48,9),(36,1,48,10),(38,1,48,11),(39,1,48,12),(40,1,48,13),(41,1,48,14),(42,1,48,15),(43,1,48,16),(44,1,48,17),(45,1,48,18),(46,1,48,19),(47,1,48,20),(48,1,48,21),(49,1,48,22);
/*!40000 ALTER TABLE `tb_hook_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hook_module_exceptions`
--

DROP TABLE IF EXISTS `tb_hook_module_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hook_module_exceptions` (
  `id_hook_module_exceptions` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_module` int(10) unsigned NOT NULL,
  `id_hook` int(10) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_hook_module_exceptions`),
  KEY `id_module` (`id_module`),
  KEY `id_hook` (`id_hook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hook_module_exceptions`
--

LOCK TABLES `tb_hook_module_exceptions` WRITE;
/*!40000 ALTER TABLE `tb_hook_module_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_hook_module_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_image`
--

DROP TABLE IF EXISTS `tb_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_image` (
  `id_image` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `position` smallint(2) unsigned NOT NULL DEFAULT '0',
  `cover` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_image`),
  UNIQUE KEY `id_product_cover` (`id_product`,`cover`),
  UNIQUE KEY `idx_product_image` (`id_image`,`id_product`,`cover`),
  KEY `image_product` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_image`
--

LOCK TABLES `tb_image` WRITE;
/*!40000 ALTER TABLE `tb_image` DISABLE KEYS */;
INSERT INTO `tb_image` VALUES (24,8,1,1);
/*!40000 ALTER TABLE `tb_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_image_lang`
--

DROP TABLE IF EXISTS `tb_image_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_image_lang` (
  `id_image` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `legend` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_lang`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_image_lang`
--

LOCK TABLES `tb_image_lang` WRITE;
/*!40000 ALTER TABLE `tb_image_lang` DISABLE KEYS */;
INSERT INTO `tb_image_lang` VALUES (24,1,''),(24,2,'');
/*!40000 ALTER TABLE `tb_image_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_image_shop`
--

DROP TABLE IF EXISTS `tb_image_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_image_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_image` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `cover` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_image`,`id_shop`),
  UNIQUE KEY `id_product` (`id_product`,`id_shop`,`cover`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_image_shop`
--

LOCK TABLES `tb_image_shop` WRITE;
/*!40000 ALTER TABLE `tb_image_shop` DISABLE KEYS */;
INSERT INTO `tb_image_shop` VALUES (8,24,1,1);
/*!40000 ALTER TABLE `tb_image_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_image_type`
--

DROP TABLE IF EXISTS `tb_image_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_image_type` (
  `id_image_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `products` tinyint(1) NOT NULL DEFAULT '1',
  `categories` tinyint(1) NOT NULL DEFAULT '1',
  `manufacturers` tinyint(1) NOT NULL DEFAULT '1',
  `suppliers` tinyint(1) NOT NULL DEFAULT '1',
  `stores` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_image_type`),
  KEY `image_type_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_image_type`
--

LOCK TABLES `tb_image_type` WRITE;
/*!40000 ALTER TABLE `tb_image_type` DISABLE KEYS */;
INSERT INTO `tb_image_type` VALUES (1,'cart_default',125,125,1,0,0,0,0),(2,'small_default',98,98,1,1,1,1,0),(3,'medium_default',452,452,1,0,1,1,0),(4,'home_default',250,250,1,0,0,0,0),(5,'large_default',800,800,1,0,1,1,0),(6,'category_default',141,180,0,1,0,0,0),(7,'stores_default',170,115,0,0,0,0,1);
/*!40000 ALTER TABLE `tb_image_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_import_match`
--

DROP TABLE IF EXISTS `tb_import_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_import_match` (
  `id_import_match` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `match` text NOT NULL,
  `skip` int(2) NOT NULL,
  PRIMARY KEY (`id_import_match`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_import_match`
--

LOCK TABLES `tb_import_match` WRITE;
/*!40000 ALTER TABLE `tb_import_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_import_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_info`
--

DROP TABLE IF EXISTS `tb_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_info` (
  `id_info` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_info`
--

LOCK TABLES `tb_info` WRITE;
/*!40000 ALTER TABLE `tb_info` DISABLE KEYS */;
INSERT INTO `tb_info` VALUES (1,1);
/*!40000 ALTER TABLE `tb_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_info_lang`
--

DROP TABLE IF EXISTS `tb_info_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_info_lang` (
  `id_info` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id_info`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_info_lang`
--

LOCK TABLES `tb_info_lang` WRITE;
/*!40000 ALTER TABLE `tb_info_lang` DISABLE KEYS */;
INSERT INTO `tb_info_lang` VALUES (1,1,'<h3>Custom Text Block</h3>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetu</strong></p>\n<p>Sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.</p>'),(1,2,'<h3>Custom Text Block</h3>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetu</strong></p>\n<p>Sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.</p>');
/*!40000 ALTER TABLE `tb_info_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_lang`
--

DROP TABLE IF EXISTS `tb_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_lang` (
  `id_lang` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `iso_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `date_format_lite` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `date_format_full` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `is_rtl` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_lang`
--

LOCK TABLES `tb_lang` WRITE;
/*!40000 ALTER TABLE `tb_lang` DISABLE KEYS */;
INSERT INTO `tb_lang` VALUES (1,'PortuguÃªs (Portuguese)',1,'pt','pt-pt','pt-PT','Y-m-d','Y-m-d H:i:s',0),(2,'PortuguÃªs (Brasil)',1,'br','pt-br','pt-BR','Y-m-d','Y-m-d H:i:s',0);
/*!40000 ALTER TABLE `tb_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_lang_shop`
--

DROP TABLE IF EXISTS `tb_lang_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_lang_shop` (
  `id_lang` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  PRIMARY KEY (`id_lang`,`id_shop`),
  KEY `IDX_433D9FB3BA299860` (`id_lang`),
  KEY `IDX_433D9FB3274A50A0` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_lang_shop`
--

LOCK TABLES `tb_lang_shop` WRITE;
/*!40000 ALTER TABLE `tb_lang_shop` DISABLE KEYS */;
INSERT INTO `tb_lang_shop` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `tb_lang_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_category`
--

DROP TABLE IF EXISTS `tb_layered_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_category` (
  `id_layered_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `id_category` int(10) unsigned NOT NULL,
  `id_value` int(10) unsigned DEFAULT '0',
  `type` enum('category','id_feature','id_attribute_group','quantity','condition','manufacturer','weight','price') NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `filter_type` int(10) unsigned NOT NULL DEFAULT '0',
  `filter_show_limit` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_layered_category`),
  KEY `id_category` (`id_category`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_category`
--

LOCK TABLES `tb_layered_category` WRITE;
/*!40000 ALTER TABLE `tb_layered_category` DISABLE KEYS */;
INSERT INTO `tb_layered_category` VALUES (1,1,2,NULL,'category',1,0,0),(2,1,2,1,'id_attribute_group',2,0,0),(3,1,2,3,'id_attribute_group',3,0,0),(4,1,2,5,'id_feature',4,0,0),(5,1,2,6,'id_feature',5,0,0),(6,1,2,7,'id_feature',6,0,0),(7,1,2,NULL,'quantity',7,0,0),(8,1,2,NULL,'manufacturer',8,0,0),(9,1,2,NULL,'condition',9,0,0),(10,1,2,NULL,'weight',10,0,0),(11,1,2,NULL,'price',11,0,0);
/*!40000 ALTER TABLE `tb_layered_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_filter`
--

DROP TABLE IF EXISTS `tb_layered_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_filter` (
  `id_layered_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `filters` text,
  `n_categories` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_layered_filter`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_filter`
--

LOCK TABLES `tb_layered_filter` WRITE;
/*!40000 ALTER TABLE `tb_layered_filter` DISABLE KEYS */;
INSERT INTO `tb_layered_filter` VALUES (1,'O meu modelo 2018-01-17','a:13:{s:10:\"categories\";a:1:{i:0;i:2;}s:9:\"shop_list\";a:1:{i:1;i:1;}s:31:\"layered_selection_subcategories\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_1\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:22:\"layered_selection_ag_3\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_5\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_6\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:24:\"layered_selection_feat_7\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:23:\"layered_selection_stock\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:30:\"layered_selection_manufacturer\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:27:\"layered_selection_condition\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:31:\"layered_selection_weight_slider\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}s:30:\"layered_selection_price_slider\";a:2:{s:11:\"filter_type\";i:0;s:17:\"filter_show_limit\";i:0;}}',9,'2018-01-17 10:46:16');
/*!40000 ALTER TABLE `tb_layered_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_filter_shop`
--

DROP TABLE IF EXISTS `tb_layered_filter_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_filter_shop` (
  `id_layered_filter` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_layered_filter`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_filter_shop`
--

LOCK TABLES `tb_layered_filter_shop` WRITE;
/*!40000 ALTER TABLE `tb_layered_filter_shop` DISABLE KEYS */;
INSERT INTO `tb_layered_filter_shop` VALUES (1,1);
/*!40000 ALTER TABLE `tb_layered_filter_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_indexable_attribute_group`
--

DROP TABLE IF EXISTS `tb_layered_indexable_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_indexable_attribute_group` (
  `id_attribute_group` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_attribute_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_indexable_attribute_group`
--

LOCK TABLES `tb_layered_indexable_attribute_group` WRITE;
/*!40000 ALTER TABLE `tb_layered_indexable_attribute_group` DISABLE KEYS */;
INSERT INTO `tb_layered_indexable_attribute_group` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `tb_layered_indexable_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_indexable_attribute_group_lang_value`
--

DROP TABLE IF EXISTS `tb_layered_indexable_attribute_group_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_indexable_attribute_group_lang_value` (
  `id_attribute_group` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_attribute_group`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_indexable_attribute_group_lang_value`
--

LOCK TABLES `tb_layered_indexable_attribute_group_lang_value` WRITE;
/*!40000 ALTER TABLE `tb_layered_indexable_attribute_group_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_layered_indexable_attribute_group_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_indexable_attribute_lang_value`
--

DROP TABLE IF EXISTS `tb_layered_indexable_attribute_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_indexable_attribute_lang_value` (
  `id_attribute` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_indexable_attribute_lang_value`
--

LOCK TABLES `tb_layered_indexable_attribute_lang_value` WRITE;
/*!40000 ALTER TABLE `tb_layered_indexable_attribute_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_layered_indexable_attribute_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_indexable_feature`
--

DROP TABLE IF EXISTS `tb_layered_indexable_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_indexable_feature` (
  `id_feature` int(11) NOT NULL,
  `indexable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_feature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_indexable_feature`
--

LOCK TABLES `tb_layered_indexable_feature` WRITE;
/*!40000 ALTER TABLE `tb_layered_indexable_feature` DISABLE KEYS */;
INSERT INTO `tb_layered_indexable_feature` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `tb_layered_indexable_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_indexable_feature_lang_value`
--

DROP TABLE IF EXISTS `tb_layered_indexable_feature_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_indexable_feature_lang_value` (
  `id_feature` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) NOT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_indexable_feature_lang_value`
--

LOCK TABLES `tb_layered_indexable_feature_lang_value` WRITE;
/*!40000 ALTER TABLE `tb_layered_indexable_feature_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_layered_indexable_feature_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_indexable_feature_value_lang_value`
--

DROP TABLE IF EXISTS `tb_layered_indexable_feature_value_lang_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_indexable_feature_value_lang_value` (
  `id_feature_value` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `url_name` varchar(128) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_feature_value`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_indexable_feature_value_lang_value`
--

LOCK TABLES `tb_layered_indexable_feature_value_lang_value` WRITE;
/*!40000 ALTER TABLE `tb_layered_indexable_feature_value_lang_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_layered_indexable_feature_value_lang_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_price_index`
--

DROP TABLE IF EXISTS `tb_layered_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_price_index` (
  `id_product` int(11) NOT NULL,
  `id_currency` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `price_min` int(11) NOT NULL,
  `price_max` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_currency`,`id_shop`),
  KEY `id_currency` (`id_currency`),
  KEY `price_min` (`price_min`),
  KEY `price_max` (`price_max`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_price_index`
--

LOCK TABLES `tb_layered_price_index` WRITE;
/*!40000 ALTER TABLE `tb_layered_price_index` DISABLE KEYS */;
INSERT INTO `tb_layered_price_index` VALUES (1,1,1,16,21),(2,1,1,26,34),(3,1,1,25,32),(4,1,1,50,64),(5,1,1,28,36),(6,1,1,30,38),(7,1,1,16,21),(8,1,1,400,400);
/*!40000 ALTER TABLE `tb_layered_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_layered_product_attribute`
--

DROP TABLE IF EXISTS `tb_layered_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_layered_product_attribute` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_attribute_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_attribute`,`id_product`,`id_shop`),
  UNIQUE KEY `id_attribute_group` (`id_attribute_group`,`id_attribute`,`id_product`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_layered_product_attribute`
--

LOCK TABLES `tb_layered_product_attribute` WRITE;
/*!40000 ALTER TABLE `tb_layered_product_attribute` DISABLE KEYS */;
INSERT INTO `tb_layered_product_attribute` VALUES (1,1,1,1),(1,2,1,1),(1,3,1,1),(1,4,1,1),(1,5,1,1),(1,6,1,1),(1,7,1,1),(2,1,1,1),(2,2,1,1),(2,3,1,1),(2,4,1,1),(2,5,1,1),(2,6,1,1),(2,7,1,1),(3,1,1,1),(3,2,1,1),(3,3,1,1),(3,4,1,1),(3,5,1,1),(3,6,1,1),(3,7,1,1),(7,4,3,1),(8,2,3,1),(8,6,3,1),(11,2,3,1),(11,5,3,1),(13,1,3,1),(13,3,3,1),(13,5,3,1),(14,1,3,1),(14,5,3,1),(15,7,3,1),(16,5,3,1),(16,6,3,1),(16,7,3,1),(24,4,3,1);
/*!40000 ALTER TABLE `tb_layered_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link_block`
--

DROP TABLE IF EXISTS `tb_link_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_link_block` (
  `id_link_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_hook` int(1) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id_link_block`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link_block`
--

LOCK TABLES `tb_link_block` WRITE;
/*!40000 ALTER TABLE `tb_link_block` DISABLE KEYS */;
INSERT INTO `tb_link_block` VALUES (1,35,1,'{\"cms\":[false],\"product\":[\"prices-drop\",\"new-products\",\"best-sales\"],\"static\":[false]}'),(2,35,2,'{\"cms\":[\"1\",\"2\",\"3\",\"4\",\"5\"],\"product\":[false],\"static\":[\"contact\",\"sitemap\",\"stores\"]}');
/*!40000 ALTER TABLE `tb_link_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link_block_lang`
--

DROP TABLE IF EXISTS `tb_link_block_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_link_block_lang` (
  `id_link_block` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `custom_content` text,
  PRIMARY KEY (`id_link_block`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link_block_lang`
--

LOCK TABLES `tb_link_block_lang` WRITE;
/*!40000 ALTER TABLE `tb_link_block_lang` DISABLE KEYS */;
INSERT INTO `tb_link_block_lang` VALUES (1,1,'Produtos',NULL),(1,2,'Products',NULL),(2,1,'A nossa empresa',NULL),(2,2,'Our company',NULL);
/*!40000 ALTER TABLE `tb_link_block_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link_block_shop`
--

DROP TABLE IF EXISTS `tb_link_block_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_link_block_shop` (
  `id_link_block` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_link_block`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link_block_shop`
--

LOCK TABLES `tb_link_block_shop` WRITE;
/*!40000 ALTER TABLE `tb_link_block_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_link_block_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_linksmenutop`
--

DROP TABLE IF EXISTS `tb_linksmenutop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_linksmenutop` (
  `id_linksmenutop` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `new_window` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_linksmenutop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_linksmenutop`
--

LOCK TABLES `tb_linksmenutop` WRITE;
/*!40000 ALTER TABLE `tb_linksmenutop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_linksmenutop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_linksmenutop_lang`
--

DROP TABLE IF EXISTS `tb_linksmenutop_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_linksmenutop_lang` (
  `id_linksmenutop` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `label` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  KEY `id_linksmenutop` (`id_linksmenutop`,`id_lang`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_linksmenutop_lang`
--

LOCK TABLES `tb_linksmenutop_lang` WRITE;
/*!40000 ALTER TABLE `tb_linksmenutop_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_linksmenutop_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_log` (
  `id_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `severity` tinyint(1) NOT NULL,
  `error_code` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `object_type` varchar(32) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_log`
--

LOCK TABLES `tb_log` WRITE;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` VALUES (1,1,0,'Back office connection from 127.0.0.1','',0,1,'2018-01-17 09:54:45','2018-01-17 09:54:45'),(2,1,0,'Product catalog filters stored.','',0,1,'2018-01-17 10:08:24','2018-01-17 10:08:24'),(3,1,0,'Products deleted: (7).','',0,1,'2018-01-17 10:08:45','2018-01-17 10:08:45'),(4,1,0,'Products deleted: (6).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(5,1,0,'Products deleted: (5).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(6,1,0,'Products deleted: (4).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(7,1,0,'Products deleted: (3).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(8,1,0,'Products deleted: (2).','',0,1,'2018-01-17 10:08:47','2018-01-17 10:08:47'),(9,1,0,'Products deleted: (1).','',0,1,'2018-01-17 10:08:47','2018-01-17 10:08:47'),(10,1,0,'EliminaÃ§Ã£o de Category','Category',10,1,'2018-01-17 10:15:09','2018-01-17 10:15:09'),(11,1,0,'EliminaÃ§Ã£o de Category','Category',11,1,'2018-01-17 10:15:18','2018-01-17 10:15:18'),(12,1,0,'EliminaÃ§Ã£o de Category','Category',9,1,'2018-01-17 10:15:29','2018-01-17 10:15:29'),(13,1,0,'EliminaÃ§Ã£o de Category','Category',8,1,'2018-01-17 10:15:38','2018-01-17 10:15:38'),(14,1,0,'EliminaÃ§Ã£o de Category','Category',7,1,'2018-01-17 10:15:45','2018-01-17 10:15:45'),(15,1,0,'EliminaÃ§Ã£o de Category','Category',6,1,'2018-01-17 10:15:53','2018-01-17 10:15:53'),(16,1,0,'EliminaÃ§Ã£o de Category','Category',5,1,'2018-01-17 10:15:59','2018-01-17 10:15:59'),(17,1,0,'EliminaÃ§Ã£o de Category','Category',4,1,'2018-01-17 10:16:20','2018-01-17 10:16:20'),(18,1,0,'EliminaÃ§Ã£o de Category','Category',3,1,'2018-01-17 10:16:28','2018-01-17 10:16:28'),(19,1,0,'AdiÃ§Ã£o de Category','Category',12,1,'2018-01-17 10:16:57','2018-01-17 10:16:57'),(20,1,0,'Product modification','Product',8,1,'2018-01-17 10:19:50','2018-01-17 10:19:50'),(21,1,0,'Product modification','Product',8,1,'2018-01-17 10:20:28','2018-01-17 10:20:28'),(22,1,0,'AdiÃ§Ã£o de Manufacturer','Manufacturer',2,1,'2018-01-17 10:22:34','2018-01-17 10:22:34'),(23,1,0,'EliminaÃ§Ã£o de Manufacturer','Manufacturer',1,1,'2018-01-17 10:22:42','2018-01-17 10:22:42'),(24,1,0,'Product modification','Product',8,1,'2018-01-17 10:23:01','2018-01-17 10:23:01'),(25,1,0,'Product modification','Product',8,1,'2018-01-17 10:23:49','2018-01-17 10:23:49'),(26,1,0,'Product modification','Product',8,1,'2018-01-17 10:23:51','2018-01-17 10:23:51'),(27,1,0,'Product modification','Product',8,1,'2018-01-17 10:49:28','2018-01-17 10:49:28'),(28,1,0,'Product modification','Product',8,1,'2018-01-17 10:52:13','2018-01-17 10:52:13'),(29,1,0,'Product modification','Product',8,1,'2018-01-17 10:53:26','2018-01-17 10:53:26'),(30,1,0,'EliminaÃ§Ã£o de Address','Address',3,1,'2018-01-17 11:01:18','2018-01-17 11:01:18'),(31,1,0,'EliminaÃ§Ã£o de Supplier','Supplier',1,1,'2018-01-17 11:01:26','2018-01-17 11:01:26'),(32,1,0,'Product modification','Product',8,1,'2018-01-17 11:02:07','2018-01-17 11:02:07'),(33,1,0,'Product modification','Product',8,1,'2018-01-17 11:03:21','2018-01-17 11:03:21');
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mail`
--

DROP TABLE IF EXISTS `tb_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mail` (
  `id_mail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` varchar(126) NOT NULL,
  `template` varchar(62) NOT NULL,
  `subject` varchar(254) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mail`),
  KEY `recipient` (`recipient`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mail`
--

LOCK TABLES `tb_mail` WRITE;
/*!40000 ALTER TABLE `tb_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_manufacturer`
--

DROP TABLE IF EXISTS `tb_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_manufacturer` (
  `id_manufacturer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_manufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_manufacturer`
--

LOCK TABLES `tb_manufacturer` WRITE;
/*!40000 ALTER TABLE `tb_manufacturer` DISABLE KEYS */;
INSERT INTO `tb_manufacturer` VALUES (2,'JBL','2018-01-17 10:22:34','2018-01-17 10:22:34',1);
/*!40000 ALTER TABLE `tb_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_manufacturer_lang`
--

DROP TABLE IF EXISTS `tb_manufacturer_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_manufacturer_lang` (
  `id_manufacturer` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `short_description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_manufacturer_lang`
--

LOCK TABLES `tb_manufacturer_lang` WRITE;
/*!40000 ALTER TABLE `tb_manufacturer_lang` DISABLE KEYS */;
INSERT INTO `tb_manufacturer_lang` VALUES (2,1,'','','','',''),(2,2,'','','','','');
/*!40000 ALTER TABLE `tb_manufacturer_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_manufacturer_shop`
--

DROP TABLE IF EXISTS `tb_manufacturer_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_manufacturer_shop` (
  `id_manufacturer` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_manufacturer`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_manufacturer_shop`
--

LOCK TABLES `tb_manufacturer_shop` WRITE;
/*!40000 ALTER TABLE `tb_manufacturer_shop` DISABLE KEYS */;
INSERT INTO `tb_manufacturer_shop` VALUES (2,1);
/*!40000 ALTER TABLE `tb_manufacturer_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_memcached_servers`
--

DROP TABLE IF EXISTS `tb_memcached_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_memcached_servers` (
  `id_memcached_server` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(254) NOT NULL,
  `port` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_memcached_server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_memcached_servers`
--

LOCK TABLES `tb_memcached_servers` WRITE;
/*!40000 ALTER TABLE `tb_memcached_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_memcached_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message`
--

DROP TABLE IF EXISTS `tb_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cart` int(10) unsigned DEFAULT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned DEFAULT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `message` text NOT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `message_order` (`id_order`),
  KEY `id_cart` (`id_cart`),
  KEY `id_customer` (`id_customer`),
  KEY `id_employee` (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message`
--

LOCK TABLES `tb_message` WRITE;
/*!40000 ALTER TABLE `tb_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message_readed`
--

DROP TABLE IF EXISTS `tb_message_readed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message_readed` (
  `id_message` int(10) unsigned NOT NULL,
  `id_employee` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_message`,`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message_readed`
--

LOCK TABLES `tb_message_readed` WRITE;
/*!40000 ALTER TABLE `tb_message_readed` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_message_readed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_meta`
--

DROP TABLE IF EXISTS `tb_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_meta` (
  `id_meta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page` varchar(64) NOT NULL,
  `configurable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_meta`),
  UNIQUE KEY `page` (`page`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_meta`
--

LOCK TABLES `tb_meta` WRITE;
/*!40000 ALTER TABLE `tb_meta` DISABLE KEYS */;
INSERT INTO `tb_meta` VALUES (1,'pagenotfound',1),(2,'best-sales',1),(3,'contact',1),(4,'index',1),(5,'manufacturer',1),(6,'new-products',1),(7,'password',1),(8,'prices-drop',1),(9,'sitemap',1),(10,'supplier',1),(11,'address',1),(12,'addresses',1),(13,'authentication',1),(14,'cart',1),(15,'discount',1),(16,'history',1),(17,'identity',1),(18,'my-account',1),(19,'order-follow',1),(20,'order-slip',1),(21,'order',1),(22,'search',1),(23,'stores',1),(24,'guest-tracking',1),(25,'order-confirmation',1),(26,'product',0),(27,'category',0),(28,'cms',0),(29,'module-cheque-payment',0),(30,'module-cheque-validation',0),(31,'module-bankwire-validation',0),(32,'module-bankwire-payment',0),(33,'module-cashondelivery-validation',0),(34,'module-ps_checkpayment-payment',1),(35,'module-ps_checkpayment-validation',1),(36,'module-ps_emailsubscription-verification',1),(37,'module-ps_shoppingcart-ajax',1),(38,'module-ps_wirepayment-payment',1),(39,'module-ps_wirepayment-validation',1),(40,'module-cronjobs-callback',1);
/*!40000 ALTER TABLE `tb_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_meta_lang`
--

DROP TABLE IF EXISTS `tb_meta_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_meta_lang` (
  `id_meta` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `url_rewrite` varchar(254) NOT NULL,
  PRIMARY KEY (`id_meta`,`id_shop`,`id_lang`),
  KEY `id_shop` (`id_shop`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_meta_lang`
--

LOCK TABLES `tb_meta_lang` WRITE;
/*!40000 ALTER TABLE `tb_meta_lang` DISABLE KEYS */;
INSERT INTO `tb_meta_lang` VALUES (1,1,1,'erro 404','Esta pÃ¡gina nÃ£o pode ser encontrada','','pÃ¡gina-nÃ£o-encontrada'),(1,1,2,'erro 404','Esta pÃ¡gina nÃ£o pode ser encontrada','','pÃ¡gina-nÃ£o-encontrada'),(2,1,1,'Top de Vendas','Os nossos produto mais vendidos','','top-vendas'),(2,1,2,'Top de Vendas','Os nossos produto mais vendidos','','top-vendas'),(3,1,1,'Contacte-nos','Use o nosso formulÃ¡rio para nos contactar','','contacte-nos'),(3,1,2,'Fale conosco','Use o nosso formulÃ¡rio para nos contactar','','contacte-nos'),(4,1,1,'','Loja powered by PrestaShop','',''),(4,1,2,'','Loja powered by PrestaShop','',''),(5,1,1,'Brands','Brands list','','brands'),(5,1,2,'Brands','Brands list','','brands'),(6,1,1,'Novos produtos','Nossos novos produtos','','novos-produtos'),(6,1,2,'Novidades','Nossos novos produtos','','novos-produtos'),(7,1,1,'Esqueci-me da palavra-passe','Indique o seu e-mail utilizado quando se registou para receber um e-mail com a nova palavra-passe','','recuperar-palavra-passe'),(7,1,2,'Esqueceu sua senha','Indique o seu e-mail utilizado quando se registou para receber um e-mail com a nova palavra-passe','','recuperar-palavra-passe'),(8,1,1,'PromoÃ§Ã£o','Produtos Ã  venda','','promocoes'),(8,1,2,'PromoÃ§Ã£o','Produtos Ã  venda','','promocoes'),(9,1,1,'Mapa do site','NÃ£o consegue encontrar o que procura?','','mapa do site'),(9,1,2,'Mapa do site','NÃ£o consegue encontrar o que procura?','','mapa do site'),(10,1,1,'Fornecedores','Lista de Fornecedores','','fornecedores'),(10,1,2,'Fornecedores','Lista de Fornecedores','','fornecedores'),(11,1,1,'EndereÃ§o','','','endereco'),(11,1,2,'EndereÃ§o','','','endereco'),(12,1,1,'EndereÃ§os','','','enderecos'),(12,1,2,'EndereÃ§os','','','enderecos'),(13,1,1,'AutenticaÃ§Ã£o','','','inicio-de-sessao'),(13,1,2,'Acesso','','','inicio-de-sessao'),(14,1,1,'Carrinho','','','carrinho'),(14,1,2,'Carrinho','','','carrinho'),(15,1,1,'Desconto','','','descontos'),(15,1,2,'Desconto','','','descontos'),(16,1,1,'HistÃ³rico de encomendas','','','historico-de-encomendas'),(16,1,2,'HistÃ³rico de pedidos','','','historico-de-encomendas'),(17,1,1,'Identidade','','','identidade'),(17,1,2,'Identidade','','','identidade'),(18,1,1,'A minha conta','','','a-minha-conta'),(18,1,2,'Minha Conta','','','a-minha-conta'),(19,1,1,'Acompanhar Encomenda','','','acompanhar-encomenda'),(19,1,2,'Acompanhar Encomenda','','','acompanhar-encomenda'),(20,1,1,'Nota de crÃ©dito','','','nota-de-encomenda'),(20,1,2,'CrÃ©dito','','','nota-de-encomenda'),(21,1,1,'Encomenda','','','encomenda'),(21,1,2,'Compra','','','compra'),(22,1,1,'Pesquisar','','','pesquisa'),(22,1,2,'Busca','','','pesquisa'),(23,1,1,'Lojas','','','lojas'),(23,1,2,'Lojas','','','lojas'),(24,1,1,'Seguimento de Visitante','','','seguimento-de-visitante'),(24,1,2,'Seguimento de Visitante','','','seguimento-de-visitante'),(25,1,1,'ConfirmaÃ§Ã£o de encomenda','','','confirmacao-encomenda'),(25,1,2,'ConfirmaÃ§Ã£o do pedido','','','confirmacao-encomenda'),(34,1,1,'','','',''),(34,1,2,'','','',''),(35,1,1,'','','',''),(35,1,2,'','','',''),(36,1,1,'','','',''),(36,1,2,'','','',''),(37,1,1,'','','',''),(37,1,2,'','','',''),(38,1,1,'','','',''),(38,1,2,'','','',''),(39,1,1,'','','',''),(39,1,2,'','','',''),(40,1,1,'','','',''),(40,1,2,'','','','');
/*!40000 ALTER TABLE `tb_meta_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module`
--

DROP TABLE IF EXISTS `tb_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module` (
  `id_module` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(8) NOT NULL,
  PRIMARY KEY (`id_module`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module`
--

LOCK TABLES `tb_module` WRITE;
/*!40000 ALTER TABLE `tb_module` DISABLE KEYS */;
INSERT INTO `tb_module` VALUES (1,'dashactivity',1,'2.0.1'),(2,'dashtrends',1,'2.0.2'),(3,'dashgoals',1,'2.0.1'),(4,'dashproducts',1,'2.0.2'),(5,'graphnvd3',1,'2.0.0'),(6,'gridhtml',1,'2.0.0'),(7,'ps_banner',1,'2.0.2'),(8,'ps_categorytree',1,'2.0.0'),(9,'ps_checkpayment',1,'2.0.3'),(10,'ps_contactinfo',1,'3.0.0'),(11,'ps_currencyselector',1,'2.0.0'),(12,'ps_customeraccountlinks',1,'3.0.0'),(13,'ps_customersignin',1,'2.0.1'),(14,'ps_customtext',1,'2.0.0'),(15,'ps_emailsubscription',1,'2.0.0'),(16,'ps_facetedsearch',1,'2.0.0'),(17,'ps_featuredproducts',1,'2.0.0'),(18,'ps_imageslider',1,'2.0.1'),(19,'ps_languageselector',1,'2.0.2'),(20,'ps_linklist',1,'2.1.4'),(21,'ps_mainmenu',1,'2.0.2'),(22,'ps_searchbar',1,'2.0.1'),(23,'ps_sharebuttons',1,'2.0.1'),(24,'ps_shoppingcart',1,'2.0.1'),(25,'ps_socialfollow',1,'2.0.0'),(26,'ps_wirepayment',1,'2.0.4'),(27,'pagesnotfound',1,'2.0.0'),(28,'sekeywords',1,'2.0.0'),(29,'statsbestcategories',1,'2.0.0'),(30,'statsbestcustomers',1,'2.0.1'),(31,'statsbestproducts',1,'2.0.0'),(32,'statsbestsuppliers',1,'2.0.0'),(33,'statsbestvouchers',1,'2.0.0'),(34,'statscarrier',1,'2.0.0'),(35,'statscatalog',1,'2.0.1'),(36,'statscheckup',1,'2.0.0'),(37,'statsdata',1,'2.0.0'),(38,'statsequipment',1,'2.0.0'),(39,'statsforecast',1,'2.0.1'),(40,'statslive',1,'2.0.2'),(41,'statsnewsletter',1,'2.0.1'),(42,'statsorigin',1,'2.0.1'),(43,'statspersonalinfos',1,'2.0.1'),(44,'statsproduct',1,'2.0.1'),(45,'statsregistrations',1,'2.0.0'),(46,'statssales',1,'2.0.0'),(47,'statssearch',1,'2.0.0'),(48,'statsstock',1,'2.0.0'),(49,'statsvisits',1,'2.0.1'),(50,'welcome',1,'3.0.0'),(51,'gamification',1,'1.13.0'),(52,'cronjobs',1,'1.4.0'),(53,'psaddonsconnect',1,'1.0.0'),(54,'blockreassurance',1,'3.0.1');
/*!40000 ALTER TABLE `tb_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_access`
--

DROP TABLE IF EXISTS `tb_module_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_access` (
  `id_profile` int(10) unsigned NOT NULL,
  `id_authorization_role` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_profile`,`id_authorization_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_access`
--

LOCK TABLES `tb_module_access` WRITE;
/*!40000 ALTER TABLE `tb_module_access` DISABLE KEYS */;
INSERT INTO `tb_module_access` VALUES (1,453),(1,454),(1,455),(1,456),(1,457),(1,458),(1,459),(1,460),(1,465),(1,466),(1,467),(1,468),(1,469),(1,470),(1,471),(1,472),(1,473),(1,474),(1,475),(1,476),(1,477),(1,478),(1,479),(1,480),(1,481),(1,482),(1,483),(1,484),(1,485),(1,486),(1,487),(1,488),(1,489),(1,490),(1,491),(1,492),(1,493),(1,494),(1,495),(1,496),(1,497),(1,498),(1,499),(1,500),(1,501),(1,502),(1,503),(1,504),(1,505),(1,506),(1,507),(1,508),(1,509),(1,510),(1,511),(1,512),(1,513),(1,514),(1,515),(1,516),(1,517),(1,518),(1,519),(1,520),(1,521),(1,522),(1,523),(1,524),(1,525),(1,526),(1,527),(1,528),(1,529),(1,530),(1,531),(1,532),(1,533),(1,534),(1,535),(1,536),(1,541),(1,542),(1,543),(1,544),(1,545),(1,546),(1,547),(1,548),(1,549),(1,550),(1,551),(1,552),(1,553),(1,554),(1,555),(1,556),(1,557),(1,558),(1,559),(1,560),(1,561),(1,562),(1,563),(1,564),(1,565),(1,566),(1,567),(1,568),(1,569),(1,570),(1,571),(1,572),(1,573),(1,574),(1,575),(1,576),(1,577),(1,578),(1,579),(1,580),(1,581),(1,582),(1,583),(1,584),(1,585),(1,586),(1,587),(1,588),(1,589),(1,590),(1,591),(1,592),(1,593),(1,594),(1,595),(1,596),(1,597),(1,598),(1,599),(1,600),(1,601),(1,602),(1,603),(1,604),(1,605),(1,606),(1,607),(1,608),(1,609),(1,610),(1,611),(1,612),(1,613),(1,614),(1,615),(1,616),(1,617),(1,618),(1,619),(1,620),(1,621),(1,622),(1,623),(1,624),(1,625),(1,626),(1,627),(1,628),(1,629),(1,630),(1,631),(1,632),(1,633),(1,634),(1,635),(1,636),(1,637),(1,638),(1,639),(1,640),(1,641),(1,642),(1,643),(1,644),(1,645),(1,646),(1,647),(1,648),(1,649),(1,650),(1,651),(1,652),(1,653),(1,654),(1,655),(1,656),(1,657),(1,658),(1,659),(1,660),(1,669),(1,670),(1,671),(1,672),(1,673),(1,674),(1,675),(1,676),(1,681),(1,682),(1,683),(1,684),(1,685),(1,686),(1,687),(1,688);
/*!40000 ALTER TABLE `tb_module_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_carrier`
--

DROP TABLE IF EXISTS `tb_module_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_carrier` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_reference` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_carrier`
--

LOCK TABLES `tb_module_carrier` WRITE;
/*!40000 ALTER TABLE `tb_module_carrier` DISABLE KEYS */;
INSERT INTO `tb_module_carrier` VALUES (9,1,1),(9,1,2),(26,1,1),(26,1,2);
/*!40000 ALTER TABLE `tb_module_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_country`
--

DROP TABLE IF EXISTS `tb_module_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_country` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_country` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_country`
--

LOCK TABLES `tb_module_country` WRITE;
/*!40000 ALTER TABLE `tb_module_country` DISABLE KEYS */;
INSERT INTO `tb_module_country` VALUES (9,1,58),(26,1,58);
/*!40000 ALTER TABLE `tb_module_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_currency`
--

DROP TABLE IF EXISTS `tb_module_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_currency` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_currency` int(11) NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_currency`),
  KEY `id_module` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_currency`
--

LOCK TABLES `tb_module_currency` WRITE;
/*!40000 ALTER TABLE `tb_module_currency` DISABLE KEYS */;
INSERT INTO `tb_module_currency` VALUES (9,1,1),(26,1,1);
/*!40000 ALTER TABLE `tb_module_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_group`
--

DROP TABLE IF EXISTS `tb_module_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_group` (
  `id_module` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_group` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_module`,`id_shop`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_group`
--

LOCK TABLES `tb_module_group` WRITE;
/*!40000 ALTER TABLE `tb_module_group` DISABLE KEYS */;
INSERT INTO `tb_module_group` VALUES (1,1,1),(1,1,2),(1,1,3),(2,1,1),(2,1,2),(2,1,3),(3,1,1),(3,1,2),(3,1,3),(4,1,1),(4,1,2),(4,1,3),(5,1,1),(5,1,2),(5,1,3),(6,1,1),(6,1,2),(6,1,3),(7,1,1),(7,1,2),(7,1,3),(8,1,1),(8,1,2),(8,1,3),(9,1,1),(9,1,2),(9,1,3),(10,1,1),(10,1,2),(10,1,3),(11,1,1),(11,1,2),(11,1,3),(12,1,1),(12,1,2),(12,1,3),(13,1,1),(13,1,2),(13,1,3),(14,1,1),(14,1,2),(14,1,3),(15,1,1),(15,1,2),(15,1,3),(16,1,1),(16,1,2),(16,1,3),(17,1,1),(17,1,2),(17,1,3),(18,1,1),(18,1,2),(18,1,3),(19,1,1),(19,1,2),(19,1,3),(20,1,1),(20,1,2),(20,1,3),(21,1,1),(21,1,2),(21,1,3),(22,1,1),(22,1,2),(22,1,3),(23,1,1),(23,1,2),(23,1,3),(24,1,1),(24,1,2),(24,1,3),(25,1,1),(25,1,2),(25,1,3),(26,1,1),(26,1,2),(26,1,3),(27,1,1),(27,1,2),(27,1,3),(28,1,1),(28,1,2),(28,1,3),(29,1,1),(29,1,2),(29,1,3),(30,1,1),(30,1,2),(30,1,3),(31,1,1),(31,1,2),(31,1,3),(32,1,1),(32,1,2),(32,1,3),(33,1,1),(33,1,2),(33,1,3),(34,1,1),(34,1,2),(34,1,3),(35,1,1),(35,1,2),(35,1,3),(36,1,1),(36,1,2),(36,1,3),(37,1,1),(37,1,2),(37,1,3),(38,1,1),(38,1,2),(38,1,3),(39,1,1),(39,1,2),(39,1,3),(40,1,1),(40,1,2),(40,1,3),(41,1,1),(41,1,2),(41,1,3),(42,1,1),(42,1,2),(42,1,3),(43,1,1),(43,1,2),(43,1,3),(44,1,1),(44,1,2),(44,1,3),(45,1,1),(45,1,2),(45,1,3),(46,1,1),(46,1,2),(46,1,3),(47,1,1),(47,1,2),(47,1,3),(48,1,1),(48,1,2),(48,1,3),(49,1,1),(49,1,2),(49,1,3),(50,1,1),(50,1,2),(50,1,3),(51,1,1),(51,1,2),(51,1,3),(52,1,1),(52,1,2),(52,1,3),(53,1,1),(53,1,2),(53,1,3),(54,1,1),(54,1,2),(54,1,3);
/*!40000 ALTER TABLE `tb_module_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_history`
--

DROP TABLE IF EXISTS `tb_module_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_history`
--

LOCK TABLES `tb_module_history` WRITE;
/*!40000 ALTER TABLE `tb_module_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_module_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_preference`
--

DROP TABLE IF EXISTS `tb_module_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_preference` (
  `id_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `interest` tinyint(1) DEFAULT NULL,
  `favorite` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_preference`
--

LOCK TABLES `tb_module_preference` WRITE;
/*!40000 ALTER TABLE `tb_module_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_module_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_module_shop`
--

DROP TABLE IF EXISTS `tb_module_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_module_shop` (
  `id_module` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `enable_device` tinyint(1) NOT NULL DEFAULT '7',
  PRIMARY KEY (`id_module`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_module_shop`
--

LOCK TABLES `tb_module_shop` WRITE;
/*!40000 ALTER TABLE `tb_module_shop` DISABLE KEYS */;
INSERT INTO `tb_module_shop` VALUES (1,1,7),(2,1,7),(3,1,7),(4,1,7),(5,1,7),(6,1,7),(7,1,3),(8,1,7),(9,1,7),(10,1,7),(11,1,7),(12,1,7),(13,1,7),(14,1,7),(15,1,7),(16,1,7),(17,1,7),(18,1,3),(19,1,7),(20,1,7),(21,1,7),(22,1,7),(23,1,7),(24,1,7),(25,1,7),(26,1,7),(27,1,7),(28,1,7),(29,1,7),(30,1,7),(31,1,7),(32,1,7),(33,1,7),(34,1,7),(35,1,7),(36,1,7),(37,1,7),(38,1,7),(39,1,7),(40,1,7),(41,1,7),(42,1,7),(43,1,7),(44,1,7),(45,1,7),(46,1,7),(47,1,7),(48,1,7),(49,1,7),(50,1,7),(51,1,7),(52,1,7),(53,1,7),(54,1,7);
/*!40000 ALTER TABLE `tb_module_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_operating_system`
--

DROP TABLE IF EXISTS `tb_operating_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_operating_system` (
  `id_operating_system` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_operating_system`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_operating_system`
--

LOCK TABLES `tb_operating_system` WRITE;
/*!40000 ALTER TABLE `tb_operating_system` DISABLE KEYS */;
INSERT INTO `tb_operating_system` VALUES (1,'Windows XP'),(2,'Windows Vista'),(3,'Windows 7'),(4,'Windows 8'),(5,'Windows 8.1'),(6,'Windows 10'),(7,'MacOsX'),(8,'Linux'),(9,'Android');
/*!40000 ALTER TABLE `tb_operating_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_carrier`
--

DROP TABLE IF EXISTS `tb_order_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_carrier` (
  `id_order_carrier` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) unsigned NOT NULL,
  `id_carrier` int(11) unsigned NOT NULL,
  `id_order_invoice` int(11) unsigned DEFAULT NULL,
  `weight` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_excl` decimal(20,6) DEFAULT NULL,
  `shipping_cost_tax_incl` decimal(20,6) DEFAULT NULL,
  `tracking_number` varchar(64) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_carrier`),
  KEY `id_order` (`id_order`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_order_invoice` (`id_order_invoice`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_carrier`
--

LOCK TABLES `tb_order_carrier` WRITE;
/*!40000 ALTER TABLE `tb_order_carrier` DISABLE KEYS */;
INSERT INTO `tb_order_carrier` VALUES (1,1,2,0,0.000000,2.000000,2.000000,'','2018-01-17 09:46:04'),(2,2,2,0,0.000000,2.000000,2.000000,'','2018-01-17 09:46:04'),(3,3,2,0,0.000000,2.000000,2.000000,'','2018-01-17 09:46:04'),(4,4,2,0,0.000000,2.000000,2.000000,'','2018-01-17 09:46:04'),(5,5,2,0,0.000000,2.000000,2.000000,'','2018-01-17 09:46:04');
/*!40000 ALTER TABLE `tb_order_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_cart_rule`
--

DROP TABLE IF EXISTS `tb_order_cart_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_cart_rule` (
  `id_order_cart_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_cart_rule` int(10) unsigned NOT NULL,
  `id_order_invoice` int(10) unsigned DEFAULT '0',
  `name` varchar(254) NOT NULL,
  `value` decimal(17,2) NOT NULL DEFAULT '0.00',
  `value_tax_excl` decimal(17,2) NOT NULL DEFAULT '0.00',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_cart_rule`),
  KEY `id_order` (`id_order`),
  KEY `id_cart_rule` (`id_cart_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_cart_rule`
--

LOCK TABLES `tb_order_cart_rule` WRITE;
/*!40000 ALTER TABLE `tb_order_cart_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_cart_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_detail`
--

DROP TABLE IF EXISTS `tb_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_detail` (
  `id_order_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_invoice` int(11) DEFAULT NULL,
  `id_warehouse` int(10) unsigned DEFAULT '0',
  `id_shop` int(11) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_attribute_id` int(10) unsigned DEFAULT NULL,
  `id_customization` int(10) unsigned DEFAULT '0',
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_in_stock` int(10) NOT NULL DEFAULT '0',
  `product_quantity_refunded` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_return` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity_reinjected` int(10) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reduction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_amount_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `reduction_amount_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `group_reduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_quantity_discount` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `product_ean13` varchar(13) DEFAULT NULL,
  `product_isbn` varchar(32) DEFAULT NULL,
  `product_upc` varchar(12) DEFAULT NULL,
  `product_reference` varchar(32) DEFAULT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_weight` decimal(20,6) NOT NULL,
  `id_tax_rules_group` int(11) unsigned DEFAULT '0',
  `tax_computation_method` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tax_name` varchar(16) NOT NULL,
  `tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ecotax` decimal(21,6) NOT NULL DEFAULT '0.000000',
  `ecotax_tax_rate` decimal(5,3) NOT NULL DEFAULT '0.000',
  `discount_quantity_applied` tinyint(1) NOT NULL DEFAULT '0',
  `download_hash` varchar(255) DEFAULT NULL,
  `download_nb` int(10) unsigned DEFAULT '0',
  `download_deadline` datetime DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_price_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_price_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `purchase_supplier_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `original_product_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `original_wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  PRIMARY KEY (`id_order_detail`),
  KEY `order_detail_order` (`id_order`),
  KEY `product_id` (`product_id`),
  KEY `product_attribute_id` (`product_attribute_id`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_order_id_order_detail` (`id_order`,`id_order_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_detail`
--

LOCK TABLES `tb_order_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_detail` DISABLE KEYS */;
INSERT INTO `tb_order_detail` VALUES (1,1,0,0,1,2,10,0,'Blouse - Color : White, Size : M',1,1,0,0,0,26.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_2','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',27.000000,27.000000,27.000000,27.000000,0.000000,0.000000,0.000000,26.999852,8.100000),(2,1,0,0,1,3,13,0,'Printed Dress - Color : Orange, Size : S',1,1,0,0,0,25.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_3','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',26.000000,26.000000,26.000000,26.000000,0.000000,0.000000,0.000000,25.999852,7.800000),(3,2,0,0,1,2,10,0,'Blouse - Color : White, Size : M',1,1,0,0,0,26.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_2','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',27.000000,27.000000,27.000000,27.000000,0.000000,0.000000,0.000000,26.999852,8.100000),(4,2,0,0,1,6,32,0,'Printed Summer Dress - Color : Yellow, Size : M',1,1,0,0,0,30.502569,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_6','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',30.500000,30.500000,30.500000,30.500000,0.000000,0.000000,0.000000,30.502569,9.150000),(5,2,0,0,1,7,34,0,'Printed Chiffon Dress - Color : Yellow, Size : S',1,1,0,0,0,20.501236,20.00,0.000000,0.000000,0.000000,0.00,17.400000,'','','','demo_7','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',16.400000,16.400000,16.400000,16.400000,0.000000,0.000000,0.000000,20.501236,6.150000),(6,3,0,0,1,1,1,0,'Faded Short Sleeve T-shirts - Color : Orange, Size : S',1,1,0,0,0,16.510000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_1','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',16.510000,16.510000,16.510000,16.510000,0.000000,0.000000,0.000000,16.510000,4.950000),(7,3,0,0,1,2,10,0,'Blouse - Color : White, Size : M',1,1,0,0,0,26.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_2','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',27.000000,27.000000,27.000000,27.000000,0.000000,0.000000,0.000000,26.999852,8.100000),(8,3,0,0,1,6,32,0,'Printed Summer Dress - Color : Yellow, Size : M',1,1,0,0,0,30.502569,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_6','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',30.500000,30.500000,30.500000,30.500000,0.000000,0.000000,0.000000,30.502569,9.150000),(9,4,0,0,1,1,1,0,'Faded Short Sleeve T-shirts - Color : Orange, Size : S',1,1,0,0,0,16.510000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_1','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',16.510000,16.510000,16.510000,16.510000,0.000000,0.000000,0.000000,16.510000,4.950000),(10,4,0,0,1,3,13,0,'Printed Dress - Color : Orange, Size : S',1,1,0,0,0,25.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_3','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',26.000000,26.000000,26.000000,26.000000,0.000000,0.000000,0.000000,25.999852,7.800000),(11,4,0,0,1,5,19,0,'Printed Summer Dress - Color : Yellow, Size : S',1,1,0,0,0,30.506321,5.00,0.000000,0.000000,0.000000,0.00,29.980000,'','','','demo_5','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',28.980000,28.980000,28.980000,28.980000,0.000000,0.000000,0.000000,30.506321,9.150000),(12,4,0,0,1,7,34,0,'Printed Chiffon Dress - Color : Yellow, Size : S',1,1,0,0,0,20.501236,20.00,0.000000,0.000000,0.000000,0.00,17.400000,'','','','demo_7','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',16.400000,16.400000,16.400000,16.400000,0.000000,0.000000,0.000000,20.501236,6.150000),(13,5,0,0,1,1,1,0,'Faded Short Sleeve T-shirts - Color : Orange, Size : S',1,1,0,0,0,16.510000,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_1','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',16.510000,16.510000,16.510000,16.510000,0.000000,0.000000,0.000000,16.510000,4.950000),(14,5,0,0,1,2,7,0,'Blouse - Color : Black, Size : S',1,1,0,0,0,26.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_2','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',27.000000,27.000000,27.000000,27.000000,0.000000,0.000000,0.000000,26.999852,8.100000),(15,5,0,0,1,3,13,0,'Printed Dress - Color : Orange, Size : S',1,1,0,0,0,25.999852,0.00,0.000000,0.000000,0.000000,0.00,0.000000,'','','','demo_3','',0.000000,0,0,'',0.000,0.000000,0.000,0,'',0,'0000-00-00 00:00:00',26.000000,26.000000,26.000000,26.000000,0.000000,0.000000,0.000000,25.999852,7.800000);
/*!40000 ALTER TABLE `tb_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_detail_tax`
--

DROP TABLE IF EXISTS `tb_order_detail_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_detail_tax` (
  `id_order_detail` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `total_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  KEY `id_order_detail` (`id_order_detail`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_detail_tax`
--

LOCK TABLES `tb_order_detail_tax` WRITE;
/*!40000 ALTER TABLE `tb_order_detail_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_detail_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_history`
--

DROP TABLE IF EXISTS `tb_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_history` (
  `id_order_history` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_employee` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `id_order_state` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_history`),
  KEY `order_history_order` (`id_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_order_state` (`id_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_history`
--

LOCK TABLES `tb_order_history` WRITE;
/*!40000 ALTER TABLE `tb_order_history` DISABLE KEYS */;
INSERT INTO `tb_order_history` VALUES (1,0,1,1,'2018-01-17 09:46:03'),(2,0,2,1,'2018-01-17 09:46:03'),(3,0,3,1,'2018-01-17 09:46:03'),(4,0,4,1,'2018-01-17 09:46:03'),(5,0,5,10,'2018-01-17 09:46:03'),(6,1,1,6,'2018-01-17 09:46:03'),(7,1,3,8,'2018-01-17 09:46:03');
/*!40000 ALTER TABLE `tb_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_invoice`
--

DROP TABLE IF EXISTS `tb_order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_invoice` (
  `id_order_invoice` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `delivery_number` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `total_discount_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_discount_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_products` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `shipping_tax_computation_method` int(10) unsigned NOT NULL,
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `shop_address` text,
  `note` text,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_invoice`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_invoice`
--

LOCK TABLES `tb_order_invoice` WRITE;
/*!40000 ALTER TABLE `tb_order_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_invoice_payment`
--

DROP TABLE IF EXISTS `tb_order_invoice_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_invoice_payment` (
  `id_order_invoice` int(11) unsigned NOT NULL,
  `id_order_payment` int(11) unsigned NOT NULL,
  `id_order` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_order_invoice`,`id_order_payment`),
  KEY `order_payment` (`id_order_payment`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_invoice_payment`
--

LOCK TABLES `tb_order_invoice_payment` WRITE;
/*!40000 ALTER TABLE `tb_order_invoice_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_invoice_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_invoice_tax`
--

DROP TABLE IF EXISTS `tb_order_invoice_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_invoice_tax` (
  `id_order_invoice` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `amount` decimal(10,6) NOT NULL DEFAULT '0.000000',
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_invoice_tax`
--

LOCK TABLES `tb_order_invoice_tax` WRITE;
/*!40000 ALTER TABLE `tb_order_invoice_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_invoice_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_message`
--

DROP TABLE IF EXISTS `tb_order_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_message` (
  `id_order_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_message`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_message`
--

LOCK TABLES `tb_order_message` WRITE;
/*!40000 ALTER TABLE `tb_order_message` DISABLE KEYS */;
INSERT INTO `tb_order_message` VALUES (1,'2018-01-17 09:46:04');
/*!40000 ALTER TABLE `tb_order_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_message_lang`
--

DROP TABLE IF EXISTS `tb_order_message_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_message_lang` (
  `id_order_message` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id_order_message`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_message_lang`
--

LOCK TABLES `tb_order_message_lang` WRITE;
/*!40000 ALTER TABLE `tb_order_message_lang` DISABLE KEYS */;
INSERT INTO `tb_order_message_lang` VALUES (1,1,'Tempo de entrega esperado','OlÃ¡,\n\nInfelizmente, um item da sua encomenda encontra-se atualmente esgotado. Isto poderÃ¡ causar um ligeiro atraso na sua entrega. Queira por isso aceitar as nossas desculpas e asseguramos-lhe que estamos a fazer os possÃ­veis para retificar esta situaÃ§Ã£o.'),(1,2,'Atraso','OlÃ¡,\n\nInfelizmente, um item da sua encomenda encontra-se atualmente esgotado. Isto poderÃ¡ causar um ligeiro atraso na sua entrega. Queira por isso aceitar as nossas desculpas e asseguramos-lhe que estamos a fazer os possÃ­veis para retificar esta situaÃ§Ã£o.');
/*!40000 ALTER TABLE `tb_order_message_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_payment`
--

DROP TABLE IF EXISTS `tb_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_payment` (
  `id_order_payment` int(11) NOT NULL AUTO_INCREMENT,
  `order_reference` varchar(9) DEFAULT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `transaction_id` varchar(254) DEFAULT NULL,
  `card_number` varchar(254) DEFAULT NULL,
  `card_brand` varchar(254) DEFAULT NULL,
  `card_expiration` char(7) DEFAULT NULL,
  `card_holder` varchar(254) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_order_payment`),
  KEY `order_reference` (`order_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_payment`
--

LOCK TABLES `tb_order_payment` WRITE;
/*!40000 ALTER TABLE `tb_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_return`
--

DROP TABLE IF EXISTS `tb_order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_return` (
  `id_order_return` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `question` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_return`),
  KEY `order_return_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_return`
--

LOCK TABLES `tb_order_return` WRITE;
/*!40000 ALTER TABLE `tb_order_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_return_detail`
--

DROP TABLE IF EXISTS `tb_order_return_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_return_detail` (
  `id_order_return` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `id_customization` int(10) unsigned NOT NULL DEFAULT '0',
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_return`,`id_order_detail`,`id_customization`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_return_detail`
--

LOCK TABLES `tb_order_return_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_return_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_return_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_return_state`
--

DROP TABLE IF EXISTS `tb_order_return_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_return_state` (
  `id_order_return_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_order_return_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_return_state`
--

LOCK TABLES `tb_order_return_state` WRITE;
/*!40000 ALTER TABLE `tb_order_return_state` DISABLE KEYS */;
INSERT INTO `tb_order_return_state` VALUES (1,'#4169E1'),(2,'#8A2BE2'),(3,'#32CD32'),(4,'#DC143C'),(5,'#108510');
/*!40000 ALTER TABLE `tb_order_return_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_return_state_lang`
--

DROP TABLE IF EXISTS `tb_order_return_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_return_state_lang` (
  `id_order_return_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_return_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_return_state_lang`
--

LOCK TABLES `tb_order_return_state_lang` WRITE;
/*!40000 ALTER TABLE `tb_order_return_state_lang` DISABLE KEYS */;
INSERT INTO `tb_order_return_state_lang` VALUES (1,1,'A aguardar confirmaÃ§Ã£o'),(1,2,'A aguardar confirmaÃ§Ã£o'),(2,1,'A aguardar a mercadoria'),(2,2,'A aguardar a mercadoria'),(3,1,'Mercadoria recebida'),(3,2,'Mercadoria recebida'),(4,1,'DevoluÃ§Ã£o negada'),(4,2,'DevoluÃ§Ã£o negada'),(5,1,'DevoluÃ§Ã£o completa'),(5,2,'DevoluÃ§Ã£o completa');
/*!40000 ALTER TABLE `tb_order_return_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_slip`
--

DROP TABLE IF EXISTS `tb_order_slip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_slip` (
  `id_order_slip` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `id_customer` int(10) unsigned NOT NULL,
  `id_order` int(10) unsigned NOT NULL,
  `total_products_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_products_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_shipping_tax_incl` decimal(20,6) DEFAULT NULL,
  `shipping_cost` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `shipping_cost_amount` decimal(10,2) NOT NULL,
  `partial` tinyint(1) NOT NULL,
  `order_slip_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order_slip`),
  KEY `order_slip_customer` (`id_customer`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_slip`
--

LOCK TABLES `tb_order_slip` WRITE;
/*!40000 ALTER TABLE `tb_order_slip` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_slip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_slip_detail`
--

DROP TABLE IF EXISTS `tb_order_slip_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_slip_detail` (
  `id_order_slip` int(10) unsigned NOT NULL,
  `id_order_detail` int(10) unsigned NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `unit_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `unit_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_excl` decimal(20,6) DEFAULT NULL,
  `total_price_tax_incl` decimal(20,6) DEFAULT NULL,
  `amount_tax_excl` decimal(20,6) DEFAULT NULL,
  `amount_tax_incl` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id_order_slip`,`id_order_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_slip_detail`
--

LOCK TABLES `tb_order_slip_detail` WRITE;
/*!40000 ALTER TABLE `tb_order_slip_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_slip_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_slip_detail_tax`
--

DROP TABLE IF EXISTS `tb_order_slip_detail_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_slip_detail_tax` (
  `id_order_slip_detail` int(11) unsigned NOT NULL,
  `id_tax` int(11) unsigned NOT NULL,
  `unit_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  `total_amount` decimal(16,6) NOT NULL DEFAULT '0.000000',
  KEY `id_order_slip_detail` (`id_order_slip_detail`),
  KEY `id_tax` (`id_tax`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_slip_detail_tax`
--

LOCK TABLES `tb_order_slip_detail_tax` WRITE;
/*!40000 ALTER TABLE `tb_order_slip_detail_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_slip_detail_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_state`
--

DROP TABLE IF EXISTS `tb_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_state` (
  `id_order_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` tinyint(1) unsigned DEFAULT '0',
  `send_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) DEFAULT NULL,
  `color` varchar(32) DEFAULT NULL,
  `unremovable` tinyint(1) unsigned NOT NULL,
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logable` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pdf_invoice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pdf_delivery` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_order_state`),
  KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_state`
--

LOCK TABLES `tb_order_state` WRITE;
/*!40000 ALTER TABLE `tb_order_state` DISABLE KEYS */;
INSERT INTO `tb_order_state` VALUES (1,0,1,'ps_checkpayment','#4169E1',1,0,0,0,0,0,0,0,0),(2,1,1,'','#32CD32',1,0,1,0,0,1,1,0,0),(3,1,1,'','#FF8C00',1,0,1,1,0,1,0,0,0),(4,1,1,'','#8A2BE2',1,0,1,1,1,1,0,0,0),(5,1,0,'','#108510',1,0,1,1,1,1,0,0,0),(6,0,1,'','#DC143C',1,0,0,0,0,0,0,0,0),(7,1,1,'','#ec2e15',1,0,0,0,0,0,0,0,0),(8,0,1,'','#8f0621',1,0,0,0,0,0,0,0,0),(9,1,1,'','#FF69B4',1,0,0,0,0,1,0,0,0),(10,0,1,'ps_wirepayment','#4169E1',1,0,0,0,0,0,0,0,0),(11,1,1,'','#32CD32',1,0,1,0,0,1,0,0,0),(12,0,1,'','#FF69B4',1,0,0,0,0,0,0,0,0),(13,0,0,'ps_cashondelivery','#4169E1',1,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tb_order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_state_lang`
--

DROP TABLE IF EXISTS `tb_order_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_order_state_lang` (
  `id_order_state` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `template` varchar(64) NOT NULL,
  PRIMARY KEY (`id_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_state_lang`
--

LOCK TABLES `tb_order_state_lang` WRITE;
/*!40000 ALTER TABLE `tb_order_state_lang` DISABLE KEYS */;
INSERT INTO `tb_order_state_lang` VALUES (1,1,'A aguardar pagamento por cheque','cheque'),(1,2,'Aguardando confirmaÃ§Ã£o de pagamento','cheque'),(2,1,'Pagamento aceite','payment'),(2,2,'Pagamento aceite','payment'),(3,1,'PreparaÃ§Ã£o em curso','preparation'),(3,2,'PreparaÃ§Ã£o em curso','preparation'),(4,1,'Enviado','shipped'),(4,2,'Enviado','shipped'),(5,1,'Entregue',''),(5,2,'Entregue',''),(6,1,'Cancelado','order_canceled'),(6,2,'Cancelado','order_canceled'),(7,1,'Reembolsado','refund'),(7,2,'Reembolsado','refund'),(8,1,'Erro de pagamento','payment_error'),(8,2,'Erro de pagamento','payment_error'),(9,1,'Sem stock (Pagamento aceite)','outofstock'),(9,2,'Sem stock (Pagamento aceite)','outofstock'),(10,1,'A aguardar tranferÃªncia bancÃ¡ria','bankwire'),(10,2,'A aguardar tranferÃªncia bancÃ¡ria','bankwire'),(11,1,'Pagamento remoto aceite','payment'),(11,2,'Pagamento remoto aceite','payment'),(12,1,'Sem stock','outofstock'),(12,2,'Sem stock','outofstock'),(13,1,'Awaiting cod validation','cashondelivery'),(13,2,'Awaiting cod validation','cashondelivery');
/*!40000 ALTER TABLE `tb_order_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_orders`
--

DROP TABLE IF EXISTS `tb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_orders` (
  `id_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(9) DEFAULT NULL,
  `id_shop_group` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_carrier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_cart` int(10) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_address_delivery` int(10) unsigned NOT NULL,
  `id_address_invoice` int(10) unsigned NOT NULL,
  `current_state` int(10) unsigned NOT NULL,
  `secure_key` varchar(32) NOT NULL DEFAULT '-1',
  `payment` varchar(255) NOT NULL,
  `conversion_rate` decimal(13,6) NOT NULL DEFAULT '1.000000',
  `module` varchar(255) DEFAULT NULL,
  `recyclable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_message` text,
  `mobile_theme` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_number` varchar(64) DEFAULT NULL,
  `total_discounts` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_discounts_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_discounts_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_paid_real` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_products` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_products_wt` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_shipping_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `carrier_tax_rate` decimal(10,3) NOT NULL DEFAULT '0.000',
  `total_wrapping` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_wrapping_tax_incl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `total_wrapping_tax_excl` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `round_mode` tinyint(1) NOT NULL DEFAULT '2',
  `round_type` tinyint(1) NOT NULL DEFAULT '1',
  `invoice_number` int(10) unsigned NOT NULL DEFAULT '0',
  `delivery_number` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `valid` int(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `reference` (`reference`),
  KEY `id_customer` (`id_customer`),
  KEY `id_cart` (`id_cart`),
  KEY `invoice_number` (`invoice_number`),
  KEY `id_carrier` (`id_carrier`),
  KEY `id_lang` (`id_lang`),
  KEY `id_currency` (`id_currency`),
  KEY `id_address_delivery` (`id_address_delivery`),
  KEY `id_address_invoice` (`id_address_invoice`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `current_state` (`current_state`),
  KEY `id_shop` (`id_shop`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orders`
--

LOCK TABLES `tb_orders` WRITE;
/*!40000 ALTER TABLE `tb_orders` DISABLE KEYS */;
INSERT INTO `tb_orders` VALUES (1,'XKBKNABJK',1,1,2,1,1,1,1,4,4,6,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,'',0.000000,0.000000,0.000000,55.000000,55.000000,55.000000,0.000000,53.000000,53.000000,2.000000,2.000000,2.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2018-01-17 09:46:03','2018-01-17 09:46:03'),(2,'OHSATSERP',1,1,2,1,1,2,1,4,4,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,'',0.000000,0.000000,0.000000,75.900000,75.900000,75.900000,0.000000,73.900000,73.900000,2.000000,2.000000,2.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2018-01-17 09:46:03','2018-01-17 09:46:03'),(3,'UOYEVOLI',1,1,2,1,1,3,1,4,4,8,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,'',0.000000,0.000000,0.000000,76.010000,76.010000,76.010000,0.000000,74.010000,74.010000,2.000000,2.000000,2.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2018-01-17 09:46:03','2018-01-17 09:46:03'),(4,'FFATNOMMJ',1,1,2,1,1,4,1,4,4,1,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Payment by check',1.000000,'ps_checkpayment',0,0,'',0,'',0.000000,0.000000,0.000000,89.890000,89.890000,89.890000,0.000000,87.890000,87.890000,2.000000,2.000000,2.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2018-01-17 09:46:03','2018-01-17 09:46:03'),(5,'KHWLILZLL',1,1,2,1,1,5,1,4,4,10,'b44a6d9efd7a0076a0fbce6b15eaf3b1','Bank wire',1.000000,'ps_wirepayment',0,0,'',0,'',0.000000,0.000000,0.000000,71.510000,71.510000,71.510000,0.000000,69.510000,69.510000,2.000000,2.000000,2.000000,0.000,0.000000,0.000000,0.000000,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2018-01-17 09:46:03','2018-01-17 09:46:03');
/*!40000 ALTER TABLE `tb_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pack`
--

DROP TABLE IF EXISTS `tb_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pack` (
  `id_product_pack` int(10) unsigned NOT NULL,
  `id_product_item` int(10) unsigned NOT NULL,
  `id_product_attribute_item` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product_pack`,`id_product_item`,`id_product_attribute_item`),
  KEY `product_item` (`id_product_item`,`id_product_attribute_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pack`
--

LOCK TABLES `tb_pack` WRITE;
/*!40000 ALTER TABLE `tb_pack` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_page`
--

DROP TABLE IF EXISTS `tb_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_page` (
  `id_page` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_page_type` int(10) unsigned NOT NULL,
  `id_object` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_page`),
  KEY `id_page_type` (`id_page_type`),
  KEY `id_object` (`id_object`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_page`
--

LOCK TABLES `tb_page` WRITE;
/*!40000 ALTER TABLE `tb_page` DISABLE KEYS */;
INSERT INTO `tb_page` VALUES (1,1,NULL);
/*!40000 ALTER TABLE `tb_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_page_type`
--

DROP TABLE IF EXISTS `tb_page_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_page_type` (
  `id_page_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_type`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_page_type`
--

LOCK TABLES `tb_page_type` WRITE;
/*!40000 ALTER TABLE `tb_page_type` DISABLE KEYS */;
INSERT INTO `tb_page_type` VALUES (1,'index');
/*!40000 ALTER TABLE `tb_page_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_page_viewed`
--

DROP TABLE IF EXISTS `tb_page_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_page_viewed` (
  `id_page` int(10) unsigned NOT NULL,
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_date_range` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_page`,`id_date_range`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_page_viewed`
--

LOCK TABLES `tb_page_viewed` WRITE;
/*!40000 ALTER TABLE `tb_page_viewed` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_page_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagenotfound`
--

DROP TABLE IF EXISTS `tb_pagenotfound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pagenotfound` (
  `id_pagenotfound` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `request_uri` varchar(256) NOT NULL,
  `http_referer` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_pagenotfound`),
  KEY `date_add` (`date_add`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagenotfound`
--

LOCK TABLES `tb_pagenotfound` WRITE;
/*!40000 ALTER TABLE `tb_pagenotfound` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pagenotfound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned DEFAULT NULL,
  `id_manufacturer` int(10) unsigned DEFAULT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_shop_default` int(10) unsigned NOT NULL DEFAULT '1',
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ean13` varchar(13) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `width` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `height` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `depth` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `out_of_stock` int(10) unsigned NOT NULL DEFAULT '2',
  `quantity_discount` tinyint(1) DEFAULT '0',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301-product','302-product','301-category','302-category') NOT NULL DEFAULT '',
  `id_type_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date DEFAULT NULL,
  `show_condition` tinyint(1) NOT NULL DEFAULT '0',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_is_pack` tinyint(1) NOT NULL DEFAULT '0',
  `cache_has_attachments` tinyint(1) NOT NULL DEFAULT '0',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT '3',
  `state` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_product`),
  KEY `product_supplier` (`id_supplier`),
  KEY `product_manufacturer` (`id_manufacturer`,`id_product`),
  KEY `id_category_default` (`id_category_default`),
  KEY `indexed` (`indexed`),
  KEY `date_add` (`date_add`),
  KEY `state` (`state`,`date_upd`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (8,0,2,12,1,0,0,0,'','','',0.000000,0,1,400.000000,0.000000,'',0.000000,0.00,'','','',0.000000,0.000000,0.000000,0.000000,2,0,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,0,0,'2018-01-17 10:08:50','2018-01-17 11:03:21',0,3,1);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_attachment`
--

DROP TABLE IF EXISTS `tb_product_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_attachment` (
  `id_product` int(10) unsigned NOT NULL,
  `id_attachment` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_attachment`
--

LOCK TABLES `tb_product_attachment` WRITE;
/*!40000 ALTER TABLE `tb_product_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_attribute`
--

DROP TABLE IF EXISTS `tb_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_attribute` (
  `id_product_attribute` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `supplier_reference` varchar(32) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `default_on` tinyint(1) unsigned DEFAULT NULL,
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `available_date` date DEFAULT NULL,
  PRIMARY KEY (`id_product_attribute`),
  UNIQUE KEY `product_default` (`id_product`,`default_on`),
  KEY `product_attribute_product` (`id_product`),
  KEY `reference` (`reference`),
  KEY `supplier_reference` (`supplier_reference`),
  KEY `id_product_id_product_attribute` (`id_product_attribute`,`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_attribute`
--

LOCK TABLES `tb_product_attribute` WRITE;
/*!40000 ALTER TABLE `tb_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_attribute_combination`
--

DROP TABLE IF EXISTS `tb_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_attribute_combination` (
  `id_attribute` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_attribute`,`id_product_attribute`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_attribute_combination`
--

LOCK TABLES `tb_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `tb_product_attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_attribute_image`
--

DROP TABLE IF EXISTS `tb_product_attribute_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_attribute_image` (
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_image` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_image`),
  KEY `id_image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_attribute_image`
--

LOCK TABLES `tb_product_attribute_image` WRITE;
/*!40000 ALTER TABLE `tb_product_attribute_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_attribute_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_attribute_shop`
--

DROP TABLE IF EXISTS `tb_product_attribute_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_attribute_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `weight` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unit_price_impact` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `default_on` tinyint(1) unsigned DEFAULT NULL,
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `available_date` date DEFAULT NULL,
  PRIMARY KEY (`id_product_attribute`,`id_shop`),
  UNIQUE KEY `id_product` (`id_product`,`id_shop`,`default_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_attribute_shop`
--

LOCK TABLES `tb_product_attribute_shop` WRITE;
/*!40000 ALTER TABLE `tb_product_attribute_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_attribute_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_carrier`
--

DROP TABLE IF EXISTS `tb_product_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_carrier` (
  `id_product` int(10) unsigned NOT NULL,
  `id_carrier_reference` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_carrier_reference`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_carrier`
--

LOCK TABLES `tb_product_carrier` WRITE;
/*!40000 ALTER TABLE `tb_product_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_country_tax`
--

DROP TABLE IF EXISTS `tb_product_country_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_country_tax` (
  `id_product` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_tax` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_country_tax`
--

LOCK TABLES `tb_product_country_tax` WRITE;
/*!40000 ALTER TABLE `tb_product_country_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_country_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_download`
--

DROP TABLE IF EXISTS `tb_product_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_download` (
  `id_product_download` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(10) unsigned NOT NULL,
  `display_filename` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_expiration` datetime DEFAULT NULL,
  `nb_days_accessible` int(10) unsigned DEFAULT NULL,
  `nb_downloadable` int(10) unsigned DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shareable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_product_download`),
  UNIQUE KEY `id_product` (`id_product`),
  KEY `product_active` (`id_product`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_download`
--

LOCK TABLES `tb_product_download` WRITE;
/*!40000 ALTER TABLE `tb_product_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_group_reduction_cache`
--

DROP TABLE IF EXISTS `tb_product_group_reduction_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_group_reduction_cache` (
  `id_product` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `reduction` decimal(4,3) NOT NULL,
  PRIMARY KEY (`id_product`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_group_reduction_cache`
--

LOCK TABLES `tb_product_group_reduction_cache` WRITE;
/*!40000 ALTER TABLE `tb_product_group_reduction_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_group_reduction_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_lang`
--

DROP TABLE IF EXISTS `tb_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_lang` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `description_short` text,
  `link_rewrite` varchar(128) NOT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_title` varchar(128) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `available_now` varchar(255) DEFAULT NULL,
  `available_later` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`,`id_shop`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_lang`
--

LOCK TABLES `tb_product_lang` WRITE;
/*!40000 ALTER TABLE `tb_product_lang` DISABLE KEYS */;
INSERT INTO `tb_product_lang` VALUES (8,1,1,'<div class=\"descProduct\">\n<p>O JBL Flip 4 Ã© a Ãºltima geraÃ§Ã£o da premiada sÃ©rie Flip, uma caixa de som portÃ¡til com Bluetooth que oferece um som estÃ©reo surpreendentemente poderoso. Esta caixa de som compacta Ã© alimentada por uma bateria de Ã­ons de lÃ­tio recarregÃ¡vel de 3.000 mAh, que oferece 12 horas contÃ­nuas de Ã¡udio de alta qualidade. Com materiais tÃªxteis durÃ¡veis e Ã  prova dÃ¡gua, o Flip 4 Ã© seu companheiro para todos os usos e todos os momentos, levando a festa para qualquer lugar.</p>\n<p>Possui tambÃ©m um viva-voz integrado com cancelamento de ruÃ­dos e ecos, para chamadas de teleconferÃªncia claras. Ã‰ equipado com tecnologia Connect+ da JBL, permitindo que vocÃª conecte mais de 100 caixas de som compatÃ­veis. Com o simples pressionar de um botÃ£o, vocÃª pode ativar e falar com Siri ou Google Now pelo seu JBL Flip 4.</p>\n<p></p>\n<h2>ConteÃºdo da Caixa</h2>\n<ul class=\"box-content-list\"><li>1 x JBL Flip 4</li>\n<li>1 x Cabo Micro-USB JBL</li>\n<li>1 x Ficha de seguranÃ§a</li>\n<li>1 x Guia de InÃ­cio rÃ¡pido</li>\n<li>Certificado de garantia</li>\n</ul></div>','','jbl-flip4','','','','JBL Flip4','',''),(8,1,2,'','','jbl-flip4','','','','JBL Flip4','','');
/*!40000 ALTER TABLE `tb_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_sale`
--

DROP TABLE IF EXISTS `tb_product_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_sale` (
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_nbr` int(10) unsigned NOT NULL DEFAULT '0',
  `date_upd` date DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `quantity` (`quantity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_sale`
--

LOCK TABLES `tb_product_sale` WRITE;
/*!40000 ALTER TABLE `tb_product_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_shop`
--

DROP TABLE IF EXISTS `tb_product_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_shop` (
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(10) unsigned NOT NULL,
  `id_category_default` int(10) unsigned DEFAULT NULL,
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `on_sale` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ecotax` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `minimal_quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `wholesale_price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `unity` varchar(255) DEFAULT NULL,
  `unit_price_ratio` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `additional_shipping_cost` decimal(20,2) NOT NULL DEFAULT '0.00',
  `customizable` tinyint(2) NOT NULL DEFAULT '0',
  `uploadable_files` tinyint(4) NOT NULL DEFAULT '0',
  `text_fields` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `redirect_type` enum('','404','301-product','302-product','301-category','302-category') NOT NULL DEFAULT '',
  `id_type_redirected` int(10) unsigned NOT NULL DEFAULT '0',
  `available_for_order` tinyint(1) NOT NULL DEFAULT '1',
  `available_date` date DEFAULT NULL,
  `show_condition` tinyint(1) NOT NULL DEFAULT '1',
  `condition` enum('new','used','refurbished') NOT NULL DEFAULT 'new',
  `show_price` tinyint(1) NOT NULL DEFAULT '1',
  `indexed` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` enum('both','catalog','search','none') NOT NULL DEFAULT 'both',
  `cache_default_attribute` int(10) unsigned DEFAULT NULL,
  `advanced_stock_management` tinyint(1) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `pack_stock_type` int(11) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id_product`,`id_shop`),
  KEY `id_category_default` (`id_category_default`),
  KEY `date_add` (`date_add`,`active`,`visibility`),
  KEY `indexed` (`indexed`,`active`,`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_shop`
--

LOCK TABLES `tb_product_shop` WRITE;
/*!40000 ALTER TABLE `tb_product_shop` DISABLE KEYS */;
INSERT INTO `tb_product_shop` VALUES (8,1,12,0,0,0,0.000000,1,400.000000,0.000000,'',0.000000,0.00,0,0,0,1,'404',0,1,'0000-00-00',0,'new',1,1,'both',0,0,'2018-01-17 10:08:50','2018-01-17 11:03:21',3);
/*!40000 ALTER TABLE `tb_product_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_supplier`
--

DROP TABLE IF EXISTS `tb_product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_supplier` (
  `id_product_supplier` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL DEFAULT '0',
  `id_supplier` int(11) unsigned NOT NULL,
  `product_supplier_reference` varchar(32) DEFAULT NULL,
  `product_supplier_price_te` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `id_currency` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_product_supplier`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_supplier`),
  KEY `id_supplier` (`id_supplier`,`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_supplier`
--

LOCK TABLES `tb_product_supplier` WRITE;
/*!40000 ALTER TABLE `tb_product_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product_tag`
--

DROP TABLE IF EXISTS `tb_product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product_tag` (
  `id_product` int(10) unsigned NOT NULL,
  `id_tag` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_product`,`id_tag`),
  KEY `id_tag` (`id_tag`),
  KEY `id_lang` (`id_lang`,`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product_tag`
--

LOCK TABLES `tb_product_tag` WRITE;
/*!40000 ALTER TABLE `tb_product_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile`
--

DROP TABLE IF EXISTS `tb_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_profile` (
  `id_profile` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_profile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile`
--

LOCK TABLES `tb_profile` WRITE;
/*!40000 ALTER TABLE `tb_profile` DISABLE KEYS */;
INSERT INTO `tb_profile` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `tb_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile_lang`
--

DROP TABLE IF EXISTS `tb_profile_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_profile_lang` (
  `id_lang` int(10) unsigned NOT NULL,
  `id_profile` int(10) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_profile`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile_lang`
--

LOCK TABLES `tb_profile_lang` WRITE;
/*!40000 ALTER TABLE `tb_profile_lang` DISABLE KEYS */;
INSERT INTO `tb_profile_lang` VALUES (1,1,'SuperAdministrador'),(2,1,'SuperAdmin'),(1,2,'Operador de logÃ­stica'),(2,2,'Operador de logistica'),(1,3,'Tradutor'),(2,3,'Tradutor'),(1,4,'Vendedor'),(2,4,'Vendedor');
/*!40000 ALTER TABLE `tb_profile_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_quick_access`
--

DROP TABLE IF EXISTS `tb_quick_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_quick_access` (
  `id_quick_access` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `new_window` tinyint(1) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id_quick_access`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_quick_access`
--

LOCK TABLES `tb_quick_access` WRITE;
/*!40000 ALTER TABLE `tb_quick_access` DISABLE KEYS */;
INSERT INTO `tb_quick_access` VALUES (1,0,'index.php?controller=AdminOrders'),(2,0,'index.php?controller=AdminCartRules&addcart_rule'),(3,0,'index.php/product/new'),(4,0,'index.php?controller=AdminCategories&addcategory'),(5,0,'index.php/module/manage');
/*!40000 ALTER TABLE `tb_quick_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_quick_access_lang`
--

DROP TABLE IF EXISTS `tb_quick_access_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_quick_access_lang` (
  `id_quick_access` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_quick_access`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_quick_access_lang`
--

LOCK TABLES `tb_quick_access_lang` WRITE;
/*!40000 ALTER TABLE `tb_quick_access_lang` DISABLE KEYS */;
INSERT INTO `tb_quick_access_lang` VALUES (1,1,'Encomendas'),(1,2,'Pedidos'),(2,1,'Novo Voucher'),(2,2,'Novo Voucher'),(3,1,'Novo produto'),(3,2,'Produto novo'),(4,1,'Nova Categoria'),(4,2,'Nova Categoria'),(5,1,'MÃ³dulos instalados'),(5,2,'MÃ³dulos instalados');
/*!40000 ALTER TABLE `tb_quick_access_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_range_price`
--

DROP TABLE IF EXISTS `tb_range_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_range_price` (
  `id_range_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_price`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_range_price`
--

LOCK TABLES `tb_range_price` WRITE;
/*!40000 ALTER TABLE `tb_range_price` DISABLE KEYS */;
INSERT INTO `tb_range_price` VALUES (1,2,0.000000,10000.000000);
/*!40000 ALTER TABLE `tb_range_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_range_weight`
--

DROP TABLE IF EXISTS `tb_range_weight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_range_weight` (
  `id_range_weight` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_carrier` int(10) unsigned NOT NULL,
  `delimiter1` decimal(20,6) NOT NULL,
  `delimiter2` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id_range_weight`),
  UNIQUE KEY `id_carrier` (`id_carrier`,`delimiter1`,`delimiter2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_range_weight`
--

LOCK TABLES `tb_range_weight` WRITE;
/*!40000 ALTER TABLE `tb_range_weight` DISABLE KEYS */;
INSERT INTO `tb_range_weight` VALUES (1,2,0.000000,10000.000000);
/*!40000 ALTER TABLE `tb_range_weight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reassurance`
--

DROP TABLE IF EXISTS `tb_reassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reassurance` (
  `id_reassurance` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL,
  `file_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_reassurance`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reassurance`
--

LOCK TABLES `tb_reassurance` WRITE;
/*!40000 ALTER TABLE `tb_reassurance` DISABLE KEYS */;
INSERT INTO `tb_reassurance` VALUES (1,1,'ic_verified_user_black_36dp_1x.png'),(2,1,'ic_local_shipping_black_36dp_1x.png'),(3,1,'ic_swap_horiz_black_36dp_1x.png');
/*!40000 ALTER TABLE `tb_reassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reassurance_lang`
--

DROP TABLE IF EXISTS `tb_reassurance_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reassurance_lang` (
  `id_reassurance` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `text` varchar(300) NOT NULL,
  PRIMARY KEY (`id_reassurance`,`id_lang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reassurance_lang`
--

LOCK TABLES `tb_reassurance_lang` WRITE;
/*!40000 ALTER TABLE `tb_reassurance_lang` DISABLE KEYS */;
INSERT INTO `tb_reassurance_lang` VALUES (1,1,'PolÃ­tica de seguranÃ§a (editar com o mÃ³dulo Garantia do cliente)'),(1,2,'PolÃ­tica de seguranÃ§a (editar com o mÃ³dulo Garantia do cliente)'),(2,1,'PolÃ­tica de entrega (editar com o mÃ³dulo Garantia do cliente)'),(2,2,'PolÃ­tica de entrega (editar com o mÃ³dulo Garantia do cliente)'),(3,1,'PolÃ­tica de devoluÃ§Ã£o (editar com o mÃ³dulo Garantia do cliente)'),(3,2,'PolÃ­tica de devoluÃ§Ã£o (editar com o mÃ³dulo Garantia do cliente)');
/*!40000 ALTER TABLE `tb_reassurance_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_referrer`
--

DROP TABLE IF EXISTS `tb_referrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_referrer` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `http_referer_regexp` varchar(64) DEFAULT NULL,
  `http_referer_like` varchar(64) DEFAULT NULL,
  `request_uri_regexp` varchar(64) DEFAULT NULL,
  `request_uri_like` varchar(64) DEFAULT NULL,
  `http_referer_regexp_not` varchar(64) DEFAULT NULL,
  `http_referer_like_not` varchar(64) DEFAULT NULL,
  `request_uri_regexp_not` varchar(64) DEFAULT NULL,
  `request_uri_like_not` varchar(64) DEFAULT NULL,
  `base_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `percent_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `click_fee` decimal(5,2) NOT NULL DEFAULT '0.00',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_referrer`
--

LOCK TABLES `tb_referrer` WRITE;
/*!40000 ALTER TABLE `tb_referrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_referrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_referrer_cache`
--

DROP TABLE IF EXISTS `tb_referrer_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_referrer_cache` (
  `id_connections_source` int(11) unsigned NOT NULL,
  `id_referrer` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_connections_source`,`id_referrer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_referrer_cache`
--

LOCK TABLES `tb_referrer_cache` WRITE;
/*!40000 ALTER TABLE `tb_referrer_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_referrer_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_referrer_shop`
--

DROP TABLE IF EXISTS `tb_referrer_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_referrer_shop` (
  `id_referrer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_visitors` int(11) DEFAULT NULL,
  `cache_visits` int(11) DEFAULT NULL,
  `cache_pages` int(11) DEFAULT NULL,
  `cache_registrations` int(11) DEFAULT NULL,
  `cache_orders` int(11) DEFAULT NULL,
  `cache_sales` decimal(17,2) DEFAULT NULL,
  `cache_reg_rate` decimal(5,4) DEFAULT NULL,
  `cache_order_rate` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`id_referrer`,`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_referrer_shop`
--

LOCK TABLES `tb_referrer_shop` WRITE;
/*!40000 ALTER TABLE `tb_referrer_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_referrer_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_request_sql`
--

DROP TABLE IF EXISTS `tb_request_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_request_sql` (
  `id_request_sql` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY (`id_request_sql`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_request_sql`
--

LOCK TABLES `tb_request_sql` WRITE;
/*!40000 ALTER TABLE `tb_request_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_request_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_required_field`
--

DROP TABLE IF EXISTS `tb_required_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_required_field` (
  `id_required_field` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(32) NOT NULL,
  `field_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_required_field`),
  KEY `object_name` (`object_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_required_field`
--

LOCK TABLES `tb_required_field` WRITE;
/*!40000 ALTER TABLE `tb_required_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_required_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_risk`
--

DROP TABLE IF EXISTS `tb_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_risk` (
  `id_risk` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `percent` tinyint(3) NOT NULL,
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_risk`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_risk`
--

LOCK TABLES `tb_risk` WRITE;
/*!40000 ALTER TABLE `tb_risk` DISABLE KEYS */;
INSERT INTO `tb_risk` VALUES (1,0,'#32CD32'),(2,35,'#FF8C00'),(3,75,'#DC143C'),(4,100,'#ec2e15');
/*!40000 ALTER TABLE `tb_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_risk_lang`
--

DROP TABLE IF EXISTS `tb_risk_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_risk_lang` (
  `id_risk` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_risk`,`id_lang`),
  KEY `id_risk` (`id_risk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_risk_lang`
--

LOCK TABLES `tb_risk_lang` WRITE;
/*!40000 ALTER TABLE `tb_risk_lang` DISABLE KEYS */;
INSERT INTO `tb_risk_lang` VALUES (1,1,'Nenhum'),(1,2,'Nenhum'),(2,1,'Baixa'),(2,2,'Baixa'),(3,1,'MÃ©dio'),(3,2,'MÃ©dio'),(4,1,'Alto'),(4,2,'Alta');
/*!40000 ALTER TABLE `tb_risk_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_search_engine`
--

DROP TABLE IF EXISTS `tb_search_engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_search_engine` (
  `id_search_engine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `server` varchar(64) NOT NULL,
  `getvar` varchar(16) NOT NULL,
  PRIMARY KEY (`id_search_engine`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_search_engine`
--

LOCK TABLES `tb_search_engine` WRITE;
/*!40000 ALTER TABLE `tb_search_engine` DISABLE KEYS */;
INSERT INTO `tb_search_engine` VALUES (1,'google','q'),(2,'aol','q'),(3,'yandex','text'),(4,'ask.com','q'),(5,'nhl.com','q'),(6,'yahoo','p'),(7,'baidu','wd'),(8,'lycos','query'),(9,'exalead','q'),(10,'search.live','q'),(11,'voila','rdata'),(12,'altavista','q'),(13,'bing','q'),(14,'daum','q'),(15,'eniro','search_word'),(16,'naver','query'),(17,'msn','q'),(18,'netscape','query'),(19,'cnn','query'),(20,'about','terms'),(21,'mamma','query'),(22,'alltheweb','q'),(23,'virgilio','qs'),(24,'alice','qs'),(25,'najdi','q'),(26,'mama','query'),(27,'seznam','q'),(28,'onet','qt'),(29,'szukacz','q'),(30,'yam','k'),(31,'pchome','q'),(32,'kvasir','q'),(33,'sesam','q'),(34,'ozu','q'),(35,'terra','query'),(36,'mynet','q'),(37,'ekolay','q'),(38,'rambler','words');
/*!40000 ALTER TABLE `tb_search_engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_search_index`
--

DROP TABLE IF EXISTS `tb_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_search_index` (
  `id_product` int(11) unsigned NOT NULL,
  `id_word` int(11) unsigned NOT NULL,
  `weight` smallint(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_word`,`id_product`),
  KEY `id_product` (`id_product`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_search_index`
--

LOCK TABLES `tb_search_index` WRITE;
/*!40000 ALTER TABLE `tb_search_index` DISABLE KEYS */;
INSERT INTO `tb_search_index` VALUES (1,6,1),(1,7,1),(1,17,1),(1,19,1),(1,20,1),(1,21,1),(1,22,1),(1,24,1),(1,25,1),(1,26,1),(1,27,1),(1,28,1),(1,29,1),(1,30,1),(1,31,1),(1,32,1),(1,33,1),(1,34,1),(1,35,1),(1,36,1),(1,37,1),(1,38,1),(1,39,1),(1,40,1),(1,41,1),(1,42,1),(1,43,1),(1,44,1),(1,45,1),(1,46,1),(1,47,1),(1,48,1),(1,49,1),(1,50,1),(1,51,1),(1,52,1),(1,53,1),(1,54,1),(1,55,1),(1,56,1),(1,57,1),(1,58,1),(1,59,1),(1,60,1),(1,61,1),(1,62,1),(1,63,1),(1,64,1),(1,65,1),(1,66,1),(1,67,1),(1,68,1),(1,84,1),(1,88,1),(1,97,1),(1,98,1),(1,99,1),(1,101,1),(1,102,1),(1,103,1),(1,105,1),(1,106,1),(1,107,1),(1,108,1),(1,109,1),(1,110,1),(1,111,1),(1,112,1),(1,113,1),(1,114,1),(1,115,1),(1,117,1),(1,118,1),(1,119,1),(1,120,1),(1,121,1),(1,122,1),(1,123,1),(1,124,1),(1,125,1),(1,126,1),(1,127,1),(1,128,1),(1,129,1),(1,130,1),(1,131,1),(1,132,1),(1,133,1),(1,134,1),(1,135,1),(1,136,1),(1,137,1),(1,138,1),(1,139,1),(1,140,1),(1,141,1),(1,142,1),(1,143,1),(1,144,1),(1,145,1),(1,146,1),(1,147,1),(1,148,1),(1,149,1),(1,150,1),(1,151,1),(1,152,1),(1,153,1),(1,154,1),(1,155,1),(1,156,1),(1,157,1),(1,158,1),(1,16,2),(1,23,2),(1,73,2),(1,74,2),(1,75,2),(1,104,2),(1,163,2),(1,164,2),(1,165,2),(1,166,2),(1,70,3),(1,160,3),(1,83,4),(1,116,4),(1,18,5),(1,100,5),(1,71,6),(1,72,6),(1,161,6),(1,162,6),(1,3,7),(1,77,7),(1,78,7),(1,2,9),(1,5,10),(1,80,10),(2,16,1),(2,19,1),(2,20,1),(2,21,1),(2,22,1),(2,24,1),(2,25,1),(2,26,1),(2,28,1),(2,29,1),(2,30,1),(2,31,1),(2,32,1),(2,33,1),(2,34,1),(2,35,1),(2,36,1),(2,37,1),(2,38,1),(2,39,1),(2,40,1),(2,41,1),(2,42,1),(2,43,1),(2,44,1),(2,45,1),(2,46,1),(2,47,1),(2,48,1),(2,49,1),(2,50,1),(2,51,1),(2,52,1),(2,53,1),(2,54,1),(2,55,1),(2,56,1),(2,57,1),(2,58,1),(2,59,1),(2,60,1),(2,61,1),(2,62,1),(2,63,1),(2,64,1),(2,65,1),(2,66,1),(2,67,1),(2,68,1),(2,98,1),(2,99,1),(2,101,1),(2,102,1),(2,103,1),(2,105,1),(2,106,1),(2,107,1),(2,108,1),(2,109,1),(2,111,1),(2,112,1),(2,113,1),(2,114,1),(2,115,1),(2,117,1),(2,118,1),(2,119,1),(2,120,1),(2,121,1),(2,122,1),(2,123,1),(2,124,1),(2,125,1),(2,126,1),(2,127,1),(2,128,1),(2,129,1),(2,130,1),(2,131,1),(2,132,1),(2,133,1),(2,134,1),(2,135,1),(2,136,1),(2,137,1),(2,138,1),(2,139,1),(2,140,1),(2,141,1),(2,142,1),(2,143,1),(2,144,1),(2,145,1),(2,146,1),(2,147,1),(2,148,1),(2,149,1),(2,150,1),(2,151,1),(2,152,1),(2,153,1),(2,154,1),(2,155,1),(2,156,1),(2,157,1),(2,158,1),(2,23,2),(2,27,2),(2,73,2),(2,74,2),(2,104,2),(2,110,2),(2,163,2),(2,164,2),(2,165,2),(2,2,3),(2,70,3),(2,160,3),(2,83,4),(2,116,4),(2,18,5),(2,100,5),(2,172,6),(2,173,6),(2,236,6),(2,237,6),(2,5,10),(2,80,10),(3,16,1),(3,19,1),(3,20,1),(3,21,1),(3,22,1),(3,24,1),(3,25,1),(3,26,1),(3,27,1),(3,28,1),(3,29,1),(3,30,1),(3,31,1),(3,32,1),(3,34,1),(3,35,1),(3,36,1),(3,37,1),(3,38,1),(3,39,1),(3,40,1),(3,41,1),(3,42,1),(3,43,1),(3,44,1),(3,45,1),(3,46,1),(3,47,1),(3,48,1),(3,49,1),(3,50,1),(3,51,1),(3,52,1),(3,53,1),(3,54,1),(3,55,1),(3,56,1),(3,57,1),(3,58,1),(3,59,1),(3,60,1),(3,61,1),(3,62,1),(3,63,1),(3,64,1),(3,65,1),(3,66,1),(3,67,1),(3,68,1),(3,98,1),(3,99,1),(3,101,1),(3,102,1),(3,103,1),(3,105,1),(3,106,1),(3,107,1),(3,108,1),(3,109,1),(3,110,1),(3,111,1),(3,112,1),(3,113,1),(3,114,1),(3,115,1),(3,117,1),(3,118,1),(3,119,1),(3,120,1),(3,121,1),(3,122,1),(3,123,1),(3,125,1),(3,126,1),(3,127,1),(3,128,1),(3,129,1),(3,130,1),(3,131,1),(3,132,1),(3,133,1),(3,134,1),(3,135,1),(3,136,1),(3,137,1),(3,138,1),(3,139,1),(3,140,1),(3,141,1),(3,142,1),(3,143,1),(3,144,1),(3,145,1),(3,146,1),(3,147,1),(3,148,1),(3,149,1),(3,150,1),(3,151,1),(3,152,1),(3,153,1),(3,154,1),(3,155,1),(3,156,1),(3,157,1),(3,158,1),(3,172,1),(3,173,1),(3,317,1),(3,387,1),(3,23,2),(3,104,2),(3,124,2),(3,318,2),(3,395,2),(3,397,2),(3,70,3),(3,74,3),(3,83,3),(3,160,3),(3,164,3),(3,394,3),(3,33,4),(3,116,4),(3,18,5),(3,100,5),(3,161,6),(3,71,7),(3,308,7),(3,380,7),(3,381,7),(3,309,9),(3,5,10),(3,80,10),(4,16,1),(4,19,1),(4,20,1),(4,21,1),(4,22,1),(4,24,1),(4,25,1),(4,26,1),(4,27,1),(4,28,1),(4,29,1),(4,30,1),(4,31,1),(4,32,1),(4,34,1),(4,35,1),(4,36,1),(4,37,1),(4,38,1),(4,39,1),(4,40,1),(4,41,1),(4,42,1),(4,43,1),(4,44,1),(4,45,1),(4,46,1),(4,47,1),(4,48,1),(4,49,1),(4,50,1),(4,51,1),(4,52,1),(4,53,1),(4,54,1),(4,55,1),(4,56,1),(4,57,1),(4,58,1),(4,59,1),(4,60,1),(4,61,1),(4,62,1),(4,63,1),(4,64,1),(4,65,1),(4,66,1),(4,67,1),(4,68,1),(4,98,1),(4,99,1),(4,101,1),(4,102,1),(4,103,1),(4,105,1),(4,106,1),(4,107,1),(4,108,1),(4,109,1),(4,110,1),(4,111,1),(4,112,1),(4,113,1),(4,114,1),(4,115,1),(4,117,1),(4,118,1),(4,119,1),(4,120,1),(4,121,1),(4,122,1),(4,123,1),(4,124,1),(4,125,1),(4,126,1),(4,127,1),(4,128,1),(4,129,1),(4,130,1),(4,131,1),(4,132,1),(4,133,1),(4,134,1),(4,135,1),(4,136,1),(4,137,1),(4,138,1),(4,139,1),(4,140,1),(4,141,1),(4,142,1),(4,143,1),(4,144,1),(4,145,1),(4,146,1),(4,147,1),(4,148,1),(4,149,1),(4,150,1),(4,151,1),(4,152,1),(4,153,1),(4,154,1),(4,155,1),(4,156,1),(4,157,1),(4,158,1),(4,172,1),(4,467,1),(4,536,1),(4,540,1),(4,2,2),(4,23,2),(4,104,2),(4,165,2),(4,397,2),(4,474,2),(4,545,2),(4,70,3),(4,160,3),(4,394,3),(4,33,4),(4,83,4),(4,116,4),(4,18,5),(4,100,5),(4,308,7),(4,380,7),(4,381,7),(4,309,9),(4,5,10),(4,80,10),(5,7,1),(5,16,1),(5,19,1),(5,20,1),(5,21,1),(5,22,1),(5,24,1),(5,25,1),(5,26,1),(5,27,1),(5,28,1),(5,29,1),(5,30,1),(5,31,1),(5,32,1),(5,34,1),(5,35,1),(5,36,1),(5,37,1),(5,38,1),(5,39,1),(5,40,1),(5,41,1),(5,42,1),(5,43,1),(5,44,1),(5,45,1),(5,46,1),(5,47,1),(5,48,1),(5,49,1),(5,50,1),(5,51,1),(5,52,1),(5,53,1),(5,54,1),(5,55,1),(5,56,1),(5,57,1),(5,58,1),(5,59,1),(5,60,1),(5,61,1),(5,62,1),(5,63,1),(5,64,1),(5,65,1),(5,66,1),(5,67,1),(5,68,1),(5,84,1),(5,98,1),(5,99,1),(5,101,1),(5,102,1),(5,103,1),(5,105,1),(5,106,1),(5,107,1),(5,108,1),(5,109,1),(5,110,1),(5,111,1),(5,112,1),(5,113,1),(5,114,1),(5,115,1),(5,117,1),(5,118,1),(5,119,1),(5,120,1),(5,121,1),(5,122,1),(5,123,1),(5,125,1),(5,126,1),(5,127,1),(5,128,1),(5,129,1),(5,130,1),(5,131,1),(5,132,1),(5,133,1),(5,134,1),(5,135,1),(5,136,1),(5,137,1),(5,138,1),(5,139,1),(5,140,1),(5,141,1),(5,142,1),(5,143,1),(5,144,1),(5,145,1),(5,146,1),(5,147,1),(5,148,1),(5,149,1),(5,150,1),(5,151,1),(5,152,1),(5,153,1),(5,154,1),(5,155,1),(5,156,1),(5,157,1),(5,158,1),(5,619,1),(5,621,1),(5,695,1),(5,23,2),(5,104,2),(5,124,2),(5,397,2),(5,70,3),(5,160,3),(5,394,3),(5,698,3),(5,33,4),(5,116,4),(5,18,5),(5,83,5),(5,100,5),(5,97,6),(5,623,6),(5,699,6),(5,308,7),(5,380,7),(5,381,7),(5,17,9),(5,5,10),(5,80,10),(5,309,10),(6,7,1),(6,16,1),(6,19,1),(6,20,1),(6,21,1),(6,22,1),(6,24,1),(6,25,1),(6,26,1),(6,27,1),(6,28,1),(6,29,1),(6,30,1),(6,31,1),(6,32,1),(6,34,1),(6,35,1),(6,36,1),(6,37,1),(6,38,1),(6,39,1),(6,40,1),(6,41,1),(6,42,1),(6,43,1),(6,44,1),(6,45,1),(6,46,1),(6,47,1),(6,48,1),(6,49,1),(6,50,1),(6,51,1),(6,52,1),(6,53,1),(6,54,1),(6,55,1),(6,56,1),(6,57,1),(6,58,1),(6,59,1),(6,60,1),(6,61,1),(6,62,1),(6,63,1),(6,64,1),(6,65,1),(6,66,1),(6,67,1),(6,68,1),(6,84,1),(6,98,1),(6,99,1),(6,101,1),(6,102,1),(6,103,1),(6,105,1),(6,106,1),(6,107,1),(6,108,1),(6,109,1),(6,110,1),(6,111,1),(6,112,1),(6,113,1),(6,114,1),(6,115,1),(6,117,1),(6,118,1),(6,119,1),(6,120,1),(6,121,1),(6,122,1),(6,123,1),(6,124,1),(6,125,1),(6,126,1),(6,127,1),(6,128,1),(6,129,1),(6,130,1),(6,131,1),(6,132,1),(6,133,1),(6,134,1),(6,135,1),(6,136,1),(6,137,1),(6,138,1),(6,139,1),(6,140,1),(6,141,1),(6,142,1),(6,143,1),(6,144,1),(6,145,1),(6,146,1),(6,147,1),(6,148,1),(6,149,1),(6,150,1),(6,151,1),(6,152,1),(6,153,1),(6,154,1),(6,155,1),(6,156,1),(6,157,1),(6,158,1),(6,778,1),(6,779,1),(6,780,1),(6,847,1),(6,849,1),(6,850,1),(6,23,2),(6,104,2),(6,318,2),(6,395,2),(6,397,2),(6,783,2),(6,853,2),(6,70,3),(6,160,3),(6,394,3),(6,698,3),(6,33,4),(6,83,4),(6,116,4),(6,18,5),(6,100,5),(6,308,6),(6,381,6),(6,623,6),(6,699,6),(6,380,7),(6,17,9),(6,309,9),(6,5,10),(6,80,10),(8,1083,1),(8,1084,1),(8,1085,1),(8,1086,1),(8,1090,1),(8,1092,1),(8,1095,1),(8,1096,1),(8,1097,1),(8,1098,1),(8,1099,1),(8,1100,1),(8,1101,1),(8,1102,1),(8,1103,1),(8,1104,1),(8,1105,1),(8,1106,1),(8,1107,1),(8,1108,1),(8,1109,1),(8,1110,1),(8,1111,1),(8,1112,1),(8,1113,1),(8,1114,1),(8,1115,1),(8,1116,1),(8,1117,1),(8,1119,1),(8,1122,1),(8,1123,1),(8,1124,1),(8,1125,1),(8,1126,1),(8,1127,1),(8,1128,1),(8,1129,1),(8,1130,1),(8,1131,1),(8,1132,1),(8,1133,1),(8,1134,1),(8,1135,1),(8,1136,1),(8,1137,1),(8,1138,1),(8,1139,1),(8,1140,1),(8,1141,1),(8,1142,1),(8,1144,1),(8,1145,1),(8,1146,1),(8,1147,1),(8,1148,1),(8,1149,1),(8,1150,1),(8,1151,1),(8,1152,1),(8,1153,1),(8,1154,1),(8,1155,1),(8,1156,1),(8,1157,1),(8,1158,1),(8,1159,1),(8,1329,1),(8,1330,1),(8,1331,1),(8,1332,1),(8,1333,1),(8,1334,1),(8,1335,1),(8,1336,1),(8,1337,1),(8,1338,1),(8,1087,2),(8,1094,2),(8,1118,2),(8,1121,2),(8,1143,2),(8,1088,3),(8,1093,3),(8,1120,3),(8,1246,3),(8,1326,3),(8,1089,4),(8,1082,5),(8,1081,6),(8,1091,6),(8,1161,6),(8,1160,9),(8,1080,14);
/*!40000 ALTER TABLE `tb_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_search_word`
--

DROP TABLE IF EXISTS `tb_search_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_search_word` (
  `id_word` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_lang` int(10) unsigned NOT NULL,
  `word` varchar(15) NOT NULL,
  PRIMARY KEY (`id_word`),
  UNIQUE KEY `id_lang` (`id_lang`,`id_shop`,`word`)
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_search_word`
--

LOCK TABLES `tb_search_word` WRITE;
/*!40000 ALTER TABLE `tb_search_word` DISABLE KEYS */;
INSERT INTO `tb_search_word` VALUES (1146,1,1,'100'),(1106,1,1,'3000'),(1100,1,1,'alimentada'),(1111,1,1,'alta'),(1153,1,1,'ativar'),(1110,1,1,'audio'),(1102,1,1,'bateria'),(1092,1,1,'bluetooth'),(1151,1,1,'botao'),(1330,1,1,'cabo'),(1088,1,1,'caixa'),(1147,1,1,'caixas'),(1133,1,1,'cancelamento'),(1337,1,1,'certificado'),(1136,1,1,'chamadas'),(1138,1,1,'claras'),(1091,1,1,'com'),(1099,1,1,'compacta'),(1119,1,1,'companheiro'),(1148,1,1,'compativeis'),(1144,1,1,'conecte'),(1141,1,1,'connect'),(1329,1,1,'conteudo'),(1109,1,1,'continuas'),(1117,1,1,'dagua'),(1115,1,1,'duraveis'),(1135,1,1,'ecos'),(1246,1,1,'eletronicos'),(1139,1,1,'equipado'),(1098,1,1,'esta'),(1095,1,1,'estereo'),(1154,1,1,'falar'),(1125,1,1,'festa'),(1333,1,1,'ficha'),(1082,1,1,'flip'),(1081,1,1,'flip4'),(1338,1,1,'garantia'),(1084,1,1,'geracao'),(1156,1,1,'google'),(1335,1,1,'guia'),(1108,1,1,'horas'),(1159,1,1,'inicio'),(1132,1,1,'integrado'),(1103,1,1,'ions'),(1080,1,1,'jbl'),(1124,1,1,'levando'),(1104,1,1,'litio'),(1127,1,1,'lugar'),(1107,1,1,'mah'),(1145,1,1,'mais'),(1113,1,1,'materiais'),(1331,1,1,'micro'),(1123,1,1,'momentos'),(1157,1,1,'now'),(1094,1,1,'oferece'),(1120,1,1,'para'),(1158,1,1,'pelo'),(1142,1,1,'permitindo'),(1152,1,1,'pode'),(1097,1,1,'poderoso'),(1101,1,1,'por'),(1090,1,1,'portatil'),(1128,1,1,'possui'),(1085,1,1,'premiada'),(1150,1,1,'pressionar'),(1116,1,1,'prova'),(1112,1,1,'qualidade'),(1126,1,1,'qualquer'),(1093,1,1,'que'),(1336,1,1,'rapido'),(1105,1,1,'recarregavel'),(1134,1,1,'ruidos'),(1334,1,1,'seguranca'),(1086,1,1,'serie'),(1118,1,1,'seu'),(1149,1,1,'simples'),(1155,1,1,'siri'),(1089,1,1,'som'),(1096,1,1,'surpreendenteme'),(1129,1,1,'tambem'),(1140,1,1,'tecnologia'),(1137,1,1,'teleconferencia'),(1114,1,1,'texteis'),(1121,1,1,'todos'),(1083,1,1,'ultima'),(1087,1,1,'uma'),(1332,1,1,'usb'),(1122,1,1,'usos'),(1130,1,1,'viva'),(1143,1,1,'voce'),(1131,1,1,'voz'),(1326,1,2,'eletronicos'),(1161,1,2,'flip4'),(1162,1,2,'inicio'),(1160,1,2,'jbl');
/*!40000 ALTER TABLE `tb_search_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sekeyword`
--

DROP TABLE IF EXISTS `tb_sekeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sekeyword` (
  `id_sekeyword` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `keyword` varchar(256) NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_sekeyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sekeyword`
--

LOCK TABLES `tb_sekeyword` WRITE;
/*!40000 ALTER TABLE `tb_sekeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_sekeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop`
--

DROP TABLE IF EXISTS `tb_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop` (
  `id_shop` int(11) NOT NULL AUTO_INCREMENT,
  `id_shop_group` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `id_category` int(11) NOT NULL,
  `theme_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop`),
  KEY `IDX_F71A4EB3F5C9E40` (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop`
--

LOCK TABLES `tb_shop` WRITE;
/*!40000 ALTER TABLE `tb_shop` DISABLE KEYS */;
INSERT INTO `tb_shop` VALUES (1,1,'ImportCG',2,'classic',1,0);
/*!40000 ALTER TABLE `tb_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop_group`
--

DROP TABLE IF EXISTS `tb_shop_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop_group` (
  `id_shop_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `share_customer` tinyint(1) NOT NULL,
  `share_order` tinyint(1) NOT NULL,
  `share_stock` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop_group`
--

LOCK TABLES `tb_shop_group` WRITE;
/*!40000 ALTER TABLE `tb_shop_group` DISABLE KEYS */;
INSERT INTO `tb_shop_group` VALUES (1,'Default',0,0,0,1,0);
/*!40000 ALTER TABLE `tb_shop_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_shop_url`
--

DROP TABLE IF EXISTS `tb_shop_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_shop_url` (
  `id_shop_url` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(11) unsigned NOT NULL,
  `domain` varchar(150) NOT NULL,
  `domain_ssl` varchar(150) NOT NULL,
  `physical_uri` varchar(64) NOT NULL,
  `virtual_uri` varchar(64) NOT NULL,
  `main` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_shop_url`),
  UNIQUE KEY `full_shop_url` (`domain`,`physical_uri`,`virtual_uri`),
  UNIQUE KEY `full_shop_url_ssl` (`domain_ssl`,`physical_uri`,`virtual_uri`),
  KEY `id_shop` (`id_shop`,`main`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shop_url`
--

LOCK TABLES `tb_shop_url` WRITE;
/*!40000 ALTER TABLE `tb_shop_url` DISABLE KEYS */;
INSERT INTO `tb_shop_url` VALUES (1,1,'localhost','localhost','/','',1,1);
/*!40000 ALTER TABLE `tb_shop_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_smarty_cache`
--

DROP TABLE IF EXISTS `tb_smarty_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_smarty_cache` (
  `id_smarty_cache` char(40) NOT NULL,
  `name` char(40) NOT NULL,
  `cache_id` varchar(254) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id_smarty_cache`),
  KEY `name` (`name`),
  KEY `cache_id` (`cache_id`),
  KEY `modified` (`modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_smarty_cache`
--

LOCK TABLES `tb_smarty_cache` WRITE;
/*!40000 ALTER TABLE `tb_smarty_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_smarty_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_smarty_last_flush`
--

DROP TABLE IF EXISTS `tb_smarty_last_flush`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_smarty_last_flush` (
  `type` enum('compile','template') NOT NULL,
  `last_flush` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_smarty_last_flush`
--

LOCK TABLES `tb_smarty_last_flush` WRITE;
/*!40000 ALTER TABLE `tb_smarty_last_flush` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_smarty_last_flush` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_smarty_lazy_cache`
--

DROP TABLE IF EXISTS `tb_smarty_lazy_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_smarty_lazy_cache` (
  `template_hash` varchar(32) NOT NULL DEFAULT '',
  `cache_id` varchar(255) NOT NULL DEFAULT '',
  `compile_id` varchar(32) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`template_hash`,`cache_id`,`compile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_smarty_lazy_cache`
--

LOCK TABLES `tb_smarty_lazy_cache` WRITE;
/*!40000 ALTER TABLE `tb_smarty_lazy_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_smarty_lazy_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_specific_price`
--

DROP TABLE IF EXISTS `tb_specific_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_specific_price` (
  `id_specific_price` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  `id_cart` int(11) unsigned NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(11) unsigned NOT NULL,
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `id_product_attribute` int(10) unsigned NOT NULL,
  `price` decimal(20,6) NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT '1',
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price`),
  UNIQUE KEY `id_product_2` (`id_product`,`id_product_attribute`,`id_customer`,`id_cart`,`from`,`to`,`id_shop`,`id_shop_group`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`id_specific_price_rule`),
  KEY `id_product` (`id_product`,`id_shop`,`id_currency`,`id_country`,`id_group`,`id_customer`,`from_quantity`,`from`,`to`),
  KEY `from_quantity` (`from_quantity`),
  KEY `id_specific_price_rule` (`id_specific_price_rule`),
  KEY `id_cart` (`id_cart`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_shop` (`id_shop`),
  KEY `id_customer` (`id_customer`),
  KEY `from` (`from`),
  KEY `to` (`to`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_specific_price`
--

LOCK TABLES `tb_specific_price` WRITE;
/*!40000 ALTER TABLE `tb_specific_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_specific_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_specific_price_priority`
--

DROP TABLE IF EXISTS `tb_specific_price_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_specific_price_priority` (
  `id_specific_price_priority` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `priority` varchar(80) NOT NULL,
  PRIMARY KEY (`id_specific_price_priority`,`id_product`),
  UNIQUE KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_specific_price_priority`
--

LOCK TABLES `tb_specific_price_priority` WRITE;
/*!40000 ALTER TABLE `tb_specific_price_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_specific_price_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_specific_price_rule`
--

DROP TABLE IF EXISTS `tb_specific_price_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_specific_price_rule` (
  `id_specific_price_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_shop` int(11) unsigned NOT NULL DEFAULT '1',
  `id_currency` int(10) unsigned NOT NULL,
  `id_country` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  `from_quantity` mediumint(8) unsigned NOT NULL,
  `price` decimal(20,6) DEFAULT NULL,
  `reduction` decimal(20,6) NOT NULL,
  `reduction_tax` tinyint(1) NOT NULL DEFAULT '1',
  `reduction_type` enum('amount','percentage') NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`id_specific_price_rule`),
  KEY `id_product` (`id_shop`,`id_currency`,`id_country`,`id_group`,`from_quantity`,`from`,`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_specific_price_rule`
--

LOCK TABLES `tb_specific_price_rule` WRITE;
/*!40000 ALTER TABLE `tb_specific_price_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_specific_price_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_specific_price_rule_condition`
--

DROP TABLE IF EXISTS `tb_specific_price_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_specific_price_rule_condition` (
  `id_specific_price_rule_condition` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition`),
  KEY `id_specific_price_rule_condition_group` (`id_specific_price_rule_condition_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_specific_price_rule_condition`
--

LOCK TABLES `tb_specific_price_rule_condition` WRITE;
/*!40000 ALTER TABLE `tb_specific_price_rule_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_specific_price_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_specific_price_rule_condition_group`
--

DROP TABLE IF EXISTS `tb_specific_price_rule_condition_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_specific_price_rule_condition_group` (
  `id_specific_price_rule_condition_group` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_specific_price_rule` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_specific_price_rule_condition_group`,`id_specific_price_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_specific_price_rule_condition_group`
--

LOCK TABLES `tb_specific_price_rule_condition_group` WRITE;
/*!40000 ALTER TABLE `tb_specific_price_rule_condition_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_specific_price_rule_condition_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_state`
--

DROP TABLE IF EXISTS `tb_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_state` (
  `id_state` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(11) unsigned NOT NULL,
  `id_zone` int(11) unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `iso_code` varchar(7) NOT NULL,
  `tax_behavior` smallint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_state`),
  KEY `id_country` (`id_country`),
  KEY `name` (`name`),
  KEY `id_zone` (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_state`
--

LOCK TABLES `tb_state` WRITE;
/*!40000 ALTER TABLE `tb_state` DISABLE KEYS */;
INSERT INTO `tb_state` VALUES (1,21,2,'AA','AA',0,1),(2,21,2,'AE','AE',0,1),(3,21,2,'AP','AP',0,1),(4,21,2,'Alabama','AL',0,1),(5,21,2,'Alaska','AK',0,1),(6,21,2,'Arizona','AZ',0,1),(7,21,2,'Arkansas','AR',0,1),(8,21,2,'California','CA',0,1),(9,21,2,'Colorado','CO',0,1),(10,21,2,'Connecticut','CT',0,1),(11,21,2,'Delaware','DE',0,1),(12,21,2,'Florida','FL',0,1),(13,21,2,'Georgia','GA',0,1),(14,21,2,'Hawaii','HI',0,1),(15,21,2,'Idaho','ID',0,1),(16,21,2,'Illinois','IL',0,1),(17,21,2,'Indiana','IN',0,1),(18,21,2,'Iowa','IA',0,1),(19,21,2,'Kansas','KS',0,1),(20,21,2,'Kentucky','KY',0,1),(21,21,2,'Louisiana','LA',0,1),(22,21,2,'Maine','ME',0,1),(23,21,2,'Maryland','MD',0,1),(24,21,2,'Massachusetts','MA',0,1),(25,21,2,'Michigan','MI',0,1),(26,21,2,'Minnesota','MN',0,1),(27,21,2,'Mississippi','MS',0,1),(28,21,2,'Missouri','MO',0,1),(29,21,2,'Montana','MT',0,1),(30,21,2,'Nebraska','NE',0,1),(31,21,2,'Nevada','NV',0,1),(32,21,2,'New Hampshire','NH',0,1),(33,21,2,'New Jersey','NJ',0,1),(34,21,2,'New Mexico','NM',0,1),(35,21,2,'New York','NY',0,1),(36,21,2,'North Carolina','NC',0,1),(37,21,2,'North Dakota','ND',0,1),(38,21,2,'Ohio','OH',0,1),(39,21,2,'Oklahoma','OK',0,1),(40,21,2,'Oregon','OR',0,1),(41,21,2,'Pennsylvania','PA',0,1),(42,21,2,'Rhode Island','RI',0,1),(43,21,2,'South Carolina','SC',0,1),(44,21,2,'South Dakota','SD',0,1),(45,21,2,'Tennessee','TN',0,1),(46,21,2,'Texas','TX',0,1),(47,21,2,'Utah','UT',0,1),(48,21,2,'Vermont','VT',0,1),(49,21,2,'Virginia','VA',0,1),(50,21,2,'Washington','WA',0,1),(51,21,2,'West Virginia','WV',0,1),(52,21,2,'Wisconsin','WI',0,1),(53,21,2,'Wyoming','WY',0,1),(54,21,2,'Puerto Rico','PR',0,1),(55,21,2,'US Virgin Islands','VI',0,1),(56,21,2,'District of Columbia','DC',0,1),(57,145,2,'Aguascalientes','AGS',0,1),(58,145,2,'Baja California','BCN',0,1),(59,145,2,'Baja California Sur','BCS',0,1),(60,145,2,'Campeche','CAM',0,1),(61,145,2,'Chiapas','CHP',0,1),(62,145,2,'Chihuahua','CHH',0,1),(63,145,2,'Coahuila','COA',0,1),(64,145,2,'Colima','COL',0,1),(65,145,2,'Distrito Federal','DIF',0,1),(66,145,2,'Durango','DUR',0,1),(67,145,2,'Guanajuato','GUA',0,1),(68,145,2,'Guerrero','GRO',0,1),(69,145,2,'Hidalgo','HID',0,1),(70,145,2,'Jalisco','JAL',0,1),(71,145,2,'Estado de MÃ©xico','MEX',0,1),(72,145,2,'MichoacÃ¡n','MIC',0,1),(73,145,2,'Morelos','MOR',0,1),(74,145,2,'Nayarit','NAY',0,1),(75,145,2,'Nuevo LeÃ³n','NLE',0,1),(76,145,2,'Oaxaca','OAX',0,1),(77,145,2,'Puebla','PUE',0,1),(78,145,2,'QuerÃ©taro','QUE',0,1),(79,145,2,'Quintana Roo','ROO',0,1),(80,145,2,'San Luis PotosÃ­','SLP',0,1),(81,145,2,'Sinaloa','SIN',0,1),(82,145,2,'Sonora','SON',0,1),(83,145,2,'Tabasco','TAB',0,1),(84,145,2,'Tamaulipas','TAM',0,1),(85,145,2,'Tlaxcala','TLA',0,1),(86,145,2,'Veracruz','VER',0,1),(87,145,2,'YucatÃ¡n','YUC',0,1),(88,145,2,'Zacatecas','ZAC',0,1),(89,4,2,'Ontario','ON',0,1),(90,4,2,'Quebec','QC',0,1),(91,4,2,'British Columbia','BC',0,1),(92,4,2,'Alberta','AB',0,1),(93,4,2,'Manitoba','MB',0,1),(94,4,2,'Saskatchewan','SK',0,1),(95,4,2,'Nova Scotia','NS',0,1),(96,4,2,'New Brunswick','NB',0,1),(97,4,2,'Newfoundland and Labrador','NL',0,1),(98,4,2,'Prince Edward Island','PE',0,1),(99,4,2,'Northwest Territories','NT',0,1),(100,4,2,'Yukon','YT',0,1),(101,4,2,'Nunavut','NU',0,1),(102,44,6,'Buenos Aires','B',0,1),(103,44,6,'Catamarca','K',0,1),(104,44,6,'Chaco','H',0,1),(105,44,6,'Chubut','U',0,1),(106,44,6,'Ciudad de Buenos Aires','C',0,1),(107,44,6,'CÃ³rdoba','X',0,1),(108,44,6,'Corrientes','W',0,1),(109,44,6,'Entre RÃ­os','E',0,1),(110,44,6,'Formosa','P',0,1),(111,44,6,'Jujuy','Y',0,1),(112,44,6,'La Pampa','L',0,1),(113,44,6,'La Rioja','F',0,1),(114,44,6,'Mendoza','M',0,1),(115,44,6,'Misiones','N',0,1),(116,44,6,'NeuquÃ©n','Q',0,1),(117,44,6,'RÃ­o Negro','R',0,1),(118,44,6,'Salta','A',0,1),(119,44,6,'San Juan','J',0,1),(120,44,6,'San Luis','D',0,1),(121,44,6,'Santa Cruz','Z',0,1),(122,44,6,'Santa Fe','S',0,1),(123,44,6,'Santiago del Estero','G',0,1),(124,44,6,'Tierra del Fuego','V',0,1),(125,44,6,'TucumÃ¡n','T',0,1),(126,10,1,'Agrigento','AG',0,1),(127,10,1,'Alessandria','AL',0,1),(128,10,1,'Ancona','AN',0,1),(129,10,1,'Aosta','AO',0,1),(130,10,1,'Arezzo','AR',0,1),(131,10,1,'Ascoli Piceno','AP',0,1),(132,10,1,'Asti','AT',0,1),(133,10,1,'Avellino','AV',0,1),(134,10,1,'Bari','BA',0,1),(135,10,1,'Barletta-Andria-Trani','BT',0,1),(136,10,1,'Belluno','BL',0,1),(137,10,1,'Benevento','BN',0,1),(138,10,1,'Bergamo','BG',0,1),(139,10,1,'Biella','BI',0,1),(140,10,1,'Bologna','BO',0,1),(141,10,1,'Bolzano','BZ',0,1),(142,10,1,'Brescia','BS',0,1),(143,10,1,'Brindisi','BR',0,1),(144,10,1,'Cagliari','CA',0,1),(145,10,1,'Caltanissetta','CL',0,1),(146,10,1,'Campobasso','CB',0,1),(147,10,1,'Carbonia-Iglesias','CI',0,1),(148,10,1,'Caserta','CE',0,1),(149,10,1,'Catania','CT',0,1),(150,10,1,'Catanzaro','CZ',0,1),(151,10,1,'Chieti','CH',0,1),(152,10,1,'Como','CO',0,1),(153,10,1,'Cosenza','CS',0,1),(154,10,1,'Cremona','CR',0,1),(155,10,1,'Crotone','KR',0,1),(156,10,1,'Cuneo','CN',0,1),(157,10,1,'Enna','EN',0,1),(158,10,1,'Fermo','FM',0,1),(159,10,1,'Ferrara','FE',0,1),(160,10,1,'Firenze','FI',0,1),(161,10,1,'Foggia','FG',0,1),(162,10,1,'ForlÃ¬-Cesena','FC',0,1),(163,10,1,'Frosinone','FR',0,1),(164,10,1,'Genova','GE',0,1),(165,10,1,'Gorizia','GO',0,1),(166,10,1,'Grosseto','GR',0,1),(167,10,1,'Imperia','IM',0,1),(168,10,1,'Isernia','IS',0,1),(169,10,1,'L\'Aquila','AQ',0,1),(170,10,1,'La Spezia','SP',0,1),(171,10,1,'Latina','LT',0,1),(172,10,1,'Lecce','LE',0,1),(173,10,1,'Lecco','LC',0,1),(174,10,1,'Livorno','LI',0,1),(175,10,1,'Lodi','LO',0,1),(176,10,1,'Lucca','LU',0,1),(177,10,1,'Macerata','MC',0,1),(178,10,1,'Mantova','MN',0,1),(179,10,1,'Massa','MS',0,1),(180,10,1,'Matera','MT',0,1),(181,10,1,'Medio Campidano','VS',0,1),(182,10,1,'Messina','ME',0,1),(183,10,1,'Milano','MI',0,1),(184,10,1,'Modena','MO',0,1),(185,10,1,'Monza e della Brianza','MB',0,1),(186,10,1,'Napoli','NA',0,1),(187,10,1,'Novara','NO',0,1),(188,10,1,'Nuoro','NU',0,1),(189,10,1,'Ogliastra','OG',0,1),(190,10,1,'Olbia-Tempio','OT',0,1),(191,10,1,'Oristano','OR',0,1),(192,10,1,'Padova','PD',0,1),(193,10,1,'Palermo','PA',0,1),(194,10,1,'Parma','PR',0,1),(195,10,1,'Pavia','PV',0,1),(196,10,1,'Perugia','PG',0,1),(197,10,1,'Pesaro-Urbino','PU',0,1),(198,10,1,'Pescara','PE',0,1),(199,10,1,'Piacenza','PC',0,1),(200,10,1,'Pisa','PI',0,1),(201,10,1,'Pistoia','PT',0,1),(202,10,1,'Pordenone','PN',0,1),(203,10,1,'Potenza','PZ',0,1),(204,10,1,'Prato','PO',0,1),(205,10,1,'Ragusa','RG',0,1),(206,10,1,'Ravenna','RA',0,1),(207,10,1,'Reggio Calabria','RC',0,1),(208,10,1,'Reggio Emilia','RE',0,1),(209,10,1,'Rieti','RI',0,1),(210,10,1,'Rimini','RN',0,1),(211,10,1,'Roma','RM',0,1),(212,10,1,'Rovigo','RO',0,1),(213,10,1,'Salerno','SA',0,1),(214,10,1,'Sassari','SS',0,1),(215,10,1,'Savona','SV',0,1),(216,10,1,'Siena','SI',0,1),(217,10,1,'Siracusa','SR',0,1),(218,10,1,'Sondrio','SO',0,1),(219,10,1,'Taranto','TA',0,1),(220,10,1,'Teramo','TE',0,1),(221,10,1,'Terni','TR',0,1),(222,10,1,'Torino','TO',0,1),(223,10,1,'Trapani','TP',0,1),(224,10,1,'Trento','TN',0,1),(225,10,1,'Treviso','TV',0,1),(226,10,1,'Trieste','TS',0,1),(227,10,1,'Udine','UD',0,1),(228,10,1,'Varese','VA',0,1),(229,10,1,'Venezia','VE',0,1),(230,10,1,'Verbano-Cusio-Ossola','VB',0,1),(231,10,1,'Vercelli','VC',0,1),(232,10,1,'Verona','VR',0,1),(233,10,1,'Vibo Valentia','VV',0,1),(234,10,1,'Vicenza','VI',0,1),(235,10,1,'Viterbo','VT',0,1),(236,111,3,'Aceh','ID-AC',0,1),(237,111,3,'Bali','ID-BA',0,1),(238,111,3,'Banten','ID-BT',0,1),(239,111,3,'Bengkulu','ID-BE',0,1),(240,111,3,'Gorontalo','ID-GO',0,1),(241,111,3,'Jakarta','ID-JK',0,1),(242,111,3,'Jambi','ID-JA',0,1),(243,111,3,'Jawa Barat','ID-JB',0,1),(244,111,3,'Jawa Tengah','ID-JT',0,1),(245,111,3,'Jawa Timur','ID-JI',0,1),(246,111,3,'Kalimantan Barat','ID-KB',0,1),(247,111,3,'Kalimantan Selatan','ID-KS',0,1),(248,111,3,'Kalimantan Tengah','ID-KT',0,1),(249,111,3,'Kalimantan Timur','ID-KI',0,1),(250,111,3,'Kalimantan Utara','ID-KU',0,1),(251,111,3,'Kepulauan Bangka Belitug','ID-BB',0,1),(252,111,3,'Kepulauan Riau','ID-KR',0,1),(253,111,3,'Lampung','ID-LA',0,1),(254,111,3,'Maluku','ID-MA',0,1),(255,111,3,'Maluku Utara','ID-MU',0,1),(256,111,3,'Nusa Tengara Barat','ID-NB',0,1),(257,111,3,'Nusa Tenggara Timur','ID-NT',0,1),(258,111,3,'Papua','ID-PA',0,1),(259,111,3,'Papua Barat','ID-PB',0,1),(260,111,3,'Riau','ID-RI',0,1),(261,111,3,'Sulawesi Barat','ID-SR',0,1),(262,111,3,'Sulawesi Selatan','ID-SN',0,1),(263,111,3,'Sulawesi Tengah','ID-ST',0,1),(264,111,3,'Sulawesi Tenggara','ID-SG',0,1),(265,111,3,'Sulawesi Utara','ID-SA',0,1),(266,111,3,'Sumatera Barat','ID-SB',0,1),(267,111,3,'Sumatera Selatan','ID-SS',0,1),(268,111,3,'Sumatera Utara','ID-SU',0,1),(269,111,3,'Yogyakarta','ID-YO',0,1),(270,11,3,'Aichi','23',0,1),(271,11,3,'Akita','05',0,1),(272,11,3,'Aomori','02',0,1),(273,11,3,'Chiba','12',0,1),(274,11,3,'Ehime','38',0,1),(275,11,3,'Fukui','18',0,1),(276,11,3,'Fukuoka','40',0,1),(277,11,3,'Fukushima','07',0,1),(278,11,3,'Gifu','21',0,1),(279,11,3,'Gunma','10',0,1),(280,11,3,'Hiroshima','34',0,1),(281,11,3,'Hokkaido','01',0,1),(282,11,3,'Hyogo','28',0,1),(283,11,3,'Ibaraki','08',0,1),(284,11,3,'Ishikawa','17',0,1),(285,11,3,'Iwate','03',0,1),(286,11,3,'Kagawa','37',0,1),(287,11,3,'Kagoshima','46',0,1),(288,11,3,'Kanagawa','14',0,1),(289,11,3,'Kochi','39',0,1),(290,11,3,'Kumamoto','43',0,1),(291,11,3,'Kyoto','26',0,1),(292,11,3,'Mie','24',0,1),(293,11,3,'Miyagi','04',0,1),(294,11,3,'Miyazaki','45',0,1),(295,11,3,'Nagano','20',0,1),(296,11,3,'Nagasaki','42',0,1),(297,11,3,'Nara','29',0,1),(298,11,3,'Niigata','15',0,1),(299,11,3,'Oita','44',0,1),(300,11,3,'Okayama','33',0,1),(301,11,3,'Okinawa','47',0,1),(302,11,3,'Osaka','27',0,1),(303,11,3,'Saga','41',0,1),(304,11,3,'Saitama','11',0,1),(305,11,3,'Shiga','25',0,1),(306,11,3,'Shimane','32',0,1),(307,11,3,'Shizuoka','22',0,1),(308,11,3,'Tochigi','09',0,1),(309,11,3,'Tokushima','36',0,1),(310,11,3,'Tokyo','13',0,1),(311,11,3,'Tottori','31',0,1),(312,11,3,'Toyama','16',0,1),(313,11,3,'Wakayama','30',0,1),(314,11,3,'Yamagata','06',0,1),(315,11,3,'Yamaguchi','35',0,1),(316,11,3,'Yamanashi','19',0,1),(317,24,5,'Australian Capital Territory','ACT',0,1),(318,24,5,'New South Wales','NSW',0,1),(319,24,5,'Northern Territory','NT',0,1),(320,24,5,'Queensland','QLD',0,1),(321,24,5,'South Australia','SA',0,1),(322,24,5,'Tasmania','TAS',0,1),(323,24,5,'Victoria','VIC',0,1),(324,24,5,'Western Australia','WA',0,1),(325,58,6,'Acre','AC',0,1),(326,58,6,'Alagoas','AL',0,1),(327,58,6,'AmapÃ¡','AP',0,1),(328,58,6,'Amazonas','AM',0,1),(329,58,6,'Bahia','BA',0,1),(330,58,6,'CearÃ¡','CE',0,1),(331,58,6,'Distrito Federal','DF',0,1),(332,58,6,'EspÃ­rito Santo','ES',0,1),(333,58,6,'GoiÃ¡s','GO',0,1),(334,58,6,'MaranhÃ£o','MA',0,1),(335,58,6,'Mato Grosso','MT',0,1),(336,58,6,'Mato Grosso do Sul','MS',0,1),(337,58,6,'Minas Gerais','MG',0,1),(338,58,6,'ParÃ¡','PA',0,1),(339,58,6,'ParaÃ­ba','PB',0,1),(340,58,6,'ParanÃ¡','PR',0,1),(341,58,6,'Pernambuco','PE',0,1),(342,58,6,'PiauÃ­','PI',0,1),(343,58,6,'Rio de Janeiro','RJ',0,1),(344,58,6,'Rio Grande do Norte','RN',0,1),(345,58,6,'Rio Grande do Sul','RS',0,1),(346,58,6,'RondÃ´nia','RO',0,1),(347,58,6,'Roraima','RR',0,1),(348,58,6,'Santa Catarina','SC',0,1),(349,58,6,'SÃ£o Paulo','SP',0,1),(350,58,6,'Sergipe','SE',0,1),(351,58,6,'Tocantins','TO',0,1);
/*!40000 ALTER TABLE `tb_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_statssearch`
--

DROP TABLE IF EXISTS `tb_statssearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_statssearch` (
  `id_statssearch` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_shop` int(10) unsigned NOT NULL DEFAULT '1',
  `id_shop_group` int(10) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL,
  `results` int(6) NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_statssearch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_statssearch`
--

LOCK TABLES `tb_statssearch` WRITE;
/*!40000 ALTER TABLE `tb_statssearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_statssearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock`
--

DROP TABLE IF EXISTS `tb_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock` (
  `id_stock` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(32) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `physical_quantity` int(11) unsigned NOT NULL,
  `usable_quantity` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id_stock`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock`
--

LOCK TABLES `tb_stock` WRITE;
/*!40000 ALTER TABLE `tb_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_available`
--

DROP TABLE IF EXISTS `tb_stock_available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_available` (
  `id_stock_available` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  `id_shop_group` int(11) unsigned NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `physical_quantity` int(11) NOT NULL DEFAULT '0',
  `reserved_quantity` int(11) NOT NULL DEFAULT '0',
  `depends_on_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `out_of_stock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_stock_available`),
  UNIQUE KEY `product_sqlstock` (`id_product`,`id_product_attribute`,`id_shop`,`id_shop_group`),
  KEY `id_shop` (`id_shop`),
  KEY `id_shop_group` (`id_shop_group`),
  KEY `id_product` (`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_available`
--

LOCK TABLES `tb_stock_available` WRITE;
/*!40000 ALTER TABLE `tb_stock_available` DISABLE KEYS */;
INSERT INTO `tb_stock_available` VALUES (53,7,0,1,0,0,0,0,0,0),(54,6,0,1,0,0,0,0,0,0),(55,5,0,1,0,0,0,0,0,0),(56,4,0,1,0,0,0,0,0,0),(57,3,0,1,0,0,0,0,0,0),(58,2,0,1,0,0,0,0,0,0),(59,1,0,1,0,0,0,0,0,0),(60,8,0,1,0,1,1,0,0,1);
/*!40000 ALTER TABLE `tb_stock_available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_mvt`
--

DROP TABLE IF EXISTS `tb_stock_mvt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_mvt` (
  `id_stock_mvt` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_stock` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_supply_order` int(11) DEFAULT NULL,
  `id_stock_mvt_reason` int(11) NOT NULL,
  `id_employee` int(11) NOT NULL,
  `employee_lastname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_firstname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `physical_quantity` int(11) NOT NULL,
  `date_add` datetime NOT NULL,
  `sign` smallint(6) NOT NULL DEFAULT '1',
  `price_te` decimal(20,6) DEFAULT '0.000000',
  `last_wa` decimal(20,6) DEFAULT '0.000000',
  `current_wa` decimal(20,6) DEFAULT '0.000000',
  `referer` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_stock_mvt`),
  KEY `id_stock` (`id_stock`),
  KEY `id_stock_mvt_reason` (`id_stock_mvt_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_mvt`
--

LOCK TABLES `tb_stock_mvt` WRITE;
/*!40000 ALTER TABLE `tb_stock_mvt` DISABLE KEYS */;
INSERT INTO `tb_stock_mvt` VALUES (1,60,NULL,NULL,11,1,'Araujo Berbet','Thiago',1,'2018-01-17 10:19:50',1,0.000000,0.000000,0.000000,NULL);
/*!40000 ALTER TABLE `tb_stock_mvt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_mvt_reason`
--

DROP TABLE IF EXISTS `tb_stock_mvt_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_mvt_reason` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sign` tinyint(1) NOT NULL DEFAULT '1',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_stock_mvt_reason`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_mvt_reason`
--

LOCK TABLES `tb_stock_mvt_reason` WRITE;
/*!40000 ALTER TABLE `tb_stock_mvt_reason` DISABLE KEYS */;
INSERT INTO `tb_stock_mvt_reason` VALUES (1,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(2,-1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(3,-1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(4,-1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(5,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(6,-1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(7,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(8,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(9,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(10,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(11,1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0),(12,-1,'2018-01-17 09:45:59','2018-01-17 09:45:59',0);
/*!40000 ALTER TABLE `tb_stock_mvt_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_stock_mvt_reason_lang`
--

DROP TABLE IF EXISTS `tb_stock_mvt_reason_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_stock_mvt_reason_lang` (
  `id_stock_mvt_reason` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stock_mvt_reason`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_stock_mvt_reason_lang`
--

LOCK TABLES `tb_stock_mvt_reason_lang` WRITE;
/*!40000 ALTER TABLE `tb_stock_mvt_reason_lang` DISABLE KEYS */;
INSERT INTO `tb_stock_mvt_reason_lang` VALUES (1,1,'Aumentar'),(1,2,'Aumento'),(2,1,'Diminuir'),(2,2,'Diminuir'),(3,1,'Customer Order'),(3,2,'Encomenda de cliente'),(4,1,'Regulation following an inventory of stock'),(4,2,'Regulamento, seguindo um inventÃ¡rio de estoque'),(5,1,'Regulation following an inventory of stock'),(5,2,'Regulamento, seguindo um inventÃ¡rio de estoque'),(6,1,'Transfer to another warehouse'),(6,2,'Transferir para outro armazÃ©m'),(7,1,'Transfer from another warehouse'),(7,2,'Transferir de outro armazÃ©m'),(8,1,'Supply Order'),(8,2,'Pedido de fornecimento'),(9,1,'Customer Order'),(9,2,'Encomenda de cliente'),(10,1,'Product Return'),(10,2,'DevoluÃ§Ã£o de produto'),(11,1,'Employee Edition'),(11,2,'EdiÃ§Ã£o do funcionÃ¡rio'),(12,1,'Employee Edition'),(12,2,'EdiÃ§Ã£o do funcionÃ¡rio');
/*!40000 ALTER TABLE `tb_stock_mvt_reason_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store`
--

DROP TABLE IF EXISTS `tb_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store` (
  `id_store` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_country` int(10) unsigned NOT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `address1` varchar(128) NOT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `postcode` varchar(12) NOT NULL,
  `latitude` decimal(13,8) DEFAULT NULL,
  `longitude` decimal(13,8) DEFAULT NULL,
  `hours` text,
  `phone` varchar(16) DEFAULT NULL,
  `fax` varchar(16) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `note` text,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_store`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store`
--

LOCK TABLES `tb_store` WRITE;
/*!40000 ALTER TABLE `tb_store` DISABLE KEYS */;
INSERT INTO `tb_store` VALUES (1,21,12,'Dade County','3030 SW 8th St Miami','','Miami',' 33135',25.76500500,-80.24379700,' [[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"10:00 - 16:00\"],[\"10:00 - 16:00\"]]','','','','',1,'2018-01-17 09:46:04','2018-01-17 09:46:04'),(2,21,12,'E Fort Lauderdale','1000 Northeast 4th Ave Fort Lauderdale','','Miami',' 33304',26.13793600,-80.13943500,' [[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"10:00 - 16:00\"],[\"10:00 - 16:00\"]]','','','','',1,'2018-01-17 09:46:04','2018-01-17 09:46:04'),(3,21,12,'Pembroke Pines','11001 Pines Blvd Pembroke Pines','','Miami','33026',26.00998700,-80.29447200,' [[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"10:00 - 16:00\"],[\"10:00 - 16:00\"]]','','','','',1,'2018-01-17 09:46:04','2018-01-17 09:46:04'),(4,21,12,'Coconut Grove','2999 SW 32nd Avenue','','Miami',' 33133',25.73629600,-80.24479700,' [[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"10:00 - 16:00\"],[\"10:00 - 16:00\"]]','','','','',1,'2018-01-17 09:46:04','2018-01-17 09:46:04'),(5,21,12,'N Miami/Biscayne','12055 Biscayne Blvd','','Miami','33181',25.88674000,-80.16329200,' [[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"09:00 - 19:00\"],[\"10:00 - 16:00\"],[\"10:00 - 16:00\"]]','','','','',1,'2018-01-17 09:46:04','2018-01-17 09:46:04');
/*!40000 ALTER TABLE `tb_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_store_shop`
--

DROP TABLE IF EXISTS `tb_store_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_store_shop` (
  `id_store` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_store`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_store_shop`
--

LOCK TABLES `tb_store_shop` WRITE;
/*!40000 ALTER TABLE `tb_store_shop` DISABLE KEYS */;
INSERT INTO `tb_store_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `tb_store_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supplier`
--

DROP TABLE IF EXISTS `tb_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supplier` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supplier`
--

LOCK TABLES `tb_supplier` WRITE;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supplier_lang`
--

DROP TABLE IF EXISTS `tb_supplier_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supplier_lang` (
  `id_supplier` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `description` text,
  `meta_title` varchar(128) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supplier_lang`
--

LOCK TABLES `tb_supplier_lang` WRITE;
/*!40000 ALTER TABLE `tb_supplier_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supplier_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supplier_shop`
--

DROP TABLE IF EXISTS `tb_supplier_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supplier_shop` (
  `id_supplier` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_supplier`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supplier_shop`
--

LOCK TABLES `tb_supplier_shop` WRITE;
/*!40000 ALTER TABLE `tb_supplier_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supplier_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supply_order`
--

DROP TABLE IF EXISTS `tb_supply_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supply_order` (
  `id_supply_order` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(11) unsigned NOT NULL,
  `supplier_name` varchar(64) NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_ref_currency` int(11) unsigned NOT NULL,
  `reference` varchar(64) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  `date_delivery_expected` datetime DEFAULT NULL,
  `total_te` decimal(20,6) DEFAULT '0.000000',
  `total_with_discount_te` decimal(20,6) DEFAULT '0.000000',
  `total_tax` decimal(20,6) DEFAULT '0.000000',
  `total_ti` decimal(20,6) DEFAULT '0.000000',
  `discount_rate` decimal(20,6) DEFAULT '0.000000',
  `discount_value_te` decimal(20,6) DEFAULT '0.000000',
  `is_template` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_supply_order`),
  KEY `id_supplier` (`id_supplier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `reference` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supply_order`
--

LOCK TABLES `tb_supply_order` WRITE;
/*!40000 ALTER TABLE `tb_supply_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supply_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supply_order_detail`
--

DROP TABLE IF EXISTS `tb_supply_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supply_order_detail` (
  `id_supply_order_detail` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_currency` int(11) unsigned NOT NULL,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `reference` varchar(32) NOT NULL,
  `supplier_reference` varchar(32) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ean13` varchar(13) DEFAULT NULL,
  `isbn` varchar(32) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `exchange_rate` decimal(20,6) DEFAULT '0.000000',
  `unit_price_te` decimal(20,6) DEFAULT '0.000000',
  `quantity_expected` int(11) unsigned NOT NULL,
  `quantity_received` int(11) unsigned NOT NULL,
  `price_te` decimal(20,6) DEFAULT '0.000000',
  `discount_rate` decimal(20,6) DEFAULT '0.000000',
  `discount_value_te` decimal(20,6) DEFAULT '0.000000',
  `price_with_discount_te` decimal(20,6) DEFAULT '0.000000',
  `tax_rate` decimal(20,6) DEFAULT '0.000000',
  `tax_value` decimal(20,6) DEFAULT '0.000000',
  `price_ti` decimal(20,6) DEFAULT '0.000000',
  `tax_value_with_order_discount` decimal(20,6) DEFAULT '0.000000',
  `price_with_order_discount_te` decimal(20,6) DEFAULT '0.000000',
  PRIMARY KEY (`id_supply_order_detail`),
  KEY `id_supply_order` (`id_supply_order`,`id_product`),
  KEY `id_product_attribute` (`id_product_attribute`),
  KEY `id_product_product_attribute` (`id_product`,`id_product_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supply_order_detail`
--

LOCK TABLES `tb_supply_order_detail` WRITE;
/*!40000 ALTER TABLE `tb_supply_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supply_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supply_order_history`
--

DROP TABLE IF EXISTS `tb_supply_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supply_order_history` (
  `id_supply_order_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_state` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_history`),
  KEY `id_supply_order` (`id_supply_order`),
  KEY `id_employee` (`id_employee`),
  KEY `id_state` (`id_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supply_order_history`
--

LOCK TABLES `tb_supply_order_history` WRITE;
/*!40000 ALTER TABLE `tb_supply_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supply_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supply_order_receipt_history`
--

DROP TABLE IF EXISTS `tb_supply_order_receipt_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supply_order_receipt_history` (
  `id_supply_order_receipt_history` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_supply_order_detail` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `employee_lastname` varchar(32) DEFAULT '',
  `employee_firstname` varchar(32) DEFAULT '',
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id_supply_order_receipt_history`),
  KEY `id_supply_order_detail` (`id_supply_order_detail`),
  KEY `id_supply_order_state` (`id_supply_order_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supply_order_receipt_history`
--

LOCK TABLES `tb_supply_order_receipt_history` WRITE;
/*!40000 ALTER TABLE `tb_supply_order_receipt_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_supply_order_receipt_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supply_order_state`
--

DROP TABLE IF EXISTS `tb_supply_order_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supply_order_state` (
  `id_supply_order_state` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_note` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `receipt_state` tinyint(1) NOT NULL DEFAULT '0',
  `pending_receipt` tinyint(1) NOT NULL DEFAULT '0',
  `enclosed` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supply_order_state`
--

LOCK TABLES `tb_supply_order_state` WRITE;
/*!40000 ALTER TABLE `tb_supply_order_state` DISABLE KEYS */;
INSERT INTO `tb_supply_order_state` VALUES (1,0,1,0,0,0,'#faab00'),(2,1,0,0,0,0,'#273cff'),(3,0,0,0,1,0,'#ff37f5'),(4,0,0,1,1,0,'#ff3e33'),(5,0,0,1,0,1,'#00d60c'),(6,0,0,0,0,1,'#666666');
/*!40000 ALTER TABLE `tb_supply_order_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supply_order_state_lang`
--

DROP TABLE IF EXISTS `tb_supply_order_state_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supply_order_state_lang` (
  `id_supply_order_state` int(11) unsigned NOT NULL,
  `id_lang` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id_supply_order_state`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supply_order_state_lang`
--

LOCK TABLES `tb_supply_order_state_lang` WRITE;
/*!40000 ALTER TABLE `tb_supply_order_state_lang` DISABLE KEYS */;
INSERT INTO `tb_supply_order_state_lang` VALUES (1,1,'1 - CriaÃ§Ã£o em progresso'),(1,2,'1 - CriaÃ§Ã£o em progresso'),(2,1,'2 - Encomenda validada'),(2,2,'2 - Encomenda validada'),(3,1,'3 - A aguardar receÃ§Ã£o'),(3,2,'3 - A aguardar receÃ§Ã£o'),(4,1,'4 - Encomenda recebida em parte'),(4,2,'4 - Encomenda recebida em parte'),(5,1,'5 - Encomenda recebida na totalidade'),(5,2,'5 - Encomenda recebida na totalidade'),(6,1,'6 - Encomenda cancelada'),(6,2,'6 - Encomenda cancelada');
/*!40000 ALTER TABLE `tb_supply_order_state_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tab`
--

DROP TABLE IF EXISTS `tb_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tab` (
  `id_tab` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `module` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `hide_host_mode` tinyint(1) NOT NULL,
  `icon` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tab`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tab`
--

LOCK TABLES `tb_tab` WRITE;
/*!40000 ALTER TABLE `tb_tab` DISABLE KEYS */;
INSERT INTO `tb_tab` VALUES (1,0,0,NULL,'AdminDashboard',1,0,'trending_up'),(2,0,1,NULL,'SELL',1,0,''),(3,2,0,NULL,'AdminParentOrders',1,0,'shopping_basket'),(4,3,0,NULL,'AdminOrders',1,0,''),(5,3,1,NULL,'AdminInvoices',1,0,''),(6,3,2,NULL,'AdminSlip',1,0,''),(7,3,3,NULL,'AdminDeliverySlip',1,0,''),(8,3,4,NULL,'AdminCarts',1,0,''),(9,2,1,NULL,'AdminCatalog',1,0,'store'),(10,9,0,NULL,'AdminProducts',1,0,''),(11,9,1,NULL,'AdminCategories',1,0,''),(12,9,2,NULL,'AdminTracking',1,0,''),(13,9,3,NULL,'AdminParentAttributesGroups',1,0,''),(14,13,0,NULL,'AdminAttributesGroups',1,0,''),(15,13,1,NULL,'AdminFeatures',1,0,''),(16,9,4,NULL,'AdminParentManufacturers',1,0,''),(17,16,0,NULL,'AdminManufacturers',1,0,''),(18,16,1,NULL,'AdminSuppliers',1,0,''),(19,9,5,NULL,'AdminAttachments',1,0,''),(20,9,6,NULL,'AdminParentCartRules',1,0,''),(21,20,0,NULL,'AdminCartRules',1,0,''),(22,20,1,NULL,'AdminSpecificPriceRule',1,0,''),(23,9,7,NULL,'AdminStockManagement',1,0,''),(24,2,2,NULL,'AdminParentCustomer',1,0,'account_circle'),(25,24,0,NULL,'AdminCustomers',1,0,''),(26,24,1,NULL,'AdminAddresses',1,0,''),(27,24,2,NULL,'AdminOutstanding',0,0,''),(28,2,3,NULL,'AdminParentCustomerThreads',1,0,'chat'),(29,28,0,NULL,'AdminCustomerThreads',1,0,''),(30,28,1,NULL,'AdminOrderMessage',1,0,''),(31,28,2,NULL,'AdminReturn',1,0,''),(32,2,4,NULL,'AdminStats',1,0,'assessment'),(33,2,5,NULL,'AdminStock',1,0,'store'),(34,33,0,NULL,'AdminWarehouses',1,0,''),(35,33,1,NULL,'AdminParentStockManagement',1,0,''),(36,35,0,NULL,'AdminStockManagement',1,0,''),(37,36,0,NULL,'AdminStockMvt',1,0,''),(38,36,1,NULL,'AdminStockInstantState',1,0,''),(39,36,2,NULL,'AdminStockCover',1,0,''),(40,33,2,NULL,'AdminSupplyOrders',1,0,''),(41,33,3,NULL,'AdminStockConfiguration',1,0,''),(42,0,2,NULL,'IMPROVE',1,0,''),(43,42,0,NULL,'AdminParentModulesSf',1,0,'extension'),(44,43,0,NULL,'AdminModulesSf',1,0,''),(45,43,1,NULL,'AdminModules',0,0,''),(46,43,2,NULL,'AdminAddonsCatalog',1,0,''),(47,42,1,NULL,'AdminParentThemes',1,0,'desktop_mac'),(48,47,0,NULL,'AdminThemes',1,0,''),(49,47,1,NULL,'AdminThemesCatalog',1,0,''),(50,47,2,NULL,'AdminCmsContent',1,0,''),(51,47,3,NULL,'AdminModulesPositions',1,0,''),(52,47,4,NULL,'AdminImages',1,0,''),(53,42,2,NULL,'AdminParentShipping',1,0,'local_shipping'),(54,53,0,NULL,'AdminCarriers',1,0,''),(55,53,1,NULL,'AdminShipping',1,0,''),(56,42,3,NULL,'AdminParentPayment',1,0,'payment'),(57,56,0,NULL,'AdminPayment',1,0,''),(58,56,1,NULL,'AdminPaymentPreferences',1,0,''),(59,42,4,NULL,'AdminInternational',1,0,'language'),(60,59,0,NULL,'AdminParentLocalization',1,0,''),(61,60,0,NULL,'AdminLocalization',1,0,''),(62,60,1,NULL,'AdminLanguages',1,0,''),(63,60,2,NULL,'AdminCurrencies',1,0,''),(64,60,3,NULL,'AdminGeolocation',1,0,''),(65,59,1,NULL,'AdminParentCountries',1,0,''),(66,65,0,NULL,'AdminCountries',1,0,''),(67,65,1,NULL,'AdminZones',1,0,''),(68,65,2,NULL,'AdminStates',1,0,''),(69,59,2,NULL,'AdminParentTaxes',1,0,''),(70,69,0,NULL,'AdminTaxes',1,0,''),(71,69,1,NULL,'AdminTaxRulesGroup',1,0,''),(72,59,3,NULL,'AdminTranslations',1,0,''),(73,0,3,NULL,'CONFIGURE',1,0,''),(74,73,0,NULL,'ShopParameters',1,0,'settings'),(75,74,0,NULL,'AdminParentPreferences',1,0,''),(76,75,0,NULL,'AdminPreferences',1,0,''),(77,75,1,NULL,'AdminMaintenance',1,0,''),(78,74,1,NULL,'AdminParentOrderPreferences',1,0,''),(79,78,0,NULL,'AdminOrderPreferences',1,0,''),(80,78,1,NULL,'AdminStatuses',1,0,''),(81,74,2,NULL,'AdminPPreferences',1,0,''),(82,74,3,NULL,'AdminParentCustomerPreferences',1,0,''),(83,82,0,NULL,'AdminCustomerPreferences',1,0,''),(84,82,1,NULL,'AdminGroups',1,0,''),(85,82,2,NULL,'AdminGenders',1,0,''),(86,74,4,NULL,'AdminParentStores',1,0,''),(87,86,0,NULL,'AdminContacts',1,0,''),(88,86,1,NULL,'AdminStores',1,0,''),(89,74,5,NULL,'AdminParentMeta',1,0,''),(90,89,0,NULL,'AdminMeta',1,0,''),(91,89,1,NULL,'AdminSearchEngines',1,0,''),(92,89,2,NULL,'AdminReferrers',1,0,''),(93,74,6,NULL,'AdminParentSearchConf',1,0,''),(94,93,0,NULL,'AdminSearchConf',1,0,''),(95,93,1,NULL,'AdminTags',1,0,''),(96,73,1,NULL,'AdminAdvancedParameters',1,0,'settings_applications'),(97,96,0,NULL,'AdminInformation',1,0,''),(98,96,1,NULL,'AdminPerformance',1,0,''),(99,96,2,NULL,'AdminAdminPreferences',1,0,''),(100,96,3,NULL,'AdminEmails',1,0,''),(101,96,4,NULL,'AdminImport',1,0,''),(102,96,5,NULL,'AdminParentEmployees',1,0,''),(103,102,0,NULL,'AdminEmployees',1,0,''),(104,102,1,NULL,'AdminProfiles',1,0,''),(105,102,2,NULL,'AdminAccess',1,0,''),(106,96,6,NULL,'AdminParentRequestSql',1,0,''),(107,106,0,NULL,'AdminRequestSql',1,0,''),(108,106,1,NULL,'AdminBackup',1,0,''),(109,96,7,NULL,'AdminLogs',1,0,''),(110,96,8,NULL,'AdminWebservice',1,0,''),(111,96,9,NULL,'AdminShopGroup',0,0,''),(112,96,10,NULL,'AdminShopUrl',0,0,''),(113,-1,0,NULL,'AdminQuickAccesses',1,0,''),(114,0,4,NULL,'DEFAULT',1,0,''),(115,-1,1,NULL,'AdminPatterns',1,0,''),(116,-1,2,'dashgoals','AdminDashgoals',1,0,''),(117,47,5,'ps_linklist','AdminLinkWidget',1,0,''),(118,0,5,'welcome','AdminWelcome',1,0,''),(119,74,7,'gamification','AdminGamification',1,0,''),(120,-1,3,'cronjobs','AdminCronJobs',1,0,'');
/*!40000 ALTER TABLE `tb_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tab_advice`
--

DROP TABLE IF EXISTS `tb_tab_advice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tab_advice` (
  `id_tab` int(11) NOT NULL,
  `id_advice` int(11) NOT NULL,
  PRIMARY KEY (`id_tab`,`id_advice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tab_advice`
--

LOCK TABLES `tb_tab_advice` WRITE;
/*!40000 ALTER TABLE `tb_tab_advice` DISABLE KEYS */;
INSERT INTO `tb_tab_advice` VALUES (0,2),(72,1);
/*!40000 ALTER TABLE `tb_tab_advice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tab_lang`
--

DROP TABLE IF EXISTS `tb_tab_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tab_lang` (
  `id_tab` int(11) NOT NULL,
  `id_lang` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tab`,`id_lang`),
  KEY `IDX_B76CBF79ED47AB56` (`id_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tab_lang`
--

LOCK TABLES `tb_tab_lang` WRITE;
/*!40000 ALTER TABLE `tb_tab_lang` DISABLE KEYS */;
INSERT INTO `tb_tab_lang` VALUES (1,1,'Painel de controlo'),(1,2,'Painel'),(2,1,'Sell'),(2,2,'Sell'),(3,1,'Encomendas'),(3,2,'Pedidos'),(4,1,'Encomendas'),(4,2,'Pedidos'),(5,1,'Faturas'),(5,2,'Faturas'),(6,1,'Notas de CrÃ©dito'),(6,2,'Comprovantes de crÃ©ditos'),(7,1,'Notas de Entrega'),(7,2,'Comprovantes de entregas'),(8,1,'Carrinhos de Compras'),(8,2,'Carrinho de compras'),(9,1,'CatÃ¡logo'),(9,2,'CatÃ¡logo'),(10,1,'Produtos'),(10,2,'Produtos'),(11,1,'Categorias'),(11,2,'Categorias'),(12,1,'MonitorizaÃ§Ã£o'),(12,2,'Monitoramento'),(13,1,'Attributes & Features'),(13,2,'Attributes & Features'),(14,1,'Atributos'),(14,2,'Atributos'),(15,1,'Funcionalidades'),(15,2,'Funcionalidades'),(16,1,'Brands & Suppliers'),(16,2,'Brands & Suppliers'),(17,1,'Marcas'),(17,2,'Marcas'),(18,1,'Fornecedores'),(18,2,'Fornecedores'),(19,1,'Ficheiros'),(19,2,'Arquivos'),(20,1,'Descontos'),(20,2,'Descontos'),(21,1,'Regras de Carrinho'),(21,2,'Regras do Carrinho'),(22,1,'Regras de PreÃ§os do CatÃ¡logo'),(22,2,'Regras de preÃ§o do catÃ¡logo'),(23,1,'Stocks'),(23,2,'Stocks'),(24,1,'Clientes'),(24,2,'Clientes'),(25,1,'Clientes'),(25,2,'Clientes'),(26,1,'EndereÃ§os'),(26,2,'EndereÃ§os'),(27,1,'Clientes com DÃ­vidas'),(27,2,'Excepcional'),(28,1,'Apoio ao Cliente'),(28,2,'Atendimento ao Cliente'),(29,1,'Apoio ao Cliente'),(29,2,'Atendimento ao Cliente'),(30,1,'Mensagens de Encomendas'),(30,2,'Mensagens de pedidos'),(31,1,'Mercadorias Devolvidas'),(31,2,'DevoluÃ§Ãµes de Mercadorias'),(32,1,'EstatÃ­sticas'),(32,2,'EstatÃ­sticas'),(34,1,'ArmazÃ©ns'),(34,2,'ArmazÃ©ns'),(35,1,'GestÃ£o de InventÃ¡rio'),(35,2,'GestÃ£o de estoque'),(36,1,'GestÃ£o de InventÃ¡rio'),(36,2,'GestÃ£o de estoque'),(37,1,'Movimento de InventÃ¡rio'),(37,2,'MovimentaÃ§Ã£o do Estoque'),(38,1,'Estado InstantÃ¢neo do InventÃ¡rio'),(38,2,'Status atual do estoque'),(39,1,'Cobertura do InventÃ¡rio'),(39,2,'Cobertura do Estoque'),(40,1,'Encomendas a Fornecedores'),(40,2,'Pedidos de fornecimento'),(41,1,'ConfiguraÃ§Ã£o'),(41,2,'ConfiguraÃ§Ã£o'),(42,1,'Improve'),(42,2,'Improve'),(43,1,'MÃ³dulos'),(43,2,'MÃ³dulos'),(44,1,'Modules & Services'),(44,2,'Modules & Services'),(46,1,'Modules Catalog'),(46,2,'Modules Catalog'),(47,1,'Design'),(47,2,'Design'),(48,1,'Theme & Logo'),(48,2,'Theme & Logo'),(49,1,'Theme Catalog'),(49,2,'Theme Catalog'),(50,1,'PÃ¡ginas'),(50,2,'PÃ¡ginas'),(51,1,'PosiÃ§Ãµes'),(51,2,'PosiÃ§Ãµes'),(52,1,'Image Settings'),(52,2,'Image Settings'),(53,1,'Envio'),(53,2,'Frete'),(54,1,'Transportadoras'),(54,2,'Transportadoras'),(55,1,'PreferÃªncias'),(55,2,'PreferÃªncias'),(56,1,'Pagamento'),(56,2,'Pagamento'),(57,1,'Payment Methods'),(57,2,'Payment Methods'),(58,1,'PreferÃªncias'),(58,2,'PreferÃªncias'),(59,1,'International'),(59,2,'Internacional'),(60,1,'LocalizaÃ§Ã£o'),(60,2,'LocalizaÃ§Ã£o'),(61,1,'LocalizaÃ§Ã£o'),(61,2,'LocalizaÃ§Ã£o'),(62,1,'Idiomas'),(62,2,'Idiomas'),(63,1,'Moedas'),(63,2,'Moedas'),(64,1,'GeolocalizaÃ§Ã£o'),(64,2,'GeolocalizaÃ§Ã£o'),(65,1,'Locations'),(65,2,'Locations'),(66,1,'PaÃ­ses'),(66,2,'PaÃ­ses'),(67,1,'Zonas'),(67,2,'RegiÃµes'),(68,1,'Estados/Distritos'),(68,2,'Estados'),(69,1,'IVA'),(69,2,'Taxas'),(70,1,'IVA'),(70,2,'Taxas'),(71,1,'Regras de IVA'),(71,2,'Regras de impostos'),(72,1,'TraduÃ§Ãµes'),(72,2,'TraduÃ§Ãµes'),(73,1,'Configurar'),(73,2,'Configurar'),(74,1,'Shop Parameters'),(74,2,'Shop Parameters'),(75,1,'Geral'),(75,2,'Geral'),(76,1,'Geral'),(76,2,'Geral'),(77,1,'ManutenÃ§Ã£o'),(77,2,'ManutenÃ§Ã£o'),(78,1,'Order Settings'),(78,2,'Order Settings'),(79,1,'Order Settings'),(79,2,'Order Settings'),(80,1,'Estados das Encomendas'),(80,2,'Status'),(81,1,'Produtos'),(81,2,'Produtos'),(82,1,'Customer Settings'),(82,2,'Customer Settings'),(83,1,'Clientes'),(83,2,'Clientes'),(84,1,'Grupos'),(84,2,'Grupos'),(85,1,'TÃ­tulos Sociais'),(85,2,'TÃ­tulos'),(86,1,'Contacto'),(86,2,'Contato'),(87,1,'Contactos'),(87,2,'Contatos'),(88,1,'Lojas'),(88,2,'Lojas'),(89,1,'Traffic & SEO'),(89,2,'Traffic & SEO'),(90,1,'SEO e URLs'),(90,2,'SEO & URLs'),(91,1,'Motores de Pesquisa'),(91,2,'Sistemas de busca'),(92,1,'ReferÃªncias'),(92,2,'ReferÃªncias'),(93,1,'Pesquisar'),(93,2,'Busca'),(94,1,'Pesquisar'),(94,2,'Busca'),(95,1,'Etiquetas'),(95,2,'Tags'),(96,1,'ParÃ¢metros AvanÃ§ados'),(96,2,'ParÃ¢metros AvanÃ§ados'),(97,1,'InformaÃ§Ã£o'),(97,2,'InformaÃ§Ã£o'),(98,1,'Desempenho'),(98,2,'Desempenho'),(99,1,'AdministraÃ§Ã£o'),(99,2,'AdministraÃ§Ã£o'),(100,1,'Email'),(100,2,'Email'),(101,1,'Importar'),(101,2,'Importar'),(102,1,'Empregados'),(102,2,'Empregados'),(103,1,'FuncionÃ¡rios'),(103,2,'Empregados'),(104,1,'Perfis de utilizadores'),(104,2,'Perfis'),(105,1,'PermissÃµes'),(105,2,'PermissÃµes'),(106,1,'Database'),(106,2,'Database'),(107,1,'Gestor SQL'),(107,2,'Gerenciador SQL'),(108,1,'CÃ³pia da Base de Dados'),(108,2,'Backup do BD'),(109,1,'Registos'),(109,2,'Logs'),(110,1,'Webservice'),(110,2,'WebService'),(111,1,'Multi-Loja'),(111,2,'Multiloja'),(112,1,'Multi-Loja'),(112,2,'Multiloja'),(113,1,'Acesso RÃ¡pido'),(113,2,'Acesso RÃ¡pido'),(114,1,'Mais'),(114,2,'Mais'),(116,1,'Dashgoals'),(116,2,'Dashgoals'),(117,1,'Link Widget'),(117,2,'Link Widget'),(118,1,'Welcome'),(118,2,'Welcome'),(119,1,'Merchant Expertise'),(119,2,'Merchant Expertise'),(120,1,'Cron Jobs'),(120,2,'Cron Jobs');
/*!40000 ALTER TABLE `tb_tab_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tab_module_preference`
--

DROP TABLE IF EXISTS `tb_tab_module_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tab_module_preference` (
  `id_tab_module_preference` int(11) NOT NULL AUTO_INCREMENT,
  `id_employee` int(11) NOT NULL,
  `id_tab` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tab_module_preference`),
  UNIQUE KEY `employee_module` (`id_employee`,`id_tab`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tab_module_preference`
--

LOCK TABLES `tb_tab_module_preference` WRITE;
/*!40000 ALTER TABLE `tb_tab_module_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tab_module_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tag`
--

DROP TABLE IF EXISTS `tb_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`name`),
  KEY `id_lang` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tag`
--

LOCK TABLES `tb_tag` WRITE;
/*!40000 ALTER TABLE `tb_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tag_count`
--

DROP TABLE IF EXISTS `tb_tag_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tag_count` (
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `id_tag` int(10) unsigned NOT NULL DEFAULT '0',
  `id_lang` int(10) unsigned NOT NULL DEFAULT '0',
  `id_shop` int(11) unsigned NOT NULL DEFAULT '0',
  `counter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`,`id_tag`),
  KEY `id_group` (`id_group`,`id_lang`,`id_shop`,`counter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tag_count`
--

LOCK TABLES `tb_tag_count` WRITE;
/*!40000 ALTER TABLE `tb_tag_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tag_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tax`
--

DROP TABLE IF EXISTS `tb_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tax` (
  `id_tax` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(10,3) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tax`
--

LOCK TABLES `tb_tax` WRITE;
/*!40000 ALTER TABLE `tb_tax` DISABLE KEYS */;
INSERT INTO `tb_tax` VALUES (1,12.000,1,0),(2,25.000,1,0),(3,5.000,1,0);
/*!40000 ALTER TABLE `tb_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tax_lang`
--

DROP TABLE IF EXISTS `tb_tax_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tax_lang` (
  `id_tax` int(10) unsigned NOT NULL,
  `id_lang` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_tax`,`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tax_lang`
--

LOCK TABLES `tb_tax_lang` WRITE;
/*!40000 ALTER TABLE `tb_tax_lang` DISABLE KEYS */;
INSERT INTO `tb_tax_lang` VALUES (1,1,'IPI BR 12%'),(1,2,'IPI BR 12%'),(2,1,'ICMS BR 25%'),(2,2,'ICMS BR 25%'),(3,1,'ISS BR 5%'),(3,2,'ISS BR 5%');
/*!40000 ALTER TABLE `tb_tax_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tax_rule`
--

DROP TABLE IF EXISTS `tb_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tax_rule` (
  `id_tax_rule` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_rules_group` int(11) NOT NULL,
  `id_country` int(11) NOT NULL,
  `id_state` int(11) NOT NULL,
  `zipcode_from` varchar(12) NOT NULL,
  `zipcode_to` varchar(12) NOT NULL,
  `id_tax` int(11) NOT NULL,
  `behavior` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tax_rule`),
  KEY `id_tax_rules_group` (`id_tax_rules_group`),
  KEY `id_tax` (`id_tax`),
  KEY `category_getproducts` (`id_tax_rules_group`,`id_country`,`id_state`,`zipcode_from`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tax_rule`
--

LOCK TABLES `tb_tax_rule` WRITE;
/*!40000 ALTER TABLE `tb_tax_rule` DISABLE KEYS */;
INSERT INTO `tb_tax_rule` VALUES (1,1,58,0,'0','0',2,0,''),(2,2,58,0,'0','0',1,0,''),(3,3,58,0,'0','0',3,0,'');
/*!40000 ALTER TABLE `tb_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tax_rules_group`
--

DROP TABLE IF EXISTS `tb_tax_rules_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tax_rules_group` (
  `id_tax_rules_group` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` int(11) NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  `date_upd` datetime NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tax_rules_group`
--

LOCK TABLES `tb_tax_rules_group` WRITE;
/*!40000 ALTER TABLE `tb_tax_rules_group` DISABLE KEYS */;
INSERT INTO `tb_tax_rules_group` VALUES (1,'BR ICMS (25%)',1,0,'2018-01-17 09:46:00','2018-01-17 09:46:00'),(2,'BR IPI (12%)',1,0,'2018-01-17 09:46:00','2018-01-17 09:46:00'),(3,'BR ISS (5%)',1,0,'2018-01-17 09:46:00','2018-01-17 09:46:00');
/*!40000 ALTER TABLE `tb_tax_rules_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tax_rules_group_shop`
--

DROP TABLE IF EXISTS `tb_tax_rules_group_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_tax_rules_group_shop` (
  `id_tax_rules_group` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_tax_rules_group`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tax_rules_group_shop`
--

LOCK TABLES `tb_tax_rules_group_shop` WRITE;
/*!40000 ALTER TABLE `tb_tax_rules_group_shop` DISABLE KEYS */;
INSERT INTO `tb_tax_rules_group_shop` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `tb_tax_rules_group_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_timezone`
--

DROP TABLE IF EXISTS `tb_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_timezone` (
  `id_timezone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id_timezone`)
) ENGINE=InnoDB AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_timezone`
--

LOCK TABLES `tb_timezone` WRITE;
/*!40000 ALTER TABLE `tb_timezone` DISABLE KEYS */;
INSERT INTO `tb_timezone` VALUES (1,'Africa/Abidjan'),(2,'Africa/Accra'),(3,'Africa/Addis_Ababa'),(4,'Africa/Algiers'),(5,'Africa/Asmara'),(6,'Africa/Asmera'),(7,'Africa/Bamako'),(8,'Africa/Bangui'),(9,'Africa/Banjul'),(10,'Africa/Bissau'),(11,'Africa/Blantyre'),(12,'Africa/Brazzaville'),(13,'Africa/Bujumbura'),(14,'Africa/Cairo'),(15,'Africa/Casablanca'),(16,'Africa/Ceuta'),(17,'Africa/Conakry'),(18,'Africa/Dakar'),(19,'Africa/Dar_es_Salaam'),(20,'Africa/Djibouti'),(21,'Africa/Douala'),(22,'Africa/El_Aaiun'),(23,'Africa/Freetown'),(24,'Africa/Gaborone'),(25,'Africa/Harare'),(26,'Africa/Johannesburg'),(27,'Africa/Kampala'),(28,'Africa/Khartoum'),(29,'Africa/Kigali'),(30,'Africa/Kinshasa'),(31,'Africa/Lagos'),(32,'Africa/Libreville'),(33,'Africa/Lome'),(34,'Africa/Luanda'),(35,'Africa/Lubumbashi'),(36,'Africa/Lusaka'),(37,'Africa/Malabo'),(38,'Africa/Maputo'),(39,'Africa/Maseru'),(40,'Africa/Mbabane'),(41,'Africa/Mogadishu'),(42,'Africa/Monrovia'),(43,'Africa/Nairobi'),(44,'Africa/Ndjamena'),(45,'Africa/Niamey'),(46,'Africa/Nouakchott'),(47,'Africa/Ouagadougou'),(48,'Africa/Porto-Novo'),(49,'Africa/Sao_Tome'),(50,'Africa/Timbuktu'),(51,'Africa/Tripoli'),(52,'Africa/Tunis'),(53,'Africa/Windhoek'),(54,'America/Adak'),(55,'America/Anchorage '),(56,'America/Anguilla'),(57,'America/Antigua'),(58,'America/Araguaina'),(59,'America/Argentina/Buenos_Aires'),(60,'America/Argentina/Catamarca'),(61,'America/Argentina/ComodRivadavia'),(62,'America/Argentina/Cordoba'),(63,'America/Argentina/Jujuy'),(64,'America/Argentina/La_Rioja'),(65,'America/Argentina/Mendoza'),(66,'America/Argentina/Rio_Gallegos'),(67,'America/Argentina/Salta'),(68,'America/Argentina/San_Juan'),(69,'America/Argentina/San_Luis'),(70,'America/Argentina/Tucuman'),(71,'America/Argentina/Ushuaia'),(72,'America/Aruba'),(73,'America/Asuncion'),(74,'America/Atikokan'),(75,'America/Atka'),(76,'America/Bahia'),(77,'America/Barbados'),(78,'America/Belem'),(79,'America/Belize'),(80,'America/Blanc-Sablon'),(81,'America/Boa_Vista'),(82,'America/Bogota'),(83,'America/Boise'),(84,'America/Buenos_Aires'),(85,'America/Cambridge_Bay'),(86,'America/Campo_Grande'),(87,'America/Cancun'),(88,'America/Caracas'),(89,'America/Catamarca'),(90,'America/Cayenne'),(91,'America/Cayman'),(92,'America/Chicago'),(93,'America/Chihuahua'),(94,'America/Coral_Harbour'),(95,'America/Cordoba'),(96,'America/Costa_Rica'),(97,'America/Cuiaba'),(98,'America/Curacao'),(99,'America/Danmarkshavn'),(100,'America/Dawson'),(101,'America/Dawson_Creek'),(102,'America/Denver'),(103,'America/Detroit'),(104,'America/Dominica'),(105,'America/Edmonton'),(106,'America/Eirunepe'),(107,'America/El_Salvador'),(108,'America/Ensenada'),(109,'America/Fort_Wayne'),(110,'America/Fortaleza'),(111,'America/Glace_Bay'),(112,'America/Godthab'),(113,'America/Goose_Bay'),(114,'America/Grand_Turk'),(115,'America/Grenada'),(116,'America/Guadeloupe'),(117,'America/Guatemala'),(118,'America/Guayaquil'),(119,'America/Guyana'),(120,'America/Halifax'),(121,'America/Havana'),(122,'America/Hermosillo'),(123,'America/Indiana/Indianapolis'),(124,'America/Indiana/Knox'),(125,'America/Indiana/Marengo'),(126,'America/Indiana/Petersburg'),(127,'America/Indiana/Tell_City'),(128,'America/Indiana/Vevay'),(129,'America/Indiana/Vincennes'),(130,'America/Indiana/Winamac'),(131,'America/Indianapolis'),(132,'America/Inuvik'),(133,'America/Iqaluit'),(134,'America/Jamaica'),(135,'America/Jujuy'),(136,'America/Juneau'),(137,'America/Kentucky/Louisville'),(138,'America/Kentucky/Monticello'),(139,'America/Knox_IN'),(140,'America/La_Paz'),(141,'America/Lima'),(142,'America/Los_Angeles'),(143,'America/Louisville'),(144,'America/Maceio'),(145,'America/Managua'),(146,'America/Manaus'),(147,'America/Marigot'),(148,'America/Martinique'),(149,'America/Mazatlan'),(150,'America/Mendoza'),(151,'America/Menominee'),(152,'America/Merida'),(153,'America/Mexico_City'),(154,'America/Miquelon'),(155,'America/Moncton'),(156,'America/Monterrey'),(157,'America/Montevideo'),(158,'America/Montreal'),(159,'America/Montserrat'),(160,'America/Nassau'),(161,'America/New_York'),(162,'America/Nipigon'),(163,'America/Nome'),(164,'America/Noronha'),(165,'America/North_Dakota/Center'),(166,'America/North_Dakota/New_Salem'),(167,'America/Panama'),(168,'America/Pangnirtung'),(169,'America/Paramaribo'),(170,'America/Phoenix'),(171,'America/Port-au-Prince'),(172,'America/Port_of_Spain'),(173,'America/Porto_Acre'),(174,'America/Porto_Velho'),(175,'America/Puerto_Rico'),(176,'America/Rainy_River'),(177,'America/Rankin_Inlet'),(178,'America/Recife'),(179,'America/Regina'),(180,'America/Resolute'),(181,'America/Rio_Branco'),(182,'America/Rosario'),(183,'America/Santarem'),(184,'America/Santiago'),(185,'America/Santo_Domingo'),(186,'America/Sao_Paulo'),(187,'America/Scoresbysund'),(188,'America/Shiprock'),(189,'America/St_Barthelemy'),(190,'America/St_Johns'),(191,'America/St_Kitts'),(192,'America/St_Lucia'),(193,'America/St_Thomas'),(194,'America/St_Vincent'),(195,'America/Swift_Current'),(196,'America/Tegucigalpa'),(197,'America/Thule'),(198,'America/Thunder_Bay'),(199,'America/Tijuana'),(200,'America/Toronto'),(201,'America/Tortola'),(202,'America/Vancouver'),(203,'America/Virgin'),(204,'America/Whitehorse'),(205,'America/Winnipeg'),(206,'America/Yakutat'),(207,'America/Yellowknife'),(208,'Antarctica/Casey'),(209,'Antarctica/Davis'),(210,'Antarctica/DumontDUrville'),(211,'Antarctica/Mawson'),(212,'Antarctica/McMurdo'),(213,'Antarctica/Palmer'),(214,'Antarctica/Rothera'),(215,'Antarctica/South_Pole'),(216,'Antarctica/Syowa'),(217,'Antarctica/Vostok'),(218,'Arctic/Longyearbyen'),(219,'Asia/Aden'),(220,'Asia/Almaty'),(221,'Asia/Amman'),(222,'Asia/Anadyr'),(223,'Asia/Aqtau'),(224,'Asia/Aqtobe'),(225,'Asia/Ashgabat'),(226,'Asia/Ashkhabad'),(227,'Asia/Baghdad'),(228,'Asia/Bahrain'),(229,'Asia/Baku'),(230,'Asia/Bangkok'),(231,'Asia/Beirut'),(232,'Asia/Bishkek'),(233,'Asia/Brunei'),(234,'Asia/Calcutta'),(235,'Asia/Choibalsan'),(236,'Asia/Chongqing'),(237,'Asia/Chungking'),(238,'Asia/Colombo'),(239,'Asia/Dacca'),(240,'Asia/Damascus'),(241,'Asia/Dhaka'),(242,'Asia/Dili'),(243,'Asia/Dubai'),(244,'Asia/Dushanbe'),(245,'Asia/Gaza'),(246,'Asia/Harbin'),(247,'Asia/Ho_Chi_Minh'),(248,'Asia/Hong_Kong'),(249,'Asia/Hovd'),(250,'Asia/Irkutsk'),(251,'Asia/Istanbul'),(252,'Asia/Jakarta'),(253,'Asia/Jayapura'),(254,'Asia/Jerusalem'),(255,'Asia/Kabul'),(256,'Asia/Kamchatka'),(257,'Asia/Karachi'),(258,'Asia/Kashgar'),(259,'Asia/Kathmandu'),(260,'Asia/Katmandu'),(261,'Asia/Kolkata'),(262,'Asia/Krasnoyarsk'),(263,'Asia/Kuala_Lumpur'),(264,'Asia/Kuching'),(265,'Asia/Kuwait'),(266,'Asia/Macao'),(267,'Asia/Macau'),(268,'Asia/Magadan'),(269,'Asia/Makassar'),(270,'Asia/Manila'),(271,'Asia/Muscat'),(272,'Asia/Nicosia'),(273,'Asia/Novosibirsk'),(274,'Asia/Omsk'),(275,'Asia/Oral'),(276,'Asia/Phnom_Penh'),(277,'Asia/Pontianak'),(278,'Asia/Pyongyang'),(279,'Asia/Qatar'),(280,'Asia/Qyzylorda'),(281,'Asia/Rangoon'),(282,'Asia/Riyadh'),(283,'Asia/Saigon'),(284,'Asia/Sakhalin'),(285,'Asia/Samarkand'),(286,'Asia/Seoul'),(287,'Asia/Shanghai'),(288,'Asia/Singapore'),(289,'Asia/Taipei'),(290,'Asia/Tashkent'),(291,'Asia/Tbilisi'),(292,'Asia/Tehran'),(293,'Asia/Tel_Aviv'),(294,'Asia/Thimbu'),(295,'Asia/Thimphu'),(296,'Asia/Tokyo'),(297,'Asia/Ujung_Pandang'),(298,'Asia/Ulaanbaatar'),(299,'Asia/Ulan_Bator'),(300,'Asia/Urumqi'),(301,'Asia/Vientiane'),(302,'Asia/Vladivostok'),(303,'Asia/Yakutsk'),(304,'Asia/Yekaterinburg'),(305,'Asia/Yerevan'),(306,'Atlantic/Azores'),(307,'Atlantic/Bermuda'),(308,'Atlantic/Canary'),(309,'Atlantic/Cape_Verde'),(310,'Atlantic/Faeroe'),(311,'Atlantic/Faroe'),(312,'Atlantic/Jan_Mayen'),(313,'Atlantic/Madeira'),(314,'Atlantic/Reykjavik'),(315,'Atlantic/South_Georgia'),(316,'Atlantic/St_Helena'),(317,'Atlantic/Stanley'),(318,'Australia/ACT'),(319,'Australia/Adelaide'),(320,'Australia/Brisbane'),(321,'Australia/Broken_Hill'),(322,'Australia/Canberra'),(323,'Australia/Currie'),(324,'Australia/Darwin'),(325,'Australia/Eucla'),(326,'Australia/Hobart'),(327,'Australia/LHI'),(328,'Australia/Lindeman'),(329,'Australia/Lord_Howe'),(330,'Australia/Melbourne'),(331,'Australia/North'),(332,'Australia/NSW'),(333,'Australia/Perth'),(334,'Australia/Queensland'),(335,'Australia/South'),(336,'Australia/Sydney'),(337,'Australia/Tasmania'),(338,'Australia/Victoria'),(339,'Australia/West'),(340,'Australia/Yancowinna'),(341,'Europe/Amsterdam'),(342,'Europe/Andorra'),(343,'Europe/Athens'),(344,'Europe/Belfast'),(345,'Europe/Belgrade'),(346,'Europe/Berlin'),(347,'Europe/Bratislava'),(348,'Europe/Brussels'),(349,'Europe/Bucharest'),(350,'Europe/Budapest'),(351,'Europe/Chisinau'),(352,'Europe/Copenhagen'),(353,'Europe/Dublin'),(354,'Europe/Gibraltar'),(355,'Europe/Guernsey'),(356,'Europe/Helsinki'),(357,'Europe/Isle_of_Man'),(358,'Europe/Istanbul'),(359,'Europe/Jersey'),(360,'Europe/Kaliningrad'),(361,'Europe/Kiev'),(362,'Europe/Lisbon'),(363,'Europe/Ljubljana'),(364,'Europe/London'),(365,'Europe/Luxembourg'),(366,'Europe/Madrid'),(367,'Europe/Malta'),(368,'Europe/Mariehamn'),(369,'Europe/Minsk'),(370,'Europe/Monaco'),(371,'Europe/Moscow'),(372,'Europe/Nicosia'),(373,'Europe/Oslo'),(374,'Europe/Paris'),(375,'Europe/Podgorica'),(376,'Europe/Prague'),(377,'Europe/Riga'),(378,'Europe/Rome'),(379,'Europe/Samara'),(380,'Europe/San_Marino'),(381,'Europe/Sarajevo'),(382,'Europe/Simferopol'),(383,'Europe/Skopje'),(384,'Europe/Sofia'),(385,'Europe/Stockholm'),(386,'Europe/Tallinn'),(387,'Europe/Tirane'),(388,'Europe/Tiraspol'),(389,'Europe/Uzhgorod'),(390,'Europe/Vaduz'),(391,'Europe/Vatican'),(392,'Europe/Vienna'),(393,'Europe/Vilnius'),(394,'Europe/Volgograd'),(395,'Europe/Warsaw'),(396,'Europe/Zagreb'),(397,'Europe/Zaporozhye'),(398,'Europe/Zurich'),(399,'Indian/Antananarivo'),(400,'Indian/Chagos'),(401,'Indian/Christmas'),(402,'Indian/Cocos'),(403,'Indian/Comoro'),(404,'Indian/Kerguelen'),(405,'Indian/Mahe'),(406,'Indian/Maldives'),(407,'Indian/Mauritius'),(408,'Indian/Mayotte'),(409,'Indian/Reunion'),(410,'Pacific/Apia'),(411,'Pacific/Auckland'),(412,'Pacific/Chatham'),(413,'Pacific/Easter'),(414,'Pacific/Efate'),(415,'Pacific/Enderbury'),(416,'Pacific/Fakaofo'),(417,'Pacific/Fiji'),(418,'Pacific/Funafuti'),(419,'Pacific/Galapagos'),(420,'Pacific/Gambier'),(421,'Pacific/Guadalcanal'),(422,'Pacific/Guam'),(423,'Pacific/Honolulu'),(424,'Pacific/Johnston'),(425,'Pacific/Kiritimati'),(426,'Pacific/Kosrae'),(427,'Pacific/Kwajalein'),(428,'Pacific/Majuro'),(429,'Pacific/Marquesas'),(430,'Pacific/Midway'),(431,'Pacific/Nauru'),(432,'Pacific/Niue'),(433,'Pacific/Norfolk'),(434,'Pacific/Noumea'),(435,'Pacific/Pago_Pago'),(436,'Pacific/Palau'),(437,'Pacific/Pitcairn'),(438,'Pacific/Ponape'),(439,'Pacific/Port_Moresby'),(440,'Pacific/Rarotonga'),(441,'Pacific/Saipan'),(442,'Pacific/Samoa'),(443,'Pacific/Tahiti'),(444,'Pacific/Tarawa'),(445,'Pacific/Tongatapu'),(446,'Pacific/Truk'),(447,'Pacific/Wake'),(448,'Pacific/Wallis'),(449,'Pacific/Yap'),(450,'Brazil/Acre'),(451,'Brazil/DeNoronha'),(452,'Brazil/East'),(453,'Brazil/West'),(454,'Canada/Atlantic'),(455,'Canada/Central'),(456,'Canada/East-Saskatchewan'),(457,'Canada/Eastern'),(458,'Canada/Mountain'),(459,'Canada/Newfoundland'),(460,'Canada/Pacific'),(461,'Canada/Saskatchewan'),(462,'Canada/Yukon'),(463,'CET'),(464,'Chile/Continental'),(465,'Chile/EasterIsland'),(466,'CST6CDT'),(467,'Cuba'),(468,'EET'),(469,'Egypt'),(470,'Eire'),(471,'EST'),(472,'EST5EDT'),(473,'Etc/GMT'),(474,'Etc/GMT+0'),(475,'Etc/GMT+1'),(476,'Etc/GMT+10'),(477,'Etc/GMT+11'),(478,'Etc/GMT+12'),(479,'Etc/GMT+2'),(480,'Etc/GMT+3'),(481,'Etc/GMT+4'),(482,'Etc/GMT+5'),(483,'Etc/GMT+6'),(484,'Etc/GMT+7'),(485,'Etc/GMT+8'),(486,'Etc/GMT+9'),(487,'Etc/GMT-0'),(488,'Etc/GMT-1'),(489,'Etc/GMT-10'),(490,'Etc/GMT-11'),(491,'Etc/GMT-12'),(492,'Etc/GMT-13'),(493,'Etc/GMT-14'),(494,'Etc/GMT-2'),(495,'Etc/GMT-3'),(496,'Etc/GMT-4'),(497,'Etc/GMT-5'),(498,'Etc/GMT-6'),(499,'Etc/GMT-7'),(500,'Etc/GMT-8'),(501,'Etc/GMT-9'),(502,'Etc/GMT0'),(503,'Etc/Greenwich'),(504,'Etc/UCT'),(505,'Etc/Universal'),(506,'Etc/UTC'),(507,'Etc/Zulu'),(508,'Factory'),(509,'GB'),(510,'GB-Eire'),(511,'GMT'),(512,'GMT+0'),(513,'GMT-0'),(514,'GMT0'),(515,'Greenwich'),(516,'Hongkong'),(517,'HST'),(518,'Iceland'),(519,'Iran'),(520,'Israel'),(521,'Jamaica'),(522,'Japan'),(523,'Kwajalein'),(524,'Libya'),(525,'MET'),(526,'Mexico/BajaNorte'),(527,'Mexico/BajaSur'),(528,'Mexico/General'),(529,'MST'),(530,'MST7MDT'),(531,'Navajo'),(532,'NZ'),(533,'NZ-CHAT'),(534,'Poland'),(535,'Portugal'),(536,'PRC'),(537,'PST8PDT'),(538,'ROC'),(539,'ROK'),(540,'Singapore'),(541,'Turkey'),(542,'UCT'),(543,'Universal'),(544,'US/Alaska'),(545,'US/Aleutian'),(546,'US/Arizona'),(547,'US/Central'),(548,'US/East-Indiana'),(549,'US/Eastern'),(550,'US/Hawaii'),(551,'US/Indiana-Starke'),(552,'US/Michigan'),(553,'US/Mountain'),(554,'US/Pacific'),(555,'US/Pacific-New'),(556,'US/Samoa'),(557,'UTC'),(558,'W-SU'),(559,'WET'),(560,'Zulu');
/*!40000 ALTER TABLE `tb_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_translation`
--

DROP TABLE IF EXISTS `tb_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_translation` (
  `id_translation` int(11) NOT NULL AUTO_INCREMENT,
  `id_lang` int(11) NOT NULL,
  `key` text COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  KEY `IDX_DDD61B72BA299860` (`id_lang`),
  KEY `key` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_translation`
--

LOCK TABLES `tb_translation` WRITE;
/*!40000 ALTER TABLE `tb_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_warehouse`
--

DROP TABLE IF EXISTS `tb_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_warehouse` (
  `id_warehouse` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_currency` int(11) unsigned NOT NULL,
  `id_address` int(11) unsigned NOT NULL,
  `id_employee` int(11) unsigned NOT NULL,
  `reference` varchar(32) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `management_type` enum('WA','FIFO','LIFO') NOT NULL DEFAULT 'WA',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_warehouse`
--

LOCK TABLES `tb_warehouse` WRITE;
/*!40000 ALTER TABLE `tb_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_warehouse_carrier`
--

DROP TABLE IF EXISTS `tb_warehouse_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_warehouse_carrier` (
  `id_carrier` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_carrier`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_carrier` (`id_carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_warehouse_carrier`
--

LOCK TABLES `tb_warehouse_carrier` WRITE;
/*!40000 ALTER TABLE `tb_warehouse_carrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_warehouse_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_warehouse_product_location`
--

DROP TABLE IF EXISTS `tb_warehouse_product_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_warehouse_product_location` (
  `id_warehouse_product_location` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) unsigned NOT NULL,
  `id_product_attribute` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  `location` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_warehouse_product_location`),
  UNIQUE KEY `id_product` (`id_product`,`id_product_attribute`,`id_warehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_warehouse_product_location`
--

LOCK TABLES `tb_warehouse_product_location` WRITE;
/*!40000 ALTER TABLE `tb_warehouse_product_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_warehouse_product_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_warehouse_shop`
--

DROP TABLE IF EXISTS `tb_warehouse_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_warehouse_shop` (
  `id_shop` int(11) unsigned NOT NULL,
  `id_warehouse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_warehouse`,`id_shop`),
  KEY `id_warehouse` (`id_warehouse`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_warehouse_shop`
--

LOCK TABLES `tb_warehouse_shop` WRITE;
/*!40000 ALTER TABLE `tb_warehouse_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_warehouse_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_web_browser`
--

DROP TABLE IF EXISTS `tb_web_browser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_web_browser` (
  `id_web_browser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_web_browser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_web_browser`
--

LOCK TABLES `tb_web_browser` WRITE;
/*!40000 ALTER TABLE `tb_web_browser` DISABLE KEYS */;
INSERT INTO `tb_web_browser` VALUES (1,'Safari'),(2,'Safari iPad'),(3,'Firefox'),(4,'Opera'),(5,'IE 6'),(6,'IE 7'),(7,'IE 8'),(8,'IE 9'),(9,'IE 10'),(10,'IE 11'),(11,'Chrome');
/*!40000 ALTER TABLE `tb_web_browser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_webservice_account`
--

DROP TABLE IF EXISTS `tb_webservice_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_webservice_account` (
  `id_webservice_account` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `description` text,
  `class_name` varchar(50) NOT NULL DEFAULT 'WebserviceRequest',
  `is_module` tinyint(2) NOT NULL DEFAULT '0',
  `module_name` varchar(50) DEFAULT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_webservice_account`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_webservice_account`
--

LOCK TABLES `tb_webservice_account` WRITE;
/*!40000 ALTER TABLE `tb_webservice_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_webservice_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_webservice_account_shop`
--

DROP TABLE IF EXISTS `tb_webservice_account_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_webservice_account_shop` (
  `id_webservice_account` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_webservice_account`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_webservice_account_shop`
--

LOCK TABLES `tb_webservice_account_shop` WRITE;
/*!40000 ALTER TABLE `tb_webservice_account_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_webservice_account_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_webservice_permission`
--

DROP TABLE IF EXISTS `tb_webservice_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_webservice_permission` (
  `id_webservice_permission` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(50) NOT NULL,
  `method` enum('GET','POST','PUT','DELETE','HEAD') NOT NULL,
  `id_webservice_account` int(11) NOT NULL,
  PRIMARY KEY (`id_webservice_permission`),
  UNIQUE KEY `resource_2` (`resource`,`method`,`id_webservice_account`),
  KEY `resource` (`resource`),
  KEY `method` (`method`),
  KEY `id_webservice_account` (`id_webservice_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_webservice_permission`
--

LOCK TABLES `tb_webservice_permission` WRITE;
/*!40000 ALTER TABLE `tb_webservice_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_webservice_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_zone`
--

DROP TABLE IF EXISTS `tb_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_zone` (
  `id_zone` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_zone`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_zone`
--

LOCK TABLES `tb_zone` WRITE;
/*!40000 ALTER TABLE `tb_zone` DISABLE KEYS */;
INSERT INTO `tb_zone` VALUES (1,'Europe',1),(2,'North America',1),(3,'Asia',1),(4,'Africa',1),(5,'Oceania',1),(6,'South America',1),(7,'Europe (non-EU)',1),(8,'Central America/Antilla',1);
/*!40000 ALTER TABLE `tb_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_zone_shop`
--

DROP TABLE IF EXISTS `tb_zone_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_zone_shop` (
  `id_zone` int(11) unsigned NOT NULL,
  `id_shop` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_zone`,`id_shop`),
  KEY `id_shop` (`id_shop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_zone_shop`
--

LOCK TABLES `tb_zone_shop` WRITE;
/*!40000 ALTER TABLE `tb_zone_shop` DISABLE KEYS */;
INSERT INTO `tb_zone_shop` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `tb_zone_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite`
--

DROP TABLE IF EXISTS `tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramite` (
  `idTramite` int(11) NOT NULL AUTO_INCREMENT,
  `idCaixa` int(11) NOT NULL,
  `operacao` varchar(20) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `data` date NOT NULL,
  `motivo` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idTramite`),
  UNIQUE KEY `idTramite_UNIQUE` (`idTramite`),
  KEY `FKwenqm1061y3eq8n296w73njr` (`idCaixa`),
  CONSTRAINT `FKwenqm1061y3eq8n296w73njr` FOREIGN KEY (`idCaixa`) REFERENCES `caixa` (`idCaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite`
--

LOCK TABLES `tramite` WRITE;
/*!40000 ALTER TABLE `tramite` DISABLE KEYS */;
INSERT INTO `tramite` VALUES (7,3,'CREDITO',130.28,'2017-09-19',NULL),(8,4,'DEBITO',130.28,'2017-09-19',NULL),(9,1,'CREDITO',130.28,'2017-09-19',NULL),(10,3,'DEBITO',130.28,'2017-09-19',NULL),(11,1,'CREDITO',300.00,'2017-09-27',NULL),(12,2,'DEBITO',300.00,'2017-09-27',NULL),(13,3,'CREDITO',122.74,'2017-10-01',NULL),(14,4,'DEBITO',122.74,'2017-10-01',NULL),(15,1,'CREDITO',2285.00,'2017-10-02',NULL),(16,2,'DEBITO',2285.00,'2017-10-02',NULL),(17,1,'CREDITO',120.00,'2017-10-02',NULL),(18,1,'CREDITO',122.74,'2017-10-03',NULL),(19,3,'DEBITO',122.74,'2017-10-03',NULL),(20,1,'CREDITO',200.00,'2017-10-03',NULL),(22,1,'CREDITO',275.00,'2017-10-07',''),(23,2,'DEBITO',275.00,'2017-10-07',''),(24,1,'CREDITO',175.00,'2017-10-07','100,00 Flip4 (Tati); 55,00 Carregador PortÃ¡til 5600mAh (Camila); 20,00 Dois Desodorante Dove (Luana);'),(25,2,'DEBITO',1500.00,'2017-10-09','DevoluÃ§Ã£o para o Paulinho'),(26,1,'CREDITO',100.00,'2017-10-09','Tramite entre contas'),(27,2,'DEBITO',100.00,'2017-10-09','Tramite entre contas'),(28,2,'CREDITO',110.00,'2017-10-10','Pagamento Daniele'),(29,1,'CREDITO',130.00,'2017-10-10',''),(30,2,'DEBITO',130.00,'2017-10-10',''),(31,2,'CREDITO',90.00,'2017-10-11','Creme e Perfume (Camila)'),(32,1,'CREDITO',1590.00,'2017-10-12',''),(33,2,'DEBITO',1590.00,'2017-10-12',''),(34,1,'CREDITO',150.00,'2017-10-14',''),(35,2,'DEBITO',150.00,'2017-10-14',''),(36,1,'CREDITO',275.00,'2017-10-16',''),(37,2,'DEBITO',275.00,'2017-10-16',''),(38,1,'CREDITO',160.00,'2017-10-17','60,00 Isabel; 70,00 Perfume Tommy; 10,00 Relogio da Jeniffer; 20,00 Creme pago de Ponta PorÃ£'),(39,2,'CREDITO',60.00,'2017-10-18','Segunda e ultima parcela do Relogio Curren (Jaime)'),(40,5,'CREDITO',2400.00,'2017-10-19','Deposito para compra do IPAD Pro 64GB'),(41,1,'CREDITO',190.00,'2017-10-22',''),(42,2,'DEBITO',190.00,'2017-10-22',''),(43,1,'CREDITO',1463.35,'2017-10-22',''),(44,3,'DEBITO',1463.35,'2017-10-22',''),(45,1,'DEBITO',2400.00,'2017-10-22','Retirada do dinheiro colocado para compra do IPAD Pro 64GB'),(46,2,'CREDITO',60.00,'2017-10-26','60,00 Relogio da Dri'),(47,1,'CREDITO',110.00,'2017-10-28',''),(48,2,'DEBITO',110.00,'2017-10-28',''),(49,2,'CREDITO',100.00,'2017-10-28','Pagamento Tati (JBL FLIP4)'),(50,1,'CREDITO',150.00,'2017-11-01',''),(51,2,'DEBITO',150.00,'2017-11-01',''),(52,1,'CREDITO',2550.00,'2017-11-01','Entrada para compra de Iphone 7 128GB'),(53,1,'CREDITO',40.00,'2017-11-02','40,00 (Juliana) Parte final da compras dos cremes Revlon'),(54,1,'CREDITO',3000.00,'2017-11-02',''),(55,2,'DEBITO',3000.00,'2017-11-02',''),(56,1,'DEBITO',2550.00,'2017-11-02','DevoluÃ§Ã£o para o Thiago (2550,00) emprestados para compra do Iphone7 128GB'),(57,1,'CREDITO',180.00,'2017-11-05',''),(58,2,'DEBITO',180.00,'2017-11-05',''),(59,1,'CREDITO',200.00,'2017-11-06','Ultima parcela Agnaldo'),(60,2,'CREDITO',130.00,'2017-11-06','Pagamento Adriana (RelÃ³gio)'),(61,1,'CREDITO',280.00,'2017-11-06','Pagamento Jeanny (Creatina e Pulseira Inteligente Sky)'),(62,2,'DEBITO',280.00,'2017-11-06','Pagamento Jeanny (Creatina e Pulseira Inteligente Sky)'),(63,1,'CREDITO',230.00,'2017-11-07','1Âº Parcela MarÃ§Ã£o (Receptor)'),(64,1,'CREDITO',100.00,'2017-11-07',''),(65,2,'DEBITO',100.00,'2017-11-07',''),(66,2,'CREDITO',65.00,'2017-11-07','Pagamento Marlon (Relogio Curren)'),(67,1,'CREDITO',142.51,'2017-11-07',''),(68,3,'DEBITO',142.51,'2017-11-07',''),(69,1,'CREDITO',375.00,'2017-11-07',''),(70,2,'DEBITO',375.00,'2017-11-07',''),(71,1,'CREDITO',1000.00,'2017-11-07',''),(72,2,'DEBITO',1000.00,'2017-11-07',''),(73,2,'CREDITO',90.00,'2017-11-08','Pagamento final Camila (Creme e Perfume)'),(74,1,'DEBITO',217.78,'2017-11-08','Retirado para pagamento da parcela de novembro da casa de Floripa'),(75,1,'CREDITO',200.00,'2017-11-08',''),(76,2,'DEBITO',200.00,'2017-11-08',''),(77,5,'CREDITO',2030.00,'2017-11-09',''),(78,2,'DEBITO',2030.00,'2017-11-09',''),(79,2,'CREDITO',80.00,'2017-11-10','Pagamento final Patricia (Relogio Feminino Q&Q)'),(80,1,'CREDITO',100.00,'2017-11-10','Pagamento final Eric (Relogio Masculino Naviforce Khaki)'),(81,1,'CREDITO',260.00,'2017-11-10','Pagamento final Thays Araujo (2 Relogios Femininos)'),(82,2,'CREDITO',120.00,'2017-11-10','Pagamento final Ana Maria (Perfume Ferrari Black 125ml)'),(83,2,'CREDITO',50.00,'2017-11-10','Pagamento Ighor (RelÃ³gio Masculino Naviforce Gold)'),(84,1,'CREDITO',400.00,'2017-11-11',''),(85,2,'DEBITO',400.00,'2017-11-11',''),(86,1,'CREDITO',112.00,'2017-11-13',''),(87,2,'DEBITO',112.00,'2017-11-13',''),(88,3,'CREDITO',1368.94,'2017-11-14',''),(89,4,'DEBITO',1368.94,'2017-11-14',''),(90,6,'CREDITO',2030.00,'2017-11-14',''),(91,5,'DEBITO',2030.00,'2017-11-14',''),(92,7,'CREDITO',2697.33,'2017-11-14',''),(93,1,'DEBITO',2697.33,'2017-11-14',''),(94,7,'CREDITO',1368.94,'2017-11-14',''),(95,3,'DEBITO',1368.94,'2017-11-14',''),(96,2,'CREDITO',170.00,'2017-11-14','Pagamento final Tati (JBL Flip4)'),(97,2,'CREDITO',50.00,'2017-11-14','Pagamento Bete (Creme Victoria\'s Secret)'),(98,7,'CREDITO',220.00,'2017-11-16',''),(99,2,'DEBITO',220.00,'2017-11-16',''),(100,7,'CREDITO',1321.74,'2017-11-16',''),(101,3,'DEBITO',1321.74,'2017-11-16',''),(102,7,'DEBITO',1000.00,'2017-11-21',''),(103,7,'CREDITO',120.00,'2017-11-22',''),(104,1,'DEBITO',120.00,'2017-11-22',''),(105,2,'CREDITO',100.00,'2017-11-21','Pagamento final Aline Cerialli (Carregador PortÃ¡til)'),(106,1,'CREDITO',260.00,'2017-11-22',''),(107,2,'DEBITO',260.00,'2017-11-22',''),(108,1,'CREDITO',205.00,'2017-11-24',''),(109,2,'DEBITO',205.00,'2017-11-24',''),(110,1,'CREDITO',2000.00,'2017-11-24',''),(111,6,'DEBITO',2000.00,'2017-11-24',''),(112,7,'CREDITO',390.00,'2017-11-27',''),(113,2,'DEBITO',390.00,'2017-11-27',''),(114,7,'CREDITO',294.92,'2017-11-27',''),(115,1,'DEBITO',294.92,'2017-11-27',''),(116,6,'CREDITO',2100.00,'2017-11-29',''),(117,2,'DEBITO',2100.00,'2017-11-29',''),(118,7,'CREDITO',200.00,'2017-11-30',''),(119,2,'DEBITO',200.00,'2017-11-30',''),(120,7,'CREDITO',125.00,'2017-11-30',''),(121,2,'DEBITO',125.00,'2017-11-30',''),(122,7,'CREDITO',1120.00,'2017-12-02',''),(123,2,'DEBITO',1120.00,'2017-12-02',''),(124,7,'DEBITO',681.00,'2017-12-02','DevoluÃ§Ã£o ao Paulinho da part final'),(125,7,'CREDITO',60.00,'2017-12-02',''),(126,2,'DEBITO',60.00,'2017-12-02',''),(127,7,'CREDITO',450.00,'2017-12-04',''),(128,1,'DEBITO',450.00,'2017-12-04',''),(129,7,'CREDITO',530.00,'2017-12-04',''),(130,2,'DEBITO',530.00,'2017-12-04',''),(131,6,'CREDITO',1150.00,'2017-12-04',''),(132,7,'DEBITO',1150.00,'2017-12-04',''),(133,1,'CREDITO',150.00,'2017-12-04',''),(134,2,'DEBITO',150.00,'2017-12-04',''),(135,6,'CREDITO',1000.00,'2017-12-04',''),(136,2,'DEBITO',1000.00,'2017-12-04',''),(137,7,'CREDITO',90.00,'2017-12-06',''),(138,2,'DEBITO',90.00,'2017-12-06',''),(139,2,'DEBITO',75.00,'2017-12-07',''),(140,7,'CREDITO',150.00,'2017-12-08',''),(141,1,'DEBITO',150.00,'2017-12-08',''),(142,7,'CREDITO',850.00,'2017-12-08',''),(143,2,'DEBITO',850.00,'2017-12-08',''),(144,7,'DEBITO',287.19,'2017-12-08','Despesas'),(145,1,'CREDITO',390.00,'2017-12-09',''),(146,2,'DEBITO',390.00,'2017-12-09',''),(147,1,'CREDITO',100.00,'2017-12-10','Pagamento final Ighor (Relogio Naviforce)'),(148,1,'CREDITO',150.00,'2017-12-10',''),(149,2,'DEBITO',150.00,'2017-12-10',''),(150,7,'CREDITO',302.11,'2017-12-11',''),(151,3,'DEBITO',302.11,'2017-12-11',''),(152,7,'CREDITO',640.00,'2017-12-11',''),(153,1,'DEBITO',640.00,'2017-12-11',''),(154,1,'CREDITO',375.00,'2017-12-11',''),(155,2,'DEBITO',375.00,'2017-12-11',''),(156,7,'CREDITO',375.00,'2017-12-12',''),(157,1,'DEBITO',375.00,'2017-12-12',''),(158,7,'CREDITO',151.06,'2017-12-13',''),(159,3,'DEBITO',151.06,'2017-12-13',''),(160,2,'CREDITO',120.00,'2017-12-13','Pagamento final Thays Araujo (Chromecast 2)'),(161,1,'CREDITO',720.00,'2017-12-13',''),(162,2,'DEBITO',720.00,'2017-12-13',''),(163,2,'CREDITO',50.00,'2017-12-14','Pagamento final Bete (Creme Victorias Secret + 2 Desodorantes)'),(164,1,'CREDITO',3000.00,'2017-12-14','Saque para compra de produtos'),(165,6,'DEBITO',3000.00,'2017-12-14','Saque para compra de produtos'),(166,1,'DEBITO',20.00,'2017-12-14',''),(167,6,'CREDITO',280.00,'2017-12-15',''),(168,1,'DEBITO',280.00,'2017-12-15',''),(169,1,'CREDITO',20.00,'2017-12-15',''),(170,1,'DEBITO',40.00,'2017-12-15',''),(171,1,'CREDITO',650.00,'2017-12-15',''),(172,1,'CREDITO',2825.94,'2017-12-16',''),(173,7,'DEBITO',2825.94,'2017-12-16',''),(174,1,'CREDITO',150.00,'2017-12-16',''),(175,2,'DEBITO',150.00,'2017-12-16',''),(176,1,'CREDITO',520.00,'2017-12-16',''),(177,2,'DEBITO',520.00,'2017-12-16',''),(178,1,'CREDITO',90.00,'2017-12-16',''),(179,6,'DEBITO',90.00,'2017-12-16',''),(180,1,'CREDITO',1262.00,'2017-12-16','Compra Iphone 7 32 GB (ClÃ¡udia)'),(181,5,'CREDITO',2400.00,'2017-12-18',''),(182,2,'DEBITO',2400.00,'2017-12-18',''),(183,5,'DEBITO',1262.00,'2017-12-18','DevoluÃ§Ã£o a Luana (Iphone 7 32 GB da ClÃ¡udia)'),(184,1,'CREDITO',1138.00,'2017-12-18',''),(185,5,'DEBITO',1138.00,'2017-12-18',''),(186,7,'CREDITO',3993.31,'2017-12-18',''),(187,1,'DEBITO',3993.31,'2017-12-18',''),(188,7,'CREDITO',300.00,'2017-12-18',''),(189,1,'DEBITO',300.00,'2017-12-18',''),(190,7,'CREDITO',350.00,'2017-12-18',''),(191,2,'DEBITO',350.00,'2017-12-18',''),(192,1,'CREDITO',70.00,'2017-12-15',''),(193,2,'DEBITO',70.00,'2017-12-15',''),(194,7,'CREDITO',1470.00,'2017-12-19',''),(195,6,'DEBITO',1470.00,'2017-12-19',''),(196,7,'CREDITO',460.00,'2017-12-19',''),(197,1,'DEBITO',460.00,'2017-12-19',''),(198,1,'CREDITO',100.00,'2017-12-19',''),(199,2,'DEBITO',100.00,'2017-12-19',''),(200,7,'CREDITO',100.00,'2017-12-20',''),(201,1,'DEBITO',100.00,'2017-12-20',''),(202,7,'CREDITO',1100.00,'2017-12-20',''),(203,2,'DEBITO',1100.00,'2017-12-20',''),(204,7,'DEBITO',200.35,'2017-12-20',''),(205,7,'CREDITO',27.00,'2017-12-21',''),(206,7,'CREDITO',2973.91,'2017-12-21',''),(207,3,'DEBITO',2973.91,'2017-12-21',''),(208,2,'DEBITO',70.00,'2017-12-21',''),(209,6,'CREDITO',4173.91,'2017-12-21',''),(210,7,'DEBITO',4173.91,'2017-12-21',''),(211,7,'CREDITO',160.00,'2017-12-21',''),(212,2,'DEBITO',160.00,'2017-12-21',''),(213,7,'CREDITO',142.51,'2018-01-08',''),(214,3,'DEBITO',142.51,'2018-01-08',''),(215,7,'CREDITO',130.00,'2018-01-08',''),(216,1,'DEBITO',130.00,'2018-01-08',''),(217,7,'CREDITO',4711.00,'2018-01-08',''),(218,2,'DEBITO',4711.00,'2018-01-08',''),(219,7,'CREDITO',4173.91,'2018-01-08',''),(220,6,'DEBITO',4173.91,'2018-01-08',''),(221,2,'CREDITO',430.00,'2018-01-08',''),(222,7,'DEBITO',430.00,'2018-01-08',''),(223,7,'DEBITO',2000.00,'2017-12-27','Retirada de Ferias (Florianopolis)'),(224,2,'DEBITO',65.00,'2018-01-10',''),(225,7,'CREDITO',170.00,'2018-01-10',''),(226,2,'DEBITO',170.00,'2018-01-10',''),(227,7,'CREDITO',80.00,'2018-01-10',''),(228,2,'DEBITO',80.00,'2018-01-10',''),(229,7,'CREDITO',400.00,'2018-01-10',''),(230,1,'DEBITO',400.00,'2018-01-10',''),(231,7,'CREDITO',1680.00,'2018-01-10',''),(232,2,'DEBITO',1680.00,'2018-01-10',''),(233,7,'CREDITO',440.00,'2018-01-12',''),(234,1,'DEBITO',440.00,'2018-01-12',''),(235,7,'CREDITO',150.00,'2018-01-12',''),(236,2,'DEBITO',150.00,'2018-01-12','');
/*!40000 ALTER TABLE `tramite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'thiago','Thiago Araujo Berbet','123456','ADMIN');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  `dataVenda` date NOT NULL,
  `valorTotal` decimal(9,2) DEFAULT NULL,
  `quantidadeTotal` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  UNIQUE KEY `idVenda_UNIQUE` (`idVenda`),
  KEY `FK6eyxfbxmeg9tn95pob30peuev` (`idCliente`),
  KEY `FK2l1gbv70y170sammw1guliyj8` (`idFuncionario`),
  CONSTRAINT `FK2l1gbv70y170sammw1guliyj8` FOREIGN KEY (`idFuncionario`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `FK6eyxfbxmeg9tn95pob30peuev` FOREIGN KEY (`idCliente`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (25,7,4,'2017-09-08',160.00,1,'VENDACONCLUIDA'),(26,8,4,'2017-09-09',160.00,1,'VENDACONCLUIDA'),(27,9,4,'2017-09-07',900.00,2,'VENDACONCLUIDA'),(29,10,4,'2017-09-07',450.00,1,'VENDACONCLUIDA'),(30,11,4,'2017-09-07',140.00,1,'VENDACONCLUIDA'),(31,12,4,'2017-09-07',160.00,1,'VENDACONCLUIDA'),(32,13,4,'2017-09-07',3200.00,1,'VENDACONCLUIDA'),(33,14,4,'2017-09-23',200.00,1,'VENDACONCLUIDA'),(34,15,4,'2017-09-23',1500.00,2,'VENDACONCLUIDA'),(35,16,3,'2017-09-23',410.00,1,'VENDACONCLUIDA'),(36,17,4,'2017-09-26',400.00,1,'VENDACONCLUIDA'),(37,18,4,'2017-09-23',130.00,1,'VENDACONCLUIDA'),(38,19,4,'2017-09-28',175.00,1,'VENDACONCLUIDA'),(39,20,4,'2017-09-23',150.00,1,'VENDACONCLUIDA'),(40,21,4,'2017-09-23',410.00,1,'VENDACONCLUIDA'),(41,22,4,'2017-10-04',150.00,2,'VENDACONCLUIDA'),(42,24,4,'2017-10-12',4050.00,1,'VENDACONCLUIDA'),(43,25,4,'2017-10-14',150.00,1,'VENDACONCLUIDA'),(44,26,4,'2017-10-16',275.00,5,'VENDACONCLUIDA'),(45,27,4,'2017-10-18',80.00,1,'VENDACONCLUIDA'),(46,28,4,'2017-10-21',190.00,1,'VENDACONCLUIDA'),(47,29,4,'2017-10-21',150.00,1,'VENDACONCLUIDA'),(48,17,4,'2017-10-21',160.00,1,'VENDACONCLUIDA'),(49,26,3,'2017-10-20',3150.00,1,'VENDACONCLUIDA'),(50,23,4,'2017-11-02',3000.00,3,'VENDACONCLUIDA'),(51,30,3,'2017-11-03',150.00,1,'VENDACONCLUIDA'),(52,31,4,'2017-11-06',30.00,1,'VENDACONCLUIDA'),(53,32,4,'2017-11-06',280.00,2,'VENDACONCLUIDA'),(54,13,4,'2017-11-07',3400.00,1,'VENDACONCLUIDA'),(55,34,4,'2017-11-07',350.00,2,'VENDACONCLUIDA'),(56,33,4,'2017-11-07',1100.00,3,'VENDACONCLUIDA'),(57,35,4,'2017-11-07',120.00,1,'VENDACONCLUIDA'),(58,36,4,'2017-11-07',160.00,1,'PAGAMENTOPARCIAL'),(59,37,4,'2017-11-08',180.00,1,'VENDACONCLUIDA'),(60,7,4,'2017-11-10',70.00,1,'VENDACONCLUIDA'),(61,39,4,'2017-11-13',1120.00,1,'PAGAMENTOPARCIAL'),(62,38,3,'2017-11-13',140.00,1,'VENDACONCLUIDA'),(63,7,4,'2017-11-13',2850.00,2,'VENDACONCLUIDA'),(64,40,4,'2017-11-13',6849.99,1,'VENDACONCLUIDA'),(65,41,4,'2017-11-13',160.00,1,'VENDACONCLUIDA'),(66,20,4,'2017-11-13',300.00,2,'VENDACONCLUIDA'),(67,42,3,'2017-11-18',120.00,1,'VENDACONCLUIDA'),(68,43,4,'2017-11-19',70.00,1,'VENDACONCLUIDA'),(69,44,4,'2017-11-19',100.00,1,'VENDACONCLUIDA'),(70,7,4,'2017-11-12',470.00,1,'VENDACONCLUIDA'),(71,45,4,'2017-11-19',195.00,2,'VENDACONCLUIDA'),(72,46,4,'2017-11-02',0.00,1,'VENDACONCLUIDA'),(73,33,4,'2017-11-11',60.00,2,'VENDACONCLUIDA'),(74,47,4,'2017-11-24',150.00,1,'VENDACONCLUIDA'),(75,48,4,'2017-11-26',100.00,1,'VENDACONCLUIDA'),(76,49,4,'2017-11-26',120.00,1,'VENDACONCLUIDA'),(77,50,4,'2017-11-27',170.00,2,'VENDACONCLUIDA'),(78,51,4,'2017-11-27',160.00,2,'PAGAMENTOPARCIAL'),(79,52,4,'2017-11-27',70.00,1,'VENDACONCLUIDA'),(80,35,4,'2017-11-27',120.00,1,'VENDACONCLUIDA'),(81,53,4,'2017-11-27',170.00,2,'VENDACONCLUIDA'),(82,54,4,'2017-11-27',150.00,1,'VENDACONCLUIDA'),(83,55,4,'2017-11-29',50.00,1,'VENDACONCLUIDA'),(84,24,4,'2017-11-27',1200.00,1,'VENDACONCLUIDA'),(85,57,4,'2017-11-30',125.00,1,'VENDACONCLUIDA'),(86,56,4,'2017-11-30',120.00,1,'VENDACONCLUIDA'),(87,58,4,'2017-11-30',60.00,1,'VENDACONCLUIDA'),(88,59,4,'2017-11-30',35.00,1,'VENDACONCLUIDA'),(89,61,4,'2017-12-02',60.00,2,'VENDACONCLUIDA'),(90,62,3,'2017-11-25',450.00,1,'VENDACONCLUIDA'),(91,63,4,'2017-12-04',150.00,1,'VENDACONCLUIDA'),(92,64,4,'2017-12-04',410.00,1,'VENDACONCLUIDA'),(93,65,4,'2017-12-09',390.00,1,'VENDACONCLUIDA'),(94,49,4,'2017-12-09',320.00,1,'VENDACONCLUIDA'),(95,24,4,'2017-12-11',5600.00,1,'AGUARDANDOPAGAMENTO'),(96,66,4,'2017-12-11',1250.00,1,'PAGAMENTOPARCIAL'),(97,9,4,'2017-12-12',200.00,1,'VENDACONCLUIDA'),(99,67,4,'2017-12-15',30.00,1,'VENDACONCLUIDA'),(100,68,4,'2017-12-18',2400.00,1,'VENDACONCLUIDA'),(101,62,3,'2017-12-18',600.00,1,'VENDACONCLUIDA'),(102,24,4,'2017-12-18',1400.00,1,'VENDACONCLUIDA'),(103,69,3,'2017-12-18',150.00,1,'VENDACONCLUIDA'),(104,17,4,'2017-12-15',70.00,1,'VENDACONCLUIDA'),(105,70,3,'2017-12-18',130.00,1,'VENDACONCLUIDA'),(106,71,3,'2017-12-18',280.00,1,'PAGAMENTOPARCIAL'),(107,20,4,'2017-12-18',130.00,2,'VENDACONCLUIDA'),(108,68,4,'2017-12-18',30.00,1,'VENDACONCLUIDA'),(109,22,4,'2017-12-18',65.00,1,'VENDACONCLUIDA'),(110,72,3,'2017-12-18',240.00,2,'VENDACONCLUIDA'),(111,73,4,'2017-12-19',4073.91,1,'VENDACONCLUIDA'),(112,74,4,'2017-12-19',70.00,2,'VENDACONCLUIDA'),(113,75,4,'2017-12-21',3850.00,1,'PAGAMENTOPARCIAL'),(114,76,4,'2017-12-24',150.00,1,'PAGAMENTOPARCIAL'),(115,52,4,'2017-12-27',120.00,1,'AGUARDANDOPAGAMENTO'),(116,77,4,'2017-12-24',65.00,1,'PAGAMENTOPARCIAL'),(117,33,4,'2017-12-24',38.00,1,'VENDACONCLUIDA'),(118,78,4,'2017-12-27',50.00,1,'VENDACONCLUIDA'),(119,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(120,46,3,'2018-01-08',0.00,1,'VENDACONCLUIDA'),(121,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(122,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(123,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(124,47,4,'2018-01-10',150.00,1,'PAGAMENTOPARCIAL'),(125,79,4,'2018-01-10',210.00,1,'PAGAMENTOPARCIAL'),(126,20,4,'2018-01-10',190.00,1,'AGUARDANDOPAGAMENTO'),(127,17,4,'2018-01-10',3850.00,1,'PAGAMENTOPARCIAL'),(128,80,3,'2018-01-10',400.00,1,'VENDACONCLUIDA'),(129,81,33,'2018-01-10',60.00,2,'AGUARDANDOPAGAMENTO'),(130,82,33,'2018-01-10',120.00,1,'AGUARDANDOPAGAMENTO'),(131,51,33,'2018-01-10',455.00,4,'AGUARDANDOPAGAMENTO'),(132,47,4,'2018-01-11',150.00,1,'AGUARDANDOPAGAMENTO');
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

-- Dump completed on 2018-01-17 17:37:32
