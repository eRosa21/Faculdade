USE laboratorio;

DROP TABLE IF EXISTS investigacao;
	
	CREATE TABLE IF NOT EXISTS investigacao (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
idade INT,
profissao VARCHAR(100),
cidade VARCHAR(100),
estava_na_sala_do_cofre BOOLEAN,
horario_visto TIME,
possui_alibi BOOLEAN,
quantidade_evidencias INT,
nivel_suspeita INT
);

-- inserção de dados 
INSERT INTO investigacao(nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Arthur Carvalho',
 45,'Empresário', 'São Paulo',TRUE,'23:00:00',FALSE,3,4);

INSERT INTO investigacao(nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Beatriz Moura',
 34,'Curadora de Arte', 'Campinas',FALSE,'23:45:00',TRUE,1,2);


INSERT INTO investigacao (nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Carlos Nogueira',
 52,'Colecionador', 'São Paulo',TRUE,'23:00:00',FALSE,4,5);
 
 
INSERT INTO investigacao (nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Daniela Rocha',
 29,'Jornalista', 'Santos',FALSE,'23:10:00',FALSE,2,3);

INSERT INTO investigacao (nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Eduardo Lima',
 41,'Advogado', 'Campinas',TRUE,'22:55:00',FALSE,2,4);


INSERT INTO investigacao (nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Fernanda Alves',
 38,'Arquiteta', 'Santos',FALSE,'22:40:00',TRUE,0,1);


INSERT INTO investigacao (nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Gustavo Prado',
 47,'Artista', 'São Paulo',TRUE,'23:00:00',FALSE,3,4);


INSERT INTO investigacao (nome, idade, profissao,
 cidade, estava_na_sala_do_cofre, horario_visto,
 possui_alibi, quantidade_evidencias, nivel_suspeita) VALUES ('Helena Duarte',
 31,'Restauradora de Arte', 'Campinas',FALSE,'22:50:00',FALSE,1,2);

-- update 

UPDATE investigacao 
SET nivel_suspeita = 3 WHERE id = 2;

UPDATE investigacao
SET cidade = 'Cachoeira de Minas' WHERE nome = 'Helena Duarte';

UPDATE investigacao	
SET nivel_suspeita = nivel_suspeita +1 WHERE estava_na_sala_do_cofre = TRUE;



-- delete

DELETE FROM investigacao 
WHERE nivel_suspeita <2 AND possui_alibi = TRUE AND quantidade_evidencias = 0;

DELETE FROM investigacao
WHERE nivel_suspeita =1;

-- select todos os registros
USE laboratorio;
SELECT * FROM investigacao; 

-- select nome e profissão
SELECT nome, profissao FROM investigacao;

-- select em ordem decrescente de idade
SELECT * FROM investigacao ORDER BY idade DESC;

-- select quem estava na sala do cofre
SELECT * FROM investigacao WHERE estava_na_sala_do_cofre = TRUE;

-- select nivel de suspeita > 3 
SELECT * FROM investigacao WHERE nivel_suspeita > 3;

-- select idade entre 30 e 50 
SELECT * FROM investigacao WHERE idade BETWEEN 30 AND 50;

-- select nome começando com 'A'
SELECT * FROM investigacao WHERE nome LIKE 'A%';

-- select nome terminando com "O"
SELECT * FROM investigacao WHERE nome LIKE '%O';

-- select profissão que contenha "ART"
SELECT * FROM investigacao WHERE profissao LIKE '%Art%';

-- select convidados de São Paulo, Campinas ou Santos
SELECT * FROM investigacao WHERE cidade IN ('São Paulo',' Campinas','Santos');

-- contando todos os convidados
SELECT COUNT(*) AS total_convidados 
FROM investigacao;

-- maior e menor nivel de suspeita
SELECT 
    MAX(nivel_suspeita) AS maior_nivel_suspeita,
    MIN(nivel_suspeita) AS menor_nivel_suspeita
FROM investigacao;

-- soma total de evidencias
SELECT SUM(quantidade_evidencias) AS total_evidencias 
FROM investigacao;
	
-- agrupando por profissão e contando 
SELECT profissao, COUNT(*) AS total_convidados FROM investigacao GROUP BY profissao;


-- média de nivel de suspeita por cidade
SELECT cidade, AVG(nivel_suspeita) AS media_nivel_suspeita FROM investigacao GROUP BY cidade;

-- SUSPEITO PRINCIPAL 

SELECT * FROM investigacao WHERE horario_visto = '23:00:00' AND estava_na_sala_do_cofre = TRUE AND possui_alibi = FALSE 
AND nivel_suspeita > 3 AND quantidade_evidencias >= 2 AND (nome LIKE 'C%' OR nome LIKE 'A%')
ORDER BY nivel_suspeita DESC LIMIT 1;


SET SQL_SAFE_UPDATES =0;



 