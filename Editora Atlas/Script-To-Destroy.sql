-- Desabilitar restrições de chave estrangeira
SET FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE;
SET SQL_MODE = '';

-- Destruir views
DROP VIEW IF EXISTS 
    `EditoraAtlas`.`LivrosPequenos`,
    `EditoraAtlas`.`PalavrasLivros`,
    `EditoraAtlas`.`AreaLivros`,
    `EditoraAtlas`.`LivrosNovosEstoque`,
    `EditoraAtlas`.`FuncionarioSalarioAlto`,
    `EditoraAtlas`.`ClienteTotalCompras`,
    `EditoraAtlas`.`ClientesLivrosUsados`,
    `EditoraAtlas`.`LocalizacaoOrgulhoPreconceito`,
    `EditoraAtlas`.`ClientesVIP`,
    `EditoraAtlas`.`FuncionariosRecife`;

DROP VIEW IF EXISTS 
    `editoraatlas`.`LivrosPequenos`,
    `editoraatlas`.`PalavrasLivros`,
    `editoraatlas`.`AreaLivros`,
    `editoraatlas`.`LivrosNovosEstoque`,
    `editoraatlas`.`FuncionarioSalarioAlto`,
    `editoraatlas`.`ClienteTotalCompras`,
    `editoraatlas`.`ClientesLivrosUsados`,
    `editoraatlas`.`LocalizacaoOrgulhoPreconceito`,
    `editoraatlas`.`ClientesVIP`,
    `editoraatlas`.`FuncionariosRecife`;
    
-- Destruir tabelas
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
    `EditoraAtlas`.`Autor`,
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
    `editoraatlas`.`autor`,
    `editoraatlas`.`palavrachave`,
    `editoraatlas`.`areadeconhecimento`;

-- Remover o schema
DROP SCHEMA IF EXISTS `EditoraAtlas`;

-- Restaurar as restrições
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_MODE = @OLD_SQL_MODE;