USE marketplace;

CREATE TABLE clientes (
	cliente_id INT PRIMARY KEY,
	nome VARCHAR(255),
	email VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    data_cadastro DATE
);

CREATE TABLE produto (
  ProdutoID INT PRIMARY KEY,
  Nome VARCHAR(100),
  Categoria VARCHAR(50),
  Preco DECIMAL(10,2),
  Estoque INT
);

CREATE TABLE vendas (
	venda_id INT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    data_venda DATE,
    quantidade INT,
    valor_total DECIMAL(10, 2)
);

