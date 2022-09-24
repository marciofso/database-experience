-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Set-2022 às 23:01
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `oficina`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `idCarro` int(11) NOT NULL,
  `Placa` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `IdCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`idCarro`, `Placa`, `Modelo`, `Marca`, `IdCliente`) VALUES
(1, 'QSE-1234', 'LOGAN', 'RENAULT', 3),
(2, 'QWW-5685', 'GOL', 'WOLKS', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `CPF` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Nome`, `CPF`) VALUES
(3, 'Maria', '1111111111111111111'),
(4, 'Leo', '222222222222222');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `idEquipe` int(11) NOT NULL,
  `Descricao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `equipe`
--

INSERT INTO `equipe` (`idEquipe`, `Descricao`) VALUES
(1, 'TROCA PNEUS'),
(2, 'TROCA OLEO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Endereco` varchar(45) NOT NULL,
  `Especialidade` varchar(45) NOT NULL,
  `IdEquipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`idFuncionario`, `Nome`, `Endereco`, `Especialidade`, `IdEquipe`) VALUES
(1, 'THAMY', 'COSMOS', 'MECANICO', 1),
(2, 'TAY', 'SANTA CRUZ', 'MECANICO', 2),
(3, 'LARI', 'BANGU', 'MECANICO', 1),
(4, 'MIGUEL', 'MARGARIDA', 'MECANICO', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servico`
--

CREATE TABLE `ordem_servico` (
  `idOrdem_Servico` int(11) NOT NULL,
  `DataEmissao` datetime NOT NULL,
  `DataConclusao` datetime NOT NULL,
  `Status` enum('Aguardando','Aprovado','Reprovada') NOT NULL DEFAULT 'Aguardando',
  `IdCarro` int(11) NOT NULL,
  `IdEquipe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ordem_servico`
--

INSERT INTO `ordem_servico` (`idOrdem_Servico`, `DataEmissao`, `DataConclusao`, `Status`, `IdCarro`, `IdEquipe`) VALUES
(2, '2022-09-23 00:00:00', '2022-09-25 00:00:00', 'Aguardando', 1, 1),
(3, '2022-09-23 00:00:00', '2022-09-25 00:00:00', 'Aguardando', 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pecas`
--

CREATE TABLE `pecas` (
  `idPecas` int(11) NOT NULL,
  `Descricao` varchar(45) NOT NULL,
  `Valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pecas`
--

INSERT INTO `pecas` (`idPecas`, `Descricao`, `Valor`) VALUES
(1, 'Pneu', 90),
(2, 'Oleo', 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pecasutilizadas`
--

CREATE TABLE `pecasutilizadas` (
  `idPecasUtilizadas` int(11) NOT NULL,
  `Qtd` varchar(45) NOT NULL DEFAULT '1',
  `IdPecas` int(11) DEFAULT NULL,
  `IdOS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pecasutilizadas`
--

INSERT INTO `pecasutilizadas` (`idPecasUtilizadas`, `Qtd`, `IdPecas`, `IdOS`) VALUES
(3, '4', 1, 2),
(4, '2', 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicorealizado`
--

CREATE TABLE `servicorealizado` (
  `idServicoRealizado` int(11) NOT NULL,
  `IdServico` int(11) NOT NULL,
  `IdOS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicorealizado`
--

INSERT INTO `servicorealizado` (`idServicoRealizado`, `IdServico`, `IdOS`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `idServicos` int(11) NOT NULL,
  `Descricao` varchar(45) NOT NULL,
  `Valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`idServicos`, `Descricao`, `Valor`) VALUES
(1, 'Troca Pneu', 100),
(2, 'Troca Oleo', 50);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`idCarro`),
  ADD UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  ADD KEY `IdCliente_idx` (`IdCliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `CPF_UNIQUE` (`CPF`);

--
-- Índices para tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`idEquipe`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFuncionario`),
  ADD KEY `IdEquipe_idx` (`IdEquipe`);

--
-- Índices para tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD PRIMARY KEY (`idOrdem_Servico`),
  ADD KEY `IdCarro_idx` (`IdCarro`),
  ADD KEY `IdEquipe_idx` (`IdEquipe`);

--
-- Índices para tabela `pecas`
--
ALTER TABLE `pecas`
  ADD PRIMARY KEY (`idPecas`);

--
-- Índices para tabela `pecasutilizadas`
--
ALTER TABLE `pecasutilizadas`
  ADD PRIMARY KEY (`idPecasUtilizadas`),
  ADD KEY `IdPecas_idx` (`IdPecas`),
  ADD KEY `IdOS_idx` (`IdOS`);

--
-- Índices para tabela `servicorealizado`
--
ALTER TABLE `servicorealizado`
  ADD PRIMARY KEY (`idServicoRealizado`),
  ADD KEY `IdServico_idx` (`IdServico`),
  ADD KEY `IdOSs_idx` (`IdOS`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`idServicos`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `idCarro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `equipe`
--
ALTER TABLE `equipe`
  MODIFY `idEquipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idFuncionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  MODIFY `idOrdem_Servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pecas`
--
ALTER TABLE `pecas`
  MODIFY `idPecas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pecasutilizadas`
--
ALTER TABLE `pecasutilizadas`
  MODIFY `idPecasUtilizadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `servicorealizado`
--
ALTER TABLE `servicorealizado`
  MODIFY `idServicoRealizado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `idServicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `IdCliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `IdEq` FOREIGN KEY (`IdEquipe`) REFERENCES `equipe` (`idEquipe`);

--
-- Limitadores para a tabela `ordem_servico`
--
ALTER TABLE `ordem_servico`
  ADD CONSTRAINT `IdCarro` FOREIGN KEY (`IdCarro`) REFERENCES `carro` (`idCarro`),
  ADD CONSTRAINT `IdEquipe` FOREIGN KEY (`IdEquipe`) REFERENCES `equipe` (`idEquipe`);

--
-- Limitadores para a tabela `pecasutilizadas`
--
ALTER TABLE `pecasutilizadas`
  ADD CONSTRAINT `IdOS` FOREIGN KEY (`IdOS`) REFERENCES `ordem_servico` (`idOrdem_Servico`),
  ADD CONSTRAINT `IdPecas` FOREIGN KEY (`IdPecas`) REFERENCES `pecas` (`idPecas`);

--
-- Limitadores para a tabela `servicorealizado`
--
ALTER TABLE `servicorealizado`
  ADD CONSTRAINT `IdOSs` FOREIGN KEY (`IdOS`) REFERENCES `servicos` (`idServicos`),
  ADD CONSTRAINT `IdServico` FOREIGN KEY (`IdServico`) REFERENCES `servicos` (`idServicos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
