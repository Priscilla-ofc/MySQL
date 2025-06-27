SELECT * FROM clientes;

-- 1. Quantos clientes estão com o status "Cancelado"?
SELECT COUNT(*) AS total_canceladas
FROM clientes
WHERE status = 'Cancelado';

-- 2. Total segurado por tipo de seguro
SELECT seguro, SUM(premio) AS total_premio
FROM clientes
GROUP BY seguro;

-- 3 Média de prêmio por tipo de seguro
SELECT seguro, AVG(premio) AS total_premio
FROM clientes
group by seguro;
    
-- 4 Contagem de clientes por seguro
SELECT COUNT(*) AS total_clientes
FROM clientes
GROUP BY seguro;

-- 5 Cliente com maior e menor prêmio 
SELECT cliente, premio
FROM clientes
WHERE premio = (SELECT MAX(premio) FROM clientes)
OR premio = (SELECT MIN(premio) FROM clientes);

-- 6 Clientes com o seguro cancelado 
SELECT cliente, cancelamento
FROM clientes
WHERE cancelamento;

-- 7 Clientes com o seguro proximo a renovação
SELECT cliente, renovacao, vigencia_fim
FROM clientes
WHERE renovacao = 'Sim';

-- 8 Percentual de cancelamentos 
SELECT 100.0 * SUM(status = 'cancelado') / COUNT(*) AS contratacao
FROM clientes;