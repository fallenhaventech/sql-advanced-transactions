/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `bd_taxis_fase4_rodolfocoelho` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_taxis_fase4_rodolfocoelho`;

CREATE TABLE IF NOT EXISTS `abastecimento` (
  `id_abastecimento` int NOT NULL AUTO_INCREMENT,
  `id_taxi` int NOT NULL,
  `id_combustivel` int NOT NULL,
  `data_abastecimento` datetime NOT NULL,
  `quantidade` float NOT NULL,
  `custo_total` float NOT NULL,
  `quilometragem` float NOT NULL,
  PRIMARY KEY (`id_abastecimento`),
  KEY `fk_abastecimento_taxi_idx` (`id_taxi`),
  KEY `fk_abastecimento_combustivel_idx` (`id_combustivel`),
  CONSTRAINT `fk_abastecimento_combustivel` FOREIGN KEY (`id_combustivel`) REFERENCES `combustivel` (`id_combustivel`),
  CONSTRAINT `fk_abastecimento_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id_taxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nif` int unsigned DEFAULT NULL,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'INDIFERENCIADO',
  `morada` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `nif_UNIQUE` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `cliente` (`id_cliente`, `nif`, `nome`, `morada`, `telefone`) VALUES
	(1, 999999998, 'INDIFERENCIADO', NULL, NULL),
	(2, 203006001, 'Luís Mendes Silva', 'Rua das Oliveiras 12, Porto', 911111111),
	(3, 130470845, 'Carla Teixeira Alves', 'Avenida dos Aliados 34, Porto', 922222222),
	(4, 174500003, 'Paulo Jorge Monteiro', 'Rua da Alegria 56, Coimbra', 933333333),
	(5, 304070004, 'Diana Margarida Lopes', 'Praça do Marquês 78, Braga', 944444444),
	(6, 294090405, 'Hugo Filipe Barbosa', 'Rua do Alecrim 90, Faro', 955555555),
	(7, 100000006, 'Sandra Maria Tavares', 'Avenida da Boavista 123, Porto', 966666666),
	(8, 100000007, 'Bruno Miguel Neves', 'Rua do Ouro 45, Lisboa', 977777777),
	(9, 100000008, 'Tânia Alexandra Moreira', 'Rua de Camões 67, Aveiro', 988888888),
	(10, 100000009, 'José Carlos Matos', 'Praça do Comércio 89, Lisboa', 999999999),
	(11, 100000010, 'Marta Isabel Ramos', 'Rua de Santa Maria 101, Guimarães', 910101010),
	(12, 100000011, 'André Duarte Pinho', 'Avenida da República 202, Porto', 921212121),
	(13, 100000012, 'Patrícia Daniela Vieira', 'Rua do Salitre 303, Lisboa', 932323232),
	(14, 100000013, 'Nuno Ricardo Fonseca', 'Rua dos Clérigos 404, Porto', 943434343),
	(15, 100000014, 'Cristina Sofia Magalhães', 'Praça do Giraldo 505, Évora', 954545454),
	(16, 100000015, 'Rui Manuel Cardoso', 'Rua Direita 606, Viseu', 965656565),
	(17, NULL, 'John Smith', 'Oxford Street 123, London', 447654321),
	(18, NULL, 'Marie Dubois', 'Rue de Rivoli 456, Paris', 331234567),
	(19, NULL, 'Carlos Rodriguez', 'Gran Vía 789, Madrid', 349876543),
	(27, 2955347334, 'Leticia Leal', NULL, 937598478),
	(28, 123456789, 'Rodolfo', '', 963877243);

CREATE TABLE IF NOT EXISTS `combustivel` (
  `id_combustivel` int NOT NULL AUTO_INCREMENT,
  `combustivel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preco_unit` float DEFAULT NULL,
  PRIMARY KEY (`id_combustivel`),
  UNIQUE KEY `combustivel_UNIQUE` (`combustivel`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `combustivel` (`id_combustivel`, `combustivel`, `preco_unit`) VALUES
	(1, 'Gasóleo', 1.6),
	(2, 'Gasolina', 1.74),
	(3, 'Gás', 0.89),
	(4, 'Elétrico', 0.12),
	(5, 'Hibrido', 0.75),
	(6, 'Biomassa', 0.05);

CREATE TABLE IF NOT EXISTS `despesa` (
  `id_despesa` int NOT NULL AUTO_INCREMENT,
  `id_taxi` int DEFAULT NULL,
  `tipo_despesa` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `data_despesa` date NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id_despesa`),
  KEY `fk_despesa_taxi_idx` (`id_taxi`),
  CONSTRAINT `fk_despesa_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id_taxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `empregado` (
  `id_empregado` int NOT NULL AUTO_INCREMENT,
  `nif` int DEFAULT NULL,
  `nome` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cartao_cidadao` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `validade_cc` date DEFAULT NULL,
  `niss` bigint DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `carta_conducao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `validade_c_cond` date DEFAULT NULL,
  `morada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cod_postal` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_empregado`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  UNIQUE KEY `carta_conducao_UNIQUE` (`carta_conducao`),
  UNIQUE KEY `niss_UNIQUE` (`niss`),
  UNIQUE KEY `cartao_cidadao_UNIQUE` (`cartao_cidadao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `empregado` (`id_empregado`, `nif`, `nome`, `cartao_cidadao`, `validade_cc`, `niss`, `telefone`, `carta_conducao`, `validade_c_cond`, `morada`, `cod_postal`) VALUES
	(1, 123456789, 'João Silva Santos', '12345678AB1', '2027-05-15', 12345617890, 912345678, 'A123456789012', '2028-03-20', 'Rua do Comércio 123, Lisboa', '1100-123'),
	(2, 234567890, 'Maria Fernandes Costa', '23456789BC2', '2026-11-30', 13435637891, 923456789, 'B234567890123', '2027-09-12', 'Avenida da Liberdade 45, Lisboa', '1250-145'),
	(3, 198765432, 'Carlos Oliveira Martins', '34567890CD3', '2028-02-14', 16346673892, 934567890, 'C345678901234', '2029-01-05', 'Rua Garrett 67, Lisboa', '1200-167'),
	(4, 187654321, 'Ana Rodrigues Sousa', '45678901DE4', '2027-07-22', 11344567893, 945678901, 'D456789012345', '2028-06-18', 'Avenida Fontes Pereira de Melo 89, Lisboa', '1050-089'),
	(5, 176543219, 'Miguel Almeida Pereira', '56789012EF5', '2026-09-10', 12357964086, 956789012, 'E567890123456', '2027-08-25', 'Rua Castilho 12, Lisboa', '1250-012'),
	(6, 165432198, 'Sofia Carvalho Gomes', '67890123FG6', '2028-04-05', 14537657890, 967890123, 'F678901234567', '2029-03-15', 'Avenida da República 34, Lisboa', '1050-034'),
	(7, 154321987, 'Pedro Costa Lima', '78901234GH7', '2027-12-18', 15345077896, 978901234, 'G789012345678', '2024-11-08', 'Rua do Alecrim 56, Lisboa', '1200-156'),
	(8, 143219876, 'Inês Santos Ferreira', '89012345HI8', '2026-08-03', 13456757897, 989012345, 'H890123456789', '2027-07-22', 'Avenida Engenheiro Duarte Pacheco 78, Lisboa', '1070-178'),
	(9, 132198765, 'Ricardo Martins Dias', '90123456IJ9', '2028-01-25', 17234560808, 990123456, 'I901234567890', '2029-12-30', 'Rua das Amoreiras 90, Lisboa', '1250-190'),
	(10, 121987654, 'Catarina Oliveira Pinto', '11223344JK0', '2027-06-12', 18349867889, 991234567, 'J112233445566', '2028-05-17', 'Avenida Infante Santo 23, Lisboa', '1350-123'),
	(11, 219876543, 'Tiago Fernandes Nunes', '22334455KL1', '2026-10-28', 14585666800, 992345678, 'K223344556677', '2022-09-14', 'Rua do Salitre 45, Lisboa', '1269-145'),
	(12, 298765432, 'Beatriz Sousa Rocha', '33445566LM2', '2028-03-07', 12445788167, 993456789, 'L334455667788', '2029-02-19', 'Praça do Príncipe Real 67, Lisboa', '1250-167'),
	(13, 295534737, 'Leticia Leal', '6861254632', '2026-01-15', 12345678998, 968754212, 'jkhgjkfdhshs', '2027-01-14', 'lajkjrgjjg', '2457-245'),
	(14, 208526323, 'Rodolfo Coelho', '11429427', '2030-09-11', 11332122211, 963877243, 'L123456', '2030-07-30', 'Cascais', '2755-214'),
	(16, 123446789, 'kjgflkjfl', 'kjflkjflj', '2002-02-02', 1231354646, 131321564, 'ffewff', '2002-02-02', 'lkqlfk', 'ddddqd');

CREATE TABLE IF NOT EXISTS `faturas` (
  `id_fatura` int NOT NULL AUTO_INCREMENT,
  `id_viagem` int NOT NULL,
  `id_cliente` int NOT NULL,
  `data_fatura` date DEFAULT NULL,
  `valor_viagem` float DEFAULT NULL,
  PRIMARY KEY (`id_fatura`),
  KEY `id_viagem` (`id_viagem`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `faturas_ibfk_1` FOREIGN KEY (`id_viagem`) REFERENCES `viagens` (`id_viagem`),
  CONSTRAINT `faturas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `faturas` (`id_fatura`, `id_viagem`, `id_cliente`, `data_fatura`, `valor_viagem`) VALUES
	(2, 56, 2, '2025-09-01', 0);

CREATE TABLE IF NOT EXISTS `faturassemnif` (
  `id_fatura` int NOT NULL AUTO_INCREMENT,
  `id_viagem` int NOT NULL,
  `data_fatura` date DEFAULT NULL,
  `valor_viagem` float DEFAULT NULL,
  PRIMARY KEY (`id_fatura`),
  KEY `id_viagem` (`id_viagem`),
  CONSTRAINT `faturassemnif_ibfk_1` FOREIGN KEY (`id_viagem`) REFERENCES `viagens` (`id_viagem`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `historico_faturas` (
  `id_historico` int NOT NULL AUTO_INCREMENT,
  `id_fatura` int DEFAULT NULL,
  `id_viagem` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `data_fatura` date DEFAULT NULL,
  `valor_viagem` float DEFAULT NULL,
  `data_eliminacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `historico_faturas` (`id_historico`, `id_fatura`, `id_viagem`, `id_cliente`, `data_fatura`, `valor_viagem`, `data_eliminacao`) VALUES
	(1, 1, 55, 4, '2025-09-10', 203.5, '2025-09-10 19:20:55'),
	(2, 1, 54, 1, '2025-08-10', 17.1, '2025-09-10 19:24:50');

CREATE TABLE IF NOT EXISTS `logs` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_log` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `logs` (`id_log`, `mensagem`, `data_log`) VALUES
	(1, 'Cliente Leticia Leal inserido sem morada', '2025-09-10 18:40:28'),
	(2, 'Taxi 37-RX-19 inserido sem data de matrícula', '2025-09-10 19:29:23'),
	(3, 'Taxi AC-34-56 atualizado com preço por km zero', '2025-09-10 19:30:13'),
	(4, 'Viagem 49 atualizada com quilómetros zero', '2025-09-10 19:31:05'),
	(5, 'Viagem 44 atualizada com quilómetros zero', '2025-09-10 19:31:05'),
	(6, 'Viagem 56 inserida com quilómetros zero', '2025-09-10 19:33:40'),
	(7, 'Taxi 37-RX-19 atualizado sem data de matrícula', '2025-09-10 19:38:21'),
	(8, 'Taxi 37-RX-19 atualizado com preço por km zero', '2025-09-10 19:38:21');

CREATE TABLE IF NOT EXISTS `manutencao` (
  `id_manutencao` int NOT NULL AUTO_INCREMENT,
  `id_taxi` int NOT NULL,
  `data_manutencao` date NOT NULL,
  `tipo_manutencao` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `custo` float NOT NULL,
  `proxima_manutencao` date DEFAULT NULL,
  PRIMARY KEY (`id_manutencao`),
  KEY `fk_manutencao_taxi_idx` (`id_taxi`),
  CONSTRAINT `fk_manutencao_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id_taxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `modelo` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modelo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumo` float DEFAULT NULL,
  `id_combustivel` int DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `fk_id_combustivel_idx` (`id_combustivel`),
  CONSTRAINT `fk_id_combustivel` FOREIGN KEY (`id_combustivel`) REFERENCES `combustivel` (`id_combustivel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `modelo` (`id_modelo`, `marca`, `modelo`, `consumo`, `id_combustivel`) VALUES
	(1, 'Renault', 'Megane SW', 4.5, 1),
	(2, 'Mercedes', 'C160', 6.5, 5),
	(3, 'Dacia', 'Duster', 8.5, 2),
	(4, 'Tesla', 'Model Y', 3.5, 4),
	(5, 'Toyota', 'Prius', 0.25, 5);

CREATE TABLE IF NOT EXISTS `multa` (
  `id_multa` int NOT NULL AUTO_INCREMENT,
  `id_taxi` int NOT NULL,
  `data_multa` date NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` float NOT NULL,
  `pontos` int DEFAULT '0',
  `paga` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_multa`),
  KEY `fk_multa_taxi_idx` (`id_taxi`),
  CONSTRAINT `fk_multa_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id_taxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `taxi` (
  `id_taxi` int NOT NULL AUTO_INCREMENT,
  `matricula` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  `prox_inspecao` date DEFAULT NULL,
  `id_empregado` int DEFAULT NULL,
  `preco_por_km` float DEFAULT '0.5',
  `quilometragem_total` float DEFAULT '0',
  PRIMARY KEY (`id_taxi`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  UNIQUE KEY `id_empregado_UNIQUE` (`id_empregado`),
  KEY `fd_id_modelo_idx` (`id_modelo`),
  KEY `fk_id_empregado_idx` (`id_empregado`),
  CONSTRAINT `fk_id_empregado` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id_empregado`),
  CONSTRAINT `fk_id_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `taxi` (`id_taxi`, `matricula`, `id_modelo`, `data_matricula`, `prox_inspecao`, `id_empregado`, `preco_por_km`, `quilometragem_total`) VALUES
	(1, 'AA-12-34', 1, '2022-01-15', '2025-10-15', 1, 0.5, 0),
	(2, 'AB-23-45', 1, '2022-03-20', '2026-01-02', 2, 0.5, 0),
	(3, 'AC-34-56', 2, '2021-11-10', '2027-05-24', 3, 0, 0),
	(4, 'AD-45-67', 2, '2023-02-05', '2025-09-30', 4, 0.5, 0),
	(5, 'AE-56-78', 3, '2020-08-12', '2027-06-25', 5, 0.5, 0),
	(6, 'AF-67-89', 3, '2023-05-18', '2025-12-30', 6, 0.5, 0),
	(7, 'AG-78-90', 4, '2024-01-10', '2028-08-14', 7, 0.5, 0),
	(8, 'AH-89-01', 4, '2024-03-22', '2029-12-01', 8, 0.5, 0),
	(9, 'AI-90-12', 1, '2022-09-30', '2026-06-11', 9, 0.5, 0),
	(10, 'AJ-01-23', 2, '2021-12-25', '2025-11-12', 10, 0.5, 0),
	(11, 'AK-12-34', 3, '2023-07-14', '2026-05-15', 11, 0.5, 0),
	(12, 'AL-23-45', 4, '2024-02-08', '2027-04-12', 12, 0.5, 0),
	(15, '12-jh-87', 2, '2024-10-12', '2028-10-12', 13, 0.58, 0),
	(17, '37-RX-19', 5, NULL, NULL, 14, 0, 0);

CREATE TABLE IF NOT EXISTS `turno` (
  `id_turno` int NOT NULL AUTO_INCREMENT,
  `id_empregado` int NOT NULL,
  `data_turno` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time DEFAULT NULL,
  `horas_trabalhadas` float GENERATED ALWAYS AS (timestampdiff(HOUR,`hora_inicio`,`hora_fim`)) STORED,
  PRIMARY KEY (`id_turno`),
  KEY `fk_turno_empregado_idx` (`id_empregado`),
  CONSTRAINT `fk_turno_empregado` FOREIGN KEY (`id_empregado`) REFERENCES `empregado` (`id_empregado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `viagens` (
  `id_viagem` int NOT NULL AUTO_INCREMENT,
  `hora_data_inicio` datetime NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_taxi` int NOT NULL,
  `morada_origem` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `morada_destino` varchar(145) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hora_data_fim` datetime NOT NULL,
  `valor_viagem` float DEFAULT NULL,
  `estimativa_combustivel_gasto` float DEFAULT NULL,
  `distancia_km` float DEFAULT NULL,
  `preco_por_km_na_viagem` float DEFAULT '0.5',
  `custo_combustivel_por_km` float DEFAULT NULL,
  PRIMARY KEY (`id_viagem`),
  KEY `id_cliente_idx` (`id_cliente`),
  KEY `fk_id_taxi_idx` (`id_taxi`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_id_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id_taxi`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `viagens` (`id_viagem`, `hora_data_inicio`, `id_cliente`, `id_taxi`, `morada_origem`, `morada_destino`, `hora_data_fim`, `valor_viagem`, `estimativa_combustivel_gasto`, `distancia_km`, `preco_por_km_na_viagem`, `custo_combustivel_por_km`) VALUES
	(1, '2024-09-01 08:15:00', 2, 1, 'Aeroporto Humberto Delgado, Lisboa', 'Rua do Comércio 123, Lisboa', '2024-09-01 08:45:00', 15.25, 1.2, 26.6667, 0.5, 0.072),
	(2, '2024-09-01 09:30:00', 3, 2, 'Estação do Oriente, Lisboa', 'Avenida da Liberdade 45, Lisboa', '2024-09-01 09:55:00', 11.44, 0.9, 20, 0.5, 0.072),
	(3, '2024-09-01 10:45:00', 4, 3, 'Praça do Comércio, Lisboa', 'Cascais Shopping, Cascais', '2024-09-01 11:30:00', 17.73, 2.1, 32.3077, 0.5, 0.0488),
	(4, '2024-09-01 12:15:00', 5, 4, 'Hospital de Santa Maria, Lisboa', 'Estádio da Luz, Lisboa', '2024-09-01 12:45:00', 8.44, 1, 15.3846, 0.5, 0.0488),
	(5, '2024-09-01 14:20:00', 6, 5, 'Centro Comercial Colombo, Lisboa', 'Praça de Espanha, Lisboa', '2024-09-01 14:50:00', 6.1, 0.8, 9.41177, 0.5, 0.1479),
	(6, '2024-09-01 16:05:00', 7, 6, 'Amoreiras, Lisboa', 'Parque das Nações, Lisboa', '2024-09-01 16:40:00', 8.38, 1.1, 12.9412, 0.5, 0.1479),
	(7, '2024-09-01 17:50:00', 8, 7, 'Campo Pequeno, Lisboa', 'Alfama, Lisboa', '2024-09-01 18:20:00', 12.97, 0.9, 25.7143, 0.5, 0.0042),
	(8, '2024-09-01 19:30:00', 9, 8, 'Cais do Sodré, Lisboa', 'Bairro Alto, Lisboa', '2024-09-01 19:45:00', 8.64, 0.6, 17.1429, 0.5, 0.0042),
	(9, '2024-09-02 08:10:00', 10, 9, 'Estação de Sete Rios, Lisboa', 'Fundação Calouste Gulbenkian, Lisboa', '2024-09-02 08:35:00', 10.17, 0.8, 17.7778, 0.5, 0.072),
	(10, '2024-09-02 09:45:00', 11, 10, 'Monsanto, Lisboa', 'Docas de Santo Amaro, Lisboa', '2024-09-02 10:20:00', 10.98, 1.3, 20, 0.5, 0.0488),
	(11, '2024-09-02 11:30:00', 12, 11, 'Estação de Campolide, Lisboa', 'Museu Nacional do Azulejo, Lisboa', '2024-09-02 12:05:00', 6.86, 0.9, 10.5882, 0.5, 0.1479),
	(12, '2024-09-02 13:20:00', 13, 12, 'Praça do Marquês de Pombal, Lisboa', 'Feira da Ladra, Lisboa', '2024-09-02 13:50:00', 11.52, 0.8, 22.8571, 0.5, 0.0042),
	(13, '2024-09-02 15:15:00', 14, 1, 'Hospital Curry Cabral, Lisboa', 'Centro Cultural de Belém, Lisboa', '2024-09-02 15:50:00', 13.98, 1.1, 24.4444, 0.5, 0.072),
	(14, '2024-09-02 17:05:00', 15, 2, 'El Corte Inglés, Lisboa', 'Museu Nacional de Arte Antiga, Lisboa', '2024-09-02 17:35:00', 11.44, 0.9, 20, 0.5, 0.072),
	(15, '2024-09-02 19:20:00', 16, 3, 'Estação do Rossio, Lisboa', 'Miradouro da Senhora do Monte, Lisboa', '2024-09-02 19:45:00', 5.91, 0.7, 10.7692, 0.5, 0.0488),
	(16, '2024-09-03 07:45:00', 17, 4, 'Hotel Tivoli, Lisboa', 'Aeroporto Humberto Delgado, Lisboa', '2024-09-03 08:20:00', 11.82, 1.4, 21.5385, 0.5, 0.0488),
	(17, '2024-09-03 09:30:00', 18, 5, 'Hotel Mundial, Lisboa', 'Castelo de São Jorge, Lisboa', '2024-09-03 10:00:00', 6.86, 0.9, 10.5882, 0.5, 0.1479),
	(18, '2024-09-03 11:15:00', 1, 6, 'Hotel Sheraton, Lisboa', 'Oceanário de Lisboa, Lisboa', '2024-09-03 11:50:00', 9.15, 1.2, 14.1176, 0.5, 0.1479),
	(19, '2024-09-03 13:40:00', 1, 7, 'Avenida da República, Lisboa', 'Estação Ferroviária do Cais do Sodré, Lisboa', '2024-09-03 14:10:00', 11.52, 0.8, 22.8571, 0.5, 0.0042),
	(20, '2024-09-03 15:25:00', 2, 8, 'Museu do Design e da Moda, Lisboa', 'Cristo Rei, Almada', '2024-09-03 16:15:00', 25.93, 1.8, 51.4286, 0.5, 0.0042),
	(21, '2024-09-03 17:30:00', 3, 9, 'Ponte 25 de Abril, Lisboa', 'Costa da Caparica', '2024-09-03 18:20:00', 26.69, 2.1, 46.6667, 0.5, 0.072),
	(22, '2024-09-03 19:45:00', 4, 10, 'Estádio José Alvalade, Lisboa', 'Loures', '2024-09-03 20:30:00', 12.66, 1.5, 23.0769, 0.5, 0.0488),
	(23, '2024-09-04 08:00:00', 5, 11, 'Queluz', 'Sintra', '2024-09-04 08:40:00', 9.15, 1.2, 14.1176, 0.5, 0.1479),
	(24, '2024-09-04 09:50:00', 6, 12, 'Oeiras', 'Carcavelos', '2024-09-04 10:20:00', 12.97, 0.9, 25.7143, 0.5, 0.0042),
	(25, '2024-09-04 11:35:00', 7, 1, 'Estoril', 'Cascais', '2024-09-04 12:05:00', 10.17, 0.8, 17.7778, 0.5, 0.072),
	(26, '2024-09-04 13:20:00', 8, 2, 'Almada', 'Seixal', '2024-09-04 14:00:00', 13.98, 1.1, 24.4444, 0.5, 0.072),
	(27, '2024-09-04 15:10:00', 9, 3, 'Barreiro', 'Setúbal', '2024-09-04 16:05:00', 16.04, 1.9, 29.2308, 0.5, 0.0488),
	(28, '2024-09-04 17:25:00', 10, 4, 'Palmela', 'Montijo', '2024-09-04 18:15:00', 13.51, 1.6, 24.6154, 0.5, 0.0488),
	(29, '2024-09-04 19:40:00', 11, 5, 'Alcochete', 'Samora Correia', '2024-09-04 20:45:00', 17.53, 2.3, 27.0588, 0.5, 0.1479),
	(30, '2024-09-05 07:55:00', 12, 6, 'Vila Franca de Xira', 'Azambuja', '2024-09-05 08:50:00', 15.24, 2, 23.5294, 0.5, 0.1479),
	(31, '2024-09-05 09:45:00', 13, 7, 'Cartaxo', 'Santarém', '2024-09-05 10:55:00', 38.9, 2.7, 77.1429, 0.5, 0.0042),
	(32, '2024-09-05 12:15:00', 14, 8, 'Rio Maior', 'Caldas da Rainha', '2024-09-05 13:30:00', 43.22, 3, 85.7143, 0.5, 0.0042),
	(33, '2024-09-05 14:50:00', 15, 9, 'Óbidos', 'Peniche', '2024-09-05 16:10:00', 43.22, 3.4, 75.5556, 0.5, 0.072),
	(34, '2024-09-05 17:35:00', 16, 10, 'Nazaré', 'Alcobaça', '2024-09-05 19:00:00', 30.39, 3.6, 55.3846, 0.5, 0.0488),
	(35, '2024-09-05 20:20:00', 17, 11, 'Batalha', 'Fátima', '2024-09-05 22:05:00', 30.49, 4, 47.0588, 0.5, 0.1479),
	(36, '2024-09-06 08:30:00', 18, 12, 'Leiria', 'Pombal', '2024-09-06 09:45:00', 40.34, 2.8, 80, 0.5, 0.0042),
	(37, '2024-09-06 11:00:00', 11, 1, 'Coimbra', 'Condeixa-a-Nova', '2024-09-06 12:20:00', 40.68, 3.2, 71.1111, 0.5, 0.072),
	(38, '2024-09-06 13:45:00', 1, 2, 'Figueira da Foz', 'Aveiro', '2024-09-06 15:30:00', 54.66, 4.3, 95.5556, 0.5, 0.072),
	(39, '2024-09-06 16:40:00', 2, 3, 'Ílhavo', 'Viseu', '2024-09-06 18:55:00', 47.28, 5.6, 86.1538, 0.5, 0.0488),
	(40, '2024-09-06 20:15:00', 3, 4, 'Guarda', 'Covilhã', '2024-09-06 22:40:00', 49.81, 5.9, 90.7692, 0.5, 0.0488),
	(41, '2024-09-07 07:20:00', 4, 5, 'Castelo Branco', 'Portalegre', '2024-09-07 09:15:00', 37.35, 4.9, 57.6471, 0.5, 0.1479),
	(42, '2024-09-07 10:30:00', 5, 6, 'Elvas', 'Évora', '2024-09-07 12:25:00', 34.3, 4.5, 52.9412, 0.5, 0.1479),
	(43, '2024-09-07 13:50:00', 6, 7, 'Beja', 'Moura', '2024-09-07 16:10:00', 72.03, 5, 142.857, 0.5, 0.0042),
	(44, '2024-09-07 17:35:00', 7, 8, 'Serpa', 'Mértola', '2024-09-07 19:45:00', 0, 4.7, 0, 0.5, 0.0042),
	(45, '2024-09-07 21:00:00', 8, 9, 'Aljustrel', 'Castro Verde', '2024-09-07 23:30:00', 67.37, 5.3, 117.778, 0.5, 0.072),
	(46, '2024-09-08 08:15:00', 9, 10, 'Ourique', 'Almodôvar', '2024-09-08 10:05:00', 34.61, 4.1, 63.0769, 0.5, 0.0488),
	(47, '2024-09-08 11:40:00', 10, 11, 'Loulé', 'Faro', '2024-09-08 13:20:00', 28.96, 3.8, 44.7059, 0.5, 0.1479),
	(48, '2024-09-08 14:30:00', 11, 12, 'Olhão', 'Tavira', '2024-09-08 16:15:00', 50.42, 3.5, 100, 0.5, 0.0042),
	(49, '2024-09-08 17:25:00', 12, 1, 'Vila Real de Santo António', 'Ayamonte (Espanha)', '2024-09-08 19:40:00', 0, 6.2, 0, 0.5, 0.072),
	(50, '2024-09-08 20:50:00', 13, 2, 'Aeroporto de Faro', 'Albufeira', '2024-09-08 21:45:00', 34.32, 2.7, 60, 0.5, 0.072),
	(54, '2025-08-10 15:15:00', 1, 1, 'Cascais', 'Lisboa', '2025-08-10 16:15:00', 17.1, 2.8, 30, 0.5, 0.07),
	(55, '2025-09-10 17:15:00', 4, 3, 'Lisboa', 'Porto', '2025-09-10 21:15:00', 203.5, 22.8, 370, 0.5, 0.05),
	(56, '2025-09-01 00:00:00', 2, 5, 'Cascais', 'Faro', '2025-09-01 05:00:00', 0, 24, 0, 0.5, 0.15);

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_cliente`(
    IN novo_nif INT,
    IN novo_nome VARCHAR(45),
    IN nova_morada VARCHAR(150),
    IN novo_telefone INT
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT "NIF de cliente já existe!" AS Erro;
    END;

    START TRANSACTION;
    INSERT INTO cliente (nif, nome, morada, telefone) 
    VALUES (novo_nif, novo_nome, nova_morada, novo_telefone);
    SELECT * FROM cliente;
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_combustivel`(
    IN novo_combustivel VARCHAR(45),
    IN novo_preco_unit FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT "Combustivel já existente";
    END;
    
    START TRANSACTION;
    INSERT INTO combustivel (combustivel, preco_unit) 
    VALUES (novo_combustivel, novo_preco_unit);
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_empregado`(
    IN novo_nif INT,
    IN novo_nome VARCHAR(45),
    IN novo_cartao_cidadao VARCHAR(12),
    IN nova_validade_cc DATE,
    IN novo_niss BIGINT,
    IN novo_telefone INT,
    IN nova_carta_conducao VARCHAR(15),
    IN nova_validade_c_cond DATE,
    IN nova_morada VARCHAR(100),
    IN novo_cod_postal VARCHAR(8)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    INSERT INTO empregado (nif, nome, cartao_cidadao, validade_cc, niss, telefone, carta_conducao, validade_c_cond, morada, cod_postal) 
    VALUES (novo_nif, novo_nome, novo_cartao_cidadao, nova_validade_cc, novo_niss,
    novo_telefone, nova_carta_conducao, nova_validade_c_cond, nova_morada, novo_cod_postal);
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_modelo`(
    IN nova_marca VARCHAR(45),
    IN novo_modelo VARCHAR(45),
    IN novo_consumo FLOAT,
    IN novo_id_combustivel INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    INSERT INTO modelo (marca, modelo, consumo, id_combustivel) 
    VALUES (nova_marca, novo_modelo, novo_consumo, novo_id_combustivel);
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_taxi`(
    IN nova_matricula VARCHAR(8),
    IN novo_id_modelo INT,
    IN nova_data_matricula DATE,
    IN nova_prox_inspecao DATE,
    IN novo_id_empregado INT,
    IN novo_preco_por_km FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    INSERT INTO taxi (matricula, id_modelo, data_matricula, prox_inspecao, id_empregado, preco_por_km) 
    VALUES (nova_matricula, novo_id_modelo, nova_data_matricula, nova_prox_inspecao, novo_id_empregado, novo_preco_por_km);
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_viagem`(
    IN nova_hora_data_inicio DATETIME,
    IN novo_id_cliente INT,
    IN novo_id_taxi INT,
    IN nova_morada_origem VARCHAR(145),
    IN nova_morada_destino VARCHAR(145),
    IN nova_hora_data_fim DATETIME,
    IN novo_valor_viagem FLOAT,
    IN nova_estimativa_combustivel_gasto FLOAT,
    IN nova_distancia_km FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    INSERT INTO viagens (hora_data_inicio,
						id_cliente,
                        id_taxi,
                        morada_origem,
                        morada_destino,
                        hora_data_fim,
                        valor_viagem,
                        estimativa_combustivel_gasto,
                        distancia_km) 
    VALUES (nova_hora_data_inicio,
			novo_id_cliente,
			novo_id_taxi,
			nova_morada_origem,
            nova_morada_destino,
            nova_hora_data_fim,
            novo_valor_viagem,
            nova_estimativa_combustivel_gasto,
            nova_distancia_km);
    COMMIT;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_empregados_carta_expirada`()
BEGIN
    SELECT *
    FROM empregado
    WHERE validade_c_cond < CURDATE();
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_empregados_taxis`()
BEGIN
    SELECT empregado.*, taxi.matricula
    FROM empregado
    LEFT JOIN taxi ON empregado.id_empregado = taxi.id_empregado;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_faturado_kms_por_taxi`()
BEGIN
    SELECT 
        taxi.matricula, 
        modelo.marca, 
        ROUND(SUM(viagens.distancia_km),2) AS total_kms, 
        ROUND(SUM(viagens.distancia_km * taxi.preco_por_km),2) AS total_faturado
    FROM taxi 
    JOIN viagens ON taxi.id_taxi = viagens.id_taxi
    JOIN modelo ON taxi.id_modelo = modelo.id_modelo
    GROUP BY taxi.id_taxi;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_taxis_inspecao`(IN novo_mes INT, IN novo_ano INT)
BEGIN
    SELECT *
    FROM taxi
    WHERE MONTH(prox_inspecao) = novo_mes AND YEAR(prox_inspecao) = novo_ano;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_viagens_por_cliente`(IN novo_identificador INT)
BEGIN
    IF EXISTS (SELECT * FROM cliente WHERE nif = novo_identificador) THEN
        SELECT viagens.*
        FROM viagens
        JOIN cliente ON viagens.id_cliente = cliente.id_cliente
        WHERE cliente.nif = novo_identificador;
    ELSE
        SELECT viagens.*
        FROM viagens
        JOIN cliente ON viagens.id_cliente = cliente.id_cliente
        WHERE cliente.id_cliente = novo_identificador;
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_viagens_por_taxi`(IN nova_matricula VARCHAR(8))
BEGIN
    SELECT viagens.*
    FROM viagens
    JOIN taxi ON viagens.id_taxi = taxi.id_taxi
    WHERE taxi.matricula = nova_matricula;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_taxis_para_inspecao_2`(IN Mes INT, in Ano INT)
BEGIN
	SELECT * FROM taxi WHERE MONTH(prox_inspecao) = Mes
    AND YEAR (prox_inspecao) = Ano;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `relatorio_faturamento_periodo`(
	IN `data_inicio` DATE,
	IN `data_fim` DATE
)
BEGIN
    SELECT 
        DATE(v.hora_data_inicio) AS data,
        COUNT(*) AS numero_viagens,
        ROUND(SUM(v.valor_viagem),2) AS faturamento_total
    FROM viagens v
    WHERE DATE(v.hora_data_inicio) BETWEEN data_inicio AND data_fim
    GROUP BY DATE(v.hora_data_inicio)
    ORDER BY data;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `backup_diario` ON SCHEDULE EVERY 1 DAY STARTS '2025-09-10 21:39:38' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    -- Aqui iria o código para fazer o backup, por exemplo, inserir em tabelas de backup
    -- Este é um exemplo simples, na prática pode ser mais complexo
    INSERT INTO historico_faturas_backup 
    SELECT * FROM historico_faturas WHERE data_eliminacao < DATE_SUB(NOW(), INTERVAL 1 MONTH);
    
    DELETE FROM historico_faturas WHERE data_eliminacao < DATE_SUB(NOW(), INTERVAL 1 MONTH);
END//
DELIMITER ;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_delete_viagem` AFTER DELETE ON `viagens` FOR EACH ROW BEGIN
    DELETE FROM faturas WHERE id_viagem = OLD.id_viagem;
    DELETE FROM faturassemnif WHERE id_viagem = OLD.id_viagem;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_cliente` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
    IF NEW.morada IS NULL THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Cliente ', NEW.nome, ' inserido sem morada'));
    END IF;
    IF NEW.morada = '' THEN
		INSERT INTO logs (mensagem) VALUES (CONCAT('Cliente ', NEW.nome, ' inserido sem morada'));
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_taxi` AFTER INSERT ON `taxi` FOR EACH ROW BEGIN
    IF NEW.data_matricula IS NULL OR NEW.data_matricula = '0000-00-00' THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Taxi ', NEW.matricula, ' inserido sem data de matrícula'));
    END IF;
    IF NEW.preco_por_km = 0 OR NEW.preco_por_km IS NULL THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Taxi ', NEW.matricula, ' inserido com preço por km zero'));
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_viagem` AFTER INSERT ON `viagens` FOR EACH ROW BEGIN
    DECLARE cliente_id INT;
    DECLARE cliente_nome VARCHAR(45);
    
     SELECT id_cliente, nome INTO cliente_id, cliente_nome
    FROM cliente
    WHERE id_cliente = NEW.id_cliente;
    
    -- Se o cliente for INDIFERENCIADO (id_cliente = 1) então inserir em faturassemnif
    IF cliente_id = 1 THEN
        INSERT INTO faturassemnif (id_viagem, data_fatura, valor_viagem)
        VALUES (NEW.id_viagem, DATE(NEW.hora_data_inicio), NEW.valor_viagem);
    ELSE
        INSERT INTO faturas (id_viagem, id_cliente, data_fatura, valor_viagem)
        VALUES (NEW.id_viagem, NEW.id_cliente, DATE(NEW.hora_data_inicio), NEW.valor_viagem);
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_viagem_log` AFTER INSERT ON `viagens` FOR EACH ROW BEGIN
    IF NEW.distancia_km = 0 THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Viagem ', NEW.id_viagem, ' inserida com quilómetros zero'));
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_insert_viagem_quilometragem` AFTER INSERT ON `viagens` FOR EACH ROW BEGIN
    UPDATE taxi 
    SET quilometragem_total = COALESCE(quilometragem_total, 0) + NEW.distancia_km
    WHERE id_taxi = NEW.id_taxi;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_update_cliente` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
    IF NEW.morada IS NULL THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Cliente ', NEW.nome, ' atualizado sem morada'));
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_update_taxi` AFTER UPDATE ON `taxi` FOR EACH ROW BEGIN
    IF NEW.data_matricula IS NULL OR NEW.data_matricula = '0000-00-00' THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Taxi ', NEW.matricula, ' atualizado sem data de matrícula'));
    END IF;
     IF NEW.preco_por_km = 0 OR NEW.preco_por_km IS NULL THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Taxi ', NEW.matricula, ' atualizado com preço por km zero'));
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `after_update_viagem_log` AFTER UPDATE ON `viagens` FOR EACH ROW BEGIN
    IF NEW.distancia_km = 0 THEN
        INSERT INTO logs (mensagem) VALUES (CONCAT('Viagem ', NEW.id_viagem, ' atualizada com quilómetros zero'));
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_fatura` BEFORE DELETE ON `faturas` FOR EACH ROW BEGIN
    INSERT INTO historico_faturas (id_fatura, id_viagem, id_cliente, data_fatura, valor_viagem)
    VALUES (OLD.id_fatura, OLD.id_viagem, OLD.id_cliente, OLD.data_fatura, OLD.valor_viagem);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `before_insert_viagem` BEFORE INSERT ON `viagens` FOR EACH ROW BEGIN
    DECLARE preco_combustivel FLOAT;
    DECLARE consumo_modelo FLOAT;
    DECLARE preco_km_taxi FLOAT;
    
    SELECT preco_por_km INTO preco_km_taxi
    FROM taxi
    WHERE id_taxi = NEW.id_taxi;
    

    SELECT modelo.consumo, combustivel.preco_unit INTO consumo_modelo, preco_combustivel
    FROM modelo
    JOIN combustivel ON modelo.id_combustivel = combustivel.id_combustivel
    JOIN taxi ON taxi.id_modelo = modelo.id_modelo
    WHERE taxi.id_taxi = NEW.id_taxi;
    

    SET NEW.custo_combustivel_por_km = ROUND(((consumo_modelo / 100) * preco_combustivel),2);
    SET NEW.preco_por_km_na_viagem = preco_km_taxi;

    SET NEW.valor_viagem = ROUND(((preco_km_taxi + NEW.custo_combustivel_por_km) * NEW.distancia_km),2);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `before_update_viagem` BEFORE UPDATE ON `viagens` FOR EACH ROW BEGIN
    DECLARE preco_combustivel FLOAT;
    DECLARE consumo_modelo FLOAT;
    
   
    IF OLD.distancia_km != NEW.distancia_km THEN
     
        SELECT modelo.consumo, combustivel.preco_unit INTO consumo_modelo, preco_combustivel
        FROM modelo
        JOIN combustivel ON modelo.id_combustivel = combustivel.id_combustivel
        JOIN taxi ON taxi.id_modelo = modelo.id_modelo
        WHERE taxi.id_taxi = NEW.id_taxi;
        
        
        SET NEW.custo_combustivel_por_km = ROUND(((consumo_modelo / 100) * preco_combustivel),4);
     
        SET NEW.valor_viagem = ROUND(((NEW.preco_por_km_na_viagem + NEW.custo_combustivel_por_km) * NEW.distancia_km),2);
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `faturassemnif_BEFORE_DELETE` BEFORE DELETE ON `faturassemnif` FOR EACH ROW BEGIN
INSERT INTO historico_faturas (id_fatura, id_viagem, id_cliente, data_fatura, valor_viagem)
    VALUES (OLD.id_fatura, OLD.id_viagem, 1 , OLD.data_fatura, OLD.valor_viagem);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
