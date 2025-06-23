-- 01 VALOR TOTAL DAS VENDAS PARA UM CLIENTE ESPECÍFICO
delimiter $$
create function totalVendaCliente(p_idCliente INT)
returns varchar(255) deterministic
begin
		declare totalVenda decimal(6,2);
		declare totalDesc decimal(6,2);
		declare clienteExiste int;
		declare nomeCliente varchar(60);
			
	select count(*), nome into clienteExiste, nomeCliente 
	from cliente
	where idCliente = p_idCliente
	group by nome;
		
	if clienteExiste = 0 then 
		return 'Cliente não encontrado: 0.00';
	end if;
		
	select sum(valor) into totalVenda 
	from venda 
	where cliente_idCliente = p_idCliente;
    
    select sum(ifnull(desconto, 0)) into totalDesc 
    from venda 
    where cliente_idCLiente = p_idCliente;
    
    set totalVenda = ifnull(totalVenda, 0) - ifnull(totalDesc, 0);
    
    return concat(nomeCliente, ': ', concat('R$ ', format(totalVenda, 2, 'de_DE')));
end $$
delimiter ;

-- Teste da função totalVendaCliente
SELECT totalVendaCliente(10) AS 'Total vendido para o cliente';

-- 02 EXEMPLARES DISPONIVEIS NO ESTOQUE
delimiter $$
create function exemplaresDisponiveis (p_isbn varchar(17))
returns int deterministic
begin
		declare livroExiste int;
        declare totalExemplar int;
        declare tituloLivro varchar(70);
	
    select count(*), max(titulo) into livroExiste, tituloLivro
    from livro
    where isbn = p_isbn;
    
    if livroExiste = 0 then
		return 0;
	end if;
    
    select sum(qtdLivro) into totalExemplar
    from exemplar
    where Livro_isbn = p_isbn
    and estadoLivro in ('Novo', 'Usado - Bom');
    
    set totalExemplar = ifnull(totalExemplar, 0);
    
    return totalExemplar;
end $$
delimiter ;

-- Teste da função exemplaresDisponiveis
select exemplaresDisponiveis('9788535901784') as 'Quantidade de exemplares disponiveis';

-- 03 TEMPO QUE O LIVRO FOI PUBLICADO
delimiter $$
create function tempoDoLivro (p_isbn varchar(17))
returns varchar(225) deterministic
begin
		declare dtPubli date;
        declare livroExiste int;
        declare tmpLivro int;
        
	select count(*) into livroExiste
    from livro
    where isbn = p_isbn;
    
    if livroExiste = 0 then
		return 'Livro não encontrado';
	end if;
    
    select dataPublicacao into dtPubli
    from livro
    where isbn = p_isbn;
    
    set tmpLivro = timestampdiff(year, dtPubli, '2025-06-18');
    
    return concat('Esse livro foi publicado há ', tmpLivro, ' Anos atrás!');
    
end $$
delimiter ;

-- Teste da função tempoDoLivro
select tempoDoLivro(9788535902778) as 'Tempo de Publicação';

-- 04 BÔNUS DE VENDA (AUMENTO DE SALÁRIO)
delimiter $$
create function bonusDeSalario(p_cpf varchar(14))
returns varchar(225) deterministic
begin 
		declare funcExiste int;
        declare vSalario decimal (6,2);
        declare dept int;
        declare totalVendas int;
        declare aumento decimal (6,2);
        
	select count(*) into funcExiste
    from funcionario
    where cpf = p_cpf;
    
    if funcExiste = 0 then
		return 'Funcionário não existe';
	end if;
    
    select fun.salario, dep.idDepartamento into vSalario, dept
    from funcionario fun 
    join departamento dep on fun.cpf = dep.Funcionario_cpf
    where fun.cpf = p_cpf;
    
    select count(*) into totalVendas
    from venda ved
    join funcionario fun on ved.Funcionario_cpf = fun.cpf
    join departamento dep on fun.cpf = dep.Funcionario_cpf
    where dep.idDepartamento = dept;
    
    set aumento = vSalario * 1.05;
    if totalVendas >= 5 then
		set aumento = aumento + (vSalario * 0.02);
	end if;
    
    return aumento;
end $$
delimiter ;
-- Teste da função bonusDeSalario 
select bonusDeSalario('000.111.222-33') as 'Aumento';

    
    
    
    
        
        







