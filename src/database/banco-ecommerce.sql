drop database alou;
create database alou;
use alou;

create table empresa(
id int primary key,
cnpj char(14) not null,
razao_social varchar(255) not null,
nome_fantasia varchar(255) not null,
fk_usuario int,
telefone int not null 
);

create table usuario(
id int primary key,
nome varchar(50),
cpf int(12) not null,
email varchar(255) not null,
senha varchar(255) not null,
cargo varchar(20),
fk_empresa int, foreign key (fk_empresa) references empresa(id)
);

create table desktop(
id int primary key,
registro varchar(50),
fk_empresa int, constraint fk_desktop_empresa foreign key (fk_empresa) references empresa(id)
);

create table dashboard(
id int primary key,
fk_empresa int, 
fK_usuario int,
constraint fk_empresa_dashboard foreign key (fk_empresa) references empresa(id),
constraint fk_usuario_dashboard foreign key (fK_usuario) references usuario(id)
);

create table captura(
id int primary key,
tipo varchar(20) constraint chk_hardware check(tipo in("CPU", "RAM", "Disco")),
porcentagem_de_uso int,
qtd_nucleos int,
frequencia float,
memoria_utilizada double,
memoria_disponivel double,
memoria_total double,
espaco_total double,
espaco_utilizado double,
espaco_livre double,
horario datetime default current_timestamp,
fk_dashboard int,
constraint fk_dashboard_captura foreign key (fk_dashboard) references dashboard(id)
);