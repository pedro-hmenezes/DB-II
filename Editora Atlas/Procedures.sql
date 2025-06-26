-- 01 CADASTRAR LIVRO
delimiter //
create procedure cadastrar_livro(
    in p_isbn varchar(17),
    in p_titulo varchar(70),
    in p_genero varchar(25),
    in p_descricao varchar(255),
    in p_numeropagina int,
    in p_datapublicacao date
)
begin
    insert into livro (isbn, titulo, genero, descricao, numeroPagina, dataPublicacao)
    values (p_isbn, p_titulo, p_genero, p_descricao, p_numeropagina, p_datapublicacao);
end //
delimiter ;

-- Teste
call cadastrar_livro(
    '978-0743273565',
    'O Código Da Vinci',
    'Suspense',
    'Um simbologista americano se envolve em um mistério complexo em Paris.',
    454,
    '2003-03-18'
);

-- 02 CADASTRO AUTOR
delimiter $$
create procedure cadastrar_autor(
    in p_idAutor int,
	in p_nome varchar(60), 
	in p_biografia varchar(140), 
	in p_nacionalidade varchar(25), 
	in p_dataNasc date,
	in p_obras varchar(70), 
	in p_email varchar(45)
)
begin
    declare v_id_existe int;
    declare v_email_existe int;
    
    -- Verifica se o CPF já existe
    select COUNT(*) into v_id_existe
    from Autor
    where idAutor = p_idAutor;
    
    if v_id_existe > 0 then
        signal sqlstate '45000'
        set message_text = 'ID Já existe.';
    end if;
    
    select COUNT(*) into v_email_existe
    from Autor
    where email = p_email;
    
    if v_email_existe > 0 then
        signal sqlstate '45000'
        set message_text = 'E-mail já cadastrado.';
    end if;
    
    insert into Autor (idAutor, nome, biografia, nacionalidade, dataNasc, obras, email)
    values (p_idAutor, p_nome, p_biografia, p_nacionalidade, p_dataNasc, p_obras, p_email);
    
    select CONCAT('Autor ', p_nome, ' cadastrado com sucesso! ID: ', p_idAutor) AS Mensagem;
end$$
delimiter ;

-- Teste Cadastro de um autor válido
call cadastrar_autor(
    12,
    'Ayato Mochizuki',
    'Um dos mais brilhantes escritores da sua geração',
    'Japonês',
    '1998-04-08',
    'O Ultimo Samurai',
    'ayatomochizuki@gmail.com'
);

-- 03 ATUALIZAR PREÇO DO LIVRO
alter table exemplar 
add column preco decimal(6,2);

delimiter $$
create procedure atualizar_preco_livro(
    in p_isbn varchar(17),
    in p_novoPreco decimal(6,2)
)
begin
    declare v_exemplar_existe int;

    select count(*) into v_exemplar_existe
    from exemplar
    where Livro_isbn = p_isbn;
    
    if v_exemplar_existe = 0 then
        signal sqlstate '45000'
        set message_text = 'Nenhum exemplar encontrado para este ISBN.';
    end if;
    
    if p_novoPreco <= 0 then
        signal sqlstate '45000'
        set message_text = 'O preço deve ser maior que zero.';
    end if;
    
    update exemplar
    set preco = p_novoPreco
    where Livro_isbn = p_isbn;
    
    select concat('Preço do livro (ISBN: ', p_isbn, ') atualizado com sucesso para R$', format(p_novoPreco, 2, 'de_DE'), '!') as mensagem;
end$$
delimiter ;

-- Teste procedure atualizar preço
update exemplar set preco = 79.90 where Livro_isbn = '9788572329793'; -- Fundação
call atualizar_preco_livro('9788572329793', 89.90);
    
-- 04 CADASTRAR ÁREA DE CONHECIMENTO
delimiter $$
create procedure cadastrar_area_conhecimento(
    in p_codigoArea int,
    in p_descricao varchar(140),
    in p_sigla varchar(10)
)
begin
    declare codigoExiste int;

    select count(*) into codigoExiste
    from areadeconhecimento
    where codigoarea = p_codigoArea;

    if codigoExiste > 0 then
        signal sqlstate '45000' set message_text = 'código da área já existe.';
    end if;

    insert into areadeconhecimento (codigoarea, descricao, sigla)
    values (p_codigoArea, p_descricao, p_sigla);

    select concat('área de conhecimento "', p_descricao, '" cadastrada com sucesso! código: ', p_codigoArea) as mensagem;

end$$
delimiter ;

-- Teste
call cadastrar_area_conhecimento(
    11,
    'Comédia',
    'COM'
);    

