-- Relátorio 01
select empr.nome "Nome do Empregado",
				empr.cpf "CPF do Empregado",
        date_format(empr.dataAdm, '%d/%m/%Y') "Data de Admissão",
        concat("R$ ", format(empr.salario, 2, 'de_DE')) "Salário",
        ifnull(tel.numero, "Não informado") "Telefone",
        dep.nome "Departamento"
				from empregado empr
				join departamento dep on empr.departamento_iddepartamento = dep.idDepartamento
				left join telefone tel on empr.cpf = tel.empregado_cpf
				where empr.dataAdm between '2023-01-01' and '2024-03-31'
					order by empr.dataAdm desc;
    
-- Relátorio 02
select empr.nome "Nome do Empregado",
				empr.cpf "CPF do Empregado",
        date_format(empr.dataAdm, '%d/%m/%Y') "Data de Admissão",
        concat("R$ ", format(empr.salario, 2, 'de_DE')) "Salário abaixo da média",
        ifnull(tel.numero, "Não informado") "Telefone",
        dep.nome "Departamento"
				from empregado empr
        join departamento dep on empr.departamento_iddepartamento = dep.idDepartamento
				left join telefone tel on empr.cpf = tel.empregado_cpf
	      where empr.salario < (select avg(salario) from empregado)
					order by empr.nome asc;

-- Relátorio 03
select dep.nome "Nome do Departamento",
				count(empr.cpf) "Quantidade de Empregados por Departamentos",
				concat("R$ ", format(avg(empr.salario), 2, 'de_DE')) "Média Salarial",
        ifnull(concat('R$ ', format(avg(empr.comissao), 2, 'de_DE' )),'Sem Comissão') "Média Comissão"
				from departamento dep
				left join empregado empr on dep.idDepartamento = empr.departamento_idDepartamento
					group by dep.nome
					order by dep.nome asc;
	        
-- Relátorio 04
select empr.nome "Nome do Empregado",
				empr.cpf "CPF do Empregado",
        empr.sexo "Sexo",
        concat("R$ ", format(empr.salario, 2, 'de_DE')) "Salário",
        count(ved.idVenda) "Quantidade de Vendas",
        concat('R$ ', format(ifnull(sum(ved.valor), 0), 2, 'de_DE' )) "Valor Total Vendido",
        concat('R$ ', format(ifnull(sum(ved.comissao), 0), 2, 'de_DE' )) "Valor Total das Comissões"
				from empregado empr
				left join venda ved on empr.cpf = ved.empregado_cpf
					group by empr.nome, empr.cpf, empr.sexo, empr.salario
					order by 5;
                			
-- Relátorio 05
select empr.nome "Nome do Empregado",
				empr.cpf "CPF do Empregado",
        empr.sexo "Sexo",
        concat("R$ ", format(empr.salario, 2, 'de_DE')) "Salário",
        count(iserv.venda_idvenda) "Quantidade de Vendas com Serviço",
				concat('R$ ', format(ifnull(sum(iserv.valor), 0), 2, 'de_DE' )) "Valor Total Vendido com Serviço",
        concat('R$ ', format(ifnull(sum(ved.comissao), 0), 2, 'de_DE' )) "Valor Total das Comissões"
				from empregado empr
				inner join itensservico iserv on empr.cpf = iserv.empregado_cpf
        join venda ved on iserv.venda_idvenda = ved.idvenda
					group by empr.nome, empr.cpf, empr.sexo, empr.salario
					order by `Valor Total Vendido com Serviço` desc;
                
