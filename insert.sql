-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.1.38-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando dados para a tabela mob_share.tbl_acessorios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_acessorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_acessorios` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_acessorio_veiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_acessorio_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_acessorio_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_anuncio: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_anuncio` DISABLE KEYS */;
INSERT INTO `tbl_anuncio` (`id_anuncio`, `descricao`, `id_cliente_locador`, `id_veiculo`, `horario_inicio`, `horario_termino`, `data_inicial`, `data_final`, `status_aprovado`) VALUES
	(1, 'Teste', 7, 7, '12:00:00', '13:00:00', '2019-07-01', '2019-07-01', 1),
	(2, 'Teste', 9, 8, '12:00:00', '13:00:00', '2019-07-01', '2019-07-01', 1),
	(3, 'Teste', 11, 9, '12:00:00', '13:00:00', '2019-07-01', '2019-07-01', 0),
	(4, 'Teste', 12, 6, '12:00:00', '13:00:00', '2019-07-01', '2019-07-01', 1);
/*!40000 ALTER TABLE `tbl_anuncio` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_anuncio_venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_anuncio_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_anuncio_venda` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_aprovacao_anuncio: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_aprovacao_anuncio_venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_anuncio_venda` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_aprovacao_veiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_aprovacao_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_aprovacao_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_avaliacao_locatario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_avaliacao_locatario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_avaliacao_locatario` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_avaliacao_servico: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_avaliacao_servico` DISABLE KEYS */;
INSERT INTO `tbl_avaliacao_servico` (`id_avaliacao_servico`, `nota`, `data_avaliacao`, `id_locacao`, `comentario`) VALUES
	(1, 7, '2019-04-02', 1, 'Mais ou menos'),
	(2, 8, '2019-04-03', 2, 'Mais ou menos'),
	(3, 5, '2019-04-04', 3, 'Mais ou menos'),
	(4, 7, '2019-04-05', 4, 'Mais ou menos');
/*!40000 ALTER TABLE `tbl_avaliacao_servico` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_bancos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bancos` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_cargos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_cargos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cargos` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_cargo_funcionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_cargo_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cargo_funcionario` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
INSERT INTO `tbl_cliente` (`id_cliente`, `nome_cliente`, `cpf`, `telefone`, `celular`, `cnh_foto`, `foto_cliente`, `rua`, `bairro`, `cep`, `complemento`, `cidade`, `uf`, `email`, `senha`) VALUES
	(7, 'Matheus Vieira', '00000000000', '1146194343', '11963876877', '', '', 'Rua duques de caxias', 'Stella maris', '06624450', '', 'Jandira', 'SP', 'matheus@gmail.com', '123'),
	(8, 'João Pedro', '00000000001', '1146194341', '11963879875', '', '', 'Rua Duques de Malias', 'Stella Souza', '0662548', '', 'Itapevi', 'SP', 'joao@gmai.com', '123'),
	(9, 'Ana Flavia', '00000000002', '1146198564', '11963876855', '', '', 'Rua stella maris', 'Duques de souza', '0111111', '', 'Itapevi', 'SP', 'ana@gmail.com', '312'),
	(10, 'Matheus costa', '00000000000', '1146194343', '1196387877', '', '', 'Rua duques de caxias', 'Stella maris', '06624450', '', 'Jandira', 'SP', 'matheus2@gmail.com', '123'),
	(11, 'João Cardoso2', '00000000000', '1172749639', '11972859678', '', '', 'Rua Avenildo souza', 'Estrela de Jorge', '0115166', '', 'Itapevi', 'SP', 'joao2@teste,com', '321'),
	(12, 'Ana Souza2', '0000000000', '114654686', '113515464', '', '', 'Rua Flavio Santos', 'Não sei', '02654', '', 'Barueri', 'Sp', 'ana2@gmail.com', '123');
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_como_ganhar_dinheiro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_como_ganhar_dinheiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_como_ganhar_dinheiro` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_conta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_conta` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_contas_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contas_pagar` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_contas_receber: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contas_receber` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_email_mkt: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_email_mkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_email_mkt` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_fale_conosco: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_fale_conosco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fale_conosco` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_faq: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_faq` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_folha_pagamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_folha_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folha_pagamento` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_folha_pagamento_contas_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_folha_pagamento_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_folha_pagamento_contas_pagar` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_fornecedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_fornecedor` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_foto_veiculo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_foto_veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_foto_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_funcionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_locacao: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_locacao` DISABLE KEYS */;
INSERT INTO `tbl_locacao` (`id_locacao`, `id_cliente_locador`, `id_anuncio`, `valor_locacao`, `data_hora_final`, `id_percentual`) VALUES
	(1, 8, 4, 200, '2019-04-01 00:00:00', 1),
	(2, 8, 4, 300, '2019-04-01 00:00:00', 1),
	(3, 8, 4, 300, '2019-04-01 00:00:00', 1),
	(4, 8, 4, 300, '2019-04-01 00:00:00', 1),
	(5, 10, 2, 300, '2019-04-01 00:00:00', 1);
