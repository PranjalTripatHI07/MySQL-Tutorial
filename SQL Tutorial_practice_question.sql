create database practice_exercise5;
use practice_exercise5;

create table student(
roll_no int primary key,
student_name varchar(100) not null,
marks int not null,
grade varchar(1),
city varchar(100)
);

insert into student(roll_no, student_name, marks, grade, city)
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



-- Question - Change the name of column "student_name" to "full_name"

alter table student
change student_name Full_name varchar(100) not null;

-- Question - Delete all the students who scored marks less than 80

delete from student
where marks < 80;
 

-- Question - Delete the column for grades.
 
alter table student
drop grade;


select * from student;
