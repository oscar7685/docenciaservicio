/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : docencia

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-05-09 13:39:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for caracteristica
-- ----------------------------
DROP TABLE IF EXISTS `caracteristica`;
CREATE TABLE `caracteristica` (
  `idCaracteristica` varchar(45) NOT NULL,
  `nombreC` varchar(255) NOT NULL,
  `Factor_idFactor` varchar(45) NOT NULL,
  PRIMARY KEY (`idCaracteristica`),
  KEY `fk_Caracteristica_Factor1_idx` (`Factor_idFactor`),
  CONSTRAINT `fk_Caracteristica_Factor1` FOREIGN KEY (`Factor_idFactor`) REFERENCES `factor` (`idFactor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of caracteristica
-- ----------------------------
INSERT INTO `caracteristica` VALUES ('1.2', 'objetivos de la relacion docencia-servicio', '1');
INSERT INTO `caracteristica` VALUES ('1.3', 'legalizacion de los acuerdos institucionales', '1');
INSERT INTO `caracteristica` VALUES ('2.1', 'acceso de estudiantes a practicas formativas', '2');
INSERT INTO `caracteristica` VALUES ('2.2', 'docentes en las practicas formativas', '2');
INSERT INTO `caracteristica` VALUES ('2.3', 'deberes y derechos de profesores y estudiantes', '2');
INSERT INTO `caracteristica` VALUES ('3.1', 'plan de aprendizaje en las practicas formativas', '3');
INSERT INTO `caracteristica` VALUES ('3.2', 'enfoques y/o metodologias de aprendizaje', '3');
INSERT INTO `caracteristica` VALUES ('4.1', 'estructura organizacional de la relacion docencia servicio', '4');
INSERT INTO `caracteristica` VALUES ('4.2', 'procesos y procedimientos administrativos', '4');
INSERT INTO `caracteristica` VALUES ('4.3', 'sistema de informacion y comunicación', '4');
INSERT INTO `caracteristica` VALUES ('4.4', 'infraestructura fisica para la docencia-servicio', '4');
INSERT INTO `caracteristica` VALUES ('4.5', 'recursos financieros para el funcionamiento de la relacion docencia-servicio', '4');
INSERT INTO `caracteristica` VALUES ('5.1', 'reconocimiento del entorno', '5');
INSERT INTO `caracteristica` VALUES ('5.2', 'efectos de las practicas formativas en el entorno', '5');
INSERT INTO `caracteristica` VALUES ('﻿1.1', 'objeto y alcance de la relacion docencia-servicio', '1');

-- ----------------------------
-- Table structure for criterio
-- ----------------------------
DROP TABLE IF EXISTS `criterio`;
CREATE TABLE `criterio` (
  `idCriterio` varchar(45) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `Caracteristica_idCaracteristica` varchar(45) NOT NULL,
  PRIMARY KEY (`idCriterio`),
  KEY `fk_Criterio_Caracteristica1_idx` (`Caracteristica_idCaracteristica`),
  CONSTRAINT `fk_Criterio_Caracteristica1` FOREIGN KEY (`Caracteristica_idCaracteristica`) REFERENCES `caracteristica` (`idCaracteristica`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of criterio
-- ----------------------------

-- ----------------------------
-- Table structure for cuestionario
-- ----------------------------
DROP TABLE IF EXISTS `cuestionario`;
CREATE TABLE `cuestionario` (
  `idCuestionario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCuestionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cuestionario
-- ----------------------------

-- ----------------------------
-- Table structure for cuestionario_has_pregunta
-- ----------------------------
DROP TABLE IF EXISTS `cuestionario_has_pregunta`;
CREATE TABLE `cuestionario_has_pregunta` (
  `Cuestionario_idCuestionario` int(11) NOT NULL,
  `Pregunta_idPregunta` varchar(45) NOT NULL,
  PRIMARY KEY (`Cuestionario_idCuestionario`,`Pregunta_idPregunta`),
  KEY `fk_Cuestionario_has_Pregunta_Pregunta1_idx` (`Pregunta_idPregunta`),
  KEY `fk_Cuestionario_has_Pregunta_Cuestionario1_idx` (`Cuestionario_idCuestionario`),
  CONSTRAINT `fk_Cuestionario_has_Pregunta_Cuestionario1` FOREIGN KEY (`Cuestionario_idCuestionario`) REFERENCES `cuestionario` (`idCuestionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuestionario_has_Pregunta_Pregunta1` FOREIGN KEY (`Pregunta_idPregunta`) REFERENCES `pregunta` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cuestionario_has_pregunta
-- ----------------------------

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `docenteid` int(11) NOT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `tipo_contrato` varchar(45) DEFAULT NULL,
  `proceso_idproceso` int(11) NOT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  PRIMARY KEY (`docenteid`),
  KEY `fk_docente_programa1_idx` (`programa_idprograma`),
  KEY `fk_docente_proceso1_idx` (`proceso_idproceso`),
  KEY `fk_docente_fuente1_idx` (`fuente_idUsuario`),
  CONSTRAINT `fk_docente_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_docente_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of docente
-- ----------------------------

-- ----------------------------
-- Table structure for escenario
-- ----------------------------
DROP TABLE IF EXISTS `escenario`;
CREATE TABLE `escenario` (
  `idEscenario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEscenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of escenario
-- ----------------------------
INSERT INTO `escenario` VALUES ('1', 'Hospital Universitario de Caribe', 'Zaragocilla', '6748547', '56456465');

-- ----------------------------
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEstudiante` int(11) NOT NULL,
  `semestre` varchar(45) NOT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `proceso_idproceso` int(11) NOT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Estudiante_programa1_idx` (`programa_idprograma`),
  KEY `fk_Estudiante_proceso1_idx` (`proceso_idproceso`),
  KEY `fk_Estudiante_fuente1_idx` (`fuente_idUsuario`),
  CONSTRAINT `fk_Estudiante_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estudiante
-- ----------------------------

-- ----------------------------
-- Table structure for factor
-- ----------------------------
DROP TABLE IF EXISTS `factor`;
CREATE TABLE `factor` (
  `idFactor` varchar(45) NOT NULL,
  `nombreF` varchar(255) NOT NULL,
  PRIMARY KEY (`idFactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of factor
-- ----------------------------
INSERT INTO `factor` VALUES ('1', 'Definición de la relación docencia servicio');
INSERT INTO `factor` VALUES ('2', 'Estudiantes y profesores en las prácticas formativas');
INSERT INTO `factor` VALUES ('3', 'Procesos Académicos');
INSERT INTO `factor` VALUES ('4', 'Organización, administracion y recursos para las practicas formativas');
INSERT INTO `factor` VALUES ('5', 'Practicas formativas y su relacion con el entorno');

-- ----------------------------
-- Table structure for fuente
-- ----------------------------
DROP TABLE IF EXISTS `fuente`;
CREATE TABLE `fuente` (
  `idUsuario` varchar(15) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fuente
-- ----------------------------
INSERT INTO `fuente` VALUES ('123456', 'Administrador', 'x', '123456', 'Administrador');

-- ----------------------------
-- Table structure for pregunta
-- ----------------------------
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE `pregunta` (
  `idPregunta` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `enunciado` varchar(500) DEFAULT NULL,
  `otro` varchar(45) DEFAULT NULL,
  `Criterio_idCriterio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `fk_Pregunta_Criterio1_idx` (`Criterio_idCriterio`),
  CONSTRAINT `fk_Pregunta_Criterio1` FOREIGN KEY (`Criterio_idCriterio`) REFERENCES `criterio` (`idCriterio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pregunta
-- ----------------------------

-- ----------------------------
-- Table structure for proceso
-- ----------------------------
DROP TABLE IF EXISTS `proceso`;
CREATE TABLE `proceso` (
  `idproceso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionp` varchar(500) NOT NULL,
  `Escenario_idEscenario` int(11) NOT NULL,
  `fechai` date DEFAULT NULL,
  `fechaf` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproceso`),
  KEY `fk_proceso_Escenario1_idx` (`Escenario_idEscenario`),
  CONSTRAINT `fk_proceso_Escenario1` FOREIGN KEY (`Escenario_idEscenario`) REFERENCES `escenario` (`idEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceso
-- ----------------------------
INSERT INTO `proceso` VALUES ('1', 'saefs', '1', '2015-01-01', '2016-05-01', 'En configuracion');

-- ----------------------------
-- Table structure for proceso_has_fuente
-- ----------------------------
DROP TABLE IF EXISTS `proceso_has_fuente`;
CREATE TABLE `proceso_has_fuente` (
  `proceso_idproceso` int(11) NOT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  PRIMARY KEY (`proceso_idproceso`,`fuente_idUsuario`),
  KEY `fk_proceso_has_fuente_fuente1_idx` (`fuente_idUsuario`),
  KEY `fk_proceso_has_fuente_proceso1_idx` (`proceso_idproceso`),
  CONSTRAINT `fk_proceso_has_fuente_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_has_fuente_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceso_has_fuente
-- ----------------------------

-- ----------------------------
-- Table structure for programa
-- ----------------------------
DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `idprograma` int(11) NOT NULL,
  `nombrepro` varchar(255) NOT NULL,
  `metodologia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of programa
-- ----------------------------
INSERT INTO `programa` VALUES ('1', 'quimica farmaceutica', 'presencial');
INSERT INTO `programa` VALUES ('2', 'medicina', 'presencial');
INSERT INTO `programa` VALUES ('3', 'odontologia', 'presencial');
INSERT INTO `programa` VALUES ('4', 'enfermeria', 'presencial');

-- ----------------------------
-- Table structure for representanteescenario
-- ----------------------------
DROP TABLE IF EXISTS `representanteescenario`;
CREATE TABLE `representanteescenario` (
  `idRepresentanteEscenario` int(11) NOT NULL,
  `Escenario_idEscenario` int(11) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  PRIMARY KEY (`idRepresentanteEscenario`),
  KEY `fk_RepresentanteEscenario_Escenario1_idx` (`Escenario_idEscenario`),
  KEY `fk_RepresentanteEscenario_fuente1_idx` (`fuente_idUsuario`),
  CONSTRAINT `fk_RepresentanteEscenario_Escenario1` FOREIGN KEY (`Escenario_idEscenario`) REFERENCES `escenario` (`idEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RepresentanteEscenario_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of representanteescenario
-- ----------------------------

-- ----------------------------
-- Table structure for resultados
-- ----------------------------
DROP TABLE IF EXISTS `resultados`;
CREATE TABLE `resultados` (
  `idResultados` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `respuesta` varchar(2000) NOT NULL,
  `Pregunta_idPregunta` varchar(45) NOT NULL,
  `Cuestionario_idCuestionario` int(11) NOT NULL,
  `proceso_idproceso` int(11) NOT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  PRIMARY KEY (`idResultados`),
  KEY `fk_resultados_Pregunta1_idx` (`Pregunta_idPregunta`),
  KEY `fk_resultados_Cuestionario1_idx` (`Cuestionario_idCuestionario`),
  KEY `fk_resultados_proceso1_idx` (`proceso_idproceso`),
  KEY `fk_resultados_fuente1_idx` (`fuente_idUsuario`),
  CONSTRAINT `fk_resultados_Pregunta1` FOREIGN KEY (`Pregunta_idPregunta`) REFERENCES `pregunta` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_Cuestionario1` FOREIGN KEY (`Cuestionario_idCuestionario`) REFERENCES `cuestionario` (`idCuestionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resultados
-- ----------------------------
