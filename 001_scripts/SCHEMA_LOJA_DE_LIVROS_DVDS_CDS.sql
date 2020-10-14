-- Loja de venda de artigos como livro, videos, DVDs e CDs

-- As tabelas da loja
--      Detalhes do cliente
--      Tipos de produtos vendidos
--      Detalhes do produto
--      Um hist�rico dos produtos adquiridos pelos clientes
--      Funcion�rios da loja
--      N�vel salarial
-- As tabelas a seguir s�o usadas para conter as informa��es:
--      customers cont�m os detalhes dos clientes
--      product_types cont�m os tipos de produtos vendidos pela lojaCAP�TULO 1 INTRODU��O 41
--      products cont�m os detalhes dos produtos
--      purchases mostra quais produtos foram adquiridos por quais clientes
--      employees cont�m os detalhes dos funcion�rios
--      salary_grades cont�m os detalhes dos n�veis salariais

-- Mostra as tabelas �s quais o usu�rio tem acesso;
SELECT table_name FROM user_tables;

-- Cria��o da tabela customers
CREATE TABLE customers(
    customer_id INTEGER CONSTRAINT customers_pk PRIMARY KEY,
    first_name VARCHAR2(10) NOT NULL,
    last_name VARCHAR2(10) NOT NULL,
    dob DATE,
    phone VARCHAR2(12)
);

-- Inserindo dados na tabela customers
INSERT INTO customers (customer_id,first_name,last_name,dob,phone)
VALUES (001,'John','Brown','01/01/65','800-555-1211');

INSERT INTO customers (customer_id,first_name,last_name,dob,phone)
VALUES (002,'Cynthia','Green','05/02/68','800-555-1212');

INSERT INTO customers (customer_id,first_name,last_name,dob,phone)
VALUES (003,'Steve','White','16/04/71','800-555-1213');

INSERT INTO customers (customer_id,first_name,last_name,phone)
VALUES (004,' Gail','Black','800-555-1214');

INSERT INTO customers (customer_id,first_name,last_name,dob)
VALUES (005,'Doreen','Blue','20/05/70');


-- Exibindo a tabela customers
SELECT * FROM customers;

-- Cria��o da tabela product_types
CREATE TABLE product_types(
    product_type_id INTEGER CONSTRAINT product_types_pk PRIMARY KEY,
    name VARCHAR2(10) NOT NULL
);

-- Inserindo dados na tabela product_types
INSERT INTO product_types(product_type_id,name)
VALUES(1,'Book');

INSERT INTO product_types(product_type_id,name)
VALUES(2,'Video');

INSERT INTO product_types(product_type_id,name)
VALUES(3,'DVD');

INSERT INTO product_types(product_type_id,name)
VALUES(4,'CD');

INSERT INTO product_types(product_type_id,name)
VALUES(5,'Magazine');

-- Exibindo a tabela product_types
SELECT * FROM product_types;


-- Cria��o da tabela products
CREATE TABLE products(
    product_id INTEGER CONSTRAINT products_pk PRIMARY KEY,
    -- Chave estrangeira da tabela product_types
    product_type_id INTEGER
        CONSTRAINT products_fk_product_types
        REFERENCES product_types(product_type_id),
    name VARCHAR2(30) NOT NULL,
    description VARCHAR(50),
    price NUMBER(5,2)    
);

-- Inserindo dados na tabela products
INSERT INTO products(product_id,product_type_id,name,description,price)
VALUES(1,1,'Modern Science','A description of modern science',19.95);

INSERT INTO products(product_id,product_type_id,name,description,price)
VALUES(2,1,'Chemistry','Introduction to Chemistry',30);

INSERT INTO products(product_id,product_type_id,name,description,price)
VALUES(3,2,'Supernova','A star explodes',25.99);

INSERT INTO products(product_id,product_type_id,name,description,price)
VALUES(4,2,'Tank War','Action movie about a future war',19.95);

-- Exibindo a tabela product_types
SELECT * FROM products;

-- Cria��o da tabela purchases
CREATE TABLE purchases (
    product_id INTEGER
        CONSTRAINT purchases_fk_products
        REFERENCES products(product_id),
    -- Chave estrangeira da tabela customers
    customer_id INTEGER
        CONSTRAINT purchases_fk_customers
        REFERENCES customers(customer_id),
    quantity INTEGER NOT NULL,
        CONSTRAINT purchases_pk PRIMARY KEY (product_id, customer_id)
);

-- Inserindo dados na tabela products
INSERT INTO purchases(product_id,customer_id,quantity)
VALUES(1,1,1);

INSERT INTO purchases(product_id,customer_id,quantity)
VALUES(2,1,3);

