-- Alter Command in Sql
--  Alter command is Sql command which is used for changing or modifying
-- structure(schema) of existing table
-- types in alter command 
-- 1 Add column
-- 2 drop column
-- 3 rename column
-- 4 change column
-- 5 modify column

create database sample_data24;
use sample_data24;

create table student(
id int primary key,
student_name varchar(100) not null,
course varchar(50),
marks  int
);

insert into student(id, student_name, course, marks)
values
(101, "Bruce", "History", 98),
(102, "Tony", "Geography", 80);

-- 1- Add column 
alter table student
add column grade varchar(1) not null;
 
 
 
select * from student;


-- 2- Rename table
alter table student
rename to student_data;

select * from student_data;

-- 3- Chnage column 
alter table student_data
change column grade G_ varchar(1) not null;

select * from student_data;

-- 4- Modify column
alter table student_data 
modify G_  varchar(2) not null;

select * from student_data;


-- 5- Drop column
alter table student_data
drop column G_;

select * from student_data;

