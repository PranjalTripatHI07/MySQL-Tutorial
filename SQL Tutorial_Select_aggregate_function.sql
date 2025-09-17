create database sample_data5;
use sample_data5;

create table student(
roll_no int primary key,
student_name varchar(200), 
marks int not null,
grade varchar(1),
city varchar(200)
);

insert into student(roll_no, student_name, marks, grade, city) 
values
(101,"Adam", 78, "C", "New York"),
(102, "Bob", 92, "A", "Wasington DC"),
(103, "Jones", 85, "B", "Lundon"),
(104, "Casey", "96", "A", "Paris"),
(105, "Emanual", 12, "F", "New York"),
(106, "Francis", 98, "A", "Paris"),
(107, "Gemyni", 65, "D", "Amsterdam"),
(108, "George", 72, "C", "Birmingham"),
(109, "Sam", 99, "A", "Manchester"),
(110, "Brain", 25, "F", "Manchester");

select * from student;

-- Using count() function

select count(*) from student;
select count(student_name) from student;

-- Using max() function
select max(marks) from student;

-- Using min() function
select min(marks) from student;

-- Using sum() function 
select sum(marks) from student;

-- Using avg() function
select avg(marks) from student;