INSERT INTO purchases(product_id,customer_id,quantity)
VALUES(1,4,1);

INSERT INTO purchases(product_id,customer_id,quantity)
VALUES(2,2,1);

INSERT INTO purchases(product_id,customer_id,quantity)
VALUES(1,3,1);

-- Exibindo a tabela purchases
SELECT * FROM purchases;

-- Cria��o da tabela employee
CREATE TABLE employee (
    employee_id INTEGER CONSTRAINT employee_pk PRIMARY KEY,
    manager_id INTEGER,
    first_name VARCHAR2(10) NOT NULL,
    last_name VARCHAR2(10) NOT NULL,
    title VARCHAR2(20),
    salary NUMBER(6, 0)
);

-- Inserindo dados na tabela employee
INSERT INTO employee(employee_id,first_name,last_name,title,salary)
VALUES(1,'James','Smith','CEO',800000);

INSERT INTO employee(employee_id,manager_id,first_name,last_name,title,salary)
VALUES(2,1,'Ron','Johnson','Sales Manager',600000);

INSERT INTO employee(employee_id,manager_id,first_name,last_name,title,salary)
VALUES(3,2,'Fred','Hobbs','Salesperson',150000);

INSERT INTO employee(employee_id,manager_id,first_name,last_name,title,salary)
VALUES(4,2,'Susan','Jones','Salesperson',500000);

-- Exibindo a tabela employee
SELECT * FROM employee;

-- Cria��o da tabela  salary_grades
CREATE TABLE salary_grades (
    salary_grade_id INTEGER CONSTRAINT salary_grade_pk PRIMARY KEY,
    low_salary NUMBER(6, 0),
    high_salary NUMBER(6, 0)
);

-- Inserindo dados na tabela salary_grades
INSERT INTO salary_grades(salary_grade_id,low_salary,high_salary)
VALUES(1,1,25000);

INSERT INTO salary_grades(salary_grade_id,low_salary,high_salary)
VALUES(2,250001,500000);

INSERT INTO salary_grades(salary_grade_id,low_salary,high_salary)
VALUES(3,500001,750000);

INSERT INTO salary_grades(salary_grade_id,low_salary,high_salary)
VALUES(4,750001,999999);

-- Exibindo a tabela salary_grades
SELECT * FROM salary_grades;

-- Verificar o conteudo da tabela customers
desc customers;

-- Inser��o de um novo cliente
INSERT INTO customers(customer_id, first_name, last_name, dob, phone)
VALUES (6, 'Fred', 'Brown', '01-JAN-1970', '800-555-1215');

SELECT * FROM customers;


-- Modificando uma linha existente em uma tabela

-- Utilizando o UPDATE
UPDATE customers
SET last_name = 'Orange'
WHERE customer_id = 2;

-- OBS.: CUIDADO
-- Se voc� se esquecer de adicionar uma cl�usula WHERE, 
-- todas as linhas ser�o atualizadas.

SELECT * FROM customers WHERE customer_id = 2;

-- Removendo uma linha de uma tabela
DELETE FROM customers
WHERE customer_id = 2;

DESC customers;

-- Para desfazer as altera��es feitas nas linhas, use ROLLBACK:
ROLLBACK;

-- Usando BINARY_FLOAT e BINARY_DOUBLE em uma tabela.
CREATE TABLE binary_test(
    bin_float BINARY_FLOAT,
    bin_double BINARY_DOUBLE
);

INSERT INTO binary_test (bin_float,bin_double)
VALUES (39.5f,15.7d);

INSERT INTO binary_test (bin_float, bin_double) 
VALUES (BINARY_FLOAT_INFINITY, BINARY_DOUBLE_INFINITY);


-- Valor especial           Descri��o
-- BINARY_FLOAT_NAN         Valor n�o-num�rico (NaN--Not a number) para o tipo
--                          BINARY_FLOAT
-- BINARY_FLOAT_INFINITY    Infinito (INF--Infinity) para o tipo BINARY_FLOAT
-- BINARY_DOUBLE_NAN        Valor n�o-num�rico (NaN--Not a number) para o tipo
--                          BINARY_DOUBLE
-- BINARY_DOUBLE_INFINITY   Infinito (INF--Infinity) para o tipo BINARY_DOUBLE

SELECT * FROM binary_test;

COMMIT;

-- *****************************************************************
-- INTRODU��O AO PL/SQL DA ORACLE

-- Declara��es de vari�vel
-- L�gica condicional (if-then-else etc.)
-- Loops
-- Procedures e fun��es


