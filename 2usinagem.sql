-- comando para criar um novo banco de dados
CREAte DATABASE 2usinagem;

-- comando serve para habilitar o banco
USE 2usinagem;

-- COMANDO PARA CRIAR TABELA PEÇA
CREATE TABLE PECA(
idPECA INT NOT NULL PRIMARY KEY,
nome VARCHAR(100),
peso DECIMAL(8,2),
ano_fabricacao DATE,
fornecedor_id INT,
categoria_id INT,
FOREIGN KEY(fornecedor_id)
REFERENCES fornecedor (idfornecedor),
FOREIGN KEY(categoria_id)
REFERENCES categoria (idcategoria)
); 

-- criar a tebela
CREATE TABLE fornecedor(
idfornecedor INT NOT NULL,
nome VARCHAR(100),
nacionalidade VARCHAR(100),
PRIMARY KEY(idfornecedor)
); 

CREATE TABLE categoria(
idcategoria INT NOT NULL,
descricao TEXT(100000),
PRIMARY KEY(idcategoria)
);

DROP TABLE categoria;
