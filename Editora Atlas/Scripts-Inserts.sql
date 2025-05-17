-- Inserts na tabela Autor
INSERT INTO Autor (idAutor, nome, biografia, nacionalidade, dataNasc, obras, email) VALUES
(1, 'Carlos Drummond', 'Poeta modernista brasileiro', 'Brasileira', '1902-10-31', 'Sentimento do Mundo', 'drummond@email.com'),
(2, 'Machado de Assis', 'Considerado um dos maiores escritores brasileiros', 'Brasileira', '1839-06-21', 'Dom Casmurro', 'machado@email.com'),
(3, 'Clarice Lispector', 'Romancista e jornalista', 'Brasileira', '1920-12-10', 'A Hora da Estrela', 'clarice@email.com'),
(4, 'Isaac Asimov', 'Escritor de ficção científica e bioquímico', 'Americana', '1920-01-02', 'Fundação', 'asimov@email.com'),
(5, 'George Orwell', 'Autor de 1984 e Revolução dos Bichos', 'Britânica', '1903-06-25', '1984', 'orwell@email.com'),
(6, 'Albert Camus', 'Filósofo e escritor existencialista', 'Francesa', '1913-11-07', 'O Estrangeiro', 'camus@email.com'),
(7, 'Stephen Hawking', 'Físico teórico e cosmólogo', 'Britânica', '1942-01-08', 'Uma Breve História do Tempo', 'hawking@email.com'),
(8, 'Yuval Noah Harari', 'Historiador e filósofo', 'Israelense', '1976-02-24', 'Sapiens', 'harari@email.com'),
(9, 'Jane Austen', 'Romancista inglesa.', 'Britânica', '1775-12-16', 'Orgulho e Preconceito', 'austen@email.com'),
(10, 'Lya Luft', 'Poetisa e romancista brasileira', 'Brasileira', '1948-09-15', 'Perdas e Ganhos', 'lya@email.com');

-- Inserts na tabela Livro
INSERT INTO Livro (isbn, titulo, genero, descricao, numeroPagina, dataPublicacao) VALUES
('9788535902774', '1984', 'Ficção', 'Romance distópico sobre totalitarismo.', 328, '1949-06-08'),
('9788535901784', 'A Hora da Estrela', 'Drama', 'Narrativa introspectiva sobre a vida e a morte.', 96, '1977-10-01'),
('9788572329793', 'Fundação', 'Ficção Científica', 'Criação de um império galáctico.', 255, '1951-08-01'),
('9788582172760', 'Sapiens', 'História', 'Breve história da humanidade.', 464, '2011-06-01'),
('9788535904877', 'Dom Casmurro', 'Romance', 'Narrador tenta recontar seu passado.', 240, '1899-01-01'),
('9788572326655', 'O Estrangeiro', 'Filosofia', 'Reflexões existencialistas.', 160, '1942-01-01'),
('9788535930647', 'Sentimento do Mundo', 'Poesia', 'Poesias líricas e políticas.', 112, '1940-01-01'),
('9788535929450', 'Uma Breve História do Tempo', 'Ciência', 'Cosmologia explicada para leigos.', 240, '1988-01-01'),
('9788535914845', 'Orgulho e Preconceito', 'Romance', 'Relacionamentos e preconceitos sociais.', 352, '1813-01-28'),
('9788535933884', 'Perdas e Ganhos', 'Reflexão', 'Reflexões sobre vida, morte e escolhas.', 200, '2003-01-01');

-- Inserts na tabela AreaDeConhecimento
INSERT INTO AreaDeConhecimento (codigoArea, descricao, sigla) VALUES
(1, 'Ficção', 'FIC'),
(2, 'Drama', 'DRA'),
(3, 'Ficção Científica', 'FICCI'),
(4, 'História', 'HIS'),
(5, 'Romance', 'ROM'),
(6, 'Filosofia', 'FIL'),
(7, 'Poesia', 'POE'),
(8, 'Ciência', 'CIE'),
(9, 'Reflexão', 'REF');

-- Inserts na tabela PalavraChave
INSERT INTO PalavraChave (idPalavraChave, descricao) VALUES
(1, 'Distopia'),
(2, 'Totalitarismo'),
(3, 'Existencialismo'),
(4, 'Galáxia'),
(5, 'História da Humanidade'),
(6, 'Narrador Não Confiável'),
(7, 'Cosmologia'),
(8, 'Relacionamentos'),
(9, 'Reflexão sobre a Vida'),
(10, 'Poesia Social');

