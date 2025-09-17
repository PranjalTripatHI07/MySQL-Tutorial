create database college_db_practice_db;

use college_db_practice_db;

create table student_data(
id int primary key,
student_name varchar(100) not null,
age int check(age>=18),
email varchar(200) unique,
email_status varchar(100) default "unactive",
city varchar(100)
);

insert into student_data values(1, "bruce_van", 20, "brucevan@gmail.com", " ", "New York");
insert into student_data values(2, "Tony Stark", 20, "tony@gmail.com", " ", "New York");
insert into student_data values(3, "Bat-man", 20, "batman@gmail.com", " ", "New York");
insert into student_data values(4, "Super-man", 20, "superman@gmail.com", " ", "New York");
insert into student_data values(5, "Hulk", 20, "hulk@mail.com", " ", "New York");


