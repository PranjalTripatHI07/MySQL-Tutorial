-- Using Truncate command 
-- Truncate command is used for deleting table data not table

create database sample_data20;
use sample_data20;

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


create table department(
id int primary key,
course varchar(50) not null
);

-- This is parent table
insert into department(id, course)
values
(101, "History"),
(102, "Geography");

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


-- Using Truncate command 

truncate table student;
select * from student;