-- Inserts na tabela Exemplar
INSERT INTO Exemplar (idExemplar, estadoLivro, localizacao_Fisica, dataFabricacao, Livro_isbn, qtdLivro, idioma) VALUES
(1, 'Novo', 'Estante A1', '2021-01-01', '9788535902774', '7', 'Inglês'),
(2, 'Usado - Bom', 'Estante B2', '2015-07-15', '9788535901784', '1', 'Português'),
(3, 'Novo', 'Estante C3', '2022-03-20', '9788572329793', '3', 'Inglês'),
(4, 'Usado - Regular', 'Estante D1', '2010-11-05', '9788582172760', '5', 'Inglês'),
(5, 'Novo', 'Estante E5', '2023-06-10', '9788535904877', '13', 'Português'),
(6, 'Usado - Bom', 'Estante F4', '2018-09-30', '9788572326655', '4','Francês'),
(7, 'Novo', 'Estante A2', '2022-01-01', '9788535930647', '10','Português'),
(8, 'Novo', 'Estante B3', '2023-02-28', '9788535929450', '8', 'Inglês'),
(9, 'Usado - Bom', 'Estante C1', '2019-08-15', '9788535914845', '15', 'Inglês'),
(10, 'Novo', 'Estante D2', '2023-05-10', '9788535933884', '9', 'Português');

-- Inserts na tabela Cliente
INSERT INTO Cliente (idCliente, nome, nomeFantasia, tipoCliente, telefone, email) VALUES
(1, 'Pedro Miguel Barros', NULL, 'VIP', '(31) 6702-2109', 'pedromiguel@gmail.com'),
(2, 'Luiz Fernando Oliveira', NULL, 'Comum', '(61) 2017-2574', 'lfernandooliveira@hotmail.com'),
(3, 'Davi Lucas Ribeiro', NULL, 'VIP', '(82) 8997-6425', 'daviroliveira@gmail.com'),
(4, 'Ana Lívia Fogaça', NULL, 'VIP', '(87) 7458-3870', 'analiviafog@gmail.com'),
(5, 'Vicente da Rosa', NULL, 'Comum', '(11) 8213-7203', 'vicenterosa@gmail.com'),
(6, 'Júlia Pires', NULL, 'Comum', '(31) 3424-0722', 'julipires@gmail.com'),
(7, 'Lorenzo Oliveira', NULL, 'Comum', '(21) 8432-6006', 'oliveiralorenzo@gmail.com'),
(8, 'Samuel Farias', NULL, 'VIP', '(81) 2902-4022', 'samucafarias@hotmail.com'),
(9, 'Beatriz Nascimento', NULL, 'Comum', '(71) 3153-5167', 'beanascimento@gmail.com'),
(10, 'Giovanna Moraes', NULL, 'VIP', '(84) 6775-6306', 'giomorais@gmail.com'),
(11, 'Livraria Central', 'Central', 'VIP', '(11) 4002-8922', 'contato@central.com.br'),
(12, 'Distribuidora de Livros Brasil', 'DLB', 'Comum', '(21) 3555-8822', 'vendas@dlb.com.br'),
(13, 'Atacado Literário Nacional', 'ALN Books', 'VIP', '(31) 9988-7766', 'comercial@alnbooks.com.br'),
(14, 'Rede de Livrarias Educacionais', 'EduBooks', 'VIP', '(41) 3232-4141', 'contato@edubooks.com.br'),
(15, 'Distribuidora Saber & Ler', 'Saber & Ler', 'Comum', '(61) 3011-1122', 'vendas@saberler.com.br'),
(16, 'Livros e Companhia Ltda.', 'LivComp', 'Comum', '(71) 3123-3344', 'info@livcomp.com.br'),
(17, 'Ponto do Livro', 'PontoBooks', 'Comum', '(51) 3344-5566', 'pedidos@pontobooks.com.br'),
(18, 'Distribuidora Literária Moderna', 'DLM', 'Comum', '(85) 3003-2244', 'dlm@livrosbr.com'),
(19, 'Rede Alfa de Livros', 'Alfa Livros', 'Comum', '(19) 3777-6677', 'contato@alfalivros.com.br'),
(20, 'Estação do Livro', 'Estação Books', 'Comum', '(27) 98888-5566', 'comercial@estacaobooks.com');

