create table user_type(
 id int primary key,
 users varchar(20)
);

create table login(
id int primary key,
username varchar(20) ,
password varchar(20),
type int,
FOREIGN KEY (type) REFERENCES user_type(id) ,
);

create table courses(
course_ID varchar(10) primary key,
course_Name varchar(50),
credit_hrs int,
semester int ,
pre_req varchar(10),
);

create table allocated_courses(
course_Name varchar(50),
Teacher_Name varchar(20),
Section varchar(1),
);



CREATE TABLE Students (
  Student_Id INT PRIMARY KEY,
  UserName varchar(20),
  Student_Name VARCHAR(100),
  Section CHAR(1),
  semester int ,
  Degree VARCHAR(50),
  Batch INT,
  Campus VARCHAR(50),
  DOB DATE,
  Blood VARCHAR(5),
  Gender CHAR(1),
  CNIC VARCHAR(15),
  Emails VARCHAR(100),
  Mobile_No VARCHAR(15),
  Address VARCHAR(200),
  Home_Contact VARCHAR(15),
  Guardian_Name VARCHAR(100),
  FOREIGN KEY (Student_Id) REFERENCES login(id) 
);


create table registered_courses(
Student_Id int,
foreign key (Student_Id) REFERENCES Students(Student_Id),
Registered_Course varchar(50),
feedback_status varchar(20)
);

create table previous_courses(
Student_Id int,
foreign key (Student_Id) REFERENCES Students(Student_Id),
Course_Id varchar(10),
Course_Name varchar(50),
Grade Varchar(5)
);

CREATE TABLE Admins (
  Admin_Id INT PRIMARY KEY,
  UserName varchar(20),
  Admin_Name VARCHAR(100),
  Campus VARCHAR(50),
  DOB DATE,
  Blood VARCHAR(5),
  Gender CHAR(1),
  CNIC VARCHAR(15),
  Emails VARCHAR(100),
  Mobile_No VARCHAR(15),
  Address VARCHAR(200),
  Home_Contact VARCHAR(15),
  Guardian_Name VARCHAR(100),
  FOREIGN KEY (Admin_Id) REFERENCES login(id),
);

CREATE TABLE feedback (
  Student_Id INT ,
  Course VARCHAR(50),
  Date DATE,
  Teacher_Name VARCHAR(50),
  q1 INT,
  q2 INT,
  q3 INT,
  q4 INT,
  q5 INT,
  q6 INT,
  q7 INT,
  q8 INT,
  q9 INT,
  q10 INT,
  q11 INT,
  q12 INT,
  q13 INT,
  q14 INT,
  q15 INT,
  q16 INT,
  q17 INT,
  q18 INT,
  q19 INT,
  q20 INT,
  comments VARCHAR(100),
  FOREIGN KEY (Student_Id) REFERENCES Students(Student_Id)
);


create Table faculty(
 Faculty_Id INT PRIMARY KEY,
  UserName varchar(20),
  Faculty_Name VARCHAR(100),
  Campus VARCHAR(50),
  DOB DATE,
  Blood VARCHAR(5),
  Gender CHAR(1),
  CNIC VARCHAR(15),
  Emails VARCHAR(100),
  Mobile_No VARCHAR(15),
  Address VARCHAR(200),
  FOREIGN KEY (Faculty_Id) REFERENCES login(id)
);


create table attendance(
Course_Name varchar(50),
Section varchar(1),
Student_ID int ,
Student_Name varchar(100),
Date Date,
Statuss varchar(1),
);

create table marks_distribution(
course_ID varchar(10) ,
course_Name varchar(50),
Section varchar(1),
category varchar(20) ,
weightage int ,
foreign key(course_ID) references courses(course_id)
);


create table marks(
course_ID varchar(10),
course_Name varchar(50),
Student_ID int,
Student_Name varchar(100),
Section varchar(1),
category varchar(20),
marks int,
foreign key (Student_ID) references Students(Student_Id)
);

create table grades(
course_ID varchar(10),
course_Name varchar(50),
Student_ID int,
Student_Name varchar(100),
Section varchar(1),
grade varchar(2),
foreign key (Student_ID) references Students(Student_Id)
);

----------------------------------------------------------------------------------------------------
--check:
create table rough_table(
id int primary key,
username varchar(20) ,
password varchar(20),
typee int,
FOREIGN KEY (typee) REFERENCES user_type(id) ,
);
------------------------------------------------------ INSERTIONS-----------------------------------------------

INSERT INTO user_type VALUES (1, 'admin'), (2, 'faculty'), (3, 'admin');
UPDATE user_type SET users = 'student' WHERE id = 3;

INSERT INTO registered_courses (Student_Id, Registered_Course, feedback_status)
VALUES (27, 'COAL', 'notsubmitted');

SELECT * FROM login_input
INSERT INTO login(id,username, password, type)
select id,username,password,type from login_input
select* from login

