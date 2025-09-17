create database sample_data;
use sample_data;

create table student(
roll_no int primary key,
student_name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student(roll_no, student_name, marks, grade, city)
values
(101, "Adam", 78, "C", "New York"),
(102, "Bob", 92, "A", "Wasington DC"),
(103, "Jones", 85, "B", "Lundon"),
(104, "Casey", "96", "A", "Paris"),
(105, "Emanual", 12, "F", "New York"),
(106, "Francis", 98, "A", "Paris");

select * from student;
select roll_no, student_name, grade from student;
select distinct * from student;

-- Here distinct keyword used for removing dublicts rows from table
select distinct city from student; 


-- using arithmetic operators 
select roll_no, student_name, marks, grade from student 
where marks > 80;

select city from student where marks > 80;
select student_name, grade from student where city = "paris";


-- using logical operators 
select student_name, grade from student where marks > 80 and city = "Paris";
select student_name from student where marks > 80 or city = "Paris";
select student_name from student where marks > 80 and (city = "Paris" or city = "Wasington dc");

-- using between operator
select * from student where marks between 80 and 100;
select student_name, grade from student 
where marks between 80 and 90;

-- IN operator 
select * from student where city in("New york", "Lundon");
select student_name, grade from student
where city in("New york", "Paris");


-- using NOT operator 
select * from student where city NOT IN("Paris","Lundon");
select student_name, grade from student 
where city not in("Paris", "New York");


-- using Like operator 
select * from student where student_name Like "a%"; 
-- above give us value that start with "a"

select student_name, grade from student
where student_name like "a%";
-- above give us value that start with "a"


select * from student where student_name like "%a";
-- above give us value that end with "a"

select student_name, grade from student 
where student_name Like "%a";
--  above give us value that end with "a"

select * from student where student_name like "%a%";
--  above give us value that have "a" in any position

select student_name, grade from student
where student_name like "%a%";
--  above give us value that have "a" in any position

select * from student where student_name like "_a%";
--  above give us value that have "a" in second position

select student_name, grade from student
where student_name like "_a%";
--  above give us value that have "a" in any position

select * from student where student_name like "a_%";
--  above give us value that start with "a" and are at least 2 character  in length

select student_name, grade from student 
where student_name like "a_%";
--  above give us value that start with "a" and are at least 2 character  in length


select * from student where student_name like "a%m";
--  above give us value that start with "a" and end with "m"

select student_name, grade from student 
where student_name like "a%m";
--  above give us value that start with "a" and end with "m"


-- Using IS NULL operator 

select * from student where student_name is null;

select student_name, grade from student
where grade is null;

select student_name, grade from student
where student_name is null;

select student_name, grade from student
where marks is null;

select student_name, grade from student
where city is null;



-- Using AS operator

select student_name as name from student;

select student_name from student as student_info;

select student_name as name, grade as G from student;

select student_name as name, grade as G from student as student_info;



