create database practice_hub;
use practice_hub;

create table city_info(
id int primary key,
city  varchar(200)
);

insert into city_info values(1, "New york");
insert into city_info values(2, "Wasington DC");

create table employee_details(
id int primary key,
emp_name varchar(200),
city_id  int,
foreign key(city_id) references city_info(id)
);

insert into employee_details values(1, "Adam", 2);
insert into employee_details values(2, "Bob", 2);