SELECT * FROM courses_input
INSERT INTO courses(course_ID,course_Name,credit_hrs,semester,pre_req)
SELECT course_code,couse_Name,credit_hrs,semester,pre_req from courses_input;
SELECT * FROM courses;


SELECT * FROM student_input;
INSERT INTO Students(Student_Id,UserName,Student_Name,Section,semester,Degree,Batch,Campus,DOB,Blood,Gender,CNIC,Emails,Mobile_No,Address,Home_Contact,Guardian_Name)
SELECT Student_Id,UserName,Student_Name,Section,semester,Degree,Batch,Campus,DOB,Blood,Gender,CNIC,Emails,Mobile_No,Address,Home_Contact,Guardian_Name from student_input;
SELECT * FROM Students;

SELECT * FROM admin_input;
INSERT INTO admins(Admin_Id,UserName,Admin_Name,Campus,DOB,Blood,Gender,CNIC,Emails,Mobile_No,Address,Home_Contact,Guardian_Name)
SELECT Admin_Id,UserName,Admin_Name,Campus,DOB,Blood,Gender,CNIC,Emails,Mobile_No,Address,Home_Contact,Guardian_Name from admin_input;
SELECT * FROM admins;

SELECT * FROM previous_courses_input;
INSERT INTO previous_courses(Student_Id,Course_Id,Course_Name,Grade)
SELECT Student_Id,Course_Id,Course_Name,Grade from previous_courses_input;
SELECT * FROM previous_courses;

SELECT * FROM registered_courses_input;
INSERT INTO registered_courses(Student_Id,Registered_Course,feedback_status)
SELECT Student_Id,Registered_Course,feedback_status from registered_courses_input;
SELECT * FROM registered_courses;

SELECT * FROM faculty_input;
INSERT INTO faculty(Faculty_Id,UserName,Faculty_Name,Campus,DOB,Blood,Gender,CNIC,Emails,Mobile_No,Address)
SELECT Faculty_Id,UserName,Faculty_Name,Campus,DOB,Blood,Gender,CNIC,Emails,Mobile_No,Address from faculty_input;
SELECT * FROM faculty;




UPDATE students SET semester = 3 WHERE student_id = 1;
UPDATE students SET semester = 4 WHERE student_id = 2;
UPDATE students SET semester = 5 WHERE student_id = 3;

-----------------------------------------------------------------------------------------------------------

select* from user_type
select* from login
select* from courses
select* from Students
select* from registered_courses
select* from previous_courses
select* from admins
select* from feedback
select* from faculty
select* from allocated_courses
select* from attendance
select* from marks_distribution
select* from marks
select* from grades

-------------------------------------------------------QUERIES--------------------------------------------
SELECT distinct c.course_id, c.course_name
FROM courses c
left join previous_courses pc on pc.Course_Id=c.course_ID
where c.semester=4



SELECT c.course_id, c.course_name
FROM courses c
JOIN (
    SELECT pc.course_id
    FROM previous_courses pc
    WHERE pc.student_id = 1
) pc ON c.pre_req = pc.course_id
WHERE c.semester <= 4 AND pc.course_id IS NULL


SELECT c.course_id, c.course_name
FROM courses c
WHERE c.course_ID NOT IN (
    SELECT pc.course_id
    FROM previous_courses pc
    WHERE pc.student_id = 4
) 
AND c.semester <= 4
AND NOT EXISTS (
    SELECT 1
    FROM courses pre
    WHERE pre.course_id = c.pre_req
    AND pre.course_id NOT IN (
        SELECT pc.course_id
        FROM previous_courses pc
        WHERE pc.student_id = 4
    )
)



SELECT Registered_Course, COUNT(*) AS Num_Students
FROM registered_courses
GROUP BY Registered_Course
HAVING COUNT(*) >= 10;

select distinct rc.Registered_Course
from registered_courses rc
join students s on s.Student_Id=rc.Student_Id
where s.Section='B'

select distinct s.section from students s join registered_courses rc on s.Student_Id = rc.Student_id


SELECT CONCAT(Section, '   |    ', Course_Name) AS Course_Section, Teacher_Name 
FROM allocated_courses;


select s.Student_Id,s.student_name from  students s 
join registered_courses rc on rc.Student_Id=s.Student_Id
where s.section='A'
AND rc.Registered_Course='COAL'


SELECT AVG(q1+q2+q3+q4+q5+q6+q7+q8+q9+q10+q11+q12+q13+q14+q15+q16+q17+q18+q19+q20) AS avg_marks
FROM feedback
WHERE Teacher_Name = 'Farhan Ismail'

SELECT DISTINCT Section 
FROM allocated_courses WHERE teacher_name=@Faculty_Name

SELECT Course_Name 
FROM allocated_courses WHERE teacher_name=@Faculty_Name AND Section=@Section