-- A instru��o CREATE PROCEDURE a seguir cria uma procedure chamada update_product_
-- price(), que multiplica o pre�o de um produto por um fator
/*
CREATE PROCEDURE update_product_price(
    p_product_id IN products.product_id%TYPE,
    p_factor IN NUMBER
)AS
    product_count INTEGER;
    
BEGIN
    -- Conta o n�mero de produtos com
    -- product_id fornecido (ser� 1 se o produto existir)
    SELECT COUNT(*)
    INTO product_count
    FROM products
    WHERE product_id = p_product_id;
    -- Se o produto existe (isto �, product_count = 1), ent�o
    -- atualiza o pre�o desse produto
    IF product_count = 1 THEN
        UPDATE products
        SET price = price * p_factor
        WHERE product_id = p_product_id
        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;    
END update_product_price;
*/

-- Recuperando informa��es de tabelas

-- Consultando a tabela customers
SELECT customer_id, first_name, last_name, dob, phone
FROM customers;

SELECT * FROM customers;

-- Especificando as linhas a serem recuperadas usando a cl�usula WHERE

SELECT *
FROM customers
WHERE customer_id = 2;

/*NOTAS:
Para que voc� tenha uma id�ia da capacidade de armazenamento do banco Oracle, 
n�o existe limite de linhas por tabela; voc� pode ter milh�es, bilh�es de linhas 
em uma mesma tabela e mesmo assim manter o desempenho particionando as tabelas. 
O limite f�sico do banco de dados Oracle para armazenamento 
de dados � at� 65.536 tablespaces, cada uma com um datafile de at� 128 TB, 
o que permite ao Oracle armazenar at� 8 hexabytes de informa��o em uma �nica 
inst�ncia. Um hexabyte corresponde a 1,000,000,000,000,000,000
de bytes ou 1 bilh�o de gigabytes.*/

-- A coluna ROWID � conhecida como uma pseudocoluna.
SELECT ROWID, customer_id
FROM customers;

DESC customers;

-- Outra pseudocoluna � ROWNUM, que retorna o n�mero da linha em um conjunto de resultados.
SELECT ROWNUM, customer_id, first_name, last_name
FROM customers;

SELECT ROWNUM, customer_id, first_name, last_name
FROM customers
WHERE customer_id = 3;

-- Efetuando c�lculos Aritm�ticos

/*
Operador Descri��o
+ Adi��o
- Subtra��o
* Multiplica��o
/ Divis�o
*/

SELECT 2 * 6
FROM dual;

-- Somando um n�mero com o dia
-- TO_DATE() � uma fun��o que converte uma string em uma data.
SELECT TO_DATE('25-JUL-2007') + 2
FROM dual;

-- Analizando a tabela dual
DESC dual;
SELECT * FROM dual;

-- Subtrando tr�s dias de 2 de Agosto de 2007
SELECT TO_DATE('02/9/2007') - 3
FROM dual;

-- Subtrando uma data de outra data
SELECT TO_DATE('02/8/2007') - TO_DATE('25/7/2007')
FROM dual;

SELECT name, price
FROM products;

SELECT name, price + 2
FROM products;

SELECT * FROM products;

SELECT 10 * 12 / 3 - 1
FROM dual;

SELECT 10 * (12 / 3 -1)
FROM dual;

-- Usando apelidos de culuna

SELECT price * 2 DOUBLE_PRICE
FROM products;

SELECT price * 2 "DOUBLE PRICE"
FROM products;

SELECT 10 * (12 / 3 - 1) AS "Computation"
FROM dual;

-- Combinando sa�da de coluna usando concatena��o

-- Operador de concatena��o (||)
-- Sem espa�o
SELECT first_name || last_name AS "Customer Name"
FROM customers;

-- Com espa�o
SELECT first_name || ' ' || last_name AS "Customer Name"
FROM customers;

-- Valores Nulos

SELECT * FROM customers;

-- Verificando se exitem algum valor nulos na tabela utilizando IS NULL
SELECT customer_id, first_name, last_name, dob
FROM customers
WHERE dob IS NULL;

SELECT customer_id, first_name, last_name, phone
FROM customers
WHERE phone IS NULL;

-- A fun��o NVL() retorna outro valor no lugar de um nulo.

/*Na consulta a seguir, NVL() retorna a string 'Unknown phone number' (n�mero de telefone
desconhecido) quando a coluna phone cont�m um valor nulo:*/
SELECT customer_id AS "Cliente",first_name AS "1� Nome",last_name AS "2� Nome",
NVL(phone,'N� de telefone desconhecido') AS "N� telefonico"
FROM customers;

SELECT customer_id AS "Cliente",first_name AS "1� Nome",last_name AS "2� Nome",
NVL(dob,'01-JAN-2000') AS DOB
FROM customers;

-- Exibindo linhas distintas

SELECT customer_id
FROM purchases;

DESC customers;
DESC purchases;

