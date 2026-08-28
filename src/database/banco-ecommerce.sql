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

