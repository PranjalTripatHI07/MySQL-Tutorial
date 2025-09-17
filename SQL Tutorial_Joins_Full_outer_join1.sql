create database full_outer_join_concept1;
use Full_outer_join_concept1;

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

select student.id, student.student_name,  course.course_name, course.course_id
from student 
left join course 
on student.id = course.course_id
union
select student.id, student.student_name,  course.course_name, course.course_id
from student 
right join course 
on student.id = course.course_id;

select s.id, s.student_name,  sc.course_name, sc.course_id
from student as s
left join course  as sc
on s.id = sc.course_id
union
select s.id, s.student_name,  sc.course_name, sc.course_id
from student as s
right join course as sc
on s.id = sc.course_id;


select student.id, student.student_name,  course.course_name, course.course_id
from student 
left join course 
on student.id = course.course_id
union
select student.id, student.student_name,  course.course_name, course.course_id
from student 
right join course 
on student.id = course.course_id;

select s.id, s.student_name,  sc.course_name, sc.course_id
from student as s
left join course  as sc
on s.id = sc.course_id
union
select s.id, s.student_name,  sc.course_name, sc.course_id
from student as s
right join course as sc
on s.id = sc.course_id;