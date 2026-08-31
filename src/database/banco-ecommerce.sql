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
    cargo enum('Analista', 'Gerente', 'RH') not null,
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
    unidade_de_medida varchar(30) not null,        
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
    
     
     
 -- 1. Inserindo a Empresa (Assumirá ID 1)
INSERT INTO empresa (cnpj, razao_social, nome_fantasia, email_contato) 
VALUES ('60746948000112', 'Banco Bradesco S.A.', 'Bradesco', 'email@exemplo.com');

-- 2. Inserindo os primeiros usuários (Corrigida a falta do 'cargo' da Beth)
INSERT INTO usuario (nome, email, senha, cargo, fk_empresa) 
VALUES ('Beth', 'xpto@mercado.livre', '12345678', 'Gerente', 1);

INSERT INTO usuario (nome, email, senha, cargo, fk_empresa) 
VALUES ('William', 'analista@mercado.livre','87654321', 'Analista', 1);

-- 3. Inserindo os usuários solicitados (Adicionado o 'fk_empresa')
INSERT INTO usuario (nome, email, senha, cargo, fk_empresa) VALUES 
('Valdito', 'valdito@gmail.com', 'Senha123', 'Gerente', 1),
('Ashey', 'ashey@gmail.com', 'Senha123', 'Analista', 1),
('Math', 'math@gmail.com', 'Senha123', 'RH', 1);

-- 4. BÔNUS: Inserindo servidores vinculados à empresa 1
INSERT INTO servidor (nome, fk_empresa) VALUES 
('Servidor SP - Banco de Dados', 1),
('Servidor RJ - Aplicação', 1);

-- 5. BÔNUS: Inserindo capturas vinculadas aos servidores
INSERT INTO captura (nome, valor, unidade_de_medida, fk_servidor) VALUES 
('CPU', 85.5, '%', 1),
('Memoria RAM', 64.0, '%', 1),
('CPU', 42.1, '%', 2),
('Memoria RAM', 55.3, '%', 2);


SELECT * FROM usuario;