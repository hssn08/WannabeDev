create database Lab6ThroughQuery;

use Lab6ThroughQuery;

create table EMP
(
EMPNO numeric(4) not null,
ENAME varchar(10),
JOB varchar(9),
MGR numeric(4),
HIREDATE date,
SAL numeric(7, 2),
COMM numeric(7, 2),
DEPTNO numeric(2)
);

insert into EMP values
(
7269, 'SMITH', 'CLERK', 7982, CONVERT(date, '17-DEC-1988'), 800, NULL, 20
);
insert into EMP values
(
7499, 'ALIEN', 'SALESMAN', 7698, CONVERT(date, '20-FEB-1981'), 1600, 300, 30
);
insert into EMP values
(
7521, 'WARD', 'SALESMAN', 7698, CONVERT(date, '22-FEB-1981'), 1250, 500, 30
);
insert into EMP values
(
7566, 'JONES', 'MANAGER', 7839, CONVERT(date, '2-APR-1981'), 2975, NULL, 20
);
insert into EMP values
(
7654, 'MARTIN', 'SALESMAN', 7698, CONVERT(date, '28-SEP-1981'), 1250, 1400, 30
);
insert into EMP values
(
7698, 'BLAKE', 'MANAGER', 7839, CONVERT(date, '1-MAY-1981'), 2850, NULL, 30
);
insert into EMP values
(
7782, 'CLARK', 'MANAGER', 7839, CONVERT(date, '9-JUN-1981'), 2450, NULL, 10
);
insert into EMP values
(
7788, 'SCOTT', 'ANALYST', 7566, CONVERT(date, '9-DEC-1982'), 3000, null, 20
);
insert into EMP values
(
7566, 'KING', 'PRESIDENT', NULL, CONVERT(date, '17-NOV-1981'), 5000, NULL, 10
);
insert into EMP values
(
7566, 'TURNER', 'SALESMAN', 7698, CONVERT(date, '8-SEP-1981'), 1500, 0, 30
);
insert into EMP values
(
7269, 'ADAMS', 'CLERK', 7788, CONVERT(date, '12-JAN-1983'), 1100, NULL, 20
);
insert into EMP values
(
7900, 'JAMES', 'CLERK', 7698, CONVERT(date, '3-DEC-1981'), 950, NULL, 30
);
insert into EMP values
(
7902, 'FORD', 'ANALYST', 7566, CONVERT(date, '3-DEC-1981'), 3000, NULL, 20
);
insert into EMP values
(
7934, 'MILLER', 'CLERK', 7782, CONVERT(date, '23-JAN-1982'), 1300, NULL, 10
);

CREATE TABLE DEPT
(
DEPTNO NUMERIC(2),
DNAME VARCHAR(14),
LOC VARCHAR(13)
);

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS
(
ENAME VARCHAR (10),
JOB VARCHAR (9),
SAL NUMERIC,
COMM NUMERIC
);

CREATE TABLE SALGRADE
(
GRADE NUMERIC,
LOSAL NUMERIC,
HISAL NUMERIC
);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

CREATE TABLE DUMMY
(
DUMMY NUMERIC
);

INSERT INTO DUMMY VALUES (0);

use Lab6ThroughQuery;
select count(*) FROM INFORMATION_SCHEMA.TABLES where TABLE_TYPE = 'BASE TABLE';

exec sp_help 'EMP';

exec sp_columns EMP;

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'EMP';

select * from EMP;

select job from EMP;

select distinct job from emp;

select job, hiredate, sal from EMP order by deptno;

select ename, hiredate, job, comm, sal from emp where job = 'CLERK';

select distinct job as 'available jobs' from emp;

select ename, hiredate, job, comm, sal from emp where job = 'CLERK' and sal > 1000;

select * from INFORMATION_SCHEMA.tables;

select * from emp where (job = 'CLERK' or job = 'MANAGER' or job = 'ANALYST') and sal < 1200;

select * from emp where sal between 1000 and 3000;

select * from emp where ename LIKE 'A%' order by ename;

select * from emp where ename not like '%A%';

--Exercise 1--

select ename, sal + 300 from emp;

--Exercise 2--

select ename, job, sal from emp where comm is NULL;

--Exercise 3--

select distinct job from emp;

--Exercise 4--

select empno, ename,job, sal from emp where sal > 1500 and job like '5MAN%';

--Exercise 5--

select ename, job from emp where job not in('CLERK', 'ANALYST', 'SALESMAN');

--Exercise 6--

select * from emp order by HIREDATE;