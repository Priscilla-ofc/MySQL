-- PESQUISA SIMPLES

SELECT * FROM hospedagens;

-- HOSPEDAGENS MAIS BEM AVALIADAS

SELECT * FROM avaliacoes
WHERE nota >= 4;

-- PESQUISA DE HOSPEDAGENS DE HOTEIS ATIVAS 

SELECT * FROM hospedagens
WHERE tipo = 'hotel' AND ativo = 1;

-- DESCOBRINDO O TIKET MÉDIO DE CADA CLIENTE

SELECT cliente_id, AVG(preco_total) AS ticket_medio
FROM alugueis
GROUP BY cliente_id;

-- MÉDIA DE TEMPO DE CADA RESERVA

SELECT cliente_id, AVG(DATEDIFF(data_fim,data_inicio)) AS media_dias_estadia
FROM alugueis 
GROUP BY cliente_id
ORDER BY media_dias_estadia DESC;

-- 10 PERFIS COM MAIS HOSPEDAGENS ATIVAS NA PLATAFORMA

SELECT p.nome AS nome_proprietario, COUNT(h.hospedagem_id)
AS total_hospedagens_ativas
FROM proprietarios p 
JOIN hospedagens h ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hospedagens_ativas DESC 
LIMIT 10;

-- TOTAL DE HOSPEDAGENS INATIVAS POR PROPRIETÁRIO

SELECT p.nome AS nome_proprietario, COUNT(*) AS total_hospedagens_inativas
FROM proprietarios p 
JOIN hospedagens h ON p.proprietario_id = 
h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome;

-- MESES COM MAIOR E MENOR DEMANDA DE ALUGUEIS 

SELECT YEAR(data_inicio) AS ano,
MONTH(data_inicio) AS mes,
COUNT(*) AS total_alugueis
FROM alugueis
GROUP BY ano, mes
ORDER BY total_alugueis DESC;

-- INCLUSÃO DE COLUNAS EM TABELAS

ALTER TABLE proprietarios
ADD COLUMN qtd_hospedagens INT;

-- ALTERAÇÃO DO NOME DA TABELA E RENOMEAÇÃO DE COLUNA

ALTER TABLE alugueis RENAME TO reservas;

ALTER TABLE reservas RENAME COLUMN aluguel_id TO reserva_id;

-- ATUALIZAÇÃO DE DADOS

UPDATE hospedagens 
SET ativo = 1 
WHERE hospedagem_id IN ('1', '10', '100');

UPDATE proprietarios
SET contato = 'daniela_120@gmail.com'
WHERE proprietario_id = '1009';

-- CONFERENCIA DE ATUALIZAÇÃO DE DADOS

SELECT * FROM hospedagens;

SELECT * FROM proprietarios;

-- EXCLUSÃO DE DADOS DE DUAS HOSPEDAGENS ESPECIFICAS (como esta ligada a outras duas tabelas é necessario deletar primeiro nas outras)

DELETE FROM avaliacoes
WHERE hospedagem_id IN ('10000', '1001');

DELETE FROM reservas
WHERE hospedagem_id IN ('10000', '1001');

DELETE FROM hospedagens
WHERE hospedagem_id IN ('10000', '1001');

/* EXCLUSÕES
DROP DATABASE nome do banco de dados
DROP TABLE nome da tabela*/




