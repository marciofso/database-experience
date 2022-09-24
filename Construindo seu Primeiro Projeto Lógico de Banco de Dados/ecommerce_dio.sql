-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Set-2022 às 22:03
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
-- Banco de dados: `ecommerce_dio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Endereço` varchar(45) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `CNPJ` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `idEntrega` int(11) NOT NULL,
  `StatusEntrega` tinyint(1) DEFAULT NULL,
  `CodigoRastreio` varchar(45) DEFAULT NULL,
  `DataEntrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `idEstoque` int(11) NOT NULL,
  `Local` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoquefornecedor`
--

CREATE TABLE `estoquefornecedor` (
  `idEstoqueFornecedor` int(11) DEFAULT NULL,
  `idProdutoFornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoqueproduto`
--

CREATE TABLE `estoqueproduto` (
  `idProduto` int(11) NOT NULL,
  `idEstoqueProduto` int(11) DEFAULT NULL,
  `Quantidade` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoqueterceiro`
--

CREATE TABLE `estoqueterceiro` (
  `idProdutosEstoque` int(11) DEFAULT NULL,
  `idPOFornecedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL,
  `RazãoSocial` varchar(45) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `CNPJ` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `idPagamento` int(11) NOT NULL,
  `PagamentoCliente` int(11) DEFAULT NULL,
  `Cartão` varchar(45) DEFAULT NULL,
  `Bandeira` varchar(45) DEFAULT NULL,
  `Número` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `StatusPedido` tinyint(1) DEFAULT 0,
  `Frete` float DEFAULT NULL,
  `Descrição` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidofornecedor`
--

CREATE TABLE `pedidofornecedor` (
  `idCompraFornecedor` int(11) DEFAULT NULL,
  `idFornecedorPedido` int(11) DEFAULT NULL,
  `Quantidade` float DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoproduto`
--

CREATE TABLE `pedidoproduto` (
  `idPedido` int(11) DEFAULT NULL,
  `idProduto` int(11) DEFAULT NULL,
  `Quantidade` float DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Descrição` varchar(45) DEFAULT NULL,
  `Valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `terceiro`
--

CREATE TABLE `terceiro` (
  `idTerceiro` int(11) NOT NULL,
  `RazãoSocial` varchar(45) DEFAULT NULL,
  `Localização` varchar(45) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `CNPJ` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `unique_cpf_cliente` (`CPF`),
  ADD UNIQUE KEY `unique_cnpj_cliente` (`CNPJ`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`idEntrega`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`idEstoque`);

--
-- Índices para tabela `estoquefornecedor`
--
ALTER TABLE `estoquefornecedor`
  ADD KEY `fk_estoque_fornecedor` (`idEstoqueFornecedor`),
  ADD KEY `fk_produtos_fornecedor` (`idProdutoFornecedor`);

--
-- Índices para tabela `estoqueproduto`
--
ALTER TABLE `estoqueproduto`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `fk_produto_estoque` (`idEstoqueProduto`);

--
-- Índices para tabela `estoqueterceiro`
--
ALTER TABLE `estoqueterceiro`
  ADD KEY `fk_produtos_estoque` (`idProdutosEstoque`),
  ADD KEY `fk_po_fornecedor` (`idPOFornecedor`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idFornecedor`),
  ADD UNIQUE KEY `unique_cpf_cliente` (`CPF`),
  ADD UNIQUE KEY `unique_cnpj_cliente` (`CNPJ`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`idPagamento`),
  ADD KEY `fk_pagamento_cliente` (`PagamentoCliente`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`);

--
-- Índices para tabela `pedidofornecedor`
--
ALTER TABLE `pedidofornecedor`
  ADD KEY `fk_pedido_forncedor` (`idCompraFornecedor`),
  ADD KEY `fk_fornecedor_pedido` (`idFornecedorPedido`);

--
-- Índices para tabela `pedidoproduto`
--
ALTER TABLE `pedidoproduto`
  ADD KEY `fk_pedido` (`idPedido`),
  ADD KEY `fk_produto` (`idProduto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `terceiro`
--
ALTER TABLE `terceiro`
  ADD PRIMARY KEY (`idTerceiro`),
  ADD UNIQUE KEY `unique_cpf_cliente` (`CPF`),
  ADD UNIQUE KEY `unique_cnpj_cliente` (`CNPJ`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `idEntrega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `idEstoque` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idFornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `idPagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `terceiro`
--
ALTER TABLE `terceiro`
  MODIFY `idTerceiro` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estoquefornecedor`
--
ALTER TABLE `estoquefornecedor`
  ADD CONSTRAINT `fk_estoque_fornecedor` FOREIGN KEY (`idEstoqueFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  ADD CONSTRAINT `fk_produtos_fornecedor` FOREIGN KEY (`idProdutoFornecedor`) REFERENCES `produto` (`idProduto`);

--
-- Limitadores para a tabela `estoqueproduto`
--
ALTER TABLE `estoqueproduto`
  ADD CONSTRAINT `fk_estoque` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  ADD CONSTRAINT `fk_produto_estoque` FOREIGN KEY (`idEstoqueProduto`) REFERENCES `estoque` (`idEstoque`);

--
-- Limitadores para a tabela `estoqueterceiro`
--
ALTER TABLE `estoqueterceiro`
  ADD CONSTRAINT `fk_po_fornecedor` FOREIGN KEY (`idPOFornecedor`) REFERENCES `terceiro` (`idTerceiro`),
  ADD CONSTRAINT `fk_produtos_estoque` FOREIGN KEY (`idProdutosEstoque`) REFERENCES `produto` (`idProduto`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_pagamento_cliente` FOREIGN KEY (`PagamentoCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_entrega` FOREIGN KEY (`idPedido`) REFERENCES `entrega` (`idEntrega`);

--
-- Limitadores para a tabela `pedidofornecedor`
--
ALTER TABLE `pedidofornecedor`
  ADD CONSTRAINT `fk_fornecedor_pedido` FOREIGN KEY (`idFornecedorPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `fk_pedido_forncedor` FOREIGN KEY (`idCompraFornecedor`) REFERENCES `fornecedor` (`idFornecedor`);

--
-- Limitadores para a tabela `pedidoproduto`
--
ALTER TABLE `pedidoproduto`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`idPedido`) REFERENCES `terceiro` (`idTerceiro`),
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
