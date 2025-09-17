--  Cascading for foreign key 
-- Cascading for foreign key means any change in parent table 
-- there will be change in child table also
-- there are two types of cascading for foreign key
-- 1 On delete cascade
-- 2 On update cascade


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


-- This is parent table
create table department(
id int primary key,
course varchar(50) not null
);


insert into department(id, course)
values
(101, "History"),
(102, "Geography");

update department
set id = 104
where id = 102;

update department 
set id = 110
where id = 101;

select * from department;

-- This is child table 
create table teacher(
id int primary key,
teacher_name varchar(100),
dep_id  int,
foreign key(dep_id) references department(id)
-- cascading for freign key
on delete cascade
on update cascade
);

insert into teacher(id, teacher_name, dep_id)
values
(1, "Adam", 101),
(2, "Bob", 102);

select * from teacher;