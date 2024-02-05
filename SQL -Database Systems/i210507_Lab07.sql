use lab6

select *from emp
select ename 
from emp
where ename like '%J%' ;

select sal
from emp
where sal like '____.00'


select *from emp
where ename like 's___' ;

SELECT CONCAT(ename,empno)
from emp;

select ename + 'is' + job as 'job title'
from emp

--> character funcs
 SELECT CONCAT(ENAME, ' is ', JOB) AS INTRO from dbo.EMP;
 SELECT SUBSTRING(ENAME, 1, 3) from dbo.EMP;
 SELECT ename,LEN(ENAME) from dbo.EMP;
 SELECT ename, CHARINDEX('S', ENAME) from dbo.EMP ;
 SELECT REPLACE(ENAME, 'S', '*') from dbo.EMP;


 --> Numeric funs
 SELECT ROUND(124.255, 2, 0);
 SELECT ABS(-850);


 -->Date funs
SELECT GETDATE();
SELECT DATENAME(YEAR, GETDATE()) AS 'Year';
SELECT DATENAME(QUARTER, GETDATE()) AS 'Quarter';
SELECT DATENAME(MONTH, GETDATE()) AS 'Month Name';
SELECT DATENAME(DAYOFYEAR, GETDATE()) AS 'DayOfYear';
SELECT DATENAME(DAY, GETDATE()) AS 'Day';
SELECT DATENAME(WEEK, GETDATE()) AS 'Week';
SELECT DATENAME(WEEKDAY, GETDATE()) AS 'Day of the Week';
SELECT DATENAME(HOUR, GETDATE()) AS 'Hour';
SELECT DATENAME(MINUTE, GETDATE()) AS 'Minute';
SELECT DATENAME(SECOND, GETDATE()) AS 'Second';
SELECT DATEPART(YYYY, GETDATE());
SELECT DATEPART(mm, GETDATE());
SELECT DATEPART(dd, GETDATE());

-->Case-conversion functions:
 SELECT CONVERT(VARCHAR(30),GETDATE(),23);
 SELECT CAST(25.65 AS varchar);
 SELECT CAST('2017-08-25' AS datetime);
 SELECT LOWER(ENAME) AS lower_case, UPPER(ENAME) AS higher_case from
dbo.EMP;

-->General Functions:
SELECT comm,ISNULL(COMM, '50000') from dbo.EMP;

-->Multiple-Row Functions

 SELECT MAX(SAL) AS MaximumSalary from dbo.EMP;
 SELECT MIN(SAL) AS MinimumSalary from dbo.EMP;
 SELECT AVG(SAL) AS AverageSalary from dbo.EMP;


 --> view 
go
CREATE VIEW EMP_NAME AS
SELECT ENAME, JOB, HIREDATE
FROM dbo.EMP;
go

SELECT *FROM emp
order by sal desc;

--> top N analysis

SELECT TOP(3) *FROM EMP;




select * from emp
select * from dept


--> sql joints
select ename, dname
from emp,dept
where emp.DeptNo=dept.DeptNo;
--> or
SELECT ENAME, JOB, DNAME FROM dbo.EMP INNER JOIN dbo.DEPT ON dbo.EMP.DEPTNO =
dbo.DEPT.DEPTNO;

-->Left Outer Join
SELECT ENAME, JOB, DNAME FROM dbo.EMP LEFT OUTER JOIN dbo.DEPT ON dbo.EMP.DEPTNO =
dbo.DEPT.DEPTNO;

-->Right Outer Join
SELECT ENAME, JOB, DNAME FROM dbo.EMP RIGHT OUTER JOIN dbo.DEPT ON dbo.EMP.DEPTNO =
dbo.DEPT.DEPTNO;

-->Full Outer Join

SELECT ENAME, JOB, DNAME FROM dbo.EMP FULL JOIN dbo.DEPT ON dbo.EMP.DEPTNO =
dbo.DEPT.DEPTNO;

--> task 1
select lower (ename), DName
from emp inner join dept 
on emp.DeptNo= '20' where emp.Sal > 2000 and DName = 'RESEARCH';

--> TASK 2
 SELECT MAX(sal) AS MaximumSalary ,  MIN(SAL) AS MinimumSalary, dname from emp, dept group by dname
 
 --> task 3
select empno, ename, DName
from emp inner join dept 
on emp.DeptNo= dept.DeptNo where dept.DeptNo > 10 and emp.EName like '%s%';

--> task 4
select * from emp
where emp.sal > (select emp.sal from emp where ename = 'Jones');

--task 5
select * from emp
where job != 'MANAGER' or Mgr is NULL;

--> task 6
SELECT CONCAT(ENAME, ' is ' ,JOB) AS INTRO from dbo.EMP;