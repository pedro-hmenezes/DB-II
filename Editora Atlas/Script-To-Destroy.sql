-- Desabilitar restrições de chave estrangeira
SET FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE;
SET SQL_MODE = '';

-- Tabelas (duas variações de nome: EditoraAtlas e editoraatlas)
DROP TABLE IF EXISTS
    `EditoraAtlas`.`EnderecoPf`,
    `EditoraAtlas`.`EnderecoPj`,
    `EditoraAtlas`.`EnderecoFunc`,
    `EditoraAtlas`.`PessoaFisica`,
    `EditoraAtlas`.`PessoaJuridica`,
    `EditoraAtlas`.`FormaDePag`,
    `EditoraAtlas`.`PalavraLivro`,
    `EditoraAtlas`.`ExemplarPedido`,
    `EditoraAtlas`.`LivroAutor`,
    `EditoraAtlas`.`LivroArea`,
    `EditoraAtlas`.`Exemplar`,
    `EditoraAtlas`.`Venda`,
    `EditoraAtlas`.`Pedido`,
    `EditoraAtlas`.`Departamento`,
    `EditoraAtlas`.`Funcionario`,
    `EditoraAtlas`.`Cliente`,
    `EditoraAtlas`.`Livro`,
    `EditoraAtlas`.`PalavraChave`,
    `EditoraAtlas`.`AreaDeConhecimento`;

DROP TABLE IF EXISTS
    `editoraatlas`.`enderecopf`,
    `editoraatlas`.`enderecopj`,
    `editoraatlas`.`enderecofunc`,
    `editoraatlas`.`pessoafisica`,
    `editoraatlas`.`pessoajuridica`,
    `editoraatlas`.`formadepag`,
    `editoraatlas`.`palavralivro`,
    `editoraatlas`.`exemplarpedido`,
    `editoraatlas`.`livroautor`,
    `editoraatlas`.`livroarea`,
    `editoraatlas`.`exemplar`,
    `editoraatlas`.`venda`,
    `editoraatlas`.`pedido`,
    `editoraatlas`.`departamento`,
    `editoraatlas`.`funcionario`,
    `editoraatlas`.`cliente`,
    `editoraatlas`.`livro`,
    `editoraatlas`.`palavrachave`,
    `editoraatlas`.`areadeconhecimento`;

-- Views
DROP VIEW IF EXISTS 
	`EditoraAtlas`.`vw_localizacao_exemplar_orgulho_preconceito`,
	`EditoraAtlas`.`vw_clientes_fisicos_vip`,
	`EditoraAtlas`.`vw_clientes_pedidos_aprovados`,
	`EditoraAtlas`.`vw_clientes_pj_fora_pe`,
	`EditoraAtlas`.`vw_mulheres_salario_maior_2500`,
	`EditoraAtlas`.`vw_funcionarios_menos_40_solteiros_divorciados`,
	`EditoraAtlas`.`vw_funcionarios_moram_recife`,
	`EditoraAtlas`.`vw_responsaveis_departamentos_email`,
	`EditoraAtlas`.`vw_responsaveis_departamentos_salario`,
	`EditoraAtlas`.`vw_autores_brasileiros_com_livros`;

DROP VIEW IF EXISTS 
	`editoraatlas`.`vw_localizacao_exemplar_orgulho_preconceito`,
    `editoraatlas`.`vw_clientes_fisicos_vip`,
    `editoraatlas`.`vw_clientes_pedidos_aprovados`,
    `editoraatlas`.`vw_clientes_pj_fora_pe`,
    `editoraatlas`.`vw_mulheres_salario_maior_2500`,
    `editoraatlas`.`vw_funcionarios_menos_40_solteiros_divorciados`,
    `editoraatlas`.`vw_funcionarios_moram_recife`,
    `editoraatlas`.`vw_responsaveis_departamentos_email`,
    `editoraatlas`.`vw_responsaveis_departamentos_salario`,
    `editoraatlas`.`vw_autores_brasileiros_com_livros`;

-- Executar DROP de PROCEDURES dinamicamente
SET @schema = 'EditoraAtlas';
SET @sql := (
  SELECT GROUP_CONCAT(CONCAT('DROP PROCEDURE IF EXISTS `', ROUTINE_SCHEMA, '`.`', ROUTINE_NAME, '`') SEPARATOR '; ')
  FROM information_schema.ROUTINES
  WHERE ROUTINE_SCHEMA = @schema AND ROUTINE_TYPE = 'PROCEDURE'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Executar DROP de FUNCTIONS dinamicamente
SET @sql := (
  SELECT GROUP_CONCAT(CONCAT('DROP FUNCTION IF EXISTS `', ROUTINE_SCHEMA, '`.`', ROUTINE_NAME, '`') SEPARATOR '; ')
  FROM information_schema.ROUTINES
  WHERE ROUTINE_SCHEMA = @schema AND ROUTINE_TYPE = 'FUNCTION'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Executar DROP de TRIGGERS dinamicamente
SET @sql := (
  SELECT GROUP_CONCAT(CONCAT('DROP TRIGGER IF EXISTS `', TRIGGER_SCHEMA, '`.`', TRIGGER_NAME, '`') SEPARATOR '; ')
  FROM information_schema.TRIGGERS
  WHERE TRIGGER_SCHEMA = @schema
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Remover o schema
DROP SCHEMA IF EXISTS `EditoraAtlas`;

-- Restaurar as restrições
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_MODE = @OLD_SQL_MODE;
