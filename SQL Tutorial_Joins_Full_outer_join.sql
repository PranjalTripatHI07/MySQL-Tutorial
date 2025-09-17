create database full_outer_join_concept;
use Full_outer_join_concept;

create table course(
course_id int,
course_name varchar(100)
);

insert into course(course_id, course_name)
values
(102, "English"),
(105, "space tech"),
(106, "History"),
(108, "Geography");

create table student(
id int primary key,
student_name varchar(100)
);
insert into student(id, student_name)
values
(101, "Adam"),
(102, "Bob"),
(103, "Jones"),
(104, "Casey"),
(105, "Bruce"),
(106, "Hulk"),
(107, "Tony"),
(108, "Sam"),
(109, "jackson"),
(110, "Autom");


select * 
from student as s
left join course as sc
on s.id = sc.course_id
union 
select * 
from student as s
right join course as sc
on s.id = sc.course_id;


