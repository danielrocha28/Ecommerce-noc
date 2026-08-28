drop database if exists ecommerce;
create database if not exists ecommerce;
use ecommerce;

CREATE TABLE empresa (
    id int primary key auto_increment,
    cnpj char(14) unique not null,
    razao_social varchar(160) unique not null,
    nome_fantasia varchar(160) not null,
    email_contato varchar(255) not null,
    stats enum('Ativo', 'Inativo') default 'Ativo',
    data_cadastro datetime default current_timestamp
);

create table usuario(
    id int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(300) unique not null,
    senha varchar(255) not null,
    cargo enum('Analista', 'Gerente') not null,
    fk_empresa int not null, 
    foreign key (fk_empresa) references empresa(id)
);

create table servidor(
    id int primary key auto_increment,
    nome varchar(100) not null, 
    fk_empresa int not null,    
    constraint fk_servidor_empresa foreign key (fk_empresa) references empresa(id)
);

create table captura(
    id int primary key auto_increment, 
    nome varchar(40) not null,        
    valor float not null,            
    tipo varchar(50) not null,        
    horario datetime default current_timestamp,
    fk_servidor int not null,         
    constraint fk_servidor_captura foreign key (fk_servidor) references servidor(id)
);

insert into empresa (cnpj, razao_social, nome_fantasia, email_contato) values ('60746948000112', 'Banco Bradesco S.A.', 'Bradesco', 'email@exemplo.com');
insert into usuario (nome, email, senha, fk_empresa) value ('Beth', 'xpto@mercado.livre', '12345678', 1);
insert into usuario (nome, email, senha, cargo, fk_empresa) value ('William', 'analista@mercado.livre','87654321', 'Analista',  1);

CREATE OR REPLACE VIEW vwCapturas AS
SELECT 
    c.id AS captura_id,
    c.nome,
    c.valor,
    c.unidade_de_medida,
    c.horario,
    c.fk_servidor,
    s.nome AS nome_servidor,
    s.fk_empresa
FROM captura c
JOIN servidor s ON c.fk_servidor = s.id;
    
    CREATE OR REPLACE VIEW vwAviso as    
    SELECT
		e.nome_fantasia,
        s.nome AS servidor,
        c.valor AS cpu
    FROM empresa e
    JOIN servidor s
        ON e.id = s.fk_empresa
    JOIN captura c
        ON s.id = c.fk_servidor;
        
        
        
	CREATE OR REPLACE VIEW buscarDashPorEmpresa as
        SELECT s.id, e.nome_fantasia
     FROM servidor s
     JOIN empresa e on e.id = s.fk_empresa; 
    
     
     
     