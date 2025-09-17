create database sample_data7;
use sample_data7;

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
(110, "Brain", 25, "F", "Manchester"),
(111, "Bruce", 100, "A", "New York"),
(112, "Hulk", 85, "B", "Amsterdam"),
(113, "Bakki", 20, "F", "Shanghai"),
(114, "Tony", 100, "A", "New York"),
(115, "Thor", 100, "A", "Ashgard");

select * from student;

-- Q Write a Query to find the avg marks in each city in 
-- ascending order

select city, avg(marks) from student 
group by city order by city;

select city, avg(marks) from student 
group by city order by avg(marks);