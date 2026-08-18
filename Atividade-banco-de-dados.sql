-- comando para criar um novo banco de dados
CREAte DATABASE usinagem;

-- comando serve para habilitar o banco
USE usinagem;

-- criar a tebela
CREATE TABLE fornecedor(
idfornecedor INT NOT NULL,
nome VARCHAR(100),
nacionalidade VARCHAR(100),
PRIMARY KEY(idfornecedor)
); 

-- comando para apagar a tabela
DROP TABLE fornecedor;

-- adicionar nova em tabela já existente
ALTER TABLE fornecedor
ADD COLUMN DESCRICAO TEXT;

-- COMANDO PARA CRIAR TABELA PEÇA
CREATE TABLE PECA(
idPECA INT NOT NULL PRIMARY KEY,
nome VARCHAR(100),
peso DECIMAL(8,2),
ano_fabricacao DATE,
fornecedor_id INT,
FOREIGN KEY(fornecedor_id)
REFERENCES fornecedor (idfornecedor)
); 
