CREATE DATABASE  IF NOT EXISTS `importcg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `importcg`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: u684253104_impcg
-- ------------------------------------------------------
-- Server version	5.7.20

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baixa`
--

LOCK TABLES `baixa` WRITE;
/*!40000 ALTER TABLE `baixa` DISABLE KEYS */;
INSERT INTO `baixa` VALUES (1,'Lançamento de despesas - Compra de Produtos (23/09/2017)',3100.70,'2017-09-27','BAIXATOTALMENTE'),(2,'Lançamento de Despesas - Compra de Produtos (12/10/2017)',5516.61,'2017-10-13','BAIXATOTALMENTE'),(3,'Lançamento de Despesas - Compra de Produtos (20/10/2017)',2400.00,'2017-10-20','BAIXATOTALMENTE'),(4,'Lançamento de Despesas - Compra de Produtos (22/10/2017)',283.05,'2017-10-22','BAIXATOTALMENTE'),(5,'Lançamento de despesas - Compra de Produtos (02/11/2017)',3807.97,'2017-11-02','BAIXATOTALMENTE'),(6,'Compra de sacolas (Central Embalagens)',32.70,'2017-10-13','BAIXATOTALMENTE'),(7,'500 Cartões de Visita (Printi)',25.64,'2017-10-27','BAIXATOTALMENTE'),(8,'Lançamento de despesas - Compra de Produtos (06/11/2017)',2872.00,'2017-11-06','BAIXATOTALMENTE'),(9,'Lançamento de despesas - Compra de Produtos (11/11/2017)',9977.81,'2017-11-13','BAIXATOTALMENTE'),(10,'Compra de sacolas (Central Embalagens)',44.65,'2017-11-13','BAIXATOTALMENTE'),(11,'Lançamento de Despesas - Compra de Produtos (25/11/2017)',2170.08,'2017-11-27','BAIXATOTALMENTE'),(12,'Lançamento de Despesas - Compra de Produtos (03/12/2017)',83.01,'2017-12-03','BAIXATOTALMENTE'),(13,'Lançamento de Despesas - Compra de Produtos (11/12/2017)',5830.98,'2017-12-11','BAIXAPARCIALMENTE'),(14,'Troca dos 2(Dois) Pneus dianteiros + Balanceamento',340.00,'2017-12-12','BAIXATOTALMENTE'),(15,'Compra de sacolas (Central Embalagens)',50.00,'2017-12-14','BAIXATOTALMENTE'),(16,'Lançamento de Despesas - Compra de Produtos (16/12/2017)',6019.63,'2017-12-18','BAIXATOTALMENTE'),(17,'Lançamento de Despesas - Compra de Produtos (19/12/2017)',3312.96,'2017-12-19','BAIXATOTALMENTE'),(18,'Lançamento de Despesas - Compra de Produtos (21/12/2017)',3347.96,'2017-12-21','BAIXATOTALMENTE'),(19,'Compras na China',364.78,'2018-01-08','BAIXATOTALMENTE'),(20,'Mensalidade Stim Social',29.96,'2018-01-08','BAIXATOTALMENTE'),(21,'Lançamento de Despesas - Compra de Produtos (09/01/2018)',4789.49,'2018-01-10','BAIXAPARCIALMENTE'),(22,'Lançamento de Despesas - Compra de Produtos (20/01/2018)',4241.73,'2018-01-22','BAIXAPARCIALMENTE');
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
INSERT INTO `caixa` VALUES (1,6,0.00),(2,7,0.00),(3,4,0.00),(4,8,89.69),(5,1,1100.00),(6,9,0.00),(7,2,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogoInternacional`
--

LOCK TABLES `catalogoInternacional` WRITE;
/*!40000 ALTER TABLE `catalogoInternacional` DISABLE KEYS */;
INSERT INTO `catalogoInternacional` VALUES (1,6,1,'2017-09-07',3.28,21.00,68.88,NULL),(4,29,1,'2017-09-23',3.30,100.00,330.00,NULL),(5,24,1,'2017-09-23',3.30,18.50,61.05,NULL),(6,7,6,'2017-09-23',3.30,85.00,280.50,NULL),(7,30,5,'2017-09-23',3.30,185.00,610.50,NULL),(8,6,4,'2017-09-23',3.29,24.66,81.13,NULL),(9,31,2,'2017-09-23',3.29,7.60,25.00,NULL),(10,32,2,'2017-09-23',3.29,10.64,35.01,NULL),(11,33,2,'2017-09-23',3.29,10.64,35.01,NULL),(12,34,2,'2017-09-23',3.29,28.88,95.02,NULL),(13,13,3,'2017-09-23',3.28,24.39,80.00,NULL),(15,7,1,'2017-09-07',3.28,80.00,262.40,NULL),(16,11,1,'2017-09-07',3.28,41.00,134.48,NULL),(17,12,2,'2017-09-07',3.28,23.48,77.01,NULL),(18,13,3,'2017-09-07',3.28,24.39,80.00,NULL),(19,14,1,'2017-09-07',3.28,680.00,2230.40,NULL),(20,6,4,'2017-10-12',3.29,24.60,80.93,30),(21,7,1,'2017-10-12',3.32,88.00,292.16,31),(22,11,1,'2017-10-12',3.32,45.00,149.40,32),(23,35,5,'2017-10-12',3.32,7.00,23.24,33),(24,36,1,'2017-10-12',3.32,107.00,355.24,34),(25,37,1,'2017-10-12',3.32,36.00,119.52,35),(26,38,1,'2017-10-12',3.32,42.00,139.44,36),(27,39,1,'2017-10-12',3.32,10.95,36.35,37),(28,40,1,'2017-10-12',3.32,3.99,13.25,38),(29,41,7,'2017-10-12',3.30,30.00,99.00,39),(30,42,2,'2017-10-12',3.30,36.36,119.99,40),(31,43,2,'2017-10-12',3.30,22.73,75.01,41),(32,44,7,'2017-10-12',3.30,969.70,3200.01,42),(33,45,7,'2017-10-20',3.30,712.12,2350.00,43),(34,46,5,'2017-10-22',3.33,10.00,33.30,44),(35,47,5,'2017-10-22',3.33,10.00,33.30,45),(36,48,5,'2017-10-22',3.33,55.00,183.15,46),(37,6,4,'2017-11-02',3.28,24.30,79.70,47),(38,6,5,'2017-11-02',3.40,30.00,102.00,48),(39,19,5,'2017-11-02',3.40,19.20,65.28,49),(40,51,5,'2017-11-02',3.40,19.20,65.28,50),(41,52,5,'2017-11-02',3.40,19.20,65.28,51),(42,49,5,'2017-11-02',3.40,7.50,25.50,52),(43,50,5,'2017-11-02',3.40,6.50,22.10,53),(44,54,3,'2017-11-02',3.38,4.44,15.01,54),(45,53,5,'2017-11-02',3.40,4.00,13.60,55),(46,9,2,'2017-11-02',3.38,20.71,70.00,56),(47,55,2,'2017-11-02',3.38,20.71,70.00,57),(48,56,2,'2017-11-02',3.38,16.57,56.01,58),(49,57,2,'2017-11-02',3.38,11.24,37.99,59),(50,58,2,'2017-11-02',3.38,3.85,13.01,60),(51,22,2,'2017-11-02',3.38,6.81,23.02,61),(52,59,2,'2017-11-02',3.38,20.12,68.01,62),(53,28,7,'2017-11-02',3.38,754.44,2550.01,63),(54,37,1,'2017-11-02',3.40,36.00,122.40,64),(55,60,1,'2017-11-02',3.40,19.38,65.89,65),(56,61,8,'2017-11-02',3.38,4.44,15.01,66),(57,62,7,'2017-11-06',3.38,835.00,2822.30,67),(58,6,4,'2017-11-11',3.38,24.26,82.00,68),(59,53,3,'2017-11-11',3.38,2.96,10.00,69),(60,64,2,'2017-11-11',3.38,25.15,85.01,70),(61,9,4,'2017-11-11',3.38,19.82,66.99,71),(62,57,2,'2017-11-11',3.38,11.24,37.99,72),(63,58,2,'2017-11-11',3.38,3.85,13.01,73),(64,65,2,'2017-11-11',3.38,3.85,13.01,74),(65,14,7,'2017-11-11',3.40,655.00,2227.00,75),(66,63,7,'2017-11-11',3.40,1800.00,6120.00,76),(67,67,7,'2017-11-11',3.40,190.00,646.00,77),(68,61,8,'2017-11-11',3.38,4.44,15.01,78),(69,68,1,'2017-11-11',3.40,19.90,67.66,79),(70,60,1,'2017-11-11',3.40,21.50,73.10,80),(71,13,3,'2017-11-11',3.38,23.67,80.00,81),(72,69,2,'2017-11-25',3.38,54.73,184.99,82),(73,43,2,'2017-11-25',3.38,23.67,80.00,83),(74,71,2,'2017-11-25',3.38,5.33,18.02,84),(75,72,2,'2017-11-25',3.38,4.44,15.01,85),(76,73,2,'2017-11-25',3.38,8.88,30.01,86),(77,74,2,'2017-11-25',3.38,9.47,32.01,87),(78,59,2,'2017-11-25',3.38,20.12,68.01,88),(79,55,2,'2017-11-25',3.38,21.90,74.02,89),(80,58,2,'2017-11-25',3.38,3.85,13.01,90),(81,70,2,'2017-11-25',3.38,101.48,343.00,91),(82,75,7,'2017-11-25',3.40,250.00,850.00,92),(83,7,5,'2017-11-25',3.40,85.00,289.00,93),(84,43,2,'2017-12-03',3.38,24.56,83.01,94),(85,75,7,'2017-12-11',3.40,234.70,797.98,95),(86,76,7,'2017-12-11',3.40,1470.00,4998.00,96),(87,77,9,'2017-12-01',3.30,12.56,41.45,97),(88,78,9,'2017-12-01',3.30,12.56,41.45,98),(89,79,9,'2017-12-01',3.30,19.79,65.31,99),(90,80,9,'2017-12-01',3.30,21.31,70.32,100),(91,81,10,'2017-12-05',3.50,38.00,133.00,101),(92,43,11,'2017-12-16',3.44,26.00,89.44,102),(93,9,11,'2017-12-16',3.44,15.94,54.83,103),(94,82,11,'2017-12-16',3.44,23.00,79.12,104),(95,83,11,'2017-12-16',3.44,128.00,440.32,105),(96,22,11,'2017-12-16',3.44,7.16,24.63,106),(97,58,11,'2017-12-16',3.44,3.88,13.35,107),(98,71,11,'2017-12-16',3.44,5.00,17.20,108),(99,74,11,'2017-12-16',3.44,10.44,35.91,109),(100,84,11,'2017-12-16',3.44,8.96,30.82,110),(101,85,11,'2017-12-16',3.44,52.00,178.88,111),(102,6,4,'2017-12-16',3.37,27.09,91.29,112),(103,7,4,'2017-12-16',3.37,82.64,278.50,113),(104,51,5,'2017-12-16',3.48,18.00,62.64,114),(105,86,5,'2017-12-16',3.48,10.00,34.80,115),(106,87,5,'2017-12-16',3.48,45.00,156.60,116),(107,59,5,'2017-12-16',3.48,22.00,76.56,117),(108,24,1,'2017-12-16',3.48,22.50,78.30,118),(109,88,1,'2017-12-16',3.48,25.40,88.39,119),(110,89,7,'2017-12-16',3.48,300.00,1044.00,120),(111,14,7,'2017-12-16',3.48,650.00,2262.00,121),(112,90,3,'2017-12-16',3.44,8.72,30.00,122),(113,44,7,'2017-12-19',3.48,952.00,3312.96,123),(114,44,7,'2017-12-21',3.48,952.00,3312.96,124),(115,9,2,'2018-01-09',3.40,17.65,60.01,125),(116,22,2,'2018-01-09',3.40,7.35,24.99,126),(117,58,2,'2018-01-09',3.40,4.71,16.01,127),(118,71,2,'2018-01-09',3.40,5.29,17.99,128),(119,42,2,'2018-01-09',3.40,39.71,135.01,129),(120,91,2,'2018-01-09',3.40,30.88,104.99,130),(121,92,2,'2018-01-09',3.40,12.06,41.00,131),(122,32,11,'2018-01-09',3.40,10.29,34.99,132),(123,74,11,'2018-01-09',3.40,10.29,34.99,133),(124,6,5,'2018-01-09',3.40,30.00,102.00,134),(125,7,5,'2018-01-09',3.40,85.00,289.00,135),(126,44,7,'2018-01-09',3.40,970.00,3298.00,136),(127,60,3,'2018-01-09',3.40,26.47,90.00,137),(128,93,1,'2018-01-09',3.40,26.00,88.40,138),(129,65,11,'2018-01-20',3.35,3.88,13.00,139),(130,94,11,'2018-01-20',3.35,62.00,207.70,140),(131,43,11,'2018-01-20',3.35,23.00,77.05,141),(132,95,11,'2018-01-20',3.35,40.00,134.00,142),(133,96,11,'2018-01-20',3.35,33.00,110.55,143),(134,97,11,'2018-01-20',3.35,63.00,211.05,144),(135,98,2,'2018-01-20',3.35,37.91,127.00,145),(136,99,2,'2018-01-20',3.35,25.37,84.99,146),(137,13,3,'2018-01-20',3.35,23.88,80.00,147),(138,100,3,'2018-01-20',3.35,25.37,84.99,148),(139,6,4,'2018-01-20',3.35,27.46,91.99,149),(140,24,1,'2018-01-20',3.40,18.20,61.88,150),(141,60,1,'2018-01-20',3.40,21.50,73.10,151),(142,11,7,'2018-01-20',3.36,41.67,140.01,152),(143,30,7,'2018-01-20',3.36,174.11,585.01,153),(144,101,7,'2018-01-20',3.36,455.00,1528.80,154);
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
INSERT INTO `conta` VALUES (1,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOITAU','8600','25946-2'),(2,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCOSANTANDER','2140','01043259-1'),(3,3,'Conta Pessoal (Corrente)','CONTABANCARIA','BANCODOBRASIL','5783-5','9582-6'),(4,3,'Conta Digital (Disponível)','CONTAWEB','PAGSEGURO','',''),(5,3,'Conta Digital','CONTAWEB','MERCADOPAGO','',''),(6,3,'Conta ImportCG','CONTAMANUAL','IMPORTCG','',''),(7,4,'Conta ImportCG','CONTAMANUAL','IMPORTCG','',''),(8,3,'Conta Digital (A Receber)','CONTAWEB','PAGSEGURO','',''),(9,3,'Conta Pessoal (Poupança)','CONTABANCARIA','BANCOITAU','8600','25946-2');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
INSERT INTO `despesa` VALUES (2,'Lançamento de despesas - Compra de Produtos (23/09/2017)',3100.70,'2017-09-23','BAIXATOTALMENTE',1),(3,'Lançamento de Despesas - Compra de Produtos (12/10/2017)',5516.61,'2017-10-12','BAIXATOTALMENTE',1),(4,'Lançamento de Despesas - Compra de Produtos (20/10/2017)',2400.00,'2017-10-20','BAIXATOTALMENTE',1),(5,'Lançamento de Despesas - Compra de Produtos (22/10/2017)',283.05,'2017-10-22','BAIXATOTALMENTE',1),(6,'Lançamento de despesas - Compra de Produtos (02/11/2017)',3807.97,'2017-11-02','BAIXATOTALMENTE',1),(7,'Compra de sacolas (Central Embalagens)',32.70,'2017-10-13','BAIXATOTALMENTE',1),(8,'500 Cartões de Visita (Printi)',25.64,'2017-10-27','BAIXATOTALMENTE',1),(10,'Lançamento de despesas - Compra de Produtos (06/11/2017)',2872.30,'2017-11-06','BAIXATOTALMENTE',1),(11,'Lançamento de Despesas - Compra de Produtos (11/11/2017)',9977.81,'2017-11-11','BAIXATOTALMENTE',1),(12,'Compra de sacolas (Central Embalagens)',44.65,'2017-11-13','BAIXATOTALMENTE',1),(13,'Lançamento de Despesas - Compra de Produtos (25/11/2017)',2170.08,'2017-11-25','BAIXATOTALMENTE',1),(14,'Lançamento de Despesas - Compra de Produtos (03/12/2017)',83.01,'2017-12-03','BAIXATOTALMENTE',1),(15,'Lançamento de Despesas - Compra de Produtos (11/12/2017)',5830.98,'2017-12-11','BAIXAPARCIALMENTE',1),(16,'Troca dos 2(Dois) Pneus dianteiros + Balanceamento',340.00,'2017-12-12','BAIXATOTALMENTE',1),(17,'Compra de sacolas (Central Embalagens)',50.00,'2017-12-14','BAIXATOTALMENTE',1),(18,'Lançamento de Despesas - Compra de Produtos (16/12/2017)',6019.63,'2017-12-16','BAIXATOTALMENTE',1),(19,'Lançamento de Despesas - Compra de Produtos (19/12/2017)',3312.96,'2017-12-19','BAIXATOTALMENTE',1),(20,'Lançamento de Despesas - Compra de Produtos (21/12/2017)',3347.96,'2017-12-21','BAIXATOTALMENTE',1),(21,'Compras na China',364.78,'2018-01-08','BAIXATOTALMENTE',1),(22,'Mensalidade Stim Social',29.96,'2018-01-08','BAIXATOTALMENTE',1),(23,'Lançamento de Despesas - Compra de Produtos (09/01/2018)',4789.49,'2018-01-09','BAIXAPARCIALMENTE',1),(24,'Lançamento de Despesas - Compra de Produtos (20/01/2018)',4241.73,'2018-01-20','BAIXAPARCIALMENTE',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (6,'2017-09-07',3446.85,9,1),(8,'2017-09-23',2804.73,13,1),(9,'2017-10-12',5285.11,19,1),(10,'2017-10-20',2350.00,1,1),(11,'2017-10-22',283.05,4,1),(12,'2017-11-02',3617.95,20,1),(13,'2017-11-06',2822.30,1,1),(14,'2017-11-11',9657.81,18,1),(15,'2017-11-25',1997.08,12,1),(16,'2017-12-03',83.01,1,1),(17,'2017-12-11',5795.98,2,1),(18,'2017-12-01',231.78,4,1),(19,'2017-12-05',133.00,1,1),(20,'2017-12-16',5616.63,26,1),(21,'2017-12-19',3312.96,1,1),(22,'2017-12-21',3312.96,1,1),(23,'2018-01-09',4454.40,18,1),(24,'2018-01-20',3844.13,19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (26,6,0),(27,7,1),(28,11,1),(29,12,0),(30,13,2),(31,14,0),(32,29,0),(33,24,0),(34,30,0),(35,31,0),(36,32,1),(37,33,-1),(38,34,0),(39,35,1),(40,36,0),(41,37,0),(42,38,0),(43,39,0),(44,40,0),(45,41,0),(46,42,0),(47,43,1),(48,44,0),(49,45,0),(50,46,0),(51,47,0),(52,48,0),(53,19,0),(54,51,1),(55,52,0),(56,49,0),(57,50,0),(58,54,0),(59,53,0),(60,9,1),(61,55,0),(62,56,0),(63,57,0),(64,58,2),(65,22,1),(66,59,1),(67,28,0),(68,60,1),(69,61,0),(70,62,0),(71,64,0),(72,65,1),(73,63,0),(74,67,0),(75,68,0),(76,69,0),(77,71,1),(78,72,0),(79,73,0),(80,74,1),(81,70,0),(82,75,0),(83,76,0),(84,77,1),(85,78,0),(86,79,1),(87,80,1),(88,81,1),(89,82,0),(90,83,0),(91,84,0),(92,85,0),(93,86,0),(94,87,0),(95,88,0),(96,89,0),(97,90,0),(98,91,0),(99,92,0),(100,93,0),(101,94,0),(102,95,0),(103,96,0),(104,97,1),(105,98,0),(106,99,1),(107,100,1),(108,101,0);
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
INSERT INTO `fornecedor` VALUES (1,'Shopping China','Avenida Internacional s/n,  Pedro Juan Caballero 79900-000, Paraguai','shoppingchina@shoppingchina.com.py','http://www.shoppingchina.com.py/','(67) 33343-3333','@shoppingchinaimportados','2017-09-12','2017-09-22'),(2,'Km Perfumaria','Av. Dr. Frância, Pedro Juan Caballero 79900-000, Paraguai','',NULL,'','','2017-09-14','2017-09-22'),(3,'Camelodromo','Paraguai','',NULL,'','','2017-09-14',NULL),(4,'Popai','Unidade 1: Mariscal López c/ Naciones Unidas, Pedro Juan Caballero Paraguai\r\nUnidade 2: Dr. Francia  c/ Ytororo, Pedro Juan Caballero Paraguai\r\n','','http://www.popaisa.com','(67) 98421-0348','','2017-09-19','2017-09-22'),(5,'Shopping Planet Outlet','Av. Internacional 7777, Pedro Juan Caballero 79900-000, Paraguai','','http://shoppingplanetoutlet.centralpark75.co/','(67) 33433-9513','@planetoutletpy','2017-09-19','2017-09-22'),(6,'Studio Center','Av. Dr. Frância 1660, Pedro Juan Caballero 79900-000, Paraguai','atendimento@studiocenter.com.py','http://www.studiocenter.com.py/','(67) 33437-7000','@studiocenterpy','2017-09-22','2017-09-22'),(7,'Axus Importados','Av. Dr. Francia c/ Iturbe, Pedro Juan Caballero Paraguai','axus2009@hotmail.com','','(67) 33432-0023','','2017-09-22','2018-01-23'),(8,'Loja de Suplementos','...','','','','','2017-11-03',NULL),(9,'AliExpress','Internet (China)','','','','','2017-12-11',NULL),(10,'GearBest','Internet (China)','','','','','2017-12-11',NULL),(11,'Perfumaria Chines','...','','','','','2017-12-18',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemBaixa`
--

LOCK TABLES `itemBaixa` WRITE;
/*!40000 ALTER TABLE `itemBaixa` DISABLE KEYS */;
INSERT INTO `itemBaixa` VALUES (1,1,1,1,'Produtos para venda comprados em dinheiro',2014.73,0.00,'2017-09-27','BAIXAPARCIAL',1),(2,1,1,1,'Produtos para venda comprados no cartão de credito',790.00,0.00,'2017-11-01','BAIXAINTEGRAL',1),(3,1,2,1,'Abastecimento realizado no Paraguai',142.00,0.00,'2017-09-27','BAIXAINTEGRAL',1),(4,1,3,1,'Abastecimento realizado em Campo Grande com cartão de crédito Santander fechamento 10/10',153.97,0.00,'2017-10-10','BAIXAINTEGRAL',1),(5,2,4,1,'Produtos para venda comprados em dinheiro',5126.46,0.00,'2017-10-13','BAIXAPARCIAL',1),(6,2,4,1,'Produtos para venda comprados no cartão de credito',158.65,0.00,'2017-11-01','BAIXAPARCIAL',1),(7,2,5,1,'Abastecimento realizado em Campo Grande',100.00,0.00,'2017-10-13','BAIXAINTEGRAL',1),(8,2,6,1,'Abastecimento realizado no Paraguai',100.00,0.00,'2017-10-13','BAIXAINTEGRAL',1),(9,2,7,1,'Almoço Self Service MR. Grill (Thiago e Luana)',31.50,0.00,'2017-10-13','BAIXAINTEGRAL',1),(10,3,8,5,'Produtos para venda comprados em dinheiro',2350.00,0.00,'2017-10-22','BAIXAINTEGRAL',1),(11,3,9,5,'Frete pago para amiga da Luana',50.00,0.00,'2017-10-22','BAIXAINTEGRAL',1),(12,4,10,1,'Produtos para venda comprados em dinheiro',283.05,0.00,'2017-10-22','BAIXAINTEGRAL',1),(13,5,11,1,'Produtos para venda comprados em dinheiro',3617.95,0.00,'2017-11-04','BAIXAINTEGRAL',1),(14,5,12,7,'Abastecimento realizado em Campo Grande',158.02,0.00,'2017-12-04','BAIXAINTEGRAL',1),(15,5,13,1,'Almoço Self Service MR. Grill (Thiago e Luana)',32.00,0.00,'2017-11-04','BAIXAINTEGRAL',1),(16,6,14,1,'Sacolas - Compra relizada via cartão de credito com vencimento para Novembro',32.70,0.00,'2017-11-06','BAIXAINTEGRAL',1),(17,7,15,7,'500 Cartões de Visita (Printi) - Compra realizada via cartão de crédito com vencimento para a mês de Dezembro',25.64,0.00,'2017-12-04','BAIXAINTEGRAL',1),(18,8,17,1,'Compra Iphone 8 64GB (Cheque para dia 08/11/2017)',1000.00,0.00,'2017-11-08','BAIXAINTEGRAL',1),(19,8,17,7,'Compra Iphone 8 64GB (Cheque para dia 08/12/2017)',1822.00,0.00,'2017-12-12','BAIXAINTEGRAL',1),(20,8,18,1,'Frete Iphone 8 64GB',50.00,0.00,'2017-11-06','BAIXAINTEGRAL',1),(21,9,19,1,'Transferência TED para conta da AXUS Informática referente ao parcelamento do Iphone 7 32GB (Entrada 1000,00 + Cheque 1227,00)',1000.00,0.00,'2017-11-14','BAIXAPARCIAL',1),(22,9,19,7,'Cheque para AXUS Informática referente ao parcelamento do Iphone 7 32GB (Entrada 1000,00 + Cheque 1227,00)',1227.00,0.00,'2017-11-21','BAIXAPARCIAL',1),(23,9,19,7,'Compra Iphone X 264GB (Cheque para dia 20/11/2017)',3060.00,0.00,'2017-11-21','BAIXAPARCIAL',1),(24,9,19,7,'Compra Iphone X 264GB (Cheque para dia 15/12/2017)',3060.00,0.00,'2017-12-18','BAIXAPARCIAL',1),(25,9,19,1,'Produtos para venda',1310.81,0.00,'2017-11-13','BAIXAPARCIAL',1),(26,9,20,1,'Abastecimento realizado em Campo Grande',120.00,0.00,'2017-11-13','BAIXAINTEGRAL',1),(27,9,21,1,'Abastecimento realizado no Paraguai',120.00,0.00,'2017-11-13','BAIXAINTEGRAL',1),(28,9,22,1,'Almoço (Luana, Thiago, Ighor e Lorena) Mr. Grill',80.00,0.00,'2017-11-13','BAIXAINTEGRAL',1),(29,10,23,7,'Compra de 3 pacotes de sacolas com 10 unidades cada. (Pequeno, Medio e Grande)',44.65,0.00,'2017-12-04','BAIXAINTEGRAL',1),(30,11,24,1,'Produtos para venda',1997.08,0.00,'2017-11-27','BAIXAINTEGRAL',1),(31,11,25,1,'Abastecimento realizado em Campo Grande',130.00,0.00,'2017-11-27','BAIXAINTEGRAL',1),(32,11,26,1,'Almoço (Luana e Thiago) Mr. Grill',43.00,0.00,'2017-11-27','BAIXAINTEGRAL',1),(33,12,27,7,'Produtos para venda',83.01,0.00,'2017-12-04','BAIXAINTEGRAL',1),(34,13,28,7,'Transferencia da Entrada (AG: 0173 C/C: 044631-9 CNPJ: 05.959.963/0001-30 Madrigal Comercio de Bebidas LTDA)',999.98,0.00,'2017-12-11','BAIXAPARCIAL',1),(35,13,28,7,'1º Cheque para AXUS referente ao parcelamento do Iphone X 64 GB e J7 Prime (Entrada 1000,00 + 2 Cheque 2398,00)',2398.00,0.00,'2018-01-15','BAIXAPARCIAL',1),(36,13,28,7,'2º Cheque para AXUS referente ao parcelamento do Iphone X 64 GB e J7 Prime (Entrada 1000,00 + 2 Cheque 2398,00)',2398.00,0.00,'2018-02-12','BAIXAPARCIAL',0),(37,13,29,7,'Frete (Van)',35.00,0.00,'2017-12-11','BAIXAINTEGRAL',1),(38,14,30,7,'Pagamento a vista em dinheiro',320.00,0.00,'2017-12-12','BAIXAINTEGRAL',1),(39,14,31,7,'Pagamento a vista em dinheiro',20.00,0.00,'2017-12-12','BAIXAINTEGRAL',1),(40,15,32,1,'Sacolas',50.00,0.00,'2017-12-14','BAIXAINTEGRAL',1),(41,16,33,1,'Produtos para venda',5616.63,0.00,'2017-12-18','BAIXAINTEGRAL',1),(42,16,34,1,'Abastecimento realizado em Campo Grande',120.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(43,16,35,1,'Abastecimento realizado no Paraguai',95.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(44,16,36,1,'Almoço (Luana, Thiago e Lorena) Mr. Grill',56.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(45,16,37,1,'Pneu 195/55 15 (Estepe)',105.00,0.00,'2017-12-18','BAIXAINTEGRAL',1),(46,16,38,7,'Café da Manha (Studio Center)',27.00,0.00,'2017-12-21','BAIXAINTEGRAL',1),(47,17,39,7,'Produtos para venda',3312.96,0.00,'2017-12-19','BAIXAINTEGRAL',1),(48,18,40,7,'Cheque para AXUS Importados referente ao Iphone 8 Plus 64GB',3312.96,0.00,'2018-01-12','BAIXAINTEGRAL',1),(49,18,41,7,'Frete (Van)',35.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(50,19,42,7,'Compra na China (GearBest)',133.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(51,19,43,7,'Compra na China (AliExpress)',231.78,0.00,'2018-01-10','BAIXAINTEGRAL',1),(52,20,44,7,'Mensalidade',29.96,0.00,'2018-01-10','BAIXAINTEGRAL',1),(53,21,45,7,'Produtos para venda',2156.40,0.00,'2018-01-10','BAIXAPARCIAL',1),(54,21,45,7,'1º Cheque para AXUS Informática referente ao parcelamento do Iphone 8 Plus 64GB (Entrada 1000,00 + 2 Cheques 1149,00)',1149.00,0.00,'2018-02-10','BAIXAPARCIAL',0),(55,21,45,7,'2º Cheque para AXUS Informática referente ao parcelamento do Iphone 8 Plus 64GB (Entrada 1000,00 + 2 Cheques 1149,00)',1149.00,0.00,'2018-03-10','BAIXAPARCIAL',0),(56,21,46,7,'Pagamento no Cartão de Crédito Mastercard Itaú',154.09,0.00,'2018-02-10','BAIXAINTEGRAL',0),(57,21,47,7,'Abastecimento em dinheiro',111.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(58,21,48,7,'Almoço Mr. Grill',50.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(59,21,49,7,'Café da Manhã',20.00,0.00,'2018-01-10','BAIXAINTEGRAL',1),(60,22,50,7,'Produtos para venda',2631.13,0.00,'2018-01-22','BAIXAPARCIAL',1),(61,22,50,7,'Cheque para AXUS Informática referente ao produto GO Pro Hero 6 Black (Entrada 900,00 + Cheque 628,00)',628.00,0.00,'2018-02-20','BAIXAPARCIAL',0),(62,22,50,7,'Cheque para AXUS Informática referente ao produto HTV 5 (Cheque 585,00)',585.00,0.00,'2018-02-05','BAIXAPARCIAL',0),(63,22,51,7,'Abastecimento realizado em Campo Grande com cartão de credito Itaú',150.00,0.00,'2018-02-10','BAIXAINTEGRAL',0),(64,22,52,7,'Abastecimento realizado no Paraguai em dinheiro',110.00,0.00,'2018-01-22','BAIXAINTEGRAL',1),(65,22,53,7,'1º Pédagio Campo Grande Sul (IDA)',7.80,0.00,'2018-01-22','BAIXAINTEGRAL',1),(66,22,54,7,'2º Pédagio Rio Brilhante Sul (IDA)',7.00,0.00,'2018-01-22','BAIXAINTEGRAL',1),(67,22,55,7,'1º Pédagio Rio Brilhante Norte (VOLTA)',7.00,0.00,'2018-01-22','BAIXAINTEGRAL',1),(68,22,56,7,'2º Pédagio Campo Grande Norte (VOLTA)',7.80,0.00,'2018-01-22','BAIXAINTEGRAL',1),(69,22,57,7,'Almoço (Luana e Thiago) Mr. Grill',38.00,0.00,'2018-01-22','BAIXAINTEGRAL',1),(70,22,58,7,'Limpadores de Para-Brisa (2 dianteiros e 1 Traseiro)',70.00,0.00,'2018-01-22','BAIXAINTEGRAL',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemDespesa`
--

LOCK TABLES `itemDespesa` WRITE;
/*!40000 ALTER TABLE `itemDespesa` DISABLE KEYS */;
INSERT INTO `itemDespesa` VALUES (1,2,8,'Produtos para venda','COMPRAPRODUTO',2804.73,'NAOBAIXADO'),(2,2,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',142.00,'NAOBAIXADO'),(3,2,NULL,'Abastecimento realizado em Campo Grande com cartão de crédito Santander fechamento 10/10','COMBUSTIVEL',153.97,'NAOBAIXADO'),(4,3,9,'Produtos para venda','COMPRAPRODUTO',5285.11,NULL),(5,3,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',100.00,NULL),(6,3,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',100.00,NULL),(7,3,NULL,'Almoço Self Service MR. Grill (Thiago e Luana)','ALIMENTACAO',31.50,NULL),(8,4,10,'Produtos para venda comprados em dinheiro','COMPRAPRODUTO',2350.00,NULL),(9,4,NULL,'Frete pago para amiga da Luana','FRETE',50.00,NULL),(10,5,11,'Produtos para venda comprados em dinheiro','COMPRAPRODUTO',283.05,NULL),(11,6,12,'Produtos para venda','COMPRAPRODUTO',3617.95,NULL),(12,6,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',158.02,NULL),(13,6,NULL,'Almoço (Luana e Thiago) Mr. Grill','ALIMENTACAO',32.00,NULL),(14,7,NULL,'Sacolas','ALMOXARIFADO',32.70,NULL),(15,8,NULL,'500 Cartões de Visita (Printi)','ALMOXARIFADO',25.64,NULL),(17,10,13,'Produtos para venda','COMPRAPRODUTO',2822.30,NULL),(18,10,NULL,'Frete Iphone 8 64GB','FRETE',50.00,NULL),(19,11,14,'Produtos para venda','COMPRAPRODUTO',9657.81,NULL),(20,11,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',120.00,NULL),(21,11,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',120.00,NULL),(22,11,NULL,'Almoço (Luana, Thiago, Ighor e Lorena) Mr. Grill','ALIMENTACAO',80.00,NULL),(23,12,NULL,'3x10 (3 tamanhos de sacolas)','ALMOXARIFADO',44.65,NULL),(24,13,15,'Produtos para venda','COMPRAPRODUTO',1997.08,NULL),(25,13,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',130.00,NULL),(26,13,NULL,'Almoço (Luana e Thiago) Mr. Grill','ALIMENTACAO',43.00,NULL),(27,14,16,'Produtos para venda','COMPRAPRODUTO',83.01,NULL),(28,15,17,'Produtos para venda','COMPRAPRODUTO',5795.98,NULL),(29,15,NULL,'Frete (Van)','FRETE',35.00,NULL),(30,16,NULL,'2(Pneus) 195/55 15','MANUTENCAOCARRO',320.00,NULL),(31,16,NULL,'Balanceamento das 2(Duas) rodas','MANUTENCAOCARRO',20.00,NULL),(32,17,NULL,'Sacolas','ALMOXARIFADO',50.00,NULL),(33,18,20,'Produtos para venda','COMPRAPRODUTO',5616.63,NULL),(34,18,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',120.00,NULL),(35,18,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',95.00,NULL),(36,18,NULL,'Almoço (Luana, Thiago e Lorena) Mr. Grill','ALIMENTACAO',56.00,NULL),(37,18,NULL,'Pneu 195/55 15 (Estepe)','MANUTENCAOCARRO',105.00,NULL),(38,18,NULL,'Café da Manha (Studio Center)','ALIMENTACAO',27.00,NULL),(39,19,21,'Produtos para venda','COMPRAPRODUTO',3312.96,NULL),(40,20,22,'Produtos para venda','COMPRAPRODUTO',3312.96,NULL),(41,20,NULL,'Frete (Van)','FRETE',35.00,NULL),(42,21,19,'Relogio','COMPRAPRODUTO',133.00,NULL),(43,21,18,'Relogios','COMPRAPRODUTO',231.78,NULL),(44,22,NULL,'Mensalidade','REDESOCIAL',29.96,NULL),(45,23,23,'Produtos para venda','COMPRAPRODUTO',4454.40,NULL),(46,23,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',154.09,NULL),(47,23,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',111.00,NULL),(48,23,NULL,'Almoço Mr. Grill','ALIMENTACAO',50.00,NULL),(49,23,NULL,'Café da Manhã','ALIMENTACAO',20.00,NULL),(50,24,24,'Produtos para venda','COMPRAPRODUTO',3844.13,NULL),(51,24,NULL,'Abastecimento realizado em Campo Grande','COMBUSTIVEL',150.00,NULL),(52,24,NULL,'Abastecimento realizado no Paraguai','COMBUSTIVEL',110.00,NULL),(53,24,NULL,'1º Pédagio Campo Grande Sul (IDA) ','OUTROS',7.80,NULL),(54,24,NULL,'2º Pédagio Rio Brilhante Sul (IDA) ','OUTROS',7.00,NULL),(55,24,NULL,'1º Pédagio Rio Brilhante Norte (VOLTA) ','OUTROS',7.00,NULL),(56,24,NULL,'2º Pédagio Campo Grande Norte (VOLTA) ','OUTROS',7.80,NULL),(57,24,NULL,'Almoço (Luana e Thiago) Mr. Grill','ALIMENTACAO',38.00,NULL),(58,24,NULL,'Limpadores de Para-Brisa (2 dianteiros e 1 Traseiro)','MANUTENCAOCARRO',70.00,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemEntrada`
--

LOCK TABLES `itemEntrada` WRITE;
/*!40000 ALTER TABLE `itemEntrada` DISABLE KEYS */;
INSERT INTO `itemEntrada` VALUES (12,6,6,1,21.00,68.88,3.28,2),(13,6,7,1,80.00,262.40,3.28,3),(14,6,11,1,41.00,134.48,3.28,1),(15,6,12,2,23.48,77.01,3.28,1),(16,6,13,3,24.39,80.00,3.28,1),(17,6,14,1,680.00,2230.40,3.28,1),(20,8,29,1,100.00,330.00,3.30,1),(21,8,24,1,18.50,61.05,3.30,1),(22,8,7,6,85.00,280.50,3.30,3),(23,8,30,5,185.00,610.50,3.30,2),(24,8,6,4,24.66,81.13,3.29,1),(25,8,31,2,7.60,25.00,3.29,1),(26,8,32,2,10.64,35.01,3.29,1),(27,8,33,2,10.64,35.01,3.29,1),(28,8,34,2,28.88,95.02,3.29,1),(29,8,13,3,24.32,80.01,3.29,1),(30,9,6,4,24.60,80.93,3.29,2),(31,9,7,5,88.00,292.16,3.32,1),(32,9,11,1,45.00,149.40,3.32,1),(33,9,35,5,7.00,23.24,3.32,1),(34,9,36,1,107.00,355.24,3.32,2),(35,9,37,1,36.00,119.52,3.32,1),(36,9,38,1,42.00,139.44,3.32,1),(37,9,39,1,10.95,36.35,3.32,5),(38,9,40,1,3.99,13.25,3.32,1),(39,9,41,7,30.00,99.00,3.30,1),(40,9,42,2,36.36,119.99,3.30,1),(41,9,43,2,22.73,75.01,3.30,1),(42,9,44,7,969.70,3200.01,3.30,1),(43,10,45,7,712.12,2350.00,3.30,1),(44,11,46,5,10.00,33.30,3.33,1),(45,11,47,5,10.00,33.30,3.33,2),(46,11,48,5,55.00,183.15,3.33,1),(47,12,6,4,24.30,79.70,3.28,2),(48,12,6,5,30.00,102.00,3.40,1),(49,12,19,5,19.20,65.28,3.40,1),(50,12,51,5,19.20,65.28,3.40,1),(51,12,52,5,19.20,65.28,3.40,1),(52,12,49,5,8.70,29.58,3.40,1),(53,12,50,5,7.70,26.18,3.40,1),(54,12,54,3,4.44,15.01,3.38,1),(55,12,53,5,4.00,13.60,3.40,1),(56,12,9,2,16.27,54.99,3.38,1),(57,12,55,2,20.71,70.00,3.38,1),(58,12,56,2,16.57,56.01,3.38,1),(59,12,57,2,11.24,37.99,3.38,1),(60,12,58,2,3.85,13.01,3.38,1),(61,12,22,2,6.81,23.02,3.38,1),(62,12,59,2,20.12,68.01,3.38,1),(63,12,28,7,754.44,2550.01,3.38,1),(64,12,37,1,36.00,122.40,3.40,1),(65,12,60,1,19.38,65.89,3.40,1),(66,12,61,8,4.44,15.01,3.38,1),(67,13,62,7,835.00,2822.30,3.38,1),(68,14,6,4,24.26,82.00,3.38,1),(69,14,53,3,2.96,10.00,3.38,1),(70,14,64,2,25.15,85.01,3.38,1),(71,14,9,4,19.82,66.99,3.38,1),(72,14,57,2,11.24,37.99,3.38,1),(73,14,58,2,3.85,13.01,3.38,3),(74,14,65,2,3.85,13.01,3.38,1),(75,14,14,7,655.00,2227.00,3.40,1),(76,14,63,7,1800.00,6120.00,3.40,1),(77,14,67,7,190.00,646.00,3.40,1),(78,14,61,8,4.44,15.01,3.38,2),(79,14,68,1,19.90,67.66,3.40,1),(80,14,60,1,21.50,73.10,3.40,1),(81,14,13,3,23.67,80.00,3.38,2),(82,15,69,2,54.73,184.99,3.38,1),(83,15,43,2,23.67,80.00,3.38,1),(84,15,71,2,5.33,18.02,3.38,1),(85,15,72,2,4.44,15.01,3.38,1),(86,15,73,2,8.88,30.01,3.38,1),(87,15,74,2,9.47,32.01,3.38,1),(88,15,59,2,20.12,68.01,3.38,1),(89,15,55,2,21.90,74.02,3.38,1),(90,15,58,2,3.85,13.01,3.38,1),(91,15,70,2,101.48,343.00,3.38,1),(92,15,75,7,250.00,850.00,3.40,1),(93,15,7,5,85.00,289.00,3.40,1),(94,16,43,2,24.56,83.01,3.38,1),(95,17,75,7,234.70,797.98,3.40,1),(96,17,76,7,1470.00,4998.00,3.40,1),(97,18,77,9,12.56,43.96,3.50,1),(98,18,78,9,12.56,43.96,3.50,1),(99,18,79,9,19.79,69.27,3.50,1),(100,18,80,9,21.31,74.59,3.50,1),(101,19,81,10,38.00,133.00,3.50,1),(102,20,43,11,26.00,89.44,3.44,1),(103,20,9,11,15.94,54.83,3.44,1),(104,20,82,11,23.00,79.12,3.44,1),(105,20,83,11,128.00,440.32,3.44,1),(106,20,22,11,7.16,24.63,3.44,1),(107,20,58,11,3.88,13.35,3.44,2),(108,20,71,11,5.00,17.20,3.44,1),(109,20,74,11,10.44,35.91,3.44,2),(110,20,84,11,8.96,30.82,3.44,1),(111,20,85,11,52.00,178.88,3.44,1),(112,20,6,4,27.09,91.29,3.37,2),(113,20,7,4,82.64,278.50,3.37,2),(114,20,51,5,18.00,62.64,3.48,1),(115,20,86,5,10.00,34.80,3.48,1),(116,20,87,5,45.00,156.60,3.48,1),(117,20,59,5,22.00,76.56,3.48,1),(118,20,24,1,22.50,78.30,3.48,1),(119,20,88,1,25.40,88.39,3.48,1),(120,20,89,7,300.00,1044.00,3.48,1),(121,20,14,7,650.00,2262.00,3.48,1),(122,20,90,3,8.72,30.00,3.44,2),(123,21,44,7,952.00,3312.96,3.48,1),(124,22,44,7,952.00,3312.96,3.48,1),(125,23,9,2,17.65,60.01,3.40,2),(126,23,22,2,7.35,24.99,3.40,2),(127,23,58,2,4.71,16.01,3.40,3),(128,23,71,2,5.29,17.99,3.40,1),(129,23,42,2,39.71,135.01,3.40,1),(130,23,91,2,30.88,104.99,3.40,1),(131,23,92,2,12.06,41.00,3.40,1),(132,23,32,11,10.29,34.99,3.40,1),(133,23,74,11,10.29,34.99,3.40,1),(134,23,6,5,30.00,102.00,3.40,1),(135,23,7,5,85.00,289.00,3.40,1),(136,23,44,7,970.00,3298.00,3.40,1),(137,23,60,3,26.47,90.00,3.40,1),(138,23,93,1,26.00,88.40,3.40,1),(139,24,65,11,3.88,13.00,3.35,2),(140,24,94,11,62.00,207.70,3.35,1),(141,24,43,11,23.00,77.05,3.35,1),(142,24,95,11,40.00,134.00,3.35,1),(143,24,96,11,33.00,110.55,3.35,1),(144,24,97,11,63.00,211.05,3.35,1),(145,24,98,2,37.91,127.00,3.35,1),(146,24,99,2,25.37,84.99,3.35,1),(147,24,13,3,23.88,80.00,3.35,2),(148,24,100,3,25.37,84.99,3.35,1),(149,24,6,4,27.46,91.99,3.35,1),(150,24,24,1,18.20,61.88,3.40,1),(151,24,60,1,21.50,73.10,3.40,1),(152,24,11,7,41.67,140.01,3.36,2),(153,24,30,7,174.11,585.01,3.36,1),(154,24,101,7,455.00,1528.80,3.36,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemVenda`
--

LOCK TABLES `itemVenda` WRITE;
/*!40000 ALTER TABLE `itemVenda` DISABLE KEYS */;
INSERT INTO `itemVenda` VALUES (40,25,6,12,160.00,1),(41,26,6,12,160.00,1),(42,27,7,22,450.00,2),(43,29,7,13,450.00,1),(44,30,12,15,140.00,1),(45,31,13,16,160.00,1),(46,32,14,17,3200.00,1),(47,33,11,14,200.00,1),(48,34,30,23,750.00,2),(49,35,29,20,410.00,1),(50,36,7,22,400.00,1),(51,37,24,21,130.00,1),(52,38,34,28,175.00,1),(53,39,13,29,150.00,1),(54,40,7,13,410.00,1),(55,41,32,26,65.00,1),(56,41,6,24,85.00,1),(57,42,44,42,4050.00,1),(58,43,41,39,150.00,1),(59,44,39,37,55.00,5),(60,45,6,30,80.00,1),(61,46,42,40,190.00,1),(62,47,43,41,150.00,1),(63,48,6,30,160.00,1),(64,49,45,43,3150.00,1),(65,50,28,63,3000.00,1),(66,50,54,54,0.00,1),(67,50,53,55,0.00,1),(68,51,6,48,150.00,1),(69,52,58,60,30.00,1),(70,53,48,46,250.00,1),(71,53,61,66,30.00,1),(72,54,62,67,3400.00,1),(73,55,37,35,175.00,1),(74,55,38,36,175.00,1),(75,56,36,34,500.00,2),(76,56,56,58,100.00,1),(77,57,9,56,120.00,1),(78,58,6,47,160.00,1),(79,59,37,64,180.00,1),(80,60,57,59,70.00,1),(81,61,67,77,1120.00,1),(82,62,60,80,140.00,1),(83,63,14,75,2850.00,1),(84,64,63,76,6849.99,1),(85,65,64,70,160.00,1),(86,66,13,81,150.00,2),(87,67,6,68,120.00,1),(88,68,31,25,70.00,1),(89,69,52,51,100.00,1),(90,70,7,13,470.00,1),(91,71,59,62,130.00,1),(92,71,47,45,65.00,1),(93,72,47,45,0.00,1),(94,63,53,69,0.00,1),(95,73,58,73,30.00,2),(96,74,60,65,150.00,1),(97,75,19,49,100.00,1),(98,76,55,57,120.00,1),(99,77,55,89,110.00,1),(100,77,73,86,60.00,1),(101,78,59,88,130.00,1),(102,78,58,90,30.00,1),(103,79,50,53,70.00,1),(104,80,68,79,120.00,1),(105,81,72,85,50.00,1),(107,81,9,71,120.00,1),(108,82,43,83,150.00,1),(109,83,22,61,50.00,1),(110,84,75,92,1200.00,1),(111,85,6,47,125.00,1),(112,86,51,50,120.00,1),(113,87,74,87,60.00,1),(114,88,61,78,35.00,1),(115,89,71,84,35.00,1),(116,89,58,73,25.00,1),(117,90,70,91,450.00,1),(118,91,43,94,150.00,1),(119,92,7,31,410.00,1),(120,93,7,93,390.00,1),(121,94,69,82,320.00,1),(122,95,76,96,5600.00,1),(123,96,75,95,1250.00,1),(124,97,11,32,200.00,1),(126,99,40,38,30.00,1),(127,100,14,121,2400.00,1),(128,101,83,105,600.00,1),(129,102,89,120,1400.00,1),(130,103,88,119,150.00,1),(131,104,49,52,70.00,1),(132,105,24,118,130.00,1),(133,106,87,116,280.00,1),(134,107,90,122,65.00,2),(135,108,58,107,30.00,1),(136,109,57,72,65.00,1),(137,110,6,112,120.00,2),(138,111,44,123,4073.91,1),(139,112,58,107,30.00,1),(140,112,71,108,40.00,1),(141,113,44,124,3850.00,1),(142,114,82,104,150.00,1),(143,115,9,103,120.00,1),(144,116,74,109,65.00,1),(145,117,74,109,38.00,1),(146,118,22,106,50.00,1),(147,119,84,110,0.00,1),(148,120,46,44,0.00,1),(149,121,33,27,0.00,1),(150,122,7,113,0.00,1),(151,123,85,111,0.00,1),(152,124,60,137,150.00,1),(153,125,42,129,210.00,1),(154,126,93,138,190.00,1),(155,127,44,136,3850.00,1),(156,128,7,135,400.00,1),(159,131,91,130,180.00,1),(160,131,92,131,75.00,1),(161,131,22,126,50.00,1),(162,131,43,102,150.00,1),(163,132,6,134,150.00,1),(164,133,101,154,1800.00,1),(165,134,65,139,30.00,2),(166,135,95,142,230.00,1),(167,136,11,152,210.00,1),(168,137,96,143,250.00,1),(169,138,30,153,810.00,1),(170,139,24,150,130.00,1),(171,140,94,140,350.00,1),(172,141,98,145,200.00,1),(173,142,6,149,130.00,1),(174,143,58,127,30.00,1),(175,144,9,125,120.00,1),(176,145,61,78,30.00,1),(177,145,78,98,150.00,1),(178,146,86,115,95.00,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (7,25,'DINHEIRO','2017-10-10',80.00,1,NULL,NULL,80.00,NULL,NULL,NULL,NULL),(15,26,'CREDITO','2017-09-09',160.00,1,3,56.56,151.06,8.94,'2017-09-10',NULL,NULL),(16,27,'DINHEIRO','2017-09-07',300.00,1,0,0.00,300.00,0.00,NULL,NULL,NULL),(17,27,'DINHEIRO','2017-10-07',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(18,27,'DINHEIRO','2017-11-07',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(19,29,'DINHEIRO','2017-09-07',150.00,1,0,0.00,150.00,0.00,NULL,NULL,NULL),(20,29,'DINHEIRO','2017-10-11',300.00,1,0,0.00,300.00,0.00,NULL,NULL,NULL),(22,30,'DINHEIRO','2017-09-19',70.00,1,0,0.00,70.00,0.00,NULL,NULL,NULL),(23,30,'DINHEIRO','2017-10-19',70.00,1,0,0.00,70.00,0.00,NULL,NULL,NULL),(26,32,'DINHEIRO','2017-09-07',1600.00,1,0,0.00,1600.00,0.00,NULL,NULL,NULL),(27,32,'DINHEIRO','2017-10-08',1600.00,1,0,0.00,1600.00,0.00,NULL,NULL,NULL),(28,33,'DINHEIRO','2017-09-25',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(29,34,'DINHEIRO','2017-09-25',1500.00,1,0,0.00,1500.00,0.00,NULL,NULL,NULL),(30,35,'DINHEIRO','2017-09-23',410.00,1,0,0.00,410.00,0.00,NULL,NULL,NULL),(31,36,'DINHEIRO','2017-09-26',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(32,36,'DINHEIRO','2017-10-26',50.00,1,0,0.00,50.00,0.00,NULL,NULL,NULL),(33,36,'DINHEIRO','2017-10-28',50.00,1,0,0.00,50.00,0.00,NULL,NULL,NULL),(34,37,'DINHEIRO','2017-10-09',130.00,1,0,0.00,130.00,0.00,NULL,NULL,NULL),(35,38,'DINHEIRO','2017-09-28',175.00,1,0,0.00,175.00,0.00,NULL,NULL,NULL),(36,39,'DINHEIRO','2017-11-06',150.00,1,0,0.00,150.00,0.00,NULL,NULL,NULL),(37,40,'DINHEIRO','2017-09-25',410.00,1,0,0.00,410.00,0.00,NULL,NULL,NULL),(38,31,'DINHEIRO','2017-09-28',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(39,31,'DINHEIRO','2017-10-28',60.00,1,0,0.00,60.00,0.00,NULL,NULL,NULL),(40,41,'DINHEIRO','2017-10-04',75.00,1,0,0.00,75.00,0.00,NULL,NULL,NULL),(41,41,'DINHEIRO','2017-11-20',75.00,1,0,0.00,75.00,0.00,NULL,NULL,NULL),(42,27,'DINHEIRO','2017-12-11',200.00,1,0,0.00,200.00,0.00,NULL,NULL,NULL),(43,25,'DINHEIRO','2017-11-10',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(44,42,'DINHEIRO','2017-10-12',950.00,1,0,0.00,950.00,0.00,NULL,NULL,NULL),(45,42,'DINHEIRO','2017-11-07',1000.00,1,0,0.00,1000.00,0.00,NULL,NULL,NULL),(46,43,'DINHEIRO','2017-10-14',150.00,1,0,0.00,150.00,0.00,NULL,NULL,NULL),(47,44,'DINHEIRO','2017-10-16',275.00,1,0,0.00,275.00,0.00,NULL,NULL,NULL),(48,45,'DINHEIRO','2017-11-24',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(50,46,'DINHEIRO','2017-11-07',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(51,46,'DINHEIRO','2017-12-05',90.00,1,0,0.00,90.00,0.00,NULL,NULL,NULL),(52,47,'DINHEIRO','2017-10-21',50.00,1,0,0.00,50.00,0.00,NULL,NULL,NULL),(53,47,'DINHEIRO','2017-11-05',100.00,1,0,0.00,100.00,0.00,NULL,NULL,NULL),(54,48,'DINHEIRO','2017-10-21',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(55,48,'DINHEIRO','2017-11-05',80.00,1,0,0.00,80.00,0.00,NULL,NULL,NULL),(56,49,'DINHEIRO','2017-10-20',1600.00,1,0,0.00,1600.00,0.00,NULL,NULL,NULL),(57,49,'CREDITO','2017-10-20',1550.00,1,2,809.96,1463.35,86.65,'2017-10-21',NULL,NULL),(58,50,'DINHEIRO','2017-11-02',3000.00,1,0,0.00,3000.00,0.00,NULL,NULL,NULL),(59,51,'CREDITO','2017-11-03',150.00,1,1,150.00,142.51,7.49,'2017-11-04',NULL,NULL),(60,52,'DINHEIRO','2017-11-06',30.00,1,0,0.00,30.00,0.00,NULL,NULL,NULL),(61,53,'DINHEIRO','2017-11-06',280.00,1,0,0.00,280.00,0.00,NULL,NULL,NULL),(62,54,'DINHEIRO','2017-11-07',1000.00,1,0,0.00,1000.00,0.00,NULL,NULL,NULL),(63,54,'DINHEIRO','2017-12-01',1200.00,1,0,0.00,1200.00,0.00,NULL,NULL,NULL),(64,54,'DINHEIRO','2017-12-04',1000.00,1,0,0.00,1000.00,-200.00,NULL,NULL,NULL),(65,55,'DINHEIRO','2017-11-07',350.00,1,0,0.00,350.00,0.00,NULL,NULL,NULL),(66,56,'DINHEIRO','2017-11-07',500.00,1,0,0.00,500.00,0.00,NULL,NULL,NULL),(67,56,'DINHEIRO','2017-12-15',400.00,1,0,0.00,400.00,-200.00,NULL,NULL,NULL),(68,57,'DINHEIRO','2017-12-10',120.00,1,0,0.00,120.00,0.00,NULL,NULL,NULL),(69,42,'DINHEIRO','2017-11-28',2100.00,1,0,0.00,2100.00,-50.00,NULL,NULL,NULL),(70,58,'DINHEIRO','2017-12-20',53.00,1,0,0.00,53.00,0.00,NULL,NULL,NULL),(71,58,'DINHEIRO','2018-01-10',53.00,0,0,0.00,53.00,0.00,NULL,NULL,NULL),(72,58,'DINHEIRO','2018-02-10',54.00,0,0,0.00,54.00,0.00,NULL,NULL,NULL),(73,59,'DINHEIRO','2017-11-08',90.00,1,0,0.00,90.00,0.00,NULL,NULL,NULL),(74,59,'DINHEIRO','2017-12-05',90.00,1,0,0.00,90.00,0.00,NULL,NULL,NULL),(75,60,'DINHEIRO','2017-11-10',70.00,1,0,0.00,70.00,0.00,NULL,NULL,NULL),(76,61,'DINHEIRO','2017-11-13',112.00,1,0,0.00,112.00,0.00,NULL,NULL,NULL),(77,61,'DINHEIRO','2017-12-15',120.00,1,0,0.00,120.00,8.00,NULL,NULL,NULL),(78,61,'DINHEIRO','2018-01-09',120.00,1,0,0.00,120.00,8.00,NULL,NULL,NULL),(79,61,'DINHEIRO','2018-02-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(80,61,'DINHEIRO','2018-03-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(81,61,'DINHEIRO','2018-04-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(82,61,'DINHEIRO','2018-05-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(83,61,'DINHEIRO','2018-06-09',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(84,61,'DINHEIRO','2018-07-10',120.00,0,0,0.00,120.00,8.00,NULL,NULL,NULL),(85,61,'DINHEIRO','2018-08-10',48.00,0,0,0.00,48.00,-64.00,NULL,NULL,NULL),(86,62,'DINHEIRO','2017-11-13',140.00,1,0,0.00,140.00,0.00,NULL,NULL,NULL),(87,63,'CREDITO','2017-11-13',1450.00,1,10,169.90,1368.94,81.06,'2017-11-14',NULL,NULL),(88,64,'CHEQUE','2017-11-11',2283.33,1,0,0.00,2283.33,0.00,NULL,'2017-11-12',7),(89,64,'CHEQUE','2017-12-11',2283.33,1,0,0.00,2283.33,0.00,NULL,'2017-12-12',7),(90,64,'CHEQUE','2018-01-11',2283.33,1,0,0.00,2283.33,0.00,NULL,'2018-01-15',7),(91,65,'CREDITO','2017-11-12',160.00,1,2,83.61,151.06,8.94,'2017-12-12',NULL,NULL),(92,66,'DINHEIRO','2017-11-29',150.00,1,0,0.00,150.00,-150.00,NULL,NULL,NULL),(93,63,'CREDITO','2017-11-15',1400.00,1,10,164.04,1321.74,78.26,'2017-11-16',NULL,NULL),(94,67,'DINHEIRO','2017-11-18',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(95,68,'DINHEIRO','2017-12-19',70.00,1,0,0.00,70.00,5.00,NULL,NULL,NULL),(96,69,'DINHEIRO','2017-11-22',100.00,1,0,0.00,100.00,-30.00,NULL,NULL,NULL),(97,70,'DINHEIRO','2017-12-01',160.00,1,0,0.00,160.00,-310.00,NULL,NULL,NULL),(98,71,'DINHEIRO','2017-12-10',195.00,1,0,0.00,195.00,195.00,NULL,NULL,NULL),(99,72,'DINHEIRO','2017-11-02',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(100,73,'DINHEIRO','2017-11-21',60.00,1,0,0.00,60.00,60.00,NULL,NULL,NULL),(101,74,'DINHEIRO','2017-11-24',75.00,1,0,0.00,75.00,75.00,NULL,NULL,NULL),(102,74,'DINHEIRO','2018-01-02',75.00,1,0,0.00,75.00,75.00,NULL,NULL,NULL),(103,36,'DINHEIRO','2017-11-24',50.00,1,0,0.00,50.00,50.00,NULL,NULL,NULL),(104,75,'DINHEIRO','2017-11-26',100.00,1,0,0.00,100.00,100.00,NULL,NULL,NULL),(105,76,'DINHEIRO','2017-11-26',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(106,77,'DINHEIRO','2017-11-27',170.00,1,0,0.00,170.00,170.00,NULL,NULL,NULL),(107,78,'DINHEIRO','2017-12-10',110.00,1,0,0.00,110.00,110.00,NULL,NULL,NULL),(108,78,'DINHEIRO','2018-01-12',50.00,0,0,0.00,50.00,50.00,NULL,NULL,NULL),(109,79,'DINHEIRO','2017-12-14',70.00,1,0,0.00,70.00,70.00,NULL,NULL,NULL),(110,80,'DINHEIRO','2018-01-08',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(111,81,'DINHEIRO','2017-12-01',170.00,1,0,0.00,170.00,170.00,NULL,NULL,NULL),(112,82,'CREDITO','2017-11-27',150.00,1,1,150.00,142.51,7.49,'2017-12-27',NULL,NULL),(113,66,'DINHEIRO','2017-12-07',150.00,1,0,0.00,150.00,150.00,NULL,NULL,NULL),(114,83,'DINHEIRO','2017-11-29',50.00,1,0,0.00,50.00,50.00,NULL,NULL,NULL),(115,84,'DINHEIRO','2017-12-28',1200.00,1,0,0.00,1200.00,1200.00,NULL,NULL,NULL),(116,85,'DINHEIRO','2017-11-30',125.00,1,0,0.00,125.00,125.00,NULL,NULL,NULL),(117,86,'DINHEIRO','2017-11-30',120.00,1,0,0.00,120.00,120.00,NULL,NULL,NULL),(118,87,'DINHEIRO','2017-12-10',60.00,1,0,0.00,60.00,60.00,NULL,NULL,NULL),(119,88,'DINHEIRO','2017-12-11',35.00,1,0,0.00,35.00,35.00,NULL,NULL,NULL),(120,70,'DINHEIRO','2017-12-20',160.00,1,0,0.00,160.00,-150.00,NULL,NULL,NULL),(121,89,'DINHEIRO','2017-12-02',60.00,1,0,0.00,60.00,60.00,NULL,NULL,NULL),(122,90,'DINHEIRO','2017-12-02',450.00,1,0,0.00,450.00,450.00,NULL,NULL,NULL),(123,54,'DINHEIRO','2017-12-05',200.00,1,0,0.00,200.00,200.00,NULL,NULL,NULL),(124,91,'DINHEIRO','2017-12-04',150.00,1,0,0.00,150.00,150.00,NULL,NULL,NULL),(125,92,'DINHEIRO','2017-12-05',410.00,1,0,0.00,410.00,410.00,NULL,NULL,NULL),(126,93,'DINHEIRO','2017-12-09',390.00,1,0,0.00,390.00,390.00,NULL,NULL,NULL),(127,94,'CREDITO','2017-12-09',320.00,1,2,167.22,302.11,17.89,'2017-12-10',NULL,NULL),(128,95,'DINHEIRO','2018-01-27',2800.00,0,0,0.00,2800.00,500.00,NULL,NULL,NULL),(129,95,'DINHEIRO','2018-02-27',2800.00,0,0,0.00,2800.00,2800.00,NULL,NULL,NULL),(130,96,'DINHEIRO','2017-12-11',400.00,1,0,0.00,400.00,400.00,NULL,NULL,NULL),(131,96,'DINHEIRO','2018-01-09',170.00,1,0,0.00,170.00,-680.00,NULL,NULL,NULL),(132,97,'DINHEIRO','2017-12-12',200.00,1,0,0.00,200.00,200.00,NULL,NULL,NULL),(134,99,'DINHEIRO','2017-12-15',30.00,1,0,0.00,30.00,30.00,NULL,NULL,NULL),(135,56,'DINHEIRO','2018-01-08',200.00,1,0,0.00,200.00,200.00,NULL,NULL,NULL),(136,100,'DINHEIRO','2017-12-18',2400.00,1,0,0.00,2400.00,2400.00,NULL,NULL,NULL),(137,101,'DINHEIRO','2017-12-18',300.00,1,0,0.00,300.00,300.00,NULL,NULL,NULL),(138,101,'DINHEIRO','2018-01-10',300.00,1,0,0.00,300.00,300.00,NULL,NULL,NULL),(139,102,'DINHEIRO','2017-12-18',350.00,1,0,0.00,350.00,350.00,NULL,NULL,NULL),(140,102,'DINHEIRO','2017-12-28',1050.00,1,0,0.00,1050.00,1050.00,NULL,NULL,NULL),(141,103,'DINHEIRO','2017-12-17',150.00,1,0,0.00,150.00,150.00,NULL,NULL,NULL),(142,104,'DINHEIRO','2017-12-15',70.00,1,0,0.00,70.00,70.00,NULL,NULL,NULL),(143,105,'DINHEIRO','2017-12-19',130.00,1,0,0.00,130.00,130.00,NULL,NULL,NULL),(144,106,'DINHEIRO','2018-01-08',140.00,1,0,0.00,140.00,40.00,NULL,NULL,NULL),(145,106,'DINHEIRO','2018-02-08',140.00,0,0,0.00,140.00,-10.00,NULL,NULL,NULL),(146,107,'DINHEIRO','2018-01-09',130.00,1,0,0.00,130.00,130.00,NULL,NULL,NULL),(147,108,'DINHEIRO','2017-12-18',30.00,1,0,0.00,30.00,30.00,NULL,NULL,NULL),(148,109,'DINHEIRO','2018-01-10',65.00,1,0,0.00,65.00,65.00,NULL,NULL,NULL),(149,110,'DINHEIRO','2017-12-18',240.00,1,0,0.00,240.00,240.00,NULL,NULL,NULL),(150,111,'DINHEIRO','2017-12-20',1100.00,1,0,0.00,1100.00,100.00,NULL,NULL,NULL),(152,112,'DINHEIRO','2017-12-19',70.00,1,0,0.00,70.00,70.00,NULL,NULL,NULL),(154,111,'CREDITO','2017-12-20',1550.00,1,3,547.88,1463.35,86.65,'2017-12-21',NULL,NULL),(155,111,'CREDITO','2017-12-20',1600.00,1,5,349.28,1510.56,89.44,'2017-12-21',NULL,NULL),(156,70,'DINHEIRO','2018-01-10',150.00,1,0,0.00,150.00,40.00,NULL,NULL,NULL),(157,113,'DINHEIRO','2017-12-21',1925.00,1,0,0.00,1925.00,-75.00,NULL,NULL,NULL),(158,113,'DINHEIRO','2018-01-23',1925.00,1,0,0.00,1925.00,75.00,NULL,NULL,5),(159,114,'DINHEIRO','2018-01-13',80.00,1,0,0.00,80.00,-70.00,NULL,NULL,7),(160,115,'DINHEIRO','2018-01-10',120.00,0,0,0.00,120.00,120.00,NULL,NULL,NULL),(161,116,'DINHEIRO','2018-01-13',40.00,1,0,0.00,40.00,-25.00,NULL,NULL,7),(162,117,'DINHEIRO','2018-01-08',38.00,1,0,0.00,38.00,38.00,NULL,NULL,NULL),(163,118,'DINHEIRO','2017-12-27',50.00,1,0,0.00,50.00,50.00,NULL,NULL,NULL),(164,119,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(165,120,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(166,121,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(167,122,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(168,123,'DINHEIRO','2017-12-27',0.00,1,0,0.00,0.00,0.00,NULL,NULL,NULL),(169,96,'DINHEIRO','2018-02-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(170,96,'DINHEIRO','2018-03-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(171,96,'DINHEIRO','2018-04-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(172,96,'DINHEIRO','2018-05-10',170.00,0,0,0.00,170.00,170.00,NULL,NULL,NULL),(173,124,'DINHEIRO','2018-01-10',80.00,1,0,0.00,80.00,80.00,NULL,NULL,NULL),(174,124,'DINHEIRO','2018-02-10',70.00,0,0,0.00,70.00,70.00,NULL,NULL,NULL),(175,125,'DINHEIRO','2018-01-13',100.00,1,0,0.00,100.00,-5.00,NULL,NULL,7),(176,125,'DINHEIRO','2018-02-10',110.00,0,0,0.00,110.00,5.00,NULL,NULL,7),(177,126,'DINHEIRO','2018-02-10',95.00,0,0,0.00,95.00,95.00,NULL,NULL,NULL),(178,126,'DINHEIRO','2018-03-10',95.00,0,0,0.00,95.00,95.00,NULL,NULL,NULL),(179,127,'DINHEIRO','2018-01-10',1000.00,1,0,0.00,1000.00,1000.00,NULL,NULL,NULL),(180,128,'DINHEIRO','2018-01-10',400.00,1,0,0.00,400.00,400.00,NULL,NULL,NULL),(181,127,'DINHEIRO','2018-02-10',1850.00,0,0,0.00,1850.00,850.00,NULL,NULL,NULL),(182,127,'DINHEIRO','2018-02-28',1000.00,0,0,0.00,1000.00,-850.00,NULL,NULL,NULL),(185,131,'DINHEIRO','2018-02-10',155.00,0,0,0.00,155.00,155.00,NULL,NULL,NULL),(186,131,'DINHEIRO','2018-03-10',150.00,0,0,0.00,150.00,150.00,NULL,NULL,NULL),(187,131,'DINHEIRO','2018-04-10',150.00,0,0,0.00,150.00,150.00,NULL,NULL,NULL),(188,132,'DINHEIRO','2018-01-20',75.00,0,0,0.00,75.00,75.00,NULL,NULL,1),(189,132,'DINHEIRO','2018-02-20',75.00,0,0,0.00,75.00,75.00,NULL,NULL,NULL),(190,114,'DINHEIRO','2018-02-10',70.00,0,0,0.00,70.00,70.00,NULL,NULL,7),(191,116,'DINHEIRO','2018-02-10',25.00,0,0,0.00,25.00,25.00,NULL,NULL,NULL),(192,133,'DINHEIRO','2018-01-22',900.00,1,0,0.00,900.00,900.00,NULL,NULL,7),(193,133,'DINHEIRO','2018-02-20',900.00,0,0,0.00,900.00,900.00,NULL,NULL,7),(194,134,'DINHEIRO','2018-01-22',60.00,1,0,0.00,60.00,60.00,NULL,NULL,2),(195,135,'DINHEIRO','2018-01-23',230.00,0,0,0.00,230.00,230.00,NULL,NULL,2),(196,136,'DINHEIRO','2018-02-10',105.00,0,0,0.00,105.00,105.00,NULL,NULL,2),(197,136,'DINHEIRO','2018-03-10',105.00,0,0,0.00,105.00,105.00,NULL,NULL,2),(198,137,'DINHEIRO','2018-01-22',250.00,1,0,0.00,250.00,250.00,NULL,NULL,1),(199,138,'DINHEIRO','2018-02-10',270.00,0,0,0.00,270.00,270.00,NULL,NULL,1),(200,138,'DINHEIRO','2018-03-10',270.00,0,0,0.00,270.00,270.00,NULL,NULL,1),(201,138,'DINHEIRO','2018-04-10',270.00,0,0,0.00,270.00,270.00,NULL,NULL,1),(202,139,'DINHEIRO','2018-02-10',65.00,0,0,0.00,65.00,65.00,NULL,NULL,1),(203,139,'DINHEIRO','2018-03-10',65.00,0,0,0.00,65.00,65.00,NULL,NULL,1),(204,140,'DINHEIRO','2018-02-10',175.00,0,0,0.00,175.00,175.00,NULL,NULL,1),(205,140,'DINHEIRO','2018-03-10',175.00,0,0,0.00,175.00,175.00,NULL,NULL,1),(206,141,'DINHEIRO','2018-02-10',100.00,0,0,0.00,100.00,100.00,NULL,NULL,1),(207,141,'DINHEIRO','2018-03-10',100.00,0,0,0.00,100.00,100.00,NULL,NULL,1),(208,142,'DINHEIRO','2018-01-23',130.00,1,0,0.00,130.00,130.00,NULL,NULL,1),(209,143,'DINHEIRO','2018-01-22',30.00,1,0,0.00,30.00,30.00,NULL,NULL,1),(210,144,'DINHEIRO','2018-02-10',60.00,0,0,0.00,60.00,60.00,NULL,NULL,2),(211,144,'DINHEIRO','2018-03-10',60.00,0,0,0.00,60.00,60.00,NULL,NULL,2),(212,145,'DINHEIRO','2018-02-10',180.00,0,0,0.00,180.00,180.00,NULL,NULL,2),(213,146,'CREDITO','2018-01-24',95.00,0,2,49.65,89.69,5.31,'2018-02-23',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (3,'Thiago Araujo Berbet','SOCIO','006.288.131-04','1983-08-19','(67) 99106-0530','thiagoaraujoberbet@gmail.com','FUNCIONARIO','2017-09-02',NULL,NULL,NULL),(4,'Luana Alves Teixeira','SOCIO',NULL,'1989-01-25','(67) 99307-8871','luanaalves144@hotmail.com','FUNCIONARIO','2017-09-02',NULL,NULL,NULL),(6,'Thays Brites',NULL,NULL,'1996-07-21','','thaysbrites@hotmail.com','CLIENTE','2017-09-04','2017-11-06',NULL,NULL),(7,'Juliana Fonseca',NULL,NULL,'1989-04-11','(67) 99228-8607','julyranan@hotmail.com','CLIENTE','2017-09-14','2017-11-07',NULL,NULL),(8,'Juliane',NULL,NULL,NULL,'','','CLIENTE','2017-09-20',NULL,NULL,NULL),(9,'Lays Ortiz',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL),(10,'Diogo Ortiz',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL),(11,'Cida',NULL,NULL,NULL,'(67) 99912-8142','','CLIENTE','2017-09-20','2017-09-22',NULL,NULL),(12,'Bete',NULL,NULL,NULL,'','','CLIENTE','2017-09-20','2017-10-04',NULL,NULL),(13,'Franciele',NULL,NULL,'1990-05-17','(67) 99185-4818','','CLIENTE','2017-09-20','2017-11-07',NULL,NULL),(14,'Thainara',NULL,NULL,NULL,'','','CLIENTE','2017-09-24',NULL,NULL,NULL),(15,'Matheus',NULL,NULL,NULL,'(67) 99100-9715','','CLIENTE','2017-10-02',NULL,NULL,NULL),(16,'Helio Makoto',NULL,NULL,'1988-05-22','(67) 99865-4475','helio.kanno@gmail.com','CLIENTE','2017-10-02','2017-11-07',NULL,NULL),(17,'Lorena Alves',NULL,NULL,'2005-01-21','(67) 99325-2324','flamengo_loris2012@hotmail.com','CLIENTE','2017-10-02','2017-11-06',NULL,NULL),(18,'Patrão da Izabel',NULL,NULL,NULL,'','','CLIENTE','2017-10-02',NULL,NULL,NULL),(19,'Carinna Fuzitani',NULL,NULL,NULL,'(67) 99283-7125','','CLIENTE','2017-10-02','2017-12-15','',''),(20,'Soely',NULL,NULL,NULL,'','','CLIENTE','2017-10-02','2017-11-06',NULL,NULL),(21,'Flip4 Julio Barone 607',NULL,NULL,NULL,'','','CLIENTE','2017-10-02',NULL,NULL,NULL),(22,'Fernando Araujo Berbet',NULL,NULL,'1989-12-24','(67) 99214-2290','fernandoberbet@gmail.com','CLIENTE','2017-10-04','2017-12-14','','Rua Brigadeiro Thiago, 2212 - Bairro Universitário - Campo Grande/MS'),(23,'Camila Fuzitani',NULL,NULL,NULL,'(97) 99144-1948','','CLIENTE','2017-10-07','2017-11-04',NULL,NULL),(24,'Jean Rossi',NULL,NULL,'1989-08-14','(67) 99201-8252','','CLIENTE','2017-10-12','2017-11-07',NULL,NULL),(25,'Rose',NULL,NULL,NULL,'','','CLIENTE','2017-10-15',NULL,NULL,NULL),(26,'Diogo Mishima',NULL,NULL,NULL,'(67) 98121-2244','','CLIENTE','2017-10-16','2017-11-06',NULL,NULL),(27,'Thiago',NULL,NULL,NULL,'(67) 99123-7830','','CLIENTE','2017-10-18','2017-11-07',NULL,NULL),(28,'Michelle Bop',NULL,NULL,NULL,'','','CLIENTE','2017-10-22','2017-11-07',NULL,NULL),(29,'Fran',NULL,NULL,NULL,'','','CLIENTE','2017-10-22',NULL,NULL,NULL),(30,'Sandra Berbert',NULL,NULL,'1962-11-29','(67) 99238-1036','sandra.berbert@hotmail.com','CLIENTE','2017-11-06','2017-11-07',NULL,NULL),(31,'Kelly',NULL,NULL,NULL,'','','CLIENTE','2017-11-06',NULL,NULL,NULL),(32,'Jeanny Nakazato',NULL,NULL,NULL,'','','CLIENTE','2017-11-06','2017-11-07',NULL,NULL),(33,'Izabel Alves',NULL,NULL,'1984-01-13','(67) 98475-7342','','FUNCIONARIO','2017-11-06',NULL,NULL,NULL),(34,'Michelle Scariote',NULL,NULL,NULL,'(67) 99211-3633','','CLIENTE','2017-11-07','2017-11-07',NULL,NULL),(35,'Wellinton (Vida Lar)',NULL,NULL,NULL,'','','CLIENTE','2017-11-07','2017-11-27',NULL,NULL),(36,'Cezar Duarte',NULL,NULL,'1988-02-28','(67) 99261-7085','cezarcabelera@hotmail.com','CLIENTE','2017-11-07',NULL,NULL,NULL),(37,'Cecília',NULL,NULL,NULL,'(67) 99903-8533','','CLIENTE','2017-11-08','2017-11-08',NULL,NULL),(38,'Thaynara Recaldes',NULL,NULL,NULL,'(67) 99103-6357','','CLIENTE','2017-11-13',NULL,NULL,NULL),(39,'Laís Aquino',NULL,NULL,NULL,'(67) 99268-3642','','CLIENTE','2017-11-13',NULL,NULL,NULL),(40,'Ivan Rossi',NULL,NULL,NULL,'','','CLIENTE','2017-11-13',NULL,NULL,NULL),(41,'Rafael',NULL,NULL,NULL,'','','CLIENTE','2017-11-13',NULL,NULL,NULL),(42,'Rafael (Jbl GO)',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(43,'Suelem',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(44,'Welligton Leonando',NULL,NULL,NULL,'','','CLIENTE','2017-11-20','2017-11-27',NULL,NULL),(45,'Camila',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(46,'Doação/Presente/Sorteio',NULL,NULL,NULL,'','','CLIENTE','2017-11-20',NULL,NULL,NULL),(47,'Beatriz (Estacionamento)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(48,'Marcos (Bone Preto)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(49,'Thiago Moraes',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(50,'Maria Helena Souza',NULL,NULL,NULL,'(31) 99332-8385','','CLIENTE','2017-11-27',NULL,NULL,NULL),(51,'Michele (Vida Lar)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(52,'Karine (El Kadri)',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(53,'Soila',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(54,'Larissa',NULL,NULL,NULL,'','','CLIENTE','2017-11-27',NULL,NULL,NULL),(55,'Felipe',NULL,NULL,NULL,'','','CLIENTE','2017-11-30',NULL,NULL,NULL),(56,'Marcio',NULL,NULL,NULL,'','','CLIENTE','2017-12-01','2017-12-01',NULL,NULL),(57,'Franciele (Prédio Vivo)',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL),(58,'Daniele (Vida Lar)',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL),(59,'Eduardo',NULL,NULL,NULL,'','','CLIENTE','2017-12-01',NULL,NULL,NULL),(60,'Daphyni',NULL,NULL,NULL,'(67) 98112-6072','','CLIENTE','2017-12-01',NULL,NULL,NULL),(61,'Cristiane',NULL,NULL,NULL,'','','CLIENTE','2017-12-02',NULL,NULL,NULL),(62,'Pedro Moura Fé Elias',NULL,NULL,NULL,'(67) 99988-6232','pedromourafeelias@yahoo.com.br','CLIENTE','2017-12-04',NULL,NULL,NULL),(63,'Mirian',NULL,NULL,NULL,'','','CLIENTE','2017-12-04',NULL,NULL,NULL),(64,'Tatiane Sanguina',NULL,NULL,NULL,'','','CLIENTE','2017-12-04',NULL,NULL,NULL),(65,'Gabriel (Cunhado Weverton)',NULL,NULL,NULL,'','','CLIENTE','2017-12-09',NULL,NULL,NULL),(66,'Bianca',NULL,NULL,NULL,'','','CLIENTE','2017-12-11',NULL,NULL,NULL),(67,'Matheus Vilela Fernandes',NULL,NULL,NULL,'(67) 98149-8777','','CLIENTE','2017-12-15',NULL,'',''),(68,'Cláudia Suchy',NULL,NULL,NULL,'','','CLIENTE','2017-12-18','2017-12-18','',''),(69,'Angelica',NULL,NULL,NULL,'(67) 99207-6479','','CLIENTE','2017-12-18',NULL,'','Rua Brigadeiro Thiago, 603 - Betaville - Campo Grande/MS'),(70,'José (Ernesto Borges)',NULL,NULL,NULL,'','','CLIENTE','2017-12-18',NULL,'',''),(71,'Francyelle Gattes',NULL,NULL,NULL,'(67) 99271-8118','','CLIENTE','2017-12-18',NULL,'',''),(72,'Diogo (STI)',NULL,NULL,NULL,'(67) 99349-8391','','CLIENTE','2017-12-18',NULL,'',''),(73,'Maria',NULL,NULL,NULL,'(67) 99918-2337','','CLIENTE','2017-12-19','2017-12-19','',''),(74,'Cliente',NULL,NULL,NULL,'','','CLIENTE','2017-12-20',NULL,'',''),(75,'Maycon Claro',NULL,NULL,NULL,'(67) 99270-6200','','CLIENTE','2017-12-21',NULL,'',''),(76,'Camila Xavier',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'',''),(77,'Leidy',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'',''),(78,'Edna',NULL,NULL,NULL,'','','CLIENTE','2018-01-08',NULL,'',''),(79,'Suelen Benites',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'',''),(80,'Valentim',NULL,NULL,NULL,'(67) 99632-9520','','CLIENTE','2018-01-10',NULL,'',''),(81,'Larissa (Shopping)',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'',''),(82,'Mara (Nega)',NULL,NULL,NULL,'','','CLIENTE','2018-01-10',NULL,'',''),(83,'Gabriel Oliveira',NULL,NULL,NULL,'(67) 99893-5535','','CLIENTE','2018-01-23',NULL,'',''),(84,'Thiago (Negão)',NULL,NULL,NULL,'(67) 98167-7000','','CLIENTE','2018-01-23',NULL,'',''),(85,'Lilian Ibanhes',NULL,NULL,NULL,'(67) 99125-8722','','CLIENTE','2018-01-23',NULL,'',''),(86,'Paulo Amorim',NULL,NULL,NULL,'(67) 99134-6289','','CLIENTE','2018-01-23',NULL,'',''),(87,'Ellen Berbert',NULL,NULL,NULL,'(67) 99186-6336','','CLIENTE','2018-01-23',NULL,'',''),(88,'Romildo (Vidalar)',NULL,NULL,NULL,'','','CLIENTE','2018-01-23',NULL,'',''),(89,'Luiz Felipe',NULL,NULL,NULL,'','','CLIENTE','2018-01-23',NULL,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (6,'Caixa de Som','Criado para os apaixonados por música e praticidade, a JBL GO transmite música via Bluetooth a partir de dispositivos móveis. É alimentado por uma bateria recarregável com até 5 horas de reprodução, e viva-voz com cancelamento de ruído, permitindo que você atenda chamadas sem desligar sua caixa de som.','ELETRONICOS','JBL','GO','2017-08-22','2017-09-18'),(7,'Caixa de Som','O JBL Flip 4 é a última geração da premiada série Flip, uma caixa de som portátil com Bluetooth que oferece um som estéreo surpreendentemente poderoso. Esta caixa de som compacta é alimentada por uma bateria de íons de lítio recarregável de 3.000 mAh, que oferece 12 horas contínuas de áudio de alta qualidade. ','ELETRONICOS','JBL','FLIP4','2017-08-22','2017-08-22'),(8,'Caixa de Som','A Caixa Bluetooth à prova d´agua Charge 3 agora vem com carregador portátil e deixa o som ainda mais potente. Escute suas músicas sem fios, por muito mais tempo e ainda leve sua festa para todo o lugar. Graças ao seu design à prova d´água, tecido durável e carcaça resistente, ela pode até cair na piscina. ','ELETRONICOS','JBL','CHARGE3','2017-08-22','2017-08-22'),(9,'Perfume Masculino','O Perfume Ferrari Masculino possui aroma cítrico amadeirado, ideal para homens misteriosos e sensuais. Em sua fragrância, notas que combinam bergamota, maçã, ameixa, canela, jasmim, rosa, cedro e baunilha.','COSMETICOS','Ferrari','Black 125 ml (Eau de Toilette)','2017-08-22','2018-01-22'),(10,'Fone de Ouvido Wireless','Possui entrada auxiliar onde você pode ouvir musicas de celulares que não tem a tecnologia bluetooth. O fone de ouvido é carregado através da porta USB do seu computador ou carregador de 5v (não incluído). É possível receber e fazer chamadas pelo fone, sem tirar ele da orelha, possui microfone para que possa ouvir suas chamadas com nitidez.','ELETRONICOS','Ewtto','ET-A4260B','2017-08-22',NULL),(11,'Chromecast','O Chromecast é um dispositivo de streaming de mídia que é conectado à porta HDMI da sua TV. Use o dispositivo móvel e a TV que você já possui para transmitir seus programas de TV, filmes, músicas, esportes e jogos favoritos e muito mais. O Chromecast funciona com iPhone®, iPad®, smartphones e tablets Android, laptops Mac® e Windows® e Chromebooks.','ELETRONICOS','Google','2','2017-08-22',NULL),(12,'Perfume Feminino','Tommy Girl é um bouquet de puro frescor, um mix de flores que associa a refrescância da camélia com a luminosidade da flor de maçã, e acordes brilhantes da flor do cassis. Uma fragrância energizante com toques cítricos da tangerina, de madeiras frescas e uma nuance de hortelã verde. Uma mistura envolvente de madressilva e pétalas de violeta, que aliadas ao jasmim do deserto, o lírio, rosas frescas, pétalas de magnólia, proporcionam uma inebriante sensação, deixando para o fundo da composição, uma combinação de cedro, sândalo, e magnólias selvagens.','COSMETICOS','Tommy','Girl 100 ml','2017-08-22','2018-01-22'),(13,'Tapete','Tapete','CASA','Tapete','Tapete 3x2','2017-08-22','2017-09-24'),(14,'Smartphone','Ele já vem com o novo iOS 10, o sistema operacional móvel mais avançado do mundo que deixa seu aparelho ainda mais pessoal, de uma forma poderosa. A interface é bonita e fácil de usar. Sugestões inteligentes aparecem quando você mais precisa e as tecnologias avançadas protegem sua privacidade e segurança. Além disso, conta com a excelente câmera iSight de 12MP, FaceTime de 7MP e grava vídeos com tecnologia 4K. Seu Chip A10 Fusion com arquitetura de 64 bits e coprocessador de movimento M10 integrado é o mais poderoso até hoje em um smartphone. Com ele, o iPhone 7 é mais rápido do que qualquer iPhone – e mais eficiente. Isso porque a arquitetura totalmente nova aumenta o processamento quando você precisa e diminui quando não precisa, oferecendo a maior duração de bateria em um iPhone e o dobro da velocidade do iPhone 6.','ELETRONICOS','Iphone','7 32GB','2017-08-22',NULL),(15,'Smartphone','...','ELETRONICOS','Iphone','6 32GB','2017-08-22',NULL),(16,'Smartphone','...','ELETRONICOS','Iphone','6s 32GB','2017-08-22',NULL),(17,'Tablet','...','ELETRONICOS','Ipad','32GB Wi-Fi','2017-08-22','2017-09-22'),(18,'Smartphone','...','ELETRONICOS','Iphone','7 Plus 32GB','2017-08-22',NULL),(19,'Relógio Masculino','..','JOIASERELOGIOS','Curren','G3-18375 D-1761','2017-08-22','2017-12-11'),(20,'Carregador Portátil','Capacidade: 5600 mAh\r\nEntrada: DC 5V/1A\r\nSaida: DC 5V/2.1A\r\nInterface: 1 Micro USB entrada e 2 USB saída\r\nInclui: Carregador portátil, cabo USB, manual\r\nAdaptável para quase todos os smartfones, tablet, PC, GPS ou outros produtos digitais.','ELETRONICOS','Ecopower','EP-C813 5600mAh','2017-08-22','2017-11-09'),(21,'Carregador Portátil','...','ELETRONICOS','Ecopower','EP-C883 9000mAh','2017-08-22',NULL),(22,'Máscara Hidratante','A Máscara Ultra Hidratante Desmaia Cabelo da Forever Liss possui ação instantânea Anti Volume e Frizz, super eficaz que age suavizando os fios, deixando os super sedosos, macios e com brilho. A Máscara Desmaia Cabelo Forever Liss possui que recupera os fios agredidos pela química realizando uma hidratação profunda nos fios garantindo assim a redução do volume e alinhamento capilar. É um produto sem química que promove sensação de cabelos lisos, pois alinha a fibra capilar.\r\n\r\nINDICAÇÃO:\r\nTodos os tipos de cabelo, cabelos volumosos, cabelos com frizz. Pode ser usado por gestantes e lactantes.\r\n\r\nCOMPOSIÇÃO:\r\nKeratina Brasileira (Origem Vegetal, Milho e Soja), D\'Pantenol, Colágeno e Sinergia de Aminoácidos. \r\n\r\nMODO DE USAR:\r\nAplique a Máscara Desmaia Cabelo Forever Liss com os cabelos úmidos em toda área do fio. Pentear com um pente até que perceba uniformidade na aplicação. Deixe em repouso por 5 minutos. Enxágue normalmente e finalize como desejar.\r\n\r\nRESULTADOS:\r\n- Efeito Redução de Volume;\r\n- Anti Frizz;\r\n- Cabelos Alinhados;\r\n- Maciez Extrema;\r\n- Brilho Intenso;\r\n- Sedosidade;\r\n- Alinhamento da Fibra Capilar;\r\n- Sensação de Leveza Instantaneamente nos Fios.','COSMETICOS','Desmaia Cabelo','350g','2017-08-22','2017-11-03'),(23,'Perfume Feminino','Calvin Klein inicia uma nova era na perfumaria! CKIN2U foi especialmente elaborado para uma geração que se define pela troca de experiências por meio de uma rede de comunicação virtual. A qualquer hora, em qualquer lugar e com qualquer pessoa... Jovens antenados, agitados e tecnosexuais!\r\nPela primeira vez, uma fragrância especial de Calvin Klein não é apenas um fragmento. As notas especiais do perfume capturam a sedução espontânea de uma geração fascinada por tecnologia. Esta geração que tem habilidade para conectar-se a qualquer hora, a qualquer momento, ao redor do mundo, com a possibilidade de aflorar emoções revolucionárias.\r\nA mulher de CKIN2U é uma jovem espontânea e sedutora. CKIN2U her tem a saída picante da grapefruit e bergamota da Sicília, seguidas pela orquídea doce cactus branco e cedra vermelho. A base em âmbar neón com souffle de baunilha asseguram a sedução e a satisfação imediata.','COSMETICOS','Calvin Klein','CKin2u 100 ml','2017-08-22','2018-01-22'),(24,'Garrafa Térmica','...','CASA','Travel & Leisure','5,8L','2017-08-22','2017-09-22'),(25,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Temptation 200ml','2017-08-22',NULL),(26,'Smartphone','...','ELETRONICOS','Iphone','7 Plus 128GB','2017-08-22',NULL),(27,'Smartphone','...','ELETRONICOS','Iphone','7 Red 128GB','2017-08-22',NULL),(28,'Smartphone','...','ELETRONICOS','Iphone','7 128 GB','2017-08-22',NULL),(29,'HD SSD','...','INFORMATICA','Sandisk','240GB','2017-08-22',NULL),(30,'IPTV','...','ELETRONICOS','HTV','5','2017-08-22',NULL),(31,'Creme Capilar','Leave-in com 10 benefícios reais em um só produto, para todos os tipos de cabelo. O Revlon Professional Uniq One cuida, trata, protege, controla, dentre outras ações. \r\nVencedor do Prêmio Especial Inovação da revista Nova/Cosmopolitan, ele é realmente uma revolução em matéria de cuidados para o cabelo.\r\nO Uniq One, da Revlon Professional, une 10 benefícios de tratamento e finalização em um só produto:  \r\n1. Repara os fios ressecados e danificados: possui agentes hidratantes e de condicionamento que melhoram a textura e a maleabilidade dos fios.  \r\n 2. Controla o frizz: com o tempo está seco ou úmido, protege das agressões ambientais e evita que o cabelo arrepie.  \r\n 3. Protege do calor do secador e da chapinha: forma uma película ao redor da fibra capilar, protegendo ela das altas temperaturas.  \r\n4. Suaviza e deixa um toque acetinado: possui agentes condicionantes poderosos, amaciando e controlando.    \r\n5. Protege do sol e mantém a cor: com filtros UVA e UVB, extremamente leves, protege sem deixar o cabelo pesado. Evita a oxidação causada pelo sol que faz cor desbotar.  \r\n6. Facilita a escovação e o uso da prancha: com o cabelo mais suave e macio, ele facilita o deslizar a prancha e escovar.  \r\n7. Desembaraça: deixa os fios soltos e desembaraçados.  \r\n8. Mantém o penteado por mais tempo.  \r\n9. Previne as pontas duplas.  \r\n10. Controla o volume natural dos cabelos.\r\nConselho de Aplicação\r\nAplique no cabelo úmido, como um spray, borrifando a 20cm de distância; ou aplique no cabelo seco, borrifando na mão e espalhando, como um creme. Cabelo curto: 6-8 doses Cabelo médio: 7-12 doses Cabelo longo: 10-15 doses.\r\nResultado:\r\nSeu cabelo vai ficar o máximo: macio, protegido, saudável, sem pontas duplas, sem frizz, com cor intensa, leve, brilhante e com um toque delicioso.\r\n','COSMETICOS','Revlon','Uniq One','2017-08-22','2017-11-09'),(32,'Creme Hidratante','...','COSMETICOS','Victoria’s Secret','Pure Seduction 236ml','2017-08-22',NULL),(33,'Creme Hidratante ','...','COSMETICOS','Victoria’s Secret','Coconut Passion 236ml','2017-08-22',NULL),(34,'Perfume Feminino ','...','COSMETICOS','Calvin Klein','CKin2u 150 ml','2017-08-22','2018-01-22'),(35,'Carregador Portatil','...','ELETRONICOS','EcoPower','EP-C808 5200mAh','2017-08-22',NULL),(36,'Tablet','...','ELETRONICOS','Samsung','Galaxy Tab3 Lite 8GB (SM-T113)','2017-08-22','2017-10-22'),(37,'Cinta','Confira a Cinta Abdominal Ativadora em Neoprene Sweet Sweat!\r\nTenha um auxílio na melhora de sua postura e maximize os resultados do Sweet Sweat com essa Cinta Abdominal Ativadora!\r\nSeu ajuste em velcro proporciona conforto e seu material com neoprene auxilia na aceleração da definição abdominal. Confortável, essa Cinta Sweet Sweat pode ser usada em baixo de qualquer roupa e mantém os músculos aquecidos. Quando utilizada em conjunto o gel termogênico, ela pode auxiliar na eliminação do excesso e água e gordura na região abdominal. A qualidade Sports Research pode ser notada em todos os detalhes dessa Cinta Abdominal Ativadora, que é feita para homens e mulheres que buscam bons resultados. Aproveite a oportunidade e compra a sua! ','ESPORTEFITNESS','Sweet Sweat','Waist Trimmer','2017-08-22','2017-11-09'),(38,'Gel','...','ESPORTEFITNESS','Sweet Sweat','Workout Enhancer','2017-08-22',NULL),(39,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Amber Romance 200ml','2017-08-22',NULL),(40,'Carregador Portátil','...','ELETRONICOS','MOX','P250 3000mAh','2017-08-22',NULL),(41,'Fone de Ouvido','...','ELETRONICOS','Iphone','Com Fio','2017-08-22',NULL),(42,'Perfume Feminino','...','COSMETICOS','Bvlgari','65 ml (Eau de Toilette)','2017-08-22','2018-01-22'),(43,'Perfume Unissex','...','COSMETICOS','Calvin Klein','CK One 100 ml (Eau de Toilette)','2017-08-22','2018-01-22'),(44,'Smartphone','...','ELETRONICOS','Iphone','8 Plus 64GB','2017-08-22',NULL),(45,'Tablet','...','ELETRONICOS','Ipad','Pro 64GB','2017-08-22','2017-10-22'),(46,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Secret Escape 236ml','2017-08-22',NULL),(47,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Snch a Flirt 236ml','2017-08-22',NULL),(48,'Pulseira Inteligente','...','ESPORTEFITNESS','Sky','FitBand 1 Black/White','2017-08-22',NULL),(49,'Relógio Feminino','...','JOIASERELOGIOS','Xiaoxia','JYSB-25','2017-08-22','2017-12-11'),(50,'Relógio Feminino','...','JOIASERELOGIOS','G3-7S-18727','D-5532','2017-08-22','2017-12-11'),(51,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1762','2017-08-22','2017-12-11'),(52,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18375 D-1763','2017-08-22','2017-12-11'),(53,'Película','Película de Vidro Universal para Iphone 7','ACESSORIOS','Sem Marca','Universal Iphone','2017-11-03',NULL),(54,'Capinha','Capinha para Iphone 7 da cor Rosa','ACESSORIOS','Sem Marca','Iphone 7','2017-11-03',NULL),(55,'Perfume Masculino','...','COSMETICOS','Animale','100 ml (Eau de Toilette)','2017-11-03','2018-01-22'),(56,'Kit','...','COSMETICOS','Aussie','3 Peças 865ml','2017-11-03',NULL),(57,'Kit','...','COSMETICOS','Aussie','3 Peças 400ml','2017-11-03',NULL),(58,'Máscara Hidratante','...','COSMETICOS','Silicon Mix','Bambu 225g','2017-11-03','2017-11-03'),(59,'Perfume Feminino','...','COSMETICOS','Marina De Bourbon','Rouge Royal 50 ml (Eau de Parfum)','2017-11-03','2018-01-22'),(60,'Garrafa Térmica','...','CASA','Travel & Leisure','7,7L','2017-11-03','2017-11-03'),(61,'Creatina','Creatine Powder 120 g - Universal Nutrition é um suplemento feito exclusivamente de Creatina Monohidratada. Porção com 3g de Creatina.','ESPORTEFITNESS','Universal','100g','2017-11-03','2017-11-09'),(62,'Smartphone','...','ELETRONICOS','Iphone','8 64GB','2017-11-06',NULL),(63,'Smartphone','...','ELETRONICOS','Iphone','X 256GB','2017-11-09','2017-11-09'),(64,'Perfume Masculino','...','COSMETICOS','JOOP! NightFlight','125 ml','2017-11-13','2018-01-22'),(65,'Máscara Hidratante','...','COSMETICOS','Silicon Mix','225g','2017-11-13',NULL),(67,'Smartphone','..','ELETRONICOS','Samsung Galaxy','J5 16GB LTE','2017-11-13',NULL),(68,'Termogênico','...','ESPORTEFITNESS','LIPO 6 Black','60 Cápsulas','2017-11-13',NULL),(69,'Perfume Masculino','...','COSMETICOS','Carolina Herrera','212 MEN NYC 100 ml (Eau de Toilette)','2017-11-27','2017-11-27'),(70,'Perfume Masculino','...','COSMETICOS','Chanel','Bleu 100 ml (Eau de Parfum)','2017-11-27',NULL),(71,'Shampoo','...','COSMETICOS','Silicon Mix','Bambu 473 ml','2017-11-27',NULL),(72,'Shampoo','...','COSMETICOS','Aussie','Moist 400 ml','2017-11-27',NULL),(73,'Máscara Hidratante','...','COSMETICOS','Revlon','Uniq One','2017-11-27','2017-11-27'),(74,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Love Spell 236 ml','2017-11-27',NULL),(75,'Smartphone','...','ELETRONICOS','Samsung Galaxy','J7 Prime','2017-11-27',NULL),(76,'Smartphone','...','ELETRONICOS','Iphone','X 64 GB','2017-12-11',NULL),(77,'Relógio Masculino','...','JOIASERELOGIOS','Cagarny','F. Preto P.Marron Claro','2017-12-11',NULL),(78,'Relógio Masculino','...','JOIASERELOGIOS','Cagarny','F. Azul P.Marron Escuro','2017-12-11',NULL),(79,'Relógio Masculino','...','JOIASERELOGIOS','Naviforce','Black Yellow','2017-12-11',NULL),(80,'Relógio Masculino','...','JOIASERELOGIOS','Naviforce','Gold Black','2017-12-11',NULL),(81,'SmartBand','...','ESPORTEFITNESS','GPS Sports','S908 Black','2017-12-11',NULL),(82,'Perfume Feminino','...','COSMETICOS','Britney Spears','Hidden Fantasy 100 ml (Eau de Parfum Spray/Vaporisateur)','2017-12-18','2017-12-18'),(83,'Perfume Feminino','...','COSMETICOS','Chanel','Coco Mademoiselle 100 ml (Eau de Parfum/Vaporisateur Spray)','2017-12-18','2017-12-18'),(84,'Creme Hidratante','...','COSMETICOS','Victoria\'s Secret','Passion Stuck 236 ml','2017-12-18',NULL),(85,'Perfume Feminino','...','COSMETICOS','Ralph Lauren','Romance 100 ml (Eau de Parfum)','2017-12-18','2018-01-22'),(86,'Relógio Masculino','...','JOIASERELOGIOS','Curren','G3-18382B D-1850','2017-12-18','2017-12-18'),(87,'Perfume Feminino','...','COSMETICOS','Calvin Klein','Euphoria 100 ml (Eau de Parfum Spray/Vaporisateur)','2017-12-18',NULL),(88,'Garrafa Térmica','...','CASA','Travel & Leisure','9,5L','2017-12-18',NULL),(89,'Video Game','...','ELETRONICOS','Sony','Playstation 4 (Sem Jogo)','2017-12-18',NULL),(90,'Tapete','...','CASA','Tapete','Passarela','2017-12-18','2017-12-18'),(91,'Shampoo','...','COSMETICOS','Joico','Moisture Recovery 1L','2018-01-10',NULL),(92,'Base','...','COSMETICOS','Dermacol','Make-up Cover ','2018-01-10',NULL),(93,'Caixa de Som','...','ELETRONICOS','Ecopower','EP-2133','2018-01-10',NULL),(94,'Perfume Feminino','...','COSMETICOS','Carolina Herrera','212 Sexy 100 ml (Eau de Parfum)','2018-01-22','2018-01-22'),(95,'Perfume Masculino','...','COSMETICOS','Ralph Lauren','Polo Black 75 ml (Eau de Toilette)','2018-01-22','2018-01-22'),(96,'Perfume Masculino','...','COSMETICOS','Mont Blanc','Legend 100 ml (Eau de Toilette)','2018-01-22','2018-01-22'),(97,'Perfume Feminino','...','COSMETICOS','Carolina Herrera','CH 100 ml (Eau de Toilette)','2018-01-22','2018-01-22'),(98,'Perfume Masculino','...','COSMETICOS','Yves Saint Laurent','Body Kouros 100 ml (Eau de Toilette)','2018-01-22',NULL),(99,'Perfume Feminino','...','COSMETICOS','Cacharel','Amor Amor 30 ml (Eau de Toilette)','2018-01-22',NULL),(100,'Mala de Viagem','...','CASA','...','Média','2018-01-22',NULL),(101,'Câmera de Ação','...','ELETRONICOS','GO Pro','Hero 6 Black','2018-01-22',NULL);
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
  `imagem` longblob,
  `idProduto` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idProdutoImagem`)
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
INSERT INTO `tb_category_lang` VALUES (1,1,1,'Raiz','','raiz','','',''),(1,1,2,'Raiz','','raiz','','',''),(2,1,1,'Início','','inicio','','',''),(2,1,2,'Início','','inicio','','',''),(12,1,1,'Eletrônicos','','eletronicos','','',''),(12,1,2,'Eletrônicos','','eletronicos','','','');
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
INSERT INTO `tb_cms_category_lang` VALUES (1,1,1,'Início','','inicio','','',''),(1,2,1,'Início','','inicio','','','');
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
INSERT INTO `tb_cms_lang` VALUES (1,1,1,'Entrega','Our terms and conditions of delivery','conditions, delivery, delay, shipment, pack','<h2>Shipments and returns</h2><h3>Your pack shipment</h3><p>Packages are generally dispatched within 2 days after receipt of payment and are shipped via UPS with tracking and drop-off without signature. If you prefer delivery by UPS Extra with required signature, an additional cost will be applied, so please contact us before choosing this method. Whichever shipment choice you make, we will provide you with a link to track your package online.</p><p>Shipping fees include handling and packing fees as well as postage costs. Handling fees are fixed, whereas transport fees vary according to total weight of the shipment. We advise you to group your items in one order. We cannot group two distinct orders placed separately, and shipping fees will apply to each of them. Your package will be dispatched at your own risk, but special care is taken to protect fragile objects.<br /><br />Boxes are amply sized and your items are well-protected.</p>','entrega'),(1,2,1,'Entrega','Nossos termos e condições de entrega','condições, entrega, atraso, envio, pacote','<h2>Envios e retornos</h2><h3>O envio do seu pedido</h3><p>Geralmente os envios são efetuados dentro de 2 dias após o recebimento do pagamento, via UPS com rastreamento, e entregues sem necessidade de assinatura. Se preferir a entrega por UPS Extra com assinatura exigida, será aplicado um custo adicional, por isso, entre em contato conosco antes de escolher este meio. Seja qual for a escolha que fizer, iremos fornecer-lhe um link que permite o rastreamento da sua encomenda on-line.</p><p>As taxas de envio incluem o manuseio, o empacotamento e os custos de postagem. As taxas de manuseio são fixas, já as de transporte variam de acordo com o peso total da encomenda. Aconselhamos que faça um só pedido com todos os seus produtos. Não podemos reunir dois pedidos diferentes efetuados separadamente, e as taxas de envio serão aplicadas para cada um. Sua encomenda será enviada a seu próprio risco, mas um cuidado especial será tomado para proteger os objetos frágeis.<br /><br />As caixas são espaçosas e sua mercadoria é bem protegida.</p>','entrega'),(2,1,1,'Informação legal','Legal notice','notice, legal, credits','<h2>Legal</h2><h3>Credits</h3><p>Concept and production:</p><p>This Web site was created using <a href=\"http://www.prestashop.com\">PrestaShop</a>&trade; open-source software.</p>','informacao-legal'),(2,2,1,'Advertência Legal','Advertência legal','advertência, legal, créditos','<h2>Créditos</h2><h3>Legais</h3><p>Conceito e produção:</p><p>Esta loja on-line foi criada por meio do Software de carrinho de compras da PrestaShop<a href=\"http://www.prestashop.com\"></a>. Confira o blog de comércio eletrônico da PrestaShop <a href=\"http://www.prestashop.com/blog/en/\"></a> para obter novidades e conselhos sobre como vender on-line e operar seu site de comércio eletrônico.</p>','advertencia-legal'),(3,1,1,'Termos e condições de uso','Our terms and conditions of use','conditions, terms, use, sell','<h2>Your terms and conditions of use</h2><h3>Rule 1</h3><p>Here is the rule 1 content</p>\r\n<h3>Rule 2</h3><p>Here is the rule 2 content</p>\r\n<h3>Rule 3</h3><p>Here is the rule 3 content</p>','termos-e-condicoes-de-uso'),(3,2,1,'Termos e condições de utilização','Nossos termos e condições de utilização','condições, termos, utilização, venda','<h1 class=\"page-heading\">Termos e condições de utilização</h1>\n<h3 class=\"page-subheading\">Regra n.° 1</h3>\n<p class=\"bottom-indent\">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<h3 class=\"page-subheading\">Regra n.° 2</h3>\n<p class=\"bottom-indent\">Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>\n<h3 class=\"page-subheading\">Regra n.° 3</h3>\n<p class=\"bottom-indent\">Tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam&#1102;</p>','termos-e-condicoes-de-utilizacao'),(4,1,1,'Sobre Nós','Learn more about us','about us, informations','<h2>About us</h2>\r\n<h3>Our company</h3><p>Our company</p>\r\n<h3>Our team</h3><p>Our team</p>\r\n<h3>Informations</h3><p>Informations</p>','sobre-nos'),(4,2,1,'Quem somos','Saiba mais sobre nós','quem somos, informações','<h1 class=\"page-heading bottom-indent\">Quem somos</h1>\n<div class=\"row\">\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-block\">\n<h3 class=\"page-subheading\">Nossa empresa</h3>\n<p><strong class=\"dark\">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididun.</strong></p>\n<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet conse ctetur adipisicing elit.</p>\n<ul class=\"list-1\">\n<li><em class=\"icon-ok\"></em>Produtos de alta qualidade</li>\n<li><em class=\"icon-ok\"></em>Melhor serviço ao cliente</li>\n<li><em class=\"icon-ok\"></em>Garantia de devolução de dinheiro em 30 dias</li>\n</ul>\n</div>\n</div>\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-box\">\n<h3 class=\"page-subheading\">Nossa equipe</h3>\n<img title=\"cms-img\" src=\"../img/cms/cms-img.jpg\" alt=\"cms-img\" width=\"370\" height=\"192\" />\n<p><strong class=\"dark\">Lorem set sint occaecat cupidatat non </strong></p>\n<p>Eiusmod tempor incididunt ut labore et dolore magna aliqua.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo.</p>\n</div>\n</div>\n<div class=\"col-xs-12 col-sm-4\">\n<div class=\"cms-box\">\n<h3 class=\"page-subheading\">Depoimentos</h3>\n<div class=\"testimonials\">\n<div class=\"inner\"><span class=\"before\">“</span>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.<span class=\"after\">”</span></div>\n</div>\n<p><strong class=\"dark\">Lorem ipsum dolor sit</strong></p>\n<div class=\"testimonials\">\n<div class=\"inner\"><span class=\"before\">“</span>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod.<span class=\"after\">”</span></div>\n</div>\n<p><strong class=\"dark\">Ipsum dolor sit</strong></p>\n</div>\n</div>\n</div>','quem-somos'),(5,1,1,'Pagamento seguro','Our secure payment mean','secure payment, ssl, visa, mastercard, paypal','<h2>Secure payment</h2>\r\n<h3>Our secure payment</h3><p>With SSL</p>\r\n<h3>Using Visa/Mastercard/Paypal</h3><p>About this services</p>','pagamento-seguro'),(5,2,1,'Pagamento seguro','Nosso meio de pagamento seguro','pagamento seguro, ssl, visa, mastercard, paypal','<h2>Pagamento seguro</h2>\n<h3>Nosso pagamento seguro</h3><p>Com o SSL</p>\n<h3>Pagar com Visa/Mastercard/Paypal</h3><p>Sobre este serviço</p>','pagamento-seguro');
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
INSERT INTO `tb_configuration_kpi` VALUES (1,NULL,NULL,'DASHGOALS_TRAFFIC_01_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(2,NULL,NULL,'DASHGOALS_CONVERSION_01_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(3,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_01_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(4,NULL,NULL,'DASHGOALS_TRAFFIC_02_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(5,NULL,NULL,'DASHGOALS_CONVERSION_02_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(6,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_02_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(7,NULL,NULL,'DASHGOALS_TRAFFIC_03_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(8,NULL,NULL,'DASHGOALS_CONVERSION_03_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(9,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_03_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(10,NULL,NULL,'DASHGOALS_TRAFFIC_04_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(11,NULL,NULL,'DASHGOALS_CONVERSION_04_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(12,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_04_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(13,NULL,NULL,'DASHGOALS_TRAFFIC_05_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(14,NULL,NULL,'DASHGOALS_CONVERSION_05_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(15,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_05_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(16,NULL,NULL,'DASHGOALS_TRAFFIC_06_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(17,NULL,NULL,'DASHGOALS_CONVERSION_06_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(18,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_06_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(19,NULL,NULL,'DASHGOALS_TRAFFIC_07_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(20,NULL,NULL,'DASHGOALS_CONVERSION_07_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(21,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_07_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(22,NULL,NULL,'DASHGOALS_TRAFFIC_08_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(23,NULL,NULL,'DASHGOALS_CONVERSION_08_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(24,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_08_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(25,NULL,NULL,'DASHGOALS_TRAFFIC_09_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(26,NULL,NULL,'DASHGOALS_CONVERSION_09_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(27,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_09_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(28,NULL,NULL,'DASHGOALS_TRAFFIC_10_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(29,NULL,NULL,'DASHGOALS_CONVERSION_10_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(30,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_10_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(31,NULL,NULL,'DASHGOALS_TRAFFIC_11_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(32,NULL,NULL,'DASHGOALS_CONVERSION_11_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(33,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_11_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(34,NULL,NULL,'DASHGOALS_TRAFFIC_12_2018','600','2018-01-17 09:46:15','2018-01-17 09:46:15'),(35,NULL,NULL,'DASHGOALS_CONVERSION_12_2018','2','2018-01-17 09:46:15','2018-01-17 09:46:15'),(36,NULL,NULL,'DASHGOALS_AVG_CART_VALUE_12_2018','80','2018-01-17 09:46:15','2018-01-17 09:46:15'),(37,NULL,NULL,'DISABLED_CATEGORIES','1','2018-01-17 10:13:45','2018-01-17 10:13:45'),(38,NULL,NULL,'DISABLED_CATEGORIES_EXPIRE','1516205625','2018-01-17 10:13:45','2018-01-17 10:13:45'),(39,NULL,NULL,'EMPTY_CATEGORIES','5','2018-01-17 10:13:45','2018-01-17 10:13:45'),(40,NULL,NULL,'EMPTY_CATEGORIES_EXPIRE','1516205625','2018-01-17 10:13:45','2018-01-17 10:13:45'),(41,NULL,NULL,'TOP_CATEGORY',NULL,'2018-01-17 10:13:45','2018-01-17 10:13:45'),(42,NULL,NULL,'TOP_CATEGORY_EXPIRE',NULL,'2018-01-17 10:13:45','2018-01-17 10:13:45'),(43,NULL,NULL,'PRODUCTS_PER_CATEGORY','0','2018-01-17 10:13:45','2018-01-17 10:13:45'),(44,NULL,NULL,'PRODUCTS_PER_CATEGORY_EXPIRE','1516202025','2018-01-17 10:13:45','2018-01-17 10:13:45'),(45,NULL,NULL,'CONVERSION_RATE','0%','2018-01-17 10:59:08','2018-01-17 10:59:08'),(46,NULL,NULL,'CONVERSION_RATE_EXPIRE','1516248000','2018-01-17 10:59:08','2018-01-17 10:59:08'),(47,NULL,NULL,'ABANDONED_CARTS','0','2018-01-17 10:59:08','2018-01-17 10:59:08'),(48,NULL,NULL,'ABANDONED_CARTS_EXPIRE','1516204748','2018-01-17 10:59:08','2018-01-17 10:59:08'),(49,NULL,NULL,'NETPROFIT_VISIT','0,00 R$','2018-01-17 10:59:08','2018-01-17 10:59:08'),(50,NULL,NULL,'NETPROFIT_VISIT_EXPIRE','1516248000','2018-01-17 10:59:08','2018-01-17 10:59:08'),(51,NULL,NULL,'AVG_ORDER_VALUE','0,00 R$','2018-01-17 10:59:08','2018-01-17 10:59:08'),(52,NULL,NULL,'AVG_ORDER_VALUE_EXPIRE','1516248000','2018-01-17 10:59:08','2018-01-17 10:59:08');
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
INSERT INTO `tb_configuration_lang` VALUES (39,1,'#IN',NULL),(39,2,'#IN',NULL),(42,1,'#DE',NULL),(42,2,'#DE',NULL),(44,1,'#RE',NULL),(44,2,'#RE',NULL),(51,1,'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves',NULL),(51,2,'a|about|above|after|again|against|all|am|an|and|any|are|aren|as|at|be|because|been|before|being|below|between|both|but|by|can|cannot|could|couldn|did|didn|do|does|doesn|doing|don|down|during|each|few|for|from|further|had|hadn|has|hasn|have|haven|having|he|ll|her|here|hers|herself|him|himself|his|how|ve|if|in|into|is|isn|it|its|itself|let|me|more|most|mustn|my|myself|no|nor|not|of|off|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|shan|she|should|shouldn|so|some|such|than|that|the|their|theirs|them|themselves|then|there|these|they|re|this|those|through|to|too|under|until|up|very|was|wasn|we|were|weren|what|when|where|which|while|who|whom|why|with|won|would|wouldn|you|your|yours|yourself|yourselves',NULL),(77,1,'Dear Customer,\n\nRegards,\nCustomer service',NULL),(77,2,'Dear Customer,\n\nRegards,\nCustomer service',NULL),(277,1,'We are currently updating our shop and will be back really soon.\nThanks for your patience.',NULL),(277,2,'We are currently updating our shop and will be back really soon.\nThanks for your patience.',NULL),(288,1,'sale70.png','2018-01-17 09:46:15'),(288,2,'sale70.png','2018-01-17 09:46:15'),(289,1,'','2018-01-17 09:46:15'),(289,2,'','2018-01-17 09:46:15'),(290,1,'','2018-01-17 09:46:15'),(290,2,'','2018-01-17 09:46:15'),(297,1,'Pode cancelar a subscrição a qualquer momento. Para tal, consulte a nossa informação de contacto na declaração legal.','2018-01-17 09:46:16'),(297,2,'You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.','2018-01-17 09:46:16');
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
INSERT INTO `tb_contact_lang` VALUES (1,1,'Webmaster','Se ocorreu um problema técnico no nosso website'),(1,2,'Webmaster','Se ocorreu um problema técnico no nosso website'),(2,1,'Serviço de apoio a clientes','Para qualquer pergunta sobre um Produto ou uma Encomenda'),(2,2,'Atendimento ao Cliente','Para qualquer pergunta sobre um Produto ou uma Encomenda');
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
INSERT INTO `tb_country_lang` VALUES (1,1,'Alemanha'),(1,2,'Alemanha'),(2,1,'Áustria'),(2,2,'Áustria'),(3,1,'Bélgica'),(3,2,'Bélgica'),(4,1,'Canadá'),(4,2,'Canadá'),(5,1,'China'),(5,2,'China'),(6,1,'Espanha'),(6,2,'Espanha'),(7,1,'Finlândia'),(7,2,'Finlândia'),(8,1,'França'),(8,2,'França'),(9,1,'Grécia'),(9,2,'Grécia'),(10,1,'Itália'),(10,2,'Itália'),(11,1,'Japão'),(11,2,'Japão'),(12,1,'Luxemburgo'),(12,2,'Luxemburgo'),(13,1,'Países Baixos'),(13,2,'Holanda'),(14,1,'Polónia'),(14,2,'Polônia'),(15,1,'Portugal'),(15,2,'Portugal'),(16,1,'República Checa'),(16,2,'República Tcheca'),(17,1,'Reino Unido'),(17,2,'Reino Unido'),(18,1,'Suécia'),(18,2,'Suécia'),(19,1,'Suíça'),(19,2,'Suíça'),(20,1,'Dinamarca'),(20,2,'Dinamarca'),(21,1,'Estados Unidos'),(21,2,'Estados Unidos'),(22,1,'Hong Kong, RAE Da China'),(22,2,'Hong Kong, RAE Da China'),(23,1,'Noruega'),(23,2,'Noruega'),(24,1,'Austrália'),(24,2,'Austrália'),(25,1,'Singapura'),(25,2,'Cingapura'),(26,1,'Irlanda'),(26,2,'Irlanda'),(27,1,'Nova Zelândia'),(27,2,'Nova Zelândia'),(28,1,'Coreia Do Sul'),(28,2,'Coreia Do Sul'),(29,1,'Israel'),(29,2,'Israel'),(30,1,'África Do Sul'),(30,2,'África Do Sul'),(31,1,'Nigéria'),(31,2,'Nigéria'),(32,1,'Costa Do Marfim'),(32,2,'Costa Do Marfim'),(33,1,'Togo'),(33,2,'Togo'),(34,1,'Bolívia'),(34,2,'Bolívia'),(35,1,'Maurícia'),(35,2,'Maurício'),(36,1,'Roménia'),(36,2,'Romênia'),(37,1,'Eslováquia'),(37,2,'Eslováquia'),(38,1,'Argélia'),(38,2,'Argélia'),(39,1,'Samoa Americana'),(39,2,'Samoa Americana'),(40,1,'Andorra'),(40,2,'Andorra'),(41,1,'Angola'),(41,2,'Angola'),(42,1,'Anguila'),(42,2,'Anguilla'),(43,1,'Antígua E Barbuda'),(43,2,'Antígua E Barbuda'),(44,1,'Argentina'),(44,2,'Argentina'),(45,1,'Arménia'),(45,2,'Armênia'),(46,1,'Aruba'),(46,2,'Aruba'),(47,1,'Azerbaijão'),(47,2,'Azerbaijão'),(48,1,'Bahamas'),(48,2,'Bahamas'),(49,1,'Barém'),(49,2,'Bahrein'),(50,1,'Bangladesh'),(50,2,'Bangladesh'),(51,1,'Barbados'),(51,2,'Barbados'),(52,1,'Bielorrússia'),(52,2,'Bielorrússia'),(53,1,'Belize'),(53,2,'Belize'),(54,1,'Benim'),(54,2,'Benin'),(55,1,'Bermudas'),(55,2,'Bermudas'),(56,1,'Butão'),(56,2,'Butão'),(57,1,'Botswana'),(57,2,'Botsuana'),(58,1,'Brasil'),(58,2,'Brasil'),(59,1,'Brunei'),(59,2,'Brunei'),(60,1,'Burquina Faso'),(60,2,'Burquina Faso'),(61,1,'Mianmar (Birmânia)'),(61,2,'Mianmar (Birmânia)'),(62,1,'Burundi'),(62,2,'Burundi'),(63,1,'Camboja'),(63,2,'Camboja'),(64,1,'Camarões'),(64,2,'República Dos Camarões'),(65,1,'Cabo Verde'),(65,2,'Cabo Verde'),(66,1,'República Centro-Africana'),(66,2,'República Centro-Africana'),(67,1,'Chade'),(67,2,'Chade'),(68,1,'Chile'),(68,2,'Chile'),(69,1,'Colômbia'),(69,2,'Colômbia'),(70,1,'Comores'),(70,2,'Comores'),(71,1,'Congo-Kinshasa'),(71,2,'Congo - Kinshasa'),(72,1,'Congo-Brazzaville'),(72,2,'Congo - Brazzaville'),(73,1,'Costa Rica'),(73,2,'Costa Rica'),(74,1,'Croácia'),(74,2,'Croácia'),(75,1,'Cuba'),(75,2,'Cuba'),(76,1,'Chipre'),(76,2,'Chipre'),(77,1,'Jibuti'),(77,2,'Djibuti'),(78,1,'Domínica'),(78,2,'Dominica'),(79,1,'República Dominicana'),(79,2,'República Dominicana'),(80,1,'Timor-Leste'),(80,2,'Timor-Leste'),(81,1,'Equador'),(81,2,'Equador'),(82,1,'Egipto'),(82,2,'Egito'),(83,1,'El Salvador'),(83,2,'El Salvador'),(84,1,'Guiné Equatorial'),(84,2,'Guiné Equatorial'),(85,1,'Eritreia'),(85,2,'Eritreia'),(86,1,'Estónia'),(86,2,'Estônia'),(87,1,'Etiópia'),(87,2,'Etiópia'),(88,1,'Ilhas Falkland'),(88,2,'Ilhas Malvinas'),(89,1,'Ilhas Faroé'),(89,2,'Ilhas Faroe'),(90,1,'Fiji'),(90,2,'Fiji'),(91,1,'Gabão'),(91,2,'Gabão'),(92,1,'Gâmbia'),(92,2,'Gâmbia'),(93,1,'Geórgia'),(93,2,'Geórgia'),(94,1,'Gana'),(94,2,'Gana'),(95,1,'Granada'),(95,2,'Granada'),(96,1,'Gronelândia'),(96,2,'Groenlândia'),(97,1,'Gibraltar'),(97,2,'Gibraltar'),(98,1,'Guadalupe'),(98,2,'Guadalupe'),(99,1,'Guame'),(99,2,'Guam'),(100,1,'Guatemala'),(100,2,'Guatemala'),(101,1,'Guernsey'),(101,2,'Guernsey'),(102,1,'Guiné'),(102,2,'Guiné'),(103,1,'Guiné-Bissau'),(103,2,'Guiné Bissau'),(104,1,'Guiana'),(104,2,'Guiana'),(105,1,'Haiti'),(105,2,'Haiti'),(106,1,'Ilhas Heard E McDonald'),(106,2,'Ilhas Heard E McDonald'),(107,1,'Cidade Do Vaticano'),(107,2,'Cidade Do Vaticano'),(108,1,'Honduras'),(108,2,'Honduras'),(109,1,'Islândia'),(109,2,'Islândia'),(110,1,'Índia'),(110,2,'Índia'),(111,1,'Indonésia'),(111,2,'Indonésia'),(112,1,'Irão'),(112,2,'Irã'),(113,1,'Iraque'),(113,2,'Iraque'),(114,1,'Ilha De Man'),(114,2,'Ilha De Man'),(115,1,'Jamaica'),(115,2,'Jamaica'),(116,1,'Jersey'),(116,2,'Jersey'),(117,1,'Jordânia'),(117,2,'Jordânia'),(118,1,'Cazaquistão'),(118,2,'Cazaquistão'),(119,1,'Quénia'),(119,2,'Quênia'),(120,1,'Quiribati'),(120,2,'Quiribati'),(121,1,'Coreia Do Norte'),(121,2,'Coreia Do Norte'),(122,1,'Kuwait'),(122,2,'Kuwait'),(123,1,'Quirguistão'),(123,2,'Quirguistão'),(124,1,'Laos'),(124,2,'Laos'),(125,1,'Letónia'),(125,2,'Letônia'),(126,1,'Líbano'),(126,2,'Líbano'),(127,1,'Lesoto'),(127,2,'Lesoto'),(128,1,'Libéria'),(128,2,'Libéria'),(129,1,'Líbia'),(129,2,'Líbia'),(130,1,'Liechtenstein'),(130,2,'Liechtenstein'),(131,1,'Lituânia'),(131,2,'Lituânia'),(132,1,'Macau, RAE Da China'),(132,2,'Macau, RAE Da China'),(133,1,'Macedónia'),(133,2,'Macedônia'),(134,1,'Madagáscar'),(134,2,'Madagascar'),(135,1,'Malawi'),(135,2,'Malawi'),(136,1,'Malásia'),(136,2,'Malásia'),(137,1,'Maldivas'),(137,2,'Maldivas'),(138,1,'Mali'),(138,2,'Mali'),(139,1,'Malta'),(139,2,'Malta'),(140,1,'Ilhas Marshall'),(140,2,'Ilhas Marshall'),(141,1,'Martinica'),(141,2,'Martinica'),(142,1,'Mauritânia'),(142,2,'Mauritânia'),(143,1,'Hungria'),(143,2,'Hungria'),(144,1,'Maiote'),(144,2,'Mayotte'),(145,1,'México'),(145,2,'México'),(146,1,'Micronésia'),(146,2,'Micronésia'),(147,1,'Moldávia'),(147,2,'Moldávia'),(148,1,'Mónaco'),(148,2,'Mônaco'),(149,1,'Mongólia'),(149,2,'Mongólia'),(150,1,'Montenegro'),(150,2,'Montenegro'),(151,1,'Monserrate'),(151,2,'Montserrat'),(152,1,'Marrocos'),(152,2,'Marrocos'),(153,1,'Moçambique'),(153,2,'Moçambique'),(154,1,'Namíbia'),(154,2,'Namíbia'),(155,1,'Nauru'),(155,2,'Nauru'),(156,1,'Nepal'),(156,2,'Nepal'),(157,1,'Antilhas Holandesas'),(157,2,'Antilhas Holandesas'),(158,1,'Nova Caledónia'),(158,2,'Nova Caledônia'),(159,1,'Nicarágua'),(159,2,'Nicarágua'),(160,1,'Níger'),(160,2,'Níger'),(161,1,'Niue'),(161,2,'Niue'),(162,1,'Ilha Norfolk'),(162,2,'Ilha Norfolk'),(163,1,'Ilhas Marianas Do Norte'),(163,2,'Ilhas Marianas Do Norte'),(164,1,'Omã'),(164,2,'Omã'),(165,1,'Paquistão'),(165,2,'Paquistão'),(166,1,'Palau'),(166,2,'Palau'),(167,1,'Território Palestiniano'),(167,2,'Territórios Palestinos'),(168,1,'Panamá'),(168,2,'Panamá'),(169,1,'Papua-Nova Guiné'),(169,2,'Papua-Nova Guiné'),(170,1,'Paraguai'),(170,2,'Paraguai'),(171,1,'Peru'),(171,2,'Peru'),(172,1,'Filipinas'),(172,2,'Filipinas'),(173,1,'Pitcairn'),(173,2,'Ilhas Pitcairn'),(174,1,'Porto Rico'),(174,2,'Porto Rico'),(175,1,'Catar'),(175,2,'Catar'),(176,1,'Reunião'),(176,2,'Reunião'),(177,1,'Rússia'),(177,2,'Rússia'),(178,1,'Ruanda'),(178,2,'Ruanda'),(179,1,'São Bartolomeu'),(179,2,'São Bartolomeu'),(180,1,'São Cristóvão E Nevis'),(180,2,'São Cristóvão E Nevis'),(181,1,'Santa Lúcia'),(181,2,'Santa Lúcia'),(182,1,'São Martinho'),(182,2,'São Martinho'),(183,1,'Saint Pierre E Miquelon'),(183,2,'Saint Pierre E Miquelon'),(184,1,'São Vicente E Granadinas'),(184,2,'São Vicente E Granadinas'),(185,1,'Samoa'),(185,2,'Samoa'),(186,1,'São Marino'),(186,2,'San Marino'),(187,1,'São Tomé E Príncipe'),(187,2,'São Tomé E Príncipe'),(188,1,'Arábia Saudita'),(188,2,'Arábia Saudita'),(189,1,'Senegal'),(189,2,'Senegal'),(190,1,'Sérvia'),(190,2,'Sérvia'),(191,1,'Seicheles'),(191,2,'Seychelles'),(192,1,'Serra Leoa'),(192,2,'Serra Leoa'),(193,1,'Eslovénia'),(193,2,'Eslovênia'),(194,1,'Ilhas Salomão'),(194,2,'Ilhas Salomão'),(195,1,'Somália'),(195,2,'Somália'),(196,1,'Ilhas Geórgia Do Sul E Sandwich Do Sul'),(196,2,'Geórgia Do Sul E Ilhas Sandwich Do Sul'),(197,1,'Sri Lanka'),(197,2,'Sri Lanka'),(198,1,'Sudão'),(198,2,'Sudão'),(199,1,'Suriname'),(199,2,'Suriname'),(200,1,'Svalbard E Jan Mayen'),(200,2,'Svalbard E Jan Mayen'),(201,1,'Suazilândia'),(201,2,'Suazilândia'),(202,1,'Síria'),(202,2,'Síria'),(203,1,'Taiwan'),(203,2,'Taiwan'),(204,1,'Tajiquistão'),(204,2,'Tajiquistão'),(205,1,'Tanzânia'),(205,2,'Tanzânia'),(206,1,'Tailândia'),(206,2,'Tailândia'),(207,1,'Toquelau'),(207,2,'Tokelau'),(208,1,'Tonga'),(208,2,'Tonga'),(209,1,'Trindade E Tobago'),(209,2,'Trinidad E Tobago'),(210,1,'Tunísia'),(210,2,'Tunísia'),(211,1,'Turquia'),(211,2,'Turquia'),(212,1,'Turquemenistão'),(212,2,'Turcomenistão'),(213,1,'Ilhas Turcas E Caicos'),(213,2,'Ilhas Turks E Caicos'),(214,1,'Tuvalu'),(214,2,'Tuvalu'),(215,1,'Uganda'),(215,2,'Uganda'),(216,1,'Ucrânia'),(216,2,'Ucrânia'),(217,1,'Emirados Árabes Unidos'),(217,2,'Emirados Árabes Unidos'),(218,1,'Uruguai'),(218,2,'Uruguai'),(219,1,'Uzbequistão'),(219,2,'Uzbequistão'),(220,1,'Vanuatu'),(220,2,'Vanuatu'),(221,1,'Venezuela'),(221,2,'Venezuela'),(222,1,'Vietname'),(222,2,'Vietnã'),(223,1,'Ilhas Virgens Britânicas'),(223,2,'Ilhas Virgens Britânicas'),(224,1,'Ilhas Virgens Dos EUA'),(224,2,'Ilhas Virgens Dos EUA'),(225,1,'Wallis E Futuna'),(225,2,'Wallis E Futuna'),(226,1,'Saara Ocidental'),(226,2,'Saara Ocidental'),(227,1,'Iémen'),(227,2,'Iêmen'),(228,1,'Zâmbia'),(228,2,'Zâmbia'),(229,1,'Zimbabué'),(229,2,'Zimbábue'),(230,1,'Albânia'),(230,2,'Albânia'),(231,1,'Afeganistão'),(231,2,'Afeganistão'),(232,1,'Antártida'),(232,2,'Antártida'),(233,1,'Bósnia E Herzegovina'),(233,2,'Bósnia E Herzegovina'),(234,1,'Ilha Bouvet'),(234,2,'Ilha Bouvet'),(235,1,'Território Britânico Do Oceano Índico'),(235,2,'Território Britânico Do Oceano Índico'),(236,1,'Bulgária'),(236,2,'Bulgária'),(237,1,'Ilhas Caimão'),(237,2,'Ilhas Caiman'),(238,1,'Ilha Do Natal'),(238,2,'Ilha Christmas'),(239,1,'Ilhas Cocos'),(239,2,'Ilhas Cocos (Keeling)'),(240,1,'Ilhas Cook'),(240,2,'Ilhas Cook'),(241,1,'Guiana Francesa'),(241,2,'Guiana Francesa'),(242,1,'Polinésia Francesa'),(242,2,'Polinésia Francesa'),(243,1,'Territórios Franceses Do Sul'),(243,2,'Territórios Franceses Do Sul'),(244,1,'Ilhas Åland'),(244,2,'Ilhas Åland');
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
INSERT INTO `tb_feature_lang` VALUES (1,1,'Altura'),(5,1,'Composição'),(6,1,'Estilos'),(2,1,'Largura'),(4,1,'Peso'),(3,1,'Profundidade'),(7,1,'Propriedades'),(1,2,'Altura'),(5,2,'Composição'),(6,2,'Estilos'),(2,2,'Largura'),(4,2,'Peso'),(3,2,'Profundidade'),(7,2,'Propriedades');
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
INSERT INTO `tb_feature_value_lang` VALUES (1,1,'Poliéster'),(1,2,'Poliéster'),(2,1,'Lã'),(2,2,'Lã'),(3,1,'Viscose'),(3,2,'Viscose'),(4,1,'Elastano'),(4,2,'Elastano'),(5,1,'Algodão'),(5,2,'Algodão'),(6,1,'Seda'),(6,2,'Seda'),(7,1,'Camurça'),(7,2,'Camurça'),(8,1,'Palha'),(8,2,'Palha'),(9,1,'Couro'),(9,2,'Couro'),(10,1,'Clássico'),(10,2,'Clássico'),(11,1,'Casual'),(11,2,'Casual'),(12,1,'Militar'),(12,2,'Militar'),(13,1,'Ameninado'),(13,2,'Ameninado'),(14,1,'Pedra'),(14,2,'Pedra'),(15,1,'Básico'),(15,2,'Básico'),(16,1,'Vistoso'),(16,2,'Vistoso'),(17,1,'Manga curta'),(17,2,'Manga curta'),(18,1,'Vestido colorido'),(18,2,'Vestido colorido'),(19,1,'Vestido curto'),(19,2,'Vestido curto'),(20,1,'Vestido médio'),(20,2,'Vestido médio'),(21,1,'Vestido comprido'),(21,2,'Vestido comprido'),(22,1,'2.75 in'),(22,2,'2.75 in'),(23,1,'2.06 in'),(23,2,'2.06 in'),(24,1,'49.2 g'),(24,2,'49.2 g'),(25,1,'0.26 in'),(25,2,'0.26 in'),(26,1,'1.07 in'),(26,2,'1.07 in'),(27,1,'1.62 in'),(27,2,'1.62 in'),(28,1,'15.5 g'),(28,2,'15.5 g'),(29,1,'0.41 in (clip included)'),(29,2,'0.41 in (clip included)'),(30,1,'4.33 in'),(30,2,'4.33 in'),(31,1,'2.76 in'),(31,2,'2.76 in'),(32,1,'120g'),(32,2,'120g'),(33,1,'0.31 in'),(33,2,'0.31 in');
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
INSERT INTO `tb_group_lang` VALUES (1,1,'Visitante'),(1,2,'Visitante'),(2,1,'Cliente não registado'),(2,2,'Cliente não registado'),(3,1,'Cliente'),(3,2,'Cliente');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_lang` VALUES (1,'Português (Portuguese)',1,'pt','pt-pt','pt-PT','Y-m-d','Y-m-d H:i:s',0),(2,'Português (Brasil)',1,'br','pt-br','pt-BR','Y-m-d','Y-m-d H:i:s',0);
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
INSERT INTO `tb_log` VALUES (1,1,0,'Back office connection from 127.0.0.1','',0,1,'2018-01-17 09:54:45','2018-01-17 09:54:45'),(2,1,0,'Product catalog filters stored.','',0,1,'2018-01-17 10:08:24','2018-01-17 10:08:24'),(3,1,0,'Products deleted: (7).','',0,1,'2018-01-17 10:08:45','2018-01-17 10:08:45'),(4,1,0,'Products deleted: (6).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(5,1,0,'Products deleted: (5).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(6,1,0,'Products deleted: (4).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(7,1,0,'Products deleted: (3).','',0,1,'2018-01-17 10:08:46','2018-01-17 10:08:46'),(8,1,0,'Products deleted: (2).','',0,1,'2018-01-17 10:08:47','2018-01-17 10:08:47'),(9,1,0,'Products deleted: (1).','',0,1,'2018-01-17 10:08:47','2018-01-17 10:08:47'),(10,1,0,'Eliminação de Category','Category',10,1,'2018-01-17 10:15:09','2018-01-17 10:15:09'),(11,1,0,'Eliminação de Category','Category',11,1,'2018-01-17 10:15:18','2018-01-17 10:15:18'),(12,1,0,'Eliminação de Category','Category',9,1,'2018-01-17 10:15:29','2018-01-17 10:15:29'),(13,1,0,'Eliminação de Category','Category',8,1,'2018-01-17 10:15:38','2018-01-17 10:15:38'),(14,1,0,'Eliminação de Category','Category',7,1,'2018-01-17 10:15:45','2018-01-17 10:15:45'),(15,1,0,'Eliminação de Category','Category',6,1,'2018-01-17 10:15:53','2018-01-17 10:15:53'),(16,1,0,'Eliminação de Category','Category',5,1,'2018-01-17 10:15:59','2018-01-17 10:15:59'),(17,1,0,'Eliminação de Category','Category',4,1,'2018-01-17 10:16:20','2018-01-17 10:16:20'),(18,1,0,'Eliminação de Category','Category',3,1,'2018-01-17 10:16:28','2018-01-17 10:16:28'),(19,1,0,'Adição de Category','Category',12,1,'2018-01-17 10:16:57','2018-01-17 10:16:57'),(20,1,0,'Product modification','Product',8,1,'2018-01-17 10:19:50','2018-01-17 10:19:50'),(21,1,0,'Product modification','Product',8,1,'2018-01-17 10:20:28','2018-01-17 10:20:28'),(22,1,0,'Adição de Manufacturer','Manufacturer',2,1,'2018-01-17 10:22:34','2018-01-17 10:22:34'),(23,1,0,'Eliminação de Manufacturer','Manufacturer',1,1,'2018-01-17 10:22:42','2018-01-17 10:22:42'),(24,1,0,'Product modification','Product',8,1,'2018-01-17 10:23:01','2018-01-17 10:23:01'),(25,1,0,'Product modification','Product',8,1,'2018-01-17 10:23:49','2018-01-17 10:23:49'),(26,1,0,'Product modification','Product',8,1,'2018-01-17 10:23:51','2018-01-17 10:23:51'),(27,1,0,'Product modification','Product',8,1,'2018-01-17 10:49:28','2018-01-17 10:49:28'),(28,1,0,'Product modification','Product',8,1,'2018-01-17 10:52:13','2018-01-17 10:52:13'),(29,1,0,'Product modification','Product',8,1,'2018-01-17 10:53:26','2018-01-17 10:53:26'),(30,1,0,'Eliminação de Address','Address',3,1,'2018-01-17 11:01:18','2018-01-17 11:01:18'),(31,1,0,'Eliminação de Supplier','Supplier',1,1,'2018-01-17 11:01:26','2018-01-17 11:01:26'),(32,1,0,'Product modification','Product',8,1,'2018-01-17 11:02:07','2018-01-17 11:02:07'),(33,1,0,'Product modification','Product',8,1,'2018-01-17 11:03:21','2018-01-17 11:03:21');
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
INSERT INTO `tb_meta_lang` VALUES (1,1,1,'erro 404','Esta página não pode ser encontrada','','página-não-encontrada'),(1,1,2,'erro 404','Esta página não pode ser encontrada','','página-não-encontrada'),(2,1,1,'Top de Vendas','Os nossos produto mais vendidos','','top-vendas'),(2,1,2,'Top de Vendas','Os nossos produto mais vendidos','','top-vendas'),(3,1,1,'Contacte-nos','Use o nosso formulário para nos contactar','','contacte-nos'),(3,1,2,'Fale conosco','Use o nosso formulário para nos contactar','','contacte-nos'),(4,1,1,'','Loja powered by PrestaShop','',''),(4,1,2,'','Loja powered by PrestaShop','',''),(5,1,1,'Brands','Brands list','','brands'),(5,1,2,'Brands','Brands list','','brands'),(6,1,1,'Novos produtos','Nossos novos produtos','','novos-produtos'),(6,1,2,'Novidades','Nossos novos produtos','','novos-produtos'),(7,1,1,'Esqueci-me da palavra-passe','Indique o seu e-mail utilizado quando se registou para receber um e-mail com a nova palavra-passe','','recuperar-palavra-passe'),(7,1,2,'Esqueceu sua senha','Indique o seu e-mail utilizado quando se registou para receber um e-mail com a nova palavra-passe','','recuperar-palavra-passe'),(8,1,1,'Promoção','Produtos à venda','','promocoes'),(8,1,2,'Promoção','Produtos à venda','','promocoes'),(9,1,1,'Mapa do site','Não consegue encontrar o que procura?','','mapa do site'),(9,1,2,'Mapa do site','Não consegue encontrar o que procura?','','mapa do site'),(10,1,1,'Fornecedores','Lista de Fornecedores','','fornecedores'),(10,1,2,'Fornecedores','Lista de Fornecedores','','fornecedores'),(11,1,1,'Endereço','','','endereco'),(11,1,2,'Endereço','','','endereco'),(12,1,1,'Endereços','','','enderecos'),(12,1,2,'Endereços','','','enderecos'),(13,1,1,'Autenticação','','','inicio-de-sessao'),(13,1,2,'Acesso','','','inicio-de-sessao'),(14,1,1,'Carrinho','','','carrinho'),(14,1,2,'Carrinho','','','carrinho'),(15,1,1,'Desconto','','','descontos'),(15,1,2,'Desconto','','','descontos'),(16,1,1,'Histórico de encomendas','','','historico-de-encomendas'),(16,1,2,'Histórico de pedidos','','','historico-de-encomendas'),(17,1,1,'Identidade','','','identidade'),(17,1,2,'Identidade','','','identidade'),(18,1,1,'A minha conta','','','a-minha-conta'),(18,1,2,'Minha Conta','','','a-minha-conta'),(19,1,1,'Acompanhar Encomenda','','','acompanhar-encomenda'),(19,1,2,'Acompanhar Encomenda','','','acompanhar-encomenda'),(20,1,1,'Nota de crédito','','','nota-de-encomenda'),(20,1,2,'Crédito','','','nota-de-encomenda'),(21,1,1,'Encomenda','','','encomenda'),(21,1,2,'Compra','','','compra'),(22,1,1,'Pesquisar','','','pesquisa'),(22,1,2,'Busca','','','pesquisa'),(23,1,1,'Lojas','','','lojas'),(23,1,2,'Lojas','','','lojas'),(24,1,1,'Seguimento de Visitante','','','seguimento-de-visitante'),(24,1,2,'Seguimento de Visitante','','','seguimento-de-visitante'),(25,1,1,'Confirmação de encomenda','','','confirmacao-encomenda'),(25,1,2,'Confirmação do pedido','','','confirmacao-encomenda'),(34,1,1,'','','',''),(34,1,2,'','','',''),(35,1,1,'','','',''),(35,1,2,'','','',''),(36,1,1,'','','',''),(36,1,2,'','','',''),(37,1,1,'','','',''),(37,1,2,'','','',''),(38,1,1,'','','',''),(38,1,2,'','','',''),(39,1,1,'','','',''),(39,1,2,'','','',''),(40,1,1,'','','',''),(40,1,2,'','','','');
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
INSERT INTO `tb_order_message_lang` VALUES (1,1,'Tempo de entrega esperado','Olá,\n\nInfelizmente, um item da sua encomenda encontra-se atualmente esgotado. Isto poderá causar um ligeiro atraso na sua entrega. Queira por isso aceitar as nossas desculpas e asseguramos-lhe que estamos a fazer os possíveis para retificar esta situação.'),(1,2,'Atraso','Olá,\n\nInfelizmente, um item da sua encomenda encontra-se atualmente esgotado. Isto poderá causar um ligeiro atraso na sua entrega. Queira por isso aceitar as nossas desculpas e asseguramos-lhe que estamos a fazer os possíveis para retificar esta situação.');
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
INSERT INTO `tb_order_return_state_lang` VALUES (1,1,'A aguardar confirmação'),(1,2,'A aguardar confirmação'),(2,1,'A aguardar a mercadoria'),(2,2,'A aguardar a mercadoria'),(3,1,'Mercadoria recebida'),(3,2,'Mercadoria recebida'),(4,1,'Devolução negada'),(4,2,'Devolução negada'),(5,1,'Devolução completa'),(5,2,'Devolução completa');
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
INSERT INTO `tb_order_state_lang` VALUES (1,1,'A aguardar pagamento por cheque','cheque'),(1,2,'Aguardando confirmação de pagamento','cheque'),(2,1,'Pagamento aceite','payment'),(2,2,'Pagamento aceite','payment'),(3,1,'Preparação em curso','preparation'),(3,2,'Preparação em curso','preparation'),(4,1,'Enviado','shipped'),(4,2,'Enviado','shipped'),(5,1,'Entregue',''),(5,2,'Entregue',''),(6,1,'Cancelado','order_canceled'),(6,2,'Cancelado','order_canceled'),(7,1,'Reembolsado','refund'),(7,2,'Reembolsado','refund'),(8,1,'Erro de pagamento','payment_error'),(8,2,'Erro de pagamento','payment_error'),(9,1,'Sem stock (Pagamento aceite)','outofstock'),(9,2,'Sem stock (Pagamento aceite)','outofstock'),(10,1,'A aguardar tranferência bancária','bankwire'),(10,2,'A aguardar tranferência bancária','bankwire'),(11,1,'Pagamento remoto aceite','payment'),(11,2,'Pagamento remoto aceite','payment'),(12,1,'Sem stock','outofstock'),(12,2,'Sem stock','outofstock'),(13,1,'Awaiting cod validation','cashondelivery'),(13,2,'Awaiting cod validation','cashondelivery');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_product_lang` VALUES (8,1,1,'<div class=\"descProduct\">\n<p>O JBL Flip 4 é a última geração da premiada série Flip, uma caixa de som portátil com Bluetooth que oferece um som estéreo surpreendentemente poderoso. Esta caixa de som compacta é alimentada por uma bateria de íons de lítio recarregável de 3.000 mAh, que oferece 12 horas contínuas de áudio de alta qualidade. Com materiais têxteis duráveis e à prova dágua, o Flip 4 é seu companheiro para todos os usos e todos os momentos, levando a festa para qualquer lugar.</p>\n<p>Possui também um viva-voz integrado com cancelamento de ruídos e ecos, para chamadas de teleconferência claras. É equipado com tecnologia Connect+ da JBL, permitindo que você conecte mais de 100 caixas de som compatíveis. Com o simples pressionar de um botão, você pode ativar e falar com Siri ou Google Now pelo seu JBL Flip 4.</p>\n<p></p>\n<h2>Conteúdo da Caixa</h2>\n<ul class=\"box-content-list\"><li>1 x JBL Flip 4</li>\n<li>1 x Cabo Micro-USB JBL</li>\n<li>1 x Ficha de segurança</li>\n<li>1 x Guia de Início rápido</li>\n<li>Certificado de garantia</li>\n</ul></div>','','jbl-flip4','','','','JBL Flip4','',''),(8,1,2,'','','jbl-flip4','','','','JBL Flip4','','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_profile_lang` VALUES (1,1,'SuperAdministrador'),(2,1,'SuperAdmin'),(1,2,'Operador de logística'),(2,2,'Operador de logistica'),(1,3,'Tradutor'),(2,3,'Tradutor'),(1,4,'Vendedor'),(2,4,'Vendedor');
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
INSERT INTO `tb_quick_access_lang` VALUES (1,1,'Encomendas'),(1,2,'Pedidos'),(2,1,'Novo Voucher'),(2,2,'Novo Voucher'),(3,1,'Novo produto'),(3,2,'Produto novo'),(4,1,'Nova Categoria'),(4,2,'Nova Categoria'),(5,1,'Módulos instalados'),(5,2,'Módulos instalados');
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
INSERT INTO `tb_reassurance_lang` VALUES (1,1,'Política de segurança (editar com o módulo Garantia do cliente)'),(1,2,'Política de segurança (editar com o módulo Garantia do cliente)'),(2,1,'Política de entrega (editar com o módulo Garantia do cliente)'),(2,2,'Política de entrega (editar com o módulo Garantia do cliente)'),(3,1,'Política de devolução (editar com o módulo Garantia do cliente)'),(3,2,'Política de devolução (editar com o módulo Garantia do cliente)');
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
INSERT INTO `tb_risk_lang` VALUES (1,1,'Nenhum'),(1,2,'Nenhum'),(2,1,'Baixa'),(2,2,'Baixa'),(3,1,'Médio'),(3,2,'Médio'),(4,1,'Alto'),(4,2,'Alta');
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
) ENGINE=InnoDB AUTO_INCREMENT=1339 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_state` VALUES (1,21,2,'AA','AA',0,1),(2,21,2,'AE','AE',0,1),(3,21,2,'AP','AP',0,1),(4,21,2,'Alabama','AL',0,1),(5,21,2,'Alaska','AK',0,1),(6,21,2,'Arizona','AZ',0,1),(7,21,2,'Arkansas','AR',0,1),(8,21,2,'California','CA',0,1),(9,21,2,'Colorado','CO',0,1),(10,21,2,'Connecticut','CT',0,1),(11,21,2,'Delaware','DE',0,1),(12,21,2,'Florida','FL',0,1),(13,21,2,'Georgia','GA',0,1),(14,21,2,'Hawaii','HI',0,1),(15,21,2,'Idaho','ID',0,1),(16,21,2,'Illinois','IL',0,1),(17,21,2,'Indiana','IN',0,1),(18,21,2,'Iowa','IA',0,1),(19,21,2,'Kansas','KS',0,1),(20,21,2,'Kentucky','KY',0,1),(21,21,2,'Louisiana','LA',0,1),(22,21,2,'Maine','ME',0,1),(23,21,2,'Maryland','MD',0,1),(24,21,2,'Massachusetts','MA',0,1),(25,21,2,'Michigan','MI',0,1),(26,21,2,'Minnesota','MN',0,1),(27,21,2,'Mississippi','MS',0,1),(28,21,2,'Missouri','MO',0,1),(29,21,2,'Montana','MT',0,1),(30,21,2,'Nebraska','NE',0,1),(31,21,2,'Nevada','NV',0,1),(32,21,2,'New Hampshire','NH',0,1),(33,21,2,'New Jersey','NJ',0,1),(34,21,2,'New Mexico','NM',0,1),(35,21,2,'New York','NY',0,1),(36,21,2,'North Carolina','NC',0,1),(37,21,2,'North Dakota','ND',0,1),(38,21,2,'Ohio','OH',0,1),(39,21,2,'Oklahoma','OK',0,1),(40,21,2,'Oregon','OR',0,1),(41,21,2,'Pennsylvania','PA',0,1),(42,21,2,'Rhode Island','RI',0,1),(43,21,2,'South Carolina','SC',0,1),(44,21,2,'South Dakota','SD',0,1),(45,21,2,'Tennessee','TN',0,1),(46,21,2,'Texas','TX',0,1),(47,21,2,'Utah','UT',0,1),(48,21,2,'Vermont','VT',0,1),(49,21,2,'Virginia','VA',0,1),(50,21,2,'Washington','WA',0,1),(51,21,2,'West Virginia','WV',0,1),(52,21,2,'Wisconsin','WI',0,1),(53,21,2,'Wyoming','WY',0,1),(54,21,2,'Puerto Rico','PR',0,1),(55,21,2,'US Virgin Islands','VI',0,1),(56,21,2,'District of Columbia','DC',0,1),(57,145,2,'Aguascalientes','AGS',0,1),(58,145,2,'Baja California','BCN',0,1),(59,145,2,'Baja California Sur','BCS',0,1),(60,145,2,'Campeche','CAM',0,1),(61,145,2,'Chiapas','CHP',0,1),(62,145,2,'Chihuahua','CHH',0,1),(63,145,2,'Coahuila','COA',0,1),(64,145,2,'Colima','COL',0,1),(65,145,2,'Distrito Federal','DIF',0,1),(66,145,2,'Durango','DUR',0,1),(67,145,2,'Guanajuato','GUA',0,1),(68,145,2,'Guerrero','GRO',0,1),(69,145,2,'Hidalgo','HID',0,1),(70,145,2,'Jalisco','JAL',0,1),(71,145,2,'Estado de México','MEX',0,1),(72,145,2,'Michoacán','MIC',0,1),(73,145,2,'Morelos','MOR',0,1),(74,145,2,'Nayarit','NAY',0,1),(75,145,2,'Nuevo León','NLE',0,1),(76,145,2,'Oaxaca','OAX',0,1),(77,145,2,'Puebla','PUE',0,1),(78,145,2,'Querétaro','QUE',0,1),(79,145,2,'Quintana Roo','ROO',0,1),(80,145,2,'San Luis Potosí','SLP',0,1),(81,145,2,'Sinaloa','SIN',0,1),(82,145,2,'Sonora','SON',0,1),(83,145,2,'Tabasco','TAB',0,1),(84,145,2,'Tamaulipas','TAM',0,1),(85,145,2,'Tlaxcala','TLA',0,1),(86,145,2,'Veracruz','VER',0,1),(87,145,2,'Yucatán','YUC',0,1),(88,145,2,'Zacatecas','ZAC',0,1),(89,4,2,'Ontario','ON',0,1),(90,4,2,'Quebec','QC',0,1),(91,4,2,'British Columbia','BC',0,1),(92,4,2,'Alberta','AB',0,1),(93,4,2,'Manitoba','MB',0,1),(94,4,2,'Saskatchewan','SK',0,1),(95,4,2,'Nova Scotia','NS',0,1),(96,4,2,'New Brunswick','NB',0,1),(97,4,2,'Newfoundland and Labrador','NL',0,1),(98,4,2,'Prince Edward Island','PE',0,1),(99,4,2,'Northwest Territories','NT',0,1),(100,4,2,'Yukon','YT',0,1),(101,4,2,'Nunavut','NU',0,1),(102,44,6,'Buenos Aires','B',0,1),(103,44,6,'Catamarca','K',0,1),(104,44,6,'Chaco','H',0,1),(105,44,6,'Chubut','U',0,1),(106,44,6,'Ciudad de Buenos Aires','C',0,1),(107,44,6,'Córdoba','X',0,1),(108,44,6,'Corrientes','W',0,1),(109,44,6,'Entre Ríos','E',0,1),(110,44,6,'Formosa','P',0,1),(111,44,6,'Jujuy','Y',0,1),(112,44,6,'La Pampa','L',0,1),(113,44,6,'La Rioja','F',0,1),(114,44,6,'Mendoza','M',0,1),(115,44,6,'Misiones','N',0,1),(116,44,6,'Neuquén','Q',0,1),(117,44,6,'Río Negro','R',0,1),(118,44,6,'Salta','A',0,1),(119,44,6,'San Juan','J',0,1),(120,44,6,'San Luis','D',0,1),(121,44,6,'Santa Cruz','Z',0,1),(122,44,6,'Santa Fe','S',0,1),(123,44,6,'Santiago del Estero','G',0,1),(124,44,6,'Tierra del Fuego','V',0,1),(125,44,6,'Tucumán','T',0,1),(126,10,1,'Agrigento','AG',0,1),(127,10,1,'Alessandria','AL',0,1),(128,10,1,'Ancona','AN',0,1),(129,10,1,'Aosta','AO',0,1),(130,10,1,'Arezzo','AR',0,1),(131,10,1,'Ascoli Piceno','AP',0,1),(132,10,1,'Asti','AT',0,1),(133,10,1,'Avellino','AV',0,1),(134,10,1,'Bari','BA',0,1),(135,10,1,'Barletta-Andria-Trani','BT',0,1),(136,10,1,'Belluno','BL',0,1),(137,10,1,'Benevento','BN',0,1),(138,10,1,'Bergamo','BG',0,1),(139,10,1,'Biella','BI',0,1),(140,10,1,'Bologna','BO',0,1),(141,10,1,'Bolzano','BZ',0,1),(142,10,1,'Brescia','BS',0,1),(143,10,1,'Brindisi','BR',0,1),(144,10,1,'Cagliari','CA',0,1),(145,10,1,'Caltanissetta','CL',0,1),(146,10,1,'Campobasso','CB',0,1),(147,10,1,'Carbonia-Iglesias','CI',0,1),(148,10,1,'Caserta','CE',0,1),(149,10,1,'Catania','CT',0,1),(150,10,1,'Catanzaro','CZ',0,1),(151,10,1,'Chieti','CH',0,1),(152,10,1,'Como','CO',0,1),(153,10,1,'Cosenza','CS',0,1),(154,10,1,'Cremona','CR',0,1),(155,10,1,'Crotone','KR',0,1),(156,10,1,'Cuneo','CN',0,1),(157,10,1,'Enna','EN',0,1),(158,10,1,'Fermo','FM',0,1),(159,10,1,'Ferrara','FE',0,1),(160,10,1,'Firenze','FI',0,1),(161,10,1,'Foggia','FG',0,1),(162,10,1,'Forlì-Cesena','FC',0,1),(163,10,1,'Frosinone','FR',0,1),(164,10,1,'Genova','GE',0,1),(165,10,1,'Gorizia','GO',0,1),(166,10,1,'Grosseto','GR',0,1),(167,10,1,'Imperia','IM',0,1),(168,10,1,'Isernia','IS',0,1),(169,10,1,'L\'Aquila','AQ',0,1),(170,10,1,'La Spezia','SP',0,1),(171,10,1,'Latina','LT',0,1),(172,10,1,'Lecce','LE',0,1),(173,10,1,'Lecco','LC',0,1),(174,10,1,'Livorno','LI',0,1),(175,10,1,'Lodi','LO',0,1),(176,10,1,'Lucca','LU',0,1),(177,10,1,'Macerata','MC',0,1),(178,10,1,'Mantova','MN',0,1),(179,10,1,'Massa','MS',0,1),(180,10,1,'Matera','MT',0,1),(181,10,1,'Medio Campidano','VS',0,1),(182,10,1,'Messina','ME',0,1),(183,10,1,'Milano','MI',0,1),(184,10,1,'Modena','MO',0,1),(185,10,1,'Monza e della Brianza','MB',0,1),(186,10,1,'Napoli','NA',0,1),(187,10,1,'Novara','NO',0,1),(188,10,1,'Nuoro','NU',0,1),(189,10,1,'Ogliastra','OG',0,1),(190,10,1,'Olbia-Tempio','OT',0,1),(191,10,1,'Oristano','OR',0,1),(192,10,1,'Padova','PD',0,1),(193,10,1,'Palermo','PA',0,1),(194,10,1,'Parma','PR',0,1),(195,10,1,'Pavia','PV',0,1),(196,10,1,'Perugia','PG',0,1),(197,10,1,'Pesaro-Urbino','PU',0,1),(198,10,1,'Pescara','PE',0,1),(199,10,1,'Piacenza','PC',0,1),(200,10,1,'Pisa','PI',0,1),(201,10,1,'Pistoia','PT',0,1),(202,10,1,'Pordenone','PN',0,1),(203,10,1,'Potenza','PZ',0,1),(204,10,1,'Prato','PO',0,1),(205,10,1,'Ragusa','RG',0,1),(206,10,1,'Ravenna','RA',0,1),(207,10,1,'Reggio Calabria','RC',0,1),(208,10,1,'Reggio Emilia','RE',0,1),(209,10,1,'Rieti','RI',0,1),(210,10,1,'Rimini','RN',0,1),(211,10,1,'Roma','RM',0,1),(212,10,1,'Rovigo','RO',0,1),(213,10,1,'Salerno','SA',0,1),(214,10,1,'Sassari','SS',0,1),(215,10,1,'Savona','SV',0,1),(216,10,1,'Siena','SI',0,1),(217,10,1,'Siracusa','SR',0,1),(218,10,1,'Sondrio','SO',0,1),(219,10,1,'Taranto','TA',0,1),(220,10,1,'Teramo','TE',0,1),(221,10,1,'Terni','TR',0,1),(222,10,1,'Torino','TO',0,1),(223,10,1,'Trapani','TP',0,1),(224,10,1,'Trento','TN',0,1),(225,10,1,'Treviso','TV',0,1),(226,10,1,'Trieste','TS',0,1),(227,10,1,'Udine','UD',0,1),(228,10,1,'Varese','VA',0,1),(229,10,1,'Venezia','VE',0,1),(230,10,1,'Verbano-Cusio-Ossola','VB',0,1),(231,10,1,'Vercelli','VC',0,1),(232,10,1,'Verona','VR',0,1),(233,10,1,'Vibo Valentia','VV',0,1),(234,10,1,'Vicenza','VI',0,1),(235,10,1,'Viterbo','VT',0,1),(236,111,3,'Aceh','ID-AC',0,1),(237,111,3,'Bali','ID-BA',0,1),(238,111,3,'Banten','ID-BT',0,1),(239,111,3,'Bengkulu','ID-BE',0,1),(240,111,3,'Gorontalo','ID-GO',0,1),(241,111,3,'Jakarta','ID-JK',0,1),(242,111,3,'Jambi','ID-JA',0,1),(243,111,3,'Jawa Barat','ID-JB',0,1),(244,111,3,'Jawa Tengah','ID-JT',0,1),(245,111,3,'Jawa Timur','ID-JI',0,1),(246,111,3,'Kalimantan Barat','ID-KB',0,1),(247,111,3,'Kalimantan Selatan','ID-KS',0,1),(248,111,3,'Kalimantan Tengah','ID-KT',0,1),(249,111,3,'Kalimantan Timur','ID-KI',0,1),(250,111,3,'Kalimantan Utara','ID-KU',0,1),(251,111,3,'Kepulauan Bangka Belitug','ID-BB',0,1),(252,111,3,'Kepulauan Riau','ID-KR',0,1),(253,111,3,'Lampung','ID-LA',0,1),(254,111,3,'Maluku','ID-MA',0,1),(255,111,3,'Maluku Utara','ID-MU',0,1),(256,111,3,'Nusa Tengara Barat','ID-NB',0,1),(257,111,3,'Nusa Tenggara Timur','ID-NT',0,1),(258,111,3,'Papua','ID-PA',0,1),(259,111,3,'Papua Barat','ID-PB',0,1),(260,111,3,'Riau','ID-RI',0,1),(261,111,3,'Sulawesi Barat','ID-SR',0,1),(262,111,3,'Sulawesi Selatan','ID-SN',0,1),(263,111,3,'Sulawesi Tengah','ID-ST',0,1),(264,111,3,'Sulawesi Tenggara','ID-SG',0,1),(265,111,3,'Sulawesi Utara','ID-SA',0,1),(266,111,3,'Sumatera Barat','ID-SB',0,1),(267,111,3,'Sumatera Selatan','ID-SS',0,1),(268,111,3,'Sumatera Utara','ID-SU',0,1),(269,111,3,'Yogyakarta','ID-YO',0,1),(270,11,3,'Aichi','23',0,1),(271,11,3,'Akita','05',0,1),(272,11,3,'Aomori','02',0,1),(273,11,3,'Chiba','12',0,1),(274,11,3,'Ehime','38',0,1),(275,11,3,'Fukui','18',0,1),(276,11,3,'Fukuoka','40',0,1),(277,11,3,'Fukushima','07',0,1),(278,11,3,'Gifu','21',0,1),(279,11,3,'Gunma','10',0,1),(280,11,3,'Hiroshima','34',0,1),(281,11,3,'Hokkaido','01',0,1),(282,11,3,'Hyogo','28',0,1),(283,11,3,'Ibaraki','08',0,1),(284,11,3,'Ishikawa','17',0,1),(285,11,3,'Iwate','03',0,1),(286,11,3,'Kagawa','37',0,1),(287,11,3,'Kagoshima','46',0,1),(288,11,3,'Kanagawa','14',0,1),(289,11,3,'Kochi','39',0,1),(290,11,3,'Kumamoto','43',0,1),(291,11,3,'Kyoto','26',0,1),(292,11,3,'Mie','24',0,1),(293,11,3,'Miyagi','04',0,1),(294,11,3,'Miyazaki','45',0,1),(295,11,3,'Nagano','20',0,1),(296,11,3,'Nagasaki','42',0,1),(297,11,3,'Nara','29',0,1),(298,11,3,'Niigata','15',0,1),(299,11,3,'Oita','44',0,1),(300,11,3,'Okayama','33',0,1),(301,11,3,'Okinawa','47',0,1),(302,11,3,'Osaka','27',0,1),(303,11,3,'Saga','41',0,1),(304,11,3,'Saitama','11',0,1),(305,11,3,'Shiga','25',0,1),(306,11,3,'Shimane','32',0,1),(307,11,3,'Shizuoka','22',0,1),(308,11,3,'Tochigi','09',0,1),(309,11,3,'Tokushima','36',0,1),(310,11,3,'Tokyo','13',0,1),(311,11,3,'Tottori','31',0,1),(312,11,3,'Toyama','16',0,1),(313,11,3,'Wakayama','30',0,1),(314,11,3,'Yamagata','06',0,1),(315,11,3,'Yamaguchi','35',0,1),(316,11,3,'Yamanashi','19',0,1),(317,24,5,'Australian Capital Territory','ACT',0,1),(318,24,5,'New South Wales','NSW',0,1),(319,24,5,'Northern Territory','NT',0,1),(320,24,5,'Queensland','QLD',0,1),(321,24,5,'South Australia','SA',0,1),(322,24,5,'Tasmania','TAS',0,1),(323,24,5,'Victoria','VIC',0,1),(324,24,5,'Western Australia','WA',0,1),(325,58,6,'Acre','AC',0,1),(326,58,6,'Alagoas','AL',0,1),(327,58,6,'Amapá','AP',0,1),(328,58,6,'Amazonas','AM',0,1),(329,58,6,'Bahia','BA',0,1),(330,58,6,'Ceará','CE',0,1),(331,58,6,'Distrito Federal','DF',0,1),(332,58,6,'Espírito Santo','ES',0,1),(333,58,6,'Goiás','GO',0,1),(334,58,6,'Maranhão','MA',0,1),(335,58,6,'Mato Grosso','MT',0,1),(336,58,6,'Mato Grosso do Sul','MS',0,1),(337,58,6,'Minas Gerais','MG',0,1),(338,58,6,'Pará','PA',0,1),(339,58,6,'Paraíba','PB',0,1),(340,58,6,'Paraná','PR',0,1),(341,58,6,'Pernambuco','PE',0,1),(342,58,6,'Piauí','PI',0,1),(343,58,6,'Rio de Janeiro','RJ',0,1),(344,58,6,'Rio Grande do Norte','RN',0,1),(345,58,6,'Rio Grande do Sul','RS',0,1),(346,58,6,'Rondônia','RO',0,1),(347,58,6,'Roraima','RR',0,1),(348,58,6,'Santa Catarina','SC',0,1),(349,58,6,'São Paulo','SP',0,1),(350,58,6,'Sergipe','SE',0,1),(351,58,6,'Tocantins','TO',0,1);
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
INSERT INTO `tb_stock_mvt_reason_lang` VALUES (1,1,'Aumentar'),(1,2,'Aumento'),(2,1,'Diminuir'),(2,2,'Diminuir'),(3,1,'Customer Order'),(3,2,'Encomenda de cliente'),(4,1,'Regulation following an inventory of stock'),(4,2,'Regulamento, seguindo um inventário de estoque'),(5,1,'Regulation following an inventory of stock'),(5,2,'Regulamento, seguindo um inventário de estoque'),(6,1,'Transfer to another warehouse'),(6,2,'Transferir para outro armazém'),(7,1,'Transfer from another warehouse'),(7,2,'Transferir de outro armazém'),(8,1,'Supply Order'),(8,2,'Pedido de fornecimento'),(9,1,'Customer Order'),(9,2,'Encomenda de cliente'),(10,1,'Product Return'),(10,2,'Devolução de produto'),(11,1,'Employee Edition'),(11,2,'Edição do funcionário'),(12,1,'Employee Edition'),(12,2,'Edição do funcionário');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_supply_order_state_lang` VALUES (1,1,'1 - Criação em progresso'),(1,2,'1 - Criação em progresso'),(2,1,'2 - Encomenda validada'),(2,2,'2 - Encomenda validada'),(3,1,'3 - A aguardar receção'),(3,2,'3 - A aguardar receção'),(4,1,'4 - Encomenda recebida em parte'),(4,2,'4 - Encomenda recebida em parte'),(5,1,'5 - Encomenda recebida na totalidade'),(5,2,'5 - Encomenda recebida na totalidade'),(6,1,'6 - Encomenda cancelada'),(6,2,'6 - Encomenda cancelada');
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
INSERT INTO `tb_tab_lang` VALUES (1,1,'Painel de controlo'),(1,2,'Painel'),(2,1,'Sell'),(2,2,'Sell'),(3,1,'Encomendas'),(3,2,'Pedidos'),(4,1,'Encomendas'),(4,2,'Pedidos'),(5,1,'Faturas'),(5,2,'Faturas'),(6,1,'Notas de Crédito'),(6,2,'Comprovantes de créditos'),(7,1,'Notas de Entrega'),(7,2,'Comprovantes de entregas'),(8,1,'Carrinhos de Compras'),(8,2,'Carrinho de compras'),(9,1,'Catálogo'),(9,2,'Catálogo'),(10,1,'Produtos'),(10,2,'Produtos'),(11,1,'Categorias'),(11,2,'Categorias'),(12,1,'Monitorização'),(12,2,'Monitoramento'),(13,1,'Attributes & Features'),(13,2,'Attributes & Features'),(14,1,'Atributos'),(14,2,'Atributos'),(15,1,'Funcionalidades'),(15,2,'Funcionalidades'),(16,1,'Brands & Suppliers'),(16,2,'Brands & Suppliers'),(17,1,'Marcas'),(17,2,'Marcas'),(18,1,'Fornecedores'),(18,2,'Fornecedores'),(19,1,'Ficheiros'),(19,2,'Arquivos'),(20,1,'Descontos'),(20,2,'Descontos'),(21,1,'Regras de Carrinho'),(21,2,'Regras do Carrinho'),(22,1,'Regras de Preços do Catálogo'),(22,2,'Regras de preço do catálogo'),(23,1,'Stocks'),(23,2,'Stocks'),(24,1,'Clientes'),(24,2,'Clientes'),(25,1,'Clientes'),(25,2,'Clientes'),(26,1,'Endereços'),(26,2,'Endereços'),(27,1,'Clientes com Dívidas'),(27,2,'Excepcional'),(28,1,'Apoio ao Cliente'),(28,2,'Atendimento ao Cliente'),(29,1,'Apoio ao Cliente'),(29,2,'Atendimento ao Cliente'),(30,1,'Mensagens de Encomendas'),(30,2,'Mensagens de pedidos'),(31,1,'Mercadorias Devolvidas'),(31,2,'Devoluções de Mercadorias'),(32,1,'Estatísticas'),(32,2,'Estatísticas'),(34,1,'Armazéns'),(34,2,'Armazéns'),(35,1,'Gestão de Inventário'),(35,2,'Gestão de estoque'),(36,1,'Gestão de Inventário'),(36,2,'Gestão de estoque'),(37,1,'Movimento de Inventário'),(37,2,'Movimentação do Estoque'),(38,1,'Estado Instantâneo do Inventário'),(38,2,'Status atual do estoque'),(39,1,'Cobertura do Inventário'),(39,2,'Cobertura do Estoque'),(40,1,'Encomendas a Fornecedores'),(40,2,'Pedidos de fornecimento'),(41,1,'Configuração'),(41,2,'Configuração'),(42,1,'Improve'),(42,2,'Improve'),(43,1,'Módulos'),(43,2,'Módulos'),(44,1,'Modules & Services'),(44,2,'Modules & Services'),(46,1,'Modules Catalog'),(46,2,'Modules Catalog'),(47,1,'Design'),(47,2,'Design'),(48,1,'Theme & Logo'),(48,2,'Theme & Logo'),(49,1,'Theme Catalog'),(49,2,'Theme Catalog'),(50,1,'Páginas'),(50,2,'Páginas'),(51,1,'Posições'),(51,2,'Posições'),(52,1,'Image Settings'),(52,2,'Image Settings'),(53,1,'Envio'),(53,2,'Frete'),(54,1,'Transportadoras'),(54,2,'Transportadoras'),(55,1,'Preferências'),(55,2,'Preferências'),(56,1,'Pagamento'),(56,2,'Pagamento'),(57,1,'Payment Methods'),(57,2,'Payment Methods'),(58,1,'Preferências'),(58,2,'Preferências'),(59,1,'International'),(59,2,'Internacional'),(60,1,'Localização'),(60,2,'Localização'),(61,1,'Localização'),(61,2,'Localização'),(62,1,'Idiomas'),(62,2,'Idiomas'),(63,1,'Moedas'),(63,2,'Moedas'),(64,1,'Geolocalização'),(64,2,'Geolocalização'),(65,1,'Locations'),(65,2,'Locations'),(66,1,'Países'),(66,2,'Países'),(67,1,'Zonas'),(67,2,'Regiões'),(68,1,'Estados/Distritos'),(68,2,'Estados'),(69,1,'IVA'),(69,2,'Taxas'),(70,1,'IVA'),(70,2,'Taxas'),(71,1,'Regras de IVA'),(71,2,'Regras de impostos'),(72,1,'Traduções'),(72,2,'Traduções'),(73,1,'Configurar'),(73,2,'Configurar'),(74,1,'Shop Parameters'),(74,2,'Shop Parameters'),(75,1,'Geral'),(75,2,'Geral'),(76,1,'Geral'),(76,2,'Geral'),(77,1,'Manutenção'),(77,2,'Manutenção'),(78,1,'Order Settings'),(78,2,'Order Settings'),(79,1,'Order Settings'),(79,2,'Order Settings'),(80,1,'Estados das Encomendas'),(80,2,'Status'),(81,1,'Produtos'),(81,2,'Produtos'),(82,1,'Customer Settings'),(82,2,'Customer Settings'),(83,1,'Clientes'),(83,2,'Clientes'),(84,1,'Grupos'),(84,2,'Grupos'),(85,1,'Títulos Sociais'),(85,2,'Títulos'),(86,1,'Contacto'),(86,2,'Contato'),(87,1,'Contactos'),(87,2,'Contatos'),(88,1,'Lojas'),(88,2,'Lojas'),(89,1,'Traffic & SEO'),(89,2,'Traffic & SEO'),(90,1,'SEO e URLs'),(90,2,'SEO & URLs'),(91,1,'Motores de Pesquisa'),(91,2,'Sistemas de busca'),(92,1,'Referências'),(92,2,'Referências'),(93,1,'Pesquisar'),(93,2,'Busca'),(94,1,'Pesquisar'),(94,2,'Busca'),(95,1,'Etiquetas'),(95,2,'Tags'),(96,1,'Parâmetros Avançados'),(96,2,'Parâmetros Avançados'),(97,1,'Informação'),(97,2,'Informação'),(98,1,'Desempenho'),(98,2,'Desempenho'),(99,1,'Administração'),(99,2,'Administração'),(100,1,'Email'),(100,2,'Email'),(101,1,'Importar'),(101,2,'Importar'),(102,1,'Empregados'),(102,2,'Empregados'),(103,1,'Funcionários'),(103,2,'Empregados'),(104,1,'Perfis de utilizadores'),(104,2,'Perfis'),(105,1,'Permissões'),(105,2,'Permissões'),(106,1,'Database'),(106,2,'Database'),(107,1,'Gestor SQL'),(107,2,'Gerenciador SQL'),(108,1,'Cópia da Base de Dados'),(108,2,'Backup do BD'),(109,1,'Registos'),(109,2,'Logs'),(110,1,'Webservice'),(110,2,'WebService'),(111,1,'Multi-Loja'),(111,2,'Multiloja'),(112,1,'Multi-Loja'),(112,2,'Multiloja'),(113,1,'Acesso Rápido'),(113,2,'Acesso Rápido'),(114,1,'Mais'),(114,2,'Mais'),(116,1,'Dashgoals'),(116,2,'Dashgoals'),(117,1,'Link Widget'),(117,2,'Link Widget'),(118,1,'Welcome'),(118,2,'Welcome'),(119,1,'Merchant Expertise'),(119,2,'Merchant Expertise'),(120,1,'Cron Jobs'),(120,2,'Cron Jobs');
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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite`
--

LOCK TABLES `tramite` WRITE;
/*!40000 ALTER TABLE `tramite` DISABLE KEYS */;
INSERT INTO `tramite` VALUES (7,3,'CREDITO',130.28,'2017-09-19',NULL),(8,4,'DEBITO',130.28,'2017-09-19',NULL),(9,1,'CREDITO',130.28,'2017-09-19',NULL),(10,3,'DEBITO',130.28,'2017-09-19',NULL),(11,1,'CREDITO',300.00,'2017-09-27',NULL),(12,2,'DEBITO',300.00,'2017-09-27',NULL),(13,3,'CREDITO',122.74,'2017-10-01',NULL),(14,4,'DEBITO',122.74,'2017-10-01',NULL),(15,1,'CREDITO',2285.00,'2017-10-02',NULL),(16,2,'DEBITO',2285.00,'2017-10-02',NULL),(17,1,'CREDITO',120.00,'2017-10-02',NULL),(18,1,'CREDITO',122.74,'2017-10-03',NULL),(19,3,'DEBITO',122.74,'2017-10-03',NULL),(20,1,'CREDITO',200.00,'2017-10-03',NULL),(22,1,'CREDITO',275.00,'2017-10-07',''),(23,2,'DEBITO',275.00,'2017-10-07',''),(24,1,'CREDITO',175.00,'2017-10-07','100,00 Flip4 (Tati); 55,00 Carregador Portátil 5600mAh (Camila); 20,00 Dois Desodorante Dove (Luana);'),(25,2,'DEBITO',1500.00,'2017-10-09','Devolução para o Paulinho'),(26,1,'CREDITO',100.00,'2017-10-09','Tramite entre contas'),(27,2,'DEBITO',100.00,'2017-10-09','Tramite entre contas'),(28,2,'CREDITO',110.00,'2017-10-10','Pagamento Daniele'),(29,1,'CREDITO',130.00,'2017-10-10',''),(30,2,'DEBITO',130.00,'2017-10-10',''),(31,2,'CREDITO',90.00,'2017-10-11','Creme e Perfume (Camila)'),(32,1,'CREDITO',1590.00,'2017-10-12',''),(33,2,'DEBITO',1590.00,'2017-10-12',''),(34,1,'CREDITO',150.00,'2017-10-14',''),(35,2,'DEBITO',150.00,'2017-10-14',''),(36,1,'CREDITO',275.00,'2017-10-16',''),(37,2,'DEBITO',275.00,'2017-10-16',''),(38,1,'CREDITO',160.00,'2017-10-17','60,00 Isabel; 70,00 Perfume Tommy; 10,00 Relogio da Jeniffer; 20,00 Creme pago de Ponta Porã'),(39,2,'CREDITO',60.00,'2017-10-18','Segunda e ultima parcela do Relogio Curren (Jaime)'),(40,5,'CREDITO',2400.00,'2017-10-19','Deposito para compra do IPAD Pro 64GB'),(41,1,'CREDITO',190.00,'2017-10-22',''),(42,2,'DEBITO',190.00,'2017-10-22',''),(43,1,'CREDITO',1463.35,'2017-10-22',''),(44,3,'DEBITO',1463.35,'2017-10-22',''),(45,1,'DEBITO',2400.00,'2017-10-22','Retirada do dinheiro colocado para compra do IPAD Pro 64GB'),(46,2,'CREDITO',60.00,'2017-10-26','60,00 Relogio da Dri'),(47,1,'CREDITO',110.00,'2017-10-28',''),(48,2,'DEBITO',110.00,'2017-10-28',''),(49,2,'CREDITO',100.00,'2017-10-28','Pagamento Tati (JBL FLIP4)'),(50,1,'CREDITO',150.00,'2017-11-01',''),(51,2,'DEBITO',150.00,'2017-11-01',''),(52,1,'CREDITO',2550.00,'2017-11-01','Entrada para compra de Iphone 7 128GB'),(53,1,'CREDITO',40.00,'2017-11-02','40,00 (Juliana) Parte final da compras dos cremes Revlon'),(54,1,'CREDITO',3000.00,'2017-11-02',''),(55,2,'DEBITO',3000.00,'2017-11-02',''),(56,1,'DEBITO',2550.00,'2017-11-02','Devolução para o Thiago (2550,00) emprestados para compra do Iphone7 128GB'),(57,1,'CREDITO',180.00,'2017-11-05',''),(58,2,'DEBITO',180.00,'2017-11-05',''),(59,1,'CREDITO',200.00,'2017-11-06','Ultima parcela Agnaldo'),(60,2,'CREDITO',130.00,'2017-11-06','Pagamento Adriana (Relógio)'),(61,1,'CREDITO',280.00,'2017-11-06','Pagamento Jeanny (Creatina e Pulseira Inteligente Sky)'),(62,2,'DEBITO',280.00,'2017-11-06','Pagamento Jeanny (Creatina e Pulseira Inteligente Sky)'),(63,1,'CREDITO',230.00,'2017-11-07','1º Parcela Marção (Receptor)'),(64,1,'CREDITO',100.00,'2017-11-07',''),(65,2,'DEBITO',100.00,'2017-11-07',''),(66,2,'CREDITO',65.00,'2017-11-07','Pagamento Marlon (Relogio Curren)'),(67,1,'CREDITO',142.51,'2017-11-07',''),(68,3,'DEBITO',142.51,'2017-11-07',''),(69,1,'CREDITO',375.00,'2017-11-07',''),(70,2,'DEBITO',375.00,'2017-11-07',''),(71,1,'CREDITO',1000.00,'2017-11-07',''),(72,2,'DEBITO',1000.00,'2017-11-07',''),(73,2,'CREDITO',90.00,'2017-11-08','Pagamento final Camila (Creme e Perfume)'),(74,1,'DEBITO',217.78,'2017-11-08','Retirado para pagamento da parcela de novembro da casa de Floripa'),(75,1,'CREDITO',200.00,'2017-11-08',''),(76,2,'DEBITO',200.00,'2017-11-08',''),(77,5,'CREDITO',2030.00,'2017-11-09',''),(78,2,'DEBITO',2030.00,'2017-11-09',''),(79,2,'CREDITO',80.00,'2017-11-10','Pagamento final Patricia (Relogio Feminino Q&Q)'),(80,1,'CREDITO',100.00,'2017-11-10','Pagamento final Eric (Relogio Masculino Naviforce Khaki)'),(81,1,'CREDITO',260.00,'2017-11-10','Pagamento final Thays Araujo (2 Relogios Femininos)'),(82,2,'CREDITO',120.00,'2017-11-10','Pagamento final Ana Maria (Perfume Ferrari Black 125ml)'),(83,2,'CREDITO',50.00,'2017-11-10','Pagamento Ighor (Relógio Masculino Naviforce Gold)'),(84,1,'CREDITO',400.00,'2017-11-11',''),(85,2,'DEBITO',400.00,'2017-11-11',''),(86,1,'CREDITO',112.00,'2017-11-13',''),(87,2,'DEBITO',112.00,'2017-11-13',''),(88,3,'CREDITO',1368.94,'2017-11-14',''),(89,4,'DEBITO',1368.94,'2017-11-14',''),(90,6,'CREDITO',2030.00,'2017-11-14',''),(91,5,'DEBITO',2030.00,'2017-11-14',''),(92,7,'CREDITO',2697.33,'2017-11-14',''),(93,1,'DEBITO',2697.33,'2017-11-14',''),(94,7,'CREDITO',1368.94,'2017-11-14',''),(95,3,'DEBITO',1368.94,'2017-11-14',''),(96,2,'CREDITO',170.00,'2017-11-14','Pagamento final Tati (JBL Flip4)'),(97,2,'CREDITO',50.00,'2017-11-14','Pagamento Bete (Creme Victoria\'s Secret)'),(98,7,'CREDITO',220.00,'2017-11-16',''),(99,2,'DEBITO',220.00,'2017-11-16',''),(100,7,'CREDITO',1321.74,'2017-11-16',''),(101,3,'DEBITO',1321.74,'2017-11-16',''),(102,7,'DEBITO',1000.00,'2017-11-21',''),(103,7,'CREDITO',120.00,'2017-11-22',''),(104,1,'DEBITO',120.00,'2017-11-22',''),(105,2,'CREDITO',100.00,'2017-11-21','Pagamento final Aline Cerialli (Carregador Portátil)'),(106,1,'CREDITO',260.00,'2017-11-22',''),(107,2,'DEBITO',260.00,'2017-11-22',''),(108,1,'CREDITO',205.00,'2017-11-24',''),(109,2,'DEBITO',205.00,'2017-11-24',''),(110,1,'CREDITO',2000.00,'2017-11-24',''),(111,6,'DEBITO',2000.00,'2017-11-24',''),(112,7,'CREDITO',390.00,'2017-11-27',''),(113,2,'DEBITO',390.00,'2017-11-27',''),(114,7,'CREDITO',294.92,'2017-11-27',''),(115,1,'DEBITO',294.92,'2017-11-27',''),(116,6,'CREDITO',2100.00,'2017-11-29',''),(117,2,'DEBITO',2100.00,'2017-11-29',''),(118,7,'CREDITO',200.00,'2017-11-30',''),(119,2,'DEBITO',200.00,'2017-11-30',''),(120,7,'CREDITO',125.00,'2017-11-30',''),(121,2,'DEBITO',125.00,'2017-11-30',''),(122,7,'CREDITO',1120.00,'2017-12-02',''),(123,2,'DEBITO',1120.00,'2017-12-02',''),(124,7,'DEBITO',681.00,'2017-12-02','Devolução ao Paulinho da part final'),(125,7,'CREDITO',60.00,'2017-12-02',''),(126,2,'DEBITO',60.00,'2017-12-02',''),(127,7,'CREDITO',450.00,'2017-12-04',''),(128,1,'DEBITO',450.00,'2017-12-04',''),(129,7,'CREDITO',530.00,'2017-12-04',''),(130,2,'DEBITO',530.00,'2017-12-04',''),(131,6,'CREDITO',1150.00,'2017-12-04',''),(132,7,'DEBITO',1150.00,'2017-12-04',''),(133,1,'CREDITO',150.00,'2017-12-04',''),(134,2,'DEBITO',150.00,'2017-12-04',''),(135,6,'CREDITO',1000.00,'2017-12-04',''),(136,2,'DEBITO',1000.00,'2017-12-04',''),(137,7,'CREDITO',90.00,'2017-12-06',''),(138,2,'DEBITO',90.00,'2017-12-06',''),(139,2,'DEBITO',75.00,'2017-12-07',''),(140,7,'CREDITO',150.00,'2017-12-08',''),(141,1,'DEBITO',150.00,'2017-12-08',''),(142,7,'CREDITO',850.00,'2017-12-08',''),(143,2,'DEBITO',850.00,'2017-12-08',''),(144,7,'DEBITO',287.19,'2017-12-08','Despesas'),(145,1,'CREDITO',390.00,'2017-12-09',''),(146,2,'DEBITO',390.00,'2017-12-09',''),(147,1,'CREDITO',100.00,'2017-12-10','Pagamento final Ighor (Relogio Naviforce)'),(148,1,'CREDITO',150.00,'2017-12-10',''),(149,2,'DEBITO',150.00,'2017-12-10',''),(150,7,'CREDITO',302.11,'2017-12-11',''),(151,3,'DEBITO',302.11,'2017-12-11',''),(152,7,'CREDITO',640.00,'2017-12-11',''),(153,1,'DEBITO',640.00,'2017-12-11',''),(154,1,'CREDITO',375.00,'2017-12-11',''),(155,2,'DEBITO',375.00,'2017-12-11',''),(156,7,'CREDITO',375.00,'2017-12-12',''),(157,1,'DEBITO',375.00,'2017-12-12',''),(158,7,'CREDITO',151.06,'2017-12-13',''),(159,3,'DEBITO',151.06,'2017-12-13',''),(160,2,'CREDITO',120.00,'2017-12-13','Pagamento final Thays Araujo (Chromecast 2)'),(161,1,'CREDITO',720.00,'2017-12-13',''),(162,2,'DEBITO',720.00,'2017-12-13',''),(163,2,'CREDITO',50.00,'2017-12-14','Pagamento final Bete (Creme Victorias Secret + 2 Desodorantes)'),(164,1,'CREDITO',3000.00,'2017-12-14','Saque para compra de produtos'),(165,6,'DEBITO',3000.00,'2017-12-14','Saque para compra de produtos'),(166,1,'DEBITO',20.00,'2017-12-14',''),(167,6,'CREDITO',280.00,'2017-12-15',''),(168,1,'DEBITO',280.00,'2017-12-15',''),(169,1,'CREDITO',20.00,'2017-12-15',''),(170,1,'DEBITO',40.00,'2017-12-15',''),(171,1,'CREDITO',650.00,'2017-12-15',''),(172,1,'CREDITO',2825.94,'2017-12-16',''),(173,7,'DEBITO',2825.94,'2017-12-16',''),(174,1,'CREDITO',150.00,'2017-12-16',''),(175,2,'DEBITO',150.00,'2017-12-16',''),(176,1,'CREDITO',520.00,'2017-12-16',''),(177,2,'DEBITO',520.00,'2017-12-16',''),(178,1,'CREDITO',90.00,'2017-12-16',''),(179,6,'DEBITO',90.00,'2017-12-16',''),(180,1,'CREDITO',1262.00,'2017-12-16','Compra Iphone 7 32 GB (Cláudia)'),(181,5,'CREDITO',2400.00,'2017-12-18',''),(182,2,'DEBITO',2400.00,'2017-12-18',''),(183,5,'DEBITO',1262.00,'2017-12-18','Devolução a Luana (Iphone 7 32 GB da Cláudia)'),(184,1,'CREDITO',1138.00,'2017-12-18',''),(185,5,'DEBITO',1138.00,'2017-12-18',''),(186,7,'CREDITO',3993.31,'2017-12-18',''),(187,1,'DEBITO',3993.31,'2017-12-18',''),(188,7,'CREDITO',300.00,'2017-12-18',''),(189,1,'DEBITO',300.00,'2017-12-18',''),(190,7,'CREDITO',350.00,'2017-12-18',''),(191,2,'DEBITO',350.00,'2017-12-18',''),(192,1,'CREDITO',70.00,'2017-12-15',''),(193,2,'DEBITO',70.00,'2017-12-15',''),(194,7,'CREDITO',1470.00,'2017-12-19',''),(195,6,'DEBITO',1470.00,'2017-12-19',''),(196,7,'CREDITO',460.00,'2017-12-19',''),(197,1,'DEBITO',460.00,'2017-12-19',''),(198,1,'CREDITO',100.00,'2017-12-19',''),(199,2,'DEBITO',100.00,'2017-12-19',''),(200,7,'CREDITO',100.00,'2017-12-20',''),(201,1,'DEBITO',100.00,'2017-12-20',''),(202,7,'CREDITO',1100.00,'2017-12-20',''),(203,2,'DEBITO',1100.00,'2017-12-20',''),(204,7,'DEBITO',200.35,'2017-12-20',''),(205,7,'CREDITO',27.00,'2017-12-21',''),(206,7,'CREDITO',2973.91,'2017-12-21',''),(207,3,'DEBITO',2973.91,'2017-12-21',''),(208,2,'DEBITO',70.00,'2017-12-21',''),(209,6,'CREDITO',4173.91,'2017-12-21',''),(210,7,'DEBITO',4173.91,'2017-12-21',''),(211,7,'CREDITO',160.00,'2017-12-21',''),(212,2,'DEBITO',160.00,'2017-12-21',''),(213,7,'CREDITO',142.51,'2018-01-08',''),(214,3,'DEBITO',142.51,'2018-01-08',''),(215,7,'CREDITO',130.00,'2018-01-08',''),(216,1,'DEBITO',130.00,'2018-01-08',''),(217,7,'CREDITO',4711.00,'2018-01-08',''),(218,2,'DEBITO',4711.00,'2018-01-08',''),(219,7,'CREDITO',4173.91,'2018-01-08',''),(220,6,'DEBITO',4173.91,'2018-01-08',''),(221,2,'CREDITO',430.00,'2018-01-08',''),(222,7,'DEBITO',430.00,'2018-01-08',''),(223,7,'DEBITO',2000.00,'2017-12-27','Retirada de Ferias (Florianopolis)'),(224,2,'DEBITO',65.00,'2018-01-10',''),(225,7,'CREDITO',170.00,'2018-01-10',''),(226,2,'DEBITO',170.00,'2018-01-10',''),(227,7,'CREDITO',80.00,'2018-01-10',''),(228,2,'DEBITO',80.00,'2018-01-10',''),(229,7,'CREDITO',400.00,'2018-01-10',''),(230,1,'DEBITO',400.00,'2018-01-10',''),(231,7,'CREDITO',1680.00,'2018-01-10',''),(232,2,'DEBITO',1680.00,'2018-01-10',''),(233,7,'CREDITO',440.00,'2018-01-12',''),(234,1,'DEBITO',440.00,'2018-01-12',''),(235,7,'CREDITO',150.00,'2018-01-12',''),(236,2,'DEBITO',150.00,'2018-01-12',''),(237,7,'DEBITO',1469.14,'2018-01-19',''),(238,1,'CREDITO',60.00,'2018-01-26',''),(239,2,'DEBITO',60.00,'2018-01-26',''),(240,1,'CREDITO',30.00,'2018-01-26','Pagamento Cida (Tapete)'),(241,2,'CREDITO',90.00,'2018-01-26','Pagamento final Thays Araujo (Chromecast 2)'),(242,5,'DEBITO',550.00,'2018-01-25','Retirado para pagamento da 1ª parcela das Fotos (Johnny)'),(243,5,'CREDITO',500.00,'2018-01-30',''),(244,1,'DEBITO',500.00,'2018-01-30',''),(245,5,'CREDITO',90.00,'2018-01-30',''),(246,2,'DEBITO',90.00,'2018-01-30',''),(247,5,'CREDITO',21.27,'2018-01-30',''),(248,7,'DEBITO',21.27,'2018-01-30',''),(249,5,'DEBITO',886.27,'2018-01-30','');
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (25,7,4,'2017-09-08',160.00,1,'VENDACONCLUIDA'),(26,8,4,'2017-09-09',160.00,1,'VENDACONCLUIDA'),(27,9,4,'2017-09-07',900.00,2,'VENDACONCLUIDA'),(29,10,4,'2017-09-07',450.00,1,'VENDACONCLUIDA'),(30,11,4,'2017-09-07',140.00,1,'VENDACONCLUIDA'),(31,12,4,'2017-09-07',160.00,1,'VENDACONCLUIDA'),(32,13,4,'2017-09-07',3200.00,1,'VENDACONCLUIDA'),(33,14,4,'2017-09-23',200.00,1,'VENDACONCLUIDA'),(34,15,4,'2017-09-23',1500.00,2,'VENDACONCLUIDA'),(35,16,3,'2017-09-23',410.00,1,'VENDACONCLUIDA'),(36,17,4,'2017-09-26',400.00,1,'VENDACONCLUIDA'),(37,18,4,'2017-09-23',130.00,1,'VENDACONCLUIDA'),(38,19,4,'2017-09-28',175.00,1,'VENDACONCLUIDA'),(39,20,4,'2017-09-23',150.00,1,'VENDACONCLUIDA'),(40,21,4,'2017-09-23',410.00,1,'VENDACONCLUIDA'),(41,22,4,'2017-10-04',150.00,2,'VENDACONCLUIDA'),(42,24,4,'2017-10-12',4050.00,1,'VENDACONCLUIDA'),(43,25,4,'2017-10-14',150.00,1,'VENDACONCLUIDA'),(44,26,4,'2017-10-16',275.00,5,'VENDACONCLUIDA'),(45,27,4,'2017-10-18',80.00,1,'VENDACONCLUIDA'),(46,28,4,'2017-10-21',190.00,1,'VENDACONCLUIDA'),(47,29,4,'2017-10-21',150.00,1,'VENDACONCLUIDA'),(48,17,4,'2017-10-21',160.00,1,'VENDACONCLUIDA'),(49,26,3,'2017-10-20',3150.00,1,'VENDACONCLUIDA'),(50,23,4,'2017-11-02',3000.00,3,'VENDACONCLUIDA'),(51,30,3,'2017-11-03',150.00,1,'VENDACONCLUIDA'),(52,31,4,'2017-11-06',30.00,1,'VENDACONCLUIDA'),(53,32,4,'2017-11-06',280.00,2,'VENDACONCLUIDA'),(54,13,4,'2017-11-07',3400.00,1,'VENDACONCLUIDA'),(55,34,4,'2017-11-07',350.00,2,'VENDACONCLUIDA'),(56,33,4,'2017-11-07',1100.00,3,'VENDACONCLUIDA'),(57,35,4,'2017-11-07',120.00,1,'VENDACONCLUIDA'),(58,36,4,'2017-11-07',160.00,1,'PAGAMENTOPARCIAL'),(59,37,4,'2017-11-08',180.00,1,'VENDACONCLUIDA'),(60,7,4,'2017-11-10',70.00,1,'VENDACONCLUIDA'),(61,39,4,'2017-11-13',1120.00,1,'PAGAMENTOPARCIAL'),(62,38,3,'2017-11-13',140.00,1,'VENDACONCLUIDA'),(63,7,4,'2017-11-13',2850.00,2,'VENDACONCLUIDA'),(64,40,4,'2017-11-13',6849.99,1,'VENDACONCLUIDA'),(65,41,4,'2017-11-13',160.00,1,'VENDACONCLUIDA'),(66,20,4,'2017-11-13',300.00,2,'VENDACONCLUIDA'),(67,42,3,'2017-11-18',120.00,1,'VENDACONCLUIDA'),(68,43,4,'2017-11-19',70.00,1,'VENDACONCLUIDA'),(69,44,4,'2017-11-19',100.00,1,'VENDACONCLUIDA'),(70,7,4,'2017-11-12',470.00,1,'VENDACONCLUIDA'),(71,45,4,'2017-11-19',195.00,2,'VENDACONCLUIDA'),(72,46,4,'2017-11-02',0.00,1,'VENDACONCLUIDA'),(73,33,4,'2017-11-11',60.00,2,'VENDACONCLUIDA'),(74,47,4,'2017-11-24',150.00,1,'VENDACONCLUIDA'),(75,48,4,'2017-11-26',100.00,1,'VENDACONCLUIDA'),(76,49,4,'2017-11-26',120.00,1,'VENDACONCLUIDA'),(77,50,4,'2017-11-27',170.00,2,'VENDACONCLUIDA'),(78,51,4,'2017-11-27',160.00,2,'PAGAMENTOPARCIAL'),(79,52,4,'2017-11-27',70.00,1,'VENDACONCLUIDA'),(80,35,4,'2017-11-27',120.00,1,'VENDACONCLUIDA'),(81,53,4,'2017-11-27',170.00,2,'VENDACONCLUIDA'),(82,54,4,'2017-11-27',150.00,1,'VENDACONCLUIDA'),(83,55,4,'2017-11-29',50.00,1,'VENDACONCLUIDA'),(84,24,4,'2017-11-27',1200.00,1,'VENDACONCLUIDA'),(85,57,4,'2017-11-30',125.00,1,'VENDACONCLUIDA'),(86,56,4,'2017-11-30',120.00,1,'VENDACONCLUIDA'),(87,58,4,'2017-11-30',60.00,1,'VENDACONCLUIDA'),(88,59,4,'2017-11-30',35.00,1,'VENDACONCLUIDA'),(89,61,4,'2017-12-02',60.00,2,'VENDACONCLUIDA'),(90,62,3,'2017-11-25',450.00,1,'VENDACONCLUIDA'),(91,63,4,'2017-12-04',150.00,1,'VENDACONCLUIDA'),(92,64,4,'2017-12-04',410.00,1,'VENDACONCLUIDA'),(93,65,4,'2017-12-09',390.00,1,'VENDACONCLUIDA'),(94,49,4,'2017-12-09',320.00,1,'VENDACONCLUIDA'),(95,24,4,'2017-12-11',5600.00,1,'AGUARDANDOPAGAMENTO'),(96,66,4,'2017-12-11',1250.00,1,'PAGAMENTOPARCIAL'),(97,9,4,'2017-12-12',200.00,1,'VENDACONCLUIDA'),(99,67,4,'2017-12-15',30.00,1,'VENDACONCLUIDA'),(100,68,4,'2017-12-18',2400.00,1,'VENDACONCLUIDA'),(101,62,3,'2017-12-18',600.00,1,'VENDACONCLUIDA'),(102,24,4,'2017-12-18',1400.00,1,'VENDACONCLUIDA'),(103,69,3,'2017-12-18',150.00,1,'VENDACONCLUIDA'),(104,17,4,'2017-12-15',70.00,1,'VENDACONCLUIDA'),(105,70,3,'2017-12-18',130.00,1,'VENDACONCLUIDA'),(106,71,3,'2017-12-18',280.00,1,'PAGAMENTOPARCIAL'),(107,20,4,'2017-12-18',130.00,2,'VENDACONCLUIDA'),(108,68,4,'2017-12-18',30.00,1,'VENDACONCLUIDA'),(109,22,4,'2017-12-18',65.00,1,'VENDACONCLUIDA'),(110,72,3,'2017-12-18',240.00,2,'VENDACONCLUIDA'),(111,73,4,'2017-12-19',4073.91,1,'VENDACONCLUIDA'),(112,74,4,'2017-12-19',70.00,2,'VENDACONCLUIDA'),(113,75,4,'2017-12-21',3850.00,1,'VENDACONCLUIDA'),(114,76,4,'2017-12-24',150.00,1,'PAGAMENTOPARCIAL'),(115,52,4,'2017-12-27',120.00,1,'AGUARDANDOPAGAMENTO'),(116,77,4,'2017-12-24',65.00,1,'PAGAMENTOPARCIAL'),(117,33,4,'2017-12-24',38.00,1,'VENDACONCLUIDA'),(118,78,4,'2017-12-27',50.00,1,'VENDACONCLUIDA'),(119,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(120,46,3,'2018-01-08',0.00,1,'VENDACONCLUIDA'),(121,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(122,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(123,46,3,'2017-12-27',0.00,1,'VENDACONCLUIDA'),(124,47,4,'2018-01-10',150.00,1,'PAGAMENTOPARCIAL'),(125,79,4,'2018-01-10',210.00,1,'PAGAMENTOPARCIAL'),(126,20,4,'2018-01-10',190.00,1,'AGUARDANDOPAGAMENTO'),(127,17,4,'2018-01-10',3850.00,1,'PAGAMENTOPARCIAL'),(128,80,3,'2018-01-10',400.00,1,'VENDACONCLUIDA'),(131,51,33,'2018-01-10',455.00,4,'AGUARDANDOPAGAMENTO'),(132,47,4,'2018-01-11',150.00,1,'AGUARDANDOPAGAMENTO'),(133,40,4,'2018-01-22',1800.00,1,'PAGAMENTOPARCIAL'),(134,81,4,'2018-01-22',60.00,2,'VENDACONCLUIDA'),(135,82,33,'2018-01-22',230.00,1,'AGUARDANDOPAGAMENTO'),(136,6,4,'2018-01-22',210.00,1,'AGUARDANDOPAGAMENTO'),(137,83,4,'2018-01-22',250.00,1,'VENDACONCLUIDA'),(138,80,3,'2018-01-22',810.00,1,'AGUARDANDOPAGAMENTO'),(139,84,3,'2018-01-23',130.00,1,'AGUARDANDOPAGAMENTO'),(140,85,3,'2018-01-21',350.00,1,'AGUARDANDOPAGAMENTO'),(141,22,3,'2018-01-21',200.00,1,'AGUARDANDOPAGAMENTO'),(142,86,3,'2018-01-23',130.00,1,'VENDACONCLUIDA'),(143,87,3,'2018-01-22',30.00,1,'VENDACONCLUIDA'),(144,88,4,'2018-01-23',120.00,1,'AGUARDANDOPAGAMENTO'),(145,89,4,'2018-01-23',180.00,2,'AGUARDANDOPAGAMENTO'),(146,31,4,'2018-01-24',95.00,1,'AGUARDANDOPAGAMENTO');
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

-- Dump completed on 2018-01-31 15:11:00
