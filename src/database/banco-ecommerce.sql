drop database if exists ecommerce;
create database if not exists ecommerce;
use ecommerce;

CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) UNIQUE NOT NULL,
    razao_social VARCHAR(175) UNIQUE NOT NULL,
    nome_fantasia VARCHAR(175) NOT NULL,
    email_contato VARCHAR(255) NOT NULL,
    stats ENUM('Ativo', 'Inativo') DEFAULT 'Ativo',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

create table usuario(
    id int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(320) unique not null,
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
/*
create table dashboard(
    id int primary key auto_increment,
    fk_empresa int not null,
    constraint fk_empresa_dashboard foreign key (fk_empresa) references empresa(id)
);
verificar se é viavel manter essa table e demais 
*/
create table captura(
    id int primary key auto_increment, 
    nome varchar(40) not null,        
    valor float not null,
    unidade_de_medida varchar(30) not null,
    horario datetime default current_timestamp,
    -- fk_dashboard int not null,
    fk_servidor int not null,         
    -- constraint fk_dashboard_captura foreign key (fk_dashboard) references dashboard(id),
    constraint fk_servidor_captura foreign key (fk_servidor) references servidor(id)
);