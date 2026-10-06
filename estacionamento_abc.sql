DROP DATABASE IF EXISTS estacionamento_abc;

CREATE DATABASE estacionamento_abc;

USE estacionamento_abc;

-- TABELA CATEGORIA
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL
);

-- TABELA CLIENTE
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_do_cliente VARCHAR(100) NOT NULL
);

-- TABELA VEICULO
CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa_registrada VARCHAR(20) NOT NULL,
    cor VARCHAR(50),
    id_categoria INT,
    id_cliente INT,

    CONSTRAINT fk_veiculo_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria),

    CONSTRAINT fk_veiculo_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

-- DADOS DA CATEGORIA
INSERT INTO categoria (nome_categoria)
VALUES
('Carro'),
('Moto'),
('Caminhão');

-- DADOS DOS CLIENTES
INSERT INTO cliente (nome_do_cliente)
VALUES
('João Silva'),
('Maria Souza'),
('Carlos Oliveira'),
('Ana Santos');

-- DADOS DOS VEÍCULOS
INSERT INTO veiculo
(placa_registrada, cor, id_categoria, id_cliente)
VALUES
('ABC1234', 'Preto', 1, 1),
('DEF5678', 'Branco', 1, 2),
('GHI9012', 'Vermelho', 2, 3),
('JKL3456', 'Azul', 3, 4);

-- TESTAR AS TABELAS
SELECT * FROM categoria;
SELECT * FROM cliente;
SELECT * FROM veiculo;

-- INNER JOIN
SELECT
    v.id_veiculo,
    v.placa_registrada,
    v.cor,
    c.nome_categoria,
    cl.nome_do_cliente
FROM veiculo v
INNER JOIN categoria c
    ON v.id_categoria = c.id_categoria
INNER JOIN cliente cl
    ON v.id_cliente = cl.id_cliente;

-- LEFT JOIN
SELECT *
FROM veiculo v
LEFT JOIN cliente cl
    ON v.id_cliente = cl.id_cliente;

-- RIGHT JOIN
SELECT *
FROM veiculo v
RIGHT JOIN cliente cl
    ON v.id_cliente = cl.id_cliente;

-- FULL JOIN SIMULADO
SELECT *
FROM veiculo v
LEFT JOIN cliente cl
    ON v.id_cliente = cl.id_cliente

UNION

SELECT *
FROM veiculo v
RIGHT JOIN cliente cl
    ON v.id_cliente = cl.id_cliente;

-- VIEW
CREATE VIEW vw_veiculo_cliente AS
SELECT
    v.id_veiculo,
    v.placa_registrada,
    v.cor,
    cl.nome_do_cliente
FROM veiculo v
INNER JOIN cliente cl
    ON v.id_cliente = cl.id_cliente;

-- CONSULTAR VIEW
SELECT * FROM vw_veiculo_cliente;