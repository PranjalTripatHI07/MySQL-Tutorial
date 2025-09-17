use employees;



/* Using User-defined functions in SQL */

delimiter // 
create function fun_emp_avg_salary(p_emp_no int)
returns decimal(10,2)
deterministic
begin

declare v_avg_salary decimal(10,2);

select round(avg(t2.salary), 2) as avg_salary
into v_avg_salary
from employees as t1
inner join salaries as t2
on t1.emp_no = t2.emp_no
where t1.emp_no = p_emp_no;

return v_avg_salary;

end // 

delimiter ;


/* executing a User-defined function */

select fun_emp_avg_salary(11400);

/* Deleting User-defiend functions */

drop function if exists fun_emp_avg_salary;



/* Example */

delimiter // 
create function fun_emp_info(p_first_name varchar(255), p_last_name varchar(255))
returns decimal(10,2)
deterministic
begin 
declare v_max_from_date date;
declare v_salary decimal(10,2);


select max(t2.from_date)
into v_max_from_date
from employees as t1
inner join salaries as t2
on t1.emp_no = t2.emp_no
where t1.first_name = p_first_name  and t1.last_name = p_last_name;

select t2.salary 
into v_salary
from employees as t1
inner join salaries as t2
on t1.emp_no = t2.emp_no
where t1.first_name = p_first_name and t1.last_name = p_last_name and t2.from_date = v_max_from_date;



return v_salary;

end // 

delimiter ;


select fun_emp_info("Aruna", "Journel");



/* Example */


delimiter // 
create function fun_emp_avg_salary(p_emp_no int)
returns decimal(10,2)
deterministic
begin

declare v_avg_salary decimal(10,2);

select round(avg(t2.salary), 2) as avg_salary
into v_avg_salary
from employees as t1
inner join salaries as t2
on t1.emp_no = t2.emp_no
where t1.emp_no = p_emp_no;

return v_avg_salary;

end // 

delimiter ;


/* Using User define funtion inside select statement */


    
set @v_emp_no = 11400;
SELECT 
    emp_no,
    first_name,
    last_name,
    fun_emp_avg_salary(@v_emp_no) AS avg_salary_fun_result
FROM
    employees
WHERE
    emp_no = @v_emp_no;
