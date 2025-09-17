use employees;

/* Using Stored Procedures */


/* Below is Stored Procedure without Parameter */
/* Creating Stored Procedure */
delimiter //

create procedure p_select_employees()
begin
	select * from employees
    limit 1000;
    
end //

delimiter ;


/* Executing Stored Procedure */
call employees.p_select_employees();

/* Deleting stored procedure */
drop procedure if exists p_select_employees;



/* Example */

delimiter // 
create procedure p_average_salary_of_employees()
begin 

select round(avg(salary), 2) as emp_average_salary 
from salaries;

end // 

delimiter ;

call employees.p_average_salary_of_employees();


/* Below is the Stored Procedure with Parameter */

/* Stored Procedure by using IN Parameter */
/* Creating a Stored Procedure with In Parameter */

delimiter //
Create Procedure p_emp_salary(in p_emp_no integer)
begin 
	select t1.first_name, t1.last_name, t2.salary, t2.from_date, t2.to_date
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no 
    where t1.emp_no = p_emp_no;

end //

delimiter ;


call employees.p_emp_salary(11400);


delimiter // 

create procedure p_emp_avg_salary(in p_emp_no integer)
begin 
	select t1.first_name, t1.last_name, round(avg(t2.salary)), t2.from_date, t2.to_date
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no
    where t1.emp_no = p_emp_no
    group by t1.first_name, t1.last_name, t2.from_date, t2.to_date;

end // 

delimiter ;

call employees.p_emp_avg_salary(11400);


delimiter // 

create procedure pro_emp_avg_salary(in p_emp_no integer)
begin 
	select t1.first_name, t1.last_name, round(avg(t2.salary), 2)
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no 
    where t1.emp_no = p_emp_no;

end // 

delimiter ;

call employees.pro_emp_avg_salary(11400);



delimiter // 

create procedure procedure_emp_avg_salary(in p_emp_no integer)
begin 
	select t1.first_name, t1.last_name, round(avg(t2.salary), 2)
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no 
    where t1.emp_no = p_emp_no
    group by  t1.first_name, t1.last_name;

end // 

delimiter ;

call employees.procedure_emp_avg_salary(11400);


delimiter // 

create procedure storedprocedure_emp_avg_salary(in p_emp_no int)
begin 
	select t1.first_name, t1.last_name, round(avg(t2.salary), 2)
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no 
    where t1.emp_no = p_emp_no
    group by  t1.first_name, t1.last_name;

end // 

delimiter ;

call employees.storedprocedure_emp_avg_salary(11400);


delimiter //

create procedure emp_avg_salary_stored_procedure(in p_emp_no int)
begin 
	select t1.first_name, t1.last_name, round(avg(t2.salary), 2) as avg_salary, t2.from_date
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no
    where t1.emp_no = p_emp_no
    group by t1.first_name, t1.last_name, t2.from_date;
    
end //

delimiter ;

call employees.emp_avg_salary_stored_procedure(11400);


/* Below is the Stored Procedure with Parameter */

/* Stored Procedure by using OUT Parameter */
/* Creating a Stored Procedure with In Parameter */

delimiter //
create procedure p_out_emp_avg_salary(in p_emp_no int, out p_avg_salary decimal(10,2))
begin 
	select round(avg(t2.salary), 2) 
    into p_avg_salary
    from employees as t1
    inner join salaries as t2
    on t1.emp_no = t2.emp_no 
    where t1.emp_no  = p_emp_no;

end // 

delimiter ;

call p_out_emp_avg_salary(11400, @p_avg_salary);
select @p_avg_salary;


/* Example */

delimiter //

create procedure p_emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no int)
begin 
	select t1.emp_no
    into  p_emp_no
    from employees as t1
    where t1.first_name = p_first_name and t1.last_name = p_last_name;


end //

delimiter ;

call p_emp_info("Georgi", "Facello", @p_emp_no);
select @p_emp_no;


delimiter //

create procedure p_emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no int)
begin 
	select t1.emp_no
    into  p_emp_no
    from employees as t1
    where t1.first_name = p_first_name and t1.last_name = p_last_name;


end //

delimiter ;

set @p_emp_no = 0;
call p_emp_info("Aruna", "Journel", @p_emp_no);
select @p_emp_no;


/* Solution */

DELIMITER //

CREATE PROCEDURE emp_info (

    IN p_first_name VARCHAR(200),

    IN p_last_name VARCHAR(200)

)

BEGIN

    SELECT emp_no

    FROM employees

    WHERE first_name = p_first_name

      AND last_name = p_last_name;

END //

DELIMITER ;

/* As much as I understand We use an OUT parameter 
only when we expect a single value as output. 
But in this case, an employee’s first and last name 
may match with multiple employee numbers. 
Since an OUT parameter cannot return multiple values, 
we should use IN parameters for the first and last name, 
and get the employee numbers with a SELECT query 
instead. */


/* INOUT Parameter in stored procedure */

delimiter //

create procedure p_inout_procedure_example(inout p_emp_no int)
begin 
	select round(avg(salary),2) as avg_salary
    from salaries as t1
    where t1.emp_no = p_emp_no;
    
    set p_emp_no = p_emp_no +10;

end //

delimiter ;

set @p_emp_no = 11400;
call p_inout_procedure_example(@p_emp_no);
select @p_emp_no;



/* Example */ 


delimiter //

create procedure p_emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no int)
begin 
	select t1.emp_no
    into  p_emp_no
    from employees as t1
    where t1.first_name = p_first_name and t1.last_name = p_last_name;


end //

delimiter ;

set @v_emp_no = 0; /* This is session Variable */
call p_emp_info('Aruna', 'Journel', @v_emp_no);
select @v_emp_no;