-- Relátorio 06
select p.nome "Nome do Pet",
				serv.nome "Serviço Realizado",
        iserv.quantidade "Quantidade do Serviço",
        concat('R$ ', format(iserv.valor, 2, 'de_DE')) "Valor Unitário do Serviço",
        concat('R$ ', format(iserv.quantidade * iserv.valor, 2, 'de_DE')) "Valor Total do Serviço",
        empr.nome "Empregado que relizou o serviço"
				from itensservico iserv
				join pet p on iserv.PET_idPET = p.idPET
				join servico serv on iserv.Servico_idServico = serv.idServico
				join empregado empr on iserv.Empregado_cpf = empr.cpf
					group by p.nome, serv.nome, iserv.quantidade, iserv.valor, iserv.quantidade * iserv.valor, empr.nome
          order by iserv.valor desc;
                
-- Relátorio 07
select date_format(ved.data, '%h:%i | %d/%m/%Y') "Hora e Data da Venda",
				concat('R$ ', format(ved.valor, 2, 'de_DE')) "Valor da Venda",
        concat('R$ ', format(ved.desconto, 2, 'de_DE')) "Valor de Desconto",
        concat('R$ ', format(ved.valor - ved.desconto, 2, 'de_DE')) "Valor Final",
        empr.nome "Empregado que realizou a venda"
				from venda ved
				inner join empregado empr on ved.Empregado_cpf = empr.cpf
					order by ved.data desc;
                
-- Relátorio 08
select serv.nome "Nome do Serviço",
				sum(iserv.quantidade) "Quantidade de Vendas",
		    concat ('R$ ', format(sum(iserv.quantidade * iserv.valor), 2, 'de_DE')) "Valor Total Vendido"
				from servico serv
				inner join itensservico iserv on serv.idServico = iserv.Servico_idServico
					group by serv.idServico, serv.nome
					order by sum(iserv.quantidade * iserv.valor) desc;
            
-- Relátorio 09 
select fpag.tipo "Tipo da Forma de Pagamento",
				count(distinct fpag.Venda_idVenda) "Quantidade de Realizada Vendas",
        concat('R$', format(sum(ved.valor), 2, 'de_DE')) "Total Vendido"
				from formapgvenda fpag
				join venda ved on fpag.Venda_idVenda = ved.idVenda
					group by fpag.tipo
					order by `Quantidade de Realizada Vendas` desc;
                
-- Relátorio 10
select date_format(ved.data, '%h:%i | %d/%m/%Y') "Hora e Data da Venda",
				count(ved.idVenda) "Quantidade de Vendas",
        concat('R$ ', format(sum(ved.valor), 2, 'de_DE')) "Valor Total Vendido",
        concat('R$ ', format(sum(fpag.valorPago), 2, 'de_DE')) "Total Pago nas Formas de Pagamento"
				from venda ved
				join formapgvenda fpag on ved.idVenda = fpag.Venda_idVenda
					group by ved.data
					order by ved.data asc;
            
-- Relatório 11
select prod.nome "Nome do Produto",
				concat('R$ ', format(prod.valorVenda, 2, 'de_DE')) "Valor do Produto",
        prod.marca "marca do Produto",
        forn.nome "Nome do Fornecedor",
        forn.email "Email do Fornecedor",
        ifnull(tel.numero, 'Não Informado') "Telefone do Fornecedor"
			from produtos prod
			join itenscompra itnc on prod.idProduto = itnc.Produtos_idProduto
			join compras comp on itnc.Compras_idCompra = comp.idCompra
			join fornecedor forn on comp.Fornecedor_cpf_cnpj = forn.cpf_cnpj
			left join telefone tel on forn.cpf_cnpj = tel.Fornecedor_cpf_cnpj
				order by prod.nome;
                
-- Relatório 12
Select prod.nome "Nome do Produto",
				count(itnc.Produtos_idProduto) "Quantidade Total de Vendas",
        concat('R$ ', format(sum(itnc.quantidade * prod.valorVenda), 2, 'de_De')) "Valor Total da Venda do Produto"
        from produtos prod
        join itenscompra itnc on prod.idProduto = itnc.Produtos_idProduto
	        group by prod.idProduto, prod.nome, prod.valorVenda
	        order by `Quantidade Total de Vendas` desc;
      