-- Inserts na tabela PessoaJuridica
INSERT INTO PessoaJuridica (cnpj, razaoSocial, dataFundacao, Cliente_idCliente) VALUES
('11.111.111/0001-91', 'Livraria Central', '2001-03-15', 11),
('12.222.222/0001-92', 'Distribuidora de Livros Brasil', '1999-07-01', 12),
('13.333.333/0001-93', 'Atacado Literário Nacional', '2010-05-20', 13),
('14.444.444/0001-94', 'Rede de Livrarias Educacionais', '2005-08-18', 14),
('15.555.555/0001-95', 'Distribuidora Saber & Ler', '2012-11-05', 15),
('16.666.666/0001-96', 'Livros e Companhia Ltda.', '1998-06-09', 16),
('17.777.777/0001-97', 'Ponto do Livro', '2018-02-22', 17),
('18.888.888/0001-98', 'Distribuidora Literária Moderna', '2007-09-10', 18),
('19.999.999/0001-99', 'Rede Alfa de Livros', '2003-01-30', 19),
('20.000.000/0001-00', 'Estação do Livro', '2011-12-12', 20);

-- Inserts na tabela EnderecoPj
INSERT INTO EnderecoPj (PessoaJuri_cnpj, uf, cidade, bairro, rua, numero, complemento, cep) VALUES
('11.111.111/0001-91', 'PE', 'Recife', 'Boa Vista', 'Rua da Aurora', 101, 'Sala 1', '50050-000'),
('12.222.222/0001-92', 'PE', 'Olinda', 'Casa Caiada', 'Av. Carlos de Lima Cavalcanti', 202, 'Bloco B', '53130-000'),
('13.333.333/0001-93', 'PE', 'Jaboatão dos Guararapes', 'Piedade', 'Rua Dom Hélder Câmara', 303, NULL, '54400-000'),
('14.444.444/0001-94', 'PE', 'Caruaru', 'Maurício de Nassau', 'Rua Frei Caneca', 404, '1º andar', '55000-000'),
('15.555.555/0001-95', 'PE', 'Garanhuns', 'Centro', 'Rua Quinze de Novembro', 505, NULL, '55295-000'),
('16.666.666/0001-96', 'PE', 'Petrolina', 'Centro', 'Av. Souza Filho', 606, 'Sala 12', '56300-000'),
('17.777.777/0001-97', 'BA', 'Salvador', 'Pituba', 'Rua das Letras', 123, NULL, '41830-000'),
('18.888.888/0001-98', 'SP', 'Campinas', 'Cambuí', 'Av. dos Livros', 321, NULL, '13025-040'),
('19.999.999/0001-99', 'DF', 'Brasília', 'Asa Norte', 'SQN 210', 45, 'Loja 03', '70862-000'),
('20.000.000/0001-00', 'RS', 'Porto Alegre', 'Centro Histórico', 'Rua dos Andradas', 789, 'Sobreloja', '90020-005');

-- Inserts na tabela PessoaFisica
INSERT INTO PessoaFisica (cpf, genero, dataNasc, Cliente_idCliente) VALUES
('840.316.795-48', 'M', '1980-07-18', 1),
('978.514.302-32', 'M', '1994-10-24', 2),
('197.623.548-00', 'M', '1973-01-11', 3),
('817.406.523-71', 'F', '2001-07-02', 4),
('976.435.108-57', 'M', '1999-12-08', 5),
('534.918.207-23', 'F', '1985-12-19', 6),
('246.750.319-43', 'M', '1994-06-11', 7),
('287.134.069-22', 'M', '1991-03-09', 8),
('186.903.724-31', 'F', '2003-11-19', 9),
('137.056.824-07', 'F', '1996-01-06', 10);

