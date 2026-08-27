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

insert into empresa (cnpj, razao_social, nome_fantasia, email_contato) values ('60746948000112', 'Banco Bradesco S.A.', 'Bradesco', 'email@exemplo.com');

-- ==========================================
-- EMPRESAS
-- ==========================================

INSERT INTO empresa 
(cnpj, razao_social, nome_fantasia, email_contato, stats)
VALUES
('12345678000101', 'Tech Solutions LTDA', 'Tech Solutions', 'contato@techsolutions.com', 'Ativo'),
('23456789000102', 'Mercado Digital S.A.', 'Mercado Digital', 'ti@mercadodigital.com', 'Ativo'),
('34567890000103', 'Cloud Systems LTDA', 'Cloud Systems', 'contato@cloudsystems.com', 'Inativo'),
('45678901000104', 'Data Center Brasil S.A.', 'Data Center Brasil', 'suporte@datacenter.com', 'Ativo'),
('56789012000105', 'E-Commerce Express LTDA', 'E-Commerce Express', 'ti@ecommerceexpress.com', 'Inativo');


-- ==========================================
-- USUÁRIOS
-- ==========================================

INSERT INTO usuario
(nome, email, senha, cargo, fk_empresa)
VALUES
('Lucas Silva', 'lucas@techsolutions.com', '123456', 'Analista', 2),
('Carlos Oliveira', 'carlos@techsolutions.com', '123456', 'Gerente', 2),
('Ana Souza', 'ana@mercadodigital.com', '123456', 'Analista', 3),
('Marcos Santos', 'marcos@mercadodigital.com', '123456', 'Gerente', 3),
('Julia Costa', 'julia@cloudsystems.com', '123456', 'Analista', 4),
('Rafael Lima', 'rafael@datacenter.com', '123456', 'Analista', 5),
('Fernanda Alves', 'fernanda@datacenter.com', '123456', 'Gerente', 5),
('Pedro Rocha', 'pedro@ecommerceexpress.com', '123456', 'Analista', 6);


-- ==========================================
-- SERVIDORES
-- ==========================================

INSERT INTO servidor
(nome, fk_empresa)
VALUES
('Servidor Web 01', 2),
('Servidor Banco 01', 2),
('Servidor API 01', 2),

('Servidor Web 01', 3),
('Servidor Banco 01', 3),

('Servidor Principal', 4),
('Servidor Backup', 4),

('Servidor Produção 01', 5),
('Servidor Produção 02', 5),
('Servidor Banco de Dados', 5),

('Servidor Web', 6),
('Servidor API', 6);


-- ==========================================
-- CAPTURAS
-- ==========================================

INSERT INTO captura
(nome, valor, unidade_de_medida, tipo, fk_servidor)
VALUES

-- Servidor Web 01 - Tech Solutions
('CPU', 72.5, '%', 'CPU', 1),
('RAM', 81.3, '%', 'RAM', 1),
('Disco', 65.7, '%', 'Disco', 1),
('Temperatura', 58.2, '°C', 'Temperatura', 1),

-- Servidor Banco 01 - Tech Solutions
('CPU', 91.4, '%', 'CPU', 2),
('RAM', 88.6, '%', 'RAM', 2),
('Disco', 74.2, '%', 'Disco', 2),
('Temperatura', 63.5, '°C', 'Temperatura', 2),

-- Servidor API 01 - Tech Solutions
('CPU', 45.8, '%', 'CPU', 3),
('RAM', 52.1, '%', 'RAM', 3),
('Disco', 43.7, '%', 'Disco', 3),

-- Servidor Web 01 - Mercado Digital
('CPU', 32.4, '%', 'CPU', 4),
('RAM', 61.5, '%', 'RAM', 4),
('Disco', 48.9, '%', 'Disco', 4),

-- Servidor Banco 01 - Mercado Digital
('CPU', 78.2, '%', 'CPU', 5),
('RAM', 93.7, '%', 'RAM', 5),
('Disco', 82.4, '%', 'Disco', 5),

-- Servidor Principal - Cloud Systems
('CPU', 15.3, '%', 'CPU', 6),
('RAM', 34.8, '%', 'RAM', 6),
('Disco', 27.5, '%', 'Disco', 6),

-- Servidor Backup - Cloud Systems
('CPU', 8.7, '%', 'CPU', 7),
('RAM', 22.4, '%', 'RAM', 7),
('Disco', 91.2, '%', 'Disco', 7),

-- Servidor Produção 01 - Data Center
('CPU', 87.9, '%', 'CPU', 8),
('RAM', 79.5, '%', 'RAM', 8),
('Disco', 68.3, '%', 'Disco', 8),

-- Servidor Produção 02 - Data Center
('CPU', 94.6, '%', 'CPU', 9),
('RAM', 96.2, '%', 'RAM', 9),
('Disco', 89.7, '%', 'Disco', 9),

-- Servidor Banco de Dados - Data Center
('CPU', 99.1, '%', 'CPU', 10),
('RAM', 97.8, '%', 'RAM', 10),
('Disco', 92.6, '%', 'Disco', 10),

-- Servidor Web - E-Commerce
('CPU', 41.2, '%', 'CPU', 11),
('RAM', 57.8, '%', 'RAM', 11),
('Disco', 36.4, '%', 'Disco', 11),

-- Servidor API - E-Commerce
('CPU', 63.9, '%', 'CPU', 12),
('RAM', 71.5, '%', 'RAM', 12),
('Disco', 55.2, '%', 'Disco', 12);

SELECT s.id, e.nome_fantasia
     FROM servidor s
     JOIN empresa e on e.id = s.fk_empresa;
     
SELECT * FROM servidor WHERE fk_empresa = 2;

SELECT nome, valor, tipo, horario 
        FROM captura 
        WHERE fk_servidor = 3 and nome = 'RAM'
        ORDER BY id DESC 
        LIMIT 5;
        
        SELECT valor, horario 
        FROM captura 
        WHERE fk_servidor = 1 and nome = 'Temperatura'
        ORDER BY id DESC 
        LIMIT 10;

SELECT
    e.nome_fantasia,
    s.nome AS servidor,
    c.valor AS cpu
FROM empresa e
JOIN servidor s
    ON e.id = s.fk_empresa
JOIN captura c
    ON s.id = c.fk_servidor
WHERE c.tipo = 'CPU' and s.id = 2
AND c.valor > 90;