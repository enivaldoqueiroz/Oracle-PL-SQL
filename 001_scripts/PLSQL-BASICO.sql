-- PL SQL BASICO

-- Mostra as tabelas às quais o usuário tem acesso;
select table_name from user_tables;
select table_name from all_tables;

-- Mostra as tabelas das quais o usuário é dono;
select table_name from user_tables;

-- Criando da table EMP
create table emp(
    empno number(4,0) not null,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4,0),
    hiredate date,
    sal  number(7,2),
    comm number(7,2),
    deptno number(2,0)
);

insert into emp(empno,ename,job,mgr,sal,comm,deptno)
values(7782,'CLARK','PRESIDENT',7839,2450,0,10);

insert into emp(empno,ename,job,sal,comm,deptno)
values(7839,'KING','MANAGER',5000,0,10);

insert into emp(empno,ename,job,mgr,sal,comm,deptno)
values(7934,'MILLER','CLERK',7782,1300,0,10);

select * from emp;

desc emp;


create table dept(
    deptno number(2,0),
    dname varchar2(14),
    loc varchar2(13)
);

select * from dept;
desc dept;

create table empregados(
    empno number(4,0) not null,
    enome varchar2(10),
    job varchar2(9),
    mgr number(4,0),
    hiredate date default sysdate,
    sal number(7,2), 
    comm number(7,2)default 0,
    deptno number(2,0)
    );

select * from empregados;

insert into empregados (empno,enome,job,mgr,sal,comm,deptno)
values(100,'CEREBRO','PEDREIRO',null,3000,0,10);

insert into empregados (empno,enome,job,mgr,hiredate,sal,comm,deptno)
values(102,'PINK','SERVENTE',100,null,1000,0,10);

insert into empregados (empno,enome,job,mgr,hiredate,sal,deptno)
values(102,'JOCA','SERVENTE',100,sysdate,1000,10);

-- Criando tabela com base em SELECT
create table SALES as select * from emp where job = 'SALESMAN';
desc sales;
select * from sales;


create table ANALYST as select * from emp where job = 'ANALYST';
desc analyst;
select * from analyst;

create table CLERK as select * from emp where 1<>1;
desc clerk;
select * from clerk;

-- Tabela temporaria

create global temporary table emp_tmp(
    empno number(4,0) not null,
    enome varchar2(10),
    job varchar2(9),
    mgr number(4,0),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0)
)
on commit preserve rows;

--Inserindo dados na tabela EMP_TMP

insert into emp_tmp select * from emp where deptno = 10;

select * from emp_tmp;
-- Fechamento da transação
commit;

-- Utilizando o Alter Table

-- Adcionando a coluna dt_nascimento
alter table emp add dt_nascimento date;
desc emp;

-- Excluido a coluna dt_nascimento 
alter table emp drop column dt_nascimento;
desc emp;

-- Alterando a coluna ENAME para VACHAR2(240)NOT NULL
alter table emp modify ename varchar2(240) not null;
desc emp;

-- Add a coluna ds_observacao varchar2(2000)
alter table emp add ds_observacao varchar2(2000);
desc emp;

alter table emp modify ds_observacao varchar2(4000);
desc emp;

--Renomeando uma coluna da tabela
alter table emp rename column ename to nome;
desc emp;

--Configura para modo somente de leitura de uma tabela
alter table emp read only;
desc emp;

--Configura para modo somente escrita de uma tabela
alter table emp read write;

-- Utilizando o DROP TABLE

drop table emp;
rollback;

select * from emp;

select * from empregados;
drop table empregados;

-- Utilizando o TRUNCATE TABLE

truncate table emp;

-- Ordenando Dados

desc employees;
-- Ordenando em ordem crescente
select first_name from employees order by first_name;

-- Ordenação informando a posição da coluna 2 FIRST_NAME
select employee_id, first_name,email from employees where rownum < 15 order by 2;

-- Ordenação pela coluna SALARY onde o salario dor entre 4000 e 5000
select first_name,email, salary 
from employees
where salary between 4000 and 5000
order by salary desc;

-- Ordenação pela coluna FIRST_NAME utilizando o ASC(ascendente)
select first_name,email,salary
from employees
where job_id = 'IT_PROG'
order by first_name asc;

--Chamando as colunas FIRST_NAME e JOB_ID da tabela MEPLOYEES onde JOB_ID é igual a IT_PROG
select first_name,job_id from employees where job_id = 'IT_PROG';

--Ordenação por colunas
select * from employees;
desc employees;
desc departments;
desc dept;
select job_id,salary
from employees
where salary between 3000 and 5000
order by job_id asc, salary desc;

select employee_id,first_name,department_id
from employees e
where rownum < 11
order by (
    select first_name from departments d where d.departments = e.employees
);


-- Chamando dados distintos - DISTINCT (restringir linhas duplicadas)

-- Chamando dados não distintos
select department_id 
from employees
order by department_id asc;

--Chamando dados distintos 
select distinct department_id
from employees
order by department_id;

select unique department_id
from employees
order by department_id;


-- Relacionamento Entre Tabelas 

desc employees;
desc departments;
desc dept;
desc clerk;
select * from clerk;

-- INNER JOIN - TABELAS CLERK e DEPT
select ename,dname
from clerk e, dept d
where e.deptno = d.deptno;

-- TABELAS EMPLOYEES e DEPARTMENT

select first_name, department_name
from employees e, departments d
where e.employee_id = d.department_id;

select * from departments order by department_id;

select first_name, department_id
from employees
order by 2;

-- NATURAL JOIN
select dname, ename, sal
from dept
natural join clerk;

select first_name, department_name
from departments
natural join employees;


-- Cláusula USING

-- Mostrando a união da tabela de empregados e departamentos
select employee_id, last_name, location_id, department_id
from employees join departments
using (department_id);

-- Utiluzando o USING com apelidos 
select l.city,d.department_name
from locations l join departments d
using (location_id)
where location_id = 1400;



