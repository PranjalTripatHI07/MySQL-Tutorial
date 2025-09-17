create database sample_data15;
use sample_data15;

create table student1(
roll_no int primary key,
student_name varchar(200), 
marks int not null,
grade varchar(1),
city varchar(200)
);

insert into student1(roll_no, student_name, marks, grade, city) 
values
(101,"Adam", 78, "C", "New York"),
(102, "Bob", 92, "A", "Wasington DC"),
(103, "Jones", 85, "B", "Lundon"),
(104, "Casey", 96, "A", "Paris"),
(105, "Emanual", 12, "F", "New York"),
(106, "Francis", 98, "A", "Paris"),
(107, "Gemyni", 65, "D", "Amsterdam"),
(108, "George", 72, "C", "Birmingham"),
(109, "Sam", 99, "A", "Manchester"),
(110, "Brain", 25, "F", "Manchester");



-- Using update command 

set sql_safe_updates = 0;

update student1 
set grade = 'O'
where grade = 'A';
select * from student1;

update student1
set student_name = "Tony", marks = 100, grade = "A", city ="Amsterdam"
where roll_no = 101;

-- Updating all rows
update student1
set grade = "O";

-- In Updating all rows case we did not use where clause 


select * from student1;