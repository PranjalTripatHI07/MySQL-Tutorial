create database right_join_example;
use right_join_example;

create table course(
student_id int,
course_name varchar(100)
);

insert into course(student_id, course_name)
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
from course 
right join student
on course.student_id = student.id;


select student.id, student.student_name, course.course_name, course.student_id
from course
right join student
on course.student_id = student.id;
