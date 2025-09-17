-- steps for reverse eng (er diagram visualization) 
-- 1 - First create data base and table and define foreign key and primary key
-- 2 - Go to database option on to of mysql workbench
-- 3 -  click on reverse engineering option 
-- 4 - then you able to visualize the er diagram of database table you created

create database ForeignKey_and_PrimaryKey_reverse_eng;
use ForeignKey_and_PrimaryKey_reverse_eng;

-- this is parent table
create table department(
id int primary key,
course varchar(100)
);
insert into department(id, course)
values
(101, "Science"),
(102, "Maths"),
(103, "History"),
(104, "Geography");

-- this is child table
create table teacher(
id  int primary key,
teacher_name varchar(100),
dep_id int,
foreign key(dep_id) references department(id)
);

insert into teacher(id, teacher_name, dep_id)
values
(1, "Adam", 101),
(2, "Bob", 102),
(3, "Casey", 103),
(4, "Bruce", 104);

select * from department;
select * from teacher;