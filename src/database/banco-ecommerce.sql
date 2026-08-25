drop database if exists ecommerce;
create database if not exists ecommerce;
use ecommerce;

create table empresa(
id int primary key auto_increment,
cnpj char(14) unique not null,
razao_social varchar(175) unique not null,
nome_fantasia varchar(175) not null
);

create table usuario(
id int primary key auto_increment,
nome varchar(50) not null,
email varchar(320) unique not null ,
senha varchar(50) not null,
cargo enum('Analista', 'Gerente') not null,
fk_empresa int not null, foreign key (fk_empresa) references empresa(id)
);

create table servidor(
id int primary key auto_increment,
nome varchar(100),
fk_empresa int, constraint fk_servidor_empresa foreign key (fk_empresa) references empresa(id)
);

create table dashboard(
id int primary key auto_increment,
fk_empresa int, 
constraint fk_empresa_dashboard foreign key (fk_empresa) references empresa(id)
);

create table captura(
id int auto_increment,
nome varchar(40),
valor decimal(5,2),
tipo varchar(50),
horario datetime default current_timestamp,
fk_dashboard int,
fk_servidor int,
primary key (id, fk_dashboard, fk_servidor),
constraint fk_dashboard_captura foreign key (fk_dashboard) references dashboard(id),
constraint fk_servidor_captura foreign key (fk_servidor) references servidor(id)
);


insert into empresa (cnpj, razao_social, nome_fantasia) values ('60746948000112', 'Banco Bradesco S.A.', 'Bradesco');