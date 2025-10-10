/** Topic -> Window Function **/


-- Using Row_number() ranking window function  


select emp_no,
       salary, 
       row_number() over(partition by emp_no order by salary desc) as row_num

from salaries; 


--  Using Row_number() ranking window function with empty over clause

select emp_no,
       salary,
       row_number() over() as row_num

from salaries;



-- Multiple row_number ranking window function

select emp_no,
       salary,
       row_number() over(partition by emp_no) as row_num1,
       row_number() over(partition by emp_no order by salary desc) as row_num2

from salaries;



-- Exercise 

select dm.emp_no,
       salary, 
       row_number() over(partition by emp_no) as row_num1,
       row_number() over(partition by emp_no order by salary asc) as row_num2

from dept_manager as dm
inner join salaries as s
on dm.emp_no = s.emp_no 
order by row_num1, emp_no, salary asc;



SELECT dm.emp_no,
       salary,
       ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,
       ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   

FROM dept_manager dm
INNER JOIN salaries s 
ON dm.emp_no = s.emp_no;


-- Partition by clause vs Group by clause 

-- Exercise 1
-- sol 1
select temp.emp_no,
       min(salary) as lowest_salary
from (select emp_no,
             salary, 
             row_number() over w as row_num
       from salaries
       window w as (Partition by emp_no order by salary desc)) as temp

group by emp_no;


-- Exercise 2
-- sol 2

select temp.emp_no,
       min(salary) as lowest_salary
from (select emp_no,
             salary,
             row_number() over(Partition by emp_no order by salary desc) as row_num
      from salaries) as temp

group by emp_no;


-- Exercise 4 
-- sol 4
-- without using window function 
select temp.emp_no,
       min(salary) as lowest_salary
from (select emp_no,
             salary
       from salaries ) as temp

group by emp_no;


-- Exercise 5
-- sol 5 
-- Here we obtain output without using group by clause instead we use 
-- where clause 

select temp.emp_no,
       temp.salary as lowest_salary
from (select emp_no,
             salary,
             row_number() over w as row_num 
       from salaries
       window w as (Partition by emp_no order by salary desc)) as temp

where temp.row_num = 1;


-- Exercise 6
-- sol 6 
-- here we are finding second lowest salary of employee without using group by clause

select temp.emp_no,
       temp.salary as lowest_salary
from (select emp_no,
             salary,
             row_number() over w as row_num 
       from salaries
       window w as (Partition by emp_no order by salary desc)) as temp

where temp.row_num = 2;





-- Retrieve the employee number (emp_no) and the lowest contract 
-- salary value (salary, using the alias min_salary) for all managers. 
-- To obtain the desired output, you need to refer to the dept_manager 
-- and salaries tables.

select temp.emp_no,
       min(salary) as min_salary
from (select emp_no,
             salary,
             row_number() over(Partition by emp_no  order by salary asc) as row_num
      from salaries) as temp 
inner join dept_manager as dept
on dept.emp_no = temp.emp_no
group by temp.emp_no;


-- Topic -> Rank() Ranking window function 
-- Rank() window function syntax 
select column_name1,
       column_name2, .....,
       rank() over(Partition by column_name, ..... order by column_name asc | desc)
from table_name;

-- Alternate syntax for rank() window function
-- here we use window clause 

select column_name1,
       column_name2, .....,
       rank() over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by column_name, ..... order by column_name asc | desc);


-- Example 1 

select emp_no,
       salary,
       rank() over w as rank_num
from salaries
where emp_no = 10005
window w as (Partition by emp_no order by salary desc);

-- Example 2
select emp_no,
       salary,
       rank() over(Partition by emp_no order by salary desc) as rank_num
from salaries;




-- Topic -> Dense_rank() window function 
-- Dense_rank() window function syntax 

SELECT
    column_name1,
    column_name2, .....,
    DENSE_RANK() OVER (PARTITION BY column_name, ..... ORDER BY column_name ASC | DESC)
FROM
    table_name;


-- Alternate syntax for Dense_rank() window function
-- here we use window clause 

select column_name1,
       column_name2, .....,
       dense_rank() over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by column_name, ..... order by column_name asc | desc);



-- Example 1
select emp_no,
       salary,
       dense_rank() over(Partition by emp_no order by salary desc) as rank_num

from salaries 
where emp_no = 10005;


-- Example 2 
select emp_no,
       salary,
       dense_rank() over w as rank_num
from salaries
where emp_no = 10005
window w as (Partition by emp_no order by salary desc);


-- Exercise 1

-- Write a query containing a window function to obtain 
--all salary values that employee number 10560 has ever signed a 
--contract for.
-- Order and display the obtained salary values from highest to lowest.

-- sol 

select emp_no,
       salary,
       row_number() over w as row_num
from salaries 
where emp_no = 10560
window w as (Partition by emp_no order by salary desc);



--  Exercise 2

--Write a query that upon execution, displays the number of 
--salary contracts that each manager has ever signed while working 
--in the company.

-- sol

select dept.emp_no, 
       count(salary) as no_of_salary_contracts
