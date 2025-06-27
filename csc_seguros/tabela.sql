USE csc_seguros;

CREATE TABLE clientes (
clientes VARCHAR(255) PRIMARY KEY,
cpf VARCHAR(14),
seguro VARCHAR(255),
contratacao DATE,
premio DECIMAL(10, 2),
pagamento VARCHAR(255),
vigencia_inc DATE,
vigencia_fim DATE,
status VARCHAR(255),
cancelamento DATE,
renovacao VARCHAR(10)
);