alter table areadeconhecimento
	add column sigla varchar(10);

alter table exemplar
	change column estado estadoLivro varchar(50) null;

alter table exemplar
	modify column localizacao_Fisica varchar(80) not null;    

alter table exemplar
	add column idioma varchar(30) not null;

alter table exemplarpedido
	add column quantidade int not null;

alter table livro
	drop column idLivro;
    
alter table livro
	modify column descricao varchar(255) null;
    
alter table venda
	add column observacoes varchar(140) null;

alter table funcionario
	add column dataDem datetime null after dataAdm;

alter table Funcionario
	add constraint chk_salario_positivo
		check (salario >= 0);
