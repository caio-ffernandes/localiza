-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/05/2024 às 19:41
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `localizar`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_eventos` ()   BEGIN
    SELECT * FROM eventos;
END$$

--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_confirmacoes_evento` (`evento_id` INT) RETURNS INT(11)  BEGIN
    DECLARE num_confirmacoes INT;
    SELECT COUNT(*) INTO num_confirmacoes FROM confirmacoes WHERE Eventos_id_evento = evento_id;
    RETURN num_confirmacoes;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `confirmacoes`
--

CREATE TABLE `confirmacoes` (
  `id_confirmacao` int(11) NOT NULL,
  `confirma_confirmacao` enum('0','1') NOT NULL,
  `Usuarios_id_usuario` int(11) NOT NULL,
  `Eventos_id_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `confirmacoes`
--

INSERT INTO `confirmacoes` (`id_confirmacao`, `confirma_confirmacao`, `Usuarios_id_usuario`, `Eventos_id_evento`) VALUES
(1, '1', 1, 4),
(2, '1', 3, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `nome_evento` varchar(99) NOT NULL,
  `data_evento` date NOT NULL,
  `horario_evento` time NOT NULL,
  `custo_evento` decimal(10,0) NOT NULL,
  `foto_evento` varchar(200) NOT NULL,
  `Pontos_id_ponto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`id_evento`, `nome_evento`, `data_evento`, `horario_evento`, `custo_evento`, `foto_evento`, `Pontos_id_ponto`) VALUES
