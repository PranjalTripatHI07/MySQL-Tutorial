create database constraint_practice;
use constraint_practice;

-- 1 Unique Constraint 
create table student(
roll_no int primary key,
student_name varchar(200),
age int unique
);

insert into student values(1, "Adam", 20);
insert into student values(2, "Bob", 20);

select * from student;

-- 2 Primary Key constraint 
create table employee(
emp_id int,
emp_name varchar(200),
city varchar(200),
age  int,
primary key(emp_id, emp_name)
);

insert into employee values(101, "Adam", "New york", 20);
insert into employee values(101, "Bob", "New york", 20);
insert into employee values(102, "casey", "Wasington", 22);
insert into employee values(103,  "Jones", "Taxes", 22);

select * from employee;

-- 3 Default Constraint


create table user_info(
id int primary key,
username varchar(200),
age varchar(50) default "NA"
);

insert into user_info values(1, "Adam", 22);
insert into user_info(id, username) values(2, "Bob");

select * from user_info;


-- Check Constraint

create table registered_user_info(
reg_id int primary key,
username varchar(200),
age int check(age>= 18),
city varchar(200)
);

insert into registered_user_info values(1, "Adam", 20, "New york");
insert into registered_user_info values(2, "Bob", 22, "New york");

select * from registered_user_info;