-- 1. Livros com menos de 240 páginas
select aut.nome as 'Nome do Autor',
		liv.titulo as 'Título',
		liv.numeroPagina as 'Número de Páginas'
		from Livro liv
			join LivroAutor la on liv.isbn = la.Livro_isbn
			join Autor aut on la.Autor_idAutor = aut.idAutor
				where liv.numeroPagina <= 240;

-- 2. Todas as palavras chaves associadas a livros
select liv.titulo as 'Título do Livro',
       pch.descricao as 'Palavra-chave'
		from PalavraLivro pl
			join PalavraChave pch on pl.PalavraChave_idPalavraChave = pch.idPalavraChave
			join Livro liv on pl.Livro_isbn = liv.isbn
				order by liv.titulo;

-- 3. Área de conhecimento pertencente a cada livro
select liv.titulo as 'Título do Livro',
       area.descricao as 'Área de Conhecimento'
		from LivroArea la
			join Livro liv on la.livro_isbn = liv.isbn
			join AreaDeConhecimento area on la.AreaDeCon_codigoArea = area.codigoArea;

-- 4. Quais livros estão em estado novo, sua localização física e sua quantidade no estoque
select liv.titulo as 'Título do Livro',
       ex.estadoLivro as 'Estado',
       ex.localizacao_Fisica as 'Localização',
       ex.qtdLivro as 'Quantidade em Estoque'
		from Exemplar ex
			join Livro liv on ex.Livro_isbn = liv.isbn
			where ex.estadoLivro = 'Novo'
				order by ex.qtdLivro asc;

-- 5. Funcionarios que recebem mais que a média salarial
select fun.nome as 'Nome do Funcionário',
       fun.salario as 'Salário'
		from Funcionario fun
			where fun.salario > (select avg(salario) from Funcionario)
				order by fun.salario asc;

-- 6. Clientes e a quantidade de exemplares comprados
select cli.nome as 'Nome do Cliente',
       sum(ep.quantidade) as 'Total de Exemplares Comprados'
		from Cliente cli
			join Pedido ped on cli.idCliente = ped.Cliente_idCliente
			join ExemplarPedido ep on ped.idPedido = ep.Pedido_idPedido
				group by ep.Pedido_idPedido
					order by sum(ep.quantidade);

-- 7. Clientes que compraram o livro usado - bom e usado - regular
select cli.nome as 'Nome do Cliente',
	   liv.titulo as 'Título do Livro',
       ex.estadoLivro as 'Estado Livro'
		from Cliente cli
			join Pedido ped on cli.idCliente = ped.Cliente_idCliente
			join ExemplarPedido ep on ped.idPedido = ep.Pedido_idPedido
			join Exemplar ex on ep.Exemplar_idExemplar = ex.idExemplar
			join Livro liv on ex.Livro_isbn = liv.isbn
				where ex.estadoLivro in ('Usado - Bom', 'Usado - Regular');

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
			join Livro liv on ex.Livro_isbn = liv.isbn
				order by exp.quantidade asc;