-- 05 CADASTRO DE CLIENTE FÍSICO
delimiter $$
create procedure cadastrar_cliente_pf(
    in p_idcliente int,
    in p_nome_cliente varchar(60),
    in p_telefone varchar(15),
    in p_email varchar(45),
    in p_cpf varchar(14),
    in p_genero_pf varchar(20),
    in p_data_nasc_pf date,
    in p_uf varchar(2),
    in p_cidade varchar(60),
    in p_bairro varchar(60),
    in p_rua varchar(70),
    in p_numero int,
    in p_complemento varchar(45),
    in p_cep varchar(9)
)
begin
    declare v_id_cliente_existe int;
    declare v_email_existe int;
    declare v_telefone_existe int;
    declare v_cpf_existe int;

    declare exit handler for sqlexception
    begin
        rollback;
        signal sqlstate '45000' set message_text = 'erro na transação';
    end;

    select count(*) into v_id_cliente_existe
    from cliente
    where idcliente = p_idcliente;

    if v_id_cliente_existe > 0 then
        signal sqlstate '45000' set message_text = 'id de cliente já cadastrado. por favor, use um id único.';
    end if;

    select count(*) into v_email_existe
    from cliente
    where email = p_email;

    if v_email_existe > 0 then
        signal sqlstate '45000' set message_text = 'e-mail já cadastrado para outro cliente.';
    end if;

    select count(*) into v_telefone_existe
    from cliente
    where telefone = p_telefone;

    if v_telefone_existe > 0 then
        signal sqlstate '45000' set message_text = 'telefone já cadastrado para outro cliente.';
    end if;

    select count(*) into v_cpf_existe
    from pessoafisica
    where cpf = p_cpf;

    if v_cpf_existe > 0 then
        signal sqlstate '45000' set message_text = 'cpf já cadastrado.';
    end if;

    if p_cpf is null or p_genero_pf is null or p_data_nasc_pf is null then
        signal sqlstate '45000' set message_text = 'cpf, gênero e data de nascimento são obrigatórios para pessoa física.';
    end if;

    start transaction;

    insert into cliente (idcliente, nome, nomefantasia, tipocliente, telefone, email)
    values (p_idcliente, p_nome_cliente, null, 'fisica', p_telefone, p_email);

    insert into pessoafisica (cpf, genero, datanasc, cliente_idcliente)
    values (p_cpf, p_genero_pf, p_data_nasc_pf, p_idcliente);

    insert into enderecopf (pessoafisica_cpf, uf, cidade, bairro, rua, numero, complemento, cep)
    values (p_cpf, p_uf, p_cidade, p_bairro, p_rua, p_numero, p_complemento, p_cep);

    commit;

    select concat('cliente pessoa física "', p_nome_cliente, '" (cpf: ', p_cpf, ') cadastrado com sucesso! id: ', p_idcliente) as mensagem;

end$$
delimiter ;

-- Teste cliente físico
call cadastrar_cliente_pf(
    1002,
    'Pedro Henrique Menezes Silva',
    '81997654321',
    'pedro.henrique@gmail.com',
    '787.656.343-99',
    'Masculino',
    '2000-06-10',
    'PE',
    'Recife',
    'Santo Amaro',
    'Rua dos Alfineiros',
    908,
    'apto 15',
    '51021-010'
);

-- 06 CADASTRAR VENDA
delimiter //
create procedure cadastrar_venda(
    in p_idvenda int,
    in p_data datetime,
    in p_desconto decimal(6,2),
    in p_pedido_idpedido int,
    in p_funcionario_cpf varchar(14),
    in p_cliente_idcliente int
)
begin
    declare v_pedido_existe int;
    declare v_cliente_existe int;
    declare v_funcionario_existe int;
    declare v_valor_total decimal(6,2) default 0;

    select count(*) into v_pedido_existe
    from pedido
    where idpedido = p_pedido_idpedido;

    select count(*) into v_cliente_existe
    from cliente
    where idcliente = p_cliente_idcliente;

    -- Verifica se o funcionário existe
    select count(*) into v_funcionario_existe
    from funcionario
    where cpf = p_funcionario_cpf;

    -- Validações
    if v_pedido_existe = 0 then
        signal sqlstate '45000'
        set message_text = 'erro: pedido não encontrado!';
    end if;

    if v_cliente_existe = 0 then
        signal sqlstate '45000'
        set message_text = 'erro: cliente não encontrado!';
    end if;

    if v_funcionario_existe = 0 then
        signal sqlstate '45000'
        set message_text = 'erro: funcionário não encontrado!';
    end if;

    select coalesce(sum(e.preco * ep.quantidade), 0) into v_valor_total
    from exemplarpedido ep
    join exemplar e on ep.exemplar_idexemplar = e.idexemplar
    where ep.pedido_idpedido = p_pedido_idpedido
    and e.preco is not null;
    
    insert into venda (idvenda, data, valor, desconto, pedido_idpedido, funcionario_cpf, cliente_idcliente)
    values (p_idvenda, p_data, v_valor_total - ifnull(p_desconto, 0), p_desconto, p_pedido_idpedido, p_funcionario_cpf, p_cliente_idcliente);

end //
delimiter ;

-- Teste
call cadastrar_venda(14, '2025-06-26 12:20:00', 10.00, 2, '111.222.333-44', 2);
select * from venda where idVenda = 14;
