CREATE DATABASE  IF NOT EXISTS `db2_proyecto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db2_proyecto`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db2_proyecto
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso` (
  `id_acceso` int(11) NOT NULL,
  `titulo` varchar(25) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES (1,'Crear Usuario',''),(2,'Editar Usuario',''),(3,'Eliminar Usuario',''),(4,'Crear Cliente',''),(5,'Editar Cliente',''),(6,'Eliminar Cliente',''),(7,'Crear Tipo de Tarjeta',''),(8,'Editar Tipo de Tarjeta',''),(9,'Eliminar Tipo de Tarjeta',''),(10,'Asignar Tarjeta',''),(11,'Gestionar Tarjeta',''),(12,'Gestionar Estado Tarjeta','');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acceso_rol`
--

DROP TABLE IF EXISTS `acceso_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acceso_rol` (
  `id_acceso_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` int(11) NOT NULL,
  `acceso` int(11) NOT NULL,
  PRIMARY KEY (`id_acceso_rol`),
  UNIQUE KEY `acceso_rol_unique` (`acceso`,`rol`),
  KEY `fk_rol` (`rol`),
  KEY `fk_acceso` (`acceso`),
  CONSTRAINT `fk_acceso` FOREIGN KEY (`acceso`) REFERENCES `acceso` (`id_acceso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso_rol`
--

LOCK TABLES `acceso_rol` WRITE;
/*!40000 ALTER TABLE `acceso_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `acceso_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atm`
--

DROP TABLE IF EXISTS `atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atm` (
  `id_atm` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tipo_atm` int(11) NOT NULL,
  PRIMARY KEY (`id_atm`),
  KEY `fk_atm_tipo_idx` (`tipo_atm`),
  CONSTRAINT `fk_atm_tipo` FOREIGN KEY (`tipo_atm`) REFERENCES `tipo_atm` (`id_tipo_atm`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dpi` varchar(15) NOT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `primer_nombre` varchar(25) NOT NULL,
  `segundo_nombre` varchar(25) DEFAULT NULL,
  `primer_apellido` varchar(25) NOT NULL,
  `segundo_apellido` varchar(25) DEFAULT NULL,
  `casada_apellido` varchar(25) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(25) DEFAULT NULL,
  `dirección` varchar(60) DEFAULT NULL,
  `estado_civil` int(11) NOT NULL,
  `genero` int(11) NOT NULL,
  `ingreso_promedio` varchar(15) DEFAULT NULL,
  `nombre_empresa` varchar(45) DEFAULT NULL,
  `telefono_empresa` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `dpi_UNIQUE` (`dpi`),
  KEY `fk_sexo_idx` (`genero`),
  KEY `fk_estado_civil_idx` (`estado_civil`),
  CONSTRAINT `fk_cliente_estado_civil` FOREIGN KEY (`estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emisor`
--

DROP TABLE IF EXISTS `emisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emisor` (
  `id_emisor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `tipo_emisor` int(11) NOT NULL,
  PRIMARY KEY (`id_emisor`),
  KEY `fk_emisor_tipo_idx` (`tipo_emisor`),
  CONSTRAINT `fk_emisor_tipo` FOREIGN KEY (`tipo_emisor`) REFERENCES `tipo_emisor` (`id_tipo_emisor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emisor`
--

LOCK TABLES `emisor` WRITE;
/*!40000 ALTER TABLE `emisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `emisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimiento`
--

DROP TABLE IF EXISTS `establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimiento` (
  `id_establecimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `afiliador` int(11) NOT NULL,
  `estado_afiliado` int(11) NOT NULL,
  `tipo_afiliado` int(11) NOT NULL,
  PRIMARY KEY (`id_establecimiento`),
  KEY `fk_establecimiento_afiliador_idx` (`afiliador`),
  KEY `fk_establecimiento_tipo_idx` (`tipo_afiliado`),
  KEY `fk_afiliado_estado_idx` (`estado_afiliado`),
  CONSTRAINT `fk_afiliado_afiliador` FOREIGN KEY (`afiliador`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_afiliado_estado` FOREIGN KEY (`estado_afiliado`) REFERENCES `estado_afiliado` (`id_estado_afiliado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_afiliado_tipo` FOREIGN KEY (`tipo_afiliado`) REFERENCES `tipo_afiliado` (`id_tipo_afiliado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimiento`
--

LOCK TABLES `establecimiento` WRITE;
/*!40000 ALTER TABLE `establecimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `establecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_afiliado`
--

DROP TABLE IF EXISTS `estado_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_afiliado` (
  `id_estado_afiliado` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_afiliado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_afiliado`
--

LOCK TABLES `estado_afiliado` WRITE;
/*!40000 ALTER TABLE `estado_afiliado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_civil` (
  `id_estado_civil` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'Soltero(a)',''),(2,'Casado(a)',''),(3,'Divorciado(a)',''),(4,'Viudo(a)','');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_lote`
--

DROP TABLE IF EXISTS `estado_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_lote` (
  `id_estado_lote` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_lote`
--

LOCK TABLES `estado_lote` WRITE;
/*!40000 ALTER TABLE `estado_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_registro_interes`
--

DROP TABLE IF EXISTS `estado_registro_interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_registro_interes` (
  `id_estado_registro_interes` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_registro_interes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_registro_interes`
--

LOCK TABLES `estado_registro_interes` WRITE;
/*!40000 ALTER TABLE `estado_registro_interes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_registro_interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_tarjeta`
--

DROP TABLE IF EXISTS `estado_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_tarjeta` (
  `id_estado_registro_tarjeta` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_registro_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_tarjeta`
--

LOCK TABLES `estado_tarjeta` WRITE;
/*!40000 ALTER TABLE `estado_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_transaccion`
--

DROP TABLE IF EXISTS `estado_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_transaccion` (
  `id_estado_transaccion` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_estado_transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_transaccion`
--

LOCK TABLES `estado_transaccion` WRITE;
/*!40000 ALTER TABLE `estado_transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Masculino',''),(2,'Femenino','');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL AUTO_INCREMENT,
  `cod_lote` varchar(45) NOT NULL,
  `establecimiento` int(11) NOT NULL,
  `no_vouchers` int(11) NOT NULL,
  `monto` decimal(20,2) NOT NULL,
  `no_cheque` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_lote`),
  KEY `fk_lote_establecimiento_idx` (`establecimiento`),
  CONSTRAINT `fk_lote_establecimiento` FOREIGN KEY (`establecimiento`) REFERENCES `establecimiento` (`id_establecimiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_interes`
--

DROP TABLE IF EXISTS `registro_interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_interes` (
  `id_registro_interes` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` int(11) NOT NULL,
  `monto` decimal(20,2) NOT NULL,
  `estado_interes` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_registro_interes`),
  KEY `fk_interes_cuenta_idx` (`cuenta`),
  KEY `fk_interes_estado_idx` (`estado_interes`),
  CONSTRAINT `fk_interes_cuenta` FOREIGN KEY (`cuenta`) REFERENCES `tarjeta` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_interes_estado` FOREIGN KEY (`estado_interes`) REFERENCES `estado_registro_interes` (`id_estado_registro_interes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_interes`
--

LOCK TABLES `registro_interes` WRITE;
/*!40000 ALTER TABLE `registro_interes` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_lote`
--

DROP TABLE IF EXISTS `registro_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_lote` (
  `id_registro_lote` int(11) NOT NULL AUTO_INCREMENT,
  `lote` int(11) NOT NULL,
  `estado_lote` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `responsable` int(11) NOT NULL,
  PRIMARY KEY (`id_registro_lote`),
  KEY `fk_lote_estado_idx` (`estado_lote`),
  KEY `fk_responsable_idx` (`responsable`),
  KEY `fk_registro_lote_lote_idx` (`lote`),
  CONSTRAINT `fk_registro_lote_estado` FOREIGN KEY (`estado_lote`) REFERENCES `estado_lote` (`id_estado_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_lote_lote` FOREIGN KEY (`lote`) REFERENCES `lote` (`id_lote`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_lote_responsable` FOREIGN KEY (`responsable`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_lote`
--

LOCK TABLES `registro_lote` WRITE;
/*!40000 ALTER TABLE `registro_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_pago`
--

DROP TABLE IF EXISTS `registro_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_pago` (
  `id_registro_pago` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta` int(11) NOT NULL,
  `monto` decimal(20,2) NOT NULL,
  `fecha_de_pago` date NOT NULL,
  PRIMARY KEY (`id_registro_pago`),
  KEY `fk_registro_pago_cuenta_idx` (`cuenta`),
  CONSTRAINT `fk_registro_pago_cuenta` FOREIGN KEY (`cuenta`) REFERENCES `tarjeta` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_pago`
--

LOCK TABLES `registro_pago` WRITE;
/*!40000 ALTER TABLE `registro_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_tarjeta`
--

DROP TABLE IF EXISTS `registro_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_tarjeta` (
  `id_registro_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `tarjeta` int(11) NOT NULL,
  `estado_tarjeta` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_registro_tarjeta`),
  KEY `fk_tarjeta_idx` (`tarjeta`),
  KEY `fk_estado_tarjeta_idx` (`estado_tarjeta`),
  CONSTRAINT `fk_estado_tarjeta` FOREIGN KEY (`estado_tarjeta`) REFERENCES `estado_tarjeta` (`id_estado_registro_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tarjeta` FOREIGN KEY (`tarjeta`) REFERENCES `tarjeta` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_tarjeta`
--

LOCK TABLES `registro_tarjeta` WRITE;
/*!40000 ALTER TABLE `registro_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Emisor','Este usuario puede generar nuevos tipos de tarjeta'),(2,'Afiliador','Gestiona los establecimientos y sus tipos'),(3,'Grabador','Usuario realmente rápido, a cargo de los lotes'),(4,'Operador','Verificación de lotes'),(5,'Gerente','Encargado de la gestión de reportes'),(6,'DBA','Administrador de la base de datos'),(7,'Administrador','Gestión de usuarios y roles'),(8,'Contador','Encargado de las finanzas en general');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `BIN` int(11) NOT NULL,
  `saldo` decimal(20,2) NOT NULL DEFAULT '0.00',
  `disponible` decimal(20,2) NOT NULL DEFAULT '0.00',
  `flotante` decimal(20,2) NOT NULL,
  `tipo_tarjeta` int(11) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `cliente` int(11) NOT NULL,
  `dia_corte` int(11) NOT NULL,
  PRIMARY KEY (`id_tarjeta`),
  UNIQUE KEY `BIN_UNIQUE` (`BIN`),
  UNIQUE KEY `cliente_UNIQUE` (`cliente`),
  KEY `fk_tarjeta_tipo_tarjeta_idx` (`tipo_tarjeta`),
  KEY `fk_tarjeta_cliente_idx` (`cliente`),
  CONSTRAINT `fk_tarjeta_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tarjeta_tipo_tarjeta` FOREIGN KEY (`tipo_tarjeta`) REFERENCES `tipo_tarjeta` (`id_tipo_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_afiliado`
--

DROP TABLE IF EXISTS `tipo_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_afiliado` (
  `id_tipo_afiliado` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_afiliado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_afiliado`
--

LOCK TABLES `tipo_afiliado` WRITE;
/*!40000 ALTER TABLE `tipo_afiliado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_atm`
--

DROP TABLE IF EXISTS `tipo_atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_atm` (
  `id_tipo_atm` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_atm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_atm`
--

LOCK TABLES `tipo_atm` WRITE;
/*!40000 ALTER TABLE `tipo_atm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_emisor`
--

DROP TABLE IF EXISTS `tipo_emisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_emisor` (
  `id_tipo_emisor` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_emisor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_emisor`
--

LOCK TABLES `tipo_emisor` WRITE;
/*!40000 ALTER TABLE `tipo_emisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_emisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_tarjeta`
--

DROP TABLE IF EXISTS `tipo_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_tarjeta` (
  `id_tipo_tarjeta` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `limite` varchar(15) NOT NULL,
  `tasa_interes` varchar(15) NOT NULL,
  `emisor` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo_tarjeta`),
  KEY `fk_tipo_tarjeta_emisor_idx` (`emisor`),
  CONSTRAINT `fk_tipo_tarjeta_emisor` FOREIGN KEY (`emisor`) REFERENCES `emisor` (`id_emisor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_tarjeta`
--

LOCK TABLES `tipo_tarjeta` WRITE;
/*!40000 ALTER TABLE `tipo_tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_transaccion`
--

DROP TABLE IF EXISTS `tipo_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_transaccion` (
  `id_tipo_transaccion` int(11) NOT NULL,
  `titulo` varchar(15) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_transaccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_transaccion`
--

LOCK TABLES `tipo_transaccion` WRITE;
/*!40000 ALTER TABLE `tipo_transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `id_autorizacion` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_pagadora` int(11) NOT NULL,
  `flotante` decimal(20,2) NOT NULL,
  `establecimiento` int(11) DEFAULT NULL,
  `atm` int(11) DEFAULT NULL,
  `cuenta_receptora` int(11) DEFAULT NULL,
  `voucher` int(11) DEFAULT NULL,
  `monto` decimal(20,2) NOT NULL,
  `cod_usuario` varchar(45) NOT NULL,
  `cod_autorizacion` int(11) DEFAULT NULL,
  `cod_rechazo` int(11) DEFAULT NULL,
  `tipo_transaccion` int(11) NOT NULL,
  `estado_transaccion` int(11) NOT NULL,
  PRIMARY KEY (`id_autorizacion`),
  KEY `fk_transaccion_cuenta_pagadora_idx` (`cuenta_pagadora`),
  KEY `fk_transaccion_establecimiento_idx` (`establecimiento`),
  KEY `fk_transaccion_atm_idx` (`atm`),
  KEY `fk_transaccion_cuenta_receptora_idx` (`cuenta_receptora`),
  KEY `fk_transaccion_tipo_idx` (`tipo_transaccion`),
  KEY `fk_transaccion_estado_idx` (`estado_transaccion`),
  CONSTRAINT `fk_transaccion_atm` FOREIGN KEY (`atm`) REFERENCES `atm` (`id_atm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_cuenta_pagadora` FOREIGN KEY (`cuenta_pagadora`) REFERENCES `tarjeta` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_cuenta_receptora` FOREIGN KEY (`cuenta_receptora`) REFERENCES `tarjeta` (`id_tarjeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_establecimiento` FOREIGN KEY (`establecimiento`) REFERENCES `establecimiento` (`id_establecimiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_estado` FOREIGN KEY (`estado_transaccion`) REFERENCES `estado_transaccion` (`id_estado_transaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_tipo` FOREIGN KEY (`tipo_transaccion`) REFERENCES `tipo_transaccion` (`id_tipo_transaccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `dpi` varchar(15) NOT NULL,
  `nit` varchar(15) DEFAULT NULL,
  `primer_nombre` varchar(15) NOT NULL,
  `segundo_nombre` varchar(15) DEFAULT NULL,
  `primer_apellido` varchar(15) NOT NULL,
  `segundo_apellido` varchar(15) DEFAULT NULL,
  `casada_apellido` varchar(15) DEFAULT NULL,
  `genero` int(11) NOT NULL,
  `estado_civil` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) NOT NULL,
  `rol` int(11) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dpi_UNIQUE` (`dpi`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_sexo_idx` (`genero`),
  KEY `fk_usuario_sexo_idx` (`genero`),
  KEY `fk_usuario_estado_civil_idx` (`estado_civil`),
  KEY `fk_usuario_rol_idx` (`rol`),
  CONSTRAINT `fk_usuario_estado_civil` FOREIGN KEY (`estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_genero` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'1696787890202','1234-56','Esvin','','González','','',1,1,'23434345','Zona 4, Mixco','usac.ing.esvux@gmail.com',1,'FIEJOF8987390JFIEJFOE792273947J9FMEIE8898');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher` (
  `id_voucher` int(11) NOT NULL AUTO_INCREMENT,
  `cod_voucher` int(11) NOT NULL,
  `cuenta` int(11) NOT NULL,
  `establecimiento` int(11) NOT NULL,
  `autorizacion` int(11) DEFAULT NULL,
  `rechazo` int(11) DEFAULT NULL,
  `monto` decimal(20,2) NOT NULL,
  `solicitante` varchar(45) NOT NULL,
  `lote` int(11) NOT NULL,
  PRIMARY KEY (`id_voucher`),
  UNIQUE KEY `cod_voucher_UNIQUE` (`cod_voucher`),
  KEY `fk_voucher_lote_idx` (`lote`),
  CONSTRAINT `fk_voucher_lote` FOREIGN KEY (`lote`) REFERENCES `lote` (`id_lote`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db2_proyecto'
--
/*!50003 DROP PROCEDURE IF EXISTS `insertar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_usuario`(in dpi varchar(15), nit varchar(15), primer_nombre varchar(15),
segundo_nombre varchar(15), primer_apellido varchar(15), segundo_apellido varchar(15), 
casada_apellido varchar(15), genero int(11), estado_civil int(11), telefono varchar(15),
direccion varchar(45), correo varchar(45), rol int(11), password varchar(250))
BEGIN
INSERT INTO usuario (dpi, nit, primer_nombre, segundo_nombre, primer_apellido, 
segundo_apellido, casada_apellido, genero, estado_civil, telefono, direccion, correo, rol, password)
VALUES (dpi, nit, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, 
casada_apellido, genero, estado_civil, telefono, direccion, correo, rol, password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-04 23:32:46
