create database self_join_practice;
use self_join_practice;

create table student_details(
student_id int primary key,
student_name varchar(100),
teacher_id int,
course varchar(100)
);

insert into student_details(student_id, student_name, teacher_id, course)
values
(1, "Adam", 4, "Geography"),
(2, "Bob", 4, "History"),
(3, "Jones", 2, "Physology"),
(4, "Casey", null, null);


select b.student_name, a.student_name as teacher_name
from student_details as a
join student_details as b
on a.student_id = b.teacher_id;


create table trainer(
s_id int primary key,
s_name varchar(100),
t_id int,
course varchar(100)
);

insert into trainer(s_id, s_name, t_id, course)
values
(1001, "Bruce", 1004, "History"),
(1002, "Toney", 1001, "Geography"),
(1003, "Jones", 1004, "GeoPolitics"),
(1004, "Casey" , 1005, "Space tech"),
(1005, "Simith", null, null);

select b.s_name, a.s_name as trainer, b.course
from trainer as a
join trainer as b
on a.s_id = b.t_id;


