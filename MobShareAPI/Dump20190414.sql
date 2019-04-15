-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: db_woody_inf3m
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
-- Table structure for table `tbl_autor`
--

DROP TABLE IF EXISTS `tbl_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_autor` (
  `id_autor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_autor` varchar(100) NOT NULL,
  `pais_origem` varchar(60) NOT NULL,
  `descricao_autor` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `genero` varchar(100) NOT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_autor`
--

LOCK TABLES `tbl_autor` WRITE;
/*!40000 ALTER TABLE `tbl_autor` DISABLE KEYS */;
INSERT INTO `tbl_autor` VALUES (19,'Matheus','Brasil B','sadasdasdddddddd','arquivos/f3c7cc736d1aceda57feada8a936bcb1.jpg',0,'Terror'),(20,'Vieira','EUA','AMPDOpa','arquivos/a8a77737658d36b00e02fd4bb0aca07b.jpg',0,'Terror'),(28,'daiane vieira','Brasil','d','',0,'d'),(31,'Mark Manson','Brasil','ark Manson é um autor americano de autoajuda, blogueiro e empreendedor. Ele é o autor do site MarkManson.net e dois livros, A Arte Sutil de Não Dar um F * ck: Uma Abordagem Contra-Intuitiva para Viver uma Boa Vida, e Modelos: Atrair Mulheres através da Honestidade','',0,'Auto ajuda'),(32,'Vieira2','Brasil','Autor','',0,'Romance');
/*!40000 ALTER TABLE `tbl_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_autor_livro`
--

DROP TABLE IF EXISTS `tbl_autor_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_autor_livro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_autor` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_autor_tbl_livro_idx` (`id_autor`),
  KEY `fk_tbl_livro_tbl_autor_idx` (`id_livro`),
  CONSTRAINT `fk_tbl_autor_tbl_livro` FOREIGN KEY (`id_autor`) REFERENCES `tbl_autor` (`id_autor`),
  CONSTRAINT `fk_tbl_livro_tbl_autor` FOREIGN KEY (`id_livro`) REFERENCES `tbl_livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_autor_livro`
--

LOCK TABLES `tbl_autor_livro` WRITE;
/*!40000 ALTER TABLE `tbl_autor_livro` DISABLE KEYS */;
INSERT INTO `tbl_autor_livro` VALUES (32,28,24),(33,31,25),(34,28,26),(35,28,27),(36,28,28),(37,28,29),(38,28,30),(39,20,31),(40,28,32),(41,28,33),(42,28,34),(43,28,35),(44,28,36),(45,28,37);
/*!40000 ALTER TABLE `tbl_autor_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_casas`
--

DROP TABLE IF EXISTS `tbl_casas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_casas` (
  `id_casas` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `membros` int(11) NOT NULL,
  `sede` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `regiao` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lema` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto_casa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_casas`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_casas`
--

LOCK TABLES `tbl_casas` WRITE;
/*!40000 ALTER TABLE `tbl_casas` DISABLE KEYS */;
INSERT INTO `tbl_casas` VALUES (1,'STARK',112,'Winterfell','Norte','O Inverno está chegando','A Casa Stark de Winterfell é uma das Grandes Casas de Westeros e a principal casa nobre do Norte. Em tempos antigos, eles reinaram como Reis do Inverno, mas desde a Guerra da Conquista tem servido como Protetores do Norte para o Trono de Ferro, enquanto conservam seu título de lordes. Seu assento de poder é Winterfell, uma fortaleza antiga, renomada por sua força. Seu símbolo é um lobo gigante correndo através de um campo branco. Seu lema é \"O inverno está chegando\", sendo uma das poucas casas nobres de Westeros que tem como seu lema não palavras de \'encorajamento\' mas sim um \'aviso\'. Além dos Karstarks de Karhold, os Starks de Winterfell tem vários outros parentes distantes pelo Norte, provavelmente em Porto Branco e Vila Acidentada, por exemplo.','casas/1.png'),(2,'ARRYN',32,'Ninho da Águia','Vale','Tão Alto Como a Honra','Casa Arryn do Ninho da Águia é uma das Grandes Casas de Westeros, e a principal casa nobre do Vale. Sua sede principal é o Ninho da Águia, mas possuem outras moradas, incluindo o castelo de inverno nos Portões da Lua. Ambas as fortificações se situam na Lança do Gigante, a montanha mais alta do Vale, e o Ninho da Águia é considerado inexpugnável. Seu símbolo é um falcão e um quarto crescente, brancos em um campo azul-celeste, e suas palavras são \"Tão Alto Como a Honra\". Sua linhagem data dos velhos Ândalos que invadiram Westeros. Normalmente se casando com outros nobres Ândalos, a Casa Arryn tem atualmente a mais pura ascendência da nobreza Ândala.','casas/2.png'),(3,'TARGARYEN',215,'Fortaleza Vermelha','Porto Real','Fogo e Sangue','A Casa Targaryen é uma família nobre, descendentes da velha Valíria, que, por quase trezentos anos, governou os Sete Reinos de Westeros. O símbolo Targaryen é um dragão vermelho de três cabeças cuspindo fogo num fundo preto. Eles eram uma das famílias conhecidas como Senhores de dragões que regiam o Império Valiriano.[6] Alguns anos antes da Perdição de Valíria, os Targaryens abandonaram seu lar em Essos e se assentaram em Pedra do Dragão, uma antiga fortaleza valiriana na costa de Westeros. Lá eles residiram por mais de um século, até que Aegon, o Conquistador e suas irmãs-esposas, Visenya e Rhaenys, iniciaram a Guerra da Conquista.','casas/3.png'),(4,'LANNISTER',91,'Rochedo Casterly','Terras Ocidentais','Ouça-me Rugir','A Casa Lannister de Rochedo Casterly é uma das grandes casas nobres dos Sete Reinos e a maior, mais poderosa e importante das Terras Ocidentais. Seu assento de poder é a fortaleza de Rochedo Casterly, embora um ramo menor da casa exista na cidade de Lannisporto. Seu símbolo é um leão dourado em um campo carmesim. Contudo, um lema não-oficial, mas igualmente bem conhecido, é \"Um Lannister sempre paga suas dívidas.\". Bonitos, altos, de cabelo dourado e olhos verde-esmeralda, os Lannisters tem sangue de aventureiros de Ândalos que criaram um poderoso império no oeste, entre as colinas e os vales. Através da linhagem feminina, eles descendem de Lann, o Esperto, uma figura lendária da Era dos Heróis, que enganou os membros da Casa Casterly, roubando seu principal castelo, ainda durante a era dos Primeiros Homens.','casas/4.png'),(5,'FREY',141,'As Gemêas','Terras Fluviais','Não mencionado nos livros','A Casa Frey da Travessia é uma casa nobre das Terras Fluviais. Sua principal sede fica nas Gêmeas, um par de castelos em cada margem do Ramo Verde do Tridente, que serve como uma ponte vital. O Lorde da casa é chamado de Senhor da Travessia. A localização estratégica das Gêmeas permitiu à família enriquecer bastante. Sob o controle do atual Lorde, Walder Frey, cresceram muito em tamanho e poder. A Casa pode reunir mil cavaleiros e três mil soldados.','casas/5.png'),(6,'GREYJOY',36,'Pyke','Ilhas de Ferro','Nós Não Semeamos','A Casa Greyjoy descende do Rei Cinzento, uma figura lendária da Era dos Heróis. Casa Greyjoy de Pyke é uma das Grandes Casas de Westeros. Governa sobre as Ilhas de Ferro, uma coletânea pedregosa e sombria de ilhas na costa oeste de Westeros, do castelo e ilha de Pyke','casas/6.png'),(7,'BOLTON',20,'Forte do Pavor','Norte','Nossas Lâminas são Afiadas','Os Boltons são uma antiga e poderosa casa nobre do Norte que governou suas terras como Reis Vermelhos a partir do seu castelo do Forte do Pavor. Seus domínios incluíam as regiões que se estendiam do Rio Último até a Faca Branca e até as Colinas Cabeça de Carneiro. Foi sugerido no passado que o lendário Rei da Noite era um Bolton.','casas/7.png'),(8,'TARLY',10,'Monte Chifre','Campina','Primeiros em Batalha','A Casa Tarly de Monte Chifre é uma casa nobre da Campina juramentada à Casa Tyrell. Suas terras são localizadas nos sopés das Montanhas Vermelhas de Dorne. Seu brasão ostenta um caçador armado em campo verde. Seu lema não é revelado nos livros, mas de acordo com uma fonte semi-oficial é \"Primeiros em Batalha\". Eles são uma família antiga em honra com terras ricas e uma forte fortaleza. São também os proprietários de uma espada de aço Valiriano chamada Veneno do Coração.','casas/8.png'),(9,'TYRELL',57,'Jardim de Cima','Campina','Crescendo Fortes','Casa Tyrell de Jardim de Cima é uma das Grandes Casas dos Sete Reinos, senhores supremos da Campina. Uma grande e rica casa, sua riqueza é apenas superada entre as Grandes Casas pela Casa Lannister, os Tyrell porém possuem a maior força militar. Jardim de Cima é uma antiga sede de governo e coração da cavalaria nos Sete Reinos; os Tyrell chamam a si mesmo \'Defensores das Marcas\' e \'Supremos Marechais da Campina\', e possuem tradicionalmente o título de Protetor do Sul. Seu brasão ostenta uma rosa dourada em campo verde-relva, e suas palavras são \"Crescendo Fortes\". Membros da família tendem a apresentar cabelos encaracolados castanhos e olhos castanhos ou dourados.','casas/9.png'),(10,'BARATHEON',55,'Ponta Tempestade','As Terras da Tempestade','Nossa é a Fúria','A Casa Baratheon de Ponta Tempestade, é uma das Grande Casas de Westeros e é a principal casa das Terras da Tempestade. Sua sede é em Ponta Tempestade, um castelo antigo construído pelos Reis da Tempestade. Seu brasão é um veado coroado negro num fundo dourado.?[1] Os membros da família tendem a ser grandes, com cabelo preto e olhos azuis. Eles são conhecidos por seus temperamentos vivos.','casas/10.png');
/*!40000 ALTER TABLE `tbl_casas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categoria`
--

LOCK TABLES `tbl_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_categoria` DISABLE KEYS */;
INSERT INTO `tbl_categoria` VALUES (3,'Didatico'),(4,'Técnico'),(5,'Terror'),(6,'Ação'),(7,'Auto ajuda'),(8,'Manga');
/*!40000 ALTER TABLE `tbl_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_editora`
--

DROP TABLE IF EXISTS `tbl_editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_editora` (
  `id_editora` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(100) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_editora`
--

LOCK TABLES `tbl_editora` WRITE;
/*!40000 ALTER TABLE `tbl_editora` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_endereco`
--

DROP TABLE IF EXISTS `tbl_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(80) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `numero` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_endereco`
--

LOCK TABLES `tbl_endereco` WRITE;
/*!40000 ALTER TABLE `tbl_endereco` DISABLE KEYS */;
INSERT INTO `tbl_endereco` VALUES (4,'Jandira','SP','Rua Duque de Caxias, 283','stella maris','293'),(5,'Jandira','SP','Rua Duque de Caxias','dasdasdas','2222'),(6,'Itapevi','SP','Rua Maria das Paixões','João Das Dores','290'),(7,'Barueri','SP','Rua Duque de Bolinhas','Quadrado','220'),(8,'Osasco','SP','Rua Duque DD','dasdasdas','174'),(10,'Carapicuiba','SP','Rua Duque de Caxias,','gfdsfd','231');
/*!40000 ALTER TABLE `tbl_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_fale_conosco`
--

DROP TABLE IF EXISTS `tbl_fale_conosco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_fale_conosco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sexo` int(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `telefone` varchar(16) DEFAULT NULL,
  `profissao` varchar(100) NOT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `linkface` varchar(100) DEFAULT NULL,
  `infoProduto` text,
  `sugestao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_fale_conosco`
--

LOCK TABLES `tbl_fale_conosco` WRITE;
/*!40000 ALTER TABLE `tbl_fale_conosco` DISABLE KEYS */;
INSERT INTO `tbl_fale_conosco` VALUES (1,'Matheus Vieira Costa',1,'dayane_vieira.wk@hotmail.com','011 99999-9999','011 4619-4343','dsadasd','as','asdas','',''),(2,'Matheus Vieira Costa',1,'dayane_vieira.wk@hotmail.com','011 99999-9999','011 4619-4343','Teste','','','','');
/*!40000 ALTER TABLE `tbl_fale_conosco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genero`
--

DROP TABLE IF EXISTS `tbl_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_genero`),
  KEY `fk_tbl_genero_tbl_categoria_idx` (`id_categoria`),
  KEY `fk_tbl_genero_tbl_sub_categoria_idx` (`id_sub_categoria`),
  CONSTRAINT `fk_tbl_genero_tbl_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`),
  CONSTRAINT `fk_tbl_genero_tbl_sub_categoria` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categoria` (`id_sub_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genero`
--

LOCK TABLES `tbl_genero` WRITE;
/*!40000 ALTER TABLE `tbl_genero` DISABLE KEYS */;
INSERT INTO `tbl_genero` VALUES (7,5,10),(8,3,7),(9,3,12),(10,3,14),(11,3,15),(12,5,18),(13,5,16),(14,7,19),(15,8,24),(16,8,10),(17,8,16),(18,8,20),(19,8,21),(20,8,24),(21,8,25),(22,8,26);
/*!40000 ALTER TABLE `tbl_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genero_tbl_livro`
--

DROP TABLE IF EXISTS `tbl_genero_tbl_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_genero_tbl_livro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_livro` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_genero_livro_tbl_livro_idx` (`id_livro`),
  KEY `fk_tbl_genero_livro_tbl_genero_idx` (`id_genero`),
  CONSTRAINT `fk_tbl_genero_livro_tbl_genero` FOREIGN KEY (`id_genero`) REFERENCES `tbl_genero` (`id_genero`),
  CONSTRAINT `fk_tbl_genero_livro_tbl_livro` FOREIGN KEY (`id_livro`) REFERENCES `tbl_livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genero_tbl_livro`
--

LOCK TABLES `tbl_genero_tbl_livro` WRITE;
/*!40000 ALTER TABLE `tbl_genero_tbl_livro` DISABLE KEYS */;
INSERT INTO `tbl_genero_tbl_livro` VALUES (19,24,9),(20,25,14),(21,26,9),(22,27,19),(23,28,19),(24,29,19),(25,30,19),(26,31,19),(27,32,14),(28,33,12),(29,34,12),(30,35,14),(31,36,11),(32,37,13);
/*!40000 ALTER TABLE `tbl_genero_tbl_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_livro`
--

DROP TABLE IF EXISTS `tbl_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_livro` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `isbn` varchar(16) NOT NULL,
  `ano_publicacao` year(4) NOT NULL,
  `descricao_livro` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_editora` int(11) DEFAULT NULL,
  `paginas` int(11) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `idioma` varchar(45) NOT NULL,
  `enredo` text NOT NULL,
  `adaptacoes` text NOT NULL,
  `status` int(1) NOT NULL,
  `preco` varchar(50) NOT NULL,
  `status_livro` int(11) NOT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `fk_tbl_livro_tbl_editora_idx` (`id_editora`),
  CONSTRAINT `fk_tbl_livro_tbl_editora` FOREIGN KEY (`id_editora`) REFERENCES `tbl_editora` (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_livro`
--

LOCK TABLES `tbl_livro` WRITE;
/*!40000 ALTER TABLE `tbl_livro` DISABLE KEYS */;
INSERT INTO `tbl_livro` VALUES (24,'A Sutil Arte de Ligar o F*da-Se','2131231',2017,' Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por não ver o lado bom de estar no fundo do poço.','arquivos/c5060f9535b6998ad9467eb2ed5f56af.jpg',NULL,1231,'Brasil','Portugues','Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por não ver o lado bom de estar no fundo do poço.','Chega de tentar buscar um sucesso que só existe na sua cabeça. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por não ver o lado bom de estar no fundo do poço.',0,'10',1),(25,'O milagre da manhã ','2131231',2001,'  Chega de tentar buscar um sucesso que sÃ³ existe na sua cabeÃ§a. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por nÃ£o ver o lado bom de estar no fundo do poÃ§o.','arquivos/c7c0435bade3550e236cb7ce82c51104.jpg',NULL,1231,'Brasil','Portugues','Chega de tentar buscar um sucesso que sÃ³ existe na sua cabeÃ§a. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por nÃ£o ver o lado bom de estar no fundo do poÃ§o.','Chega de tentar buscar um sucesso que sÃ³ existe na sua cabeÃ§a. Chega de se torturar para pensar positivo enquanto sua vida vai ladeira abaixo. Chega de se sentir inferior por nÃ£o ver o lado bom de estar no fundo do poÃ§o.',0,'23.99',1),(26,'O Conto da Aia','2131231',2001,'Escrito em 1985, o romance distópico O conto da aia, da canadense Margaret Atwood, tornou-se um dos livros mais comentados em todo o mundo nos últimos meses, voltando a ocupar posição de destaque nas listas do mais vendidos em diversos países. Além de ter inspirado a série homônima (The Handmaid’s Tale, no original) produzida pelo canal de streaming Hulu, o a ficção futurista de Atwood, ','arquivos/917aeec64a5e7de77a0dae0edce383e6.jpg',NULL,1231,'Brasil','Portugues','Escrito em 1985, o romance distópico O conto da aia, da canadense Margaret Atwood, tornou-se um dos livros mais comentados em todo o mundo nos últimos meses, voltando a ocupar posição de destaque nas listas do mais vendidos em diversos países. Além de ter inspirado a série homônima (The Handmaid’s Tale, no original) produzida pelo canal de streaming Hulu, o a ficção futurista de Atwood, ','Escrito em 1985, o romance distópico O conto da aia, da canadense Margaret Atwood, tornou-se um dos livros mais comentados em todo o mundo nos últimos meses, voltando a ocupar posição de destaque nas listas do mais vendidos em diversos países. Além de ter inspirado a série homônima (The Handmaid’s Tale, no original) produzida pelo canal de streaming Hulu, o a ficção futurista de Atwood, ',0,'30.99',1),(27,'Fullmetal Alchemist','2131231',2001,'Os cinco sacrifícios foram reunidos diante do Homúnculo original. A hora do círculo de transmutação em escala nacional ser ativada se aproxima, e a escuridão começa a cobrir o mundo! O inimigo é um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','arquivos/688fe7d926460e4d7de6fde4ac34a657.jpg',NULL,1231,'Brasil','Portugues','Os cinco sacrifícios foram reunidos diante do Homúnculo original. A hora do círculo de transmutação em escala nacional ser ativada se aproxima, e a escuridão começa a cobrir o mundo! O inimigo é um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','Os cinco sacrifícios foram reunidos diante do Homúnculo original. A hora do círculo de transmutação em escala nacional ser ativada se aproxima, e a escuridão começa a cobrir o mundo! O inimigo é um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.',1,'30.00',1),(28,'Fullmetal Alchemist. 24','2131231',2001,' Os cinco sacrifÃ­cios foram reunidos diante do HomÃºnculo original. A hora do cÃ­rculo de transmutaÃ§Ã£o em escala nacional ser ativada se aproxima, e a escuridÃ£o comeÃ§a a cobrir o mundo! O inimigo Ã© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','arquivos/ffbde654508c0a4e2fe82eeeb276420c.jpg',NULL,1231,'Brasil','Portugues','Os cinco sacrifÃ­cios foram reunidos diante do HomÃºnculo original. A hora do cÃ­rculo de transmutaÃ§Ã£o em escala nacional ser ativada se aproxima, e a escuridÃ£o comeÃ§a a cobrir o mundo! O inimigo Ã© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','Os cinco sacrifÃ­cios foram reunidos diante do HomÃºnculo original. A hora do cÃ­rculo de transmutaÃ§Ã£o em escala nacional ser ativada se aproxima, e a escuridÃ£o comeÃ§a a cobrir o mundo! O inimigo Ã© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.',0,'27.99',1),(29,'Fullmetal Alchemist 27','2131231',2001,'  Os cinco sacrifÃÂ­cios foram reunidos diante do HomÃÂºnculo original. A hora do cÃÂ­rculo de transmutaÃÂ§ÃÂ£o em escala nacional ser ativada se aproxima, e a escuridÃÂ£o comeÃÂ§a a cobrir o mundo! O inimigo ÃÂ© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','arquivos/4d08293b8ab53ad0eca76a20748f2bf8.jpg',NULL,1231,'Brasil','Portugues','Os cinco sacrifÃÂ­cios foram reunidos diante do HomÃÂºnculo original. A hora do cÃÂ­rculo de transmutaÃÂ§ÃÂ£o em escala nacional ser ativada se aproxima, e a escuridÃÂ£o comeÃÂ§a a cobrir o mundo! O inimigo ÃÂ© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','Os cinco sacrifÃÂ­cios foram reunidos diante do HomÃÂºnculo original. A hora do cÃÂ­rculo de transmutaÃÂ§ÃÂ£o em escala nacional ser ativada se aproxima, e a escuridÃÂ£o comeÃÂ§a a cobrir o mundo! O inimigo ÃÂ© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.',0,'27.00',1),(30,'Berserk - Volume 27 ','2131231',2001,'   Os cinco sacrifÃÂÃÂ­cios foram reunidos diante do HomÃÂÃÂºnculo original. A hora do cÃÂÃÂ­rculo de transmutaÃÂÃÂ§ÃÂÃÂ£o em escala nacional ser ativada se aproxima, e a escuridÃÂÃÂ£o comeÃÂÃÂ§a a cobrir o mundo! O inimigo ÃÂÃÂ© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','arquivos/ac69c1307eb0a38b72b4e90ac29ed43c.jpg',NULL,1231,'Brasil','Portugues','Os cinco sacrifÃÂÃÂ­cios foram reunidos diante do HomÃÂÃÂºnculo original. A hora do cÃÂÃÂ­rculo de transmutaÃÂÃÂ§ÃÂÃÂ£o em escala nacional ser ativada se aproxima, e a escuridÃÂÃÂ£o comeÃÂÃÂ§a a cobrir o mundo! O inimigo ÃÂÃÂ© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.','Os cinco sacrifÃÂÃÂ­cios foram reunidos diante do HomÃÂÃÂºnculo original. A hora do cÃÂÃÂ­rculo de transmutaÃÂÃÂ§ÃÂÃÂ£o em escala nacional ser ativada se aproxima, e a escuridÃÂÃÂ£o comeÃÂÃÂ§a a cobrir o mundo! O inimigo ÃÂÃÂ© um, mas com um poder imenso! A jornada dos jovens alquimistas Ed e Al se aproxima do fim.',0,'17.99',1),(31,'Ataque dos Titãs - Volume 25','2131231',2001,' Falco leva Reiner a se encontrar com Eren, que quer falar com o antigo companheiro sobre o que pretende fazer em Marley enquanto é encenada a peça sobre a história do Império de Eldia, os Titãs e a Ilha Paradis','arquivos/345956ee1656166f966f10c507c6787c.jpg',NULL,1231,'Japão','Portugues','Falco leva Reiner a se encontrar com Eren, que quer falar com o antigo companheiro sobre o que pretende fazer em Marley enquanto é encenada a peça sobre a história do Império de Eldia, os Titãs e a Ilha Paradis','Falco leva Reiner a se encontrar com Eren, que quer falar com o antigo companheiro sobre o que pretende fazer em Marley enquanto é encenada a peça sobre a história do Império de Eldia, os Titãs e a Ilha Paradis',0,'16.99',1),(32,'Operação CEO','2131231',2001,' Sabrina é uma profissional da área de TI que está tentando sobreviver aos trinta dias de férias repentinas do seu chefe setorial. Sua primeira atividade será ajudar o mais novo CEO da empresa, que possui um sotaque irresistível e olhos hipnotizantes.\nEnrico Zanetti assumiu a posição de CEO de forma repentina, depois que seu pai foi afastado por causa de um infarto. Em poucos dias de presidência descobriu que a empresa possui um rombo em suas ','arquivos/3b5954b9f1a445dd54fec46b9f219c67.jpg',NULL,1231,'Brasil','Portugues','Sabrina é uma profissional da área de TI que está tentando sobreviver aos trinta dias de férias repentinas do seu chefe setorial. Sua primeira atividade será ajudar o mais novo CEO da empresa, que possui um sotaque irresistível e olhos hipnotizantes.\nEnrico Zanetti assumiu a posição de CEO de forma repentina, depois que seu pai foi afastado por causa de um infarto. Em poucos dias de presidência descobriu que a empresa possui um rombo em suas ','Sabrina é uma profissional da área de TI que está tentando sobreviver aos trinta dias de férias repentinas do seu chefe setorial. Sua primeira atividade será ajudar o mais novo CEO da empresa, que possui um sotaque irresistível e olhos hipnotizantes.\nEnrico Zanetti assumiu a posição de CEO de forma repentina, depois que seu pai foi afastado por causa de um infarto. Em poucos dias de presidência descobriu que a empresa possui um rombo em suas ',0,'10.00',1),(33,'Dois Destinos: Volume único','2131231',2001,'No coração do Pantanal, dois destinos tão diferentes se encontram...\n\nGuilherme é peão pantaneiro que gosta das coisas simples: seu cavalo, sua viola, um bom churrasco e um tereré após o trabalho duro. A verdade é que nem sempre sua vida foi assim. Misterioso, o peão guarda dentro de si uma dor que tenta esquecer, mas a culpa o impede. A fazenda e os tios são tudo o ','arquivos/7039b48269f8315c4b9ba3bc6e15b1a7.jpg',NULL,1231,'Brasil','Portugues','No coração do Pantanal, dois destinos tão diferentes se encontram...\n\nGuilherme é peão pantaneiro que gosta das coisas simples: seu cavalo, sua viola, um bom churrasco e um tereré após o trabalho duro. A verdade é que nem sempre sua vida foi assim. Misterioso, o peão guarda dentro de si uma dor que tenta esquecer, mas a culpa o impede. A fazenda e os tios são tudo o ','No coração do Pantanal, dois destinos tão diferentes se encontram...\n\nGuilherme é peão pantaneiro que gosta das coisas simples: seu cavalo, sua viola, um bom churrasco e um tereré após o trabalho duro. A verdade é que nem sempre sua vida foi assim. Misterioso, o peão guarda dentro de si uma dor que tenta esquecer, mas a culpa o impede. A fazenda e os tios são tudo o ',0,'10',1),(34,'Recomeços','2131231',2001,'Até que ponto um amor nascido na infância tem chances de crescer e se tornar invencível?\nLívia, Guilherme, Jocasta e Lucien. Quatro pessoas cujas vidas se entrelaçam desde cedo e que serão marcadas pela maldade silenciosa de uma pessoa. \nAbordando paixão, ódio, inveja, obsessão, culpa e espiritualidade, Recomeços acompanha a trajetória de quatro protagonistas em suas jornadas de amadurecimento e descobertas a respeito do amor e da ','arquivos/1fa90bbbe7d4d3b709e86fd9c1dcb0b2.jpg',NULL,1231,'Brasil','Portugues','Até que ponto um amor nascido na infância tem chances de crescer e se tornar invencível?\nLívia, Guilherme, Jocasta e Lucien. Quatro pessoas cujas vidas se entrelaçam desde cedo e que serão marcadas pela maldade silenciosa de uma pessoa. \nAbordando paixão, ódio, inveja, obsessão, culpa e espiritualidade, Recomeços acompanha a trajetória de quatro protagonistas em suas jornadas de amadurecimento e descobertas a respeito do amor e da ','Até que ponto um amor nascido na infância tem chances de crescer e se tornar invencível?\nLívia, Guilherme, Jocasta e Lucien. Quatro pessoas cujas vidas se entrelaçam desde cedo e que serão marcadas pela maldade silenciosa de uma pessoa. \nAbordando paixão, ódio, inveja, obsessão, culpa e espiritualidade, Recomeços acompanha a trajetória de quatro protagonistas em suas jornadas de amadurecimento e descobertas a respeito do amor e da ',0,'10',1),(35,'Sapiens - Uma Breve História da Humanidade','2131231',2001,' AtÃ© que ponto um amor nascido na infÃ¢ncia tem chances de crescer e se tornar invencÃ­vel?\nLÃ­via, Guilherme, Jocasta e Lucien. Quatro pessoas cujas vidas se entrelaÃ§am desde cedo e que serÃ£o marcadas pela maldade silenciosa de uma pessoa. \nAbordando paixÃ£o, Ã³dio, inveja, obsessÃ£o, culpa e espiritualidade, RecomeÃ§os acompanha a trajetÃ³ria de quatro protagonistas em suas jornadas de amadurecimento e descobertas a respeito do amor e da ','arquivos/d532440b8551f6bc63cea17301fc8220.jpg',NULL,1231,'Brasil','Portugues','AtÃ© que ponto um amor nascido na infÃ¢ncia tem chances de crescer e se tornar invencÃ­vel?\nLÃ­via, Guilherme, Jocasta e Lucien. Quatro pessoas cujas vidas se entrelaÃ§am desde cedo e que serÃ£o marcadas pela maldade silenciosa de uma pessoa. \nAbordando paixÃ£o, Ã³dio, inveja, obsessÃ£o, culpa e espiritualidade, RecomeÃ§os acompanha a trajetÃ³ria de quatro protagonistas em suas jornadas de amadurecimento e descobertas a respeito do amor e da ','AtÃ© que ponto um amor nascido na infÃ¢ncia tem chances de crescer e se tornar invencÃ­vel?\nLÃ­via, Guilherme, Jocasta e Lucien. Quatro pessoas cujas vidas se entrelaÃ§am desde cedo e que serÃ£o marcadas pela maldade silenciosa de uma pessoa. \nAbordando paixÃ£o, Ã³dio, inveja, obsessÃ£o, culpa e espiritualidade, RecomeÃ§os acompanha a trajetÃ³ria de quatro protagonistas em suas jornadas de amadurecimento e descobertas a respeito do amor e da ',0,'102.99',1),(36,'A revolução dos bichos: Um conto de fadas','2131231',2001,'erdadeiro clássico moderno, concebido por um dos mais influentes escritores do século XX, A revolução dos bichos é uma fábula sobre o poder. Narra a insurreição dos animais de uma granja contra seus donos. Progressivamente, porém, a revolução degenera numa tirania ainda mais opressiva que a dos humanos.','arquivos/644a78fe6928dfcc0fbd1d6a37e08292.jpg',NULL,1231,'Brasil','Portugues','erdadeiro clássico moderno, concebido por um dos mais influentes escritores do século XX, A revolução dos bichos é uma fábula sobre o poder. Narra a insurreição dos animais de uma granja contra seus donos. Progressivamente, porém, a revolução degenera numa tirania ainda mais opressiva que a dos humanos.','erdadeiro clássico moderno, concebido por um dos mais influentes escritores do século XX, A revolução dos bichos é uma fábula sobre o poder. Narra a insurreição dos animais de uma granja contra seus donos. Progressivamente, porém, a revolução degenera numa tirania ainda mais opressiva que a dos humanos.',0,'10',1),(37,'Ariadne Contra o Minotauro','2131231',2001,'Ariadne, filha caçula do rei Minos, descobre que o monstro encarcerado por seu pai no Labirinto de Creta é seu meio-irmão. A ele são oferecidos em sacrifício, cada nove anos, sete moças e sete rapazes gregos. Dessa vez, no grupo das vítimas está o príncipe Teseu, por quem Ariadne se apaixona. Ela decide salvar o estrangeiro, desafiando abertamente sua família e as leis locais.','arquivos/568e9a289f3d71ef3291e3f026cc8f00.jpg',NULL,1231,'Brasil','Portugues','Ariadne, filha caçula do rei Minos, descobre que o monstro encarcerado por seu pai no Labirinto de Creta é seu meio-irmão. A ele são oferecidos em sacrifício, cada nove anos, sete moças e sete rapazes gregos. Dessa vez, no grupo das vítimas está o príncipe Teseu, por quem Ariadne se apaixona. Ela decide salvar o estrangeiro, desafiando abertamente sua família e as leis locais.','Ariadne, filha caçula do rei Minos, descobre que o monstro encarcerado por seu pai no Labirinto de Creta é seu meio-irmão. A ele são oferecidos em sacrifício, cada nove anos, sete moças e sete rapazes gregos. Dessa vez, no grupo das vítimas está o príncipe Teseu, por quem Ariadne se apaixona. Ela decide salvar o estrangeiro, desafiando abertamente sua família e as leis locais.',0,'66.99',1);
/*!40000 ALTER TABLE `tbl_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_niveis`
--

DROP TABLE IF EXISTS `tbl_niveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_niveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_niveis`
--

LOCK TABLES `tbl_niveis` WRITE;
/*!40000 ALTER TABLE `tbl_niveis` DISABLE KEYS */;
INSERT INTO `tbl_niveis` VALUES (1,'adm',1),(26,'ss',1);
/*!40000 ALTER TABLE `tbl_niveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nossa_missao`
--

DROP TABLE IF EXISTS `tbl_nossa_missao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_nossa_missao` (
  `id_nossa_missao` int(11) NOT NULL AUTO_INCREMENT,
  `lista_missao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_nossa_missao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nossa_missao`
--

LOCK TABLES `tbl_nossa_missao` WRITE;
/*!40000 ALTER TABLE `tbl_nossa_missao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nossa_missao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nossas_lojas`
--

DROP TABLE IF EXISTS `tbl_nossas_lojas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_nossas_lojas` (
  `id_loja` int(11) NOT NULL AUTO_INCREMENT,
  `id_endereco` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_loja`),
  KEY `fk_tbl_endereco_tbl_nossas_lojas_idx` (`id_endereco`),
  CONSTRAINT `fk_tbl_endereco_tbl_nossas_lojas` FOREIGN KEY (`id_endereco`) REFERENCES `tbl_endereco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nossas_lojas`
--

LOCK TABLES `tbl_nossas_lojas` WRITE;
/*!40000 ALTER TABLE `tbl_nossas_lojas` DISABLE KEYS */;
INSERT INTO `tbl_nossas_lojas` VALUES (3,5,'arquivos/4e053fd0fb501a8db91fc7baad58bbfd.png',1),(4,8,'arquivos/2041a295ea244accd4a00791cf7baaec.jpg',1),(5,7,'arquivos/09fbe7730fd82f6bf26a1a5cce258c27.jpg',1),(6,5,'arquivos/f45993f0a4ee6b5e0b0981503deed0a6.jpg',1),(7,7,'arquivos/6877bd7883a35931a108e4dc758a0505.jpg',1);
/*!40000 ALTER TABLE `tbl_nossas_lojas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pagina_sobre`
--

DROP TABLE IF EXISTS `tbl_pagina_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_pagina_sobre` (
  `id_sobre` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_sobre` varchar(80) NOT NULL,
  `descricao_sobre` text NOT NULL,
  `foto_sobre` varchar(250) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_sobre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pagina_sobre`
--

LOCK TABLES `tbl_pagina_sobre` WRITE;
/*!40000 ALTER TABLE `tbl_pagina_sobre` DISABLE KEYS */;
INSERT INTO `tbl_pagina_sobre` VALUES (1,'l','s','arquivos/1988004e1f83cd818d8aa8ee7d920079.jpg',0),(4,'Tudo Começou com a BATATA','Do Portugues - Batata\nDo Ingles - Potato\nDo Hebraico - תפוח אדמה\nDo Alemão - Kartoffel\nSabe o que isso siginifica? \nNADA!','arquivos/cbdd2ddfa08e36b67365b90024fc9d3f.jpg',0),(5,'História de como tudo começou','A livraria Woody WoodyPecker foi fundada em 1986 pelo Sr. Wally Walrus. No início Wally pensava em uma livraria que atendesse \n                                            somente em volta de sua casa, com a intenção de espalhar o amor que tinha pela leitura para as crianças de seu bairro e para que \n                                            pessoas trocassem as novelas por uma boa leitura. Como sempre apreciou bons livros desde pequeno, \n                                            (ele possuía muitos em sua coleção) com uma grande variedade de categorias, desde romance a terror, \n                                            mas seus preferidos sempre foram os de suspense. Mas ele não tinha tempo para ler e precisava de espaço em seu quarto, \n                                            pensou então em doa-los, porém, sua família passava por algumas dificuldades financeiras e ele precisava de dinheiro para ir a\n                                            faculdade, viu ali uma oportunidade de tornar isso possível e fazer o bem ao mesmo tempo.<br>\n                                            Decidiu que iria vender seus livros bem barato para que todos tivessem condição de compra-los e \n                                            como sua ideia principal era doa-los, todo mês ele doava pelo menos 5 livros. Abriu sua loja na \n                                            garagem de sua mãe com apenas 20 anos. O espaço era pequeno e apertado, não cabiam 5 pessoas dentro \n                                            confortavelmente, mas mesmo assim fez muito sucesso. \n','arquivos/68fd927da34a2670a4544c849afcff51.jpg',1);
/*!40000 ALTER TABLE `tbl_pagina_sobre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_personagens`
--

DROP TABLE IF EXISTS `tbl_personagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_personagens` (
  `id_personagens` int(11) NOT NULL AUTO_INCREMENT,
  `nome_personagem` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `genero` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descricao` text NOT NULL,
  `casa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reino` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto_personagem` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_personagens`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_personagens`
--

LOCK TABLES `tbl_personagens` WRITE;
/*!40000 ALTER TABLE `tbl_personagens` DISABLE KEYS */;
INSERT INTO `tbl_personagens` VALUES (33,'Daenerys Targaryen','Feminino','Daenerys foi considerada pelo jornal “The New York Times” uma das melhores criações de George R. R. Martin, autor dos livros que inspiraram a série. ','Targaryen','Essos/Westeros','personagens/1.png'),(34,'Jon Snow','Masculino','Jon Snow é o filho bastardo de Eddard Stark com uma mãe de identidade desconhecida. Quando completa maioridade, ele se junta à Patrulha da Noite, cujos próprios comandados o matam algum tempo depois. Eles acreditavam que Snow havia traído seu juramento. A morte do personagem dura pouco, e ele é ressuscitado. Reviravoltas envolvendo as suas verdadeiras origens, e um relacionamento amoroso inesperado, o marcam ainda mais. Na série é interpretado pelo ator Kit Harington.','Targaryen','Westeros','personagens/2.jpg'),(35,'Tyrion Lannister','Masculino','Também chamado de duende ou meio-homem, Tyrion Lannister é o terceiro e mais novo filho de Tywin Lannister e Joanna Lannister. O pai o despreza por ele ser anão, e também porque a mãe morreu durante seu parto. Embora seja cruel com seus inimigos, ele apresenta empatia com as pessoas próximas e as minorias. Educado, calculista e perspicaz, Tyrion é um dos fortes personagens da trama. Na série Tyrion é interpretado por Peter Dinklage.','Lannister','Westeros','personagens/3.jpg'),(36,'Sansa Stark','Feminino','Sansa Stark é meia-irmã de Jon Snow, a filha mais velha de Catelyn e Eddard Stark. Criada para ser uma dama, ela é treinada para deveres femininos, como bordado, ','Stark','Westeros','personagens/4.jpg'),(37,'Cersei Lannister','Feminino','Cersei Lannister é a filha mais velha de Lorde Tywin Lannister e irmã gêmea de Jaime Lannister. Ela se casa com o rei Robert Baratheon e se torna a rainha dos Sete Reinos. A principal característica da personagem é seu temperamento explosivo e o orgulho ferido. A ira e a mágoa a fazem tomar decisões precipitadas frequentemente. Apesar de conseguir ascender ao poder facilmente, ela não consegue lidar da melhor maneira com ele. Na série é interpretada pela atriz Lena Headey','Lannister','Westeros','personagens/5.jpg'),(38,'Joffrey Baratheon','Masculino','Joffrey acredita ser o filho mais velho e herdeiro do Rei Robert I e da Rainha Cersei Lannister. No entanto, o seu verdadeiro pai é Jaime Lannister, irmão da rainha. Ele possui o mesmo comportamento incontrolável e os impulsos sádicos de sua mãe. Prometido a Sansa Stark, ele a maltrata e faz com que a garota perca a sua visão romântica do mundo.  Na série foi interpretado pelo ator Jack Gleeson','Baratheon/Lannister','Westeros','personagens/6.jpg'),(39,'Eddard Stark','Masculino','Conhecido como Ned, Eddard Stark é o chefe da casa Stark, Senhor de Winterfell, e Protetor do Norte. Ele é conhecido por seu senso de justiça. Enquanto a sua família o considera bondoso, muitos encaram a sua personalidade reservada como um sinal de frieza e desdém. Stark é o melhor amigo do Rei Robert Baratheon, com quem foi criado e a quem ajudou a conquistar o Trono de Ferro. Na série, foi interpretado pelo ator Sean Bean','Stark','Westeros','personagens/7.jpg'),(40,'Brienne de Tarth','Feminino','Brienne de Tarth surgiu como uma personagem secundária, mas ganhou destaque nas temporadas 4, 5, 6 e 7. Guerreira da Casa Tarth, ela é a única filha sobrevivente de Selwyn Tarth. Os gostos que desenvolveu por artes marciais quando criança fizeram dela uma exímia guerreia. Ela promete a Catelyn proteger Arya e Sansa, o que encara como a sua nova missão. Na série é interpretada pela atriz Gwendoline Christie','Tarth','Westeros','personagens/8.jpg'),(41,'Arya Stark','Feminino','A Terceira filha do Lorde Eddard Stark e Catelyn Stark, Arya é corajosa e apresenta bastante interesse em combates. Incentivada por seu meio-irmão, Jon Snow, ela aprende a lutar com espadas na pré-adolescência, e é muitas vezes confundida com um garoto. Na série ela é vivida pela atriz Maisie Williams. Embora seja o primeiro papel profissional da jovem, ela é bastante elogiada pela crítica. É interpretada nas telas pela atriz britânica Maisie Williams.','Stark','Westeros','personagens/9.jpg'),(42,'Ramsay Bolton','Masculino','Ramsay Bolton é o filho mais velho de Roose Bolton, Lorde de Dreadfort, uma fortaleza ancestral no Norte de Westeros. O personagem é um verdadeiro psicopata, que se diverte em torturar e esfolar suas vítimas. Ele é citado durante a segunda temporada da série, mas só aparece na terceira, quando é mencionado apenas como “Menino”. A sua identidade é revelada apenas no último episódio da temporada. Na série é interpretado pelo ator Iwan Rheon.','Bolton','Westeros','personagens/10.jpg'),(43,'Samwell Tarly','Masculino','Samwell Tarly é o filho mais velho do Lorde Randyll Tarly de Monte Chifre, um vassalo dos Tyrell de Jardim de Cima.  Muito inteligente e atencioso, porém timido e inseguro. Se torna um irmão juramentado da Patrulha da Noite. Na série de televisão é interpretado pelo ator John Bradley','Tully','Westeros','personagens/11.png'),(44,'Hodor','Masculino','Depois da queda de Bran Stark, ele precisa de uma maneira de se mover sobre o castelo.Hodor tem servido como forma de transporte de Bran desde então. Hodor possui mais de dois metros e dez centímetros de altura. É sugerido por Osha que seu grande tamanho seja resultado de sangue de gigantes. Seu nome verdadeiro é Walder. No seriado  é interpretado pelo ator Kristian Nairn.','Indefinida','Westeros','personagens/12.jpg'),(45,'Clegane','Masculino','Sandor Clegane, conhecido como \"Cão de Caça\" por sua natureza feroz, sua obediência sem questionamentos a seus senhores e pelos três cães existentes no brasão de armas de sua família, é um vassalo e aliado da Casa Lannister e o irmão mais novo de Gregor Clegane, o \"Montanha\". É considerado um dos melhores personagens, ja que sua habilidade formal de criar frases incriveis, vem e vai conquistando muitos fãs pelo mundo. Na série é interpretado pelo ator Rory McCann.','Clegane','Westeros','personagens/13.jpg'),(46,'Melisandre','Feminino','Ela é uma sacerdotisa do deus vermelho R\'hllor e uma conselheira íntima de Stannis Baratheon em sua campanha pelo Trono de Ferro. Frequentemente ela é chamada de Mulher Vermelha por causa da cor de seus cabelos e de suas roupas. Melisandre é original de Asshai, no continente de Essos, e veio a Westeros para propagar sua fé no Deus Vermelho. Na série é interpretada pela atriz holandesa Carice Van Houten.','Indefinida','Essos','personagens/14.jpg'),(47,'Bran Stark','Masculino','Brandon \"Bran\" Stark é o segundo filho homem das cinco crianças de Catelyn e Eddard \"Ned\" Stark. Com seus sonhos de se tornar um cavaleiro destruídos pela tentativa contra sua vida que o deixou fisicamente incapacitado, a necessidade e o dever o forçam a superar suas atuais limitações e desenvolver suas novas habilidades. Sua aceitação gradual de seus sonhos que parecem proféticos e sua habilidade para se incorporar em seu lobo \"Summer\", mostram sua maturidade e seu valor depois da perda do movimento de suas pernas. Na série é interpretado pelo ator britânico Isaac Hempstead Wright.','Stark','Westeros','personagens/15.jpg'),(48,'Petyr Baelish','Masculino','Um nobre do continente de Westeros, é o principal articulador e manipulador das novelas, responsável pelas grandes intrigas da história e dono de diversos bordéis, que usa para colher informações de seus amigos e inimigos. Seu apelido lhe foi dado por sua baixa estatura e pelas terras de sua família no menor dos Fingers, uma região costeira no Vale de Arryn. Na série é interpretado pelo ator irlandês Aidan Gillen.','Baelish','Westeros','personagens/16.jpg'),(49,'Khal Drogo','Masculino','Khal Drogo era um rico e poderoso chefe dothraki ou khal, filho de Bharbo. Antes dos trinta, Drogo já liderava o maior khalasar no Mar Dothraki, com quarenta mil guerreiros, e nunca tinha sido derrotado.  Ele se casou com Daenerys Targaryen, prometendo invadir Westeros em seu nome, mas morreu antes mesmo da invasão começar. Na série de televisão foi interpretado pelo ator Jason Momoa.','Dothraki','Essos','personagens/17.jpg'),(50,'Renly Baratheon','Masculino','Renly Baratheon era o irmão mais novo de Robert Baratheon e de Stannis Baratheon, todos filhos de Steffon Baratheon com Cassana Estermont. Com a ascensão de Robert como Rei dos Sete Reinos, Renly tornou-se Lorde de Ponta Tempestade, além de servir no pequeno conselho como mestre das leis. Após a morte de Robert ele se declarou rei e casou-se com Margaery Tyrell, conseguindo o apoio de várias casas em sua pretensão. Na série de televisão é interpretado pelo ator Gethin Anthony.','Baratheon','Westeros','personagens/18.jpg'),(51,'Sir Jorah','Masculino','Unico filho de Lorde Jeor Mormont, o Lorde da Ilha dos Urso. No passado Jorah casou-se com uma dama da Casa Glover, que morreu depois dez anos de casados. Jorah lutou ao lado do rei Robert Baratheon durante a Rebelião dos Greyjoy. Passou a viver entre as Cidades Livres após ser expulso de Westeros por Ned Stark e traido pela segunda esposa. Ofereceu seus serviços de mercenário a quem melhor pagasse até encontrar Daenerys Targaryen. Na série de televisão ele é interpretado pelo ator escocês Iain Glen.','Mormont','Essos','personagens/19.jpg'),(52,'Daario Naharis','Masculino','Daario é um guerreiro natural de Essos, comandante dos Corvos Tormentosos, uma companhia de mercenários formada por 500 soldados a cavalo. Um matador eficiente e inteiramente devotado a Daenerys Targaryen. Foi interpretado pelo ator britânico Ed Skrein e atualmente pelo ator holandês Michiel Huisman.','Corvos Tormentosos ','Essos','personagens/20.jpg'),(53,'Gilly','Feminino','Ela é uma Selvagem, povo que vive Além da Muralha do continente de Westeros e que chama a si próprio de Povo Livre. Filha e esposa de Craster, um Selvagem que casa e tem filhos com suas próprias filhas e o caso amoroso de Samwell Tarly. Ela é a mãe e meia-irmã de Sam, nome dado em homenagem a Samwell, um bebê que teve com o pai numa relação forçada. Na série de tv ela é interpretada pela atriz inglesa Hannah Murray.','Primeiros Homens','Westeros','personagens/21.jpg'),(54,'Tormund Giantsbane','Masculino','Um Selvagem do norte do continente de Westeros, assume a liderança de seu povo depois da morte do antigo líder e passa a crer que o \"Guerreiro Prometido\" é seu antigo inimigo Jon Snow. Um guerreiro com capacidade de liderança e lutador, ele demonstra suas habilidades quando mata vários patrulheiros da Muralha, dominando inclusive o mestre de armas Alliser Thorne num combate, durante a Batalha de Castle Black. Na série de televisão ele é interpretado pelo ator norueguês Kristofer Hivju.','Povo Livre','Westeros','personagens/22.jpg');
/*!40000 ALTER TABLE `tbl_personagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promocao`
--

DROP TABLE IF EXISTS `tbl_promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_promocao` (
  `id_promocao` int(11) NOT NULL AUTO_INCREMENT,
  `id_livro_promocao` int(11) NOT NULL,
  `preco_novo` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id_promocao`),
  KEY `fk_tbl_livro_tbl_promocao_idx` (`id_livro_promocao`),
  CONSTRAINT `fk_tbl_livro_tbl_promocao` FOREIGN KEY (`id_livro_promocao`) REFERENCES `tbl_livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promocao`
--

LOCK TABLES `tbl_promocao` WRITE;
/*!40000 ALTER TABLE `tbl_promocao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sub_categoria`
--

DROP TABLE IF EXISTS `tbl_sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_sub_categoria` (
  `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome_sub_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_sub_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sub_categoria`
--

LOCK TABLES `tbl_sub_categoria` WRITE;
/*!40000 ALTER TABLE `tbl_sub_categoria` DISABLE KEYS */;
INSERT INTO `tbl_sub_categoria` VALUES (7,'Matematica'),(10,'Horror'),(12,'Portugues'),(14,'Geografia'),(15,'Historia'),(16,'Aventura'),(17,'Jovens'),(18,'Suspense'),(19,'fisolofia'),(20,'encchi'),(21,'shounen'),(22,'Harem'),(23,'Escolar'),(24,'Romance'),(25,'Romance-Escolar'),(26,'Vida Escolar');
/*!40000 ALTER TABLE `tbl_sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) DEFAULT NULL,
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `status` int(1) NOT NULL,
  `id_niveis` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_usuario_tbl_niveis_idx` (`id_niveis`),
  CONSTRAINT `fk_tbl_usuario_tbl_niveis` FOREIGN KEY (`id_niveis`) REFERENCES `tbl_niveis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'Matheus ','vieira','vieira','123',1,1),(4,'Matheus','Vieira','Vieira','123',1,1);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_consulta_genero`
--

DROP TABLE IF EXISTS `view_consulta_genero`;
/*!50001 DROP VIEW IF EXISTS `view_consulta_genero`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_consulta_genero` AS SELECT 
 1 AS `nome_autor`,
 1 AS `id_livro`,
 1 AS `titulo`,
 1 AS `isbn`,
 1 AS `ano_publicacao`,
 1 AS `descricao_livro`,
 1 AS `foto`,
 1 AS `id_editora`,
 1 AS `paginas`,
 1 AS `pais`,
 1 AS `idioma`,
 1 AS `enredo`,
 1 AS `adaptacoes`,
 1 AS `status`,
 1 AS `preco`,
 1 AS `status_livro`,
 1 AS `nome_categoria`,
 1 AS `nome_sub_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_livro`
--

DROP TABLE IF EXISTS `view_livro`;
/*!50001 DROP VIEW IF EXISTS `view_livro`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_livro` AS SELECT 
 1 AS `nome_autor`,
 1 AS `id_livro`,
 1 AS `titulo`,
 1 AS `isbn`,
 1 AS `ano_publicacao`,
 1 AS `descricao_livro`,
 1 AS `foto`,
 1 AS `id_editora`,
 1 AS `paginas`,
 1 AS `pais`,
 1 AS `idioma`,
 1 AS `enredo`,
 1 AS `adaptacoes`,
 1 AS `status`,
 1 AS `preco`,
 1 AS `status_livro`,
 1 AS `nome_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewusuarios`
--

DROP TABLE IF EXISTS `viewusuarios`;
/*!50001 DROP VIEW IF EXISTS `viewusuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `viewusuarios` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `login`,
 1 AS `senha`,
 1 AS `status`,
 1 AS `id_niveis`,
 1 AS `permissao`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_consulta_genero`
--

/*!50001 DROP VIEW IF EXISTS `view_consulta_genero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_consulta_genero` AS select `autor`.`nome_autor` AS `nome_autor`,`livro`.`id_livro` AS `id_livro`,`livro`.`titulo` AS `titulo`,`livro`.`isbn` AS `isbn`,`livro`.`ano_publicacao` AS `ano_publicacao`,`livro`.`descricao_livro` AS `descricao_livro`,`livro`.`foto` AS `foto`,`livro`.`id_editora` AS `id_editora`,`livro`.`paginas` AS `paginas`,`livro`.`pais` AS `pais`,`livro`.`idioma` AS `idioma`,`livro`.`enredo` AS `enredo`,`livro`.`adaptacoes` AS `adaptacoes`,`livro`.`status` AS `status`,`livro`.`preco` AS `preco`,`livro`.`status_livro` AS `status_livro`,`categoria`.`nome_categoria` AS `nome_categoria`,`sub`.`nome_sub_categoria` AS `nome_sub_categoria` from ((((((`tbl_autor` `autor` join `tbl_livro` `livro`) join `tbl_autor_livro` `autor_livro`) join `tbl_categoria` `categoria`) join `tbl_sub_categoria` `sub`) join `tbl_genero` `genero`) join `tbl_genero_tbl_livro` `genero_livro`) where ((`autor`.`id_autor` = `autor_livro`.`id_autor`) and (`livro`.`id_livro` = `autor_livro`.`id_livro`) and (`sub`.`id_sub_categoria` = `genero`.`id_sub_categoria`) and (`categoria`.`id_categoria` = `genero`.`id_categoria`) and (`genero`.`id_genero` = `genero_livro`.`id_genero`) and (`livro`.`id_livro` = `genero_livro`.`id_livro`) and (`livro`.`id_livro` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_livro`
--

/*!50001 DROP VIEW IF EXISTS `view_livro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_livro` AS select `autor`.`nome_autor` AS `nome_autor`,`livro`.`id_livro` AS `id_livro`,`livro`.`titulo` AS `titulo`,`livro`.`isbn` AS `isbn`,`livro`.`ano_publicacao` AS `ano_publicacao`,`livro`.`descricao_livro` AS `descricao_livro`,`livro`.`foto` AS `foto`,`livro`.`id_editora` AS `id_editora`,`livro`.`paginas` AS `paginas`,`livro`.`pais` AS `pais`,`livro`.`idioma` AS `idioma`,`livro`.`enredo` AS `enredo`,`livro`.`adaptacoes` AS `adaptacoes`,`livro`.`status` AS `status`,`livro`.`preco` AS `preco`,`livro`.`status_livro` AS `status_livro`,`categoria`.`nome_categoria` AS `nome_categoria` from (((`tbl_categoria` `categoria` join `tbl_autor` `autor`) join `tbl_livro` `livro`) join `tbl_autor_livro` `autor_livro`) where ((`autor`.`id_autor` = `autor_livro`.`id_autor`) and (`livro`.`id_livro` = `autor_livro`.`id_livro`)) group by `livro`.`id_livro` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewusuarios`
--

/*!50001 DROP VIEW IF EXISTS `viewusuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewusuarios` AS select `usuario`.`id` AS `id`,`usuario`.`nome` AS `nome`,`usuario`.`sobrenome` AS `sobrenome`,`usuario`.`login` AS `login`,`usuario`.`senha` AS `senha`,`usuario`.`status` AS `status`,`usuario`.`id_niveis` AS `id_niveis`,`niveis`.`nome` AS `permissao` from (`tbl_usuario` `usuario` join `tbl_niveis` `niveis`) where (`usuario`.`id_niveis` = `niveis`.`id`) */;
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

-- Dump completed on 2019-04-14 22:42:38
