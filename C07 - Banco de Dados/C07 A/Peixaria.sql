CREATE DATABASE IF NOT EXISTS Peixaria;

USE Peixaria;

-- DROP TABLE IF EXISTS Item_Venda;
-- DROP TABLE IF EXISTS Venda;
-- DROP TABLE IF EXISTS Peixe_Agua_Doce;
-- DROP TABLE IF EXISTS Peixe_Marinho;
-- DROP TABLE IF EXISTS Peixe;
-- DROP TABLE IF EXISTS Cliente;


-- CRIAÇÃO DE TABELAS 

CREATE TABLE IF NOT EXISTS Peixe(
id INT AUTO_INCREMENT PRIMARY KEY,
nome_comum VARCHAR(50),
preco_kg DECIMAL(10,2) NOT NULL CHECK (preco_kg >0),
qtd_estoque INT,
tipo TEXT CHECK(tipo IN('Agua Doce', 'Marinho'))
);

CREATE TABLE IF NOT EXISTS Peixe_Agua_Doce(
peixe_id INTEGER PRIMARY KEY,
nome_cientifico VARCHAR(50),
habitat VARCHAR(500),
raridade VARCHAR(500),
tipo TEXT,
FOREIGN KEY (peixe_id) REFERENCES Peixe(id)
);

CREATE TABLE IF NOT EXISTS Peixe_Marinho(
peixe_id INTEGER PRIMARY KEY, 
tipo TEXT,
origem VARCHAR(500),
sabor_predominante VARCHAR (500),
refrigeracao_especial VARCHAR(500),
FOREIGN KEY(peixe_id) REFERENCES Peixe(id)
);

CREATE TABLE IF NOT EXISTS Cliente (
id INTEGER PRIMARY KEY,
nome_completo VARCHAR(500),
telefone VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Venda (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
id_cliente INTEGER NOT NULL,
data_hora_venda DATETIME NOT NULL,
data_prev_retirada DATETIME NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE IF NOT EXISTS Item_Venda(
id INTEGER PRIMARY KEY,
id_venda INTEGER NOT NULL,
id_peixe INTEGER NOT NULL,
qtd_kg DECIMAL(10,2) NOT NULL CHECK (qtd_kg >0),
data_retirada_efetiva DATE,
FOREIGN KEY (id_venda) REFERENCES Venda(id),
FOREIGN KEY (id_peixe) REFERENCES Peixe(id)
);

-- DML 

-- AGUA DOCE

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Tucunaré','18.95','30');
INSERT INTO Peixe_Agua_Doce(peixe_id,nome_cientifico,habitat, raridade, tipo) 
VALUES(LAST_INSERT_ID(),'Tucarense Aré','Lagoa','Normal','Agua Doce');

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Dourado','28.55','15');
INSERT INTO Peixe_Agua_Doce(peixe_id,nome_cientifico,habitat, raridade, tipo) 
VALUES(LAST_INSERT_ID(),'Goldinus Maranhense','Rio','Raro','Agua Doce');

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Pintado','50','5');
INSERT INTO Peixe_Agua_Doce(peixe_id,nome_cientifico,habitat, raridade, tipo) 
VALUES(LAST_INSERT_ID(),'Pintudus Minusculos','Represa','Ultra-Raro','Agua Doce');

-- MARINHOS

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Robalo','22','50');
INSERT INTO Peixe_Marinho(peixe_id,tipo,origem, sabor_predominante,refrigeracao_especial) 
VALUES(LAST_INSERT_ID(),'Marinho','Oceano Pacifico','Apimentado','SIM');

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Linguado','29.89','26');
INSERT INTO Peixe_Marinho(peixe_id,tipo,origem, sabor_predominante,refrigeracao_especial) 
VALUES(LAST_INSERT_ID(),'Marinho','Oceano Indico','Amargo','NÃO');

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Atum','200','12');
INSERT INTO Peixe_Marinho(peixe_id,tipo,origem, sabor_predominante,refrigeracao_especial) 
VALUES(LAST_INSERT_ID(),'Marinho','Oceano Atlântico','Salgado','SIM');


-- NORMAIS

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Atum','200','12');

INSERT INTO Peixe(nome_comum,preco_kg,qtd_estoque) VALUES('Traira','20','75');
INSERT INTO Peixe(nome_comum,preco_kg, qtd_estoque)VALUES('Lambari','35','40');

USE Peixaria;
SELECT * FROM Peixe;

SELECT * FROM Peixe_Agua_DOCE;

SELECT * FROM Peixe_Marinho;
