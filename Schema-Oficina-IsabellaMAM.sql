-- criação do banco de dados para o cenário anterior de Ofina
-- drop  database oficina_isabellamam;
create database oficina_isabellamam;
use oficina_isabellamam;

-- criar tabela Cliente
create table Cliente(
    idCliente int auto_increment primary key,
    nome varchar(100),
    telefone char(11)
);

alter table Cliente auto_increment=1;

-- criar tabela Veículo
create table Veiculo(
    idVeiculo int auto_increment primary key,
    idVCliente int,
    veiculo varchar(15),
    constraint fk_veiculo_client foreign key (idVCliente) references Cliente(idCliente)
    );
    
alter table Veiculo auto_increment=1;

-- criar tabela Equipe
create table Equipe(
    idEquipe int auto_increment primary key,
    nome varchar(100)
);

alter table Equipe auto_increment=1;

-- criar tabela Ordem de Serviço
create table Ordem_de_Servico(
    idOrdem_de_Servico int auto_increment primary key,
    idODSEquipe int,
    idODSVeiculo int,
    idODSCliente int,
    categoria enum('Conserto','Revisão'),
    valor_total float,
    data_emissao date,
    data_entrega date,
    data_conclusao date,
    autorizacao bool,
    status enum('Aberta','Em análise','Aguardando Aprovação','Em Execução','Finalizada','Entregue','Cancelada'),
    constraint fk_ods_equipe foreign key (idODSEquipe) references Equipe(idEquipe),
    constraint fk_ods_veiculo foreign key (idODSVeiculo) references Veiculo(idVeiculo),
    constraint fk_ods_cliente foreign key (idODSCliente) references Cliente(idCliente)
);

alter table Ordem_de_Servico auto_increment=1;

-- criar tabela Mão de Obra
create table Mao_de_Obra (
    idMao_de_Obra int auto_increment primary key,
    idMDOOrdem_de_servico int,
    servico varchar(30),
    valor float,
    constraint fk_mdo_ordem_de_servico foreign key (idMDOOrdem_de_servico) references Ordem_de_Servico(idOrdem_de_Servico)
);

alter table Mao_de_Obra auto_increment=1;

-- criar tabela Peça
create table Peca(
    idPeca int auto_increment primary key,
    idPOrdem_de_servico int,
    peca varchar(50),
    valor float,
    constraint fk_p_ordem_de_servico foreign key (idPOrdem_de_servico) references Ordem_de_Servico(idOrdem_de_Servico)
);

alter table Peca auto_increment=1;

-- criar tabela Mecânico
create table Mecanico(
    idMecanico int auto_increment primary key,
    idMEquipe int,
    nome varchar(100),
    endereco varchar(45),
    especialidade varchar(50),
    constraint fk_m_equipe foreign key (idMEquipe) references Equipe(idEquipe)
);

alter table Mecanico auto_increment=1;
    