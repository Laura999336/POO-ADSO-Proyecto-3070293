-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(10) NOT NULL AUTO_INCREMENT,
  `usuarioid_usuario` int(10) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedido` (
  `id_detallepedido` int(10) NOT NULL AUTO_INCREMENT,
  `cantidad` int(10) NOT NULL,
  `precio_unitario` int(10) NOT NULL,
  `subtotal` int(10) NOT NULL,
  `pedidoid_pedido` int(10) NOT NULL,
  `productoid_producto` int(10) NOT NULL,
  PRIMARY KEY (`id_detallepedido`),
  KEY `fk_detallepedido_pedido` (`pedidoid_pedido`),
  CONSTRAINT `fk_detallepedido_pedido` FOREIGN KEY (`pedidoid_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedido`
--

LOCK TABLES `detallepedido` WRITE;
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `id_domicilio` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_domiciliario` varchar(45) NOT NULL,
  `tipo_vehiculo` varchar(45) NOT NULL,
  `placa_vehiculo` varchar(45) NOT NULL,
  `cantidad_pedidos` int(10) NOT NULL,
  PRIMARY KEY (`id_domicilio`),
  UNIQUE KEY `placa_vehiculo` (`placa_vehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int(10) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  `usuarioid_usuario` int(10) NOT NULL,
  `puntoventaid_puntoventa` int(10) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `cargo` (`cargo`),
  KEY `fk_empleado_usuario` (`usuarioid_usuario`),
  CONSTRAINT `fk_empleado_usuario` FOREIGN KEY (`usuarioid_usuario`) REFERENCES `usuario_p` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `id_empresa` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(45) NOT NULL,
  `nit` varchar(45) NOT NULL,
  `telefono` int(10) NOT NULL,
  `direccion` int(10) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `nombre_empresa` (`nombre_empresa`),
  UNIQUE KEY `nit` (`nit`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `direccion` (`direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int(10) NOT NULL AUTO_INCREMENT,
  `numero_factura` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `total` int(10) NOT NULL,
  `pedidoid_pedido` int(10) NOT NULL,
  `puntoventaid_puntoventa` int(10) NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_factura` (`numero_factura`),
  KEY `fk_factura_pedido` (`pedidoid_pedido`),
  KEY `fk_factura_puntoventa` (`puntoventaid_puntoventa`),
  CONSTRAINT `fk_factura_pedido` FOREIGN KEY (`pedidoid_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_factura_puntoventa` FOREIGN KEY (`puntoventaid_puntoventa`) REFERENCES `puntoventa` (`id_puntoventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int(10) NOT NULL AUTO_INCREMENT,
  `fecha_pago` varchar(45) NOT NULL,
  `monto_total` decimal(10,0) NOT NULL,
  `medio_pago` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `usuarioid_usuario` int(10) NOT NULL,
  `clienteid_cliente` int(10) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pago_usuario` (`usuarioid_usuario`),
  KEY `fk_pago_cliente` (`clienteid_cliente`),
  CONSTRAINT `fk_pago_cliente` FOREIGN KEY (`clienteid_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_pago_usuario` FOREIGN KEY (`usuarioid_usuario`) REFERENCES `usuario_p` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` datetime NOT NULL,
  `estado` varchar(45) NOT NULL,
  `usuarioid_usuario` int(10) NOT NULL,
  `puntoventaid_puntoventa` int(10) NOT NULL,
  `domicilioid_domicilio` int(10) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `estado` (`estado`),
  KEY `fk_pedido_usuario` (`usuarioid_usuario`),
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuarioid_usuario`) REFERENCES `usuario_p` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `nombre_producto` (`nombre_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntoventa`
--

DROP TABLE IF EXISTS `puntoventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntoventa` (
  `id_puntoventa` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_puntoventa` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `empresaid_empresa` int(10) NOT NULL,
  PRIMARY KEY (`id_puntoventa`),
  UNIQUE KEY `nombre_puntoventa` (`nombre_puntoventa`),
  UNIQUE KEY `direccion` (`direccion`),
  KEY `fk_puntoventa_empresa` (`empresaid_empresa`),
  CONSTRAINT `fk_puntoventa_empresa` FOREIGN KEY (`empresaid_empresa`) REFERENCES `empresa` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntoventa`
--

LOCK TABLES `puntoventa` WRITE;
/*!40000 ALTER TABLE `puntoventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntoventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id_registro` int(10) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `usuario` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_tipou` int(10) NOT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `fk_registro_tipou` (`id_tipou`),
  CONSTRAINT `fk_registro_tipou` FOREIGN KEY (`id_tipou`) REFERENCES `tipou` (`id_tipou`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'0000-00-00','lauradanielavpaez7@gmail.com','123456',NULL,1),(2,'0000-00-00','axell4550@gmail.com','789456',NULL,2),(3,'0000-00-00','lvargasp7@soy.sena.edu.co','101246',NULL,1),(4,NULL,'yryhdc@jahsid.cdds','1234567',NULL,1);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int(10) NOT NULL AUTO_INCREMENT,
  `cantidad_disponible` int(10) NOT NULL,
  `puntoventaid_puntoventa` int(10) NOT NULL,
  `productoid_producto` int(10) NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `fk_stock_puntoventa` (`puntoventaid_puntoventa`),
  CONSTRAINT `fk_stock_puntoventa` FOREIGN KEY (`puntoventaid_puntoventa`) REFERENCES `puntoventa` (`id_puntoventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipou`
--

DROP TABLE IF EXISTS `tipou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipou` (
  `id_tipou` int(10) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipou`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipou`
--

LOCK TABLES `tipou` WRITE;
/*!40000 ALTER TABLE `tipou` DISABLE KEYS */;
INSERT INTO `tipou` VALUES (1,'Cliente'),(2,'Empleado');
/*!40000 ALTER TABLE `tipou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_p`
--

DROP TABLE IF EXISTS `usuario_p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_p` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `documento` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `registroid_registro` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `telefono` (`telefono`),
  UNIQUE KEY `correo` (`correo`),
  KEY `fk_usuario_registro` (`registroid_registro`),
  CONSTRAINT `fk_usuario_registro` FOREIGN KEY (`registroid_registro`) REFERENCES `registro` (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_p`
--

LOCK TABLES `usuario_p` WRITE;
/*!40000 ALTER TABLE `usuario_p` DISABLE KEYS */;
INSERT INTO `usuario_p` VALUES (1,'Laura',NULL,'Vargas',NULL,'123456789','1245781200','lauradanielavpaez7@gmail.com',1),(2,'Cristian',NULL,'Bernal',NULL,'987654321','3659874512','axell4550@gmail.com',2),(3,'Daniela',NULL,'Paez',NULL,'012345678','2548754954','lvargasp7@soy.sena.edu.co',3),(13,'Maria','Jose','sanchez','rodriguez','125484562485','3254978625635','yryhdc@jahsid.cdds',NULL);
/*!40000 ALTER TABLE `usuario_p` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-15 17:15:01
