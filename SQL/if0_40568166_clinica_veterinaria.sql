-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql100.infinityfree.com
-- Tempo de geração: 01-Dez-2025 às 11:35
-- Versão do servidor: 10.6.22-MariaDB
-- versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_40568166_clinica_veterinaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `id_animal` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `especie` varchar(50) DEFAULT NULL,
  `raca` varchar(50) DEFAULT NULL,
  `sexo` varchar(10) DEFAULT NULL,
  `datanasc` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`id_animal`, `nome`, `especie`, `raca`, `sexo`, `datanasc`, `id_cliente`) VALUES
(1, 'Rex', 'Cão', 'Vira-lata', 'Macho', '2020-05-10', 1),
(2, 'Luna', 'Gato', 'SRD', 'Fêmea', '2019-09-20', 1),
(3, 'Bidu', 'Cão', 'Poodle', 'Macho', '2018-03-15', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id_atend` int(11) NOT NULL,
  `data_atend` date DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `id_animal` int(11) DEFAULT NULL,
  `id_vet` int(11) DEFAULT NULL,
  `id_servico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `atendimento`
--

INSERT INTO `atendimento` (`id_atend`, `data_atend`, `horario`, `id_animal`, `id_vet`, `id_servico`) VALUES
(1, '2025-03-01', '09:00:00', 1, 1, 1),
(2, '2025-03-01', '10:00:00', 2, 1, 2),
(3, '2025-03-02', '14:00:00', 3, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cpf`, `rua`, `numero`, `bairro`, `cidade`) VALUES
(1, 'Ana Souza', '111.111.111-11', 'Rua A', '100', 'Centro', 'Diamantina'),
(2, 'Carlos Lima', '222.222.222-22', 'Rua B', '200', 'Jardim', 'Diamantina'),
(3, 'Mariana Dias', '333.333.333-33', 'Rua C', '300', 'Alto', 'Diamantina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emailcliente`
--

CREATE TABLE `emailcliente` (
  `id_email` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `emailcliente`
--

INSERT INTO `emailcliente` (`id_email`, `id_cliente`, `email`) VALUES
(1, 1, 'ana.souza@gmail.com'),
(2, 1, 'ana.trabalho@gmail.com'),
(3, 2, 'carlos.lima@gmail.com'),
(4, 3, 'mariana.dias@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prontuario`
--

CREATE TABLE `prontuario` (
  `id_pront` int(11) NOT NULL,
  `diagnostico` text DEFAULT NULL,
  `medicacao` text DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `id_atend` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `prontuario`
--

INSERT INTO `prontuario` (`id_pront`, `diagnostico`, `medicacao`, `observacao`, `id_atend`) VALUES
(1, 'Otite', 'Antibiótico XYZ', 'Retorno em 7 dias', 1),
(2, 'Vacinação anual', 'Vacina V8', 'Animal saudável', 2),
(3, 'Pós-operatório', 'Analgésico ABC', 'Retirar pontos em 10 dias', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `tempo_medio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id_servico`, `descricao`, `valor`, `tempo_medio`) VALUES
(1, 'Consulta', '120.00', 30),
(2, 'Vacinação', '80.00', 15),
(3, 'Cirurgia simples', '500.00', 90);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefonecliente`
--

CREATE TABLE `telefonecliente` (
  `id_telefone` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `telefonecliente`
--

INSERT INTO `telefonecliente` (`id_telefone`, `id_cliente`, `telefone`) VALUES
(1, 1, '(38) 99999-0001'),
(2, 1, '(38) 98888-0002'),
(3, 2, '(38) 97777-0003'),
(4, 3, '(38) 96666-0004');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `id_vet` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `crmv` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `tempo_medio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `veterinario`
--

INSERT INTO `veterinario` (`id_vet`, `nome`, `crmv`, `telefone`, `email`, `especialidade`, `tempo_medio`) VALUES
(1, 'Dr. João Veterinário', 'CRMV-MG 1234', '(38) 91111-2222', 'joao.vet@gmail.com', 'Clínica Geral', 30),
(2, 'Dra. Paula Animais', 'CRMV-MG 5678', '(38) 92222-3333', 'paula.vet@gmail.com', 'Cirurgia', 45);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id_animal`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id_atend`),
  ADD KEY `id_animal` (`id_animal`),
  ADD KEY `id_vet` (`id_vet`),
  ADD KEY `id_servico` (`id_servico`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `emailcliente`
--
ALTER TABLE `emailcliente`
  ADD PRIMARY KEY (`id_email`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD PRIMARY KEY (`id_pront`),
  ADD UNIQUE KEY `id_atend` (`id_atend`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id_servico`);

--
-- Índices para tabela `telefonecliente`
--
ALTER TABLE `telefonecliente`
  ADD PRIMARY KEY (`id_telefone`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices para tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id_vet`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `id_animal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id_atend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `emailcliente`
--
ALTER TABLE `emailcliente`
  MODIFY `id_email` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `prontuario`
--
ALTER TABLE `prontuario`
  MODIFY `id_pront` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `telefonecliente`
--
ALTER TABLE `telefonecliente`
  MODIFY `id_telefone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `id_vet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`id_animal`) REFERENCES `animal` (`id_animal`),
  ADD CONSTRAINT `atendimento_ibfk_2` FOREIGN KEY (`id_vet`) REFERENCES `veterinario` (`id_vet`),
  ADD CONSTRAINT `atendimento_ibfk_3` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id_servico`);

--
-- Limitadores para a tabela `emailcliente`
--
ALTER TABLE `emailcliente`
  ADD CONSTRAINT `emailcliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `prontuario`
--
ALTER TABLE `prontuario`
  ADD CONSTRAINT `prontuario_ibfk_1` FOREIGN KEY (`id_atend`) REFERENCES `atendimento` (`id_atend`);

--
-- Limitadores para a tabela `telefonecliente`
--
ALTER TABLE `telefonecliente`
  ADD CONSTRAINT `telefonecliente_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
