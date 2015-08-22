/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : docencia

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-08-22 12:32:17
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
INSERT INTO `criterio` VALUES ('1.1.1', 'Existencia de las certificaciones de la institución educativa y de la habilitación de la Institución Prestadora de servicios, otorgadas por las autoridades competentes', '﻿1.1');
INSERT INTO `criterio` VALUES ('1.1.2', 'Comprobación de la especificidad del objeto de la relación docencia-servicio con respecto a los programas educativos que se propone ejecutar según los criterios adoptados para orientar su desarrollo', '﻿1.1');
INSERT INTO `criterio` VALUES ('1.1.3', 'Existencia de Instrumentos y mecanismos que permitan evaluar la concordancia entre el objeto de la relación docencia-servicio y los objetivos de los programas', '﻿1.1');
INSERT INTO `criterio` VALUES ('1.1.4', 'Opinión de los actores participantes sobre el alcance definido, el diseño y el desarrollo del plan de prácticas formativas', '﻿1.1');
INSERT INTO `criterio` VALUES ('1.1.5', 'Proporción de directivos, profesores, estudiantes y personal de las instituciones prestadoras de servicios, que conocen y comprenden los compromisos adquiridos en el objeto de la relación docencia - servicio', '﻿1.1');
INSERT INTO `criterio` VALUES ('1.1.6', 'Existencia de procesos de seguimiento y control para verificar la viabilidad y/o el cumplimiento del objeto de la relación docencia-servicio.', '﻿1.1');
INSERT INTO `criterio` VALUES ('1.2.1', 'Existencia de un plan de trabajo para concretar la realización de los programas propuestos, que incluya actividades y metas.', '1.2');
INSERT INTO `criterio` VALUES ('1.2.2', 'Proporción de directivos, profesores, estudiantes y personal de la institución prestadora de servicios, que conocen y comprenden los objetivos, alcances e implicaciones, para la relación docencia-servicio, de cada Programa a desarrollar.', '1.2');
INSERT INTO `criterio` VALUES ('1.3.1', 'Existencia del contrato o convenio, acorde con las disposiciones de la legislación vigente con respecto a contratación, incluyendo la afiliación de estudiantes al SGSSS, pólizas de responsabilidad civil y otras, establecidas por la ley, para amparar contingencias que se puedan presentar en las prácticas formativas, y los diferentes documentos de política institucional y de carácter técnico y operativo de los programas a desarrollar.', '1.3');
INSERT INTO `criterio` VALUES ('2.1.1', 'Existencia de criterios y mecanismos, definidos explícitamente para cada programa, que determinen el numero de estudiantes que pueden ser admitidos a las practicas formativas, teniendo en cuenta la capacidad instalada, la cantidad, la variedad y la complejidad de servicios', '2.1');
INSERT INTO `criterio` VALUES ('2.1.2', 'Existencia de criterios y mecanismos, definidos explícitamente en cada programa, para determinar el número de estudiantes que pueden ser admitidos en las practicas formativas, teniendo en cuenta, los derechos de los usuarios y la calidad de la prestación de servicios', '2.1');
INSERT INTO `criterio` VALUES ('2.1.3', 'Existencia de criterios y mecanismos, definidos explícitamente en cada programa para determinar el número de estudiantes que pueden ser admitidos a las prácticas formativas teniendo en cuenta las competencias profesionales que deben desarrollar los estudiantes.', '2.1');
INSERT INTO `criterio` VALUES ('2.1.4', 'Número de estudiantes que se encuentren realizando las prácticas formativas en relación con los criterios definidos para la admisión de los mismos.', '2.1');
INSERT INTO `criterio` VALUES ('2.1.5', 'Frecuencia con la cual se realizan los análisis y la revisión de los criterios definidos para determinar el número de estudiantes que pueden ser admitidos en las prácticas formativas.', '2.1');
INSERT INTO `criterio` VALUES ('2.2.1', 'Existencia de políticas y de criterios de calidad para la selección y designación de los docentes en cada conjunto de practicas formativas, teniendo en cuenta los criterios establecidos para tal fin.', '2.2');
INSERT INTO `criterio` VALUES ('2.2.2', 'Existencia de Hojas de vida de los docentes, acordes con los criterios definidos para el cumplimiento de los objetivos, las actividades y las metas de las prácticas formativas a desarrollar', '2.2');
INSERT INTO `criterio` VALUES ('2.2.3', 'Certificados que demuestran el reconocimiento académico al personal de la IPS que cumple funciones docentes y la remuneración e incentivos establecidos para los docentes.', '2.2');
INSERT INTO `criterio` VALUES ('2.2.4', 'Número, categoría y dedicación de los docentes, en relación con los criterios definidos para tal fin', '2.2');
INSERT INTO `criterio` VALUES ('2.2.5', 'Comprobación de las obligaciones docentes y de la prestación de servicios, especificadas en los contratos de trabajo del personal de la entidad educativa y de la IPS', '2.2');
INSERT INTO `criterio` VALUES ('2.3.1', 'Existencia de documento que exprese los derechos y deberes de estudiantes, docentes y personal de salud de la IPS, incluyendo políticas de bienestar y el régimen disciplinario que aplica a estos diferentes actores, en el contexto de las prácticas formativas.', '2.3');
INSERT INTO `criterio` VALUES ('2.3.2', 'Proporción de docentes, estudiantes y personal de salud, participantes en las prácticas formativas, que conocen y comprenden el reglamento para estudiantes, docentes y personal de salud, las políticas de bienestar y el régimen disciplinario correspondiente.', '2.3');
INSERT INTO `criterio` VALUES ('3.1.1', 'Pertinencia del plan de prácticas formativas respecto a las competencias profesionales a desarrollar por los estudiantes, según la naturaleza profesional u ocupacional del Programa', '3.1');
INSERT INTO `criterio` VALUES ('3.1.2', 'Porcentaje de cumplimiento de la programación de prácticas formativas establecida para el desarrollo de competencias profesionales previstas en el plan de aprendizaje.', '3.1');
INSERT INTO `criterio` VALUES ('3.1.3', 'Pertinencia de las investigaciones realizadas en relación con el plan de aprendizaje a desarrollar en las prácticas formativas', '3.1');
INSERT INTO `criterio` VALUES ('3.1.4', 'Comprobación de la utilización, en las prácticas formativas, de las normas técnicas, protocolos y guías de atención establecidas en el sistema obligatorio de garantía de la calidad', '3.1');
INSERT INTO `criterio` VALUES ('3.1.5', 'Existencia de planes de mejoramiento de normas técnicas, protocolos y guías de atención generadas como resultado de las prácticas formativas.', '3.1');
INSERT INTO `criterio` VALUES ('3.1.6', 'Existencia del Plan de delegación progresiva de responsabilidades al estudiante de acuerdo con las competencias profesionales a desarrollar e indicaciones para su aplicación.', '3.1');
INSERT INTO `criterio` VALUES ('3.1.7', 'Existencia de procesos de evaluación de las prácticas formativas en relación con las responsabilidades y compromisos establecidos en el plan de aprendizaje de los programas a desarrollar.', '3.1');
INSERT INTO `criterio` VALUES ('3.2.1', 'Opinión de estudiantes y usuarios de los servicios, sobre las metodologías utilizadas para el desarrollo de las prácticas formativas', '3.2');
INSERT INTO `criterio` VALUES ('3.2.2', 'Opinión de profesores respecto a la compatibilidad de las normas, guías y protocolos de atención, definidos en el sistema obligatorio de garantía de calidad y las técnicas de aprendizaje.', '3.2');
INSERT INTO `criterio` VALUES ('3.2.3', 'Existencia y pertinencia de unidades académicas interdisciplinarias para el manejo de necesidades y problemas de salud, en el desarrollo de las prácticas formativas.', '3.2');
INSERT INTO `criterio` VALUES ('3.2.4', 'Existencia y pertinencia de unidades académicas interdisciplinarias para el manejo de necesidades y problemas de salud, en el desarrollo de las prácticas formativas.', '3.2');
INSERT INTO `criterio` VALUES ('4.1.1', 'Conformación del equipo de dirección de la relación docencia-servicio, incluyendo las instancias y mecanismos de coordinación, en los cuales estén efectivamente representados los actores que participan en dicha relación', '4.1');
INSERT INTO `criterio` VALUES ('4.1.2', 'Existencia de atribuciones, funciones y responsabilidades del equipo de dirección, coherentes con los acuerdos institucionales que definen la relación docencia-servicio y comprobación del cumplimiento de las mismas', '4.1');
INSERT INTO `criterio` VALUES ('4.1.3', 'Opinión de directivos, profesores, estudiantes y usuarios, sobre la cultura organizacional que se percibe en el ámbito de la relación docencia servicio', '4.1');
INSERT INTO `criterio` VALUES ('4.1.4', 'Proporción de directivos, docentes, estudiantes y personal de salud, que conocen y comprenden la estructura organizacional diseñada para el desarrollo de la relación docencia-servicio.', '4.1');
INSERT INTO `criterio` VALUES ('4.2.1', 'Existencia de criterios, orientaciones y procedimientos de administración y de determinación de funciones y responsabilidades del personal que intervienen en los procesos de apoyo logístico.', '4.2');
INSERT INTO `criterio` VALUES ('4.2.2', 'Proporción de directivos, docentes y estudiantes que conocen y comprenden los procesos y procedimientos administrativos definidos', '4.2');
INSERT INTO `criterio` VALUES ('4.2.3', 'Opinión de los directivos, docentes y estudiantes, en relación con la efectividad de los procedimientos administrativos propios de la relación docenciaservicio', '4.2');
INSERT INTO `criterio` VALUES ('4.3.1', 'Existencia de acuerdos institucionales para el manejo eficiente y específico de archivos de las prácticas formativas y de mecanismos de recolección, sistematización, automatización y divulgación de la información requerida en la relación docencia-servicio.', '4.3');
INSERT INTO `criterio` VALUES ('4.3.2', 'Opinión de los diferentes actores de las prácticas formativas sobre la veracidad, oportunidad y agilidad de la entrega de información.', '4.3');
INSERT INTO `criterio` VALUES ('4.3.3', 'Existencia de mecanismos para la producción, emisión y divulgación de la comunicación generada en la relación docencia-servicio.', '4.3');
INSERT INTO `criterio` VALUES ('4.3.4', 'Opinión de los diferentes actores que intervienen en la relación docencia-servicio, respecto a la comunicación interna y externa.', '4.3');
INSERT INTO `criterio` VALUES ('4.4.1', 'Comprobación de la habilitación de la institución prestadora de servicios de salud e inspección de los espacios físicos adicionales necesarios para la docencia, según el número de estudiantes y las actividades de prácticas formativas', '4.4');
INSERT INTO `criterio` VALUES ('4.4.2', 'Opinión de docentes y estudiantes sobre la consistencia y la coherencia del uso de los espacios físicos', '4.4');
INSERT INTO `criterio` VALUES ('4.5.1', 'Existencia de información y análisis que determinen las necesidades de recursos financieros para el desarrollo de la relación docencia-servicio', '4.5');
INSERT INTO `criterio` VALUES ('4.5.2', 'Existencia de los acuerdos institucionales específicos, que deben garantizar los recursos financieros para el desarrollo de los programas.', '4.5');
INSERT INTO `criterio` VALUES ('4.5.3', 'Existencia de la asignación presupuestal y de la ejecución de los recursos comprometidos para el desarrollo de la relación docencia-servicio en cada entidad que participa en dicha relación', '4.5');
INSERT INTO `criterio` VALUES ('4.5.4', 'Opinión del equipo de dirección de la relación docencia-servicio sobre la concordancia entre las asignaciones presupuestales y los requerimientos del desarrollo de los programas en ejecución.', '4.5');
INSERT INTO `criterio` VALUES ('5.1.1', 'Existencia de un documento actualizado sobre el reconocimiento del entorno en el cual se desarrollan las actividades de la institución prestadora de servicios. En donde se llevan a cabo las prácticas formativas', '5.1');
INSERT INTO `criterio` VALUES ('5.1.2', 'Existencia de documento que presente y analice las respuestas de los programas educativos y su relación con el sistema de servicios de salud para atender las necesidades de la población', '5.1');
INSERT INTO `criterio` VALUES ('5.2.1', 'Evidencia documental de definiciones de política institucional relacionadas con las influencias de la relación docencia-servicio en el entorno y de las decisiones de actualización de dichas políticas para buscar sus mejores posibilidades de impacto en el entorno.', '5.2');
INSERT INTO `criterio` VALUES ('5.2.2', 'Comprobación de cambios en el entorno generados por actividades de las prácticas formativas, en un periodo definido, por cada uno de los programas desarrollados.', '5.2');

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
INSERT INTO `cuestionario` VALUES ('1', 'Encuesta a estudiantes');
INSERT INTO `cuestionario` VALUES ('2', 'Encuesta a Docentes');
INSERT INTO `cuestionario` VALUES ('3', 'Encuesta a Directivo IPS');

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
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.1.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.1.4.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.1.5.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.1.5.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '1.2.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.1.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.1.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.1.4');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.3.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.3.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.3.2.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '2.3.2.4');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.5.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.5.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.5.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.6.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.1.7.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.2.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.2.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '3.2.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.1.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.1.1.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.1.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.3.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.3.1.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.3.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.3.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.3.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.3.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.4.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.4.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.4.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '4.4.2.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '5.1.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '5.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('1', '5.2.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.1.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.1.4.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.1.5.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.1.5.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.2.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '1.2.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.1.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.1.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.1.4');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.1.5.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.2.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.2.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.3.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.3.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.3.2.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '2.3.2.4');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.5.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.5.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.5.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.6.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.1.7.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.2.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '3.2.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.1.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.1.1.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.1.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.2.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.3.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.3.1.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.3.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.3.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.3.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.3.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.4.1.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.4.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.4.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.4.2.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '4.5.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '5.1.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '5.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('2', '5.2.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.1.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.1.4.3');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.1.5.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.1.5.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '1.2.2.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '4.1.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '4.1.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '4.1.4.2');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '4.3.3.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '4.5.4.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '5.1.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '5.2.2.1');
INSERT INTO `cuestionario_has_pregunta` VALUES ('3', '5.2.2.2');

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `docenteid` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for encabezado
-- ----------------------------
DROP TABLE IF EXISTS `encabezado`;
CREATE TABLE `encabezado` (
  `idEncabezado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `Cuestionario_idCuestionario` int(11) NOT NULL,
  `proceso_idproceso` int(11) NOT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  `fecha` date DEFAULT NULL,
  `debilidades` varchar(2000) DEFAULT NULL,
  `fortalezas` varchar(2000) DEFAULT NULL,
  `recomendaciones` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`idEncabezado`),
  KEY `fk_resultados_Cuestionario1_idx` (`Cuestionario_idCuestionario`),
  KEY `fk_resultados_proceso1_idx` (`proceso_idproceso`),
  KEY `fk_resultados_fuente1_idx` (`fuente_idUsuario`),
  CONSTRAINT `fk_resultados_Cuestionario1` FOREIGN KEY (`Cuestionario_idCuestionario`) REFERENCES `cuestionario` (`idCuestionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultados_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of encabezado
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
  CONSTRAINT `fk_Estudiante_programa1` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estudiante_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estudiante
-- ----------------------------
INSERT INTO `estudiante` VALUES ('1', '5458128', '11', '2', '1', '73211485');
INSERT INTO `estudiante` VALUES ('8', '4526545', '5', '1', '1', '1552025');
INSERT INTO `estudiante` VALUES ('9', '4523233', '5', '1', '1', '1500545');
INSERT INTO `estudiante` VALUES ('10', '5456465', '1', '4', '1', '1656456');
INSERT INTO `estudiante` VALUES ('11', '2135845', '5', '1', '1', '1546544');
INSERT INTO `estudiante` VALUES ('12', '220710015', '7', '2', '1', '731548526');
INSERT INTO `estudiante` VALUES ('13', '45646555', '8', '4', '1', '98123484567');

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
INSERT INTO `fuente` VALUES ('1500545', 'juan', 'perez', '1500545', null);
INSERT INTO `fuente` VALUES ('1546544', 'juan', 'perez', '1546544', null);
INSERT INTO `fuente` VALUES ('1552025', 'juan', 'perez', '1552025', null);
INSERT INTO `fuente` VALUES ('1656456', '546.0', 'perez', '1656456', null);
INSERT INTO `fuente` VALUES ('731548526', 'oscqr', 'ballke', '731548526', null);
INSERT INTO `fuente` VALUES ('73211485', 'Pepo', 'LAsfd', '73211485', null);
INSERT INTO `fuente` VALUES ('98123484567', 'askdlf', 'asdf', '98123484567', null);

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
INSERT INTO `pregunta` VALUES ('1.1.4.1', '0a5', 'el plan de practicas formativas tiene un alcance definido', '', '1.1.4');
INSERT INTO `pregunta` VALUES ('1.1.4.2', '0a5', 'conozco el diseño del plan de practicas formativas', '', '1.1.4');
INSERT INTO `pregunta` VALUES ('1.1.4.3', '0a5', 'comprendo el diseño del plan de practicas formativas', '', '1.1.4');
INSERT INTO `pregunta` VALUES ('1.1.5.1', '0a5', 'conozco los compromisos adquiridos en la relación docencia-servicio', '', '1.1.5');
INSERT INTO `pregunta` VALUES ('1.1.5.2', '0a5', 'comprendo los compromisos adquiridos en la relación docencia-servicio', '', '1.1.5');
INSERT INTO `pregunta` VALUES ('1.2.1.1', '0a5', 'existe el plan de trabajo que concreta la realizacion de los programas propuestos que incluyan actividades y metas', '', '1.2.1');
INSERT INTO `pregunta` VALUES ('1.2.2.1', '0a5', 'conozco los objetivos y alcances de cada programa a desarrollar', '', '1.2.2');
INSERT INTO `pregunta` VALUES ('1.2.2.2', '0a5', 'comprendo los objetivos y alcances de cada programa a desarrollar', '', '1.2.2');
INSERT INTO `pregunta` VALUES ('2.1.1.1', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa segun la capacidad instalada', '', '2.1.1');
INSERT INTO `pregunta` VALUES ('2.1.1.2', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa segun la cantidad de servicios', '', '2.1.1');
INSERT INTO `pregunta` VALUES ('2.1.1.3', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa segun la variedad de servicios', '', '2.1.1');
INSERT INTO `pregunta` VALUES ('2.1.1.4', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa segun la complejidad de servicios', '', '2.1.1');
INSERT INTO `pregunta` VALUES ('2.1.2.1', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa teniendo en cuenta los derechos de los usuarios', '', '2.1.2');
INSERT INTO `pregunta` VALUES ('2.1.2.2', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa teniendo en cuenta la calidad de los servicios', '', '2.1.2');
INSERT INTO `pregunta` VALUES ('2.1.3.1', '0a5', 'existen criterios y mecanismos definidos explicitamente para el programa que determinan el numero de estudiantes que puedan ser admitidos en la practica formativa teniendo en cuenta las competencias profesionales que deben desarrollar los estudiantes', '', '2.1.3');
INSERT INTO `pregunta` VALUES ('2.1.4.1', '0a5', 'existen criterios entre el numero de estudiantes admitidos para las practicas formativas con los criterios y mecanismos definidos', '', '2.1.4');
INSERT INTO `pregunta` VALUES ('2.1.5.1', '0a5', 'existen mecanismos que permitan la revision periodica de los criterios y mecanismos definidos para determinar el numero de estudiantes que pueden ser admitidos en las practicas formativas', '', '2.1.5');
INSERT INTO `pregunta` VALUES ('2.2.4.1', '0a5', 'existen criterios definidos para el numero, categoria y dedicacion horaria para la asignacion de docentes a las practicas formativas', '', '2.2.4');
INSERT INTO `pregunta` VALUES ('2.2.4.2', '0a5', 'el numero, categoria y dedicacion horaria de los docentes asignados a las practicas formativas corresponde a los criterios establecidos para tal fin', '', '2.2.4');
INSERT INTO `pregunta` VALUES ('2.3.2.1', '0a5', 'se encuentra vigente el reglamento para estudiantes y docentes', '', '2.3.2');
INSERT INTO `pregunta` VALUES ('2.3.2.2', '0a5', 'los reglamentos para estudiantes y docentes expresan claramente los derechos y deberes de los mismos', '', '2.3.2');
INSERT INTO `pregunta` VALUES ('2.3.2.3', '0a5', 'se aplica el reglamentos para docentes', '', '2.3.2');
INSERT INTO `pregunta` VALUES ('2.3.2.4', '0a5', 'se aplica el reglamentos para estudiantes', '', '2.3.2');
INSERT INTO `pregunta` VALUES ('3.1.3.1', '0a5', 'las areas y las asignaturas corresponden a las necesidades de la comunidad en donde se desarrollan las practicas formativas', '', '3.1.3');
INSERT INTO `pregunta` VALUES ('3.1.4.1', '0a5', 'la atencion se ajusta a las guias y protocolos de atencion establecido en el sistema de garantia de la calidad', '', '3.1.4');
INSERT INTO `pregunta` VALUES ('3.1.5.1', '0a5', 'se actualizan las guias y protocolos de manejo con base en las necesidades del entorno', '', '3.1.5');
INSERT INTO `pregunta` VALUES ('3.1.5.2', '0a5', 'se tienen las características poblacionales propias para el establecimiento o actualizacion de las guias y protocolos de manejo', '', '3.1.5');
INSERT INTO `pregunta` VALUES ('3.1.5.3', '0a5', 'se evaluan periodicamente los criterios para la delegacion de responsabilidades a estudiantes en las practicas formativas', '', '3.1.5');
INSERT INTO `pregunta` VALUES ('3.1.6.1', '0a5', 'existe un plan progresivo de responsabilidades de los estudiantes de acuerdo con las competencias profesionales a desarrollar e indicaciones para su aplicación', '', '3.1.6');
INSERT INTO `pregunta` VALUES ('3.1.7.1', '0a5', 'existen procesos de evaluacion de las practicas formativas en relación con las responsabilidades y compromisos establecidos en el plan de aprendizajede los programas a desarrollar', '', '3.1.7');
INSERT INTO `pregunta` VALUES ('3.2.1.1', '0a5', 'las estrategias metodologicas corresponden a las exigencias del plan de estudio', '', '3.2.1');
INSERT INTO `pregunta` VALUES ('3.2.2.1', '0a5', 'la ejecucion de las guias de atencion se ajusta a las tecnicasde aprendizaje propuestas ´por el programa', '', '3.2.2');
INSERT INTO `pregunta` VALUES ('3.2.3.1', '0a5', 'las unidades academicas (rotaciones) son pertinentes y responden a las necesidades y a los problemas de salud', '', '3.2.3');
INSERT INTO `pregunta` VALUES ('3.2.4.1', '0a5', 'existen espacios academicos para el aprendizaje interdisiplinario', '', '3.2.4');
INSERT INTO `pregunta` VALUES ('4.1.1.1', '0a5', 'están representados en los equipos de direccion docente-servicio todos los actores del convenio', '', '4.1.1');
INSERT INTO `pregunta` VALUES ('4.1.1.2', '0a5', 'los equipos de direccion cumplen sus funciones', '', '4.1.1');
INSERT INTO `pregunta` VALUES ('4.1.3.1', '0a5', 'el ambiente organizacional para el desarrollo de la practica formativa es adecuado', '', '4.1.3');
INSERT INTO `pregunta` VALUES ('4.1.4.1', '0a5', 'conozco la estructura organizacional de la relación docencia-servicio', '', '4.1.4');
INSERT INTO `pregunta` VALUES ('4.1.4.2', '0a5', 'comprendo la estructura organizacional de la relación docencia-servicio', '', '4.1.4');
INSERT INTO `pregunta` VALUES ('4.2.1.1', '0a5', 'existen criterios y orientaciones para la administración del recurso humano que ejecuta el apoyo logistico en la relación docente-servicio', '', '4.2.1');
INSERT INTO `pregunta` VALUES ('4.2.2.1', '0a5', 'conozco los procesos y procedimientos administrativos que se aplican en la relación docencia-servicio', '', '4.2.2');
INSERT INTO `pregunta` VALUES ('4.3.1.1', '0a5', 'existen mecanismos de acceso a la información', '', '4.3.1');
INSERT INTO `pregunta` VALUES ('4.3.1.2', '0a5', 'se aplican estos mecanismos', '', '4.3.1');
INSERT INTO `pregunta` VALUES ('4.3.2.1', '0a5', 'es veraz la información recibida', '', '4.3.2');
INSERT INTO `pregunta` VALUES ('4.3.2.2', '0a5', 'es oportuna y agil la entrega de la información', '', '4.3.2');
INSERT INTO `pregunta` VALUES ('4.3.3.1', '0a5', 'existen mecanismos para la producción, emisión y divulgación de la información generada en la relación docencia-servicio', '', '4.3.3');
INSERT INTO `pregunta` VALUES ('4.3.4.1', '0a5', 'la información intena y externa que se origina en la relación docencia-servicio fluye de manera eficiente', '', '4.3.4');
INSERT INTO `pregunta` VALUES ('4.4.1.1', '0a5', 'existen espacios fisicos adicionales disponibles para la docencia del programa en los campos de practica', '', '4.4.1');
INSERT INTO `pregunta` VALUES ('4.4.2.1', '0a5', 'los espacios existentes están disponibles para la practica formativa', '', '4.4.2');
INSERT INTO `pregunta` VALUES ('4.4.2.2', '0a5', 'estos espacios son suficientes', '', '4.4.2');
INSERT INTO `pregunta` VALUES ('4.4.2.3', '0a5', 'estos espacios son adecuados', '', '4.4.2');
INSERT INTO `pregunta` VALUES ('4.5.4.1', '0a5', 'es acorde la asignacion presupuestal con la exigencia del programa', '', '4.5.4');
INSERT INTO `pregunta` VALUES ('5.1.2.1', '0a5', 'existe un documento donde se exprese el compromiso de los servicios de salud con la resolucion de las necesidades de la poblacion', '', '5.1.2');
INSERT INTO `pregunta` VALUES ('5.2.2.1', '0a5', 'existen indicadores que evaluen el impacto de las practicas formativas en el entorno', '', '5.2.2');
INSERT INTO `pregunta` VALUES ('5.2.2.2', '0a5', 'se han generado cambios en el entorno como consecuencia de las practicas formativas y estos cambios se miden en cada periodo del desarrollo del programa', '', '5.2.2');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proceso
-- ----------------------------
INSERT INTO `proceso` VALUES ('1', 'Proceso de Evaluacion del Escenario Hospital Universitario del Caribe', '1', '2015-07-01', '2015-12-01', 'En Ejecución');
INSERT INTO `proceso` VALUES ('2', 'ewff', '1', '2015-01-01', '2016-02-02', 'En configuracion');

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
  `idRepresentanteEscenario` int(11) NOT NULL AUTO_INCREMENT,
  `Escenario_idEscenario` int(11) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `fuente_idUsuario` varchar(15) NOT NULL,
  `proceso_idproceso` int(11) NOT NULL,
  PRIMARY KEY (`idRepresentanteEscenario`),
  KEY `fk_RepresentanteEscenario_Escenario1_idx` (`Escenario_idEscenario`),
  KEY `fk_RepresentanteEscenario_fuente1_idx` (`fuente_idUsuario`),
  KEY `fk_RepresentanteEscenario_proceso1_idx` (`proceso_idproceso`),
  CONSTRAINT `fk_RepresentanteEscenario_Escenario1` FOREIGN KEY (`Escenario_idEscenario`) REFERENCES `escenario` (`idEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RepresentanteEscenario_fuente1` FOREIGN KEY (`fuente_idUsuario`) REFERENCES `fuente` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RepresentanteEscenario_proceso1` FOREIGN KEY (`proceso_idproceso`) REFERENCES `proceso` (`idproceso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of representanteescenario
-- ----------------------------

-- ----------------------------
-- Table structure for respuestas
-- ----------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `idrespuestas` int(11) NOT NULL AUTO_INCREMENT,
  `Pregunta_idPregunta` varchar(45) NOT NULL,
  `respuesta` int(11) DEFAULT NULL,
  `encabezado_idEncabezado` int(11) NOT NULL,
  PRIMARY KEY (`idrespuestas`),
  KEY `fk_respuestas_Pregunta1_idx` (`Pregunta_idPregunta`),
  KEY `fk_respuestas_encabezado1_idx` (`encabezado_idEncabezado`),
  CONSTRAINT `fk_respuestas_Pregunta1` FOREIGN KEY (`Pregunta_idPregunta`) REFERENCES `pregunta` (`idPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuestas_encabezado1` FOREIGN KEY (`encabezado_idEncabezado`) REFERENCES `encabezado` (`idEncabezado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of respuestas
-- ----------------------------
