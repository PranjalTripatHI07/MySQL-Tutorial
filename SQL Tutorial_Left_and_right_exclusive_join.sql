create database left_exclusive_outer_join;
use left_exclusive_outer_join;

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
student_id int primary key,
student_name varchar(100)
);

insert into student(student_id, student_name)
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

-- Using Left Exclusive join 
select * 
from student
left join course
on student.student_id = course.course_id
where course.course_id is null;


-- Using Right exclusive join 
select *
from student 
right join course
on course.course_id = student.student_id
where student.student_id is null;