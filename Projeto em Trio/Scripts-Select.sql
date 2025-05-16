-- 1. Livros com mais de 200 páginas
SELECT * FROM Livro WHERE numeroPagina > 200;

-- 2. Livros publicados antes do ano 2000
SELECT * FROM Livro WHERE dataPublicacao < '2000-01-01';

-- *3. Quantidade de livros do gênero 'Romance'
SELECT COUNT(*) AS QuantidadeRomance FROM Livro WHERE genero = 'Romance';

-- 4. Exemplares em estado 'Novo'
SELECT * FROM Exemplar WHERE estadoLivro = 'Novo';

-- 5. Quantidade de exemplares em português
SELECT COUNT(*) AS QuantidadePortugues FROM Exemplar WHERE idioma = 'Português';

-- 6. Quantidade de exemplares em inglês
SELECT COUNT(*) AS QuantidadeIngles FROM Exemplar WHERE idioma = 'Inglês';

-- 7. Quantidade de exemplares em francês
SELECT COUNT(*) AS QuantidadeFrances FROM Exemplar WHERE idioma = 'Francês';

-- 8. Quanto foi usado de cada forma de pagamento
select fpag.tipoPagamento as 'Forma de Pagamento',
       (select COUNT(*) 
        from FormaDePag fpag2 
        where fpag2.tipoPagamento = fpag.tipoPagamento) as 'Total de Usos'
			from FormaDePag fpag
				group by fpag.tipoPagamento
					order by 'Total de Usos' desc;

-- 9. Vendas feitas abaixo de 100 reais
select ved.idVenda as 'ID da Venda',
       cli.nome as 'Nome do Cliente',
       ved.valor as 'Valor da Venda'
		from Venda ved
			join Cliente cli on ved.Cliente_idCliente = cli.idCliente
				where ved.valor < 100;

-- 10. Localização física dos exemplares do livro ‘Orgulho e Preconceito’
select loc.localizacao_Fisica as 'Localização do Livro'
	from Exemplar loc
		join Livro liv on loc.Livro_isbn = liv.isbn
			where liv.titulo = 'Orgulho e Preconceito';

-- 11. Nome dos clientes físicos que são VIP
select cli.nome as 'Nome do Cliente',
		cli.tipoCliente as 'Tipo do Cliente'
			from Pedido ped
				join Cliente cli on ped.Cliente_idCliente = cli.idCliente
					where cli.tipoCliente = 'VIP';

-- 12. Nome dos clientes com pedidos apovados
select cli.nome as 'Nome do Cliente',
	ped.statusPedido as 'Situação do Pedido'
        from Pedido ped
			join Cliente cli on ped.Cliente_idCliente = cli.idCliente
                where ped.statusPedido = 'Aprovado';
                
-- 13. Clientes pj que não são de PE
select cli.nome as 'Nome do Cliente',
       est.uf as 'Estado (UF)'
		from Cliente cli
			join PessoaJuridica pj on pj.Cliente_idCliente = cli.idCliente
			join enderecopj est on est.PessoaJuri_cnpj = pj.cnpj
				where est.uf <> 'PE';

-- 14. Mulheres que ganham mais de 2500
select fun.nome as 'Nome da Funcionaria', 
		fun.genero as 'Gênero',
		fun.salario as 'Sálario'
		from Funcionario fun
			join Funcionario func on fun.cpf = func.cpf
				where func.salario > 2500
				  and func.genero = 'Feminino';
 
 -- 15. Funcionarios que tem menos de 40 anos e são solteiros e divorciados
select fun.nome as 'Nome Funcionario',
		fun.estadoCivil as 'Estado Civil',
		date_format(fun.dataNasc, '%d/%m/%Y') as 'Data de Nascimento'
	from funcionario fun
		join Funcionario func on fun.cpf = func.cpf
			where func.dataNasc < '1985-01-01' 
				and func.estadoCivil in ('Solteiro','Divorciado');

-- 16. Quais moram em Recife                
select f.nome as 'Nome do Funcionário',
       e.cidade as 'Cidade'
		from Funcionario f
			join EnderecoFunc e on f.cpf = e.Funcionario_cpf
				where e.cidade = 'Recife';
-- 17. Responsavel por cada departamento e emial pra contato                
select dep.nomeDepartamento as 'Departamento',
       fun.nome as 'Responsável',
       dep.email as 'Email para contato'
		from Departamento dep
			join Funcionario fun on dep.Funcionario_cpf = fun.cpf;

-- 18. Responsavel por departamento e salario
select d.nomeDepartamento as 'Departamento',
       f.nome as 'Responsável',
       f.salario as 'Salário'
		from Departamento d
			join Funcionario f on d.Funcionario_cpf = f.cpf;

-- 19 Autores que são brasileiros e seus livros
select aut.nome as 'Autor Brasileiro',
       liv.titulo as 'Livro'
		from Autor aut
			join LivroAutor la on aut.idAutor = la.Autor_idAutor
			join Livro liv on la.Livro_isbn = liv.isbn
				where aut.nacionalidade = 'Brasileira';

-- 20 Livros no sistemas e suas quantidades                
select liv.titulo as 'Título do Livro',
       exp.quantidade as 'Quantidade'
    from ExemplarPedido exp
      join Exemplar ex on exp.Exemplar_idExemplar = ex.idExemplar
      join Livro liv on ex.Livro_isbn = liv.isbn;
