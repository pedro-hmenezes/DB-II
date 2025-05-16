create view vw_localizacao_exemplar_orgulho_preconceito as
select loc.localizacao_Fisica as 'Localização do Livro'
from exemplar loc
join livro liv on loc.Livro_isbn = liv.isbn
where liv.titulo = 'Orgulho e Preconceito';

create view vw_clientes_fisicos_vip as
select cli.nome as 'Nome do Cliente',
       cli.tipoCliente as 'Tipo do Cliente'
from pedido ped
join cliente cli on ped.Cliente_idCliente = cli.idCliente
where cli.tipoCliente = 'VIP';

create view vw_clientes_pedidos_aprovados as
select cli.nome as 'Nome do Cliente',
       ped.statusPedido as 'Situação do Pedido'
from pedido ped
join cliente cli on ped.Cliente_idCliente = cli.idCliente
where ped.statusPedido = 'Aprovado';

create view vw_clientes_pj_fora_pe as
select cli.nome as 'Nome do Cliente',
       est.uf as 'Estado (UF)'
from cliente cli
join pessoajuridica pj on pj.Cliente_idCliente = cli.idCliente
join enderecopj est on est.PessoaJuri_cnpj = pj.cnpj
where est.uf <> 'PE';

create view vw_mulheres_salario_maior_2500 as
select fun.nome as 'Nome da Funcionaria', 
       fun.genero as 'Gênero',
       fun.salario as 'Salário'
from funcionario fun
join funcionario func on fun.cpf = func.cpf
where func.salario > 2500
  and func.genero = 'Feminino';

create view vw_funcionarios_menos_40_solteiros_divorciados as
select fun.nome as 'Nome Funcionario',
       fun.estadoCivil as 'Estado Civil',
       date_format(fun.dataNasc, '%d/%m/%Y') as 'Data de Nascimento'
from funcionario fun
join funcionario func on fun.cpf = func.cpf
where func.dataNasc < '1985-01-01' 
  and func.estadoCivil in ('Solteiro','Divorciado');

create view vw_funcionarios_moram_recife as
select f.nome as 'Nome do Funcionário',
       e.cidade as 'Cidade'
from funcionario f
join enderecofunc e on f.cpf = e.Funcionario_cpf
where e.cidade = 'Recife';

create view vw_responsaveis_departamentos_email as
select dep.nomeDepartamento as 'Departamento',
       fun.nome as 'Responsável',
       dep.email as 'Email para contato'
from departamento dep
join funcionario fun on dep.Funcionario_cpf = fun.cpf;

create view vw_responsaveis_departamentos_salario as
select d.nomeDepartamento as 'Departamento',
       f.nome as 'Responsável',
       f.salario as 'Salário'
from departamento d
join funcionario f on d.Funcionario_cpf = f.cpf;

create view vw_autores_brasileiros_com_livros as
select aut.nome as 'Autor Brasileiro',
       liv.titulo as 'Livro'
from autor aut
join livroautor la on aut.idAutor = la.Autor_idAutor
join livro liv on la.Livro_isbn = liv.isbn
where aut.nacionalidade = 'Brasileira';