SELECT allocated_courses.course_Name FROM allocated_courses join courses c on c.course_Name=allocated_courses.course_Name where teacher_name='Farhan Ismail' AND Section='A'



SELECT SUM(weightage * marks) / 100 AS Absolutes,
       CASE 
           WHEN SUM(weightage * marks) / 100 >= 90 THEN 'A+'
           WHEN SUM(weightage * marks) / 100 >= 86 THEN 'A'
           WHEN SUM(weightage * marks) / 100 >= 82 THEN 'A-'
           WHEN SUM(weightage * marks) / 100 >= 78 THEN 'B+'
           WHEN SUM(weightage * marks) / 100 >= 74 THEN 'B'
           WHEN SUM(weightage * marks) / 100 >= 70 THEN 'B-'
           WHEN SUM(weightage * marks) / 100 >= 66 THEN 'C+'
           WHEN SUM(weightage * marks) / 100 >= 62 THEN 'C'
           WHEN SUM(weightage * marks) / 100 >= 58 THEN 'C-'
           WHEN SUM(weightage * marks) / 100 >= 54 THEN 'D+'
           WHEN SUM(weightage * marks) / 100 >= 50 THEN 'D'
           ELSE 'F'
       END AS Grade
FROM marks_distribution md
JOIN marks m ON md.course_Name = m.course_Name AND md.Section = m.Section AND md.category = m.category
WHERE md.course_Name = 'COAL' AND md.Section ='A' AND m.Student_ID = 27
GROUP BY m.Student_ID


SELECT grade, COUNT(*) as count
FROM grades
where Section='A' AND course_Name='COAL'
GROUP BY grade;

select course_name,count(*)
From attendance
where Statuss='P' AND Student_ID=7
group by Course_Name

SELECT courses.semester, COUNT(*) AS num_passed_courses
FROM Students
JOIN previous_courses ON Students.Student_Id = previous_courses.Student_Id AND previous_courses.Grade != 'F'
left join courses on courses.course_ID=previous_courses.Course_Id
WHERE Students.Student_Name = 'Ali Ahmed'
GROUP BY courses.semester;

-------------------------------------------------------------------------------------------------------



-------------------------------------------------TRIGGERS-----------------------------------------------
CREATE TABLE Logg (
    Activity VARCHAR(40),
    Date DATETIME
)


--------------------------------- student/faculty insertion triggers-----------------------
go
CREATE TRIGGER Insert_student
ON Students
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Admin Registered a New Student', GETDATE())
END
go

go
CREATE TRIGGER Insert_faculty
ON faculty
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Admin Registered a New Faculty Member', GETDATE())
END
go

select * students

--------------------------------- (faculty) attendance insertion/updated triggers -----------------------
go
CREATE TRIGGER insert_attendance
ON attendance
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Marked Attendance', GETDATE())
END
go

go
CREATE TRIGGER update_attendance
ON attendance
AFTER update
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Updated Attendance', GETDATE())
END
go


--------------------------------- (faculty) marks insertion/updated triggers -----------------------
go
CREATE TRIGGER insert_marks
ON marks
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Entered Marks', GETDATE())
END
go

go
CREATE TRIGGER update_marks
ON marks
AFTER update
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Updated Previous Marks', GETDATE())
END
go


--------------------------------- (student) feedack insertion triggers -----------------------

go
CREATE TRIGGER insert_feedback
ON feedback
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Student Gave Feedback', GETDATE())
END
go


--------------------------------- (student) grades insertion/updation triggers -----------------------
go
CREATE TRIGGER insert_grades
ON grades
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Submitted Grades', GETDATE())
END
go

go
CREATE TRIGGER update_grades
ON grades
AFTER update
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty changed marks so grades are updated', GETDATE())
END
go



--------------------------------- (faculty) marks distribution insertion/updation triggers -----------------------
go
CREATE TRIGGER insert_marks_distribution
ON marks_distribution
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Entered Marks Distribution', GETDATE())
END
go

go
CREATE TRIGGER update_marks_distribution
ON marks_distribution
AFTER update
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Faculty Updated Marks Distribution', GETDATE())
END
go



--------------------------------- (student) registered courses insertion  triggers -----------------------

go
CREATE TRIGGER insert_registered_courses
ON registered_courses
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Student Registered a new Course', GETDATE())
END
go

--------------------------------- (admin) allocated courses insertion  triggers -----------------------

go
CREATE TRIGGER insert_allocated_courses
ON allocated_courses
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Admin allocated a new course to faculty member', GETDATE())
END
go


--------------------------------- (admin)  courses insertion  triggers -----------------------

go
CREATE TRIGGER insert_courses
ON courses
AFTER INSERT
AS
BEGIN
	INSERT INTO Logg (Activity, Date)
    VALUES ('Admin registered a new course', GETDATE())
END
go


select* from logg