-- Inserts na tabela EnderecoPf
INSERT INTO EnderecoPf (PessoaFisica_cpf, uf, cidade, bairro, rua, numero, complemento, cep) VALUES
('840.316.795-48', 'PE', 'Camaragibe', 'Vera Cruz', 'Rua Camboa', 101, 'Casa 2', '54780-000'),
('978.514.302-32', 'PE', 'Camaragibe', 'Timbi', 'Rua do Sossego', 67, NULL, '54762-000'),
('197.623.548-00', 'PE', 'Recife', 'Graças', 'Rua das Pernambucanas', 90, NULL, '52011-015'),
('817.406.523-71', 'PE', 'Jaboatão dos Guararapes', 'Piedade', 'Rua Arlindo Barros', 56, 'Casa B', '54410-001'),
('976.435.108-57', 'PE', 'Recife', 'Madalena', 'Rua José Bonifácio', 78, 'Fundos', '50720-020'),
('534.918.207-23', 'PE', 'Recife', 'Espinheiro', 'Av. João de Barros', 132, NULL, '52050-240'),
('246.750.319-43', 'PE', 'Olinda', 'Bairro Novo', 'Rua do Farol', 12, NULL, '53120-510'),
('287.134.069-22', 'PE', 'Recife', 'Casa Forte', 'Rua Nestor Silva', 45, NULL, '52060-370'),
('186.903.724-31', 'PE', 'Olinda', 'Casa Caiada', 'Rua do Sol', 23, NULL, '53130-200'),
('137.056.824-07', 'PE', 'Recife', 'Boa Viagem', 'Rua Antônio Falcão', 100, 'Apto 101', '51020-130');

-- Inserts na tabela Funcionario
INSERT INTO Funcionario (cpf, nome, genero, estadoCivil, dataNasc, telefone, email, salario, cargo, dataAdm, dataDem) VALUES
('111.222.333-44', 'Amanda Silva', 'Feminino', 'Viúvo', '1980-01-11', '(81) 993427849', 'amanda.silva@atlas.google.com.br', 2786.27, 'Assistente de RH', '2010-01-15', '2019-12-01'),
('222.333.444-55', 'Bruno Costa', 'Masculino', 'Solteiro', '1981-02-12', '(81) 987320221', 'bruno.costa@atlas.google.com.br', 5162.18, 'Analista de TI', '2011-01-15', NULL),
('333.444.555-66', 'Carlos Nogueira', 'Masculino', 'Solteiro', '1982-03-13', '(81) 982253576', 'carlos.nogueira@atlas.google.com.br', 5898.06, 'Administrador', '2012-01-15', NULL),
('444.555.666-77', 'Daniela Moura', 'Feminino', 'Divorciado', '1983-04-14', '(81) 990953329', 'daniela.moura@atlas.google.com.br', 2569.09, 'Vendedora', '2013-01-15', '2022-12-01'),
('555.666.777-88', 'Eduardo Lima', 'Masculino', 'Divorciado', '1984-05-15', '(81) 989567479', 'eduardo.lima@atlas.google.com.br', 7129.74, 'Gerente Financeiro', '2014-01-15', NULL),
('666.777.888-99', 'Fernanda Torres', 'Feminino', 'Divorciado', '1985-06-16', '(81) 994753690', 'fernanda.torres@atlas.google.com.br', 6628.36, 'Supervisora Financeira', '2015-01-15', NULL),
('777.888.999-00', 'Gustavo Azevedo', 'Masculino', 'Viúvo', '1986-07-17', '(81) 993124895', 'gustavo.azevedo@atlas.google.com.br', 7149.55, 'Coordenador Comercial', '2016-01-15', '2025-12-01'),
('888.999.000-11', 'Helena Barros', 'Feminino', 'Solteiro', '1987-08-18', '(81) 986119665', 'helena.barros@atlas.google.com.br', 2141.72, 'Auxiliar Administrativo', '2017-01-15', NULL),
('999.000.111-22', 'Igor Ferreira', 'Masculino', 'Solteiro', '1988-09-19', '(81) 997450291', 'igor.ferreira@atlas.google.com.br', 2873.94, 'Técnico de Suporte', '2018-01-15', NULL),
('000.111.222-33', 'Juliana Gomes', 'Feminino', 'Divorciado', '1989-01-11', '(81) 987733897', 'juliana.gomes@atlas.google.com.br', 5503.54, 'Analista de RH', '2019-01-15', '2028-12-01');

