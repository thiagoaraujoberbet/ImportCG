CREATE DATABASE  IF NOT EXISTS `u684253104_impcg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `u684253104_impcg`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: u684253104_impcg
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `despesaLancada` bit(1) NOT NULL,
  PRIMARY KEY (`idEntrada`),
  UNIQUE KEY `idEntrada_UNIQUE` (`idEntrada`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`idPessoa`),
  UNIQUE KEY `idPessoa_UNIQUE` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `prefixo` varchar(20) DEFAULT NULL,
  `dataCriacao` date DEFAULT NULL,
  `dataAlteracao` date DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `idProduto_UNIQUE` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-20 17:28:41
