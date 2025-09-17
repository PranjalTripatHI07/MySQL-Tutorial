-- set operation - set operation is sql operation which is used for 
-- combining results of multiple select Queries 
-- Type of set operations
-- 1- Union
-- 2- Union all
-- 3- except(or Minus)
-- 4- Intersect

create database set_operation_concepts;
use set_operation_concepts;

create table courses(
course_id int primary key,
course_name  varchar(100) not null
);

insert into courses(course_id, course_name)
values
(1001, "English"),
(1011, "Geography"),
(1010, "History"),
(1005, "Spacetech");

create table student(
s_id int primary key,
student_name varchar(100) not null,
course_id int not null,
marks int,
grade varchar(1),
city varchar(100)
);

insert into student(s_id, student_name, course_id,  marks, grade, city) 
values
(101,"Adam", 1001, 78, "C", "New York"),
(102, "Bob", 1011,  92, "A", "Wasington DC"),
(103, "Jones", 1010, 85, "B", "Lundon"),
(104, "Casey", 1005, 96, "A", "Paris"),
(105, "Emanual", 1005, 12, "F", "New York"),
(106, "Francis",1010, 98, "A", "Paris"),
(107, "Gemyni", 1001, 65, "D", "Amsterdam"),
(108, "George", 1011, 72, "C", "Birmingham"),
(109, "Sam", 1005, 99, "A", "Manchester"),
(110, "Brain", 1005, 25, "F", "Manchester");

-- Using union
-- Union is a type of set operation which is used for
-- combining the results of multiple select statement and
-- give unique results (it removes duplicates from final results)
select course_id, course_name
from courses

union 

select s_id, student_name
from student;



-- Using union all 
-- Union all is a type of set operation which is used for 
-- combining the results of multiple select statement and
-- give final result with duplicates 

select s_id, student_name
from student

union all

select course_id, course_name
from courses;


pyspark  databricks azure (blob_storage, data_lack, wherehouse,
parkqetformat, azure_lack_hhouse azure_where_house,  azure_linked_service , medelian architecture(bronze,silver,gold)