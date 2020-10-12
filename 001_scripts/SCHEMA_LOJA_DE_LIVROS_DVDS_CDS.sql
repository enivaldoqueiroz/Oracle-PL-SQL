-- Loja de venda de artigos como livro, videos, DVDs e CDs

-- As tabelas da loja
--      Detalhes do cliente
--      Tipos de produtos vendidos
--      Detalhes do produto
--      Um histórico dos produtos adquiridos pelos clientes
--      Funcionários da loja
--      Nível salarial
-- As tabelas a seguir são usadas para conter as informações:
--      customers contém os detalhes dos clientes
--      product_types contém os tipos de produtos vendidos pela lojaCAPÍTULO 1 INTRODUÇÃO 41
--      products contém os detalhes dos produtos
--      purchases mostra quais produtos foram adquiridos por quais clientes
--      employees contém os detalhes dos funcionários
--      salary_grades contém os detalhes dos níveis salariais


-- Criação da tabela customers
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

-- Criação da tabela product_types
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


-- Criação da tabela products
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

-- Criação da tabela purchases
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

-- Criação da tabela employee
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

-- Criação da tabela  salary_grades
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

-- Inserção de um novo cliente
INSERT INTO customers(customer_id, first_name, last_name, dob, phone)
VALUES (6, 'Fred', 'Brown', '01-JAN-1970', '800-555-1215');

SELECT * FROM customers;
