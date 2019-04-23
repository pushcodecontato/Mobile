-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: mob_share
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
-- Table structure for table `tbl_acessorios`
--

DROP TABLE IF EXISTS `tbl_acessorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_acessorios` (
  `id_acessorios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela acessórios',
  `nome_acessorios` varchar(150) NOT NULL COMMENT 'nome dos acessórios',
  `id_tipo_veiculo` int(11) NOT NULL COMMENT 'código da tabela tipo de veículo',
  PRIMARY KEY (`id_acessorios`),
  KEY `fk_tbl_acessorios_tbl_tipo_veiculos_idx` (`id_tipo_veiculo`),
  CONSTRAINT `fk_tbl_acessorios_tbl_tipo_veiculos` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_acessorios`
--

LOCK TABLES `tbl_acessorios` WRITE;
/*!40000 ALTER TABLE `tbl_acessorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_acessorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_anuncio`
--

DROP TABLE IF EXISTS `tbl_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_anuncio` (
  `id_anuncio` int(11) NOT NULL COMMENT 'código da tabela anúncio',
  `descricao` text NOT NULL COMMENT 'descrição da tabela de anúncio',
  `id_cliente_locador` int(11) NOT NULL COMMENT 'código da tabela cliente locador',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela de veículo',
  `horario_inicio` time NOT NULL COMMENT 'horário de inicio do anúncio',
  `horario_termino` time NOT NULL COMMENT 'horário de termino do anúncio',
  `data_inicial` date NOT NULL COMMENT 'data inicial do anúncio',
  `data_final` date NOT NULL COMMENT 'data final do anúncio',
  `status_aprovado` tinyint(4) NOT NULL COMMENT 'status aprovado do anúncio',
  `preco` float NOT NULL,
  PRIMARY KEY (`id_anuncio`),
  KEY `fk_tbl_usuario_tbl_anuncios_idx` (`id_cliente_locador`),
  KEY `fk_tbl_veiculos_tbl_anuncios_idx` (`id_veiculo`),
  CONSTRAINT `fk_tbl_usuario_tbl_anuncios` FOREIGN KEY (`id_cliente_locador`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_tbl_veiculos_tbl_anuncios` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anuncio`
--

LOCK TABLES `tbl_anuncio` WRITE;
/*!40000 ALTER TABLE `tbl_anuncio` DISABLE KEYS */;
INSERT INTO `tbl_anuncio` VALUES (1,'Teste',7,7,'12:00:00','13:00:00','2019-07-01','2019-07-01',1,20),(2,'Teste',9,8,'12:00:00','13:00:00','2019-07-01','2019-07-01',1,50),(3,'Teste',11,9,'12:00:00','13:00:00','2019-07-01','2019-07-01',1,30),(4,'Teste',12,6,'12:00:00','13:00:00','2019-07-01','2019-07-01',1,50),(5,'Teste',12,6,'12:00:00','13:00:00','2019-07-01','2019-07-01',1,50),(6,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(7,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(8,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(9,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(10,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(11,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(12,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(13,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50),(14,'Teste',12,6,'12:00:00','12:00:00','2019-07-01','2019-07-01',1,50);
/*!40000 ALTER TABLE `tbl_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_anuncio_venda`
--

DROP TABLE IF EXISTS `tbl_anuncio_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_anuncio_venda` (
  `id_anuncio_venda` int(11) NOT NULL COMMENT 'código do anúncio de venda',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela do veículo',
  `id_cliente` int(11) NOT NULL COMMENT 'código da tabela do cliente',
  `descricao_anuncio_venda` text NOT NULL COMMENT 'descrição do anúncio de venda',
  `valor_venda` float NOT NULL COMMENT 'valor de venda do anúncio',
  PRIMARY KEY (`id_anuncio_venda`),
  KEY `fk_tbl_usuario_tbl_anuncio_venda_idx` (`id_cliente`),
  KEY `fk_tbl_veiculo_tbl_anuncio_venda_idx` (`id_veiculo`),
  CONSTRAINT `fk_tbl_usuario_tbl_anuncio_venda` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_tbl_veiculo_tbl_anuncio_venda` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_anuncio_venda`
--

LOCK TABLES `tbl_anuncio_venda` WRITE;
/*!40000 ALTER TABLE `tbl_anuncio_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anuncio_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprovacao_anuncio`
--

DROP TABLE IF EXISTS `tbl_aprovacao_anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprovacao_anuncio` (
  `id_aprovacao_anuncio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela aprovação do anúncio',
  `status_aprovacao` tinyint(4) NOT NULL COMMENT 'status da aprovação',
  `id_anuncio` int(11) NOT NULL COMMENT 'código da tabela anúncio',
  `id_usuario_cms` int(11) NOT NULL COMMENT 'código da tabela usuário do cms',
  PRIMARY KEY (`id_aprovacao_anuncio`),
  KEY `fk_tbl_aprovacao_anuncio_tbl_usuario_cms_idx` (`id_usuario_cms`),
  KEY `fk_tbl_aprovacao_anuncio_tbl_anuncio_idx` (`id_anuncio`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_tbl_anuncio` FOREIGN KEY (`id_anuncio`) REFERENCES `tbl_anuncio` (`id_anuncio`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_tbl_usuario_cms` FOREIGN KEY (`id_usuario_cms`) REFERENCES `tbl_usuario_cms` (`id_usuario_cms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprovacao_anuncio`
--

LOCK TABLES `tbl_aprovacao_anuncio` WRITE;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprovacao_anuncio_venda`
--

DROP TABLE IF EXISTS `tbl_aprovacao_anuncio_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprovacao_anuncio_venda` (
  `id_aprovacao_anuncio_venda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código de aprovação do anúncio de venda',
  `status_aprovacao` tinyint(4) NOT NULL COMMENT 'status de aprovação do anúncio de venda',
  `id_anuncio_venda` int(11) NOT NULL COMMENT 'código da tabela de anúncio de venda',
  `id_usuario_cms` int(11) NOT NULL COMMENT 'código da tabela do usuário do cms',
  PRIMARY KEY (`id_aprovacao_anuncio_venda`),
  KEY `fk_tbl_aprovacao_anuncio_tbl_usuario_cms_idx` (`id_usuario_cms`),
  KEY `fk_tbl_aprovacao_anuncio_venda_tbl_anuncio_venda_idx` (`id_anuncio_venda`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_venda_tbl_anuncio_venda` FOREIGN KEY (`id_anuncio_venda`) REFERENCES `tbl_anuncio_venda` (`id_anuncio_venda`),
  CONSTRAINT `fk_tbl_avaliacao_anuncio_venda_tbl_usuario_cms` FOREIGN KEY (`id_usuario_cms`) REFERENCES `tbl_usuario_cms` (`id_usuario_cms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprovacao_anuncio_venda`
--

LOCK TABLES `tbl_aprovacao_anuncio_venda` WRITE;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_aprovacao_veiculo`
--

DROP TABLE IF EXISTS `tbl_aprovacao_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_aprovacao_veiculo` (
  `id_aprovacao_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela aprovação do veículo',
  `status_aprovacao` tinyint(4) NOT NULL COMMENT 'status de aprovação',
  `id_usuario_cms` int(11) NOT NULL COMMENT 'código do usuário do cms',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela veículo',
  PRIMARY KEY (`id_aprovacao_veiculo`),
  KEY `fk_tbl_aprovacao_veiculo_tbl_veiculo_idx` (`id_veiculo`),
  KEY `fk_tbl_aprovacao_veiculo_tbl_usuario_cms_idx` (`id_usuario_cms`),
  CONSTRAINT `fk_tbl_avaliacao_veiculo_tbl_usuario_cms` FOREIGN KEY (`id_usuario_cms`) REFERENCES `tbl_usuario_cms` (`id_usuario_cms`),
  CONSTRAINT `fk_tbl_avaliacao_veiculo_tbl_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aprovacao_veiculo`
--

LOCK TABLES `tbl_aprovacao_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_aprovacao_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_locatario`
--

DROP TABLE IF EXISTS `tbl_avaliacao_locatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_avaliacao_locatario` (
  `id_avaliacao_locatario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código  da tabeça de avaliação do locatario',
  `nota` float DEFAULT NULL COMMENT 'nota do locatario',
  `comentario` text NOT NULL COMMENT 'comentário da avaliação do locatário',
  `data_avaliacao` date NOT NULL COMMENT 'data da avaliação do locatario',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  PRIMARY KEY (`id_avaliacao_locatario`),
  KEY `fk_tbl_avaliacao_locacao_tbl_locacao_idx` (`id_locacao`),
  CONSTRAINT `fk_tbl_avaliacao_locacao_tbl_locacao` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_locatario`
--

LOCK TABLES `tbl_avaliacao_locatario` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_locatario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao_locatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_avaliacao_servico`
--

DROP TABLE IF EXISTS `tbl_avaliacao_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_avaliacao_servico` (
  `id_avaliacao_servico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela avaliação serviço',
  `nota` float DEFAULT NULL COMMENT 'nota da avaliação',
  `data_avaliacao` date NOT NULL COMMENT 'data da avaliação',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  `comentario` text COMMENT 'comentária da locação',
  PRIMARY KEY (`id_avaliacao_servico`),
  KEY `fk_tbl_avaliacao_servico_tbl_locacao_idx` (`id_locacao`),
  CONSTRAINT `fk_tbl_avaliacao_servico_tbl_locacao` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_avaliacao_servico`
--

LOCK TABLES `tbl_avaliacao_servico` WRITE;
/*!40000 ALTER TABLE `tbl_avaliacao_servico` DISABLE KEYS */;
INSERT INTO `tbl_avaliacao_servico` VALUES (1,7,'2019-04-02',1,'Mais ou menos'),(2,8,'2019-04-03',2,'Mais ou menos'),(3,5,'2019-04-04',3,'Mais ou menos'),(4,7,'2019-04-05',4,'Mais ou menos');
/*!40000 ALTER TABLE `tbl_avaliacao_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bancos`
--

DROP TABLE IF EXISTS `tbl_bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela bancas',
  `nome_banco` varchar(60) NOT NULL COMMENT 'nome do banco',
  `agencia_numero` varchar(20) NOT NULL COMMENT 'número da agência',
  `cidade` varchar(100) DEFAULT NULL COMMENT 'cidade do banco',
  `uf` varchar(2) DEFAULT NULL COMMENT 'estado do banco',
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bancos`
--

LOCK TABLES `tbl_bancos` WRITE;
/*!40000 ALTER TABLE `tbl_bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargo_funcionario`
--

DROP TABLE IF EXISTS `tbl_cargo_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cargo_funcionario` (
  `id_cargo_funcionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de cargo do funcionário',
  `id_cargo` int(11) NOT NULL COMMENT 'código da tabela de cargo',
  `id_funcionario` int(11) NOT NULL COMMENT 'código da tabela de funcionário',
  `data` date DEFAULT NULL COMMENT 'data de contratação do funcionário',
  PRIMARY KEY (`id_cargo_funcionario`),
  KEY `fk_tbl_setor_tbl_cargo_funcionario_idx` (`id_cargo`),
  KEY `fk_tbl_funcionario_tbl_cargo_funcionario_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbl_funcionario_tbl_cargo_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_tbl_setor_tbl_cargo_funcionario` FOREIGN KEY (`id_cargo`) REFERENCES `tbl_cargos` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargo_funcionario`
--

LOCK TABLES `tbl_cargo_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_cargo_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cargo_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cargos`
--

DROP TABLE IF EXISTS `tbl_cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de cargos',
  `nome` varchar(100) NOT NULL COMMENT 'nome do cargo',
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cargos`
--

LOCK TABLES `tbl_cargos` WRITE;
/*!40000 ALTER TABLE `tbl_cargos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código do cliente',
  `nome_cliente` varchar(250) NOT NULL COMMENT 'nome do cliente',
  `cpf` varchar(11) DEFAULT NULL COMMENT 'cpf do cliente',
  `telefone` varchar(15) DEFAULT NULL COMMENT 'telefone do cliente',
  `celular` varchar(16) DEFAULT NULL COMMENT 'celular do cliente',
  `cnh_foto` varchar(255) DEFAULT NULL COMMENT 'foto da cnh do cliente',
  `foto_cliente` varchar(255) DEFAULT NULL COMMENT 'foto do cliente',
  `rua` varchar(150) DEFAULT NULL COMMENT 'rua do endereço do cliente',
  `bairro` varchar(150) DEFAULT NULL COMMENT 'bairro do cliente',
  `cep` varchar(8) DEFAULT NULL COMMENT 'cep do cliente',
  `complemento` varchar(150) DEFAULT NULL COMMENT 'complemento do endereço do cliente',
  `cidade` varchar(70) DEFAULT NULL COMMENT 'cidade do cliente',
  `uf` varchar(2) DEFAULT NULL COMMENT 'sigla do estado do cliente ',
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `dt_nascimento` date NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` VALUES (7,'Matheus Vieira','00000000000','1146194343','11963876877','','','Rua duques de caxias','Stella maris','06624450','','Jandira','SP','matheus@gmail.com','123','0000-00-00'),(8,'João Pedro','00000000001','1146194341','11963879875','','','Rua Duques de Malias','Stella Souza','0662548','','Itapevi','SP','joao@gmai.com','123','0000-00-00'),(9,'Ana Flavia','00000000002','1146198564','11963876855','','','Rua stella maris','Duques de souza','0111111','','Itapevi','SP','ana@gmail.com','312','0000-00-00'),(10,'Matheus costa','00000000000','1146194343','1196387877','','','Rua duques de caxias','Stella maris','06624450','','Jandira','SP','matheus2@gmail.com','123','0000-00-00'),(11,'João Cardoso2','00000000000','1172749639','11972859678','','','Rua Avenildo souza','Estrela de Jorge','0115166','','Itapevi','SP','joao2@teste,com','321','0000-00-00'),(12,'Ana Souza2','0000000000','114654686','113515464','','','Rua Flavio Santos','Não sei','02654','','Barueri','Sp','ana2@gmail.com','123','0000-00-00'),(13,'matheus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus22@gmail.com','123','1999-04-18'),(14,'matheus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus3@gmail.com','123','2019-04-18'),(15,'matheus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus32@gmail.com','123','2019-04-18'),(16,'matheus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus332@gmail.com','123','2019-04-18'),(17,'matheus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus323@gmail.com','123','2019-04-20'),(18,'Matheus vieira',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus.vieira250@gmail.com','123','1999-07-18'),(19,'gg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'def','qwe','1999-07-18'),(20,'Mikaela ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mikaela@gmail.co.','123','1991-06-18'),(21,'Nicolas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nicolas@gmail.xom','qwe','1999-01-18'),(22,'Joao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'joao@gnail.xo','qwe','1999-01-19'),(23,'matjeiBd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'zkzbznd','qqw','1999-09-19'),(24,'ttt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ttt@gnai','qwe','1999-09-12'),(25,'matheus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'matheus.vieira250@gmai','qwe','1999-10-10'),(26,'teste',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'teste@gmail.com','1234','1999-01-19'),(27,'Rusbé ariuokei',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rusbe@','q','1999-01-10');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comentario_avaliacao`
--

DROP TABLE IF EXISTS `tbl_comentario_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_comentario_avaliacao` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela comentário',
  `comentario` text COMMENT 'comentário',
  `data` datetime NOT NULL COMMENT 'data do comentário da avaliação',
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comentario_avaliacao`
--

LOCK TABLES `tbl_comentario_avaliacao` WRITE;
/*!40000 ALTER TABLE `tbl_comentario_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comentario_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_como_ganhar_dinheiro`
--

DROP TABLE IF EXISTS `tbl_como_ganhar_dinheiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_como_ganhar_dinheiro` (
  `id_ganhar_dinheiro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página como ganhar dinheiro',
  `titulo_como_ganhar` text NOT NULL COMMENT 'título da página como ganhar dinheiro',
  `texto_como_ganhar` text NOT NULL COMMENT 'texto da página como ganhar dinheiro',
  `img_como_ganhar` varchar(100) NOT NULL COMMENT 'imagem da página como ganhar dinheiro',
  PRIMARY KEY (`id_ganhar_dinheiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_como_ganhar_dinheiro`
--

LOCK TABLES `tbl_como_ganhar_dinheiro` WRITE;
/*!40000 ALTER TABLE `tbl_como_ganhar_dinheiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_como_ganhar_dinheiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_conta`
--

DROP TABLE IF EXISTS `tbl_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_conta` (
  `id_conta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da conta',
  `saldo_conta_bancaria` decimal(10,2) NOT NULL COMMENT 'saldo da conta bancaria',
  `numero_conta` varchar(32) NOT NULL COMMENT 'número da conta bancária',
  `id_banco` int(11) NOT NULL COMMENT 'código da tabela banco',
  PRIMARY KEY (`id_conta`),
  KEY `fk_tbl_conta_bancaria_tbl_` (`id_banco`),
  CONSTRAINT `fk_tbl_conta_bancaria_tbl_` FOREIGN KEY (`id_banco`) REFERENCES `tbl_bancos` (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_conta`
--

LOCK TABLES `tbl_conta` WRITE;
/*!40000 ALTER TABLE `tbl_conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contas_pagar` (
  `id_conta_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela contas à pagar',
  `descricao` text NOT NULL COMMENT 'descrição da conta à pagar ',
  `data_entrada` date NOT NULL COMMENT 'data de entrada da conta à pagar',
  `valor` decimal(10,2) NOT NULL COMMENT 'valor da conta à pagar',
  `titulos_baixados` varchar(45) DEFAULT NULL COMMENT 'títulos das contas à pagar',
  `data_baixa` datetime DEFAULT NULL COMMENT 'data da baixa da conta à pagar',
  `codigo_pagamento` varchar(32) DEFAULT NULL COMMENT 'número do código do pagamento',
  `confirmado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'confirmação do pagamento aceito ou não aceito',
  PRIMARY KEY (`id_conta_pagar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contas_pagar`
--

LOCK TABLES `tbl_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contas_receber`
--

DROP TABLE IF EXISTS `tbl_contas_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_contas_receber` (
  `id_conta_receber` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela contas à receber',
  `valor` decimal(10,2) NOT NULL COMMENT 'valor das contas à receber',
  `data_entrada` date NOT NULL COMMENT 'data da entrada do valor à receber',
  `descricao` text COMMENT 'descrição das contas à receber',
  `titulos_baixados` varchar(45) DEFAULT NULL COMMENT 'títulos baixados',
  `titulos_recebidos` varchar(45) DEFAULT NULL COMMENT 'títulos recebidos',
  `data_baixa` datetime DEFAULT NULL COMMENT 'data da baixa do título',
  `confirmado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'contas foram confirmadas ou não',
  PRIMARY KEY (`id_conta_receber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contas_receber`
--

LOCK TABLES `tbl_contas_receber` WRITE;
/*!40000 ALTER TABLE `tbl_contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contas_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_email_mkt`
--

DROP TABLE IF EXISTS `tbl_email_mkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_email_mkt` (
  `id_email_mkt` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página email marketing',
  `email` varchar(100) NOT NULL COMMENT 'email da página email marketing',
  PRIMARY KEY (`id_email_mkt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_email_mkt`
--

LOCK TABLES `tbl_email_mkt` WRITE;
/*!40000 ALTER TABLE `tbl_email_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_email_mkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fale_conosco`
--

DROP TABLE IF EXISTS `tbl_fale_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fale_conosco` (
  `id_fale_conosco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página fale conosco',
  `nome_fale_conosco` varchar(100) NOT NULL COMMENT 'nome da página fale conosco',
  `email_fale_conosco` varchar(100) NOT NULL COMMENT 'email da página fale conosco',
  `telefone_fale_conosco` varchar(20) NOT NULL COMMENT 'telefone da página fale conosco',
  PRIMARY KEY (`id_fale_conosco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fale_conosco`
--

LOCK TABLES `tbl_fale_conosco` WRITE;
/*!40000 ALTER TABLE `tbl_fale_conosco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fale_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_faq`
--

DROP TABLE IF EXISTS `tbl_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_faq` (
  `id_faq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página faq',
  `titulo_faq` varchar(100) NOT NULL COMMENT 'título da página faq',
  `pergunta_1_faq` text NOT NULL COMMENT 'pergunta da página faq',
  `resposta_1_faq` text NOT NULL COMMENT 'resposta da página faq',
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_faq`
--

LOCK TABLES `tbl_faq` WRITE;
/*!40000 ALTER TABLE `tbl_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_folha_pagamento`
--

DROP TABLE IF EXISTS `tbl_folha_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_folha_pagamento` (
  `id_folha_pagamento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela folha de pagamento',
  `valor_final` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'valor final da folha de pagamento',
  `data_agendamento` date NOT NULL COMMENT 'data de agendamento ',
  `descricao_pagamento` text NOT NULL COMMENT 'descrição do pagamento',
  `cod_pagamento_funcionario` varchar(32) NOT NULL COMMENT 'código do pagamento do funcionário',
  `id_funcionario` int(11) NOT NULL COMMENT 'código da tabela funcionário',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código da tabela usuário do desktop',
  PRIMARY KEY (`id_folha_pagamento`,`id_funcionario`),
  KEY `fk_tbl_pagamento_funcionario_tbl_funcionario_idx` (`id_funcionario`),
  KEY `fk_tbl_usuario_desktop_tbl_folha_pagamento_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_pagamento_funcionario_tbl_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_folha_pagamento` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_folha_pagamento`
--

LOCK TABLES `tbl_folha_pagamento` WRITE;
/*!40000 ALTER TABLE `tbl_folha_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folha_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_folha_pagamento_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_folha_pagamento_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_folha_pagamento_contas_pagar` (
  `id_pedido_contas_pagar` int(11) NOT NULL AUTO_INCREMENT,
  `id_folha_pagamento` int(11) NOT NULL COMMENT 'código da tabela folha de pagamento',
  `id_conta_pagar` int(11) NOT NULL COMMENT 'código da tabela conta à pagar',
  PRIMARY KEY (`id_pedido_contas_pagar`),
  KEY `fk_tbl_funcionario_idx` (`id_folha_pagamento`),
  KEY `fk_tbl_contas_pagar_tbl_folha_pagamento_contas_pagar_idx` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_folha_pagamento_contas_pagar` FOREIGN KEY (`id_conta_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_folha_pagamento_tbl_folha_pagamento_contas_pagar` FOREIGN KEY (`id_folha_pagamento`) REFERENCES `tbl_folha_pagamento` (`id_folha_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_folha_pagamento_contas_pagar`
--

LOCK TABLES `tbl_folha_pagamento_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_folha_pagamento_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folha_pagamento_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fornecedor`
--

DROP TABLE IF EXISTS `tbl_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fornecedor` (
  `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela do fornecedor',
  `nome_fornecedor` varchar(100) NOT NULL COMMENT 'nome do fornecedor',
  `cnpj_fornecedor` varchar(20) NOT NULL COMMENT 'cnpj do fornecedor',
  `cod_fornecedor` varchar(32) DEFAULT NULL COMMENT 'código de identificação do fornecedor',
  `razao_social` varchar(100) DEFAULT NULL COMMENT 'razão social do fornecedor',
  PRIMARY KEY (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fornecedor`
--

LOCK TABLES `tbl_fornecedor` WRITE;
/*!40000 ALTER TABLE `tbl_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_foto_veiculo`
--

DROP TABLE IF EXISTS `tbl_foto_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_foto_veiculo` (
  `id_foto_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela foto do veículo',
  `nome_foto` varchar(255) NOT NULL COMMENT 'nome da foto ',
  `id_veiculo` int(11) NOT NULL COMMENT 'código da tabela veículo',
  PRIMARY KEY (`id_foto_veiculo`),
  KEY `fk_tbl_foto_veiculo_tbl_veiculo_idx` (`id_veiculo`),
  CONSTRAINT `fk_tbl_foto_veiculo_tbl_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `tbl_veiculo` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_foto_veiculo`
--

LOCK TABLES `tbl_foto_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_foto_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_foto_veiculo` VALUES (1,'imagens_veiculos/hb20.jpg',7);
/*!40000 ALTER TABLE `tbl_foto_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de funcionário',
  `nome` varchar(100) NOT NULL COMMENT 'nome do funcionário',
  `cpf` int(11) NOT NULL COMMENT 'cpf do funcionário',
  `cod_funcionario` varchar(32) NOT NULL COMMENT 'código de verificação do funcionário',
  `email` varchar(150) NOT NULL COMMENT 'email do funcionário',
  `demissao` date DEFAULT NULL COMMENT 'data de demissão do funcionário',
  `rg` int(9) DEFAULT NULL COMMENT 'rg do funcionário',
  `dt_nacimento` date DEFAULT NULL COMMENT 'data de nascimento do funcionário',
  `cep` int(8) DEFAULT NULL COMMENT 'cep do endereço do funcionário',
  `uf` varchar(2) DEFAULT NULL COMMENT 'estado do funcionário',
  `cidade` varchar(100) DEFAULT NULL COMMENT 'cidade do funcionário',
  `logradouro` varchar(100) DEFAULT NULL COMMENT 'logradouro do endereço do funcionário',
  `n` varchar(10) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL COMMENT 'telefone do funcionário',
  `admissao` date DEFAULT NULL COMMENT 'data de admissão do funcionário',
  `id_setor` int(11) NOT NULL COMMENT 'código da tabela de setor',
  PRIMARY KEY (`id_funcionario`),
  KEY `fk_tbl_setor_tbl_funcionario_idx` (`id_setor`),
  CONSTRAINT `fk_tbl_setor_tbl_funcionario` FOREIGN KEY (`id_setor`) REFERENCES `tbl_setor` (`id_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao1`
--

DROP TABLE IF EXISTS `tbl_home_sessao1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao1` (
  `id_pagina_home` int(11) NOT NULL AUTO_INCREMENT,
  `texto_banner` text NOT NULL,
  `foto_banner` varchar(255) NOT NULL,
  `status_banner` float NOT NULL,
  `texto2_banner` text NOT NULL,
  PRIMARY KEY (`id_pagina_home`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao1`
--

LOCK TABLES `tbl_home_sessao1` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao1` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_home_sessao1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao2`
--

DROP TABLE IF EXISTS `tbl_home_sessao2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao2` (
  `id_pagina_home2` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_sessao2` varchar(255) NOT NULL,
  `texto_sessao2` text NOT NULL,
  `foto_sessao2` varchar(255) NOT NULL,
  `status_sessao2` float NOT NULL,
  PRIMARY KEY (`id_pagina_home2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao2`
--

LOCK TABLES `tbl_home_sessao2` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao2` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_home_sessao2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao3`
--

DROP TABLE IF EXISTS `tbl_home_sessao3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao3` (
  `id_home_sessao3` int(11) NOT NULL AUTO_INCREMENT,
  `foto1_sessao3` varchar(255) NOT NULL,
  `foto2_sessao3` varchar(255) NOT NULL,
  `foto3_sessao3` varchar(255) NOT NULL,
  `titulo1_sessao3` varchar(255) NOT NULL,
  `titulo2_sessao3` varchar(255) NOT NULL,
  `titulo3_sessao3` varchar(255) NOT NULL,
  `texto1_sessao3` text NOT NULL,
  `texto2_sessao3` text NOT NULL,
  `texto3_sessao3` text NOT NULL,
  `status_sessao3` float NOT NULL,
  PRIMARY KEY (`id_home_sessao3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao3`
--

LOCK TABLES `tbl_home_sessao3` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao3` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_home_sessao3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao4`
--

DROP TABLE IF EXISTS `tbl_home_sessao4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao4` (
  `id_home_sessao4` int(11) NOT NULL,
  `titulo_sessao4` varchar(45) NOT NULL,
  `foto_sessao4` varchar(255) NOT NULL,
  `texto_sessao4` varchar(45) NOT NULL,
  `status_sessao4` varchar(45) NOT NULL,
  PRIMARY KEY (`id_home_sessao4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao4`
--

LOCK TABLES `tbl_home_sessao4` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao4` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_home_sessao4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_home_sessao5`
--

DROP TABLE IF EXISTS `tbl_home_sessao5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_home_sessao5` (
  `id_home_sessao5` int(11) NOT NULL AUTO_INCREMENT,
  `status_sessao5` float NOT NULL,
  `titulo_sessao5` varchar(45) NOT NULL,
  `subtitulo1_sessao5` varchar(45) NOT NULL,
  `subtitulo2_sessao5` varchar(45) NOT NULL,
  `subtitulo3_sessao5` varchar(45) NOT NULL,
  `subtitulo4_sessao5` varchar(45) NOT NULL,
  `foto1_sessao5` varchar(255) NOT NULL,
  `foto2_sessao5` varchar(255) NOT NULL,
  `foto3_sessao5` varchar(255) NOT NULL,
  `foto4_sessao5` varchar(255) NOT NULL,
  `texto1_sessao5` text NOT NULL,
  `texto2_sessao5` text NOT NULL,
  `texto3_sessao5` text NOT NULL,
  `texto4_sessao5` text NOT NULL,
  PRIMARY KEY (`id_home_sessao5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_home_sessao5`
--

LOCK TABLES `tbl_home_sessao5` WRITE;
/*!40000 ALTER TABLE `tbl_home_sessao5` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_home_sessao5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locacao`
--

DROP TABLE IF EXISTS `tbl_locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_locacao` (
  `id_locacao` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela locação',
  `id_cliente_locador` int(11) NOT NULL COMMENT 'código da tabela cliente locador',
  `id_anuncio` int(11) NOT NULL COMMENT 'código da tabela anúncio',
  `valor_locacao` float NOT NULL COMMENT 'valor da locação',
  `data_hora_final` datetime NOT NULL COMMENT 'data e hora final da locação',
  `id_percentual` int(11) NOT NULL COMMENT 'código da tabela percentual',
  PRIMARY KEY (`id_locacao`),
  KEY `fk_tbl_usuario_tbl_locacao_idx` (`id_cliente_locador`),
  KEY `fk_tbl_anuncio_tbl_locacao_idx` (`id_anuncio`),
  CONSTRAINT `fk_tbl_anuncio_tbl_locacao` FOREIGN KEY (`id_anuncio`) REFERENCES `tbl_anuncio` (`id_anuncio`),
  CONSTRAINT `fk_tbl_usuario_tbl_locacao` FOREIGN KEY (`id_cliente_locador`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locacao`
--

LOCK TABLES `tbl_locacao` WRITE;
/*!40000 ALTER TABLE `tbl_locacao` DISABLE KEYS */;
INSERT INTO `tbl_locacao` VALUES (1,8,4,200,'2019-04-01 00:00:00',1),(2,8,4,300,'2019-04-01 00:00:00',1),(3,8,4,300,'2019-04-01 00:00:00',1),(4,8,4,300,'2019-04-01 00:00:00',1),(5,10,2,300,'2019-04-01 00:00:00',1);
/*!40000 ALTER TABLE `tbl_locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locacao_conta_pagar`
--

DROP TABLE IF EXISTS `tbl_locacao_conta_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_locacao_conta_pagar` (
  `id_locacao_conta_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela contas à pagar',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  `id_conta_pagar` int(11) NOT NULL COMMENT 'código da tabela contas à pagar',
  PRIMARY KEY (`id_locacao_conta_pagar`),
  KEY `fk_tbl_pagamento_cliente_tbl_locacao_idx` (`id_locacao`),
  KEY `fk_tbl_contas_pagar_tbl_locacao_conta_pagar_idx` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_locacao_conta_pagar` FOREIGN KEY (`id_conta_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_locacao_tbl_locacao_conta_pagar` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locacao_conta_pagar`
--

LOCK TABLES `tbl_locacao_conta_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_locacao_conta_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao_conta_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_locacao_conta_receber`
--

DROP TABLE IF EXISTS `tbl_locacao_conta_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_locacao_conta_receber` (
  `id_locacao_conta_receber` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela locação contas à receber',
  `id_locacao` int(11) NOT NULL COMMENT 'código da tabela locação',
  `id_conta_receber` int(11) NOT NULL COMMENT 'código da tabela contas à receber',
  PRIMARY KEY (`id_locacao_conta_receber`),
  KEY `fk_tbl_carteira_tbl_locacao_idx` (`id_locacao`),
  KEY `fk_tbl_contas_receber_tbl_locacao_conta_receber_idx` (`id_conta_receber`),
  CONSTRAINT `fk_tbl_contas_receber_tbl_locacao_conta_receber` FOREIGN KEY (`id_conta_receber`) REFERENCES `tbl_contas_receber` (`id_conta_receber`),
  CONSTRAINT `fk_tbl_locacao_tbl_locacao_contas_receber` FOREIGN KEY (`id_locacao`) REFERENCES `tbl_locacao` (`id_locacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_locacao_conta_receber`
--

LOCK TABLES `tbl_locacao_conta_receber` WRITE;
/*!40000 ALTER TABLE `tbl_locacao_conta_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao_conta_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marca_veiculo`
--

DROP TABLE IF EXISTS `tbl_marca_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_marca_veiculo` (
  `id_marca_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da marca do veículo',
  `nome_marca` varchar(20) NOT NULL COMMENT 'nome da marca do veículo',
  PRIMARY KEY (`id_marca_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marca_veiculo`
--

LOCK TABLES `tbl_marca_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_marca_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_marca_veiculo` VALUES (1,'Fiat'),(2,'Hyundai'),(3,'Honda');
/*!40000 ALTER TABLE `tbl_marca_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marca_veiculo_tipo_veiculo`
--

DROP TABLE IF EXISTS `tbl_marca_veiculo_tipo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_marca_veiculo_tipo_veiculo` (
  `id_tipo_marca` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela tipo da marca do veículo',
  `id_tipo_veiculo` int(11) NOT NULL COMMENT 'código da tabela tipo do veículo',
  `id_marca_veiculo` int(11) NOT NULL COMMENT 'código da tabelma marca do veículo',
  PRIMARY KEY (`id_tipo_marca`),
  KEY `fk_tbl_marca_veiculo_tipo_veiculo_tbl_marca_veiculo_idx` (`id_marca_veiculo`),
  KEY `fk_tbl_marca_veiculo_tipo_veiculo_tbl_tipo_veiculo_idx` (`id_tipo_veiculo`),
  CONSTRAINT `fk_tbl_marca_veiculo_tipo_veiculo_tbl_marca_veiculo` FOREIGN KEY (`id_marca_veiculo`) REFERENCES `tbl_marca_veiculo` (`id_marca_veiculo`),
  CONSTRAINT `fk_tbl_marca_veiculo_tipo_veiculo_tbl_tipo_veiculo` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marca_veiculo_tipo_veiculo`
--

LOCK TABLES `tbl_marca_veiculo_tipo_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_marca_veiculo_tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_marca_veiculo_tipo_veiculo` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `tbl_marca_veiculo_tipo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_melhores_avaliacoes`
--

DROP TABLE IF EXISTS `tbl_melhores_avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_melhores_avaliacoes` (
  `id_melhores_avaliacoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página melhores avaliações',
  `titulo_melhores_avaliacoes` text NOT NULL COMMENT 'título da página melhores avaliações',
  `texto_melhores_avaliacoes` text NOT NULL COMMENT 'texto da página melhores avaliações',
  PRIMARY KEY (`id_melhores_avaliacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_melhores_avaliacoes`
--

LOCK TABLES `tbl_melhores_avaliacoes` WRITE;
/*!40000 ALTER TABLE `tbl_melhores_avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_melhores_avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela menu',
  `nome_menu` varchar(25) NOT NULL COMMENT 'nome do menu',
  `href` varchar(150) NOT NULL COMMENT 'url/ link do menu',
  `icone` varchar(255) NOT NULL COMMENT 'ícone do menu',
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` VALUES (1,'Cadastrar niveis','view/niveis/cadatro_niveis.php','view/imagem/icones/cliente.png');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_modelo_veiculo`
--

DROP TABLE IF EXISTS `tbl_modelo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_modelo_veiculo` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela do modelo do veículo',
  `nome_modelo` varchar(50) NOT NULL COMMENT 'nome do modelo',
  `id_marca_tipo` int(11) NOT NULL COMMENT 'código da tabela marca tipo do veículo',
  PRIMARY KEY (`id_modelo`),
  KEY `fk_tbl_modelo_veiculo_tbl_marca_veiculo_tipo_veiculo_idx` (`id_marca_tipo`),
  CONSTRAINT `fk_tbl_modelo_veiculo_tbl_marca_veiculo_tipo_veiculo` FOREIGN KEY (`id_marca_tipo`) REFERENCES `tbl_marca_veiculo_tipo_veiculo` (`id_tipo_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_modelo_veiculo`
--

LOCK TABLES `tbl_modelo_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_modelo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_modelo_veiculo` VALUES (1,'Palio',1),(2,'HB20',2),(3,'Civic',3),(4,'Bravo',1),(5,'I30',2),(6,'City',3);
/*!40000 ALTER TABLE `tbl_modelo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_niveis`
--

DROP TABLE IF EXISTS `tbl_niveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_niveis` (
  `id_niveis` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela níveis',
  `nome_nivel` varchar(25) NOT NULL COMMENT 'nome do nível',
  `descricao` varchar(50) NOT NULL COMMENT 'descrição do nível',
  PRIMARY KEY (`id_niveis`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_niveis`
--

LOCK TABLES `tbl_niveis` WRITE;
/*!40000 ALTER TABLE `tbl_niveis` DISABLE KEYS */;
INSERT INTO `tbl_niveis` VALUES (5,'asd','asda'),(6,'asd','asda'),(7,'asd','asda'),(8,'asd','asda'),(9,'asd','asda'),(10,'asd','asda'),(11,'asd','asda'),(12,'asd','asda'),(19,'Guilherme','VIADO');
/*!40000 ALTER TABLE `tbl_niveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_niveis_menu`
--

DROP TABLE IF EXISTS `tbl_niveis_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_niveis_menu` (
  `id_niveis_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela níveis do menu',
  `id_menu` int(11) NOT NULL COMMENT 'código da tabela menu',
  `id_niveis` int(11) NOT NULL COMMENT 'código da tabela níveis',
  PRIMARY KEY (`id_niveis_menu`),
  KEY `fk_tbl_niveis_menu_tbl_niveis_idx` (`id_niveis`),
  KEY `fk_tbl_niveis_menu_tbl_menu_idx` (`id_menu`),
  CONSTRAINT `fk_tbl_niveis_menu_tbl_menu` FOREIGN KEY (`id_menu`) REFERENCES `tbl_menu` (`id_menu`),
  CONSTRAINT `fk_tbl_niveis_menu_tbl_niveis` FOREIGN KEY (`id_niveis`) REFERENCES `tbl_niveis` (`id_niveis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_niveis_menu`
--

LOCK TABLES `tbl_niveis_menu` WRITE;
/*!40000 ALTER TABLE `tbl_niveis_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_niveis_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_operacoes`
--

DROP TABLE IF EXISTS `tbl_operacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_operacoes` (
  `id_operacoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela operações',
  `id_conta` int(11) NOT NULL COMMENT 'código da tabela conta',
  `data_entrada` date NOT NULL COMMENT 'data da entrada da operação',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código do usuário do desktop',
  PRIMARY KEY (`id_operacoes`),
  KEY `fk_tbl_conta_tbl_operacoes_idx` (`id_conta`),
  KEY `fk_tbl_usuario_desktop_tbl_operacoes_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_conta_tbl_operacoes` FOREIGN KEY (`id_conta`) REFERENCES `tbl_conta` (`id_conta`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_operacoes` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_operacoes`
--

LOCK TABLES `tbl_operacoes` WRITE;
/*!40000 ALTER TABLE `tbl_operacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_operacoes_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_operacoes_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_operacoes_contas_pagar` (
  `id_operacoes_contas_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela operações contas à receber',
  `id_contas_pagar` int(11) NOT NULL COMMENT 'código da tabela contas à pagar',
  `id_operacoes` int(11) NOT NULL COMMENT 'código da tabela operações',
  PRIMARY KEY (`id_operacoes_contas_pagar`),
  KEY `fk_tbl_contas_pagar_tbl_operacoes_contas_pagar_idx` (`id_contas_pagar`),
  KEY `fk_tbl_operacoes_tbl_operacoes_contas_pagar_idx` (`id_operacoes`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_operacoes_contas_pagar` FOREIGN KEY (`id_contas_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_operacoes_tbl_operacoes_contas_pagar` FOREIGN KEY (`id_operacoes`) REFERENCES `tbl_operacoes` (`id_operacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_operacoes_contas_pagar`
--

LOCK TABLES `tbl_operacoes_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_operacoes_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_operacoes_contas_receber`
--

DROP TABLE IF EXISTS `tbl_operacoes_contas_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_operacoes_contas_receber` (
  `id_operacoes_contas_receber` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela operações contas à receber',
  `id_contas_receber` int(11) NOT NULL COMMENT 'código da tabela contas à receber',
  `id_operacoes` int(11) NOT NULL COMMENT 'código da tabela operações',
  PRIMARY KEY (`id_operacoes_contas_receber`),
  KEY `fk_tbl__contas_receber_tbl_operacoes_contas_receber_idx` (`id_contas_receber`),
  KEY `fk_tbl_operacoes_tbl_operacoes_contas_receber_idx` (`id_operacoes`),
  CONSTRAINT `fk_tbl__contas_receber_tbl_operacoes_contas_receber` FOREIGN KEY (`id_contas_receber`) REFERENCES `tbl_contas_receber` (`id_conta_receber`),
  CONSTRAINT `fk_tbl_operacoes_tbl_operacoes_contas_receber` FOREIGN KEY (`id_operacoes`) REFERENCES `tbl_operacoes` (`id_operacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_operacoes_contas_receber`
--

LOCK TABLES `tbl_operacoes_contas_receber` WRITE;
/*!40000 ALTER TABLE `tbl_operacoes_contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes_contas_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pagina_sobre`
--

DROP TABLE IF EXISTS `tbl_pagina_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pagina_sobre` (
  `id_sobre` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página sobre',
  `titulo_sobre` varchar(45) NOT NULL COMMENT 'título da página sobre',
  `texto_sobre` varchar(45) NOT NULL COMMENT 'texto da página sobre',
  `foto_sobre` varchar(200) NOT NULL COMMENT 'foto da página sobre',
  `missao_sobre` text NOT NULL COMMENT 'missão página sobre',
  `visao_sobre` text NOT NULL COMMENT 'visão página sobre',
  `valores_sobre` text NOT NULL COMMENT 'valores da página sobre',
  PRIMARY KEY (`id_sobre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pagina_sobre`
--

LOCK TABLES `tbl_pagina_sobre` WRITE;
/*!40000 ALTER TABLE `tbl_pagina_sobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pagina_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela pedido',
  `valor_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'valor total do pedido',
  `forma_pagamento` varchar(45) NOT NULL COMMENT 'forma de pagamento do pedido',
  `previsao_entrega` date NOT NULL COMMENT 'previsão de entrega do pedido',
  `cod_pedido` varchar(32) NOT NULL COMMENT 'código de barras do pedido',
  `natureza_da_compra` varchar(100) NOT NULL COMMENT 'origem da compra',
  `desconto` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'desconto na compra',
  `data_compra` date NOT NULL COMMENT 'data da compra',
  `frete` decimal(10,2) NOT NULL COMMENT 'frete do pedido',
  `id_fornecedor` int(11) NOT NULL COMMENT 'código da tabela fornecedor',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código da tabela usuário desktop',
  PRIMARY KEY (`id_pedido`),
  KEY `fk_tbl_pedidos_tbl_fornecedor_idx` (`id_fornecedor`),
  KEY `fk_tbl_usuario_desktop_tbl_pedido_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_fornecedor_tbl_pedidos` FOREIGN KEY (`id_fornecedor`) REFERENCES `tbl_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_pedido` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_contas_pagar`
--

DROP TABLE IF EXISTS `tbl_pedido_contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pedido_contas_pagar` (
  `id_pedido_contas_pagar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela pedidos de conta à pagar',
  `id_pedido` int(11) NOT NULL COMMENT 'código da tabela pedidos',
  `id_conta_pagar` int(11) NOT NULL COMMENT 'código da tabela contas à pagar',
  PRIMARY KEY (`id_pedido_contas_pagar`),
  KEY `fk_tbl_pedido_tbl_pedido_contas_pagar_idx` (`id_pedido`),
  KEY `fk_tbl_contas_pagar_tbl_pedido_contas_pagar_idx` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_contas_pagar_tbl_pedido_contas_pagar` FOREIGN KEY (`id_conta_pagar`) REFERENCES `tbl_contas_pagar` (`id_conta_pagar`),
  CONSTRAINT `fk_tbl_pedido_tbl_pedido_contas_pagar` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_contas_pagar`
--

LOCK TABLES `tbl_pedido_contas_pagar` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido_produto`
--

DROP TABLE IF EXISTS `tbl_pedido_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pedido_produto` (
  `id_pedido_produto` int(11) NOT NULL COMMENT 'código da tabela produto do pedido',
  `quantidade` int(11) NOT NULL COMMENT 'quantidade de produtos',
  `valor` decimal(10,2) NOT NULL COMMENT 'valor unitário',
  `id_produto` int(11) NOT NULL COMMENT 'código da tabela do produto',
  `id_pedido` int(11) NOT NULL COMMENT 'código da tabela do pedido',
  PRIMARY KEY (`id_pedido_produto`),
  KEY `fk_produto_pedido_idx` (`id_pedido`),
  KEY `fk_tbl_produto_tbl_pedido_produto_idx` (`id_produto`),
  CONSTRAINT `fk_tbl_pedido_tbl_pedido_produto` FOREIGN KEY (`id_pedido`) REFERENCES `tbl_pedido` (`id_pedido`),
  CONSTRAINT `fk_tbl_produto_tbl_pedido_produto` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido_produto`
--

LOCK TABLES `tbl_pedido_produto` WRITE;
/*!40000 ALTER TABLE `tbl_pedido_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_percentual`
--

DROP TABLE IF EXISTS `tbl_percentual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_percentual` (
  `id_percentual` int(11) NOT NULL AUTO_INCREMENT,
  `percentual` float NOT NULL,
  `id_tipo_veiculo` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id_percentual`),
  KEY `id_tipo_veiculo` (`id_tipo_veiculo`),
  CONSTRAINT `tbl_percentual_ibfk_1` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_percentual`
--

LOCK TABLES `tbl_percentual` WRITE;
/*!40000 ALTER TABLE `tbl_percentual` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_percentual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_percentual_desconto`
--

DROP TABLE IF EXISTS `tbl_percentual_desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_percentual_desconto` (
  `id_percentual_desconto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código do percentual de desconto',
  `percentual` float NOT NULL COMMENT 'porcentagem do percentual de desconto',
  `id_cliente` int(11) NOT NULL COMMENT 'código do cliente',
  `data_inicio` datetime NOT NULL COMMENT 'data de início do percentual de desconto',
  `data_final` datetime NOT NULL COMMENT 'data final do desconto',
  `codigo` varchar(15) NOT NULL COMMENT 'numeração do código de percentual de desconto',
  PRIMARY KEY (`id_percentual_desconto`),
  KEY `fk_tbl_percentual_desconto_tbl_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_tbl_percentual_desconto_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_percentual_desconto`
--

LOCK TABLES `tbl_percentual_desconto` WRITE;
/*!40000 ALTER TABLE `tbl_percentual_desconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_percentual_desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_permissoes`
--

DROP TABLE IF EXISTS `tbl_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_permissoes` (
  `id_permissoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de permissoes',
  `nome` varchar(45) NOT NULL COMMENT 'nome das permissoes',
  `titulo` varchar(45) NOT NULL COMMENT 'título das permissoes',
  `descricao` text COMMENT 'descrição das permissoes',
  `icone` varchar(100) NOT NULL COMMENT 'ícone das permissoes',
  `href` varchar(100) NOT NULL COMMENT 'link das permissoes',
  PRIMARY KEY (`id_permissoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_permissoes`
--

LOCK TABLES `tbl_permissoes` WRITE;
/*!40000 ALTER TABLE `tbl_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_principais_anuncios`
--

DROP TABLE IF EXISTS `tbl_principais_anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_principais_anuncios` (
  `id_principais_anuncios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código principais anúncios',
  `id_anuncios_venda` int(11) NOT NULL COMMENT 'código da tabela anúncios a venda',
  `status` tinyint(4) NOT NULL COMMENT 'status dos principais anúncios',
  PRIMARY KEY (`id_principais_anuncios`),
  KEY `fk_tbl_principais_anuncios_tbl_anuncios_venda_idx` (`id_anuncios_venda`),
  CONSTRAINT `fk_tbl_principais_anuncios_tbl_anuncios_venda` FOREIGN KEY (`id_anuncios_venda`) REFERENCES `tbl_anuncio_venda` (`id_anuncio_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_principais_anuncios`
--

LOCK TABLES `tbl_principais_anuncios` WRITE;
/*!40000 ALTER TABLE `tbl_principais_anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_principais_anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela prodto',
  `descricao` text COMMENT 'descrição do produto',
  `valor_unitario` decimal(10,2) NOT NULL COMMENT 'valor unitário do produto',
  `cod_produto` varchar(100) NOT NULL COMMENT 'código do produto',
  `nome` varchar(100) NOT NULL COMMENT 'nome do produto',
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_salario`
--

DROP TABLE IF EXISTS `tbl_salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_salario` (
  `id_salario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de salário',
  `salario` decimal(10,2) NOT NULL COMMENT 'salário do funcionário',
  `data_cadastro` datetime NOT NULL COMMENT 'data de cadastro do funcionário',
  `id_funcionario` int(11) NOT NULL COMMENT 'código da tabela de fucionário ',
  PRIMARY KEY (`id_salario`),
  KEY `fk_tbl_funcionario_tbl_salario_idx` (`id_funcionario`),
  CONSTRAINT `fk_tbl_funcionario_tbl_salario` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_salario`
--

LOCK TABLES `tbl_salario` WRITE;
/*!40000 ALTER TABLE `tbl_salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seja_parceiro`
--

DROP TABLE IF EXISTS `tbl_seja_parceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_seja_parceiro` (
  `id_seja_parceiro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página seja parceiro',
  `titulo_seja_parceiro` varchar(45) NOT NULL COMMENT 'título da página seja parceiro',
  `texto_seja_parceiro` text NOT NULL COMMENT 'texto da página seja parceiro',
  `foto_seja_parceiro` varchar(45) NOT NULL COMMENT 'foto da página seja parceiro',
  PRIMARY KEY (`id_seja_parceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seja_parceiro`
--

LOCK TABLES `tbl_seja_parceiro` WRITE;
/*!40000 ALTER TABLE `tbl_seja_parceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seja_parceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setor`
--

DROP TABLE IF EXISTS `tbl_setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_setor` (
  `id_setor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de setor',
  `nome` varchar(100) NOT NULL COMMENT 'nome do setor',
  PRIMARY KEY (`id_setor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setor`
--

LOCK TABLES `tbl_setor` WRITE;
/*!40000 ALTER TABLE `tbl_setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tabela_precos`
--

DROP TABLE IF EXISTS `tbl_tabela_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tabela_precos` (
  `id_tabela_precos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de preços',
  `titulo_tabela_precos` varchar(45) NOT NULL COMMENT 'título da tabela de preços',
  `texto_tabela_precos` varchar(45) NOT NULL COMMENT 'texto da tabela de preços',
  `descricao_tabela_precos` varchar(45) DEFAULT NULL COMMENT 'descrição da tabela de preços',
  `foto_tabela_precos` varchar(45) DEFAULT NULL COMMENT 'foto da tabela de preços',
  PRIMARY KEY (`id_tabela_precos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tabela_precos`
--

LOCK TABLES `tbl_tabela_precos` WRITE;
/*!40000 ALTER TABLE `tbl_tabela_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tabela_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_termos_uso`
--

DROP TABLE IF EXISTS `tbl_termos_uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_termos_uso` (
  `id_termos_uso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da página termos de uso',
  `pdf_termos` varchar(45) NOT NULL COMMENT 'pdf da página termos de uso',
  `titulo_termos` varchar(45) NOT NULL COMMENT 'título da página termos de uso',
  `texto_1_termos` varchar(45) NOT NULL COMMENT 'texto da página termos de uso',
  `icone_1_termos` varchar(45) DEFAULT NULL COMMENT 'ícone da página termos de uso',
  PRIMARY KEY (`id_termos_uso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_termos_uso`
--

LOCK TABLES `tbl_termos_uso` WRITE;
/*!40000 ALTER TABLE `tbl_termos_uso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_termos_uso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_veiculo`
--

DROP TABLE IF EXISTS `tbl_tipo_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_tipo_veiculo` (
  `id_tipo_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela tipo de veículo',
  `nome_tipo_veiculo` varchar(20) NOT NULL COMMENT 'nome do tipo de veículo',
  PRIMARY KEY (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_veiculo`
--

LOCK TABLES `tbl_tipo_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_tipo_veiculo` VALUES (1,'Carro'),(2,'Moto');
/*!40000 ALTER TABLE `tbl_tipo_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_cms`
--

DROP TABLE IF EXISTS `tbl_usuario_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario_cms` (
  `id_usuario_cms` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela usuário do  cms',
  `nome_usuario_cms` varchar(20) NOT NULL COMMENT 'nome de usuário do cms',
  `email_usuario_cms` varchar(150) NOT NULL COMMENT 'email do usuário do cms',
  `senha` varchar(20) NOT NULL COMMENT 'senha do usuário do cms',
  `id_niveis` int(11) NOT NULL COMMENT 'código da tabela nível',
  PRIMARY KEY (`id_usuario_cms`),
  KEY `fk_tbl_usuario_cms_tbl_niveis_idx` (`id_niveis`),
  CONSTRAINT `fk_tbl_usuario_cms_tbl_niveis` FOREIGN KEY (`id_niveis`) REFERENCES `tbl_niveis` (`id_niveis`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_cms`
--

LOCK TABLES `tbl_usuario_cms` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_cms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_desktop`
--

DROP TABLE IF EXISTS `tbl_usuario_desktop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario_desktop` (
  `id_usuario_desktop` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela usuário desktop',
  `nome` varchar(100) NOT NULL COMMENT 'nome do usuário do desktop',
  `email` varchar(128) NOT NULL COMMENT 'email do usuário do desktop',
  `senha` varchar(128) DEFAULT NULL COMMENT 'senha do usuário do desktop',
  `telefone` varchar(12) DEFAULT NULL COMMENT 'telefone do usuário',
  `cpf` int(11) DEFAULT '0' COMMENT 'cpf do usuário',
  `logado` datetime DEFAULT NULL COMMENT 'data quando usuário logou',
  `foto` varchar(100) DEFAULT NULL COMMENT 'foto do usuário',
  `excluido` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'dado se o usuário foi excluído ou não',
  PRIMARY KEY (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_desktop`
--

LOCK TABLES `tbl_usuario_desktop` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_desktop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_desktop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario_desktop_permissoes`
--

DROP TABLE IF EXISTS `tbl_usuario_desktop_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario_desktop_permissoes` (
  `id_usuario_desktop_permicoes` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de permições do usuário  do desktop',
  `id_usuario_desktop` int(11) NOT NULL COMMENT 'código da tabela do usuário  do desktop',
  `id_permicoes` int(11) NOT NULL COMMENT 'código da tabela de permições',
  PRIMARY KEY (`id_usuario_desktop_permicoes`,`id_permicoes`),
  KEY `fk_tbl_permicoes_idx` (`id_permicoes`),
  KEY `fk_tbl_usuario_desktop_tbl_usuario_desktop_permicoes_idx` (`id_usuario_desktop`),
  CONSTRAINT `fk_tbl_permicoes_tbl_usuario_desktop_permicoes` FOREIGN KEY (`id_permicoes`) REFERENCES `tbl_permissoes` (`id_permissoes`),
  CONSTRAINT `fk_tbl_usuario_desktop_tbl_usuario_desktop_permicoes` FOREIGN KEY (`id_usuario_desktop`) REFERENCES `tbl_usuario_desktop` (`id_usuario_desktop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario_desktop_permissoes`
--

LOCK TABLES `tbl_usuario_desktop_permissoes` WRITE;
/*!40000 ALTER TABLE `tbl_usuario_desktop_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_desktop_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_veiculo`
--

DROP TABLE IF EXISTS `tbl_veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_veiculo` (
  `id_veiculo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'código da tabela de veículo',
  `ano` varchar(45) NOT NULL,
  `placa` varchar(45) NOT NULL,
  `quilometragem` varchar(45) NOT NULL,
  `renavam` varchar(45) NOT NULL COMMENT 'renavam do veículo',
  `id_tipo_veiculo` int(11) NOT NULL COMMENT 'código da tabela tipo de veículo',
  `id_marca_veiculo` int(11) NOT NULL COMMENT 'código da tabela marca do veículo',
  `id_modelo_veiculo` int(11) NOT NULL COMMENT 'código da tabela modelo do veículo',
  `id_cliente` int(11) NOT NULL COMMENT 'código da tabela cliente',
  PRIMARY KEY (`id_veiculo`),
  KEY `fk_tbl_veiculo_tbl_tipo_veiculo_idx` (`id_tipo_veiculo`),
  KEY `fk_tbl_tbl_veiculo_tbl_marca_veiculo_idx` (`id_marca_veiculo`),
  KEY `fk_tbl_veiculo_tbl_modelo_veiculo_idx` (`id_modelo_veiculo`),
  KEY `fk_tbl_veiculo_tbl_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_tbl_tbl_veiculo_tbl_marca_veiculo` FOREIGN KEY (`id_marca_veiculo`) REFERENCES `tbl_marca_veiculo` (`id_marca_veiculo`),
  CONSTRAINT `fk_tbl_veiculo_tbl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  CONSTRAINT `fk_tbl_veiculo_tbl_modelo_veiculo` FOREIGN KEY (`id_modelo_veiculo`) REFERENCES `tbl_modelo_veiculo` (`id_modelo`),
  CONSTRAINT `fk_tbl_veiculo_tbl_tipo_veiculo` FOREIGN KEY (`id_tipo_veiculo`) REFERENCES `tbl_tipo_veiculo` (`id_tipo_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_veiculo`
--

LOCK TABLES `tbl_veiculo` WRITE;
/*!40000 ALTER TABLE `tbl_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_veiculo` VALUES (6,'2015','xxx0011','12000','13',1,1,1,12),(7,'2010','xxx0011','13000','14',1,2,2,7),(8,'2016','xxx0011','14000','15',1,3,6,9),(9,'2017','xxx0011','15000','16',1,2,5,11);
/*!40000 ALTER TABLE `tbl_veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_anuncios`
--

DROP TABLE IF EXISTS `view_anuncios`;
/*!50001 DROP VIEW IF EXISTS `view_anuncios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_anuncios` AS SELECT 
 1 AS `locador`,
 1 AS `celular`,
 1 AS `telefone`,
 1 AS `rua`,
 1 AS `bairro`,
 1 AS `cep`,
 1 AS `complemento`,
 1 AS `uf`,
 1 AS `cidade`,
 1 AS `id_cliente`,
 1 AS `id_anuncio`,
 1 AS `data_inicial`,
 1 AS `data_final`,
 1 AS `descricao`,
 1 AS `horario_inicio`,
 1 AS `horario_termino`,
 1 AS `ano`,
 1 AS `placa`,
 1 AS `quilometragem`,
 1 AS `renavam`,
 1 AS `nome_tipo_veiculo`,
 1 AS `nome_marca`,
 1 AS `nome_modelo`,
 1 AS `preco`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_anuncios`
--

/*!50001 DROP VIEW IF EXISTS `view_anuncios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_anuncios` AS select `cliente`.`nome_cliente` AS `locador`,`cliente`.`celular` AS `celular`,`cliente`.`telefone` AS `telefone`,`cliente`.`rua` AS `rua`,`cliente`.`bairro` AS `bairro`,`cliente`.`cep` AS `cep`,`cliente`.`complemento` AS `complemento`,`cliente`.`uf` AS `uf`,`cliente`.`cidade` AS `cidade`,`cliente`.`id_cliente` AS `id_cliente`,`anuncios`.`id_anuncio` AS `id_anuncio`,`anuncios`.`data_inicial` AS `data_inicial`,`anuncios`.`data_final` AS `data_final`,`anuncios`.`descricao` AS `descricao`,`anuncios`.`horario_inicio` AS `horario_inicio`,`anuncios`.`horario_termino` AS `horario_termino`,`veiculos`.`ano` AS `ano`,`veiculos`.`placa` AS `placa`,`veiculos`.`quilometragem` AS `quilometragem`,`veiculos`.`renavam` AS `renavam`,`tipo_veiculo`.`nome_tipo_veiculo` AS `nome_tipo_veiculo`,`marca_veiculo`.`nome_marca` AS `nome_marca`,`modelo_veiculo`.`nome_modelo` AS `nome_modelo`,`anuncios`.`preco` AS `preco` from ((((((`tbl_cliente` `cliente` join `tbl_anuncio` `anuncios` on((`anuncios`.`id_cliente_locador` = `cliente`.`id_cliente`))) join `tbl_veiculo` `veiculos` on((`veiculos`.`id_veiculo` = `anuncios`.`id_veiculo`))) join `tbl_tipo_veiculo` `tipo_veiculo` on((`veiculos`.`id_tipo_veiculo` = `tipo_veiculo`.`id_tipo_veiculo`))) join `tbl_marca_veiculo` `marca_veiculo` on((`veiculos`.`id_marca_veiculo` = `marca_veiculo`.`id_marca_veiculo`))) join `tbl_marca_veiculo_tipo_veiculo` `marca_tipo` on(((`marca_tipo`.`id_tipo_veiculo` = `tipo_veiculo`.`id_tipo_veiculo`) and (`marca_tipo`.`id_marca_veiculo` = `marca_veiculo`.`id_marca_veiculo`)))) join `tbl_modelo_veiculo` `modelo_veiculo` on((`veiculos`.`id_modelo_veiculo` = `modelo_veiculo`.`id_modelo`))) where (`anuncios`.`status_aprovado` = 1) */;
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

-- Dump completed on 2019-04-23  7:14:50
