create database intersect_set_operation_concept;
use intersect_set_operation_concept;

create table student2024(
student_id int primary key,
student_name varchar(100)
);

insert into student2024(student_id, student_name)
values
(1001, "Adam"),
(1002, "Bob");

create table student2026(
student_id int primary key,
student_name varchar(100)
);

insert into student2026(student_id, student_name)
values
(1001, "Adam"),
(1002, "Bob"),
(1003, "Charlie"),
(1004, "Jones");



-- Insterct is not supported in myql

select  student_id, student_name
from student2024
INTERSECT
select student_id, student_name
from student2026;