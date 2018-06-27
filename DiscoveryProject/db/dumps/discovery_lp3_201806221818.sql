-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: discovery
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `aeronave`
--

DROP TABLE IF EXISTS `aeronave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeronave` (
  `Prefixo` int(11) NOT NULL AUTO_INCREMENT,
  `QtdEconomica` int(11) NOT NULL,
  `QtdPrimeiraClasse` int(11) NOT NULL,
  PRIMARY KEY (`Prefixo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeronave`
--

LOCK TABLES `aeronave` WRITE;
/*!40000 ALTER TABLE `aeronave` DISABLE KEYS */;
INSERT INTO `aeronave` VALUES (1,30,15),(2,120,80);
/*!40000 ALTER TABLE `aeronave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assento`
--

DROP TABLE IF EXISTS `assento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assento` (
  `idAssento` int(11) NOT NULL AUTO_INCREMENT,
  `Localizacao` varchar(45) NOT NULL,
  `Cabine` tinyint(4) NOT NULL COMMENT 'Indica a cabine em que o assento esta alocado.',
  `Aeronave` int(11) NOT NULL,
  PRIMARY KEY (`idAssento`),
  KEY `idx_Assento_Aeronave` (`Aeronave`),
  CONSTRAINT `fkAeronave_Assento_Aeronave` FOREIGN KEY (`Aeronave`) REFERENCES `aeronave` (`Prefixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assento`
--

LOCK TABLES `assento` WRITE;
/*!40000 ALTER TABLE `assento` DISABLE KEYS */;
INSERT INTO `assento` VALUES (1,'C10A23',1,1),(2,'C20A12',2,1),(3,'C10A23',2,2),(4,'C10A24',1,2);
/*!40000 ALTER TABLE `assento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `Cidade` varchar(45) NOT NULL,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Salvador'),(2,'Rio de Janeiro'),(3,'São Paulo'),(4,'Curitiba'),(5,'Fortaleza'),(6,'Ilhéus');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Cpf` varchar(17) NOT NULL,
  `Senha` char(32) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  PRIMARY KEY (`Cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('111.111.111-11','81dc9bdb52d04dc20036dbd8313ed055','Daenerys Targaryen','1990-03-04','daenerys@westeros.com','1111-2222'),('222.222.222-22','81dc9bdb52d04dc20036dbd8313ed055','Jon Snow','1990-03-04','jon@westeros.com','2222-3333'),('333.333.333-33','81dc9bdb52d04dc20036dbd8313ed055','Tyrion Lannister','1990-03-04','tyrion@westeros.com','3333-4444'),('444.444.444-44','81dc9bdb52d04dc20036dbd8313ed055','Brandon Stark','1990-03-04','bran@westeros.com','4444-5555'),('777.777.777-77','81dc9bdb52d04dc20036dbd8313ed055','Bianca Hereda','2018-06-26','heredabianca@gmail.com','7777-7777'),('888.888.888-88','81dc9bdb52d04dc20036dbd8313ed055','Gilmar Luis','2018-06-26','gilmar@hotmail.com','8888-8888'),('999.999.999-99','81dc9bdb52d04dc20036dbd8313ed055','Mateus Pena','2018-06-26','mateus@hotmail.com','9999-9999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `Passagem` int(11) NOT NULL,
  `NumCartão` char(20) NOT NULL,
  `CodCartao` char(3) NOT NULL,
  `Valor` float NOT NULL,
  `DataVencimento` datetime NOT NULL,
  `QntParcelas` int(11) DEFAULT '1',
  PRIMARY KEY (`Passagem`),
  CONSTRAINT `fk_pagamento_passagem` FOREIGN KEY (`Passagem`) REFERENCES `passagem` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagem`
--

DROP TABLE IF EXISTS `passagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passagem` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Cancelada` tinyint(1) DEFAULT '0',
  `DataCheckIn` datetime DEFAULT NULL,
  `Assento` int(11) DEFAULT NULL,
  `Programacao` int(11) NOT NULL,
  `Cliente` varchar(17) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `CodigoProgramacao_idx` (`Programacao`),
  KEY `idAssento_idx` (`Assento`),
  KEY `cpfCliente_idx` (`Cliente`),
  CONSTRAINT `fkAssento_Passagem_Assento` FOREIGN KEY (`Assento`) REFERENCES `assento` (`idAssento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkCliente_Passagem_Cliente` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`Cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkProgramacao_Passagem_Programacao` FOREIGN KEY (`Programacao`) REFERENCES `programacao` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagem`
--

LOCK TABLES `passagem` WRITE;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacao`
--

DROP TABLE IF EXISTS `programacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programacao` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `DataSaida` datetime NOT NULL,
  `DataChegada` datetime NOT NULL COMMENT 'data de chegada tem que ser maior do que a data de saida',
  `NumeroVoo` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `NumeroVoo_idx` (`NumeroVoo`),
  CONSTRAINT `fkNumeroVoo_Programacao_Voo` FOREIGN KEY (`NumeroVoo`) REFERENCES `voo` (`Numero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacao`
--

LOCK TABLES `programacao` WRITE;
/*!40000 ALTER TABLE `programacao` DISABLE KEYS */;
INSERT INTO `programacao` VALUES (1,'2018-05-14 06:10:00','2018-05-14 09:25:10',1),(2,'2018-05-21 13:30:00','2018-05-26 16:20:00',2),(3,'2018-05-08 18:00:00','2018-05-08 13:00:00',3),(4,'2018-05-14 18:45:00','2018-05-27 20:00:00',4),(5,'2018-05-14 12:00:00','2018-05-14 15:00:00',4);
/*!40000 ALTER TABLE `programacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacao`
--

DROP TABLE IF EXISTS `reclamacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reclamacao` (
  `Passagem` int(11) NOT NULL,
  `Situacao` char(1) DEFAULT 'C' COMMENT 'finalizada, em andamento, cadastrada',
  `DataAbertura` datetime DEFAULT CURRENT_TIMESTAMP,
  `Descricao` text NOT NULL,
  PRIMARY KEY (`Passagem`),
  CONSTRAINT `fkPassagem_Reclamacao_Passagem` FOREIGN KEY (`Passagem`) REFERENCES `passagem` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacao`
--

LOCK TABLES `reclamacao` WRITE;
/*!40000 ALTER TABLE `reclamacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `reclamacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voo` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `ValorEconomica` float NOT NULL,
  `ValorPrimeiraClasse` float NOT NULL,
  `CidadeOrigem` int(11) NOT NULL COMMENT 'cidade origem tem que ser diferente de cidade destino',
  `CidadeDestino` int(11) NOT NULL,
  `Aeronave` int(11) NOT NULL,
  PRIMARY KEY (`Numero`),
  KEY `fkCidadeOrigem_idx` (`CidadeOrigem`),
  KEY `fkCidadeDestino_idx` (`CidadeDestino`),
  KEY `idAeronave_idx` (`Aeronave`),
  CONSTRAINT `fkAeronave_Voo_Aeronave` FOREIGN KEY (`Aeronave`) REFERENCES `aeronave` (`Prefixo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkCidadeDestino_Voo_Cidade` FOREIGN KEY (`CidadeDestino`) REFERENCES `cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkCidadeOrigem_Voo_Cidade` FOREIGN KEY (`CidadeOrigem`) REFERENCES `cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
INSERT INTO `voo` VALUES (1,124.1,173.74,1,2,1),(2,128,179.2,2,1,1),(3,233.3,326.62,3,4,2),(4,45,63,1,2,2);
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-22 18:18:57
