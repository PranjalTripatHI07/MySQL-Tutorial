create database sql_practice_qusetion;
use sql_practice_qusetion;

create table customer(
customer_id int primary key,
customer_name varchar(100),
payment_mode  varchar(100),
city varchar(100)
);

insert into customer(customer_id, customer_name, payment_mode, city) 
values
(101, "Olive Berrett", "Netbanking", "Portland"),
(102, "Ethan Sinclair", "Credit Card", "Miami"),
(103, "Maya Hernandez", "Credit Card", "Seattle"),
(104, "Liam Donovan", "Netbanking", "Denver"),
(105, "Sophia Nguyen", "Credit Card", "New Orleans"),
(106, "Caleb Foster", "Debit Card", "Minneapolls"),
(107, "Ava Patolan", "Debit Card", "Phoenix"),
(108, "Lucas Carter", "Netbanking", "Boston"),
(109, "Isabella Martinez", "Netbanking", "Nashville"),
(110, "Jackson Brooks", "Credit Card", "Boston");

select * from customer;

-- Question - Find the total payment according to each 
-- payment method

select payment_mode, count(payment_mode) 
from customer
group by payment_mode;



select payment_mode, count(customer_name) 
from customer
group by payment_mode;