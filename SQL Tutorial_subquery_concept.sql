create database  subquery_concept;
use subquery_concept;

create table student(
id int primary key,
s_name varchar(100),
marks int, 
grade varchar(1)
);

insert into student(id, s_name, marks, grade)
values
(1001, "Adam", 78, "B"),
(1002, "Bob", 98, "A");


-- Using sub query in whare clause
select * 
from student
where marks > (select avg(marks) from student);


insert into student(id, s_name, marks, grade)
values
(1003,"Charlie", 60, "C"),
(1004, "Jones" , 65, "B");

select id, s_name
from student
where id%2 = 0;

select *
from student
where id in (select id from student where id%2=0);



-- Using subQuery in from statement



select * 
from (select s_name from student where grade = "A") as student_A_grade;


-- Using subQuery in select statement

select s_name, (select max(marks) from student) as student_max_marks
from student;