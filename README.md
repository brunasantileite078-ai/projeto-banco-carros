# 🚗 Projeto Banco de Dados de Carros

## 📌 Sobre o projeto

Projeto de banco de dados relacional desenvolvido em **MySQL**, com o objetivo de simular o gerenciamento de vendas de veículos e aplicar conceitos de banco de dados e SQL.

O projeto foi desenvolvido como parte do meu portfólio na área de **Dados**, utilizando modelagem relacional, relacionamentos entre tabelas e consultas SQL para geração de informações.

## 🎯 Objetivos

- Criar um banco de dados relacional;
- Praticar criação e manipulação de tabelas;
- Trabalhar com chaves primárias e estrangeiras;
- Utilizar relacionamentos entre tabelas;
- Realizar consultas com `JOIN`;
- Aplicar funções de agregação como `SUM`, `COUNT` e `AVG`;
- Gerar análises sobre vendas e faturamento.

## 🗄️ Estrutura do banco

O banco de dados `carros` é composto pelas seguintes tabelas:

### `marcas`

Armazena as informações das marcas dos veículos.

- `id`
- `nome_marca`
- `origem`

### `inventario`

Armazena os veículos disponíveis no inventário.

- `id`
- `modelo`
- `transmissao`
- `motor`
- `combustivel`
- `marcas_id`

### `clientes`

Armazena os dados dos clientes.

- `id`
- `nome`
- `sobrenome`
- `endereço`

### `vendas`

Registra as vendas realizadas.

- `id`
- `clientes_id`
- `inventario_id`
- `data_venda`
- `valor_venda`

## 🔗 Relacionamentos

O banco utiliza relacionamentos entre as tabelas para conectar:

- **Marcas → Inventário**
- **Clientes → Vendas**
- **Inventário → Vendas**

Esses relacionamentos permitem consultar informações integradas sobre clientes, veículos, marcas e vendas.

## 📊 Consultas realizadas

Durante o desenvolvimento foram realizadas consultas para analisar:

- Faturamento total;
- Faturamento por marca;
- Quantidade de vendas por marca;
- Ticket médio das vendas;
- Veículo com maior valor de venda;
- Dados de vendas utilizando `INNER JOIN`.

## 💻 Tecnologias utilizadas

- **MySQL**
- **MySQL Workbench**
- **SQL**
- **GitHub**

## 📈 Principais conceitos praticados

- Modelagem de banco de dados;
- Tabelas relacionais;
- Chave primária (`PRIMARY KEY`);
- Chave estrangeira (`FOREIGN KEY`);
- `INNER JOIN`;
- `GROUP BY`;
- `ORDER BY`;
- `SUM()`;
- `COUNT()`;
- `AVG()`;
- `LIMIT`.

## 🚀 Como executar o projeto

1. Instale o **MySQL** e o **MySQL Workbench**.
2. Abra o arquivo `Banco_carros.sql`.
3. Execute o script no MySQL Workbench.
4. O banco de dados e suas tabelas serão criados.
5. Execute as consultas SQL para reproduzir as análises do projeto.

## 👩‍💻 Autora

**Bruna Santiago Leite**

Estudante de Ciência de Dados, com interesse em **SQL, Banco de Dados, Análise de Dados e Inteligência Artificial**.

---

📌 Projeto desenvolvido para fins de estudo e construção de portfólio profissional.