(4, 'aniversario cidade', '2024-05-14', '20:48:55', 0, '', 10),
(5, 'Desfile Escolas', '2024-05-15', '23:49:53', 0, '', 11),
(9, 'caio', '2024-05-08', '13:58:23', 132, 'asdfasdf', 10),
(12, 'asdf', '0003-02-12', '12:23:00', 123, '83275b18d9e0b0e1a3b2d57e8024e3a3.jfif', 5),
(13, 'luiz', '4234-03-12', '12:43:00', 243, 'e36d85af55a64254dac23ed8aeeb28b5.jpg', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pontos`
--

CREATE TABLE `pontos` (
  `id_ponto` int(11) NOT NULL,
  `tipo_ponto` enum('Loja','Restaurante','Turistico','Alugavel','Igreja','Escola','Saude','Esporte') NOT NULL,
  `nome_ponto` varchar(99) NOT NULL,
  `rua_ponto` varchar(99) NOT NULL,
  `bairro_ponto` varchar(99) NOT NULL,
  `num_ponto` int(11) NOT NULL,
  `telefone_ponto` int(11) NOT NULL,
  `cep_ponto` int(8) NOT NULL,
  `foto_ponto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pontos`
--

INSERT INTO `pontos` (`id_ponto`, `tipo_ponto`, `nome_ponto`, `rua_ponto`, `bairro_ponto`, `num_ponto`, `telefone_ponto`, `cep_ponto`, `foto_ponto`) VALUES
(1, 'Restaurante', 'Restaurante Q-Cuca', 'Av.Regente Feijó', 'Centro', 333, 1832794446, 19570000, ''),
(2, 'Restaurante', 'Restaurante Ito', 'José Colnago', 'Vila Nova', 9, 1832791964, 19570000, ''),
(3, 'Restaurante', 'Restaurante Montanha', 'José Colnago', 'Vila Nova', 80, 1832791241, 19570000, ''),
(4, 'Escola', 'SESI-CE368', ' José Gomes', 'Vila Nova', 1341, 1832791456, 19570000, ''),
(5, 'Esporte', 'Ginásio Municipal', 'Clemente Pereira', 'Centro', 71, 1832791702, 19570000, ''),
(6, 'Loja', 'Casarão Regente', 'Barão do Rio Branco', 'Centro', 94, 1832791906, 19570000, ''),
(7, 'Saude', 'ESF Santa Rita', 'Francisco Maldonado', 'Santa Rita', 80, 1832792343, 19570000, ''),
(8, 'Igreja', 'Igreja Matriz', 'Julio Mesquita', 'Centro', 94, 1234567890, 19570000, ''),
(9, 'Igreja', 'CCB Tropical', 'João Honorato de Barros', 'Jardim Tropical', 56, 0, 19570000, ''),
(10, 'Escola', 'Casa da Criança', 'Antonio Carlos', 'Sumare', 723, 1832792723, 19570000, ''),
(11, 'Turistico', 'Praça Fonte Luminosa', 'Mal. Floriano Peixoto', 'Sumare', 289, 0, 19570000, ''),
(12, 'Turistico', 'luiz', 'sf', 'asdf', 132, 312, 19570000, 'c232b7297e894f2d735e45aea860bf82.jpg');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `relatorio_eventos_confirmacoes`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `relatorio_eventos_confirmacoes` (
`id_evento` int(11)
,`nome_evento` varchar(99)
,`num_confirmacoes` bigint(21)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `relatorio_pontos_eventos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `relatorio_pontos_eventos` (
`id_ponto` int(11)
,`nome_ponto` varchar(99)
,`nome_evento` varchar(99)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(99) NOT NULL,
  `email_usuario` varchar(99) NOT NULL,
  `nivel_usuario` enum('0','1') NOT NULL,
  `senha_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome_usuario`, `email_usuario`, `nivel_usuario`, `senha_usuario`) VALUES
(1, 'Caio', 'caio.mido@gmail.com', '1', 'brigadeiro12'),
(2, 'maria', 'maria@gmail.com', '1', '123'),
(3, 'lavinia', 'lala@gmail.com', '1', '123'),
(4, 'Maria Vitoria', 'mavi@gmail.com', '0', '123'),
(5, 'Adriano', 'dri@gmail.com', '0', '123');

-- --------------------------------------------------------

--
-- Estrutura para view `relatorio_eventos_confirmacoes`
--
DROP TABLE IF EXISTS `relatorio_eventos_confirmacoes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `relatorio_eventos_confirmacoes`  AS SELECT `e`.`id_evento` AS `id_evento`, `e`.`nome_evento` AS `nome_evento`, count(`c`.`id_confirmacao`) AS `num_confirmacoes` FROM (`eventos` `e` left join `confirmacoes` `c` on(`e`.`id_evento` = `c`.`Eventos_id_evento`)) GROUP BY `e`.`id_evento`, `e`.`nome_evento` ;

-- --------------------------------------------------------

--
-- Estrutura para view `relatorio_pontos_eventos`
--
DROP TABLE IF EXISTS `relatorio_pontos_eventos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `relatorio_pontos_eventos`  AS SELECT `p`.`id_ponto` AS `id_ponto`, `p`.`nome_ponto` AS `nome_ponto`, `e`.`nome_evento` AS `nome_evento` FROM (`pontos` `p` left join `eventos` `e` on(`p`.`id_ponto` = `e`.`Pontos_id_ponto`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `confirmacoes`
--
ALTER TABLE `confirmacoes`
  ADD PRIMARY KEY (`id_confirmacao`),
  ADD KEY `fk_Confirmacoes_Usuarios1_idx` (`Usuarios_id_usuario`),
  ADD KEY `fk_Confirmacoes_Eventos1_idx` (`Eventos_id_evento`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `fk_Eventos_Pontos_idx` (`Pontos_id_ponto`);

--
-- Índices de tabela `pontos`
--
ALTER TABLE `pontos`
  ADD PRIMARY KEY (`id_ponto`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `confirmacoes`
--
ALTER TABLE `confirmacoes`
  MODIFY `id_confirmacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `pontos`
--
ALTER TABLE `pontos`
  MODIFY `id_ponto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `confirmacoes`
--
ALTER TABLE `confirmacoes`
  ADD CONSTRAINT `fk_Confirmacoes_Eventos1` FOREIGN KEY (`Eventos_id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Confirmacoes_Usuarios1` FOREIGN KEY (`Usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_Eventos_Pontos` FOREIGN KEY (`Pontos_id_ponto`) REFERENCES `pontos` (`id_ponto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
