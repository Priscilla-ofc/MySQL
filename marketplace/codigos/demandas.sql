-- DEMANDAS

-- Quantos clientes cadastrados existem 
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- Quais clientes compraram mais de um produto
SELECT c.nome, COUNT(v.venda_id) AS total_compras
FROM clientes c
JOIN vendas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id
HAVING total_compras > 1;

-- Qual foi o produto mais vendido 
SELECT Nome, quantidade
FROM produto, vendas
WHERE quantidade = (SELECT MAX(quantidade) FROM vendas)
LIMIT 1;

-- Qual o valor vendido por mês
SELECT 
DATE_FORMAT(data_venda, '%Y-%m') AS mes, 
SUM(valor_total) AS total_mes
FROM vendas
GROUP BY mes

-- Quais clientes nunca comprar nada
SELECT nome, quantidade 
FROM clientes, vendas
WHERE quantidade <= '0';

-- Estoque atual de cada produto
SELECT nome, estoque
FROM produto;

-- Clientes por estado
SELECT estado, COUNT(*) AS total_clientes
FROM clientes
GROUP BY estado
ORDER BY total_clientes DESC;

-- Produtos com estoque baixo (ex: menos de 50 unidades)
SELECT Nome, Estoque
FROM produto
WHERE estoque <= 50;

