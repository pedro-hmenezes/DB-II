SET SQL_SAFE_UPDATES = 1;

update areadeconhecimento
	set sigla = 'SFI'
		where codigoArea = 3;

update exemplar
	set localizacao_Fisica = 'Estante A3'
		where Livro_isbn = '9788535902774';
        
update exemplar
	set idioma = 'Francês'
		where Livro_isbn = '9788535914845';
        
update exemplar
	set estadoLivro = 'Usado - Regular'
		where idExemplar = 9;
        
update funcionario
	set salario = salario + 50
		where cpf = '555.666.777-88';

update funcionario
	set salario = salario + 200
		where cpf in ('444.555.666-77', '555.666.777-88', '666.777.888-99', '000.111.222-33');

update funcionario 
	set dataNasc = '1989-02-17'
		where cpf = '000.111.222-33';
        
delete from cliente
	where idCliente = 19;
    
delete from venda
	where Pedido_idPedido = 3;

delete from pedido 
	where idPedido = 3 and statusPedido = 'Cancelado';
    
delete from exemplar
	where idExemplar = 4 and estadoLivro = 'Usado - Regular'; 
    
SET SQL_SAFE_UPDATES = 0;

update funcionario
	set salario = salario - 100
		where estadoCivil = 'Solteiro';

update pedido
	set statusPedido = 'Expirado'
		where dataPedido < '2024-01-31 23:59:00';
        
update venda 
	set desconto = 1.05
		where valor < 100;
        
update venda 
	set desconto = 5.00
		where valor >= 100;
        
update venda 
	set desconto = 10.00
		where valor >= 200;

update departamento
	set nomeDepartamento = 'FINANCEIRO'
		where descricaoAtv = 'Financeiro';
        
update departamento
	set email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@atlas.google.com.br');

update autor
	set email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@outlook.com')
		where nacionalidade in ('Americana', 'Francesa', 'Israelense');
        
update autor
	set email = CONCAT(SUBSTRING_INDEX(email, '@', 1), '@google.com')
		where nacionalidade in ('Brasileira', 'Britânica');
