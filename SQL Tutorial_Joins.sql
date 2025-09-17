-- Topic - Joins

-- Joins are sql operations which is used for combining multiple 
-- tables based on reated columns between them

-- Means we use Joins for retrieve data from multiple tables by 
-- combining them together based on columns

-- Note -> We can us Joins where we use foreign key but that is not 
-- necessay. We can use on any tables 

-- Types of joins 
-- 1) Inner Join
-- 2) Outer Join ( 1- Right Join, 2- left join, 3- Full join)

-- Inner Join -> Inner join is a type of join which we can use to
-- retrieve common data from multiple tables based on conditions

create database join_concept1;
use join_concept1;

create table employee(
id int primary key,
employee_name varchar(100)
);

insert into employee(id, employee_name)
values
(101, "Adam"),
(102, "Bob"),
(103, "Casey"),
(104, "Bruce");


create table salary(
s_id int primary key,
salary int
);

insert into salary(s_id, salary)
values
(101, 10000),
(102, 5000),
(103, 10000),
(104, 40000);

-- If we want to combine two tables with all values

select *
from employee
inner join salary
on employee.id = salary.s_id;


-- Updating column name
alter table salary
change column s_id id int;

-- If we want to combine two tables with all values
select * 
from employee
inner join salary
on employee.id = salary.id;

--  if we want to combine two tables and only want specific 
-- column 

select employee.id, employee.employee_name, salary.salary
from employee
inner join salary
on employee.id = salary.id;




-----------------------------------------------------------------


create table courses(
course_id int primary key,
course_name  varchar(100) not null
);

insert into courses(course_id, course_name)
values
(1001, "English"),
(1011, "Geography"),
(1010, "History"),
(1005, "Spacetech");


create table student(
s_id int primary key,
student_name varchar(100) not null,
course_id int not null,
marks int,
grade varchar(1),
city varchar(100)
);

insert into student(s_id, student_name, course_id,  marks, grade, city) 
values
(101,"Adam", 1001, 78, "C", "New York"),
(102, "Bob", 1011,  92, "A", "Wasington DC"),
(103, "Jones", 1010, 85, "B", "Lundon"),
(104, "Casey", 1005, 96, "A", "Paris"),
(105, "Emanual", 1005, 12, "F", "New York"),
(106, "Francis",1010, 98, "A", "Paris"),
(107, "Gemyni", 1001, 65, "D", "Amsterdam"),
(108, "George", 1011, 72, "C", "Birmingham"),
(109, "Sam", 1005, 99, "A", "Manchester"),
(110, "Brain", 1005, 25, "F", "Manchester");

select * 
from student
inner join courses
on student.course_id = courses.course_id;


select student.s_id, student.student_name, student.course_id, courses.course_name,
student.marks, student.grade
from courses
inner join student
on student.course_id = courses.course_id;



select * from courses;
select * from student;
