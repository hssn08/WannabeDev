create database lab7
use lab7
CREATE TABLE tblEmployee (
id INTEGER NOT NULL,
firstName VARCHAR(255) NOT NULL,
lastName VARCHAR(255) NOT NULL,
salary INTEGER NOT NULL,
departID INTEGER NULL
);
CREATE TABLE tblDepartment (
id INTEGER NOT NULL,
name VARCHAR(255) NOT NULL,
location VARCHAR(255) NOT NULL
);

INSERT into tblDepartment VALUES

(1,'SQL','Mumbai'),
(2,'Finance','Pume'),
(3,'SDM','Thane'),
(4,'MySQL','Chennei'),
(5,'DB2','Kolkatta'),
(6,'Oracle','Delhi'),
(7,'Marketing','Delhi'),
(8,'Networking','Mumbai'),
(9,'HR','Mumbai'
);


Insert into tblEmployee values

(1,  '  Abhishek','Yadav',  37000,1),
(2,  '  Raj',     'Verma',  47500,3),
(3,  '  Tony',    'Bell',   44000,2),
(4,	'  Rahul',   'Sharma', 27000,NULL),
(5,  '  Vishal',  'Maurya', 18500,4),
(6,  '  Jyoti',   'Kakawat',28000,5),
(7,  '  Vipin',   'Mehra',  30000,2),
(8,  '  Pradeep', 'Gupta',  70000,1),
(9,  '  Sumit',   'Jolly',  55000,6),
(10, '  Jyoti',   'Mishra', 20000,NULL),
(11, '  Karan',   'Pratap', 25000,2),
(12, '  Aleem',   'Shaikh', 35000,1),
(13, '  Kavita',  'Thakur', 30000,4),
(14, '  Sufyan',  'Mukadam',40000,6),
(15, '  Ashish',  'Mehra',  37000,NULL),
(16, '  Mehul',   'Joshi',  65000,NULL),
(17, '  Payal',   'Yadav',  15000,5),
(18, '  Swapnil', 'Patil',  36000,5),
(19, '  Richa',   'Patel',  35000,NULL),
(20, '  Mahesh',  'Singh',  33000,5),
(21, '  Kaleem',  'Khan',   8000 ,4),
(22, '  Heena',   'Shaikh', 14000,NULL),
(23, '  Rahul',   'Kotian', 26000,3),
(24, '  Naveen',  'Kapoor', 37000,NULL),
(25, '  sanjay',  'sawant', 65000,3);

select TOP 4
tblEmployee.id,
(tblEmployee.firstName+'  '+tblEmployee.lastName) AS FULLNAME,
tblEmployee.salary, 
tblDepartment.name, 
tblDepartment.location AS DEPT_ADRESS 
from tblEmployee 
Join tblDepartment ON tblDepartment.id=tblEmployee.departID
ORDER BY tblEmployee.id ASC
 
 select TOP 2
 tblDepartment.name AS DEPTNAME, COUNT(tblDepartment.id) AS TOTAL_EMPLOYEE
 from tblEmployee
 Join tblDepartment ON tblDepartment.id=tblEmployee.departID
 GROUP BY tblDepartment.name

 select 
 tblDepartment.name AS DEPTNAME, tblEmployee.salary AS SALARY
 from tblDepartment
 Join tblEmployee ON tblDepartment.id=tblEmployee.departID
 
 WHERE tblEmployee.salary = (select MIN(tblEmployee.salary) from tblEmployee)

 select TOP 1
 tblDepartment.name AS DEPTNAME, AVG(tblEmployee.salary) AS SALARY
 from tblEmployee
 Join tblDepartment ON tblDepartment.id=tblEmployee.departID
GROUP BY tbldepartment.id, tbldepartment.name
ORDER BY SALARY ASC
