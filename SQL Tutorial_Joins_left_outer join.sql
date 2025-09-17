create database course_data1;
use course_data1;

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


select * 
from student
left join courses
on student.course_id = courses.course_id;

select student.s_id, student.student_name, courses.course_name, student.marks, student.grade, student.city
from student
left join courses 
on courses.course_id = student.course_id;



--------------------------------------------------------------

create table customer(
customer_id int primary key,
customer_name varchar(100)
);

insert into customer(customer_id, customer_name)
values
(1, "Adam"),
(2, "Bob"),
(3, "Casey"),
(4, "Bruce");

create table Order_details(
order_id int primary key,
customer_id int not null,
product  varchar(100),
Amount int not null
);

insert into Order_details(order_id, customer_id, product, Amount)
values
(1001, 1, "Fridge", 15000),
(1002, 2, "Tv", 25000),
(1003, 3, "Ac", 25000),
(1004, 4, "Bike", 45000),
(1005, 5, "Cycle", 5000),
(1006, 6, "Cricket kit", 2000),
(1007, 7, "Football", 200),
(1008, 8, "Car", 60000),
(1009, 9, "room cleaner robot", 65000),
(1010, 10, "washing machine", 8000);

select customer.customer_name, Order_details.order_id, Order_details.product, Order_details.Amount
from Order_details
left join customer
on Order_details.customer_id = customer.customer_id;


select customer.customer_name, Order_details.order_id, Order_details.product, Order_details.Amount
from customer
left join Order_details
on  customer.customer_id = Order_details.customer_id;

select * 
from Order_details
left join customer
on Order_details.customer_id = customer.customer_id;

select * 
from customer
left join Order_details
on customer.customer_id = Order_details.customer_id;