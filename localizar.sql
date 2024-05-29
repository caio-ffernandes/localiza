-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/05/2024 às 19:35
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
(4, '0', 1, 15),
(5, '0', 1, 15),
(6, '0', 1, 15),
(7, '1', 1, 15),
(8, '0', 1, 15);

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
(15, 'Desfile Escolas', '2024-06-28', '20:30:00', 0, '9822a2b322fabacfb910f14c28a1ea47.jpg', 16),
(16, 'Festa Brasileira ', '2024-06-24', '19:30:00', 0, '05c574e7a645dc5485bc4d48fe8ca8d1.jpg', 17),
(17, 'Festa Brasileira', '2024-08-31', '19:00:00', 0, 'e83470bacb5da5747534fc4c9d6e1c0d.jpg', 29);

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
(14, 'Restaurante', 'House Burger', 'Barão do Rio Branco', 'Centro', 75, 2147483647, 19570000, 'cd05bb0919b731e63fe88d0258bd410e.jpg'),
(15, 'Restaurante', 'Q-Cuca', 'Av. Regente Feijó', 'Centro', 333, 1832794446, 19570000, 'bc5bcc995783679faf8619bcff8059de.jpg'),
(16, 'Turistico', 'Praça Fonte Luminosa', 'Mal. Floriano Peixoto', 'Centro', 289, 0, 19570000, 'f93fc7d94e26bf4a6a30792d7e974584.avif'),
(17, 'Escola', 'SESI', ' José Gomes', 'Fim cidade', 1341, 1832791456, 19570000, 'e9b2a8f9ea275e1448c6cf0a9306590a.jpg'),
(18, 'Escola', 'Colégio Êxito', 'Padre Antônio Vieira', 'Vila Nova', 115, 2147483647, 19570000, '7eb9191adae227620f7b2fe4240dab1a.jpg'),
(19, 'Escola', 'Colégio Arte Livre', 'Martins Francisco ', 'JD Tenis Clube', 224, 1832791937, 19570000, 'f29e3b3c01460485114e28242b87facc.jpg'),
(20, 'Escola', 'Ivo Liboni', 'Av. José Bonifácio', 'JD Tenis Clube', 1, 1832791088, 19570000, '87d427634213524b96e99aa1aefc2475.jfif'),
(21, 'Igreja', 'Igreja Matriz', ' Júlio Mesquita', 'Centro', 94, 1234567890, 19570000, '3e0f112c9486573c06f2024b071dee15.jpg'),
(22, 'Igreja', 'Igreja Adventista Do Sétimo Dia', 'São Bento', 'Vila Nova', 370, 2147483647, 19570000, '640adb7ea93537b216a7399bc212b8cc.jpg'),
(23, 'Loja', 'Casarão Regente ', 'Barão do Rio Branco', ' Centro', 94, 1832791906, 19570000, '5cc662d7248c03e61fd65bcb001a707e.jpg'),
(24, 'Loja', 'Belinha Modas', 'Av. José Bonifácio', 'Centro', 0, 2147483647, 19570000, 'bf087a68098d20d867fcd75c139bf248.jfif'),
(25, 'Saude', 'ESF Fepasa', 'R. São Bento', 'Vila Nova', 0, 1832794061, 19570000, '26c3a674ee1638a3e980d26b7b98efbd.jfif'),
(26, 'Saude', 'Hospital e Maternidade Regional', 'Brigadeiro Tobias', '', 300, 1832793333, 19570000, 'd6f92eeec5912c344dd92d39a6f1f903.jpg'),
(27, 'Esporte', 'Regente Tênis Clube', 'Av. José Bonifácio', 'JD Tenis Clube', 23, 1832791513, 19570000, 'e134b697f9dcaf0042e6d083b9cbe0ba.jfif'),
(28, 'Alugavel', 'Portal Eventos', 'Júlio Mesquita,', 'Portal ', 1117, 0, 19570000, 'ef572e81835061a3e6cd00953e5f7a16.jpg'),
(29, 'Escola', 'Associação Casa Da Criança', 'São Paulo', 'Sumare', 723, 1832792723, 19570000, '0b2423658dd98be06dab9873bafe8d4b.jpg'),
(30, 'Alugavel', 'Chácara Ramos', ' Alvino Viani', 'Jardim Santa Rita', 0, 2147483647, 19570000, '63029bbcaddcb479982fc84308fa7efe.jpg'),
(31, 'Alugavel', 'ITI-BAN Eventos', ' Antônio Ledesma Filho', '', 374, 2147483647, 19570000, 'b76f0d783befb788a0bfedcbfde950c7.jpg'),
(32, 'Esporte', 'Ginásio Municipal', 'Av. Clemente Pereira', 'Centro', 71, 1832791702, 19570000, '94b0bb12092bbd930af7e881f7fa4f26.jpg');

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
(5, 'Adriano', 'dri@gmail.com', '0', '123'),
(6, 'rafa', 'rafaelotario@gmail.com', '0', '1234');

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
  MODIFY `id_confirmacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `pontos`
--
ALTER TABLE `pontos`
  MODIFY `id_ponto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