-- Inserts na tabela EnderecoFunc
INSERT INTO EnderecoFunc (Funcionario_cpf, uf, cidade, bairro, rua, numero, complemento, cep) VALUES 
('111.222.333-44', 'PE', 'Recife', 'Boa Vista', 'Rua do Lima', 45, 'Sala 01', '50050-100'), 
('222.333.444-55', 'PE', 'Olinda', 'Casa Caiada', 'Av. Ministro Marcos Freire', 122, NULL, '53130-800'), 
('333.444.555-66', 'PE', 'Jaboatão dos Guararapes', 'Piedade', 'Rua Arão Lins', 88, 'Bloco B', '54400-210'), 
('444.555.666-77', 'PE', 'Camaragibe', 'Vera Cruz', 'Rua do Progresso', 35, NULL, '54780-330'), 
('555.666.777-88', 'PE', 'Recife', 'Espinheiro', 'Rua Real da Torre', 99, 'Apto 203', '52020-030'), 
('666.777.888-99', 'PE', 'Olinda', 'Bairro Novo', 'Rua Coronel Joaquim Cavalcanti', 55, NULL, '53120-670'), 
('777.888.999-00', 'PE', 'Recife', 'Casa Forte', 'Av. 17 de Agosto', 234, 'Loja 05', '52060-300'), 
('888.999.000-11', 'PE', 'Recife', 'Boa Viagem', 'Rua Ernesto de Paula Santos', 70, NULL, '51021-330'), 
('999.000.111-22', 'PE', 'Jaboatão dos Guararapes', 'Candeias', 'Rua Jangadeiro', 43, 'Fundos', '54430-250'), 
('000.111.222-33', 'PE', 'Recife', 'Madalena', 'Rua Benfica', 66, 'Sala 201', '50720-001');

-- Inserts na tabela Departamento
INSERT INTO Departamento (idDepartamento, nomeDepartamento, responsavel, descricaoAtv, email, telefone, Funcionario_cpf) VALUES 
(1, 'RH', 'Amanda Silva', 'Recursos Humanos', 'amanda.silva@editoraatlas.com', '(81) 35277582', '111.222.333-44'), 
(2, 'TI', 'Bruno Costa', 'Tecnologia da Informação', 'bruno.costa@editoraatlas.com', '(81) 38575483', '222.333.444-55'), 
(3, 'ADM', 'Carlos Nogueira', 'Administração', 'carlos.nogueira@editoraatlas.com', '(81) 31581918', '333.444.555-66'), 
(4, 'VENDAS', 'Daniela Moura', 'Comercial/Vendas', 'daniela.moura@editoraatlas.com', '(81) 31712672', '444.555.666-77'), 
(5, 'FIN', 'Eduardo Lima', 'Financeiro', 'eduardo.lima@editoraatlas.com', '(81) 35269100', '555.666.777-88'),
(6, 'CONTROLADORIA', 'Fernanda Torres', 'Controle financeiro e auditoria', 'fernanda.torres@editoraatlas.com', '(81) 35278888', '666.777.888-99'),
(7, 'MARKETING', 'Gustavo Azevedo', 'Marketing e Comunicação', 'gustavo.azevedo@editoraatlas.com', '(81) 35279999', '777.888.999-00'),
(8, 'LOGISTICA', 'Helena Barros', 'Logística e Distribuição', 'helena.barros@editoraatlas.com', '(81) 35275555', '888.999.000-11'),
(9, 'SUPORTE', 'Igor Ferreira', 'Suporte Técnico', 'igor.ferreira@editoraatlas.com', '(81) 35276666', '999.000.111-22'),
(10, 'TREINAMENTO', 'Juliana Gomes', 'Treinamento e Desenvolvimento', 'juliana.gomes@editoraatlas.com', '(81) 35277777', '000.111.222-33');
 
-- Inserts na tabela Pedido
INSERT INTO Pedido (idPedido, dataPedido, statusPedido, observacao, Cliente_idCliente) VALUES
(1, '2024-01-10 10:00:00', 'Aprovado', 'Entrega em 5 dias.', 1),
(2, '2024-01-15 11:30:00', 'Aprovado', 'Urgente.', 2),
(3, '2024-01-20 09:45:00', 'Cancelado', 'Cliente desistiu.', 3),
(4, '2024-02-01 14:10:00', 'Aprovado', NULL, 4),
(5, '2024-02-05 16:50:00', 'Aprovado', 'Pagamento por boleto.', 5),
(6, '2024-02-10 08:25:00', 'Aprovado', NULL, 6),
(7, '2024-02-15 10:10:00', 'Pendente', NULL, 7),
(8, '2024-02-20 15:30:00', 'Aprovado', 'Cliente fiel.', 8),
(9, '2024-02-25 13:40:00', 'Aprovado', NULL, 9),
(10, '2024-03-01 12:00:00', 'Cancelado', 'Duplicidade.', 10);

