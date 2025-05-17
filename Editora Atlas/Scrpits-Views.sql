create view LivrosPequenos as
	select aut.nome as Autor,
		   liv.titulo as Titulo,
		   liv.numeroPagina as Paginas
			from Livro liv
				join LivroAutor la on liv.isbn = la.Livro_isbn
				join Autor aut on la.Autor_idAutor = aut.idAutor
					where liv.numeroPagina <= 240;

create view PalavrasLivros as
	select liv.titulo as Livro,
		   pch.descricao as PalavraChave
			from PalavraLivro pl
				join PalavraChave pch on pl.PalavraChave_idPalavraChave = pch.idPalavraChave
				join Livro liv on pl.Livro_isbn = liv.isbn
					order by liv.titulo;

create view AreaLivros as
	select liv.titulo as Livro,
		   area.descricao as Area
			from LivroArea la
				join Livro liv on la.livro_isbn = liv.isbn
				join AreaDeConhecimento area on la.AreaDeCon_codigoArea = area.codigoArea;

create view LivrosNovosEstoque as
	select liv.titulo as Livro,
		   ex.localizacao_Fisica as Localizacao,
		   ex.qtdLivro as Quantidade
			from Exemplar ex
				join Livro liv on ex.Livro_isbn = liv.isbn
					where ex.estadoLivro = 'Novo'
						order by ex.qtdLivro asc;

create view FuncionarioSalarioAlto as
	select nome as Funcionario,
		   salario as Salario
			from Funcionario
				where salario > (select avg(salario) from Funcionario)
					order by salario asc;

create view ClienteTotalCompras as
	select cli.nome as Cliente,
		   sum(ep.quantidade) as TotalComprado
			from Cliente cli
				join Pedido ped on cli.idCliente = ped.Cliente_idCliente
				join ExemplarPedido ep on ped.idPedido = ep.Pedido_idPedido
					group by cli.idCliente
						order by TotalComprado;

create view ClientesLivrosUsados as
	select cli.nome as Cliente,
		   liv.titulo as Livro,
		   ex.estadoLivro as Estado
			from Cliente cli
				join Pedido ped on cli.idCliente = ped.Cliente_idCliente
				join ExemplarPedido ep on ped.idPedido = ep.Pedido_idPedido
				join Exemplar ex on ep.Exemplar_idExemplar = ex.idExemplar
				join Livro liv on ex.Livro_isbn = liv.isbn
					where ex.estadoLivro in ('Usado - Bom', 'Usado - Regular');

create view LocalizacaoOrgulhoPreconceito as
	select loc.localizacao_Fisica as Localizacao
		from Exemplar loc
			join Livro liv on loc.Livro_isbn = liv.isbn
				where liv.titulo = 'Orgulho e Preconceito';

create view ClientesVIP as
	select nome as Cliente
		from Cliente
			where tipoCliente = 'VIP';

create view FuncionariosRecife as
	select f.nome as Funcionario,
		   e.cidade as Cidade
		from Funcionario f
		join EnderecoFunc e on f.cpf = e.Funcionario_cpf
			where e.cidade = 'Recife';