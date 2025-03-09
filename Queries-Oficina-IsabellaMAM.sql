use oficina_isabellamam;

-- Total de ordens de serviço realizadas
select count(*) as total_ordem_de_servico from Ordem_de_Servico;

-- Tempo médio da ordem de serviço para finalização
select round(avg(datediff(data_conclusao, data_emissao)), 0) as tempo_medio_finalizacao from Ordem_de_Servico
where data_conclusao is not null;

-- Total de faturamento
select sum(valor_total) as faturamento_total from Ordem_de_Servico;

-- Custo total de peças
select sum(valor) as custo_total_pecas from Peca;

-- Total de ordem de serviço por equipes
select nome, count(idOrdem_de_Servico) as total_ordem_servico from Ordem_de_Servico
join Equipe on idODSEquipe = idEquipe 
group by nome;

-- Mão de obra mais atendida
select servico, count(*) as total_servicos from Mao_de_Obra 
group by servico
having total_servicos = (
		select max(total_servicos) from (
        select count(*) as total_servicos from Mao_de_Obra 
        group by servico) as subquery);

-- Período com mais ordens de serviço
select month(data_emissao) as mes, count(*) as total_ordem_servico from Ordem_de_Servico 
group by mes 
having total_ordem_servico = (
        select max(total_ordem_servico) from (
        select count(*) as total_ordem_servico from Ordem_de_Servico 
        group by month(data_emissao)) as subquery);