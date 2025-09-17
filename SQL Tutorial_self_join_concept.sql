create database self_join_concept;
use self_join_concept;

create table Employee(
emp_id int primary key,
employee_name varchar(100),
manager_id int
);

insert into Employee(emp_id, employee_name, manager_id)
values
(1010, "Adam", 1020),
(1020, "Bob", 1040),
(1030, "Jones", 1040),
(1040, "Casey", null);

-- Using self join

select e.employee_name as manager_name, m.employee_name
from employee as e
join employee as m
on e.emp_id = m.manager_id;

select manager.employee_name, emp.employee_name as manager_name  
from employee as emp
join employee as manager
on emp.emp_id = manager.manager_id;


