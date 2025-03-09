use oficina_isabellamam;

-- Inserindo dados na tabela Cliente
insert into Cliente (nome, telefone) values
('Carlos Silva', '11987654321'),
('Mariana Souza', '11976543210'),
('João Pereira', '11965432109'),
('Ana Lima', '11954321098'),
('Fernando Rocha', '11943210987');

-- Inserindo dados na tabela Veículo
insert into Veiculo (idVCliente, veiculo) values
(1, 'Civic'),
(2, 'Corolla'),
(3, 'Onix'),
(4, 'HB20'),
(5, 'Ranger');

-- Inserindo dados na tabela Equipe
insert into Equipe (nome) values
('Equipe A'),
('Equipe B'),
('Equipe C');

-- Inserindo dados na tabela Mecânico
insert into Mecanico (idMEquipe, nome, endereco, especialidade) values
(1, 'José Almeida', 'Rua A, 123', 'Suspensão'),
(2, 'Ricardo Santos', 'Rua B, 456', 'Freios'),
(3, 'Marcos Ferreira', 'Rua C, 789', 'Motor');

-- Inserindo dados na tabela Ordem de Serviço
insert into Ordem_de_Servico (idODSEquipe, idODSVeiculo, idODSCliente, categoria, valor_total, data_emissao, data_entrega, data_conclusao, autorizacao, status) values
(1, 1, 1, 'Conserto', 1500.00, '2025-03-01', '2025-03-05', '2025-03-04', true, 'Finalizada'),
(2, 2, 2, 'Revisão', 700.00, '2025-03-02', '2025-03-06', '2025-03-05', true, 'Entregue'),
(3, 3, 3, 'Conserto', 2000.00, '2025-03-03', '2025-03-07', '2025-03-06', true, 'Finalizada'),
(1, 4, 4, 'Revisão', 500.00, '2025-03-04', '2025-03-08', '2025-03-07', true, 'Entregue'),
(2, 5, 5, 'Conserto', 2500.00, '2025-03-05', '2025-03-09', '2025-03-08', true, 'Finalizada');

-- Inserindo dados na tabela Mão de Obra
insert into Mao_de_Obra (idMDOOrdem_de_servico, servico, valor) values
(1, 'Troca de suspensão', 500.00),
(2, 'Revisão completa', 300.00),
(3, 'Reparo no motor', 1200.00),
(4, 'Troca de óleo', 200.00),
(5, 'Troca de embreagem', 1500.00);

-- Inserindo dados na tabela Peça
insert into Peca (idPOrdem_de_servico, peca, valor) values
(1, 'Amortecedor', 1000.00),
(2, 'Óleo do motor', 400.00),
(3, 'Correia dentada', 800.00),
(4, 'Filtro de ar', 300.00),
(5, 'Kit embreagem', 1000.00);