from dept_manager as dept
inner join salaries as s
on dept.emp_no = s.emp_no
group by emp_no
order by emp_no;



-- Exercise 4

-- Write a query that upon execution retrieves a result set 
--containing all salary values that employee 10560 has ever signed a 
--contract for. Use a window function to rank all salary values from 
--highest to lowest in a way that equal salary values bear the same 
--rank and that gaps in the obtained ranks for subsequent rows are allowed

-- sol

select emp_no,
       salary,
       rank() over w as rank_num
from salaries 
where emp_no  = 10560
window w as (Partition by emp_no order by salary desc);


-- Exercise 5

--Write a query that upon execution retrieves a result set containing 
--all salary values that employee 10560 has ever signed a contract for. 
--Use a window function to rank all salary values from highest to 
--lowest in a way that equal salary values bear the same rank and that
--gaps in the obtained ranks for subsequent rows are not allowed.

-- sol

select emp_no,
       salary,
       dense_rank() over w as rank_num
from salaries 
where emp_no  = 10560
window w as (Partition by emp_no order by salary desc);



-- More Complex examples 

-- Example 1 
-- Here we use window functions and joins together for complex Query

select dept.dept_no,
       dept.dept_name,
       m.emp_no,
       rank() over w as department_salary_ranking,
       s.salary,
       s.from_date as salary_from_date,
       s.to_date as salary_to_date,
       m.from_date as dept_manager_from_date,
       m.to_date as dept_manager_to_date      
from dept_manager as m
inner join salaries as s
on m.emp_no = s.emp_no and s.from_date between m.from_date and m.to_date
       and s.to_date between m.from_date and m.to_date
inner join departments as dept
on dept.dept_no = m.dept_no
window w as (Partition by m.dept_no order by s.salary desc);



-- Exercise 1
-- sol

select e.emp_no,
       s.salary,
       rank() over w as rank_num
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where e.emp_no between 10500 and 10600
window w as (Partition by e.emp_no order by s.salary desc);


-- Exercise 2
-- sol

select e.emp_no,
       dense_rank() over w as rank_num,
       s.salary,
       e.hire_date,
       s.from_date,
       (year(s.from_Date) - year(e.hire_date)) as year_from_start
from employees as e
inner join salaries as s
on e.emp_no  = s.emp_no
       and year(s.form_date) - year(e.hire_date) >= 5
where e.emp_no between 10500 and 10600
window w as (Partition by e.emp_no order by s.salary desc);




-- Exercise 4
-- Allowing gaps in the obtained ranks for subsequent rows, rank the 
--contract salary values from highest to lowest for employees 10001, 
--10002, 10003, 10004, 10005, and 10006.
--Every row in the desired output should contain an employee number 
--(emp_no) obtained from the employees table, and a salary value 
--obtained from the salaries table. Additionally, include the salary 
--ranking values between the two columns in a field named 
--employee_salary_ranking.

--sol
select e.emp_no,
       rank() over w as employee_salary_ranking,
       s.salary 
       
from employees as e
inner join salaries as s 
on e.emp_no = s.emp_no
where e.emp_no in(10001,10002,10003,10004,10005,10006)
window w as (Partition by e.emp_no order by s.salary desc);


-- Exercise 5
--Without allowing gaps in the obtained ranks for subsequent rows, 
--rank the contract salary values from highest to lowest for 
--employees 10001, 10002, and 10003.
--Every row in the desired output should contain the relevant 
--employee number (emp_no) and the hire date (hire_date) from the 
--employees table, as well as the relevant salary value and the 
--start date (from_date) from the salaries table. Additionally, 
--include the salary ranking values in a field named 
--employee_salary_ranking.
--Retrieve only data for contracts that have started prior to 2000. 
--Sort your data by the  emp_no in ascending order, referring to the 
--employees table.

select e.emp_no,
       dense_rank() over w as employee_salary_ranking,
       s.salary,
       e.hire_date,
       s.from_date
    
from employees as e 
inner join salaries as s 
on e.emp_no = s.emp_no  and s.from_date < '2000-01-01'

where e.emp_no in(10001,10002,10003)
window w as (Partition by e.emp_no order by s.salary desc)
order by e.emp_no asc;







-- Topic -> Value window functions 

-- lag() value window function syntax 

select col_name1,
       col_name2, .....,
       lag(specific_col_name, no_of_rows_look_back, default_value) over(Partition by col_name, ..... order by col_name asc | desc)
from table_name;



-- alternate syntax for lag() value window function using window clause
-- here we use window clause
select col_name1,
       col_name2, .....,
       lag(specific_col_name, no_of_rows_look_back, default_value) over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by col_name, ..... order by col_name asc | desc);



-- Example 1
select emp_no, 
       salary,
       lag(salary) over(Partition by emp_no order by salary asc) as previous_salary
from salaries 
where emp_no = 10001;



-- Example 2 
-- Here we use window clause 
select emp_no,
       salary,
       lag(salary) over w as previous_salary

from salaries 
where emp_no = 10001
window w as (Partition by emp_no order by salary);


-- Example 4
