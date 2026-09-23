USE carros;

CREATE TABLE marcas (
	id INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE inventario (
	id INT NOT NULL AUTO_INCREMENT,
	modelo VARCHAR(255) NOT NULL,
    transmissão VARCHAR(255) NOT NULL,
    motor VARCHAR (255) NOT NULL,
    combustivel VARCHAR(255) NOT NULL,
    marcas_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (marcas_id) REFERENCES marcas(id) 
);


CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
	endereço VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE vendas(
	id INT NOT NULL AUTO_INCREMENT,
    clientes_id INT NOT NULL,
    inventario_id INT NOT NULL,
    data_venda DATE NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    
    FOREIGN KEY (clientes_id)
		REFERENCES clientes(id),
        
	FOREIGN KEY (inventario_id)
		REFERENCES inventario(id)


);

INSERT INTO clientes (nome, sobrenome, endereço)
VALUES 
	   ('Bruna','Santiago', 'Rua 2'),
	   ('Marco','Antonio', 'Rua 3'),
	   ('Roselaine','Santiago', 'Rua 4'),
       ('Gabriel','Santiago', 'Rua 5');
       
INSERT INTO inventario (marcas_id,modelo, transmissão, motor, combustivel)
VALUES 
	('1','Kwid Zen','Manual de 5 marchas', '1.0 3-cilindros (SCe)', ' Flex (Gasolina / Etanol)'),
	('2','Onix Plus LT / Premier','Automática de 6 marchas', '1.0 Turbo 3-cilindros', ' Flex (Gasolina / Etanol)'),
    ('3','Argo Drive','Automática CVT (simula 7 marchas)', '1.3 Firefly 4-cilindros)', ' Flex (Gasolina / Etanol)'),
    ('4','208 Active','Automática CVT (simula 7 marchas)', '1.0 Turbo 200 (3-cilindros)', ' Flex (Gasolina / Etanol)'),
    ('5','Corolla Altis Hybrid','Automática Tipo CVT (Transmatic)', '1.8 Flex combinado com motor elétrico)', 'Hibrido Flex (Gasolina / Etanol)');
    
INSERT INTO marcas (nome_marca, origem)
VALUES 
	('Renault','França'),
    ('Chevrolet','Estados Unidos'),
    ('Fiat','italia'),
    ('Peugeot','França'),
    ('Toyota','Japão');
    
INSERT INTO vendas
(clientes_id, inventario_id, data_venda, valor_venda)
VALUES
(1, 1, '2026-01-15', 72000.00),
(2, 2, '2026-02-10', 95000.00),
(3, 3, '2026-03-05', 88000.00),
(4, 4, '2026-04-20', 82000.00),
(5, 5, '2026-05-12', 145000.00);

UPDATE clientes
SET nome = 'Carlos',
    sobrenome = 'Oliveira',
    `endereço` = 'Rua das Flores, 100'
WHERE id = 1;

UPDATE clientes
SET nome = 'Juliana',
    sobrenome = 'Souza',
    `endereço` = 'Avenida Brasil, 250'
WHERE id = 2;

UPDATE clientes
SET nome = 'Rafael',
    sobrenome = 'Santos',
    `endereço` = 'Rua São Paulo, 350'
WHERE id = 3;

UPDATE clientes
SET nome = 'Camila',
    sobrenome = 'Ferreira',
    `endereço` = 'Rua das Palmeiras, 420'
WHERE id = 4;

UPDATE clientes
SET nome = 'Lucas',
    sobrenome = 'Costa',
    `endereço` = 'Avenida Central, 500'
WHERE id = 5;

SELECT
    vendas.id AS venda_id,
    clientes.nome,
    clientes.sobrenome,
    inventario.modelo,
    marcas.nome_marca,
    vendas.data_venda,
    vendas.valor_venda
FROM vendas
INNER JOIN clientes
    ON vendas.clientes_id = clientes.id
INNER JOIN inventario
    ON vendas.inventario_id = inventario.id
INNER JOIN marcas
    ON inventario.marcas_id = marcas.id;

SELECT 
    SUM(valor_venda) AS faturamento_total
FROM vendas;

SELECT
    marcas.nome_marca,
    SUM(vendas.valor_venda) AS faturamento
    FROM vendas
INNER JOIN inventario
    ON vendas.inventario_id = inventario.id
INNER JOIN marcas
    ON inventario.marcas_id = marcas.id
GROUP BY marcas.nome_marca
ORDER BY faturamento DESC;

SELECT
    marcas.nome_marca,
    COUNT(vendas.id) AS quantidade_vendas
FROM vendas
INNER JOIN inventario
    ON vendas.inventario_id = inventario.id
INNER JOIN marcas
    ON inventario.marcas_id = marcas.id
GROUP BY marcas.nome_marca
ORDER BY quantidade_vendas DESC;

SELECT
    AVG(valor_venda) AS ticket_medio
FROM vendas;

SELECT
    inventario.modelo,
    marcas.nome_marca,
    vendas.valor_venda
FROM vendas
INNER JOIN inventario
    ON vendas.inventario_id = inventario.id
INNER JOIN marcas
    ON inventario.marcas_id = marcas.id
ORDER BY vendas.valor_venda DESC
LIMIT 1;