create database sample_data6;
use sample_data6;

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

-- Using group by clause
select city, count(student_name) from student
group by city;

select student_name, city, count(student_name) from student 
group by student_name, city;

select city, min(marks) from student
group by city;

select city, max(grade) from student 
group by city;

select city, avg(marks) from student
group by city;