-- Inserts na tabela Venda
INSERT INTO Venda (idVenda, data, valor, desconto, Pedido_idPedido, Funcionario_cpf, Cliente_idCliente, observacoes) VALUES
(1, '2024-01-11 10:00:00', 80.00, 0.00, 1, '111.222.333-44', 1, 'Venda aprovada.'),
(2, '2024-01-16 12:00:00', 150.00, 10.00, 2, '222.333.444-55', 2, NULL),
(3, '2024-02-02 09:00:00', 250.00, 15.00, 4, '333.444.555-66', 4, 'Cliente comprou em grande volume.'),
(4, '2024-02-06 17:00:00', 100.00, 5.00, 5, '444.555.666-77', 5, NULL),
(5, '2024-02-11 09:00:00', 60.00, 0.00, 6, '555.666.777-88', 6, 'Frete incluso.'),
(6, '2024-02-21 16:00:00', 120.00, 10.00, 8, '666.777.888-99', 8, NULL),
(7, '2024-02-26 14:00:00', 95.00, 0.00, 9, '777.888.999-00', 9, NULL),
(8, '2024-03-05 11:15:00', 89.90, 0.00, 7, '888.999.000-11', 7, 'Venda finalizada via app.'),
(9, '2024-03-08 14:40:00', 210.00, 20.00, 10, '999.000.111-22', 10, 'Cliente recebeu cupom de desconto.'),
(10, '2024-03-10 13:30:00', 300.00, 30.00, 3, '000.111.222-33', 3, 'Recompra com bônus.');

-- Inserts na tabela FormaDePag
INSERT INTO FormaDePag (idPagamento, tipoPagamento, parcelas, valorPago, Venda_idVenda) VALUES
(1, 'Cartão Crédito', 3, 80.00, 1),
(2, 'Boleto', NULL, 140.00, 2),
(3, 'Transferência', NULL, 235.00, 3),
(4, 'Cartão Débito', NULL, 100.00, 4),
(5, 'PIX', NULL, 60.00, 5),
(6, 'Cartão Crédito', 2, 110.00, 6),
(7, 'PIX', NULL, 95.00, 7),
(8, 'Cartão Débito', NULL, 89.90, 8),
(9, 'Cartão Crédito', 2, 190.00, 9),
(10, 'PIX', NULL, 270.00, 10);

-- Inserts na tabela associativa LivroArea
INSERT INTO LivroArea (Livro_isbn, AreaDeCon_codigoArea) VALUES
('9788535902774', '1'),
('9788535901784', '2'),
('9788572329793', '3'),
('9788582172760', '4'),
('9788535904877', '5'),
('9788572326655', '6'),
('9788535930647', '7'),
('9788535929450', '8'),
('9788535914845', '9');

-- Inserts na tabela associativa PalavraLivro
INSERT INTO PalavraLivro (Livro_isbn, PalavraChave_idPalavraChave) VALUES
('9788535902774', '1'),
('9788535901784', '2'),
('9788572329793', '3'),
('9788582172760', '4'),
('9788535904877', '5'),
('9788572326655', '6'),
('9788535930647', '7'),
('9788535929450', '8'),
('9788535914845', '9'),
('9788535933884', '10');

-- Inserts na tabela associativa LivroAutor
INSERT INTO LivroAutor (Livro_isbn, Autor_idAutor) VALUES
('9788535902774', '1'),
('9788535901784', '2'),
('9788572329793', '3'),
('9788582172760', '4'),
('9788535904877', '5'),
('9788572326655', '6'),
('9788535930647', '7'),
('9788535929450', '8'),
('9788535914845', '9'),
('9788535933884', '10');

-- Inserts na tabela associativa ExemplarPedido
INSERT INTO ExemplarPedido (idExemplarPedido, Exemplar_idExemplar, Pedido_idPedido, quantidade) VALUES
(1, 1, 1, 7),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 5),
(5, 5, 5, 13),
(6, 6, 6, 4),
(7, 7, 7, 10),
(8, 8, 8, 8),
(9, 9, 9, 15),
(10, 10, 10, 9);
