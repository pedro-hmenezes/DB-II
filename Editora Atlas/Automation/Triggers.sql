
-- 01 CONTROLA O ESTOQUE
delimiter //
create trigger controla_estoque
after insert on exemplarpedido
for each row
begin
    declare estoque_atual int;

    select qtdLivro into estoque_atual
    from exemplar
    where idExemplar = new.Exemplar_idExemplar;

    if estoque_atual < new.quantidade then
        signal sqlstate '45000'
        set message_text = 'Erro: Quantidade solicitada excede o estoque disponível!';
    else
        update exemplar
        set qtdLivro = qtdLivro - new.quantidade
        where idExemplar = new.Exemplar_idExemplar;
    end if;
end //
delimiter ;

-- Teste
select idExemplar, qtdLivro
from exemplar
where idExemplar = 1;

insert into exemplarpedido (idExemplarPedido, Exemplar_idExemplar, Pedido_idPedido, quantidade)
values (13, 1, 1, 3);

-- 02 ATUALIZA STATUS DO PEDIDO
delimiter //
create trigger atualiza_status_pedido
after insert on venda
for each row
begin
    -- Atualiza o status do pedido para 'Concluído'
    update pedido
    set statusPedido = 'Concluído'
    where idPedido = new.Pedido_idPedido;
end //
delimiter ;

-- Teste
select idPedido, statusPedido from pedido where idPedido = 11;

insert into venda (idVenda, data, valor, desconto, Pedido_idPedido, Funcionario_cpf, Cliente_idCliente)
values (15, '2025-06-25 21:30:00', 120.00, 0.00, 11, '888.999.000-11', 1);

-- 03 VERIFICA O EMAIL DO AUTOR
delimiter //
create trigger valida_email_autor
before insert on autor
for each row
begin
    if new.email not like '%@%' or new.email not like '%.%' then
        signal sqlstate '45000'
        set message_text = 'Erro: Formato de e-mail inválido para o autor.';
    end if;
end //
delimiter ;

-- Teste
insert into autor (idAutor, nome, biografia, nacionalidade, dataNasc, obras, email) values
(13, 'João Souza', 
'Historiador', 
'Portuguesa', 
'1965-03-10', 
'História Antiga', 
'joao.souza@email.com');


-- 04 DEFINE DATA DE ADMISSÃO
delimiter //
create trigger define_data_admissao
before insert on funcionario
for each row
begin
    if new.dataAdm is null then
        set new.dataAdm = current_date();
    end if;
end //
delimiter ;

-- Teste
insert into funcionario (cpf, nome, genero, estadoCivil, dataNasc, telefone, email, salario, cargo, dataDem) values
('123.456.789-01', 
'Novo Funcionario Teste', 
'Masculino', 
'Solteiro', 
'1990-01-01', 
'(81) 98765-4321', 
'novo.teste@atlas.com.br', 
3000.00, 
'Estagiário', 
null);

select cpf, nome, dataAdm
from funcionario
where cpf = '123.456.789-01';

-- 05 VERIFICA FORMAS DE PAGAMENTO
delimiter //
create trigger valida_parcelas_pagamento
before insert on formadepag
for each row
begin
    if (new.tipoPagamento = 'PIX' or new.tipoPagamento = 'Boleto') and new.parcelas > 1 then
        signal sqlstate '45000'
        set message_text = 'Erro: PIX e Boleto não podem ter mais de 1 parcela.';
    end if;
end //
delimiter ;

-- Teste
insert into formadepag (idPagamento, tipoPagamento, parcelas, valorPago, Venda_idVenda) values
(11, 'PIX', 1, 50.00, 1);

select * from formadepag
where idPagamento = 11;

-- ERRo
insert into formadepag (idPagamento, tipoPagamento, parcelas, valorPago, Venda_idVenda) values
(12, 'PIX', 3, 150.00, 1);

select *
from formadepag
where idPagamento = 12;

-- 06 IMPEDE A EXCLUSÃO DO CLIENTE 
delimiter //
create trigger impede_exclusao_cliente
before delete on cliente
for each row
begin
    declare pedido_count int;

    select count(*) into pedido_count
    from pedido
    where cliente_idcliente = old.idcliente;

    if pedido_count > 0 then
        signal sqlstate '45000'
        set message_text = 'erro: não é possível excluir o cliente pois ele tem pedidos associados!';
    end if;
end //
delimiter ;

-- Teste
select idCliente, nome from cliente where idCliente = 2;
select idPedido, Cliente_idCliente from pedido where Cliente_idCliente = 2;

delete from cliente where idCliente = 2;