/*!40000 ALTER TABLE `tbl_locacao` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_locacao_conta_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_locacao_conta_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao_conta_pagar` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_locacao_conta_receber: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_locacao_conta_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_locacao_conta_receber` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_marca_veiculo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_marca_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_marca_veiculo` (`id_marca_veiculo`, `nome_marca`) VALUES
	(1, 'Fiat'),
	(2, 'Hyundai'),
	(3, 'Honda');
/*!40000 ALTER TABLE `tbl_marca_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_marca_veiculo_tipo_veiculo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_marca_veiculo_tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_marca_veiculo_tipo_veiculo` (`id_tipo_marca`, `id_tipo_veiculo`, `id_marca_veiculo`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3);
/*!40000 ALTER TABLE `tbl_marca_veiculo_tipo_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_melhores_avaliacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_melhores_avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_melhores_avaliacoes` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_menu: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` (`id_menu`, `nome_menu`, `href`, `icone`) VALUES
	(1, 'Cadastrar niveis', 'view/niveis/cadatro_niveis.php', 'view/imagem/icones/cliente.png');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_modelo_veiculo: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_modelo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_modelo_veiculo` (`id_modelo`, `nome_modelo`, `id_marca_tipo`) VALUES
	(1, 'Palio', 1),
	(2, 'HB20', 2),
	(3, 'Civic', 3),
	(4, 'Bravo', 1),
	(5, 'I30', 2),
	(6, 'City', 3);
/*!40000 ALTER TABLE `tbl_modelo_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_niveis: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_niveis` DISABLE KEYS */;
INSERT INTO `tbl_niveis` (`id_niveis`, `nome_nivel`, `descricao`) VALUES
	(2, 'Matheys', 'asda'),
	(3, 'asd', 'asda'),
	(4, 'asd', 'asda'),
	(5, 'asd', 'asda'),
	(6, 'asd', 'asda'),
	(7, 'asd', 'asda'),
	(8, 'asd', 'asda'),
	(9, 'asd', 'asda'),
	(10, 'asd', 'asda'),
	(11, 'asd', 'asda'),
	(12, 'asd', 'asda'),
	(13, 'asd', 'asda'),
	(14, 'asd', 'asda'),
	(15, 'asd', 'asda'),
	(16, 'asd', 'asda'),
	(17, 'asd', 'asda'),
	(18, 'asd', 'asda');
/*!40000 ALTER TABLE `tbl_niveis` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_niveis_menu: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_niveis_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_niveis_menu` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_operacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_operacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_operacoes_contas_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_operacoes_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes_contas_pagar` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_operacoes_contas_receber: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_operacoes_contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_operacoes_contas_receber` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_pagina_sobre: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_pagina_sobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pagina_sobre` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_pagina_tutorial: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_pagina_tutorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pagina_tutorial` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_pedido_contas_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_pedido_contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_contas_pagar` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_pedido_produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_pedido_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido_produto` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_percentual_desconto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_percentual_desconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_percentual_desconto` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_permissoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_permissoes` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_principais_anuncios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_principais_anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_principais_anuncios` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_salario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_salario` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_seja_parceiro: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_seja_parceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seja_parceiro` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_setor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_setor` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_tabela_precos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_tabela_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tabela_precos` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_termos_uso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_termos_uso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_termos_uso` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_tipo_veiculo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_tipo_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_tipo_veiculo` (`id_tipo_veiculo`, `nome_tipo_veiculo`) VALUES
	(1, 'Carro'),
	(2, 'Moto');
/*!40000 ALTER TABLE `tbl_tipo_veiculo` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_usuario_cms: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_usuario_cms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_cms` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_usuario_desktop: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_usuario_desktop` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_desktop` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_usuario_desktop_permissoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_usuario_desktop_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario_desktop_permissoes` ENABLE KEYS */;

-- Copiando dados para a tabela mob_share.tbl_veiculo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tbl_veiculo` DISABLE KEYS */;
INSERT INTO `tbl_veiculo` (`id_veiculo`, `ano`, `placa`, `quilometragem`, `renavam`, `id_tipo_veiculo`, `id_marca_veiculo`, `id_modelo_veiculo`, `id_cliente`) VALUES
	(6, '2015', 'xxx0011', '12000', '13', 1, 1, 1, 12),
	(7, '2010', 'xxx0011', '13000', '14', 1, 2, 4, 7),
	(8, '2016', 'xxx0011', '14000', '15', 1, 3, 6, 9),
	(9, '2017', 'xxx0011', '15000', '16', 1, 2, 5, 11);
/*!40000 ALTER TABLE `tbl_veiculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
