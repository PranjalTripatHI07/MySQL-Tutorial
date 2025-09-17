create database sample_data2;
use sample_data2;

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

-- Using Order BY clause

select * from student order by city asc;
select * from student order by city desc;

select student_name, grade from student 
order by city asc;

select student_name, grade from student 
order by student_name desc;


select * from student order by marks asc;
select * from student order by grade desc;

select student_name, marks from student 
order by marks desc limit 2;


-- syntax for sorting multiple column using order by clause
select student_name, grade from student
order by grade, student_name;

select * from student order by grade, student_name;

-- syntax for sorting by expression using order by

select student_name, grade, (marks/100) * 100 as percentage
from student order by percentage; 

select roll_no, student_name, grade, (marks/100) as percentage
from student order by percentage;

-- synatx for sorting null values using order by clause 
-- for sorting null values in order by we use null first 
-- and null last
-- note in mysql nulls first and nulls last is not supported 
select student_name, grade from student 
order by grade nulls first; 

-- synatx for sorting by position using order by 

select student_name, grade from student 
order by 2 desc,  1 asc;